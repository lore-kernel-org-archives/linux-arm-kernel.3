Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9CACA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 22:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=; b=CykBEztX/Tz9azXqlvVpQGaqTo
	Rpf8Xy2Lee1mWvgmr8MTF/QDcYyTrGKPFTerZ+lWfbmV2B6weSdSC9WmxbrUdmUlhQLw2Nt8fwCx9
	CEVZTqI7/1w0ouwxV4YW+gt0ji6sbmwrAkLpNbyBgP54O80kWC+BVQq1bAhaIbaVQBK/Pli0WspC+
	NhuDQtQ4L3jMUr2Egwvb077G2FFkYPHsyfbV45OVY5vEonOaFjyeHKejhX/Ou/fa4ytppN1+a6re5
	TvcR/N0Fo2kcVbw09lS8PS4G9v4H40pxbrrBFStq9R1oS2U3jYIW8Mz1E2yWkOK9pHCZ02kbdJuT0
	QpA2QTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urkly-00000003S3t-3j2O;
	Thu, 28 Aug 2025 22:07:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf3A-00000002BLa-0mzp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:33 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so7081235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396830; x=1757001630; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=O2hVAUARNhbEI8q/FXlVkeDDBpQ9M95XRRsolMHPWUUVtXrOHTAm7a2NcZVLsMIyfw
         QwDBdz6OpQOt3fgdiZEs8ZcnwxR1p8l6nWKmI9IIIipMUQ3VMzTz+hRGNKmFbZIQ6yp3
         wWpXeMqGS09GV1zCaUp2ES49cjNDiIjIbu7in+JtEWlWly6tqyZySFy+VbZkDQNrcOVP
         5O5DNmu+no3T5WVbD0JiTvjilkgn9XIik5Kv3tnKLYTQc02LASVuvOKfguFjRHiM2a5S
         3YhifSkMQsPlheRGWWvOpxoZ9JJCXpCbcnRuiOhEPGCeVZPLz4EID+tqdsLdd1Jwo9ti
         QVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396830; x=1757001630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=EMsgVnS/HPVyzJi2GyOk04rA9w4NcRcFbc3GAN9jBvhGYulpqIzHWHt/W+hLSmgJnu
         qdd3P+iVj+MC8rZzPDfhQhl9VH2S6CdSJkrpGVFGwSISjbuelzhJcH8Lv1IbsQ1PH6wH
         oPWwYt4Fokk3Pp3Mxo2mxsNMT/z6kiVIDLcNI3EXyEz49oAqKG4zGr1Ux7jZnJRM7q8H
         f7UZQRsNTf2jxAF3aLkm3gIKsPf/m4bfxJYhCDU2cDjF12JJiGcdapIY9dmxJyWc0YGa
         Ux+5eYxqsJj1mZaipzgTdUPXfl0HoQZDhJuS1J4ZBneBKdB76xnXY8hJnd++PMSVhSza
         zBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXRCyjWsezvsT28tL6qcBNWXI6YZYZFyGqGjzmJnKe2HdNJC9g6BNYk88nJUyzQxeDJuv7BhDV7rJ10xySjhwM@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtd/QoOgcd8nZUWmk30Re6oqRXgN64xUWzdzdWQxkc3UpyvMbE
	Jhs3U8M97XkKdtcS9SQNVeHjlGSmvs8LGNIMNWcbky8SIqNIIiaCCj+D07rg23NQigQ=
X-Gm-Gg: ASbGncvuaZhl4cVYDHb1bwru2KVmsyxSJiIdfw8E/OE0G491/64CcMMR2Ztnsrmdpxt
	4zLmbMb9vKPRs27TPDTDAC4njYtaSG5ltu1ZBli8Ky2IxCl1ERo+caojyCf3u4boRPKUGhowkl2
	IWn8gayOgiGhwjjNv9kj2Q9ogwxmMltSfVFMiWLE0f0QKvTwPTigWfT7BSR/A76E40uku6jX79g
	wQQ38cPuxZcW/NRheeoZirmppnW/Vf0Lh5wd4OJeo4eEjXpkBMtOAJ6yenkH5CubDUK6z9YlCdH
	Fvoi2GpK785S968PJ7be/Lvdwe72S+wR4WcAnztBQKowOMq6n3xwpZ+RruqSAYsDTYmMgtV2ovE
	HP5CUiQwYlxcTZ8UkcQ==
X-Google-Smtp-Source: AGHT+IFFepUYI+bxIRTxDUeMnPHpoc8pmGJqVENaUjjXrMHXXy2WRVR0FTskPq39jX17KmytYEjexA==
X-Received: by 2002:a05:600c:3b04:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-45b517e9d34mr225147805e9.30.1756396830367;
        Thu, 28 Aug 2025 09:00:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:15 +0200
Subject: [PATCH v6 07/15] pinctrl: keembay: release allocated memory in
 detach path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-7-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qPaUa8oAewMMgl8vCYU8JU6h4WrDoK89nonD2PTBKh4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0OrC02A7A3w/syOmHWmFD75kiKFWOGyfOfU
 IkOZw9hCMKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DgAKCRARpy6gFHHX
 cog4EACpRHc2z4CEO5/+sWycbTJ/Lv36XdsRhCdryTDmJugI9ckFKoQSZSCDj/EPSYTLap4IRcK
 v9nSbe3GHgyhCBsI4oPZRLALF/GxIpu/uT6Km1hMYNz0BKb73ON/KkKX2YjD6FDJmZxw+Vu6UVN
 WM9eKdip1jecx1xnrqabz4R4N+ToGOw8uBEpUBFz+GxzItCcchdLGaDiVu5sSr+vQqBIRi02YVw
 nMlphUxtITQbANQYECx1Nv1wP0FC3z/NrADiA7uTJmmpoQ9/oGlBIxsk3oaFapoPnuJGo3SJHgW
 mmck7aZcXXhlAVZIiw9AIJJh/pgBI9uk7x1EcsNXWmikxyDmqd6lCXPMdIoknKVfyRqWnkCSgQ9
 TXbSuYZKBlETf4DXch3J0+3Gzk048a+TZ3AGds07+/KPC1otJhyxKQk9l33053cVyeXhjYOH12w
 NmL9X+K1QkmH632UgY1mZUockXDkxaq77pVHpq7LhuGkPXIO7OQ4Z9s6joU6MzhxlIPSvHywpkm
 eO/vZTvIhUNoYQh3fEW1qBuMVuvoh9jDfivIMlZC5aDXleNbJrQTlT9uKils+YyNyOsXfM9sejY
 tdyEgsTDn1lfM8sKVtJe8RRgFOBmDbxsHb04CG5Olf9wBaVFRC3YBSJ5c5ro5ldHl3e+V93Ildw
 o6i4ZvyV6pa1cVg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090032_243759_9D38DAA2 
X-CRM114-Status: GOOD (  16.79  )
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
that. While at it - replace krealloc() with more suitable
devm_krealloc_array().

Note: the logic in this module is pretty convoluted and could probably
use some revisiting, we should probably be able to calculate the exact
amount of memory needed in advance or even skip the allocation
altogether and just add each function to the radix tree separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 60cf017498b32a9f36a1f8608e372951c2b8f12a..6aefcbc31309995ec1e235416b40aab3e4a073a9 100644
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
 
@@ -1634,7 +1635,9 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	}
 
 	/* Reallocate memory based on actual number of functions */
-	new_funcs = krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
+	new_funcs = devm_krealloc_array(kpc->dev, keembay_funcs,
+					kpc->nfuncs, sizeof(*new_funcs),
+					GFP_KERNEL);
 	if (!new_funcs) {
 		kfree(keembay_funcs);
 		return -ENOMEM;

-- 
2.48.1


