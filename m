Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC51E98DEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 07:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2fzDSwRwHz+xfG1K3EDcnND32iTxMHvxjY9VgqhwwU=; b=BAHn7Lv9AVJesGgguxa3VSPvt/
	zC2e7QABbvLTUMMTVbs58tSGA6ov696O1XP/+st8i//FBv+UTy1F0E+wrZvl8Lujz+/u+02wZL3Qs
	M0ZQEHC66iXD+ADGYZ7ewIID3yps//fcFtd0wAirBTrTTlLkPiW3VIWW/RQ0veXf2vuVa96SBD/5g
	In0EA4SCKGblrjm1/HO+263UZZ+Gy/sTlV1LwY6ApHKNwOefQfvtAr9Iut308E43OtxSrRw0xmmk8
	VrCWI5eoAdugievu+acQAzAjBMflx3p1AjIfgnm5ZSdiSjeEzL4bLe+ENSVn1ggKx9gS7eQ8cpKoE
	ObUqvvDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMB-0000000HMcM-0Rhb;
	Mon, 23 Feb 2026 07:27:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQM8-0000000HMaW-35uR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 07:27:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNHgbE1778082
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2fzDSwRwHz+xfG1K3EDcnND32iTxMHvxjY9VgqhwwU=; b=IPItmvQeYRgcZ6St
	cSFsWNSei9nDwbD0zwAoGiJ/+EN90CsBogIHT5No6AqFSdZ01cXKrLAYGFyfeEkW
	Msujc0HUxPmIL6pesdwMUAL7DFnW7qxTl1iYaViJage1OxE4uzJ6Xm2H5SQ7TCwJ
	LLzTFI4ji+ajN/sQZB1EHSaTVi9uduE+aN324d/J+IhQlHlAVVjqcIYuCr3yL7AU
	kGivsEcIaDhlGm2P47o7o0zhZv2A66P9MMXdeNtGlz3asMpf/4ZdA5GMeOGetK4U
	KfTBuQgwmJcC4PmF2S/pUjbqp5Mgyl8aRsn6EMOdoxmckoZDZ9nUY8An2KqNSoIu
	Q7aQlg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9usdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:27:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50336ebabe0so796230491cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 23:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831667; x=1772436467; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2fzDSwRwHz+xfG1K3EDcnND32iTxMHvxjY9VgqhwwU=;
        b=j653q5WqIpVhIsL+Z4nPvH+9zW1MGcTonMHIe5IgBpB59L/5trtBG1OnT/zYokrrgd
         jZ536sFQjzKqSdq3afBQa32SZwgHZ+W4QKJV4vQZCFKYnbpXz2spom6xJedNcyqwZZQ1
         XAk1SGid3fa9OLBXpV2mEnbCbx0ps8/fq3bMGrX9URt+XbovGbGolE+ocboxBBo9DNGX
         Vd6tDN+oUFpi1kGWToTxCnWaa+V1Vs+OLwI7Ff/HmT9Y9ZrSR1k0b+IFyIhnSVdcu73H
         8L6rhQsyvox3EUdJY1frOb9dxGO94f3By+qc/z4LVd6bA9LVw0MlmKeIM1cFzuWhvCtu
         QCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831667; x=1772436467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2fzDSwRwHz+xfG1K3EDcnND32iTxMHvxjY9VgqhwwU=;
        b=PqJCU/GziZ7QUbYVf6utSwzrQmVAm+9p0dwPa8B5q77j1W38sz00cMi1VpCga53wVL
         9Gd18hqBUYcdgMThoFiMTKKFbyAuW77cdBtSMUmFSAjDG4hTugxfAw7em907iJtOuUOJ
         r/xfSqRVftxPHFWLmh54DdfKbyuQBKBo1lrS/tDZg8AkpRQZxvrR9JPjKPcLim/jqTnV
         I7+eHFVnE1jyCUGgUg0EaQoS0OH2Ms73RPhM583yJ640OFVZ6vgvSplB0MRPqoQLNkb5
         ahJy+H/P1p4PnBMx5vSdB/QD4OTj9+jq+GO09UZNigDOHBiPecj+HSHa8ygy74vOqQLZ
         iJmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxh77efcHxF2F5xxs0U6ugVK6xLX3NNNDNOTxpVtQBuMkaECd/OFBdfmSV1mGXe7SSL5vnAshvXQ/mNFoJIKiW@lists.infradead.org
X-Gm-Message-State: AOJu0YzXa4c2C5C0M2Ngudg6kxkd4+uo/yn6AKZlFVCtXrnpzuNAsIq9
	NBisagTFFTeaEhgQ7nOcsh1M9Jj9vZLDwRZQy2Kxl9GYkaW+BioKetySTx6zIdH4YHi4hqNFidE
	hU/8ePGEaYeNgMZYkm/Tg5NKSRw0rSScM3SmmgeMCf9nOThut9PZOUctOiOAd3u23lv1W8Ilczo
	qQvg==
X-Gm-Gg: AZuq6aJqnd1tfLi4ypLR7J1ILBiVArQeb3M1Kcbl6YZ5KkBY3Nlx22fh+OD7hIJsXFi
	BVEqdwg9ZCNQcKUymfLexlxpkYz4PEJFkKsxJcxyraYribFNPJ335BCaiJ+jjibr2Y+nJt5fVTX
	90rpFIRVAyx++hX311TFkSr4TZeFAYj2cWrWbIAyf7aK3F9egxD7kndVg4Qbfa1hRb5ipqUSAgD
	aqIdQB/57+JvZemXYi903qLbfEcbTFwB3rEDnzagAD8YUqUvz0D1BF6YpFw2ROjMht4FQelLEb9
	xaz0P3AVpnKnsavluQzOk8s8g56pukkQU2xNR4LevyvUcbvoHsd4oQRZVRSEy9spYgGO4ckYa8z
	HZ1FnA7iKwRTDmc6E69HC3HH1Dcq3Dc5kAgSp4AjBEA6ruA==
X-Received: by 2002:a05:620a:46a8:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cb7be3b839mr1530636885a.6.1771831667090;
        Sun, 22 Feb 2026 23:27:47 -0800 (PST)
X-Received: by 2002:a05:620a:46a8:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cb7be3b839mr1530635385a.6.1771831666656;
        Sun, 22 Feb 2026 23:27:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:29 +0100
Subject: [PATCH 1/9] workqueue: devres: Add device-managed allocate
 workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
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
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6407;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=S/iCJqcIsf6jSjmWoog3Z0RGxa/CywDCilklRJJyfQ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFm0Tv6ZFgGsT5DcytxW+0gXkvsl5c953wDR
 5lE547LmoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBZgAKCRDBN2bmhouD
 1y+VD/9A1ukGl2lbgMZJ7jWzPKBdDezAk1X7RP6OkAEE5aR04FHlqMvjH01rHA5671wAZ/XlLXH
 u0mxgS7a+WxdX+brjZ/EJH3CDYDY1PnBzmm51D9Jh4q2HdSXmDRte5LGtqpE30n8WtWl7eQScl0
 6yByEsaNIgXP4Jdo9Guy25J0mBhZDoVIOWNvRa/bzLXSc++UITkn3XMiGZVh9FejwX+49SFX2Wp
 PcCjEAHZY/dHyK5FjPp/eHzvfgoJDPZ2HkN+C6afRgC/QjCwzPs3CWJiGPZ7fk5HRy3w2TRmQBW
 sBWYAUH+6iQjfgbXKOXx3NLx4aVNmkkQADgy0YbW4tOv0w0I2/lAJZQ32G6C8CEiF14ftblmZ2y
 eCYlYOFnGeCe3wsA2kW2RMlXpRtCM7uhKoZXn9PDKlhFBb/n75UwN49CS19TdoUTzEUgGSCs7yl
 5f0z0lerQLkMBn/9DW446KRVIRSm6qGw2rl1MSK/8LVr2A6xub9WyJX2QIFOqmF1Q2Y6b7z9Z4l
 3ByK6rZe559yCZ69+nPTd0sARnancLikTI6X+im7xlOli+GWtukN1N/X8bVj01O7AVFKFCz7Lbh
 LiP1iXGGm++dc94x5/xy1nPudlf+JCH6nz60rVbtJstGSncuw2Yszo+sj1P/cgsDbZQccWR9u8h
 zIR0pmJMqRGoIdw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX7a0SwTjD2u2Z
 4pY259hAE424DE1OwGjFhuli0n8/k7sfxywlOfLQ5j4Y63klv7yEEiibPyeoJ7wFn4dm80my/RS
 TnqbTgSiC6wyTfsgHi7/MF/+mhk3zWFUs0T+VMdlp3fMoaRCV+XX2ryOx30m+9KYogypsyT/+3a
 QFarqqpnXAdKkamBaj17c01ATfc7/6xGBvopOioDDcrWZnK315syGqA0Dw2W81dm5UQci+dGkqK
 9ztoX+YsS4OPEJ+VIGz41NGQm3FpPmNbNEFO/dMQ1yhJE0xvnlZSPC5mTm8hVB9SnY8A3gqj80G
 nTBiXKlY1aQuChr57D3A+l+z08CEUPWzhurcdosLSOOcUXzwF9dtE4RImeBOCX5AQd9x2zrzaN5
 lyyzIz3NMhhUNyW3xXGN7ovF+gmdskvXlpttCA+E+VStRy91vaSr93QjRC0qsK6wqkm8sf20eSV
 ocB7bm65rUbRBXJQmEQ==
X-Proofpoint-GUID: 3LFTZ8DQWfrI_GyOKUoH7aT56pWSNNHx
X-Proofpoint-ORIG-GUID: 3LFTZ8DQWfrI_GyOKUoH7aT56pWSNNHx
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c0173 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Z6KGZMJaPoknz67Z6hIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232748_903402_ADABEB96 
X-CRM114-Status: GOOD (  22.35  )
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
---
 Documentation/driver-api/driver-model/devres.rst |  7 ++++++
 include/linux/workqueue.h                        | 32 ++++++++++++++++++++++++
 kernel/workqueue.c                               | 32 ++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 7d2b897d66fa..dfc1e85ebfaa 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -464,3 +464,10 @@ SPI
 
 WATCHDOG
   devm_watchdog_register_device()
+
+WORKQUEUE
+  devm_alloc_workqueue()
+  devm_alloc_ordered_workqueue()
+  devm_create_workqueue()
+  devm_create_freezable_workqueue()
+  devm_create_singlethread_workqueue()
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index a4749f56398f..583b0c4bd55c 100644
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
@@ -568,19 +588,31 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
  */
 #define alloc_ordered_workqueue(fmt, flags, args...)			\
 	alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
+#define devm_alloc_ordered_workqueue(dev, fmt, flags, args...)		\
+	devm_alloc_workqueue(dev, fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
 
 #define create_workqueue(name)						\
 	alloc_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM | WQ_PERCPU, 1, (name))
+#define devm_create_workqueue(dev, name)				\
+	devm_alloc_workqueue(dev, "%s", __WQ_LEGACY | WQ_MEM_RECLAIM | WQ_PERCPU, 1, (name))
+
 #define create_freezable_workqueue(name)				\
 	alloc_workqueue("%s", __WQ_LEGACY | WQ_FREEZABLE | WQ_UNBOUND |	\
 			WQ_MEM_RECLAIM, 1, (name))
+#define devm_create_freezable_workqueue(dev, name)			\
+	devm_alloc_workqueue(dev, "%s", __WQ_LEGACY | WQ_FREEZABLE | WQ_UNBOUND |	\
+			     WQ_MEM_RECLAIM, 1, (name))
+
 #define create_singlethread_workqueue(name)				\
 	alloc_ordered_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM, name)
+#define devm_create_singlethread_workqueue(dev, name)			\
+	devm_alloc_ordered_workqueue(dev, "%s", __WQ_LEGACY | WQ_MEM_RECLAIM, name)
 
 #define from_work(var, callback_work, work_fieldname)	\
 	container_of(callback_work, typeof(*var), work_fieldname)
 
 extern void destroy_workqueue(struct workqueue_struct *wq);
+extern void devm_destroy_workqueue(struct device *dev, void *res);
 
 struct workqueue_attrs *alloc_workqueue_attrs_noprof(void);
 #define alloc_workqueue_attrs(...)	alloc_hooks(alloc_workqueue_attrs_noprof(__VA_ARGS__))
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 72a8b64188b3..fd840c46ba55 100644
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
@@ -5895,6 +5896,31 @@ struct workqueue_struct *alloc_workqueue_noprof(const char *fmt,
 }
 EXPORT_SYMBOL_GPL(alloc_workqueue_noprof);
 
+__printf(2, 5) struct workqueue_struct *
+devm_alloc_workqueue(struct device *dev, const char *fmt, unsigned int flags,
+		     int max_active, ...)
+{
+	struct workqueue_struct **ptr, *wq;
+	va_list args;
+
+	ptr = devres_alloc(devm_destroy_workqueue, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return NULL;
+
+	va_start(args, max_active);
+	wq = alloc_workqueue(fmt, flags, max_active, args);
+	va_end(args);
+	if (wq) {
+		*ptr = wq;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return wq;
+}
+EXPORT_SYMBOL_GPL(devm_alloc_workqueue);
+
 #ifdef CONFIG_LOCKDEP
 __printf(1, 5)
 struct workqueue_struct *
@@ -6025,6 +6051,12 @@ void destroy_workqueue(struct workqueue_struct *wq)
 }
 EXPORT_SYMBOL_GPL(destroy_workqueue);
 
+void devm_destroy_workqueue(struct device *dev, void *res)
+{
+	destroy_workqueue(*(struct workqueue_struct **)res);
+}
+EXPORT_SYMBOL_GPL(devm_destroy_workqueue);
+
 /**
  * workqueue_set_max_active - adjust max_active of a workqueue
  * @wq: target workqueue

-- 
2.51.0


