Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01199CFC518
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyZu4GLnuAW/BYkaAKPEJEEvoRNPxLTsGnOF4gGj5Ds=; b=RMNARoR2EUF/NCva3z3/OfuNQb
	Jf1ZNpbt7Qmn9QFwO4gw1WhHR29DJ2QrvHCYphs/YgNurUToSzermrBm763l6XiLVcjG0JnTPRfn8
	LPasan9dqpS0+6gOXr++64nYkqYQNu9WWPpG9r5ZaDsR3x1mm96yfJ80ocrTts8Ci3aJIFD8u4NAs
	pBoBH84s+fC8T0xm2NgNZc2jOz9DmHa56Ab1ThJRKe0oxXasrc31SWQV0S4P9AfJKeskTw4C7Vfue
	/3GWrbFvFt1r+50RGUz67n6wdBQXuUqtRYUfeNWdgIQpdFYq5lX7yH11/Z2j1GXyNCO5XKUF9RX4d
	szmFdO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vND4L-0000000AYFs-2Dci;
	Sun, 23 Nov 2025 16:36:09 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vND4H-0000000AYFH-19MF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 16:36:07 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso4788086a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Nov 2025 08:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763915763; x=1764520563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyZu4GLnuAW/BYkaAKPEJEEvoRNPxLTsGnOF4gGj5Ds=;
        b=cW5dgvB5npQgd06qicXmeFf0/5pUKm3EVzoa4ckwXvy37aVHb/pPWzUReveVTn7668
         l3anbzKIfafLX3snP67K54Did/pClOooXoffRVEyptpeEEJW8ziOVvQxZsc/q+oxENms
         CXEru3qScUXvysXK2p2pnHRNTd0OMgX0m2FX4E3o7v+VNmhbCP/L69f419MvsVOwQGbL
         UdDW0tGrQ+iiB9hqXNPRnfgemGl85d9avEfitjKmXBguZJLFnC3m/ZUu60UPtE2CSzSR
         OiYQStycjF/B+ob9By+LDH0kEU7KUs+V5LVV2Wg+LFs6trs88Qqd82gU4BrDMNBOthpA
         W+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763915763; x=1764520563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyZu4GLnuAW/BYkaAKPEJEEvoRNPxLTsGnOF4gGj5Ds=;
        b=mAWkNa1kWcUfy4IRR8xgGEkOidtkrAtAY5IirJB58GzdAFeRc7r6i5I7Z/ll7icpv0
         IfvybP1OvmbQT7ab6cipWAWrn9IB5bjK9rKPuCJ1fLFjOzYoG7jd5nmxXCdWrXuwwOrV
         89hHrh7M4kfRuI+WgrmMuS4+GrWdf1IbW4YLmubtLqx+6EG0Cy0I3/zsVRAlmYSly4D3
         +OcYrgLEN7/rrtDHHDIb/JCvZTs7/9HJLXQBSiCO5hDq8yh7z4ewwjCpvqUcDynGNt8u
         jVsEsM5ERQZUioCXmupT3JBgWolGHmKy2IDhNNtmuf04SjRX+sGnU2X+n0wWVqNG/WGt
         8QNg==
X-Forwarded-Encrypted: i=1; AJvYcCVg8kTnvmI31A/itF3fZRbR+Pvq3yMgnNxdYvaQONM7DZ2HX5aeGMCPtjYsH4nuVyXO1LN9iFSdlA5Ah6QdPYde@lists.infradead.org
X-Gm-Message-State: AOJu0YxKzd1GFFwQ5ckNFjnQVAqwZna5ij4/lleKNGly7I07eTNzF20p
	C8CrDknlFhBGl5od17THipcVo10JzLogD/V434vbh2yQVCEvBhaqDabF
X-Gm-Gg: ASbGncuq2MjDJljnn0STEszrGSNa4vZ63XC/9nbmsucz3N2ljy/8jRhY2edGZRhwMpM
	K1kcj0O8WN2PWz6ZmgWPT3lN9GIuTz7/TPpwSH71NnrXvrKFsdEhVxwlyofv8UOiIOmwD4e3hE9
	yNgpekPTqdo/nSDrAdhdBq6PVbZ32XCsS8Zw5fIGxsBazNEeEKSLTExzxDr3qE+xc96APQuEn+y
	cpqZMbIC2r3FVoBcHzEa2KAVmJMq1/6YFkvHD8xgJqTiKC36tK9ZCrCnYAOqAZ2nUH0asGj01V+
	G/GgobCJyUDDqvzcmqt85O6qcSr+rd2vzOOVEK82As7hDVBqYetgzY/+OURaA2yXY2oQ2PgEZt8
	C7jftZ+kHYr9jAYLIAOpKgYAjL4zKw1+2rb4lRR2FFgbH9u8cjAlU+IXkeW5XOiy4s68Zu826Yr
	bwqwxnHh8qBCg=
X-Google-Smtp-Source: AGHT+IEvGL1kfUl8AZGuuobVlg3kaaNANbcHEX+yQYO7yQf4OXFaLOFiQETRT4SBlOFgpgXa0prAGg==
X-Received: by 2002:aa7:df0c:0:b0:62f:9091:ff30 with SMTP id 4fb4d7f45d1cf-64539624040mr8366526a12.3.1763915762492;
        Sun, 23 Nov 2025 08:36:02 -0800 (PST)
Received: from NB-6746.. ([188.243.183.84])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536443a9csm9704216a12.29.2025.11.23.08.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 08:36:02 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: cristian.marussi@arm.com,
	sudeep.holla@arm.com
Cc: a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] firmware: arm_scmi: refactor reset domain handling
Date: Sun, 23 Nov 2025 19:35:57 +0300
Message-ID: <20251123163557.230530-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aRW4PpPjVw1-melm@pluto>
References: <aRW4PpPjVw1-melm@pluto>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_083605_373270_06E3FDAB 
X-CRM114-Status: GOOD (  19.11  )
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

Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---

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

---
ChangeLog:
  v4: Add Suggested-by tag

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


