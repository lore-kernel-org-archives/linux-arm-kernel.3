Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24730C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 10:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MsMdfp1xLANBZ9zZyNzSawqjnpLS694AVKVdRY29N0=; b=R0aA1pJt28yJuA+DITNzbeGvFe
	O+iu9Veeo11Dspm4xYVAn1itmuhu1BN11ny8O8a3fI5TwRuEbkkrEWcecukQavS/0PWT4sSvG8/Vx
	RfN4FoIV/cj0vU/8du4UebW5mV0RbrO8j+bn1HPgvxynUCmWrm3tlt+6LAUfSxvMQibU5A//KykxF
	hIDombovwVtDxGZWNisBhyZ+9Bji+4uy1ptEqnBSO5KN7PKCAzXLFMLbFjP9KfIFK1wEUMN6zngN1
	P8mSp+kktgFSOVkC8e6PR/0+8l1PKoUX4lgwFS34kaRN66BE/HYdJwFM5G3vlJMuaYzfqdqTM7KNr
	1vfDX6JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetCC-00000007CqO-37NV;
	Thu, 24 Jul 2025 10:29:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesC4-000000071mC-2uwh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 09:24:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4560d176f97so7991245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 02:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349091; x=1753953891; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MsMdfp1xLANBZ9zZyNzSawqjnpLS694AVKVdRY29N0=;
        b=mnznJcxENp66ObG8NOnuUy/tpHlA98AdEOx5K971PZ5ANOonB7pWFHWv8msDospdI3
         vvZY8AoFWsQb7H3DQ3FcyzDYWOm84jW/AEhV7CXv5eGTw4mYCovj4k4uo6t3cvblHLRd
         jlp/8us58iQoDk7aGUIDEzqM7YENfBtgUZrYldqGvY997jAag1Tqe7ib0QQGbBJ8VNoy
         w/CEqn+vb9+iFbQvq8PR8Pv/Rm0Q3CRMUOaZeHCbEKA6TvqAgTVkt77k0g2CPAgAIkmJ
         jg3N0pku2meLtb/gIxabWr1QmI+LySYuXDE8ib0lwj/9HV7vo1LbgqsaPT1ivxmLk6S3
         4XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349091; x=1753953891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MsMdfp1xLANBZ9zZyNzSawqjnpLS694AVKVdRY29N0=;
        b=H+vlEGV9E1c94b6P+BzwlvXKANusjN6GlEjJE0YnFsOWfgBPqHSgdMRGl6mm1KjdDB
         UePQ7tZn3ik+RuIsPD/w9qrN1B8K1r8JTIVoRBuC+B+DPMplz55VBiGR62+/oM5iSIsJ
         ktGE/cxnuiWbnMZCL8Qa/huCiuF/9pTpK3GE/7/4oY/WzMdYbSdvPvhowmEo3mlFbRSJ
         zvgIDGblmrvF+eI9MLEQ4PVy/ObtCPeDxoTd6XWgeaO3aGdFWfuUiOUGVsp+Qx7zNEWM
         wt1FlKbVVqgsMDMUDjAbXS1JH6/eojfXPg+ge0kHdjO2SgZLxcHoQiwPR/no6RjzMnN0
         iDvg==
X-Forwarded-Encrypted: i=1; AJvYcCUL46JJmEGqZEUIc74w1fS1U34OfZcVlOOVoV/kJDoDMcK1q2HG/OSjWxVpGVdlNt/MEwQvWfesmlkPWFrbDLlO@lists.infradead.org
X-Gm-Message-State: AOJu0YxrMiHlNtMPkjUA9N0V4dFsduzQVoHF0ZdF56ZS/L9hW5ZwaHeF
	KEExWwHDlDDJgRKdIqVuKd0C7Hz/r5cYVTaS/13z9xGK9TG2aOc4BoLjf2Nl8JF1aOo=
X-Gm-Gg: ASbGncsPJAwNc5h+oDhXRzAQOLQd8Qnj3eFOOsBv3M4SLagKBh0ZVDHLttyjNsR90el
	5JEhWpFIkCpK7+vdEGUqKNSjKYZ76xv5jYMELibXktVhiUR2akW9rscpgqeLWpcEMyZRr6SUobf
	HZg71RQD8gPYYXS0Ap9nD6Mpqsxsmg81xbSiKc+pR8N6T8lqvFlmJbQ2fXOx+uf3f3OgH9OmYWM
	oozYilnlNp2teMxGyzqdG97lL6WsonjkevmIbtSuNYMNSl3dVcNaB04bonZG/vW05tGgXhlpRHb
	77/lNiZyMzedbvEu2eVb+CHnl1rSL5lhxpbYzUnok6oD4A8nD/s4+sS3MQQFi5nbPTRIBupPy1O
	ynCLx5BCj8QWnEMIx
X-Google-Smtp-Source: AGHT+IHqZ4KWF33bsWYC2NW13yLlFkOEfEwZMRqVsz0fuagNkHT/q0mO1E6+Gg7Jfa3lxSFmodfKew==
X-Received: by 2002:a05:600c:35ca:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-45868d4f48bmr61519195e9.30.1753349090293;
        Thu, 24 Jul 2025 02:24:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:35 +0200
Subject: [PATCH v3 07/15] pinctrl: keembay: release allocated memory in
 detach path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-7-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1780;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LKTpseRfAo7ye04iddOGWjUFjvvauRYDbdYlMpOMyLY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvSbjubxQ38F8ud5iCpNZ72Jm7IAoCj4lWgs
 6LniCl93ieJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70gAKCRARpy6gFHHX
 ch2CEADZjtdeLp35/fl14l9PQNJfmIbBfcUfYvyfA8t1LHfkmxLnRbErjq5eCVle+l5pe5R1BIn
 +X7gAAsSmm4v45lpL1ifrTXzAR7JcqsNbP0LtwqYSS4T7QPIPf7CtoZVhbHNjtKwLxhGF3P2JUT
 AdjounHFm3XKuKN29lK8QJ+FG0/OLUKPNc9HitRMm3XzO2nU8ilJ70+JnwJQZflutclz3OSvBxw
 WqkTLsIrsAiQB2n5Qpl5NDbIKMakIsw2cCfwyDfVPgUM9DTEbj8g9OjCakwq20up2vaVR2NwSvC
 ZUtq3k8Y6wWhqFR27KGwVPwfv8HIaqFEGGne/Tgpdz9o2yYU43x2jurLX0I7211S+r4oMERgXum
 fFMpJLG5QrteGGsb5MWK59iQtPyEgVfHlIaQ3KQbLi/DdqbqrMSorxafyVr+zb0dThp5gxoicfu
 h117nhV3u3ekRyFApUHBpQfA+qfmNBltfqn+M40vyVVFXVOa2tESEAtfwLmSloO/dbveOYt8RLI
 Bj1dwxB84ZzCL2A3uU8R8UZwWHLaGeHi7RG+LKGo5qu/P+loVUEwBcx+DPiWi1wI2VU1bscLdUr
 2Q5DBSjVjYTXTfG4AJcen4wRUeC4rTi2BsDO70f2fHyhfmt1IEfYz/A322grH6bledRd46/o8vI
 JGEI+5r6wD3CF8Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_022452_755186_472EFC08 
X-CRM114-Status: GOOD (  15.56  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unlike all the other allocations in this driver, the memory for storing
the pin function descriptions allocated with kcalloc() and later resized
with krealloc() is never freed. Use devres like elsewhere to handle
that.

Note: the logic in this module is pretty convoluted and could probably
use some revisiting, we should probably be able to calculate the exact
amount of memory needed in advance or even skip the allocation
alltogether and just add each function to the radix tree separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 30e641571cfe5396075cb28febd2d0776326365d..b4c7b3ef79e0a34111f46f23adfee4c269e5be6e 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1603,7 +1603,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	 * being part of 8 (hw maximum) globally unique muxes.
 	 */
 	kpc->nfuncs = 0;
-	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
+	keembay_funcs = devm_kcalloc(kpc->dev, kpc->npins * 8,
+				     sizeof(*keembay_funcs), GFP_KERNEL);
 	if (!keembay_funcs)
 		return -ENOMEM;
 
@@ -1634,7 +1635,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	}
 
 	/* Reallocate memory based on actual number of functions */
-	new_funcs = krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
+	new_funcs = devm_krealloc(kpc->dev, keembay_funcs,
+				  kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
 	if (!new_funcs) {
 		kfree(keembay_funcs);
 		return -ENOMEM;

-- 
2.48.1


