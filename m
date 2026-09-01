Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362D8C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 23:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmOCGEePW4HCHBy9intmcc0xfKUaVb9xCHFv+Cs6LwY=; b=RCegbktn9N1oU42y21EliZlWM+
	Ockmc2kr1HMNOl9rSwrLt2VnJ+M9oBc/LIUvpdAMu86Peb8NgSslHLmRwdgPZhVpQPOyi5pzGZ3Yd
	Ho2oAS+IfqfkP9ag6to4mCt2NRjPggKAugA7uLhPY2ilyZx6e0tCKNC2aGYL4iyuoCH46t73YliKL
	8gTNWp+YSdgD+LBfZW71oKSapFlaIpG6EC2X0xBTeKg/t6Tni5hPHtj+UyvX6I1ld5L31+dMJpB42
	eInt8mtArk0axs65Sgn/DmUHWoondowSMERJrVOz8SUYdO7s/k74rxt4xa9LHyhaxTudau/3Bv2S1
	oXhZSy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1XXM-0000000DW1z-3NLz;
	Tue, 01 Sep 2026 23:05:04 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1XXK-0000000DW1R-04yv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 23:05:03 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso613675a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 16:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788303901; x=1788908701; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tmOCGEePW4HCHBy9intmcc0xfKUaVb9xCHFv+Cs6LwY=;
        b=Z7v4OYUM2ANfiAvwaMJq7/6ryyHnzR+1ygwKleX9Tm8EAR/yRn7dyMc0+0Mo7ZzbGM
         +9/2clSbEP6jlAXL19cEl+l+fI5dGrtfCrS+o0xs8O2nqKfFQR1V9rLmY45RxhQmZduv
         rIS2ndt0J3ilO/tawCJujqgjB8AgYoyK74E2VG29djDg8k8Z0BDduyzKfCh6LPgC6BAa
         D+KXuVAnjrQuD7P5nPtLVTrRG5NVzD3hbNvhb+eeR9w823Hg3IlopuEkBBcgmekQXr0N
         1YxahSWZhy8OVZU1als/y6LI2OJSm9n2PPSNXTMge7oCNvDYuDwcflWNg97xRfR4+O2E
         VHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788303901; x=1788908701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmOCGEePW4HCHBy9intmcc0xfKUaVb9xCHFv+Cs6LwY=;
        b=Ej3pKt9A+xBv0NH1w/M/RDXIjvDeDXIG7HFb8DleoY8kkMYBtG0P1C4+gwKSYipKDt
         GgSXgC1/6mLkMwmnY1AZtDde4SXe+71dIhfnyUG/97AybdFCU+6JhHSR+8rQ6pPnzaFK
         3TIUtBE32GFYKtVhMvPVW9a7F+OliibObI99cL6tuAX0B+HaxQot/V4GCLeVmrDJ6I54
         OZQ8ur1+ZI5Oo9ajnE7crXnRXaelei094tJTGfJa7wzg87fyJpfiwdyqyeGt4FYq7Ywm
         M10DtIO2r7+jfkU11+xcJA7fWJsWppvBa+efDWyopSBiz5ZDe3KvedZ06U2w7Jne5tVY
         4aQg==
X-Forwarded-Encrypted: i=1; AKwUvBx5gtm/+xpok8t8KRA+qfg+wHt4bPmatotAlOSJoYXDeO2O1zcEV4WVHu9T8X9yXV1vYhvlLkcIU3rRnOuQsans@lists.infradead.org
X-Gm-Message-State: AFuF++n4out4lyXi20qU0LW5TU+L0pJolNkbQCjoKSap6LeGvZGfRJRC
	AdfROE0+0NUijMv2P/3JYfbvM0rUFI6vcIaMnUe52SGMO83rWpknY1QA
X-Gm-Gg: AYBFou311CPzbcrMQkH+L6Ry2peN95D/gvDex6dUr8qUb4Ht1WCZDxqBVihvkEW3XRX
	uGL9NmGSvAx0CSTrGWBDWneLlO/PM2XILNMeZEEXWZUgU1YUch4hsUonFY+25opZP1QrJt4z55J
	WOCge6odsCFHJN+CZDugXVSXQ+eqUFLWx1dgscGTDLi1sZJ1qgYUUcv+5eJgkbum5KKVQ7+4X8R
	kfAkS5DXFT7yL/9nw+Qykna28EvZ3MT+ZROoLA/s/4dzwud4o84WituTlx7EublWbs5fVaDEV5n
	VazVTegkaA9DFcYdIy8Djcgp/ji1Wksnyj5Bxz/ookvQVQAUgezjU7Y0r/HsUhNUAUKDRxSe32b
	A1l3yLG0T3xcVxgiub5+QsSWhl1ejQ2P/a6ApEBSWKCQ+N+gjbbZxSCU9G0hIBhgk8E7NFfhLWG
	vwsnvrdzJRsqST6ETFEXoMCdU8FDvjkNEJBuearjp3GUEnpZwiU8ckhPba4ZVUfnuwTcddjvQB9
	A==
X-Received: by 2002:a17:90b:3d89:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-39aedf89b82mr567737a91.1.1788303900563;
        Tue, 01 Sep 2026 16:05:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07bdb15bsm1138117eec.26.2026.09.01.16.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:05:00 -0700 (PDT)
Date: Tue, 1 Sep 2026 16:04:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: aspeed-pwm-tacho: propagate reset deassert errors
Message-ID: <e3e4ba55-9b54-41a6-9130-52981f83f106@roeck-us.net>
References: <20260830125044.97718-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830125044.97718-1-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_160502_061242_2F53CA04 
X-CRM114-Status: GOOD (  10.11  )
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

On Sun, Aug 30, 2026 at 08:50:44PM +0800, Pengpeng Hou wrote:
> aspeed_pwm_tacho_probe() installs its reset cleanup action and configures
> the
> controller after an unchecked reset deassertion.
> 
> Stop probing when the reset controller rejects the transition, before the
> hwmon device becomes visible.
> 
> Fixes: 18c514cc0e02 ("hwmon: (aspeed-pwm-tacho) Deassert reset in probe")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Applied.

Thanks,
Guenter

