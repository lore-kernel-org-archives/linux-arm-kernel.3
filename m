Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49669C982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=; b=Mzit6wmSxztZlp2VYK5J8vCOrw
	MD2t1AKxlrFAnnM3+JvBxhKUA4J6aIe5t17y2oXTXtyuBnfboDCjNCDGzFLJh20mR2HzIEQYhTDsN
	yVVBYMc08yIwSLjkvRWftDdUM1b415uEbfC7/Wt0lCmX/gPoR9SuUWLrrwM6vx0Yt1uR28LaeJY+q
	p8tmD1QBVdDiDhkpDa81jP7oS1iTo4FiLBIedJ4NPorMUBh1YRJOL4sHpexFDDh+NMO8UW3Unz9l/
	sljIpBHkoR+l+BLUpz1TOkyewc76Evhn4JnT/cff/7JlkJzUdcHmEvqj2fF+pRdxzCE6S8GSAN8Qw
	UktX58kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dtn-0000000FNd8-3wyO;
	Fri, 18 Sep 2026 19:05:27 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dtg-0000000FNZD-2Ux1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:05:22 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a803458ba0so1405705a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 12:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789758319; x=1790363119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=qBXbDx9vUVzdIwOn57llVWLeGuOIlnZUESwiXxR4QwiVBMmLgA6sSVLkXeoyIt8I8g
         dd9JHDhkcafsrdVpx+Sz8rLb/Z6Y1GzJ9YFiYeDU7LWsmmRI7Hlt8yWGR87Kp+5fc7Rc
         1irkVZWna1vQSgsx7k6nIycyolir68KgvBpcZJL5TY9KDWqg4ykTSZ7juw1+STVm422z
         GSJaG9nSXAgXyw8sUcC+BU65r7YTKMHt9P3M/NcSZa10vqjc2ZV0aefiabFKBJIi25p5
         GSw/21TJVCOQ3Azo9uM1lqQM6AMWseuifaHxvpFQDLDy3z1sfB30rWRA/Uzv6KEODbF3
         RJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758319; x=1790363119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huJxWlT708nmfTDdQjHUmTyeWJoEnSNCINl2pfaGmoo=;
        b=FgAIug5t8vZwStiulInlk9YrT8xfQCPFyCWbtEylHroRICFmWEiYQy641HQbRG2mv8
         JGFKJ1xwR3NWqyEm/hZuaxGR0QXJp0nHZuQRCpvX8fPOZe09fNzsd7VmE8TTMBxoiRNF
         rQ9Nel8vzHz1IAa06ejidWV+kOj3URZzfb31lBZGsFhJnEARscxSUILcsi2UAYg5IUjZ
         O4DtWBeg6Xdswa0W8acrV0ch3kQSazEQRrK2vo3h0jdzypfRRk7akjDvf1NX1VuvMhPa
         TknTrvhCf7UHYXklBH+PKQplZKbwYOEl/R3dNzp3zBMq2fkjnUGrHosErKy8nn5qjHgR
         jqAg==
X-Forwarded-Encrypted: i=1; AKwUvByRHjyqBtiSdoNECoI4DecyJf2JnLYrs2Ru4fwe2auUFxbgMkY6W8aViS3Df+TOQWGEVOw4at2Km4+WQypl3UP2@lists.infradead.org
X-Gm-Message-State: AFuF++mfz+Q+cLlskY8pRlpkQ+gh5G8UhFoRQWezGjqcBfGTWu4+k5te
	myGfAZFTCyWllg7X4RJbPUuk8Hv/cYEPyzJ8NQuO28i/Pnm0B25n85ve0OAu3MR8Q+4=
X-Gm-Gg: AYBFou3dCtZmXCBGt5g+DkIks1KPjGTtVd5Lt+x0SfB756ZZm3vRPqNQnolrl2cpZdZ
	ovvXfykHvjY4MAq5h00QQUDLBN6BbL8YuQeahIi5vnr1ofC62/wmYPXesA6S/Mkx6FSqNHgS1JI
	2kgbhncVtyzt7EW4JoNIPPspA8ZfEnXn23Iq8+HCdNTlJwyGsDzdoPe0pWLuJp5yGT+rKEWGVZY
	bZQn1DscV6XPzW/9e6JUT2xJlutquorMYjJ4h6ZNArqB7pcyYpLtc7fEVcG7KpKoYpbQY/GWs5x
	J2KJoahPVNslzk0WCWAf9RSrd6BhwT62StV99r3jLmii9zbumMf99h1KB3QgQVNVwJ88rg6ZtIt
	FoRWomIq0whGYItWfeeRp6XpFsl4tenzYSGJkFNNyT55rD5XhzWKkHa308tuIActloIrJr5QH2G
	b4uVyU5qKQi1rJGACNp4n3tD+YQpV6OTRhuP5qORjmelCPbivD1K07uQwf7Wi94xkrprCXoaVvu
	8kMUWFuCgEQIXYrJOZV+8tx083ZBw1h27qhG3z66rS2zb9cTgVyj4cLcTVf9YjBOzu2TKF4wzOb
X-Received: by 2002:a05:6402:13d0:b0:6aa:447:17d6 with SMTP id 4fb4d7f45d1cf-6aa55ed94d0mr2176058a12.7.1789758319014;
        Fri, 18 Sep 2026 12:05:19 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d816b5sm276250a12.7.2026.09.18.12.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 12:05:18 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 19:05:05 +0000
Subject: [PATCH v4 4/4] arm64: defconfig: enable Tensor G5 SoC family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-contrib-pg-pixel10-initial-dts-v4-4-745eaca28b1a@linaro.org>
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
In-Reply-To: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 soc@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, 
 Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
 Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-serial@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
 Brian Norris <briannorris@chromium.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=BbX8RY98cbW2glkwb44ypYKnRm3un42mGYq+Qy76YHQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqrYtrLEuMzp5hVqy3Y5ljELO858BUYVFUsn4vP
 b8kZdMyek6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaq2LawAKCRDO6LjWAjRy
 uorND/9JewuaEszu0u6QZ9+I+xCJ/O8So5m+s6UZ2UyBKT5ujplVyBAOpPGGavt5xGJgjyobSEJ
 H9KtrlWGHOC7bApugiCV47Di21psrvzIZbiPer5NoArylWQgbG1f8ekKCOH3nDPnjOKkcb6C0Nn
 1BnkOtQvxDq8sF9SpqgEfuDE06ux+Pv02ruZH5Qd7+2y+ACmSNIEQCJETKKUHhj6JkWqKbMzU7f
 glDuPPlueCekv/ltOK8xGxKea/lbRsUvmqWqsFcMycKCB3+W4l12dTQ8PEdiBMCreyNOnYydKMm
 wSYKcJboYcbhqng2YdTnnZksYd0LKBwrBeVx8bM6Cq3y+uRMviYtfaj0GrRnFACqJdu/tXHtqlC
 zSd8tai4yxgEr4q0KWOHlZDW+cJoKGqiHZaRs7PX+r7abJkUB+Ju6dnXWrlS8DP7av7dk0fLtcw
 AN94OmE5fZEdrcSbehR1/ObFgANfc8VB/Uf2DAw+EUhEJVmKQOvQNdql1Auy5qwmHLg6R3G+5WF
 /lkNbrW4md8Eyu4Mx8yick+cOkLaR/ycnpYLZb+mNaGeRdKpaxgW07WCdspiDtmgTAFXpiKmwkm
 eGj+ZdtcUhrZSL1MKMIkhcKdwSdqQpGEFwck9AlzdPjoEMdxyyk+ayMPpC25O4FOPzQgarTipzV
 FQrAKZRVnfi8PPA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_120520_644465_E04BAFA7 
X-CRM114-Status: GOOD (  11.72  )
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

Enable the Google Tensor G5 (Laguna) SoC family in the arm64
defconfig. This SoC family is found in Pixel 10 and later phones.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 982ea1758eb66..75000c12ead03 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y
 CONFIG_ARCH_HISI=y

-- 
2.55.0.1082.g2b9226bbc0-goog


