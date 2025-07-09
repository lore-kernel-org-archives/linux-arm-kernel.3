Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D60CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLbWSE28fqjciTyu88LiBr8wk4Ym9BgB75PtxIrcUCg=; b=0VJl9XnIeY49OKsRVSmI+4tqS/
	+3IQAZCGnfusdrMPmjwKNFkZI0q4bLxqWWmE6XpAfEGdljbedr7eGaiAUWIT3ABjKRrWO+tchy4FR
	k+NEI9/uBXM5/MIIdKOTTfEui5X12jwv9PbjS2ciAlbSvFVx181K+ZC5e9MiRGJ87StmY36dHDhwS
	GEAO9+FeR/mz32Fu+GK5yxe4oAQN5yE9kRdKm+OmlDFldX/CACfx3TO7bI6HXZORSV9avnSi3wb9e
	Edn4ZFhmDyHc/Vsr9QO5EdBEB1mYBNNxsRlZIWQya0OmGMphjUbNgo9Y8oookdZ0K19ffvpiHO6V8
	y+wnLatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXus-00000009L9S-1Mei;
	Wed, 09 Jul 2025 16:45:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx0-000000090cq-3eyU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso61483905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071949; x=1752676749; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLbWSE28fqjciTyu88LiBr8wk4Ym9BgB75PtxIrcUCg=;
        b=2myCz+W1+f5W8lKEIm8BqZG7JRGOotujkfPFlWHb+2R+rRZI4F4Wb61FT59+48CiOe
         fP35lCclVkAu57xhf/hqIXs1y1wMywM0cfKkkuYw0+9Auygm7cv7Jk5QMXnedq9D/9ep
         /5E/wPf5ijoZ2P/k6Hv+7XOEF0yJgQtwsu3VLcZzt92PHWL9zuKNG/rz2IjVrbNjvhuZ
         OD+1/KWwExFUi5cA8XvaBCtLtJpzzB2jvpaHnGZiyeK3WO1jc4Rz9ZXTEyx3RNt9duYh
         pEmze2jcVdfxNAFYfRnH5I49EhYzCPUflEe5UoA0SyY8rERuSpYZzBRz7t0DT3ARV3cf
         Sjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071949; x=1752676749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLbWSE28fqjciTyu88LiBr8wk4Ym9BgB75PtxIrcUCg=;
        b=TexxV1hgtdeeSUT/OHLv8pbD6BszQfIPcffqKIrmcIvMb6xwc1gHkx0nq5HKZKLa4o
         ME85Yj9WBEY1tr/XFXivKcmsQ1gwtSp1yW/dOI+ryonLnRw96xgvgYCF4FcBYIgRWJ8j
         x4zYdqnXb0JHYU5Ef8N372rmC9TRHE+Gzo8C4pQiYtYduFeBdPW0JPmdTIvuSJDS+EDX
         BGOl4Io/Ix7Aan8GNZzwfHo8N9s44PU1Lgrra0gGQD/+jqO95LqFsCihSwquOmu+J9dA
         4SVGInfrDnIQx+8h/1mgKt9+P0pVYxHJl3Q4mKfg4biunbkX7P/fiv9LyYa7VNM0kRd0
         xvCg==
X-Forwarded-Encrypted: i=1; AJvYcCUUg4B0lzVO2WNW1UYT0CXQAyIjv01c+Todr9pLhogL/2HH9EpJ0sYqDV6BjH7xyP4n57L5VGlGEQd9dHpDiuY8@lists.infradead.org
X-Gm-Message-State: AOJu0Yynr7qGFZy4g1S+42enjbNRmu2L30cplRc12+S0BQs8CiZjcB1c
	8ZDXfC0sxM0K9GprLrKoVfO7hOPvQHC8VPpD5Y7YRh+BKOrgxNpvRVzy9jyTb/ha1ds=
X-Gm-Gg: ASbGncvKjTGOoSwomRvvVRbpy5yyixeVPKkyn87MT923mOGfyOQQ77vyL6xBmxbPY4U
	sufI/IFBgfejS5Z+rB2BnWtJn1EzMVQfhRfg5t3gd/Qee9nCpZ+mxr1IFH2B6ZL1Z+JPTIKETas
	ewcoFG00zXP+DVvXPP2296lbZt6ZKFX2TGQNcDAirElBPGWufz29KBOtzVNHok7U+Uh7IiVdvcm
	mK7NS7dQuJ66oCMUxRg4CXq4vgHRBI4f6SR15eq3kB2Yh+MlfqIeKbBW4oUfLeWYmFxl3lNk+1M
	082xfzDjT9B3ZkB0LvK4DuY1ZC9We6PojRSi30CrnH7zSu22j5WCY64=
X-Google-Smtp-Source: AGHT+IE6NMT8AU0DhDolK/XWo53eQPrLka/DfBqPNyEAMgaeJcAfEF6E9CWaG3DlW1jsKrQJbwuC7w==
X-Received: by 2002:a05:600c:8283:b0:453:58e8:a445 with SMTP id 5b1f17b1804b1-454d531e30dmr28684405e9.11.1752071949388;
        Wed, 09 Jul 2025 07:39:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:00 +0200
Subject: [PATCH v2 04/12] pinctrl: airoha: use
 pinmux_generic_add_pinfunction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-4-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rKcKJn1Qx0kHHaw1VaKCekJy/+IGPmyQ4RvXCS39j7k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8GdTl5YXFsCeDYLha4gAdNaEX6nu2Jc2+H3
 AtDWXgcKYSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BgAKCRARpy6gFHHX
 chDJD/4mFFQSQ3h3fx9FaKVrlxP9+ULMx1/F21EFQ4FbWcejHkUr+A27uUbvjD0SeVotV2hsEwl
 y5eIU18s7rqRwmHfv+ity7vh7q+f2/CsAOliBpxT/VulCk9hCOOXYfUAiu0T+FY+OzmHcrFljRc
 V9Xw7/3NElwuW9HnubydN6UfIjfTzl0hUTI5jWFEcZJa8D8/Aj2Whjyqxe+xADQ/nNsPgqv37hb
 4R4rUW5SrsT0GtwFWe4K0Qx63TvQaCaE7Nnr5X9KJEgz5T043avHKO8Ba0y5/3xzyLlay8anlOt
 ojnv+CFLjFLurfsNNsQh8g8hFPSMjCwsSO7N56kFi1zcMmnVp49VrX45Q5zpKEjj7NFZim7+Ijy
 PvjJBPnFKnqtQKIwHzjuD/5DgMq8/z++68wSKuQtNYpvd7qP1xXbzgYV8DMTpnhN2EpJUrfI8TY
 VU57SI29Gcg7uzB4RKWIpSNVccHWLQy4/a2/2br5LXlDiCb7psNrtfgFl3HUNNSViDYCP5PbuTg
 wJtJTmj52RnDKV3r3BigVIEWtIiHmmS+muBgJTekYUkNNELPCArpk8SWwrUOC4k4sG5VnXHZZL8
 pmTX4FU7AJ2XMg7cFQCCcD+00kOFH1Ptgyz8b9Kv67RhLqku7NPnmvE4SmywsiVG9GcyJxaScau
 jL8/WRSxmtcknhA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073910_904582_D4B2E59E 
X-CRM114-Status: GOOD (  12.38  )
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

Instead of passing individual fields of struct pinfunction to
pinmux_generic_add_function(), use pinmux_generic_add_pinfunction() and
pass the entire structure directly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index ccd2b512e8365b3a5af0bb223329f39119bc7078..1737b88530c385644a360e8abe583416bd6d3fe9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2907,11 +2907,9 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 		const struct airoha_pinctrl_func *func;
 
 		func = &airoha_pinctrl_funcs[i];
-		err = pinmux_generic_add_function(pinctrl->ctrl,
-						  func->desc.func.name,
-						  func->desc.func.groups,
-						  func->desc.func.ngroups,
-						  (void *)func);
+		err = pinmux_generic_add_pinfunction(pinctrl->ctrl,
+						     &func->desc.func,
+						     (void *)func);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
 				func->desc.func.name);

-- 
2.48.1


