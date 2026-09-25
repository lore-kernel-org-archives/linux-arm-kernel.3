Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDA3C98328
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qzFEC3aTbGnpQkHithoqa18oO/Ij/6Vz720R55NWgd4=; b=0LvkbioywabcCluhMNMmdnwt/2
	yifKi/ihEw1neFhdJfV3oRAJDlQLOZ9E8N650Bgh1ngjiAgfY9WRcWyIeP08vlpY3sXfIcr9xQvpa
	pyFugZxEeZ4+yehXpq4IDxm5Zr2db3Qcug4LErpBG0J1DdWg0Nhl6+dATVTqb9rqGwBAdMAQLyzMU
	bBEgyk6I+aCdz9RHixEHR728e+O2MHfcnSOODyob7fC21n3hlIz8xP/W0zbQrus0LM95BeojWi7Ya
	Kh1u8f0gcSIzmVM9kFF1s0gAkxNxevJ7GUDlZ8q65nzeFR/hQVQyfmuQKrSAabLTCj3aoRQZufd4k
	uPIAHxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6XE-0000000DWiw-329E;
	Fri, 25 Sep 2026 14:04:20 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6Wf-0000000DWNT-1Rvo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 14:03:49 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-486e1a044c5so753045f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790345024; x=1790949824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzFEC3aTbGnpQkHithoqa18oO/Ij/6Vz720R55NWgd4=;
        b=PtGymhyWULSVQYX1iYxcRilkAn837zYRYxdnFVV7o85tLdC878ZaH+3WcYueA9J0t1
         GJF1PbMhJG3S7VjQf5NUn3AzwqVjld4OfmQhN83G76TtGd7sXc52aq4cb5BvVOjhPCwz
         Gtrn5kfPTT7mSULYhbWung500+1PlWyaU6AawWsSrt/ou9znDaEo1Q/MmVv4Rk7tb4Rt
         gDT4dPoxPWpZgbAXA0H8UYroyT6ZSbPKGTJ89ar7vmbS9/pASOk4Y+m5ZkBDxv8HZauh
         t1qeBDaZA4Cbt0rYG2yTXXiD2/WmDnm9b1i4pDXJmApj+8DHNcIpMdQWeka051UpNRZT
         ud8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345024; x=1790949824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzFEC3aTbGnpQkHithoqa18oO/Ij/6Vz720R55NWgd4=;
        b=HqPShNRgBGljzdNZvxS7OrBQ8+MOTxJYtwz766gPPFymMF7X0wBYSneWiqbsYRz7Qp
         +qsYoR9lgGAWQWqkXd4oBIj8EU+Jta8l7U+wt7SZVO/21KPB0Iak9jxVIDHuVFkZO5od
         XuHW5L4J6Z2/nOFx22fdN9arBGGDFw4KpARc7IWkRq1ueh4V41/T09ojPa2uz02hKb2g
         qLo3XCgzjzGjSksmk0g1+9hJbbxuQcoDvRPcBSml2xRSoD0s06Om3gRm19KOuF0SxTNr
         f1yp+vTJEx4hjB9dlPxpShbJMGd8nznJAolWit1sdJ1Vjs6x1o8J7z2EIWVjvqgLEBqZ
         x1Aw==
X-Forwarded-Encrypted: i=1; AKwUvBw2SQeJlGg4KqkWmE4rxxsPs80PHsOUcpPzXTYCRlnM4/jf4rU4kNIPmUfHSdpgfeZ6JdPRtJVJvqHxaz6VFS6W@lists.infradead.org
X-Gm-Message-State: AFuF++lrn5wTTaNI3KmMpjEjrBH3xDc47uIUi/NffoHONI8SmSIbXiij
	p5XUVtjryYF6QpLO+Y71ILyGpMw1RSveHmRd7kOSjR7RjOmmWjrcb/cL
X-Gm-Gg: AYBFou0qGKmrFE501rVphYT+rkdxT463kBGICwnpIJyy2DUO0enLCnuUnATF7JqLOSv
	se2WnpH7M8SUs4T9dyTS4caFN8DrV3ytp5QLzc5pzciCSZ3Pa1gqVEIpo4alwZ82iDzBWLxu1cj
	CDxdt4yE/LV4xr1yVS7mzK/7yvZKgpmgYYuUc35lGlKUkHroRVJEyN2ucRGN3DWNGzKAaS/l2+z
	Ybn4Kj1WKgUNOSBmRh+/jKckH3aNmjzm+L9qcjIQW50sV2lWd3t8J/HD5J9OXTzy9vHs3VBopgg
	j12klkB/Qt6Dpmx1EGDQOoF7eOV6pRMJG93Cl11bKaYkJPmgknTkOlZyrhuz7kEaSyPsNdBjp/6
	r4XPvrnqGMyWfK0dTijDODzh+9FbN9GtqgFGOHIsRIXKJgVSKOubEUrM3vuHLvBfT7RHyqMvH9a
	QKB0UcpGiSr2SWUqxqWsVfh9AZKi/NzKVGkQ1Nw91rOi48zzlz89vzhNVnfZ60wo1igs+PBe/fP
	NVjwGjhC6e/GZW1MY6anIKjhYUGoAUFrJ9Vrvl+lce3eyIl7mvqo1hfOiODw3WJMFhSLk1r5gvI
	4ahM4Jii49V5iPUox9x7wA==
X-Received: by 2002:a05:6000:4201:b0:488:8411:1d08 with SMTP id ffacd0b85a97d-48884111e4bmr551965f8f.48.1790345023466;
        Fri, 25 Sep 2026 07:03:43 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm7522431f8f.19.2026.09.25.07.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:03:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v1 11/11] ARM: dts: imx6ul: Enable Variscite i.MX6UL board DTBs
Date: Fri, 25 Sep 2026 16:02:28 +0200
Message-ID: <3fc9181ea762490c53451b366e3723d61d46a56e.1790344389.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_070345_442137_0C2F0E4B 
X-CRM114-Status: GOOD (  11.30  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add Makefile targets for the VAR-SOM-6UL and DART-6UL board variants
based on i.MX6UL, i.MX6ULL and i.MX6ULZ.

Keep the existing Concerto DTB targets enabled alongside the new
carrier, storage, wireless and audio combinations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 92 +++++++++++++++++++++++++++++-
 1 file changed, 91 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10..cdca939b10a9 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -377,6 +377,36 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-tx6ul-mainboard.dtb \
 	imx6ul-var-som-concerto.dtb \
 	imx6ul-var-som-concerto-full.dtb \
+	imx6ul-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-wifi-brcm-6ulcustomboard.dtb \
+	imx6ul-var-dart-emmc-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-sd-card-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-wifi-brcm-6ulcustomboard.dtb \
+	imx6ul-var-dart-nand-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ul-var-som-emmc-sd-card-wm8731-concerto-board.dtb \
+	imx6ul-var-som-emmc-sd-card-concerto-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-concerto-board.dtb \
+	imx6ul-var-som-emmc-wifi-iw61x-concerto-board.dtb \
+	imx6ul-var-som-nand-sd-card-wm8731-concerto-board.dtb \
+	imx6ul-var-som-nand-sd-card-concerto-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-concerto-board.dtb \
+	imx6ul-var-som-nand-wifi-iw61x-concerto-board.dtb \
+	imx6ul-var-som-emmc-sd-card-wm8731-symphony-board.dtb \
+	imx6ul-var-som-emmc-sd-card-symphony-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ul-var-som-emmc-wifi-brcm-symphony-board.dtb \
+	imx6ul-var-som-emmc-wifi-iw61x-symphony-board.dtb \
+	imx6ul-var-som-nand-sd-card-wm8731-symphony-board.dtb \
+	imx6ul-var-som-nand-sd-card-symphony-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ul-var-som-nand-wifi-brcm-symphony-board.dtb \
+	imx6ul-var-som-nand-wifi-iw61x-symphony-board.dtb \
 	imx6ull-14x14-evk.dtb \
 	imx6ull-colibri-aster.dtb \
 	imx6ull-colibri-emmc-aster.dtb \
@@ -417,8 +447,68 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ull-uti260b.dtb \
 	imx6ull-var-som-concerto.dtb \
 	imx6ull-var-som-concerto-full.dtb \
+	imx6ull-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-sd-card-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-wifi-brcm-6ulcustomboard.dtb \
+	imx6ull-var-dart-emmc-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-sd-card-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-wifi-brcm-6ulcustomboard.dtb \
+	imx6ull-var-dart-nand-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ull-var-som-emmc-sd-card-wm8731-concerto-board.dtb \
+	imx6ull-var-som-emmc-sd-card-concerto-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-concerto-board.dtb \
+	imx6ull-var-som-emmc-wifi-iw61x-concerto-board.dtb \
+	imx6ull-var-som-nand-sd-card-wm8731-concerto-board.dtb \
+	imx6ull-var-som-nand-sd-card-concerto-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-concerto-board.dtb \
+	imx6ull-var-som-nand-wifi-iw61x-concerto-board.dtb \
+	imx6ull-var-som-emmc-sd-card-wm8731-symphony-board.dtb \
+	imx6ull-var-som-emmc-sd-card-symphony-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ull-var-som-emmc-wifi-brcm-symphony-board.dtb \
+	imx6ull-var-som-emmc-wifi-iw61x-symphony-board.dtb \
+	imx6ull-var-som-nand-sd-card-wm8731-symphony-board.dtb \
+	imx6ull-var-som-nand-sd-card-symphony-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ull-var-som-nand-wifi-brcm-symphony-board.dtb \
+	imx6ull-var-som-nand-wifi-iw61x-symphony-board.dtb \
 	imx6ulz-14x14-evk.dtb \
-	imx6ulz-bsh-smm-m2.dtb
+	imx6ulz-bsh-smm-m2.dtb \
+	imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dtb \
+	imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dtb \
+	imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dtb \
+	imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dtb \
+	imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dtb \
+	imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dtb \
+	imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dtb \
+	imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dtb \
+	imx6ulz-var-som-emmc-sd-card-concerto-board.dtb \
+	imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dtb \
+	imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dtb \
+	imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dtb \
+	imx6ulz-var-som-nand-sd-card-concerto-board.dtb \
+	imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dtb \
+	imx6ulz-var-som-nand-wifi-brcm-concerto-board.dtb \
+	imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dtb \
+	imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dtb \
+	imx6ulz-var-som-emmc-sd-card-symphony-board.dtb \
+	imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dtb \
+	imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dtb \
+	imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dtb \
+	imx6ulz-var-som-nand-sd-card-symphony-board.dtb \
+	imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dtb \
+	imx6ulz-var-som-nand-wifi-brcm-symphony-board.dtb \
+	imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dtb
 
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
-- 
2.47.3


