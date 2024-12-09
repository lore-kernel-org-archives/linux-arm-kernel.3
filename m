Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BB7E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7ZV6/jGEGN0ycOt9l71mDvvXlfIgyAlXjHfNlD6BSSA=; b=r1rqlULbF33mTK
	afp6J8syQ3nGh5Tc9N/NqsaA2VLiU+BgNZ0zkdIDuOwZPM45NKM4xVBS/OoqjAU3qrJ4McE27iVnq
	bcmY5tjr5EASKgDbUBVzfUCbltLFVWdaS08vQXNmBZG0NyOHUF7RPXQji7+T5PpdLKrl/wdtDNgDN
	VEI9K6k8HZnFEGP0G7T3aMYixpDUvQW/73bA9s7mr/PQUPDayD13888zj0JM+k/fYKHa30zrEMhkH
	jhnmEcp4fYXGtPZAtyv0I5/g+WvzSzmoxGHRniPidr/TlTKvJqcMz4AnEdNxgROAvIo7FrK4vtXS2
	5JkG94pHXe+qR0MV9g8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgHx-00000008UiP-2pFb;
	Mon, 09 Dec 2024 16:07:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgFs-00000008UJo-3tvf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:05:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434e669342eso14211845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733760302; x=1734365102; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZV6/jGEGN0ycOt9l71mDvvXlfIgyAlXjHfNlD6BSSA=;
        b=La0W/gHEuZ33EfMlHGYxDUatZJtiIH4Yp+lnTEoLVwqQT7NIHf7gh0KSL9dLg88iZI
         QkerX1BUbGvSE2g1PgfSp2zPbOELubygW8zrf8v0IXOwP56mLxm8HpdWpXZONh9ZeXMB
         6yJzJ4a7VV6Zz/Ye4sCjRxPXtdtHNEUu151F7rMSwx1cSds+NGMnQHZT92vVh97EVWFi
         t20MXtS9pHObr80LE2uHb38RM/aIWyZK+X5qbyJkiJwmbZUMQuGYxWuhEm+HYjCBHYT9
         QTBisA+cxDSCRLzwrR7Jht0SXUIUNYa+n+ComgjGkXm2pkm+SylvtgtFygk7RRf7llwG
         NKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760302; x=1734365102;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZV6/jGEGN0ycOt9l71mDvvXlfIgyAlXjHfNlD6BSSA=;
        b=enhI+mfce3uDLoVLEaB7IQihvWFt79lpycwLs1deM3jQ4dsZdxGNqBHC/Nb+PmQjud
         uHKd6Q5yFjWApdiT09otn+tTu3ZRC496t/35NgCYtDFJoSIyrSEtlJclojeUaVv52XcC
         h6Xhldqiu2civycdAO14idBVBSQs+oRBmTu3s90MeOcOVpsNbAURbSU+qN471BYz8Zpz
         3ewerB+137KjIMcXv3As4+FWAZCbpahItpAohCaXC4Ni6IaF4yyYFHJAZNPsm4DE2cCB
         qFf194puvflHmM69wRvNS+RdoKRxY+sTFXccK+/9O+17Tcg+TYVTUaX4A3bTioeRGXnH
         p2Ig==
X-Gm-Message-State: AOJu0Yx3Gbm6WuXmi0V2gPixhdmnkQajRxMqU3AtZlip9XA3HtXgFxPS
	+gVhSys/sF4Mi1DfP8jCRJplGwl+24AygF0r4CH0WI0Y9C06V467xKI6pX2RIMg=
X-Gm-Gg: ASbGnctQusGVYlPH4KFV6ayEQJJ8h4g26u+dgxxgt9m4Cq0hzlVGPozt3jQ6dAp6Viv
	t9w51q0p7xYsvzN7MOH67qlxaJKL/g8O/GwNehwII+qCoaqy9xsaD3/lIsbJ+HBbZBN/3S5+N5l
	UJvgvvzi5F0jSA2xxE265sZ67Fn1kPnB934GOiFHrpKypDH/Cj3lKzPPn3t4L9SzUXeSB8sPnmZ
	pgseKCF/iabBFUsgchMJ02BVQ+fsioD22jCeslEg9H1CNrhx2vOohS7bdRBcfST
X-Google-Smtp-Source: AGHT+IF5I9z/yJYWju5kftjmnEGFEfuICa8J5jFX6BR1vJ1MZdpvs0pvrcqwWB9585oM8D3NR9VuUQ==
X-Received: by 2002:a05:600c:21d4:b0:434:fbda:1f36 with SMTP id 5b1f17b1804b1-434fbda20a1mr19800685e9.20.1733760302154;
        Mon, 09 Dec 2024 08:05:02 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:432b:3c3e:b17a:687a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434f3d89b75sm61459015e9.15.2024.12.09.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 08:05:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/2] reset: amlogic: rework auxiliary reset support
Date: Mon, 09 Dec 2024 17:04:33 +0100
Message-Id: <20241209-meson-rst-aux-rework-v1-0-d2afb69cc72e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABEVV2cC/0WNyw6CMBBFf4V07SRtwcLwK4ZFH1OdKFRbfCTGf
 7fBhctzk3vOWxTKTEWMzVtkenDhtFRQu0b4k12OBBwqCy11p7REmKmkBXJZwd5fkOmZ8hlIG98
 r401vtKjXa6bIr017mH6c6Xav9vU3/uVjs6mV7sFfzlUaOEE9b4mZS+HlCNIN0ughYNu58bEln
 C0EPs0zr2PTBsSIulWOgo9ofXRo9hZ70+3tQD5abG0ng5g+ny9hJWmz8wAAAA==
X-Change-ID: 20241209-meson-rst-aux-rework-e26c716c6762
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=evbbOU+lk70bFQXkzUYim69wTqMh7DKLswkpygTzlc4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnVxUqbrpv5I8zC+5JUxaNorAp8JMBdDpjGJU6s
 h/37CR27LKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ1cVKgAKCRDm/A8cN/La
 heyaEACGUxT73ntzD/EA0m+VipsjkIaKfxH8c9z+qs54HllPKjYPuai4DkVv4BVNp4AoLnpFiOQ
 1WtD65Z8lheHQ+XI50SAi/kEIPd3lPs/but/mmmSpgkkeiif8mNJ6ktANXJDb4O5VoqS+1vaDlR
 uFSx3xKZNSnXjR1zoR1slF6sD9iOBHt4qKLTez8sLBoklq5Ajvfu7QIACvyS/oBuhrQ3UY2nk0z
 /8VlCuRWu2MiGTE9Ke3b2x4hZ+5UVzK6JNhnCHNCxDUu137ri5jByI4NAr//GkuoROMEuumq3js
 SJvMD/ImZ0alJIEmluL9UGj85MOglaJaorvA4UQNeiwSrPhkIidf3iQijIn4vQaYGccdRegmIdT
 lgXuptIF9aRRomeK3vXERe2qO857BVnyDpFQtiLfQnkDQQo/LkMshfRLULiU1D8Fw+gMc3KH82w
 +4nqUxHPaoHuDH8LBeusfv/AGFUU+EWpvIZF/EfTWY11mlQI6gIWZNfxgh4p8L0hNTDvZiPjXb6
 /q2g8+i/j4SNuDRENAFNI9wV3FJm4+WkEBC4iP5HYujfc55M//CI19HIHyCCCIKImfKudHGymMJ
 UBRaa6sDAX5O7Y1KKhsuEBXtwSPfGzk0cN6jo6zgDhiZN3Los4nT8WlJgvsU7AE0JbkRs19eOfw
 99E6tb2SzePIY4A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_080504_960096_9E4F0FCE 
X-CRM114-Status: GOOD (  10.67  )
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

The current implementation of auxiliary reset controller, with the
registration helper in the same module as the driver code, does not
allow to properly decouple the registered auxiliary driver from
the registering one.

This patchset removes the registration helper from the auxiliary reset
driver and changes how regmap is passed, to simplify the interface a bit.

This patcheset depends on:
commit 5ae1a43486fb ("clk: amlogic: axg-audio: revert reset implementation")

The above removes the only user of the auxiliary reset controller, restoring
old implementation as a temporary solution, while it is reworked.

The commit has been applied to clock fixes [1] branch and will eventually
make its way to an rc release.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-fixes&id=5ae1a43486fb3febd5ce78da13eb354f16d049e0

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      reset: amlogic: aux: get regmap through parent device
      reset: amlogic: aux: drop aux registration helper

 drivers/reset/amlogic/reset-meson-aux.c | 85 +++------------------------------
 include/soc/amlogic/reset-meson-aux.h   | 23 ---------
 2 files changed, 6 insertions(+), 102 deletions(-)
---
base-commit: 3d99f9231bedcf9acfb965a97645a8ecfa93a40d
change-id: 20241209-meson-rst-aux-rework-e26c716c6762
prerequisite-change-id: 20241127-clk-audio-fix-rst-missing-0b80628d934b:v2
prerequisite-patch-id: 8bf55ab8ba9db1abea5df2554864a2f4f9c72e77

Best regards,
-- 
Jerome


