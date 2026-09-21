Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBD5C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=; b=u074eX/KO87VS/JO0lWA3Fa+oe
	kVL6jOtSHXQ4kuYdAPCFJOutN6xmsV7CUmNSx98QC456cHx9BmXh8MnoJqmKx0sE30EdSdlz4xRWU
	MMYo/izNECHerwqOA52+XJIjNuUshWavN7BFUrlAbbICdyRTDIjTIiVMmoNXF/ROXH2DfE/bSIqMU
	GjkqpF+pWg58S6aylq/iPFTBoDn/eAX48Fm1zSdqefwdK9kJq/w58B3dn/btIwvmD/JewzaL5C9sg
	oaxEfj+DtdD/dcHt9GPEGU/CaJa1RbDAA9J+HgN996Dz9UFml1dro2fmvK8IabvbwnFjokGqRaUEN
	u5p81puw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8flK-00000002a0B-0fMr;
	Mon, 21 Sep 2026 15:16:58 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8flI-00000002Zzm-0huX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:16:57 +0000
Received: by mail-pz2-x0e.google.com with SMTP id d2e1a72fcca58-86e6d007703so2608346b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003815; x=1790608615; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
        b=UxJBlty/oNKDj7xoa8BZ8tZv0HC+i3svbLQfXiZO44fig6VZlgBl5xfFhpv1+Vnxnv
         pDrI06rhrpZcAjAUh++BWcFeVgTnflDsGFEA9H8Xm815P4eGTc+rvk1XfAM6IvF8onFN
         l+QHdv+I22FutI4N15xhZdHh1RiUsla9LUghX6cUplWtQ9WQZRQ2VKMZdRteycCEpYZQ
         nKDxgjQaU0QV2ZAjIMwOCRZCOvy5nMdVFE/CXTB2stp/+dtY8000GSTJaayxYrmoik+s
         sZOwRCc+jM5/GBpnw1fB5vC/MB1zigvRhAf5ddcfnBoi38WnuXCw0ywR2UrRWw1zcwLs
         PwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003815; x=1790608615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrpGKqIUkLFawAwAJ6T5iyyW+Mbq35mI1r9oJC3ubjA=;
        b=lS5aHlS9Kd+TrA3IoE7LjGZqEXrLmLBWYct4MN3gBRzhzO4xJS4i+h2f6JL+/qSSyE
         f/figGwdTH6KflKYMQ6U5v/TsWY5uQ0A4Rvn6PS2bLkz/mkor+76Ne+SsekcuTqqtZAt
         QsO4XL0UtwSnLpqPYBrlEkcMeyvwBOwzEZReVnothtdXMXwmt6WMoGjIHLk5RBbNDSBl
         0O9aUudD7v3bPXmzyrcb3ixaoaAInIJ3KKktFZVdgqMIjV462/Qsont7nDnKa/7BCMOI
         8Ga08GpiVVAnJwuGx7EzkJB1+8+HHuRJxjZmCd4sNDgZN0+0af9LwlcxGS8WEQp+xhyd
         cKsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxY5mysBIBiH7impNgV0VbXWFgz9cL6uCXCz6OMZQPbNNjuL1fBfk3JKMIdE7Z0tPWFtbCqzdDRKAHrzawzJif8@lists.infradead.org
X-Gm-Message-State: AFuF++mTMi+lJw55upcPYNM8NOtBBSjHoHe7l8p5wSFk+Y2hYjR1J4ZV
	RNlOzLA/QZyTdnCQPvWfNDfK86iU5DdSi3s1vrPQT4a7v1OQCMbzMZ4B
X-Gm-Gg: AYBFou3857ksf50HhbPuXRsCrlyk43SYo8KaIRV1fcIES18DPdEJId10HDBwCsfq3So
	nHH4dRsBOWRQ6uIKzne67vbnGWgdc08O2XrkCVYSt0YwgFV2f0dvCYQcymLV9kGU2N+Na1k0Iut
	uF6JT60d3FsxIZUdPVnysEWCdGfpmEktAmxXVp9rA+gyqW8qfx3+hETzCFa727nsiGhTbEshYpP
	semCoSrHeFibY2jV6I0DSZLX8p5/4IcqRThLkpvdlrP5RqUR98HYOq1aPRvL+0xdZTZCBPGZq51
	kfztXwsuShmOS2hFPNraeeWXAhMXdBbJCuLxUjoIPyn6014EQhxDqjJIxUKQmEljuLa3Pmi6Jb7
	XO4rpuhhcytaUXmW975kq2lCdFy8G3ELP96dN1KAbIhRnsRiUVUJxoOk5yP8QzyIFkGRTM925mp
	SriisFng9cEraKOBVnLSdBBrAxc1SJV/Bf4Cr4NVyPjk83m5PAe3l8j6cJbXviV4w63caUr/iq4
	lEmY02xbNzA
X-Received: by 2002:a05:6a00:ad08:b0:874:706d:857b with SMTP id d2e1a72fcca58-874de9fd734mr15109225b3a.35.1790003815225;
        Mon, 21 Sep 2026 08:16:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a95eceb2sm3431796b3a.24.2026.09.21.08.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:16:54 -0700 (PDT)
Date: Mon, 21 Sep 2026 08:16:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
Message-ID: <d9dfa12a-0999-4425-ba83-aacd48eea1ea@roeck-us.net>
References: <20260921-axiado-ax3000-pwm-fan-v3-0-3def8b6ffec9@axiado.com>
 <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-axiado-ax3000-pwm-fan-v3-2-3def8b6ffec9@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_081656_206797_E91F496D 
X-CRM114-Status: GOOD (  14.74  )
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

On Mon, Sep 21, 2026 at 12:23:56AM -0700, Petar Stepanovic wrote:
> Add support for the PWM fan controller found on the Axiado AX3000 and
> AX3005 SoCs.
> 
> The controller uses a hardware tachometer block and interrupt to measure
> fan speed. Fan speed is controlled through a PWM signal supplied by an
> external PWM controller.
> 
> Register the controller with the hwmon subsystem and expose the standard
> fan1_input and pwm1 attributes. The physical fan is represented by a fan
> child node containing the PWM specifier and the optional
> pulses-per-revolution property. If pulses-per-revolution is not specified,
> the driver uses two pulses per revolution.
> 
> The driver was tested on AX3000 and AX3005 boards.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter

