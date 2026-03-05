Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45AEF513E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6k8+DCPmvVS0VzBd1DlzrWskZqznfWtGoXnFeE7JRQ=; b=K/x9Ft7omBUi1PCHCij7L1IjhW
	b4C1L2hgCeA5xuwJi5tJWOs6kV4anc/4SdB9C8UCuxOr137wXGuMczOl6em16/eHNUA+cJZAT6yDS
	pnFv7bdh5e00czQFY20SItcIaQgfb5oZas1ekoUzU1kDIoPUtwui00Hhr3tkzInmqWsbd/9hUSGwq
	5u2N7XOpVb/rIEdCnZ56HIz67RzHdVJqAWIBZvu5MHt3GGCoL9kOrVTnLcKMN0o90mloz77eKmcGa
	omD0HGXubrNkai0UXkJX+Q1rN43d2QfMScYQM45yCNNo2ZGGdeqSBnIiyzld4YLx/jnXecIM9a1lZ
	gqkGfITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWX-00000002b78-17le;
	Thu, 05 Mar 2026 21:46:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWQ-00000002b29-1JYa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmXjX3136467
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w6k8+DCPmvVS0VzBd1DlzrWskZqznfWtGoXnFeE7JRQ=; b=nNchSM+9zrXqc//l
	I9qvK5eJ8PrIe7ZtPyZPSreumwlr6NNn12k4VvWKWATdQJ4gO08lvE92ccQotyKu
	/4GTyvQeyB6iFe2Kwb5j+IkAo93aq/k5Puobc1IH9/BIPzqkh0sT9EpwSc26y6It
	3cl+xfxtYfsfXnFo/SdQNO5bsRVzEyGXMElogOpQo4IAjqmKqrx4IY/ZjUrqC2K2
	xnpBmMq48g6kdDpE1HfWyqI6JH9/w94Qyd3cRgjJs5qfQL5+UwlOY2qIZQ4kh26O
	V33uBXs1pbuT5oDwZuk91ZQ2XXwxR/cvm0GcZNXP9bpB06v/cLCwKZBYsGsw5mut
	cDvlsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk3hvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb390a0c4eso5317362085a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747177; x=1773351977; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6k8+DCPmvVS0VzBd1DlzrWskZqznfWtGoXnFeE7JRQ=;
        b=AJCJVp2qLQ1ExmmYh76ZUUg4YHDZQa2E73KUlttIV3OVwRXzeANzeseCvJBFBRjZQV
         eTZ93QKZLKvWOG5y5quGXOJCr/mRWgsKuKfzMfAfrOiQbUN1JnWjL0SUZECXTCnMZznn
         +zyzLIExkAreKSG5ils4SoHGFul5luISY+jT7KYo/kryCDrbvNlti66yHcPKA0indD/U
         oSbVtw6hQUyj7Y7QMO4gBf4nhxc3iS1cTlz7/yrsPjiSpo0qMnEo3KBinv7T+3Z6N8wN
         8UOCYJAduc4UpfIt2LNXNLXn5fjerScoB1MLxociqqCM2yyuJUGWFtQIP92OfJF1S4W9
         auKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747177; x=1773351977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w6k8+DCPmvVS0VzBd1DlzrWskZqznfWtGoXnFeE7JRQ=;
        b=lzcT4bqNJ9HvRD+hwsRbD0k8SBlA9lImJEnmmWmqiYmKBJ+DmRG9pfpo6zhqxw6K/j
         AISzpN6+PJMQ6S0diQcG11kHlcDZJchDfxaBfWxwHqVHifS40BEjr6VFc6IKNYCCHcHb
         oG5071i9fI/jcbaAL9+/tf8ePFGe/OUZTJGQpaK5Eom/lJWPqCCpdufzaUNsv7Ffogak
         p1ZaSXN/RkBPlSCqYKKPbQy6GScjaj/IKf5Lf1m/Cp3hWKBz9yMqCTGMruVOnBeeWSyW
         8Z7ma3cz0Pfn6iMbBcuVRlosgPPnAe9f255Cc8sF0ltL9WtFbHOUyqXTqrkgQ3GiRx8U
         gJ6w==
X-Forwarded-Encrypted: i=1; AJvYcCVPRKSe/tx1qftaC9s/P8SSvE7A1GAsA9fFC+rCd7x6nccVnH1xtSXxtt8sSzj3P4W882727pCB8XZIsRXcYFbs@lists.infradead.org
X-Gm-Message-State: AOJu0YxlrHze2usQoRrPDUGwSVHpnMQHqOH9aZYMfrKZ73w3U3MI9gjl
	aBXBsqEJt1Q70FprFp6ngH4mRdTKNNrMz/P9WXMAxgFU2wn2JOC/juiMHfa79k9iLPe/xZrVauq
	U9SDaYkAx74JvfPEzION33gjbbmvYXj2dqmjVQv+H+wcshqfjKnVcob3Qmp8R8jE5MGlYMGjELp
	eSlQ==
X-Gm-Gg: ATEYQzwrWKwURcTIIZatY19YM/WnMF4NhkQ/UjNPhWV0TQtzlTz71plcJFURNojcyMr
	OryEa9iBNpBbPgDJzDE6FdFrQ3YaC53O1sKfDhjTnji1Ip04+JEAqh6Xy3XsD2ItZIANDQEO5rb
	eE1aj3coh+W1xa1X+HmUzAkY8Nfe4odKlQRnrGHFyC0+E/8gRf0wjkAU8BECWH/thsdWzk45jJb
	CCA7f9t8xPetMQgTVwRBv3Yn5awtYaXRktW1jOyb+L5GrT8SjRf13Hp6ZQLmipz9WKtBfC8BhCg
	q+Ll09VZ6c1zx4Lvdool50AltyrpTa2FP06hXV+NEnWh4sY/rZ8CWv5OpNgShmIAzAg14kcvaT0
	pVIC3vzL0//GS1zNnYFoaZ6NveZAjt7k7oP3vz5/f09vn
X-Received: by 2002:a05:620a:4688:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8cd6d4eb0b2mr852585a.65.1772747176616;
        Thu, 05 Mar 2026 13:46:16 -0800 (PST)
X-Received: by 2002:a05:620a:4688:b0:8ca:d5cb:6839 with SMTP id af79cd13be357-8cd6d4eb0b2mr849485a.65.1772747176172;
        Thu, 05 Mar 2026 13:46:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:40 +0100
Subject: [PATCH v2 01/10] workqueue: devres: Add device-managed allocate
 workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-1-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5216;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iyX0qmfaG81Rj41H7X2QPhit2JQzbYOp/KdP09pUD9I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmZqlqPt/O4g+aJVCPVwYCdNiMJivVoKJNv+
 nfTlOEuLkCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mQAKCRDBN2bmhouD
 12BuEACE9UGRO8qQNKFX1PzUCZ/Fq7vepWE4JCBJk0nfeFyl0KogKdTFRFTSJsUiy3dJS0tzFJW
 7WNmnOlxd7SbvQyXqVrx+RdQC5wbgOlI+Sol+ecKeyExdYtDYLCU6Owm28wDGtgEkTE9mJfiM9o
 mUyXPEsHEcoqBmimZTT+FwLmUGknfHEglow4Am76QGjLX7IsZ3LhKVzM7Rj5iFP939x9p3Fk11w
 b+DQjHaOHIrzD9Wa5iyoaD5SyIhn2ixaHFTdqx+km8ivIAkp2A0vJTGfQAcmeqXOmlcJSzg3fSv
 yBMQ5Xz30FMatrz/Zrj9+z3clMPhYokj8lrGHYK0+YKKKrfu6VJaN9XKe9p1JJpWLxQ7M1cWPyt
 rMMSWtOdvNnAqcUcfCchdEQeCIz4WkpMrfcQv/qQcaLUAyED27AZRfrVc+YMK0f3FZz8q4bzJMk
 hqqq995Ee3ptNIv/y1mnunKPueHyuf8L7BiWhF6YA7c4fth+txTnuvKup5geymqojDZqRmq2WK7
 H7jl8/lUbJeUYr4tXJpgcnKQOwns3MJFViLP5yUd38U6Wq0fz/CcCbhh5hF4ga3EPuYgPZjILVl
 fkIsr48Wel9gwyvGlG14kKHUQ4hQe95Gr7l3enhfn4+YMk73kivz3PW3tYXfn3xR7L4J5bS1n+d
 uBhhIvG9s2KLDyA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Khg98Wubpx-xPSMjKSA_0ZRqFBl8EUaJ
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9f9a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7xz5_SZBKAcHatMQKAYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Khg98Wubpx-xPSMjKSA_0ZRqFBl8EUaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX1+IEIUrvfq2S
 BTEYe5xT4LRSpI4P6DN/DPgJWpWfHS1gDf+oHUks904Sq+LXFoEvjAkJBNJUngsyzU4J9rxcyop
 4Y+9OO23w4a1NsUOC5nPbi+5qUi7KzlSlfp88IdBpnnjOB+Q613FFol1hDH6foRGZZ5YWjGNlml
 YA3fkZu7f5/OFoKLY9gNUWiUxFzxk1JJRL31adHfdJ//TymALQOW03Ml2o2oVQag6cUgWLiCBDU
 JqNK8IYo0j8yKZPmjR8MbIwhKdIOgcKqFtX9KCcCC+hRJ2sVi1+EJrcqT1wONpfDIYGbLlPqFYy
 QG6c+7eopUWMf3WPou8eCiDXk1EmcnBGunUMJFRoog12cVy4aliMUbGQvEV+lXyuPKKyNjO5QZQ
 YXwIhkwYQzWc4VJLlzYE2LMlMpOcsDx6MZlYuyjWv+K2J+Ff2xkyyG7F3Ek3+xYBnUA3+ukqMYH
 OCkx9CF10gwA2yPH2/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134620_434195_F490CDFD 
X-CRM114-Status: GOOD (  22.94  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add a Resource-managed version of alloc_workqueue() to fix common
problem of drivers mixing devm() calls with destroy_workqueue.  Such
naive and discouraged driver approach leads to difficult to debug bugs
when the driver:

1. Allocates workqueue in standard way and destroys it in driver
   remove() callback,
2. Sets work struct with devm_work_autocancel(),
3. Registers interrupt handler with devm_request_threaded_irq().

Which leads to following unbind/removal path:

1. destroy_workqueue() via driver remove(),
   Any interrupt coming now would still execute the interrupt handler,
   which queues work on destroyed workqueue.
2. devm_irq_release(),
3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.

devm_alloc_workqueue() has two benefits:
1. Solves above problem of mix-and-match devres and non-devres code in
   driver,
2. Simplify any sane drivers which were correctly using
   alloc_workqueue() + devm_add_action_or_reset().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

All further patches depend on this one.

Changes in v2:
1. Drop devm_create_workqueue(), devm_create_freezable_workqueue() and
   devm_create_singlethread_workqueue()

2. Simplify with devm_add_action_or_reset()

3. Do not export devm_destroy_workqueue()

4. I did not move the declarations to devm-helpers.h because consensus
   was not reached and I think it would not be accurate place. The main
   alloc_workqueue() is here, so should be the devm- interface.
---
 Documentation/driver-api/driver-model/devres.rst |  4 ++++
 include/linux/workqueue.h                        | 22 +++++++++++++++++++
 kernel/workqueue.c                               | 28 ++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 7d2b897d66fa..017fb155a5bc 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -464,3 +464,7 @@ SPI
 
 WATCHDOG
   devm_watchdog_register_device()
+
+WORKQUEUE
+  devm_alloc_workqueue()
+  devm_alloc_ordered_workqueue()
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index fc5744402a66..66a94c171b0b 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -512,6 +512,26 @@ __printf(1, 4) struct workqueue_struct *
 alloc_workqueue_noprof(const char *fmt, unsigned int flags, int max_active, ...);
 #define alloc_workqueue(...)	alloc_hooks(alloc_workqueue_noprof(__VA_ARGS__))
 
+/**
+ * devm_alloc_workqueue - Resource-managed allocate a workqueue
+ * @dev: Device to allocate workqueue for
+ * @fmt: printf format for the name of the workqueue
+ * @flags: WQ_* flags
+ * @max_active: max in-flight work items, 0 for default
+ * @...: args for @fmt
+ *
+ * Resource managed workqueue, see alloc_workqueue() for details.
+ *
+ * The workqueue will be automatically destroyed on driver detach.  Typically
+ * this should be used in drivers already relying on devm interafaces.
+ *
+ * RETURNS:
+ * Pointer to the allocated workqueue on success, %NULL on failure.
+ */
+__printf(2, 5) struct workqueue_struct *
+devm_alloc_workqueue(struct device *dev, const char *fmt, unsigned int flags,
+		     int max_active, ...);
+
 #ifdef CONFIG_LOCKDEP
 /**
  * alloc_workqueue_lockdep_map - allocate a workqueue with user-defined lockdep_map
@@ -568,6 +588,8 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
  */
 #define alloc_ordered_workqueue(fmt, flags, args...)			\
 	alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
+#define devm_alloc_ordered_workqueue(dev, fmt, flags, args...)		\
+	devm_alloc_workqueue(dev, fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
 
 #define create_workqueue(name)						\
 	alloc_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM | WQ_PERCPU, 1, (name))
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index a1bfabeaef41..5cc5e6a400c9 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -41,6 +41,7 @@
 #include <linux/mempolicy.h>
 #include <linux/freezer.h>
 #include <linux/debug_locks.h>
+#include <linux/device/devres.h>
 #include <linux/lockdep.h>
 #include <linux/idr.h>
 #include <linux/jhash.h>
@@ -5909,6 +5910,33 @@ struct workqueue_struct *alloc_workqueue_noprof(const char *fmt,
 }
 EXPORT_SYMBOL_GPL(alloc_workqueue_noprof);
 
+static void devm_workqueue_release(void *res)
+{
+	destroy_workqueue(res);
+}
+
+__printf(2, 5) struct workqueue_struct *
+devm_alloc_workqueue(struct device *dev, const char *fmt, unsigned int flags,
+		     int max_active, ...)
+{
+	struct workqueue_struct *wq;
+	va_list args;
+	int ret;
+
+	va_start(args, max_active);
+	wq = alloc_workqueue(fmt, flags, max_active, args);
+	va_end(args);
+	if (!wq)
+		return NULL;
+
+	ret = devm_add_action_or_reset(dev, devm_workqueue_release, wq);
+	if (ret)
+		return NULL;
+
+	return wq;
+}
+EXPORT_SYMBOL_GPL(devm_alloc_workqueue);
+
 #ifdef CONFIG_LOCKDEP
 __printf(1, 5)
 struct workqueue_struct *

-- 
2.51.0


