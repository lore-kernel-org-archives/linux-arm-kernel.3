Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E157CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 05:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lkretJLhfB7+l1td9MLSNDIffxT6UR6I0FN9wkg9x/k=; b=IG60aFnoQMBIgUHAwrknD86qY+
	aTzexw/tCRKIzAwozm2ZonmZN34hQqRXCzro7cp4XqlqueDVTgXujlPA0TPHG8jOFOmLUEJJD3Fra
	7yTZSY8497jG/30yDuHPZpF3hIyMYk21L0k3t/+WQW9et6DAvsw5xxfpEcpQCs3sJ1hBrcDvgwwcK
	ibisPmvbfZrcb3WyeU0KKY8kLwpERaoEOueaWKg61G54LN7VpW1LCihmpeXFnd1r/DIEKb+VdAuG9
	Ho3Rl9e6+5/BMVGdIDi+2mIMMEilorI1Rj4YFUKLBThtiuQvQo9GliNn3EmePCu/xGi/X/hS+Gzxf
	FHPZ+AKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLwg1-0000000AD73-2NcS;
	Sun, 10 May 2026 05:26:07 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLwfy-0000000AD6Z-2O3L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 05:26:04 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8eea23d01f7so445338785a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 22:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778390760; x=1778995560; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lkretJLhfB7+l1td9MLSNDIffxT6UR6I0FN9wkg9x/k=;
        b=lLa6OB0b20KeHFCkqIHbBAu5ZG7FArtayKqsT4DcOf2LbENsAc9OtrJNVFJMP2iuyU
         l5LCdnlqgp0J9OTcpsckedbUwrztyj6xHZl5gE03mUa9jy8DqI/P6KGrnM2KKS4FLxSG
         tmJ/EcoDeFFvZ2Isu3tXBtnX1QYAKti95LKjPvKEM56ZU9wvsSnoPzPXi9bvTGeBcK/M
         tR8LrL//dkjTgFkPO7Vp+9yiZ663U8zFVand9r0z9KRdfNOgy4o3EqoTdYknu1L9Zcma
         hnSU178drlyNGsielm7Ob+bdQMHr7v3q9NIr4gFDctsPnTn3o6Lhp/b5ljIPToV0OP4S
         vAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778390760; x=1778995560;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkretJLhfB7+l1td9MLSNDIffxT6UR6I0FN9wkg9x/k=;
        b=tTCfR5VTWoA1NAFTyWjMWyr33qocZD5ZCxYtB1+Ebs1SGxv4zEHoXsaC6krfUpDDIi
         G44byaiwbq6A50ryNUDBotRXvs5Ih51Up1QkLl9rr5PK94q0kzN/Tk1W6ZSlIA2qz4KF
         qQC2R+1AY0wsNlRAhcLEyOMFxlpSB/t3WhdFN1JH/pwihZ4Ei1r+JJ5tOjl+RbXrLfo6
         XwCcfqxkUaSw5aKxYWxpHP80d6ihplgdtqQZvk5cQ/JAAPJ48ism8s8kBf0Szr0bsFHg
         tO7cctrPF/MMDNdoP9683wnRjk6xRZcc30R3M0xuRaM/BFj5mLCqdf6gmyUDjrvCijG8
         DHzw==
X-Forwarded-Encrypted: i=1; AFNElJ8Wudoy8BcSuu8Ge2NoG/PsRLGDWbyLBrzO+brVUHZxQDV5EwvuJjGlKOl0wUk0w0UJlvkaEdE5cr1stiz2JHmW@lists.infradead.org
X-Gm-Message-State: AOJu0YxF4mr4YsZ4n3RfRSMt3fPXO1k6qYK+A0tnUL32pJklmPz5Toky
	1JXzdHbwpEu7618zj4qiEFV/AGhrqGgHEJhSFMhsyfwsf4zQQtCc1LJ5
X-Gm-Gg: Acq92OFRFzqrisLYyTEZMvjcqr+g/9FMQOjVE7AhslNMkIe2/Kl0AmTWwbk84Xz5MKN
	41sZd5elxndYTBrNJzsp7xgQGYp1F4q5O4hhSPdp1zarBJ57sf2Z2BtXWr6WxqtOdiDmyDyX3UW
	8Q7Cas95cTDcjxmhHYqeR3NNrCs1S+jr3bOfVzs3uHetGOzHHQnwi8AqmnQImkpa/xtMjZln3VN
	WHqAL9gaV8pd2mz+1WNVL1NlnCYpEvxRaH5MnAqxYxinEnjwf3GvxgbxpfP6YSlm2zIY6onXlr1
	qqphw2/DLo7KfZTeox661JBEf8mFX3GYLoocGu8RV+1sxlPlsaKH33PT/VPM3GueedS1bGOF1jI
	S2fLaZgOrvHA605gpzWAwHxqzstciLyPiX3BxtnZe+xxzffHPMde2Er0GkA4bIDctIi62EB2WS6
	nlT35VLZM5R1FVafMaxDYgHHzNbK8=
X-Received: by 2002:a05:620a:28d3:b0:8f0:b0cb:190f with SMTP id af79cd13be357-904d60f695amr2567465085a.39.1778390760497;
        Sat, 09 May 2026 22:26:00 -0700 (PDT)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b9286f22sm689689085a.13.2026.05.09.22.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 22:26:00 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Sun, 10 May 2026 05:25:35 +0000
Subject: [PATCH] pmdomain: sunxi: support power domain flags for pck600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-pck600-a733-gpu-v1-1-d6393646d714@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0auUzAZiRaVeRRw0Rg2ClhZFKN7d4
 viG/xNECSoROpMgyK1RzyOjLAzwNh6roM7ZYMk2VJeEnveGCMe2qnD1F848LUzcsjgHufJBFn3
 +Yz+87wdJjmRzYQAAAA==
X-Change-ID: 20260510-pck600-a733-gpu-dcbfc0c7ce99
To: Ulf Hansson <ulfh@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Icenowy Zheng <uwu@icenowy.me>, Mikhail Kalashnikov <iuncuim@gmail.com>, 
 Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_222602_715125_DA98533D 
X-CRM114-Status: GOOD (  18.14  )
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

Hi everyone,

This patch refactors the sunxi pck600 power domain implementation to
support individual power domain flags.

While bringing up the PowerVR GPU on the A733 (Radxa Cubie A7Z), we
found that one of the GPU power domains must be configured as "always
on." While the Radxa BSP device tree leaves the GPU power domain nodes
commented out, the GPU driver code contains traces indicating an "always
on" requirement [1].

Currently, sunxi_pck600_desc only supports specifying pd_names. This
patch introduces sunxi_pck600_pd_desc, which stores both the name and
its associated flags. This also (more or less) aligns the implementation
with the existing sun50i PPU handling of always-on domains.

With this change, individual power domains can now be configured more
granularly. In particular, the GPU_CORE domain in sun60i_a733_pck600_pds
can now be explicitly marked with GENPD_FLAG_ALWAYS_ON.

The patch was tested on the Radxa Cubie A7Z, where the GPU now functions
as expected.

Thanks to Icenowy for her support and expertise on sunxi and PowerVR,
and thanks to Mikhail for identifying this exact cause of the GPU
bring-up issue.

[1] https://github.com/radxa/allwinner-bsp/blob/cubie-aiot-v1.4.6/modules/gpu/img-bxm/linux/rogue_km/services/system/rogue/rgx_sunxi/sunxi_platform.c#L62

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/pmdomain/sunxi/sun55i-pck600.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
index 1d47bbd35ced..8a37d11b65a2 100644
--- a/drivers/pmdomain/sunxi/sun55i-pck600.c
+++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
@@ -41,8 +41,13 @@
 
 #define PPU_REG_SIZE	0x1000
 
+struct sunxi_pck600_pd_desc {
+	const char *name;
+	unsigned int flags;
+};
+
 struct sunxi_pck600_desc {
-	const char * const *pd_names;
+	const struct sunxi_pck600_pd_desc *pd_descs;
 	unsigned int num_domains;
 	u32 logic_power_switch0_delay_offset;
 	u32 logic_power_switch1_delay_offset;
@@ -164,10 +169,12 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 
 	for (i = 0; i < desc->num_domains; i++) {
 		struct sunxi_pck600_pd *pd = &pck->pds[i];
+		const struct sunxi_pck600_pd_desc *pd_desc = &desc->pd_descs[i];
 
-		pd->genpd.name = desc->pd_names[i];
+		pd->genpd.name = pd_desc->name;
 		pd->genpd.power_off = sunxi_pck600_power_off;
 		pd->genpd.power_on = sunxi_pck600_power_on;
+		pd->genpd.flags = pd_desc->flags;
 		pd->base = base + PPU_REG_SIZE * i;
 
 		sunxi_pck600_pd_setup(pd, desc);
@@ -195,13 +202,14 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static const char * const sun55i_a523_pck600_pd_names[] = {
-	"VE", "GPU", "VI", "VO0", "VO1", "DE", "NAND", "PCIE"
+static const struct sunxi_pck600_pd_desc sun55i_a523_pck600_pds[] = {
+	{ "VE", }, { "GPU", }, { "VI", }, { "VO0", }, { "VO1", },
+	{ "DE", }, { "NAND", }, { "PCIE", },
 };
 
 static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
-	.pd_names = sun55i_a523_pck600_pd_names,
-	.num_domains = ARRAY_SIZE(sun55i_a523_pck600_pd_names),
+	.pd_descs = sun55i_a523_pck600_pds,
+	.num_domains = ARRAY_SIZE(sun55i_a523_pck600_pds),
 	.logic_power_switch0_delay_offset = 0xc00,
 	.logic_power_switch1_delay_offset = 0xc04,
 	.off2on_delay_offset = 0xc10,
@@ -213,14 +221,15 @@ static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
 	.has_rst_clk = true,
 };
 
-static const char * const sun60i_a733_pck600_pd_names[] = {
-	"VI", "DE_SYS", "VE_DEC", "VE_ENC", "NPU",
-	"GPU_TOP", "GPU_CORE", "PCIE", "USB2", "VO", "VO1"
+static const struct sunxi_pck600_pd_desc sun60i_a733_pck600_pds[] = {
+	{ "VI", }, { "DE_SYS", }, { "VE_DEC", }, { "VE_ENC", }, { "NPU", },
+	{ "GPU_TOP", }, { "GPU_CORE", GENPD_FLAG_ALWAYS_ON },
+	{ "PCIE", }, { "USB2", }, { "VO", }, { "VO1", },
 };
 
 static const struct sunxi_pck600_desc sun60i_a733_pck600_desc = {
-	.pd_names = sun60i_a733_pck600_pd_names,
-	.num_domains = ARRAY_SIZE(sun60i_a733_pck600_pd_names),
+	.pd_descs = sun60i_a733_pck600_pds,
+	.num_domains = ARRAY_SIZE(sun60i_a733_pck600_pds),
 	.logic_power_switch0_delay_offset = 0xc00,
 	.logic_power_switch1_delay_offset = 0xc04,
 	.off2on_delay_offset = 0xc10,

---
base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
change-id: 20260510-pck600-a733-gpu-dcbfc0c7ce99

Best regards,
-- 
Yuanshen Cao <alex.caoys@gmail.com>


