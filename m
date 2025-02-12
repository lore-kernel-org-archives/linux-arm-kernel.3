Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C3FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tXCdN+0JkkY18KL8OSU6hHNRFl6UAgJHQfjogbVCiA4=; b=LFztTKiXo/R8KzCzYek/+q25j0
	+J4tJb6vVpKMOmWjwdCikewaIWMUMrJ0m1oktCpKdZExoB1To1rPab/BUWjO+QgOMc2ZTapmxQ0zK
	F+gegC089uUJpUFQj+TrKI9zxsNVcA9ndz4JZyY1JH6PfILclndotG9R3exzMMt4SvOjZ7ClXCOHs
	+aGgsz6Ya8v5ba5/2F7ANwIa69t/b5E8TUpVx2RJ+TdgpQQh12gvEpfE957eLZiBIvDBT0eMViEvs
	RxmN8kGEOfxUqlJ02wHK7UUXq41azb3Cx3hM02NETXuNS/9lu7j3YstS/rbY3FmmDJk/Ym2epQf6L
	6wPUYQfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9m1-00000006x1q-3Nh9;
	Wed, 12 Feb 2025 10:15:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Vh-00000006tQQ-1gXb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 09:58:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-438a39e659cso45823935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 01:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739354304; x=1739959104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXCdN+0JkkY18KL8OSU6hHNRFl6UAgJHQfjogbVCiA4=;
        b=i7Qfb38QfYuRvCfXKI0mizhxUd4TD4K7g4OOqO4xQ6hcBfkb3OCHnB76X4sBGCanL2
         In1M/AENQUgIyBLPNtrsUVC6trVJM8bIAq/GFnU3IQ1d13pMoXd0I0RxHlHGRH5wPGjR
         f6PfZmwNba7VlIui6JTEqsOoSO14fkLCK2qldHsrgATZt8dAmHS5e7N6R9vrz3RWKAmd
         Y3DexUvIHV6eU+csDSLAhqML8IvaKTQ1UvKbjJDlHjo9NF1zbumdPJNF+2jhreKNuiwK
         sWULD0LgT9Y3YfrELc9XWcWhEXVYXvrLcSTnWHA3HCEL8SMwyIR2NFnxsVDwdPzE3Zzv
         14zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739354304; x=1739959104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXCdN+0JkkY18KL8OSU6hHNRFl6UAgJHQfjogbVCiA4=;
        b=P1LbCcwGPTtNpmoftdo5gqcBkh6cUIuSYYuoV3dAM/uYOGS9qVhtY324AevXARbM1P
         2WDLhQ4gf6c/QH+MjUu3Cei5tSOSNYQ4mw1JdVpPn9t2ViuQ2MAc6/DIqVE79rguT3QM
         eABlzCCEOqyAkvDg4VSbmk64Oj4L2ef/ZkQNDMyq3N+sFlSyHBgAAkuiQi0LBBvWxjcw
         daYLz4oOLQ0iuZuqoF4/KOS+Uo29ILmUT52o5v/Pp4NGtwXiMmk3BLklrCROSVj+siE7
         7yY/cjcoIxKnhgA+SLoA0eDKmHNlrqC8M1rX+Tmjk0QDNsYAIox9d3N9ImEBqE/L7/Rl
         Xbzg==
X-Forwarded-Encrypted: i=1; AJvYcCVj8j23aGMq6e0o6ReWvQgSIB2ufJ2MMyJWpNhAgZCbwh7zkn3y1pKt1FxHKOJgmSlOxzy2YnflRl5iv7nZbU5M@lists.infradead.org
X-Gm-Message-State: AOJu0YxiuAhTV3LmF6NxkaRazx4sjkFMLGKc3qt5n2d7CYEC16w7QmHt
	72Rk0k5jEY9A6bDdgMQDHx+N/rx/dl+gSN4kJ1RIMtJLgErYjBYwFKOysD2sN4A=
X-Gm-Gg: ASbGnctVuUpH9ZtZrJNCiCxPjca/2hTaK8Ds3bHN5fSxg36BfkeYsd1MHKr7xKc999s
	nRcHSPLKRlAoKkyVb4Ct5Reb5AaH9mGOsa9wIuuRjj9N/kcSX4P5ldmwIqQuxwWDICA0YeDNgrf
	gthpTIZXx4OAghZsB+9uYLK5Y3KK+Na8SXOEWKPAjbZ4LWiLc7luBgLrslQrRGPf+ojf1W2y25d
	/izdbGK5hBS8uLuZzfsPCUBnbDUZpndStT5VNlGUMfMRB+rtRM1rEltPX12He8qDbOxY1ef1rIu
	AY7O5zdWnO7L1/k=
X-Google-Smtp-Source: AGHT+IEC+Gn+QY0QYIabf+Hl3KXlYWU8d1F0mJV1sCSbwbfbBxRgth+shDbPFtARl1s9kroKk18pjA==
X-Received: by 2002:a05:600c:444c:b0:439:477c:cf73 with SMTP id 5b1f17b1804b1-43958176299mr29395355e9.11.1739354303696;
        Wed, 12 Feb 2025 01:58:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5e6f027sm15055093f8f.4.2025.02.12.01.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:58:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 0/2] gpio: xilinx: Replace custom bitmap APIs
Date: Wed, 12 Feb 2025 10:58:22 +0100
Message-ID: <173935429949.14007.9294735731624784387.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
References: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_015825_439393_9723A6CD 
X-CRM114-Status: GOOD (  10.34  )
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


On Wed, 05 Feb 2025 11:31:09 +0200, Andy Shevchenko wrote:
> Relatively recently bitmap APIs gain a few new calls which may help
> to convert the GPIO Xilinx driver to use them and become shorter and
> nicer. This mini-series does exactly that.
> 
> Changelog v2:
> - fixed a regression in patch 2
> 
> [...]

Applied, thanks!

[1/2] gpio: xilinx: Use better bitmap APIs where appropriate
      commit: 2af1f667532013eb354c783514839f89d9923240
[2/2] gpio: xilinx: Replace custom variants of bitmap_read()/bitmap_write()
      commit: c11708e2b66b56f102bac83980a52661996c2a21

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

