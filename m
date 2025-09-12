Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1749CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=; b=Cg7X47rPA8/KezDDfGeoHgkAU1
	+vlAAF0jJihFj7Ls2lSLTbXcUXSSERyxjpDCdFRmgj+gLv7SEkTrjJuKNlEV/wfhOYGqXU7EgI87h
	Lf0cz2v1fiDurHe2n10XqPjCNFSClXum+1Ae02duXfigJseRQHO2ifZYt8qXmZqe4+Fv/7fWKIhoe
	3TZVZ8x286H+llfbo2XaGL3zvCTxjTvlQoDVsMZaiW8ss/MiL2wPxhtJ4cTtSiOZ4wF9Dy298LilS
	J7GTlg4C/YkF4Z6LVpGgJY5yzctcFBLk0E+aizHIXzSaWSvuq719ewzjRwBPlH+eWHrkA3FZI7Bp0
	SMPTQH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyBW-00000007dvw-413x;
	Fri, 12 Sep 2025 07:27:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyBT-00000007dsg-0WIg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 07:27:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45decc9e83eso14213175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757662021; x=1758266821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
        b=fnuKKxwvZBB8vxR4/k7Qj3dE7EsL6yEk26RAMlUAZ8D1ieHaZVVq/V1SYEM5pZ/YMj
         1EYBUxTq019LhDW2eWAdMQXpP/QTH1rgXJ+knwJ1y7UhMmBPPSEAiYfAgz7ImZ90VLcY
         WXA1Yuyi/BmsnZ+8Tz6GLlrOfYACR1WYLCZrEBq/U1sUMY7gKaNQHK8lbXk1raG5itWv
         xi2IxEFKB6kVniq2UhN8wWcX+jKHFOc0Lzi3FF53uuFLS2qKwJG2FeWo+9jligkxhgYa
         3GBMeI9Qixc2vmZ44z+h2Cs+6tuwiK0gJt22N07j/uVPYgALBiY8YxuD2cDpUVDikiCX
         FySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757662021; x=1758266821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3tI11OAkSN7RqNGcTXf8rRvtsdFAfZUpl45jMI60AM=;
        b=J+q1kSdxFg+5uJjxZZ6Sw3w8SdP+NcNCTbyjHZJd5/jwWSbqe2BBHkpjbSwtvoK9+C
         RL7uA7kSn7eRE/lhKLNuYcnVr21NK/4v/hRY/lf1HLiCGxv7+nXtAWKUrxThdzsUrSxV
         1PNfLNQ4zPPTf6GDxZnqLJf/oYM/PPgq9oCkzpYO72YkGgtgIDLuFhRCV85ONoRn7MSP
         WuPlyiBiMsRA/ECvYHYChJ+Kcle2sfh/75sVx1ElqEwIa1ISpVrWrTO6KAuH3oQS3Ttn
         vpA2poG/OOvZJwluM+IMUAa6e/uGcZWBchyVRCxJpy7bWjgqhJqwvtlGdtAd8VjsCZmI
         L+6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5LjNetjNTnm79SQl+djIDZxiQHoiS83ypzokpsoWm+ARKy4EVrvznqL0hHh+h1QEi+XeX4vHiOwTWRLHKnqoA@lists.infradead.org
X-Gm-Message-State: AOJu0YxXMkfQc22FPAPvqB/NEEMc/HJbItiImbJFNQbWcgJiyNNKWMKt
	BpXBKMqObd8IWGpT0fiA+05Rsn5vqwDF+cgsOZf0Xgtt/YhQhigh/hM5XjTgUuAS2q0=
X-Gm-Gg: ASbGncttW3AqyLzvGWKB3PIfwzOf569AZEJM011JTw/9W+gr91xz8BbhavKVd22Zsrs
	ya6Jfh9UzmbQNQNk3f8N1yIcIAsoa/zBLTjDZ7BI8KUGUO/RtqkrQ5bRVE0jV/W7swjrYjc10Da
	BaShYIdmf4OuEn43FFrJKdLqyuerLElWPhamf0NtxuI1azJbFzAKwE8qQ/+owaYqzud8W175aD9
	6bO3oYAIt4W/3NtKmqNDeQNNLWn8qKbQDjBcxyQDSL1gMYo48KuORTzW1Ujcwvpigzf1cV0usVt
	FpYJtqnXYrB0lLrdX8ty+xMriSSor/W+YPu81p4OCaKvNSSI8ly+MF8sxw56+K/RSBO8wanmMRP
	Xpt5S2BNyzpSI2qFOGUmoDPo=
X-Google-Smtp-Source: AGHT+IGXpoEAuIYw6/UluyUVnBbgfJgpGf6NHBYCv+YqFkoz5Fkn4jAGq9fRMx7AKxy66hsY9dDhlg==
X-Received: by 2002:a7b:c04b:0:b0:45b:81b4:1917 with SMTP id 5b1f17b1804b1-45f211d5d6fmr14759865e9.10.1757662020614;
        Fri, 12 Sep 2025 00:27:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b6ab:4211:ebab:762])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e774a3fb5bsm730202f8f.58.2025.09.12.00.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:27:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Yang Shen <shenyang39@huawei.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	imx@lists.linux.dev,
	linux-unisoc@lists.infradead.org
Subject: Re: (subset) [PATCH 0/3] gpio/pinctrl/mfd: use more common syntax for compound literals
Date: Fri, 12 Sep 2025 09:26:54 +0200
Message-ID: <175766186357.9646.17039178132060352918.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
References: <20250910-make-compound-literals-normal-again-v1-0-076ee7738a0b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_002703_281398_7C1F7B70 
X-CRM114-Status: GOOD (  11.97  )
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


On Wed, 10 Sep 2025 09:25:44 +0200, Bartosz Golaszewski wrote:
> As discussed[1] with Andy: it's probably better to use a more common
> syntax for compound literals so fix the commits that converted GPIO
> chips to using the new generic GPIO chip API and make them explicitly
> spell out the type they're initializing.
> 
> Each commit in this series can go directly into its respective tree:
> MFD, pinctrl and GPIO.
> 
> [...]

Applied, thanks!

[3/3] gpio: use more common syntax for compound literals
      https://git.kernel.org/brgl/linux/c/7eee64e8be51f9ff0393b5bd0752a6e8f9252bf9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

