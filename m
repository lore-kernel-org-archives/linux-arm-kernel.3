Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28F1D0E6DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AF/ymKNU/IWkNzMOHS5V+glJ5rwSWoJx1hh9KxmKoDw=; b=mBPK8kljrSkFL4weyPT/9/Rg5E
	JrN+fGQeIrZGyukBQ4JWbhmfbHlbsLuNxxTWTVLX8J8ok5w37zM8f6A+C4WMnfPto4UnjdrOqd+6N
	/bOD/yHUEaF7QqTHYXJUyUl5m7oNpPu9e1jvBKdhxEhLotot9iSrkGvZjrIM6Au4hTYNHEjID/mAk
	LXxoYXkitmkBHdW+YQNV0mve412EyatVXhHtqDeK3vNXVbrbI++r7tam2OQ9TkI6Fxc2FeQO7SCnq
	oPY2fJiWuBqmcBXr/HpM5yOT9QtgBrdYGUbbQGRaAG7Wr5/5q310jQ4vPQNPwogQwOSt+7JA4K8ai
	QoIsbh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNspS-0000000DK7y-3xlL;
	Tue, 25 Nov 2025 13:11:34 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNspQ-0000000DK7R-2YrH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 13:11:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso49714545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Nov 2025 05:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764076290; x=1764681090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AF/ymKNU/IWkNzMOHS5V+glJ5rwSWoJx1hh9KxmKoDw=;
        b=pjmBu2ByKPQIr5PRufysA34vGSLGf+XXmvrA5N20EsBFmLsLmlgPOEfkXuG2sp5xbe
         uYDHYcEhYXKapSSxf0RWHQt4nI/X2hzSLsCW8KmdGgyOzuA2Kkd2ag/kBdPIsuXdcZXz
         NkZloslTdqdaOoS8e3oeY0aWc4XcIjqAKHhvvYULMTqcurDEwP7bVm6Cva964rKPgmDH
         St38k4RHNpcEU0ro2ulLsD9SW1qHVWTTxQzdqjdcLieR22ckpagxMFjkz4Ywf8VTPKU5
         NEiOWqqn71jvrBLbivgCQHmF3XU/lX+BkgIM9hhAqC9lYzUWSgSwMDvQHQkuKZg0JZam
         APWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764076290; x=1764681090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AF/ymKNU/IWkNzMOHS5V+glJ5rwSWoJx1hh9KxmKoDw=;
        b=h2GDjo6p6V75OtCyIOPUuyh7Gc3DwOzKg9eMAVlOjUWL/L0wrpzEAm9t7VtQLlaJTU
         bindtp3B8ZX/L05iYBtrMl9UjXKycPdpyoWD3FsXbzt3ELICcLNpeouQdmXHHtivw5gz
         4ZqItoQOn0xqlYxUtJMvAF0n8KwshGrRuMdWyWaXSmcSg56ytWyo2tl2SoJBswpbBn+r
         zolt70tSJu5rf/DJwXc2DUKy+guO6vRLryWgZQM/vue/5anuqV8Vq4HS0FPDItmYyniz
         lZcoL1t+yiPI6pIy26GLQENCsL8dyuV76YRSlyr1fYBgB57aDpSJz7TRRWM8WZoE1Cc3
         CiNw==
X-Forwarded-Encrypted: i=1; AJvYcCX4HFD83vAdA3eeeGPZolWE0tZ8ZgrYam9N1+0ZjYP9yAkEeXe7fmlrQ0Njo0gLgKKnihyB/kEcZJ2ijuwKpz9P@lists.infradead.org
X-Gm-Message-State: AOJu0YzQxHuuhnlY2hACfTM/1hElww8v6cCcYoo5vNyv4TrpCo05V3Vn
	/1Hz9x0bZhwa2iR2F0ssbqKU6Rx1i3vaBAEZubCkbCqHMY2A84kI528rdrc0aqvjOEA=
X-Gm-Gg: ASbGncsdXNy0bvxeHEexlQRefxHVxAcVx3+aqLy4wd472wf4rdZKsYeemPsaD7uev/1
	KhoW+ooOh1qwx3X/YMGbU5XcPOL25G5UXN/AjCt63cpi4AN/47tpCU8g4v/+yfnzpCRL3T6MDRU
	0bgjiDFYOYDzSeXDXze51gnYVMV+ENkMSGdNyoIZXPGN5dICdOktnK2/cEQQ8xoZp8alCX314r9
	tRavgKof+qyt6+euJtjQuA9V3+X5j3lENia/DA3aDus4CzYkWIyt2TJbHJFmTq/iJldPN79CNGI
	1armS7Ho+9A6un/3Cgv52slJxnDHaxL6FJvYpVFFz2SGgCFH+nHtjWRcjaJfH+CarzNNBD20VDs
	6POzRJWF8/3jt3VUQMSKZz1u2k9rgsSW3wxdC0NJE4XdWKQIfvCYNQOF7aValW4B9GVK4tvWZJx
	t02OTg
X-Google-Smtp-Source: AGHT+IF2d1dNaLQQ0BE1lb2WDqjp5F/ItE0EG7UTuAPSQpK/RrXI2v4HqgZHJSatvjjVOjwrU182GQ==
X-Received: by 2002:a05:600c:354b:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-477c0184c45mr143467535e9.9.1764076290301;
        Tue, 25 Nov 2025 05:11:30 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:df0c:79ae:5345:c3b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf226c2asm249328865e9.10.2025.11.25.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:11:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 00/14] gpio: Use modern PM macros
Date: Tue, 25 Nov 2025 14:11:26 +0100
Message-ID: <176407621592.26035.10745445614533794233.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124002105.25429-1-jszhang@kernel.org>
References: <20251124002105.25429-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_051132_669541_1262CD08 
X-CRM114-Status: GOOD (  11.93  )
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


On Mon, 24 Nov 2025 08:20:51 +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> [...]

Let's give it some time in linux-next to spot any potential build issues.

[01/14] gpio: dwapb: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/3f19e57cbfb55d743d60aeebf5d5c48cc7fd5d4e
[02/14] gpio: brcmstb: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/56f3a6d7538d2e0dfb8d9df7871d2a9aec3115ac
[03/14] gpio: htc-egpio: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/2557b1f4f21a75650a03c74a56ea30bd4214866e
[04/14] gpio: pl061: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/b40c4dacf48a42ddcd701552575945e90f5c8060
[05/14] gpio: ml-ioh: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/1f37a9f7d1fa582833cc8e226d77e5b2397df9fa
[06/14] gpio: mlxbf2: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/a92f492a1473eb2255be9b7b767d0720c5c3b2a9
[07/14] gpio: msc313: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/07a251bfe3b690ebfaef7c46f6ce25ea9ccba8da
[08/14] gpio: omap: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/2b3c8bd8e13bd101fe8833b1f02ef5e5a6e9920b
[09/14] gpio: pch: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/0ed358a87d6ef9782dca161ef3f1311d21f257d2
[10/14] gpio: tqmx86: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/75ff16234bf3af747b9c77b81d7ce3df5c09df8c
[11/14] gpio: uniphier: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/46e90d3924cb58b161c2dd57ba05f3a706c1c0e2
[12/14] gpio: xgene: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/353fdaebdc6991f1cf03ae3aaec266ad0516859b
[13/14] gpio: xilinx: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/dbedf93d1082b4e755eb62338e5f6566f4e31fb8
[14/14] gpio: zynq: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/23ac52a4a2dceb704d8dc1674abb8beefd93bf1a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

