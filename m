Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0C7CCF2E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=; b=d4CQjZV5bDiMB+neEGZNaCEcMb
	jzLtkiolEAveMw9Pz3GPv8B9aTzto2sEcQOj75HkvpWrpRwe34LO7Qw4bqrTQFoSQB4gwvGN0d/1U
	I5o38sXVAS939+kZ93Qz2mFak/mB/Sq0tZ1m0g+ED/8u3qGqHt5GQD5/pTv57IUlryFYQV3tYiE72
	2Dr1Y1Sh5k5iR9Mq1h/vRtEO71q0Unbv1S6DnaHBWMHw+JeBvFrh0ydK02XOBAxqxioV5Pxrssu63
	XaAotdze1RXf8tWU00qJrcrjC8bpaBAD5qnonA2ye8T4VnRka4BXBVRS2KBkz4h7nntwf97nDVl0u
	2zU53NrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgh-00000001mu7-1eEX;
	Mon, 19 Jan 2026 10:40:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmgZ-00000001mp8-3gQx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:40:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90wRr1044117
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=; b=pBPHvG+V+aldTdvm
	pilu6HfKXIj+geOWxbAR8Jg4hT2TC3v3SmvZh+4BnvnA+YlYsbTcXeoJMUC/xZtu
	FAlw8vIQHM6WbJQNSzV9TNb8LWZ1RMQ1bHkH3jeX/3GdI8Ssf3zwnzPnpP7LHef4
	k6Ov1j3Z5dqpiHT++AQKVR/o+L9m8fl4fjDIsaExLmsCAFVZh4/XgVejbSw4FCpG
	1p7xg1wWcDN3gOG4GrfRnttPczxBO/YEv/5kRF8dIyZr1UxuY5weLcDA8ZLsOVUl
	4BaiQhLjFwKMBThwM19nnTDOKwNd3zMpE23Sp701ZScL46/4kysNPjVQ3ODM8esL
	ev1iDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehstc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:40:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c5296c7e57so1517782585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819238; x=1769424038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=;
        b=Qh+xV3AuC+4shbJ+7Iy/6gl5wH7tErIBBsyIohrgVz6FWZLKReOgymiIZxcco0+Lle
         NDTfTVk/X4hoimZp2vA17S3UTAA2qm9HyEUP2XX230VyaQNA3PiWvv5hrP2ECk6zgbD4
         I1Nuh38Ypse/6j8PlhHcBq/lJmIvl70XynYmCUif41dW9F9nn/77VRImuHVFZk6aU4Go
         dq0mrgshL0aJ/S+93WzUP7gl4qBgxM/7zlODfGLSefr1pg6ESqgFZHGFkBPzzPLVlVhn
         P2P4iChZ6kDMqjt0rMGUj2R8Wgl7TwgJRsf75hJyhtZu3L32Qcdv7L8KWYrsjELLWgjo
         2fKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819238; x=1769424038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=;
        b=c9jv/Eb+uEcijzljZJ2LKSP3o1Mp0fYTK2JosuylVGqjmIor9DZ0cGPvYcx17ir/Em
         GBap7J1zrO093psTebKQi86/pVSy6zb6VFQ5+VFDR1jS8zdWTfMo7yLxblYZEu1JZsRd
         fr90zixr1IZ/IhInbVjoV4rVI+PbXY3Q0lw+rx0M8N+sZ/KJa5gQOwMDiyfN3B63Gq2r
         XK7vEqC/bfqRMFupVIUrJsJaxyP0b0cNE5EenNAYThsR00fuN2FIz42fq4tRVMhuwHIg
         45Xmp+HSarzEmt6WZblaNduiQd00kVd8/hOi89z0ge6ERHFZxP09RAZVWmml+nQ+m782
         Vh6g==
X-Forwarded-Encrypted: i=1; AJvYcCWYmcxUEe7uK3rrzkwoDv8jVlGXs6BuWO5wTyZfOu8QMV71hcrbMYT+qIbTLAEMZT6Tg9EfgXeJwMVfWPYgifmh@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu+dVzoUkCvGItAX4gXLHaQ4krS/vLaxGurSQaaHKhNXpxJSA5
	RyWtapk2PkLOy8zLggHcPof6ff09pyWnjqhqhn6zFRqJrnl2Zp9G1fUrDW9ZaCkPjmztw75izUa
	oHyHUDgzkgrlJ/P0ffw0hTzlk0NWCLHzq8zLTmHDyGMwA1tAT48BFeYO6SbGWSiir+UHndJNJYo
	C8qA==
X-Gm-Gg: AY/fxX5wL5uW23+3tcsi00nNYBvckfEeBrV0l7MyuA4nVM2vrzSgtja+9eGTcr1+uxa
	nhsQ2dCJcGYMwE+49U61mEohy++Ak+50PlpI8UKW9A6AmekYib1HO8nNNmbB2qk8Bn1Ca9cIfi+
	vl1K+8mzi81G5UHeHLSBGzSSX/pdABEJ4T7/aPAgCbhENDdsJjD2pq2oxmraTp29DVqWOq/RYi2
	6KcsWedsQoEuolOB6DrOb7z9/l2oFCqlMbmLsy9hPVJS5PvOH3hXdhDOTz5Etx0M9xi5M8Z0zAt
	48PI1eO7ly+4ZEKXTFtsRSke5xvnveiNZXtQJKfaC8Rvlb/8fjQ6XMgecls4Xyiq/q6s7CBquJf
	svJyU+0Z3EVmJ0k9tukDvkZ1060S0uyWDVSO0NqS5
X-Received: by 2002:a05:620a:d89:b0:8c6:a034:9231 with SMTP id af79cd13be357-8c6a6909cc2mr1477512085a.32.1768819238240;
        Mon, 19 Jan 2026 02:40:38 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8c6:a034:9231 with SMTP id af79cd13be357-8c6a6909cc2mr1477509285a.32.1768819237805;
        Mon, 19 Jan 2026 02:40:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:15 +0100
Subject: [PATCH 4/8] soc: fsl: guts: don't access of_root directly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w0g7AInxJuR27u9srWJadHcDu30R8TLTmUaOMASFczk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoYwGcebs7TnQeHLScelsB33SEhUygDvo2R1
 Rz0CVrKa/OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGAAKCRAFnS7L/zaE
 w5J5D/9l3gjjfHn8oabJffDpUYkOaslm5iWFwsy3WllRD3GzaFol/CREVg/2njHPc8W6eROxsJT
 wxXIe8OowaGf9BENgeEaEfA8NUIlmtIFwmbtAqn1sxEgK9RG62GMxZGUDYZqiwiAQ1IhUCRBxIj
 YT88QAz10YAkhKSrY8oYfeZ9IU2FUWXWbZMGy6GURV2i4h8GRc5YDqiM+6STIp1RD4S4pRQGuMk
 LHP/fRSDznxefUp41kh61X5wU43AQ8FM1leLsCKG8y7WmQg8bhtr2DW+p4PtZjazDWXVf5GsAwb
 1n+fE/v5NLvuGKRZuLkw3nDyesXIDKy6Kiy3iUaqz5dcnOYnfFFRNFvgbLzpIPI9aDgokuOOg4w
 AXXSky8r+SmkmL6is7QCrmrDXnUhHaMdn7/V4oudwwiVN0xvAENYX5tWKikeT/HNJ7f6Y5EsHEe
 9KOKMdbzylzqjsas2M11HREQNgxrJXfnNDgqrKm0fUVmTgmYmlpC84SnHLwAFBzIZ9ZbA63CZTP
 GeMs85X3Gqv6T6o/VMovWvCYazRePcP9Hh6O+NEalOLNppUV68kCUS1lW6U6iC9uGII++8njXvo
 smph8uKv5reLDLaVa97fvnplAnD45eUsvXk1KmzUFINRupBTUl4tKJJRsz4mgQOE6nPFufkfwA2
 yUh05MLZIZsj/bA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfXw1/RkD8emxff
 T+3UfBbbzO6NQhbVvdRBNJmusSi69MYQgfyLnuVDn1ubZSWsYUKn7/aN6fKkeUUieZe+P9Lzm4/
 GhGW4g6DXfRPeH4meNNMShlowOSfzSBWi5VLKazl+S8Zaq6H2PbFfonGYq1mZV6Ots/GpDr38Hw
 ++E+J+iHId1HAkvQfXqi9cQQvVLkseCtcmWCmS5kYHvI5cY71jQPgFDmNhz7gF4/77CmwfBQO0Q
 8YJCg20X8X3jbClo7eXjXw6Nw+eI13HYUwIo7glGShffuFS0nWxSJax4frV98D4gwhj5IXz5mGH
 PF810IIy5oP3PYRYUvTAIufUSblfhzMOsQp5Zgb74eoqvO5HlIslRb1fkDG+6wcki15O94BNMwB
 rHGjpSK1ojvih0oQbl1LSz6Pn3bN8MjbFtytQLCKo3OfIcXq7pQ+ZNQJGbgTaeWfJTe77Z6Rq4l
 n3L/cJQjM4vdhpsKgUg==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e0a27 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oxzWnGEk1v-FRkq7efsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: FlB9cIh0F8YfkLWZzVIi4sV_4HxRn3Ce
X-Proofpoint-GUID: FlB9cIh0F8YfkLWZzVIi4sV_4HxRn3Ce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_024039_924711_82BCF641 
X-CRM114-Status: GOOD (  17.16  )
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

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/fsl/guts.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 6bf3e6a980ffc67c21ed7b62b5b638e37f27454e..88ba32a40f6a27f8ffd13624e940aa0edf48586f 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
 	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct ccsr_guts __iomem *regs;
-	const char *machine = NULL;
 	struct device_node *np;
 	bool little_endian;
 	u64 soc_uid = 0;
@@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
-	if (of_property_read_string(of_root, "model", &machine))
-		of_property_read_string_index(of_root, "compatible", 0, &machine);
-	if (machine) {
-		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
-		if (!soc_dev_attr->machine)
-			goto err_nomem;
-	}
+	ret = soc_device_get_machine(soc_dev_attr);
+	if (ret)
+		of_machine_get_compatible(&soc_dev_attr->machine);
 
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
@@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
 err_nomem:
 	ret = -ENOMEM;
 err:
-	kfree(soc_dev_attr->machine);
 	kfree(soc_dev_attr->family);
 	kfree(soc_dev_attr->soc_id);
 	kfree(soc_dev_attr->revision);

-- 
2.47.3


