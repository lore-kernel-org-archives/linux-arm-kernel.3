Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336CFC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQnvaHgupyGQPniAuZ9m3sJLh0U25N0HAPnxpHfI//A=; b=K5/h71SmFh0G9C2SrgfLIs7FHQ
	BulG0En/Al/Vx3gtfwfPja4iPnjOUvPmhgvtV6dHAsHpeGQ8QzOmN0P5LWeEeovYVvfUqhegTsgIU
	ssBt7PhncjXmhGA44cBLDMV23PlVDHwTnuNlqLXXWDtTJGyjM8oYaXdaMLMSFpzUV7i2X4x5vZGAa
	SDTvwT4YsNdim/SkZ0DVea5GrDrmxOzpMNbsEbmZZyuio4L9s+X1YGvtAZFWihq2+0xQ6IN8GYAfB
	9tObVxsS66LSj11rv32iiqxLfF9Du6svsvlQCgc9de9XtCEk1bVODPJ7wWWMkmp0HVeVKUXqxyFOD
	ZWyL6hgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpy-0000000FuoF-1wNi;
	Fri, 24 Jul 2026 09:04:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBpR-0000000FuDh-2fgb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:04:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so1542145e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 02:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784883864; x=1785488664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HQnvaHgupyGQPniAuZ9m3sJLh0U25N0HAPnxpHfI//A=;
        b=DMoGRZEmk527PIfpMbhPzZNwhPdnc01N7n+5k5GWZDPnXf3rhe48XfD7Q/G6qXTIRN
         Tn/ztf9/IsEhkyATGZfnoQfGrW6AAE+WJQyNraftTJukc5wb6+RwjyRKeMbffSMLn2Na
         FEvvmnkt1Sb7DBPGQhdCiKKjCtSq0Rj3AB3iDTfqM8x8GS3SMJMf44qq/DTx+MUXgquR
         83UwAGW1VuSKFKEOvzx0P+UepQq7hUY4+aggm2MIiCyS8YrogzQ0pi//4lXIbFj4n0ro
         knIaDKKf3GMGr5Vbi/sP5mEs2RmHGCORBI+/WWNVYS2glOS6x6TUxjNPNm9C0CtSaaOX
         b/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883864; x=1785488664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HQnvaHgupyGQPniAuZ9m3sJLh0U25N0HAPnxpHfI//A=;
        b=PgqZDuP/SlfbsudFqaOkgrLnc92hPQ/icId9lsIk/V7ZjIMaO3Cqetp+Yswgn6+NWr
         BmPZmJTDk5SWRtkNbogO9rGMD+ecZ4FUFqhv/gxG8iLRR+csrU5tUrPwadscPoJ/Vf3W
         NhEj1DzHiJZorf6ZSyJuvfK89pwc0PkLUZiS+2qOI8RdcwuhtgCHe2cGPtH6flZHz+rd
         23BA3q45Q/0CbsQZDxKUCtfcemT2MLxJSVYAe4TCmqfbLLLKvijt+m4BZrTaJii133Bq
         Ral1B7N34j1BbGjGrFRojajD0xD/g8D5zF3FUdRT0Wivs4Z8M/Cb6AZmu+yx+LcAh0La
         DMqg==
X-Gm-Message-State: AOJu0YxbdlzSmUlH4pRAcpKyDDTUMEKpqGS3yh9AIJd4YIiif45UuFun
	/c9iyzOKOez1Ux+j0jN11Rq3MWyzUJ8THR69BOTmEBzkeFQ/iTaR5SRJzebr3tr/hCQ=
X-Gm-Gg: AR+sD138YZ1fBSVIB/7leXBKou484aStlaOZqDb9VqZh+n2xsQWIIkvzdZnHp0mJfOs
	S8gB0bOa3LWAAT66Q82EZCRdQk+hwMhNktEsGxo3tEg2yPguRPe3I5mIWqHy2UsBGH/umlyB8ik
	CdmU5cdtGIDhOyI733rzrEQJaB13AfwzTuJGGOLxEI8mTPNBfhqMu9qgt2ltM7qPCQSBBJTf8S6
	TWKNmLhGcPEtAm3CSkPpOouXmffAlv0eIjG9xTK20t7at1Wch3vWJ4+GG3RVy4WC0Irv4Hj2AYT
	XJtwjO/6lJ2KH9E0S/R9oBibkc+HSa4xkca4ow1VMWIWPzQWSga4SrIbclS7xA8H+Ssv1S3TRTK
	sVFvx0wo2dRAuyBURkvGGLNTAHYXp4mQWxLONyDk3zjYhBMrAIIkcwpz7E5vDQ3KVLH/d19DdON
	nKSOAh/2AU7Ic=
X-Received: by 2002:a05:600c:1f92:b0:495:4c62:9d43 with SMTP id 5b1f17b1804b1-49573d1ff7bmr72020495e9.34.1784883863694;
        Fri, 24 Jul 2026 02:04:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e584:93af:f3aa:2c19])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4957af6b049sm62081735e9.6.2026.07.24.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:04:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 24 Jul 2026 11:03:57 +0200
Subject: [PATCH v2 6/7] clk: tegra: clean-up simple provider misuse of the
 consumer API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-clk-provider-simple-clean-v2-6-56f306156d25@baylibre.com>
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=avXrZ+5B5tjwtUKvf/CVoHvEaPEqaWPpS7ZwUFxswLY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqYyqC3CQlE9ZZIVg5FO31DSHE8VYccHPXetZHC
 CBbG7T1HaCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCamMqggAKCRDm/A8cN/La
 hdLjEACXqz7q4lL8DurbW6pS/HNGz1tLg+/2ZSOd2a7o3s1z2YOBOJHX5vpJFLW/nIYJQw5So1e
 bjWoWmm6BY5JCwtK8uqJ2bemWRXcpKLvIlUZY0FVmgQESFPtFI6OdwKwVPkWbdp0eS6LCSh/q6G
 JuMStoA3PBKgBu53Ve6ciKUHdiiBoMmgvHq0BSCaqIGndaJkgfdg4XuoiI/jJm6AzgtMB/1nUqs
 jbtnez8Ei4l7beEGIPt0nkoY3Nkfb+0yB+/jwtJ6N0qPr6whsRWIHOAdwMqA8Iq1+REmschxKZG
 rXPy0b12PE93ipjZMtunqFaT6XGz/iBiZRfZ1C5sGRIKSwh58YEZyIJDtz4lXRKejKn9ziciY/R
 JzXZTezQ7P2U3Wzw8rE957D+tus8PvY0lrAY8jzO6MQ6Xm9T7WbR6OP7GtkdQMOKn0NLEShvhbe
 oVzeAVhbWJXuikQDeKeq6wN+DATSFxT/BCw9z1g0PPQ4DuJoYiOXw0DbuoIL/1ar9IvnWpzAWzv
 +YYi227ullORrzbQ225A5CHiau0GS0MokdcCulaJSeznIQwGVMkbJy6v0tlxRii8q2Qtb9CCoQI
 rqGyS2+E25eCLne9dNnKOrjnKPB1NUFEawcRFsnJ1o1K+N0G+eiJ5YPh5DcnSVvF1h1Kl0VzA/E
 k1+4dgdZ/1iNGHQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_020425_699646_9274C039 
X-CRM114-Status: GOOD (  11.88  )
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

Clock provider should not be using the consumer interface.
In other words, a provider should not be dealing with struct clk.

This change targets occurrences for which the provider uses the
consumer interface and corresponding clk_hw interface exist.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/tegra/clk-tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 0c86cff719e3..df1d7b471745 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1460,7 +1460,7 @@ static int tegra210_pllx_dyn_ramp(struct tegra_clk_pll *pllx,
 	udelay(1);
 
 	pr_debug("%s: dynamic ramp to m = %u n = %u p = %u, Fout = %lu kHz\n",
-		 __clk_get_name(pllx->hw.clk), cfg->m, cfg->n, cfg->p,
+		 clk_hw_get_name(&pllx->hw), cfg->m, cfg->n, cfg->p,
 		 cfg->input_rate / cfg->m * cfg->n /
 		 pllx->params->pdiv_tohw[cfg->p].pdiv / 1000);
 

-- 
2.47.3


