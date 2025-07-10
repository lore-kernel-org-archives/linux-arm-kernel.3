Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B834C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9YYJnViVPsfsEHtGb8q9J3Ez0LAkx4ujbOCWXp+c2w=; b=02D6QS4Zborhvb3kFS7gk8JkQz
	gGe5+pZeqn53X75Rd7q/nXi2aFd0u7dl12j7iBwqAOV13fUFmMnt/azaXh9jkg4gEOaKrsyHo/Pmy
	oxZtbxstdefpHKayNW7VwqvBE6DnYapv/aHloaspu2fApn1DHFmnh6XCZj6lX0QnW54zVIe6lenGR
	nL+QsyLQRlV6Xj4yr+WakFIpuY/JHiDMbMRlp3eDNbUIIg1jbJR7NOUdAcVGseDo5cq39PNXLKlRU
	HHSkg9YuGck3wZTDeVUlMriRfAFHTb3PO5oJH3kr9ABt+gK88b5//Y0QGAOsuTlaIxyZrW6GRis+w
	8CD4oYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Pz-0000000DPug-1NC1;
	Fri, 11 Jul 2025 01:19:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyY2-0000000D2Dk-3YMv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9YYJnViVPsfsEHtGb8q9J3Ez0LAkx4ujbOCWXp+c2w=;
	b=U1cZ1/Ka/5DtHGHJdDQgO929F9S/0qcyzKR0ROcM/hrJZlBpXvaibEa8hp6ujy4zGmkaqV
	14nO4T31dF8v8qkPrAUu0omJVzEAPuPKCeeEmS+oXKhUsmgkCoT44HejEuDBApFUHcxfTc
	ddw03XhZZ6Ox7f8an1cIM21cvLrE0OU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-2rjadIbBOb2H0550TzSdtg-1; Thu, 10 Jul 2025 17:11:16 -0400
X-MC-Unique: 2rjadIbBOb2H0550TzSdtg-1
X-Mimecast-MFC-AGG-ID: 2rjadIbBOb2H0550TzSdtg_1752181875
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23689228a7fso20490635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181875; x=1752786675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9YYJnViVPsfsEHtGb8q9J3Ez0LAkx4ujbOCWXp+c2w=;
        b=jpm+XYcD5LYiv9qjdR3IsVj833ILIUK5FQZ4mJ4JAl3RIAQYLXbHIMxXxtXC9yzEG1
         HVRbD9T9AfdUUJOWA9D2auwyyqUn44hSWEo0vE536Q/cIg9VVfad84K9Wql/hVqnHKLe
         AG8A5Qp87vkq9MlWWsad6osaq64ckBEOkgO1Mkpd7eq4ha3zBwGr1CLTJwFUrx/qnSBC
         z1Z7Qe2QWwyphtyFW7rQMqUAhowxoarng32hRccApF5dFKD+R2ZjuTTrCM2rgxEZhjp/
         4cIqQpEImsKy7Pr59GKLJ1zVvt959DD0VfxgKCvjEFZhp5bvjM1DHYTN9PKWv7dfZ6dg
         JJQg==
X-Forwarded-Encrypted: i=1; AJvYcCUCowDQvaq9Bq1/172lUjV5PZ4F2Q1bSBRN6yLdGDfoOypTElXZo+Do0YymqSdWi6L2vTytu+xO13IsQXFDB3MV@lists.infradead.org
X-Gm-Message-State: AOJu0YzwvOBhJ8FFKA7kvt/z6az4x8PK+G9kLjTgrRyIUoSNPtwDv4pU
	lz379pcQQPQ1NeI5jLWZsfQj5EN6/UCSlcw7359lZ9eIy+uIALW9iGLHFRJOAE1ZgR2IMH5Hamy
	3iRcArzXHWHTubtMUjZ1YMBhmTs4QkpzrBFGoHAIpoAIXpWeB86X9v5yPkce1O23sd5A7/1ef71
	sx
X-Gm-Gg: ASbGncv3PlqsBfg0iQD1jWWl3Du4KYTl9CQ3956InXDp7FSfpTJjX5EhyDUaHXfpV2e
	02sM+7XLfQYJ8Qi1vknR+QAs25WgONitt2l8bRntP5OzUWnc/un4loc+QbCIaLaF6jNvjQFqeNk
	LqKcpVVHjSiErgjMx9TeG+H0Da2zCv3IKymNbptjYyXsV2ZLErx5UeLCa0EHdFNiSsnIu6WJ+cS
	PeCIMWQL+f3Y1z6Jjea9kcSXXwC05nfyFbLg1VJBRYRAKMzZRKR11ObH2zjKRPE48sAkt2EbxsK
	bsiepKnz7RsOSsn8HIPG+Garb2FtdVjxZqB6nDmXOtPfaA==
X-Received: by 2002:a17:902:eccb:b0:234:e8db:432d with SMTP id d9443c01a7336-23dede8d53bmr10041925ad.39.1752181875440;
        Thu, 10 Jul 2025 14:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtPLby5dImEh4am3XdyrII2Yntq//gK06C7azIRRxqBEH0aY25p3N3xI1B7mTgwV0/nXxQcw==
X-Received: by 2002:a17:902:eccb:b0:234:e8db:432d with SMTP id d9443c01a7336-23dede8d53bmr10041625ad.39.1752181875042;
        Thu, 10 Jul 2025 14:11:15 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:14 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:33 -0400
Subject: [PATCH 01/13] clk: imx: composite-8m: remove round_rate() in favor
 of determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-1-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1717;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sfg1D1VawT3AeNVMpNc6Mus+O16Hxr+I3BmqtW+ekY0=;
 b=Blg+J8i6MkcMkoaGUje1wzbwYgk1ZyPQvX73Fwg8TLuepmHSDlLAj0LMghIN3/KasFrhpihnH
 tnb3i6CqC7/DhjkxxkVAc+yA7mEN3HuU1bi2XXgEYAMrcDuURfTP3dC
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l8mqQBeEicMulejcWFLrvg5zIBDmvMc5Ea4cWC4PYgs_1752181875
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141118_959896_BE8DD1A7 
X-CRM114-Status: GOOD (  11.17  )
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

This driver implements both the determine_rate() and round_rate() clk
ops, and the round_rate() clk ops is deprecated. When both are defined,
clk_core_determine_round_nolock() from the clk core will only use the
determine_rate() clk ops, so let's remove the round_rate() clk ops since
it's unused.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-composite-8m.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
index f187582ba49196e3cee2b5dbaba9bdd9b091bb40..1467d0a1b9341bc4b0a40591bca00392eabf7cfb 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -73,21 +73,6 @@ static int imx8m_clk_composite_compute_dividers(unsigned long rate,
 	return ret;
 }
 
-static long imx8m_clk_composite_divider_round_rate(struct clk_hw *hw,
-						unsigned long rate,
-						unsigned long *prate)
-{
-	int prediv_value;
-	int div_value;
-
-	imx8m_clk_composite_compute_dividers(rate, *prate,
-						&prediv_value, &div_value);
-	rate = DIV_ROUND_UP(*prate, prediv_value);
-
-	return DIV_ROUND_UP(rate, div_value);
-
-}
-
 static int imx8m_clk_composite_divider_set_rate(struct clk_hw *hw,
 					unsigned long rate,
 					unsigned long parent_rate)
@@ -153,7 +138,6 @@ static int imx8m_divider_determine_rate(struct clk_hw *hw,
 
 static const struct clk_ops imx8m_clk_composite_divider_ops = {
 	.recalc_rate = imx8m_clk_composite_divider_recalc_rate,
-	.round_rate = imx8m_clk_composite_divider_round_rate,
 	.set_rate = imx8m_clk_composite_divider_set_rate,
 	.determine_rate = imx8m_divider_determine_rate,
 };

-- 
2.50.0


