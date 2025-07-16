Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BFA4C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 08:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfjRAzPW9E6ZzAIhpjTHhDTWkNr0yduVMvkM9EQ/mhQ=; b=vGZU3MMLToVZYGML+qlP2efzMR
	HGBH2T43BGxHHxPbIIBrpOVz2jGtETUC5DarrTWoU99nn0XWv08KQEogSB9KFfsHwfJsN96WvX9mb
	rC7vcTiX2ADPlpnceonSYPpU7AsePtqjgQHP5GqBZKJJf5tZSXwTIDEoerepg/nzA5ALDT2QapqHG
	ZT7ZSbukE/Rp1M/AHYCk+CU5SvmJ2XsCADZgr7K6LFdXS/kdtQ8WrZjFXhXX6S5iOCxTXB7yybOwP
	mGwLEVgkOuw2IeL1JawJ33gcnsvpMQiwO5cY27EJRbHanGrbQHdOCS2M1EWEAtLZr55KiXgdGM2vS
	Yc0sdFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxqU-00000007D37-2DgZ;
	Wed, 16 Jul 2025 08:50:34 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxVK-00000007Agz-2bgX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 08:28:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a54690d369so5097680f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 01:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752654520; x=1753259320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfjRAzPW9E6ZzAIhpjTHhDTWkNr0yduVMvkM9EQ/mhQ=;
        b=OOhgZj1H0NLkXxgv97PwQsfrCYlsPRjyepkJCgQKKcC3YD78x7vcQaU8izIq+UPHuz
         CBCPBBBGpGg4Rko3WtALIymBWms4R0IPnZQVhjupcX6DYV2rjZ3MnRxYCV9Y3ahj941l
         q11wB350tbloamd3sX9ci4yhzRnXirRiRyRKjIAeW7/98dO+aq0i5Lyn+XHYKnQrAV+E
         gyHOOOGrpjheckRSR44lEAfJCJQf16YDu+5rMDhS1iPpzQ5mDzH9a0+mdL2Sb8Tuq0ko
         y0QJBExN5XXbs1LXn9bm9Y1F5Wg8zMzrK/xZ+Kl38OWgZ5b9oNtCFFw96GE2j7TNrkoT
         mFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752654520; x=1753259320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfjRAzPW9E6ZzAIhpjTHhDTWkNr0yduVMvkM9EQ/mhQ=;
        b=C4EIsjYGNEc8uiIowKA8DW47TIOAP7ITM8wH+lLn02hWBMAZR+D3w5glo5C/5zJR6y
         wCoa+xx+bBKva0Yazt3EtjGrzNZkVv1NgTv46m1xJSR27tx5eyjV6/ZCiJNBvazNvpI2
         SqfOO+ovnXo4g+usc6CKGAiG9hAfUfJMZWkNXWtqWApP/0faqOBQo7kN/CcdQgyIVrhE
         +aoA/fPLAm6dD9/ZopnBhFAWleJfKW1kqhn6SuePIU8KmSYXIcLfqA5mUE1obQH8/9/G
         KI5Y56Uss2YLFXSHkNubzduV5rLnKmqKv9Qe5OJj0nNBcdNNx5JxYSnhkCjHl4SFEpzM
         p8dw==
X-Forwarded-Encrypted: i=1; AJvYcCX8SQpPewfjEejEH3vuf+9QfAiZonuq/bc7rkysMf74ORPEyg/YpMe7MCW75CdH7hTDtByQ9zs2QnxYriuwIIhE@lists.infradead.org
X-Gm-Message-State: AOJu0YxbTc0IgZGP1bOxOFdSHmuk0VUpklpJ7vqG2ErILLTNwhg008TT
	NxWvUSQpD8n+cD4LdASShKnsdIJ38/1glMB+pJEynzeW4LRspsQmX3Xm4MsXnDq2xsQ=
X-Gm-Gg: ASbGncsYlynOYaiVfiKX+mI7npY2wCxezqdHpqTCr0dSUWsFMTYpfbDwEIx6pwV+zcs
	eRi3TT4/t5dOPhID5tFXAm+RRDnLbi9l8+VhJkWNZhWMVXt+JavVqf46vXZZ77ahiCHNoiHyPxL
	sn/i4jwlCnMuXXEyqXR7hA659Zn22X2bOA9QNs3cjqy7s2Wa9FGHZBuV3haviiGbSA5m9czmbkr
	CWQYWiLa+v1aFkCkEc2VvSr3D1UQ0H0ZTZnLpwGF3u5+DZUPvyGv1Nx1NHcAI8/e/l2pPYr3mYy
	BsWdZuSvDAFK7BhL7GteaeMUZtGqpgrkJQ7QZjzvMC5KNfN/FwIEbm21QpEYRTO1ImbVwHddWUe
	2fk85CV7x82EfP30ouKcRvg==
X-Google-Smtp-Source: AGHT+IE68/qlmGIX56IlXOlLxml610TZz8F68E9PZ++hLHDc9P1ZDNaMmnQ1tVZnFt0XKa62knHQCA==
X-Received: by 2002:a05:6000:430b:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3b60e50ff9fmr1062721f8f.47.1752654520388;
        Wed, 16 Jul 2025 01:28:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:e8b9:11d7:19c9:41b2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14e82sm17287901f8f.71.2025.07.16.01.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 01:28:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] gpio: use new GPIO line value setter callbacks in remaining drivers
Date: Wed, 16 Jul 2025 10:28:37 +0200
Message-ID: <175265451580.10877.15532708023266392185.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
References: <20250715-gpiochip-set-rv-gpio-remaining-v2-0-072b4cf06330@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_012842_658049_FAB00C53 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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


On Tue, 15 Jul 2025 10:19:43 +0200, Bartosz Golaszewski wrote:
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts the remaining GPIO drivers.
> 
> 
> [...]

Applied, thanks!

[1/2] gpio: wcove: use regmap_assign_bits() in .set()
      https://git.kernel.org/brgl/linux/c/03d4bd5729f3adb3dbf923ab08affb5bad262d53
[2/2] gpio: wcove: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/26b6443826d98ac1f5c780788549b8df30e12fa2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

