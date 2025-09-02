Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C000CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3eeGmPeTtaROvFQiYnK7dZg5f0Y1UOsb0zEkFq0B7A=; b=KP88R7Cddv6DI5/BiGO2HByPAt
	fwLPTXHw4Bf+S4ikOmqEf03nZRBtC3/lusDZjXJMqIpCe7QDNOuromfMQ/vuxAchfOb1bD5u7TQIo
	dnSRIQdC/BuaADBSL1cw3EqaUmN1teToDyx0x4Br9HSD7JmyOzwGbO3kclORkrvR1c5XcdqjLxEgw
	+Mu/k8U8HdtcYG2thMpeaF1eucdfgPCSo9A+5ci2qCdIucL4ErvBUyrlvwL9x4LZYQ4aX4veweiDE
	K9A7tX1FCTr64V78I1N1vRgoBZTkWiGhgh+bBVeS4iAD/5qbXsHwuIXDEjToKh20lKEeqMnilHL+G
	jwNBcmHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSiL-00000000cMe-09Sw;
	Tue, 02 Sep 2025 15:14:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfi-0000000H4R7-1DVm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b8b25296fso15503655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814373; x=1757419173; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3eeGmPeTtaROvFQiYnK7dZg5f0Y1UOsb0zEkFq0B7A=;
        b=rldMTvEKiGckf8wEu1LL0X3LVzqME2APTuFKwfe9xHgfw/nkLR271p1MB4TJD7h350
         h6rijvyH10He59oAU1PrxBPb49wxRWwvk6vHFrKGKie7Wo8vPtiDgDEJXVPjxEASUjsd
         Vv7OU+2lrPYmj/vWLrcBBGZJqgwrERvam5m4FPOnPKheOkYh5kKYkE7CuGmfkPxJWH88
         OfmdO2WpG3AK2T5t0ohwpR0n1d/b74taxGucRAIALgM9muFAMitVVvgRSE+xkYNzITgj
         7cFESBxFcJs4fillFOGEWB+w63I0S60aJE/7lfwC0eXmvLdPRwmWAsviqb16WWeRTxEs
         YU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814373; x=1757419173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3eeGmPeTtaROvFQiYnK7dZg5f0Y1UOsb0zEkFq0B7A=;
        b=R8epBML7cxxaIHXQaCugh2Qdw1Ob2Dgf2HyAQ8rntxarHnQzM7s46+06jAaH5XrNDF
         7jQrpDFf/9EAXRkTw4CdbdLtJPta0su7MWjbV4hIMGuMH74j0GpOi4NPREw0ClVBWYwD
         hFSgcM0MJtPf/j/pe/Z07icKN3HBnuEhLxG27PPLTRLvlrxs9oTk/piNleDRFnlGc+aW
         hQeklsQYs4D2L7BEOkQyv1cPT0xpf4pfMvQmgW2gvl/Q9s/8PeCkpgzUKZeMpzxJyc1S
         MvmEMYYIf6UODnq4cJFa0SOFakIRwGtEhYgJCBQVXujSgKiAmFpy1+7WJu6LR8Xdfaud
         uQgw==
X-Forwarded-Encrypted: i=1; AJvYcCWTCX+jUygyf8baenPpniKUdQXAUJnhWcDg3Gak7HoaKsU0RaB3y2fZEyiLuHoEUbi8KLck2tqaB/ksQadnNSZP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5LpStRQtg3WKKp5YA4HCLxwfiAgrXGe+EVoqXOWL+fpmAOYFD
	bhM9Ou5u9SnIRp1WcT7h0Msz24L+bLFL60ZeNBxRSUjHVzBfRhhJ+q+Y62GsxIxWZw0=
X-Gm-Gg: ASbGncuieV10iF3GkSbTI3mHG3USKZ2RWvtAvhb2BdiGlnf9lHlvWAsr1uk4hnOahOy
	WjbNtai4/zbPHwgPqbtB1SwgAZRHCi0QqBoe40EuHuPA7lfvcOBni7ZavRg3pqOk2oIcRtH24QV
	j4Vhcn5YX3vTfXJ5KNzcYRxpACi/2DcRbCxtohIC7UQZUc+FjAz9HMV072eX1r4VStGgJUkpCiY
	j6qcd7wa6kNTQWl96S/84KWcRwbbFVSmlGJPTVjLjqNN5kUz/444/tqyvAsBYFFjqthVryuFQpi
	U4D4kbeoyJ9fJURz1KBUQMIvP8sB6rDSXpAQdhyJTr+WHjOHroCyo1q1KK4DW3Ov2YRVCEBdpbn
	4/9N3l8W6EM/s0Kd/7pGUSNndITM=
X-Google-Smtp-Source: AGHT+IEYts8jM0hPDNk3lR54JtI9fXY+q3XD1cCncBSU1T/7vcK/5dU1iwGu8Rzh1q6sfcr++Z7kQg==
X-Received: by 2002:a05:600c:138c:b0:45b:75f0:2d66 with SMTP id 5b1f17b1804b1-45b8553da82mr85384005e9.4.1756814372615;
        Tue, 02 Sep 2025 04:59:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:17 +0200
Subject: [PATCH v7 08/16] pinctrl: keembay: release allocated memory in
 detach path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-8-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ybe6mZ39mB+QhhV+IKLIazviltUgUh6yCI8QoqBhqhA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwTMr8wKhS9jqc/gyJqLYlDuhik2dzTYA2mT
 1itmg9TI66JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEwAKCRARpy6gFHHX
 cjI6D/47zG6CNa/8DApAwhxFDdmwXkTD9kK50B7xrkEpT1/JM58uqZdt8oD+hS1swsxXhRof0r4
 2n2Ji8TbCs8P2yCD2PbLf15A8uHM5PHZenScMw/EEAYyqe71x1+dtfd/0WPRmc70ZooKL2QWiAi
 WmY3xrhUzFT/mTiHSJ+Sl6fEv9P+P0aF1MaWbgDZ4jowuRSP9MOSc95l5y5xr0kfP1E16kxoCnq
 4ZHO+I9jSj8nAOC4p7vv2C8xPjIX4qljGd6Fxei7GyLJCsWCO1bVOuiBPOeuAHr5xFaE4ZRovYb
 F9lyE8LGGsGKHyJ/L69Bodanim6+VN85c4fQ2AcR89293cvQpDixNSz8mrBUiT+HmVE0IzxSLNy
 Sgp2dWrAe3TRtptr7mqR4lPuk61imcA5RCUU0I3oaXxd9hP+JLUTmSlMfA6LoTNWbSYRVC+4xDw
 Qo5pgteE310JQKtU6rQnNHGW+2O3jcyFn9mbGQuTqMr+vKyahvM7UyhEDX8ZW74zY27DSaD749J
 rGlm9BHlu4j2jQqztmo2Nn3sGXWBkw3q97eaE04xHGEZGWDzNSCFZD5lsOKMyFl1RzjaBRQfm3w
 5Vg4CQMYP/j/60BEEqNgzTd4ZzduOt28Z44HTEo2+ZFoduSKvvGzmVen+sRIF7N6c4O1baavetE
 suzeoiwgo1tLJVA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045934_325021_29A64BDA 
X-CRM114-Status: GOOD (  16.72  )
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

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
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


