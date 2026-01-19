Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5986DCCF2DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igmXtZijQdt1UfbUzxesg6BqpEFZh/onZIxk1K1+ZUE=; b=mVNHNUlqqHZB07aeUKiRpWZKK3
	rUiJs26CSk0W0oSrjAc5Roobd5oBexNgCGeKEOILyhgDM44UfHgppDF4L/g/riBJ+o7WvegG4pwYo
	CIxSWY5VrRjm/qVdAbhLYRdvayEkFwLcpdkJAb9W1QjPVNkO2o1Gyqd/m8e7Ec1OFIbBY0kQmtTdF
	TdFwK80GJgdkNQy0xlRcrBpnFUdTtZuECMKINpG4Z5gRvk33eIl8zr5f70ZG9Zt533KHPNNthlm2P
	Y0/C+RjTJgTYmEuGWIfw0yLkI86FWBpZqzRLizW24u950HJJ3eb7lEYtTabeKhyaJ/M38As9atbs3
	o6rKju9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmga-00000001mqC-3zCe;
	Mon, 19 Jan 2026 10:40:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgY-00000001mon-2CSU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:40:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91HqO1561995
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	igmXtZijQdt1UfbUzxesg6BqpEFZh/onZIxk1K1+ZUE=; b=WtUGhrbOL3zGykR7
	r4/OlW1KGfz7xdKxgvWS0dDCsADMy3NZ4qVmPEK203fYSKO2zNCRKw8EPzt7nYeS
	dJ9LiPOykZNzsHxDxTQvjOID6ItOjmYDzUmOsFXCTr0Wizd5cUF053qxsDzgOOhy
	v9ARBQIMTjYM3nCBcpMLOBRuea8/XIv8QBNl8MQE3IRfuNIfdAXq9+BhKhSuj4eW
	G8n1YO6C4fzqUxXVqE3iz3mXV7IyMoRa0IE4y7vh06iQi1k/y/jY3d4oNxzavNAS
	ZoY83WfgRrLyaveYxpbT5cWLW3WpiBLh2QW6GUTURjN1cfkRhVz/mL1OaVgXYRwG
	SbB0PA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dcr0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a0ec2496so819061385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819237; x=1769424037; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igmXtZijQdt1UfbUzxesg6BqpEFZh/onZIxk1K1+ZUE=;
        b=PAe4qEMVX7UeamUVWvAEuxUX2OBNLztLqju+0yCagEmybhOWbCK63R2xoSQJilPpvg
         CyOyM+gLrVbfSU2+O2nNnvvkGmE4woEI1ih4jbOOVpaV/5dNcZSWLhC18Yovfe6N1HPw
         URLZbf2JvrD94iNeea7S/TxzgVW2S0OzQ/okJ+gqTNqvyJaiYujth3aLviuWWS+U8/at
         vBjUYcgvPw/pypDnvTEqvjGS1ZxNVdF6aJIlThs2kfyUVZv50LN04aAvWsWohfw6mpDU
         Uj1ENDxRGj927tKoSYsupfyKKWErxUPZovU3HinZs3J01gUOT0uaUQKAsHHud11lmz0r
         NMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819237; x=1769424037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=igmXtZijQdt1UfbUzxesg6BqpEFZh/onZIxk1K1+ZUE=;
        b=WsTNlKSYD3fubBNTxnjCNfLshM+6yVdHdKxLmUjH+9ITVfm1G+W2FDmC9izvkrNumH
         UCtIk+tMYFhV/aLCueaWQKVQM9ces1jAaPfs+2xcm3r2V0MysC+2H0AQdbXwTKRc1u/o
         Ta/wCmBCg3jZWGF2B/AHCcdIcTJj4BV/uAxtXEChKAqB814TEPABCfXfbJ3JbxBkWT28
         RgGHyNLdAdeaSx88xNUVV4FHO1LL9GlXbw9dXbp11K/fb9XvOWHyeEXVDbz0j9//lj7X
         tFsrN7TfejsYW+f52KmR257LKhwWb6BCHqZ0rKHkboYhR7m11IUo8bcY4CQykKvATRN2
         s1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX9ZzB+DmPpMo7nkj5AONR6KkfPgQR1srqED9aZicvnUnKv9DDpSQs9lcVoWXmTfTyb3zBWd84hTIWZWuy/9tSW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3OqVWM1YwTmgBFRZ9zbLMt7G/mCchEgYQ1T5FkbQaVLGQ+AJX
	tVX0bTwdJVHqTrFKCSIuYl1DfGmEYWELqAuoibC6KA4ZeVZkkllsCUPPZBtYnofK5g7v3hILN44
	pBIn8eSEfPy7UpMkcugPQqV5qtyeuPswcCpi1/zpJ8bsKHTgoVk0yfe52mEK4/+VyyBCRvJ6Cng
	WxeQ==
X-Gm-Gg: AY/fxX4RKL+o816qF5EroQH03H7ene0IZ1b3xFESlztISfwzO5pWGwaYjEnRNk0JUYd
	qxzgZFDIRjftc8zRiqXn9+YWI1Rw0MTC2gZlolvofwBHRQHrVgJtLB4gvO4M7C9cY87xHMF7/7e
	DVgVWxLI5nY8fVXc+LH5KHpLwGZADhJIR0m3flydITHsLdY4sA+b6KvUZNsLqR5DC9wTPnL/3Zv
	n+ZJO5o5NiZnBeI2Y3e7o6gp0v2Sh32swQAZMficFN1Bq8ygAvm9tZ+jBA0ZtpRvhPxvxLsuVnE
	sdoVhZYZekU6b7zxsW5j1sxyudNHyeCerA4cn0jrkoFYxKFVhme529bs6cfcsChNpbTdIg4rdQ+
	g9xCKwYJlHFMwNrIicF3ikeKH06wYpgGDdfKzuLtZ
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr1409465385a.66.1768819236978;
        Mon, 19 Jan 2026 02:40:36 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr1409460985a.66.1768819236489;
        Mon, 19 Jan 2026 02:40:36 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:14 +0100
Subject: [PATCH 3/8] base: soc: export soc_device_get_machine()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-3-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/FOsnl+0vWD/ZzcTEo1dF12opBcr7kB+UcsUPg1w+Ds=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoX3WZw5M4WHNvKkR821Z3quwcNTpVLMjbj6
 AN1sWnvF1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KFwAKCRAFnS7L/zaE
 w0OsEAC7wjDs/oNX7OLNZrfQxWpth2eroBxR5f5YvRbchfyUdsKPsp/pGUq1bCzrx+aFpHxx5e+
 YGBS1c3ttUgKMaQd5jrKLaE3yeb32HPfOWs3abNpDkknl5BpNJGa5KmxarRXVPTwRznB/rW1WrQ
 ylY1lIYr2FWxe42W2R+vB612/3VwwbZ+mcYQDInqP60F34urScgzOClDXHdJuzfgW81Jo1l06Vo
 1JKeggoB1rOCAGSFsN8atiRIjo5Qqf3eX2CX0LMfn1esbyQEN35bfgJ8Pw0p0Aj3cNOE7RNxcFz
 nAKxdjSj5/8La7xLviBdOlLcE1F9hYO4UWEnlZEx8rhro+XbipEp4CixHHhjqjFb4LrwAto580s
 08lMsBqp/Djpu8FJlgvEJMsp4nf+D0Y+hKVJX12HiNC1J2+M2g/iOkl1Vrh9jRRMRPjIT+uPkE3
 jc8G2pdztcvlBzcvL2bLF6K5MpyT2ZJ5bSC/X8rJbiF2mpIU/ZV5KR9+wbgvvm2VfaE7t6CpoIr
 7qCTPf/VgJu/wCb8zjVU0J3rzNTH/JQjQI6eFfRc787kBMnyualHqCR8x7X9CTphC11xWFYCiJr
 3VrW6gEQx8bJYO8wLIvZrxKukEuCrle8mFyVNMRTGOzCRvHbKqQvajpz45u+G9rkctUxcAg72NC
 wK187rGA7W2Ay7w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX0XUo5yfb7glp
 h+0ztrFyF5CcJHSNOTHDGjjZLSBtW04o10IXLlHMo5ZFDw+/aXlf+NiF8IOLAWDV59WCGopQNuv
 OxPDdEu5Wwr7LHQZ69i2qFDDVzViW6TlRrLInLJTqSe+57OpScYsy9Wi5ZjUzavesjxkjqfh2Zu
 1z0Zntbt5SpjCl/FnoI5j3ZZ3CpDupdsYf61uldvm9FwnvsEE1AmbvvCZJqpQgVz+WU1AFR06FO
 ciO10YG2PDztk+60BpsU9nym21mqdwWFmTv9VOcwEHDy6VSjuu9IMc3vdV8NVUdzKleivDLJLBf
 k7bspemTUowkaYJS86m0iD9yafBtDkC4UBovUY8gLGlDN9V2TZo/JPxLl8vEYPmetKSpVZuEsCw
 MkdN8rIiomOhxukZma2oYiSF5jXTUsmDur+Ded5YpCMUR27EUXRX27qPd/WnfcsKO4hVaMmTz8S
 I0BHcQDExJ7WgaaywCw==
X-Proofpoint-GUID: k4SyakS6ICHiHWCpc4-V1JwS-731Xg9N
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696e0a26 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VU1FamAdWuTKyoDMntYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: k4SyakS6ICHiHWCpc4-V1JwS-731Xg9N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_024038_572456_834E79D2 
X-CRM114-Status: GOOD (  18.38  )
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

Some SoC drivers reimplement the functionality of
soc_device_get_machine(). Make this function accessible through the
sys_soc.h header. Rework it slightly to return a negative error number
on failure to read the machine string (SoC core can keep on ignoring
it). While at it: make it use the __free() helper from cleanup.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c      | 16 +++++++++-------
 include/linux/sys_soc.h | 10 ++++++++++
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b..bec8771d40f0590d4d7c3985c08fedfd4043a394 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -5,6 +5,7 @@
  * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
  */
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/glob.h>
 #include <linux/idr.h>
@@ -111,17 +112,18 @@ static void soc_release(struct device *dev)
 	kfree(soc_dev);
 }
 
-static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
+int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
 {
-	struct device_node *np;
-
 	if (soc_dev_attr->machine)
-		return;
+		return -EBUSY;
+
+	struct device_node *np __free(device_node) = of_find_node_by_path("/");
+	if (!np)
+		return -ENOENT;
 
-	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
-	of_node_put(np);
+	return of_property_read_string(np, "model", &soc_dev_attr->machine);
 }
+EXPORT_SYMBOL_GPL(soc_device_get_machine);
 
 static struct soc_device_attribute *early_soc_dev_attr;
 
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index d9b3cf0f410c8cfb509a4c1a4d6c83fde6fe33c6..2d2dbc18462a39ddee95e38826a769fab089026f 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -37,6 +37,16 @@ void soc_device_unregister(struct soc_device *soc_dev);
  */
 struct device *soc_device_to_device(struct soc_device *soc);
 
+/**
+ * soc_device_get_machine - retrieve the machine model and store it in
+ *                          the soc_device_attribute structure
+ * @soc_dev_attr: SoC attribute structure to store the model in
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int soc_device_get_machine(struct soc_device_attribute *soc_dev_attr);
+
 #ifdef CONFIG_SOC_BUS
 const struct soc_device_attribute *soc_device_match(
 	const struct soc_device_attribute *matches);

-- 
2.47.3


