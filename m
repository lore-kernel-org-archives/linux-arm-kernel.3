Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541BCCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 22:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mWq9K4N62YrjUgnvfrpfBO/XZHgq78ADcqLRBLBYlQc=; b=4/5LDmlmNNVI9pVRbtmHZcYSXB
	xyXFxBOAFe40HU4wGeXiNIjbZehFY0y7R23MKMWPf5bRRVXGHAMVZ80unwvsvAvhL8adCIiBKGfE4
	RtW06eAGga0ooyhfn4t0Od/mx6ofdFFWPKHfAafRHUxjHg9NaDyuXuzhkhiBShWK+as3tJfZeagLB
	m0lvoAvOuHl6qRwXjpvRANTL+LW0mqypBmKL6H3XXPjHFl0vkXjtc/HJ2DXm10wUHZOqDQSSrdBBN
	ZLsegUuzZNRCsPh7obp6wzU16kQkLbaLnjvbPomeGglpQb6/quv208jPEGKgGtsQCUVmemg1I96K1
	OeVuyg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyHLp-00000005kwp-41w5;
	Mon, 15 Sep 2025 22:07:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyHLn-00000005kwM-3m6r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 22:07:08 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-62f261a128cso3340006a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 15:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757974026; x=1758578826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWq9K4N62YrjUgnvfrpfBO/XZHgq78ADcqLRBLBYlQc=;
        b=nNYS+asrVc6iOhWrCZ0CdUIC92NkKIkjrN361JaI4tz/FwfCsNUg6UMdnQYvahR8yL
         ZiYkrj+MUXQW+HZz9A6KCeUVY2RW2ADAri4m6AMnkW/mSlLgAnQK6uuDt6bnItMCZ8B5
         ToHcpHlbpWZqlyTCAXHnHBoQxbRJXleD9UZvrOufEA/YPl1W+yxc2EWRpzaFz7vYebFV
         KNtuVI7nXCHPF3/ZOS4NIFNhgWAHq2iHAIjVV/rLNsyBq6CNC3bnV/NI+EvJ2g4PFBE+
         Z3PG2uYEwzRrYtqFq0cjdGl1YnhwoL3Z7aDftHRXePVMaYhU0tGRlDeEu7JAZ/M4a028
         MB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757974026; x=1758578826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWq9K4N62YrjUgnvfrpfBO/XZHgq78ADcqLRBLBYlQc=;
        b=SO5FtKPASQRSIEpj9rNiKKR4iFi/AcPT/snxgzK8JmhT20s5d8BnYK5wFpESHfxm2s
         eTKx4dv24crRcv21HmfSfZFyaI6qA+dQJQ51mqw1NRd5wrcXLXVmciISRha9AoLvO5W9
         4+Dnm8agBHVGnlVIckKHOqmcSK5V1EL7K8D6/pfNkTXmTkwbfqVnpDdciqTwLVHe/bNk
         nMBZ+KiOW9hSVudE3yCZhlSa+SvG99Mo/guDu5yEpqp+Jd9kEVRP8HhFgjR17GAxiVOe
         fG1Z9Po3aTCePMUIA/UNwcr8q8t2NxFF5/mB+NFJcDeVxTiJJZWvmQjS1ly7E2FdbveN
         q0/w==
X-Forwarded-Encrypted: i=1; AJvYcCU5HpUmIunTU3nfUsIqy+a55M57Sz82ND1LHaqy3KZqbScv2TtDD34CemF4x9hlUy7KkBInonXDTIlKh7uzsRoU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo1rFVI5hxx5GqxDoRmaxZL9zzVoWEOxVL71aiQGh53P67/s3J
	Kffw5CMGVLob34Qgcsyu2/XJIevzVh6UR5GFJ03nwXCmrgMfPZa4PSg=
X-Gm-Gg: ASbGncue4/4JI9qyy+4k0X5xaGaro0vzZ6hgtSSeS1IAuGod32vodqGP4ZAv9UMLi39
	pjHDBeqXHWjCsSKRViUD6KLrDVccmlospDVfMFNthSFPBJj1yUGWXbGbr3UAoJLgUJg50jTH+OT
	L/yLW+yFXX+9PwjwO4Dg4XbRk1558YdMAoD4q48+LmUvx7s3J/3whDz3Gd1FCcM5bH+jTb3yYra
	IFbdAD7flcakGOEt6hkj7OfNDyEHw4PsUEXqc8qtkhiK7kpDz5Par8lQrp9aCidyAnVZMyAauyo
	XEBTygeG5SsCL0w/8n0TtD+1UJx8rGaE6Qu84FiY49IFvuR2lRsL5RAwwYUn8FbeK+KtLdYDc6O
	Kx1a6Q92VA5OaplKb6WUVX0RZYaquerVU0jDAeqsOlJtkXUjmEQdr1A==
X-Google-Smtp-Source: AGHT+IF7dPa8OCPxYg/A8yjmk5DCk3dELMYC35KzC0feKlYcosBohkoTLl09lrT68/wEHUmsB2ldVQ==
X-Received: by 2002:a17:907:3e1f:b0:b04:6047:d4b5 with SMTP id a640c23a62f3a-b07c382989cmr1253021866b.44.1757974025443;
        Mon, 15 Sep 2025 15:07:05 -0700 (PDT)
Received: from localhost.localdomain ([78.243.111.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd6f3sm1011464166b.67.2025.09.15.15.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 15:07:04 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	l.stach@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: dts: imx51-zii-rdu1: Fix audmux node names
Date: Tue, 16 Sep 2025 00:06:55 +0200
Message-Id: <20250915220655.143861-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_150707_942174_71E500CD 
X-CRM114-Status: GOOD (  12.82  )
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

Rename the 'ssi2' and 'aud3' nodes to 'mux-ssi2' and 'mux-aud3' in the
audmux configuration of imx51-zii-rdu1.dts to comply with the naming
convention in imx-audmux.yaml.

This fixes the following dt-schema warning:

  imx51-zii-rdu1.dtb: audmux@83fd0000 (fsl,imx51-audmux): 'aud3', 'ssi2'
  do not match any of the regexes: '^mux-[0-9a-z]*$', '^pinctrl-[0-9]+$'

Fixes: ceef0396f367f ("ARM: dts: imx: add ZII RDU1 board")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
index 06545a6052f..43ff5eafb2b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts
@@ -259,7 +259,7 @@ &audmux {
 	pinctrl-0 = <&pinctrl_audmux>;
 	status = "okay";
 
-	ssi2 {
+	mux-ssi2 {
 		fsl,audmux-port = <1>;
 		fsl,port-config = <
 			(IMX_AUDMUX_V2_PTCR_SYN |
@@ -271,7 +271,7 @@ IMX_AUDMUX_V2_PDCR_RXDSEL(2)
 		>;
 	};
 
-	aud3 {
+	mux-aud3 {
 		fsl,audmux-port = <2>;
 		fsl,port-config = <
 			IMX_AUDMUX_V2_PTCR_SYN
-- 
2.39.5


