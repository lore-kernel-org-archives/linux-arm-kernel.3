Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544A0C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDB8Yocyi1CHyFjahKv89dOXx4slR/SlVFPSQTYj81Q=; b=UQuq12kWuNaRSq+v1Twep5BO2/
	wIcV11lqhnXl52/TKy7Fyii0lsEcW5XOU41npIUQMMCi3NBuigHwyfu69OrRs+BCKkBiB2gZSnhJ+
	WR/zUwUlxUUzH6CjkskesbqZGN1mfEQ82eiFKU5SJ1Hb4Uz3Z9pTM6ZA8FW3ZAGkFjZU5QTD89CdU
	B9SPjlW7Pfds7JIIwK6gCn2ph3zRpnuRIQ8GNWIyY8Pj4+Y2CkdiyiyZcbEzdFDVoRPG3vzTSOGcJ
	yukRLMUrhIPBAL+r/jMHPvXTtXsjVmx7wY7NjrWMvTl4ph12kiw0hk7n1JjlpjlffyACbQWBGdU3E
	/Jj+9Y+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaea-00000004Rk0-2lsH;
	Tue, 15 Jul 2025 08:04:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubaWb-00000004QEZ-49Gp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 07:56:31 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso53358445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 00:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752566188; x=1753170988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDB8Yocyi1CHyFjahKv89dOXx4slR/SlVFPSQTYj81Q=;
        b=2cbAQXUSJgqacPo69qaFT+ZMuVHULafumPCVKbsLXZSrCeEZfnIkvycyvduyLDQdcC
         IQ9JZMOW65+UoBfTvIaupbn3PZH2QQrxXdES5+l3OoojCI7dz/BXUfQJy1Q0nma3bqEN
         h+XbB5D0UdJlpOnHy23JThxTNKdoq11iMA1/swVsFpQd8myDqUfdHxjjN/KOXgsTfdaS
         wzpdlE+YLFP9AAPHwHXOaRp0LipDIuEhEaztPJ+sbFxkRwWgHins8HWm4L9rLsUvXuu8
         xVp+EoGntW27PdWTcxpbmeCaYGyYbIJ4WV+cKr7C8ER58kJH3WFwh/1lECBoSuqe/000
         xgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752566188; x=1753170988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDB8Yocyi1CHyFjahKv89dOXx4slR/SlVFPSQTYj81Q=;
        b=OANYLrSp2ETVnI92S40dZkRUn+j+is9SN8PkU1fGOCYa4lAOL2MXRkB6Y9b+X/0F2j
         Y/qbuMnDymlcc9l2u8uDly3AOr95KEH5BQBgeVV0hOOdZiBreyjzNqJHQoy6p5V2pLvf
         L+MHfymI3vv4wc4nhf2JqJBJenbd8ETDW8/0tFM6bu2BnTZWTR8ZfCiH3cR5pJooSAuL
         hpKmkEfYF3dXfEfU6SNZUYAO+iZUJ41dkO80J34gFmmrkKG/FiIhBzUTVMObTu0W7udZ
         RUR3OJGelbv4Qt1cH2UeXPx5hXYEbsn0lCi/liKyOhfpG7Te7wp+PZxJoaPBpji2m1K1
         33Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXmtpiHqpBQkcpVKjWB3rpI6zzSYuWpp8OplhpWhcggc37lFSbXVRtf1Vgrt804uM8kV5L3uGZqP/3fSWPYF+Jq@lists.infradead.org
X-Gm-Message-State: AOJu0YyVYBBi4mu97hZnU7+ScwR/6NzvkJcAf+PPzSk/eqPP8pLZxujr
	kc4hL1fAGXTxc1fpakPG4MV8jyJQfwHOq/rEe6Z/jUq3WhMeCz3TbDHiNLEr0MF/12A=
X-Gm-Gg: ASbGncu2UHvgieBI/PtaWWzIC7eu6TWWM0LWFviIC9FdZcVH9n3VVgqIp+oEhVCSVJA
	pVDLOfnco3PsC8drtrYIkABYKKe3yjuB0VAZZLNGsBP7vxT4kUSexTjp9V4eqHG5mfyP/AIoGO4
	E3IUXPvx9Z8IitI/f5MjIOABvmrgitCtPwpzxt7K21wzRIQBVNJj2Z+FoNLK2etyX+G7fHQjKWM
	BOzStYlLbTEplfjEMxuXYvYbsO7zhGFsDqLy4M0Kez9oAd26s2n5yPguPy8zwPxdQy9GwnWoty/
	RdHRYvzWdfLzyXIEr8tm4eyI6kJ/x0UK6jknmF9epuW0RZo33SKTGTQYQgEqPguHDK444BipD1/
	jXn9BiD5iFjcakp7LFg71vA==
X-Google-Smtp-Source: AGHT+IH/xgSlj6fv7LIl+NxN0W8/80B7umwBFaGWTraOqNYcXsjCpGDdeLcR4qsgIzlLlWYliTyPCQ==
X-Received: by 2002:a05:600c:3b84:b0:456:1efa:8fe9 with SMTP id 5b1f17b1804b1-456272d254fmr17208765e9.2.1752566187780;
        Tue, 15 Jul 2025 00:56:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:5631:db97:f06d:3c45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455ef31717dsm118630535e9.6.2025.07.15.00.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:56:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Nandor Han <nandor.han@ge.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 00/19] gpio: use new GPIO line value setter callbacks in remaining drivers
Date: Tue, 15 Jul 2025 09:56:25 +0200
Message-ID: <175256615060.11708.15247893367426426465.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_005630_275455_43212606 
X-CRM114-Status: GOOD (  11.14  )
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


On Wed, 09 Jul 2025 08:41:37 +0200, Bartosz Golaszewski wrote:
> Alright, there are a few left so let's get this done.
> 
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts the remaining GPIO drivers.
> 
> [...]

I queued the ones where there were no comments and will send an updated
conversion for gpio-wcove with comments from Andy addressed.

[01/19] gpio: vx855: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/db12cdc8224845bbe31c1d7e5e7d2c2dde4847dc
[02/19] gpio: wcd934x: check the return value of regmap_update_bits()
        https://git.kernel.org/brgl/linux/c/ff0f0d7c6587e38c308be9905e36f86e98fb9c1f
[03/19] gpio: wcd934x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/637c3054e9a5337d303577584d575c247138dae9
[05/19] gpio: winbond: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/dd94adf7da36281b5d1bc40ee8ac265082576f4c
[06/19] gpio: wm831x: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/023a24f83edf9abe0fbb66929d286cec5a09afbb
[07/19] gpio: wm8350: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/f7a680e9c2e512f903c385ed1a71732389788aa0
[08/19] gpio: wm8994: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/47b427311d959fd3235485c08f367cd14df282ab
[09/19] gpio: xgene: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/0933fc87f31da17871d6cf255dd9a3de86658685
[10/19] gpio: xilinx: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/1919ea19a4ff8d534fb2789453a69f86f70a493b
[11/19] gpio: xlp: drop unneeded ngpio checks
        https://git.kernel.org/brgl/linux/c/c719fd3e3991b16460babf70036bf39cdbbb7a90
[12/19] gpio: xlp: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/6d0f71cd58aaf107dab3ea5a50e9f725d4691043
[13/19] gpio: xra1403: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ae8bcae8487293cb1de201734ab4779a2438618a
[14/19] gpio: xtensa: remove unneeded .set() callback
        https://git.kernel.org/brgl/linux/c/735ddc67ab88d35378cb79cfa5ac5f87db0775fb
[15/19] gpio: xtensa: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/383a02f6d421bf7703703aeb3e7270426b2fc30c
[16/19] gpio: zevio: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ee6e05eb5fe27a45678848fb92a2a5db6b3fea84
[17/19] gpio: zynq: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/815c9769ba0e2e184eac570e596391a1ca58b8c8
[18/19] gpio: zynqmp-modepin: use new GPIO line value setter callbacks
        https://git.kernel.org/brgl/linux/c/680450b358b73823c82d150330aacc52e286be08
[19/19] gpio: zynqmp-modepin: set line value in .direction_output()
        https://git.kernel.org/brgl/linux/c/e70513bd98e3912b431b196e3cf53ac821598e6a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

