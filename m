Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13648C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wMxlB9MZ68orKi/UWzRs6IFytl0SMGxxkXzUhmjEdQ=; b=VGsKd+hpLNIbGqEqCcnUJ7NYMM
	tSTRx6U+M/1j+mMeqddN2HZVA6uV/Cwan2ubi2Ofds+l8M88qB6fVvVGTMb9UNddEIpGoUsNGF6fO
	vAgGMLwAmoH2vRcRpFJKIEgEeLL4ynN0aK9dnCwS+FpNfXZ8boNjmBQNgiKr6OXqVqV3L92jYTamh
	3PZzrgdnZfPsKvgqEAHraYVWGlSDJVbd8zPvaD5zfx5O52FOUR1GRtNHIMVeGRIwbdXQLICNoYO/Y
	REm6fFxaWkZk7xHM9Jc20IQ09NFPelpsKEViTIm7CkY8rLH+2nmIGCKPWXZbZ4/vYxp4HMWFmM3aW
	5aeZfJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Q3-0000000DPxq-3Zyv;
	Fri, 11 Jul 2025 01:19:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyYc-0000000D2Mg-11E8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6wMxlB9MZ68orKi/UWzRs6IFytl0SMGxxkXzUhmjEdQ=;
	b=JwyYJCYxHcFnZn137hbgyzP8NXtUc0lN7VdqaVzb9WGmhba/V41jGLmEWHOk0Fy8beJFeQ
	y+SbeaX0BtgxbuAz36JRPY+5HF137gOJWdKREoTVCYPYhccjdpjoYFY+VCVqQ//z2H1Aic
	5i2E+jlPzqUR6i9XzCtyLbr/q0S0T7s=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-lZJsMleuMmCCN9uOqkNmug-1; Thu, 10 Jul 2025 17:11:46 -0400
X-MC-Unique: lZJsMleuMmCCN9uOqkNmug-1
X-Mimecast-MFC-AGG-ID: lZJsMleuMmCCN9uOqkNmug_1752181905
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2363bb41664so11604385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181905; x=1752786705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wMxlB9MZ68orKi/UWzRs6IFytl0SMGxxkXzUhmjEdQ=;
        b=MyrwDl+ck2qCN8xi2EEEsxNlRuN+ryi5loNtGZgPp1II1l7n+6pXVyqg5PauHmv6I8
         /wY1Llw6Dc0Uv3cc8koiwCpetHTkoaF1LhsXhY2GXAA5lyJLHFtuz7O4M1Zuu5ehm1vP
         KzVDwsTbQXOK+dSLPrW+tnaSEBvDqaFo49Uy907/5TNbUs36qaAU4rMSW8zlm9o/priE
         TUzO5+DlZuXU5E3A2FbVeYx5NFbhECCve4CJmsSHaehMwgPeA+MQeH2mGetDrtnRFM2V
         GhUUz+iQssSw9LncHNUM4ESY5285nlX3tCpTtc1SDgspIPlh9PNzC/f1lpdwFTa8O6GD
         sH/w==
X-Forwarded-Encrypted: i=1; AJvYcCWDx4rhr5vdvrfjjZjf5ql4y0kdDPXV5Os9b0LbXcBHxmpEhVlC3HHQftdvsM787+7fVuvwBeC6F6hB80Nta9rE@lists.infradead.org
X-Gm-Message-State: AOJu0Yysnkqc26LzNdTgw5YdD4W8WeJUz5gGsw9oE4Kr2QiVmBRvZMc0
	AkpuectYKj/uCp3nJ5DrPqtV6kBvx7XKY8DmG8c+swT/0hF2kj5i43bfX8QYHNGE6KX4NlPA76m
	6VMSKN/VbBzodAhqValDH6CyN+jHRZSGZPnAw1Jm/o191nxpZE8Xv6zIFTlOW6Q+jWQp94M0l17
	5f
X-Gm-Gg: ASbGnctaXMBUXoSfr2uhq23sbH9F3Iby43HXOCJIZjix8udYavzakJ1znl6O/TlN0Bc
	uvUXXcoWXxjlsdmN4Qz+wfaQXroWwmMlTWNOYIIoE5Dq8B4A+X9Fl2UdxY30sJ/U19YfoMABjgm
	eFR5pOiWL34i521Vbk7jHZwA+vm+QHZIO6LgVlTg8E/5QzZp1yluMTOTyNFDcZYICc1rWJueIy4
	AJhuVZ+1CdX2x1sKVHgNEYKP470rmeI9UIuFBnZAiOij8JpioEZ2/hfclgxRz5qAAzFjfMv38Sl
	9aKrABE+rrMaddLsd8PKgy3nK+5FrEKRMjlCagTsDE6lUw==
X-Received: by 2002:a17:903:2286:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23dede5b1camr9198115ad.17.1752181905396;
        Thu, 10 Jul 2025 14:11:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGroYVRzkeih8y5j6Ie9SEEmZ3kfxnIjBvUsUsEOP6IfwHOfSj6KsTc2VE9xDkcqDujs4HIQ==
X-Received: by 2002:a17:903:2286:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23dede5b1camr9197865ad.17.1752181904996;
        Thu, 10 Jul 2025 14:11:44 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:40 -0400
Subject: [PATCH 08/13] clk: imx: pfd: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-8-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1703;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Z9Uj9Ryz7NpcBIB9QkaT0/fa95nPsbwVCXock5kE31I=;
 b=+e2l99hJrkomUi1x/QO1jHP0TlIqBGTOsAEf4gqKRSSSU7Bv5oOTumLrGf/XmrQ4c+hLQ7k7v
 OvjZou/OgaEDDrvA/1mdGibI94pnaOY+YblxFxdbczcHsxklPFhyqzb
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7MXkQAN-NBUHrV_MX_w6L7Vrw04Uq61suRz-YgLLEL4_1752181905
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141154_357968_62CA90BF 
X-CRM114-Status: GOOD (  13.11  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pfd.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-pfd.c b/drivers/clk/imx/clk-pfd.c
index 5cf0149dfa15aab8b4cee47c8120753e3df45dac..31220fa7882b601f3535ad125114dba1eec95a9f 100644
--- a/drivers/clk/imx/clk-pfd.c
+++ b/drivers/clk/imx/clk-pfd.c
@@ -62,24 +62,26 @@ static unsigned long clk_pfd_recalc_rate(struct clk_hw *hw,
 	return tmp;
 }
 
-static long clk_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int clk_pfd_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
-	u64 tmp = *prate;
+	u64 tmp = req->best_parent_rate;
 	u8 frac;
 
-	tmp = tmp * 18 + rate / 2;
-	do_div(tmp, rate);
+	tmp = tmp * 18 + req->rate / 2;
+	do_div(tmp, req->rate);
 	frac = tmp;
 	if (frac < 12)
 		frac = 12;
 	else if (frac > 35)
 		frac = 35;
-	tmp = *prate;
+	tmp = req->best_parent_rate;
 	tmp *= 18;
 	do_div(tmp, frac);
 
-	return tmp;
+	req->rate = tmp;
+
+	return 0;
 }
 
 static int clk_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -117,7 +119,7 @@ static const struct clk_ops clk_pfd_ops = {
 	.enable		= clk_pfd_enable,
 	.disable	= clk_pfd_disable,
 	.recalc_rate	= clk_pfd_recalc_rate,
-	.round_rate	= clk_pfd_round_rate,
+	.determine_rate = clk_pfd_determine_rate,
 	.set_rate	= clk_pfd_set_rate,
 	.is_enabled     = clk_pfd_is_enabled,
 };

-- 
2.50.0


