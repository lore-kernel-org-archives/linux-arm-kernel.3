Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E5ACD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 22:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=; b=sPe3VJZBUSbRL8sLIfMlUJYVd1
	59WvwD5x9bZNMiDVCgtKcRzW1Myxh1yLtwYaaSkB3uCYp++s1Wgn59OSvr7cEbnNeN9FaVb6CsO26
	ONaHpJfBuS75pZ2t1BCOVOPoj6+Mc+LQB4W7aggYhyeSXM27n9/yx13vg38z4bAVtJnIOWBb3jF9l
	TdMCrwLs9H7H4hqxLbiLCqgVGdqUVUxW1nRMpLOQRcngidI7hHXi2wx7MniU7Mh3lB8A/m0hAvWZj
	kGA+O54Tei4IxtscWfh96wX5IqIolEoR8ADD/hsLAHzdV3kLuVSA+5FurNdbA4WVrckPVKaLjMfpi
	0nxCBGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJA-0000000Bwz9-1lgO;
	Fri, 22 May 2026 21:21:28 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJ1-0000000Bwrv-2Tfh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49048e043e5so5874515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484878; x=1780089678; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=oV/9fB/HkKmOmPnDm7qDZuMZYP6U+RtymIEwCNsb2CRDheZc80bul7ER7LZrGmL5vR
         KH5GxADrlcHCwJGNUXQ+9pvr/DLwkHQB3jCBRm/Ca+MIVZm1dGGUbaMsWRpP9XdL4mxP
         3EuC6nzqs6RhP5gJUJOS1vsjizqQUbubCIAPjBQGAystviZfFWxF8rJbG48Al5z+NFNe
         Gapzj1NkBDZsMEoI8GDgckv6bOX8iYVqri38rXJ14ERF2gBlnMRT1Z31kSmgN7r7fQQb
         VlA6uKPw+f/Y5qcg8VYB+CYXSdRhoJIQg/QcpSUkW1LQUeD4SjDw7ILxScvZIL9qZi3i
         sDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484878; x=1780089678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/JC/lCvJB29DmlH+qRhnlQ7JKVcjCcbMoFC+b+6/88=;
        b=QNwDKcuxtU3Aw6J+SPFqMVx8IpM30/YzEuDb1xOOYDozbxCsOP7PLkkFAhi4wHxzlE
         Qo/L/2u4jHU3r+p1hJTqd2OyBl7ok+bPlS5RaQ1dFoArRcroHIWj1gNWZUdaj+WXKvfT
         tCJvEy2KO4k2FK7gAJE6/BEPeKzy43GSPcdo7KsjOh43zdAFucSgj+S9TkmONmTYTfZH
         25Sfr2znXllYd+9LXLUu4ejS5I3y65vVbAHWwZEOkfkz+gafXzkKTNLjkgkecma0KoP3
         QiUEZK44nfAXZcnVR6nM+0ckUFKVIQUmG3ly1FTA6WmlZ3pWZKz/icyY2eEiodSKf5oy
         pcXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n4u2DYRhksNL/m8YYBi1d/9hJZC1+8XqvBFMTqzsw6lhWGcXrxAgw+6iHVd61caGc6yJHwIP915gCZykYTtse@lists.infradead.org
X-Gm-Message-State: AOJu0YwzdQONgq59miTje36LelMF6mBViKcVKUpRwk2Ezy1omEGpjF+q
	xvlsc0RNpVTJQwjRo83SA8MT0J7baga3LV/FRe4wz23WOixy4ZiEyX306n3N6jTiEUI=
X-Gm-Gg: Acq92OG/MILAUOJybvPbgTWrEeRCp58K3RXaLMupDdR+Wm+J+L0+VRyvWwvH8QDnjnj
	w1dcMbL0F737YBhLh+DwDzi2LLwkJpUQtMbAqr/3QJaIaANqRtfpqxPGQC6QbMdtiiH/4T3taMY
	0Rz9RM39nK6T1Lt0eFZTK7X6omPpRphZPHFfnmNgisBsQDYiY3hnrm05jUyDEx17ng7rQAfVrZW
	DDZOtl4v6+Yly07bk/bYqZiusGqKdOD1KMjKvdATAJS04wwTVt1oLJAwEAoHVrQBkjkkgT1UubT
	3ScQ1sZn6GXXSkuV/ZMbJ+CfowpkNguOMdkNe1O0C1BLDxA7dzWy/oT6w46SuR9EjYwv2xE7jUf
	ik7ay6cn7F5Be5noeQijY9jVLsfyPfcYaRafbDXajPms5mLMAzX2AJ2AVYFOSlNA9DiRqlpjWGF
	QKRespjrUrtErTOb/Efo0BXJ7zKIV1gkU=
X-Received: by 2002:a05:600c:5298:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-490428dd523mr79562455e9.25.1779484877951;
        Fri, 22 May 2026 14:21:17 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:17 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:30 +0200
Subject: [PATCH v3 02/11] m68k: mcf5441x: add clock for DAC channel 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-2-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142119_647581_A5638E41 
X-CRM114-Status: GOOD (  10.59  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Add missing clock for mcf5441x DAC channel 1.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/coldfire/m5441x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 613b0275d9d8..5b5e09ecf487 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -44,6 +44,7 @@ DEFINE_CLK(0, "mcfpit.3", 35, MCF_BUSCLK);
 DEFINE_CLK(0, "mcfeport.0", 36, MCF_CLK);
 DEFINE_CLK(0, "mcfadc.0", 37, MCF_CLK);
 DEFINE_CLK(0, "mcfdac.0", 38, MCF_CLK);
+DEFINE_CLK(0, "mcfdac.1", 39, MCF_CLK);
 DEFINE_CLK(0, "mcfrtc.0", 42, MCF_CLK);
 DEFINE_CLK(0, "mcfsim.0", 43, MCF_CLK);
 DEFINE_CLK(0, "mcfusb-otg.0", 44, MCF_CLK);
@@ -106,6 +107,7 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
 	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),
@@ -176,6 +178,7 @@ static struct clk * const disable_clks[] __initconst = {
 	&__clk_0_35, /* pit.3 */
 	&__clk_0_37, /* adc */
 	&__clk_0_38, /* dac.0 */
+	&__clk_0_39, /* dac.1 */
 	&__clk_0_44, /* usb otg */
 	&__clk_0_45, /* usb host */
 	&__clk_0_47, /* ssi.0 */

-- 
2.54.0


