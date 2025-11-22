Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3009CFD2E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 18:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=In2rN0a8YFrgVikHIk4MV4jCYicuwgjK5OqjGzIHHqA=; b=Y0mMk+g3dXKYSBcZBEZtOSXIxu
	rMwnl+4oDKucGrev3Pyh2+bUgigfic4stFSn9+4OYtRFJgQM2fQ2lSKExZsdILw3WFp7ZJkKgj3Ew
	paghEsO0POsSDbggBxw0lJAAH8SyAw6+09twePNvvYmIMN/Gib1iHxRyYawiuxqWNi7fFaxWOaxfh
	1m2FbT1aZw505esT/Jnyfi8WXM5515ptCGaUGbF3GDjOBghk8UXSXsh3uBsO3/7sGfSy9lPmrxDYj
	lODcZ6upkEfYAUTA5c83x0kEd6fvcGC/zhZ5YzxXlX2f0986z+/S15xPO1cQKuoc2dPFdhSnWKn96
	uZyQPFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMsUw-00000009ncE-22oB;
	Sat, 22 Nov 2025 18:38:14 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMsUu-00000009nbr-0a9l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 18:38:13 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so5105948a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Nov 2025 10:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763836690; x=1764441490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=In2rN0a8YFrgVikHIk4MV4jCYicuwgjK5OqjGzIHHqA=;
        b=Qa0H46uwkst6WnCxPVEi6EDz5MC3gJwlNpG1Ooi+RC5PNWYqnN2jRhIlRoRAQC+rt4
         tuyAYQn5MX6NG4GK4ZpGuuylpvSOBQeEcu3rMVk+MMDH43gyGW3MBIjaQnZVzOzpdFiN
         xDoWcFcuFfcbzped0/fnP/i796GWR4zh/d5PKslEfnl1qM7yo1SSAe5kgaeFReHVij+h
         DOCVRKFZkL9925crMLSnv3H90q1Mi2G79o6d/7iXlUz7bnQ0Bpx4VS8+rWFY8upi0xkA
         A4o2Whd9pebpWA5EzMrZHszuXW4r2vtt69hlc24VrAzs1ZPrrDz3YUGfHm1W2l11ZLlx
         4xfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763836690; x=1764441490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=In2rN0a8YFrgVikHIk4MV4jCYicuwgjK5OqjGzIHHqA=;
        b=A8NuisO5C69jA0/aJrdiAt1xrjGlbRafxP0JLWRjPTpuMC+vus5MzRaAl2v9gguNZ3
         ZU2v9t+yF5TPSayrzzmtZjPlp1bYEqfcBmO9s7DAO7U70yyJ5hbWhYmTDdCSrxKPhxLv
         kn57YhZizM0gdYokWmioQlUr4pIBaO/ey4hdSm79RH162fIOTX/r8vStUlNdg310FotE
         ky798PCydbBYt7ldh7axLCM3+WlKwyAjNmCM2H6uulzzTkaBl9vMYU0QN+tfMS0ZET5g
         7TH999pBOYIq0vOJvhFlEQ6xmiJ5XxNxmR/8CAzyC4nMTzvEWSZCZHWZPmOC1knIp+Lp
         LZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+GCyuF+/xlI8CcIKdCcaml/gGeP6b+1hz1bbzCy/y6c2pkIMUPAUzk1dADES9HQkbA6FY2sD11Ur0WjTFCgv/@lists.infradead.org
X-Gm-Message-State: AOJu0YwT8M/qA4CEUURnxfePVbdlU5tbBTvD9Z45GOekHL/hK32ogXA7
	PMwpPkhpOT5zlcA1aB//kvTA29e5Vf03LYRxL2/tIK7R8vjGQmqbdRMB
X-Gm-Gg: ASbGncuIgNL6WcP4DZ1Ce5rGKEAa08PqQE9B9QgtKJZLBCQBR0DBdAATCVrjSKR8JcP
	NgBDzo1x966Z9PqQwhv70TGdu5+EOyesBLQYOu12bcW1bhYURchGODkhejXs1AIQrpZpOk7maj9
	TXrP54+rdkuY79q1xN97cnptWh9/G4gsjDETgrjeyFCHwHuF/XbXCNhdzlVKN2vqkhFZPogljTc
	fKpTvkkLnZ6TQyQ58JYQf6WusU9gP/+1MChWPqZ5ZAa391y3Z23OxBxH5G1ahHxSDLz+HTkFbLy
	rwnQvVKoGDBQPy81EOULnNW7k2l885kEnZibG4IZCk2JIJrz3NEYI/J5ryNfxWIl572Y0ziGfSF
	82UcKfI7ZgJSmUc+A+xZYBxYsGr3XabGxVksgB0tvwaBXSMBrGqQ9j1SNFDK6vCnOZJUrp9T6ii
	7P5FDZkQYR2SoRNegFrXnXTg==
X-Google-Smtp-Source: AGHT+IEQFD67KPfrjwDKK5+fo757s6Wyf9Xo8Spp+ozFH3wJdVxj5lN9tWb8xqk/o8aSAp5TSS/8dA==
X-Received: by 2002:a05:6402:1ed1:b0:641:3651:7107 with SMTP id 4fb4d7f45d1cf-6455444a01emr6543124a12.12.1763836689590;
        Sat, 22 Nov 2025 10:38:09 -0800 (PST)
Received: from NB-6746.. ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm7415205a12.31.2025.11.22.10.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 10:38:09 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: cristian.marussi@arm.com,
	etienne.carriere@linaro.org,
	rikard.falkeborn@gmail.com,
	ulf.hansson@linaro.org,
	dan.carpenter@oracle.com
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sudeep.holla@arm.com
Subject: [PATCH v3] firmware: arm_scmi: refactor reset domain handling
Date: Sat, 22 Nov 2025 21:38:04 +0300
Message-ID: <20251122183804.198463-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aRW4PpPjVw1-melm@pluto>
References: <aRW4PpPjVw1-melm@pluto>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_103812_240732_CD44012C 
X-CRM114-Status: GOOD (  18.50  )
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

Improve the SCMI reset protocol implementation by centralizing domain
validation and enhancing error handling.

Add scmi_reset_domain_lookup() helper function to validate
domain ids and return appropriate error codes. Refactor all
domain-specific functions to use this helper, ensuring consistent
error handling throughout the reset protocol.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
--

Hi Cristian,

Thank you for suggesting! If it works for you I'll try to improve the others protocols.

It was tested on my board in QEMU and on real hardware.
The functionality didn't break, and peripherals that are reseted via SCMI work correctly.

As an example, I can provide DMA test results (as one of the processor units dependent on SCMI reset).

[    2.559040] dw_axi_dmac_platform 1000nda0.nda_dma_0: DesignWare AXI DMA Controller, nda channels
[    2.569265] dw_axi_dmac_platform 1000nda0.nda_dma_1: DesignWare AXI DMA Controller, nda channels
[    2.580601] dw_axi_dmac_platform 1000nda0.nda_dma_2: DesignWare AXI DMA Controller, nda channels

# echo 2000 > /sys/module/dmatest/parameters/timeout
# echo 1000 > /sys/module/dmatest/parameters/iterations
# echo dma0chan0 > /sys/module/dmatest/parameters/channel
[   95.917504] dmatest: Added 1 threads using dma0chan0
# echo 1 > /sys/module/dmatest/parameters/run
[  101.931372] dmatest: Started 1 threads using dma0chan0
[  102.731009] dmatest: dma0chan0-copy0: summary 1000 tests, 0 failures 2508.42 iops 19706 KB/s (0)

And vice versa:

1. Confirmed that the DMA module is non-functional without a proper reset via SCMI.
Disabling the reset logic causes a system crash on first access to its registers.

2. Requesting a non-existent reset domain:

[    2.463400] dw_axi_dmac_platform 1000nda0.nda_dma_0: error -EINVAL: Failed to deassert resets
[    2.472091] dw_axi_dmac_platform 1000nda0.nda_dma_0: probe with driver dw_axi_dmac_platform failed with error -22
[    2.482911] dw_axi_dmac_platform 1000nda0.nda_dma_1: error -EINVAL: Failed to deassert resets
[    2.491553] dw_axi_dmac_platform 1000nda0.nda_dma_1: probe with driver dw_axi_dmac_platform failed with error -22
[    2.502256] dw_axi_dmac_platform 1000nda0.nda_dma_2: error -EINVAL: Failed to deassert resets
[    2.510735] dw_axi_dmac_platform 1000nda0.nda_dma_2: probe with driver dw_axi_dmac_platform failed with error -22

--
Regards,
Artem

 drivers/firmware/arm_scmi/reset.c | 59 ++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_scmi/reset.c
index 0aa82b96f41b..9854a3016d13 100644
--- a/drivers/firmware/arm_scmi/reset.c
+++ b/drivers/firmware/arm_scmi/reset.c
@@ -100,6 +100,7 @@ static int scmi_reset_attributes_get(const struct scmi_protocol_handle *ph,
 
 static int
 scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
+				 struct reset_dom_info *dom_info,
 				 struct scmi_reset_info *pinfo,
 				 u32 domain, u32 version)
 {
@@ -107,7 +108,6 @@ scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	u32 attributes;
 	struct scmi_xfer *t;
 	struct scmi_msg_resp_reset_domain_attributes *attr;
-	struct reset_dom_info *dom_info = pinfo->dom_info + domain;
 
 	ret = ph->xops->xfer_get_init(ph, RESET_DOMAIN_ATTRIBUTES,
 				      sizeof(domain), sizeof(*attr), &t);
@@ -153,23 +153,39 @@ static int scmi_reset_num_domains_get(const struct scmi_protocol_handle *ph)
 	return pi->num_domains;
 }
 
+static inline struct reset_dom_info *
+scmi_reset_domain_lookup(const struct scmi_protocol_handle *ph, u32 domain)
+{
+	struct scmi_reset_info *pi = ph->get_priv(ph);
+
+	if (domain >= pi->num_domains)
+		return ERR_PTR(-EINVAL);
+
+	return pi->dom_info + domain;
+}
+
 static const char *
 scmi_reset_name_get(const struct scmi_protocol_handle *ph, u32 domain)
 {
-	struct scmi_reset_info *pi = ph->get_priv(ph);
+	struct reset_dom_info *dom_info;
 
-	struct reset_dom_info *dom = pi->dom_info + domain;
+	dom_info = scmi_reset_domain_lookup(ph, domain);
+	if (IS_ERR(dom_info))
+		return "unknown";
 
-	return dom->name;
+	return dom_info->name;
 }
 
 static int scmi_reset_latency_get(const struct scmi_protocol_handle *ph,
 				  u32 domain)
 {
-	struct scmi_reset_info *pi = ph->get_priv(ph);
-	struct reset_dom_info *dom = pi->dom_info + domain;
+	struct reset_dom_info *dom_info;
 
-	return dom->latency_us;
+	dom_info = scmi_reset_domain_lookup(ph, domain);
+	if (IS_ERR(dom_info))
+		return PTR_ERR(dom_info);
+
+	return dom_info->latency_us;
 }
 
 static int scmi_domain_reset(const struct scmi_protocol_handle *ph, u32 domain,
@@ -178,14 +194,13 @@ static int scmi_domain_reset(const struct scmi_protocol_handle *ph, u32 domain,
 	int ret;
 	struct scmi_xfer *t;
 	struct scmi_msg_reset_domain_reset *dom;
-	struct scmi_reset_info *pi = ph->get_priv(ph);
-	struct reset_dom_info *rdom;
+	struct reset_dom_info *dom_info;
 
-	if (domain >= pi->num_domains)
-		return -EINVAL;
+	dom_info = scmi_reset_domain_lookup(ph, domain);
+	if (IS_ERR(dom_info))
+		return PTR_ERR(dom_info);
 
-	rdom = pi->dom_info + domain;
-	if (rdom->async_reset && flags & AUTONOMOUS_RESET)
+	if (dom_info->async_reset && flags & AUTONOMOUS_RESET)
 		flags |= ASYNCHRONOUS_RESET;
 
 	ret = ph->xops->xfer_get_init(ph, RESET, sizeof(*dom), 0, &t);
@@ -238,15 +253,16 @@ static const struct scmi_reset_proto_ops reset_proto_ops = {
 static bool scmi_reset_notify_supported(const struct scmi_protocol_handle *ph,
 					u8 evt_id, u32 src_id)
 {
-	struct reset_dom_info *dom;
-	struct scmi_reset_info *pi = ph->get_priv(ph);
+	struct reset_dom_info *dom_info;
 
-	if (evt_id != SCMI_EVENT_RESET_ISSUED || src_id >= pi->num_domains)
+	if (evt_id != SCMI_EVENT_RESET_ISSUED)
 		return false;
 
-	dom = pi->dom_info + src_id;
+	dom_info = scmi_reset_domain_lookup(ph, src_id);
+	if (IS_ERR(dom_info))
+		return false;
 
-	return dom->reset_notify;
+	return dom_info->reset_notify;
 }
 
 static int scmi_reset_notify(const struct scmi_protocol_handle *ph,
@@ -363,8 +379,11 @@ static int scmi_reset_protocol_init(const struct scmi_protocol_handle *ph)
 	if (!pinfo->dom_info)
 		return -ENOMEM;
 
-	for (domain = 0; domain < pinfo->num_domains; domain++)
-		scmi_reset_domain_attributes_get(ph, pinfo, domain, version);
+	for (domain = 0; domain < pinfo->num_domains; domain++) {
+		struct reset_dom_info *dom_info = pinfo->dom_info + domain;
+
+		scmi_reset_domain_attributes_get(ph, dom_info, pinfo, domain, version);
+	}
 
 	pinfo->version = version;
 	return ph->set_priv(ph, pinfo, version);
-- 
2.43.0


