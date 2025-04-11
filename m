Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB290C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5YsoHQ8CSMxUeDudniraau5fmGGTFuPzw0XxUxa5Sw=; b=QzEOz9puz0piQPLpAiQWNq26Vz
	A7KX9FGAwVFDUc5/Vey7Xcs097Z7YXf0k/z1j0c8ZSuyqbvGsOyEnfmLHTFXOvhUg5UUzrRTHEYWJ
	LyXztIJJJ7KviXhNvNyQuHNGGbnYdS3aiqo3sZWrajYRIcDqv+kEQ+9J5QiXmDVNyryrW1UIUWBeT
	P6swHRStVCKwPIV73FnY15A9N7Hn2oEX13Xzb73JEya769MeE1CCTSQNTbGlihFIR80ftFED7NV6l
	HYyV+ss4MZAaPiUXBtXuBV9hXVksAqbD13qUQK7gkIdVID3HC8WeULHaGJeWomxRKN6GuOOHRyUPG
	P3Z1AlHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32Rx-0000000C9SM-2vs4;
	Fri, 11 Apr 2025 00:40:53 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32Q9-0000000C97n-0ojj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:39:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-736aaeed234so1165821b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744331940; x=1744936740; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5YsoHQ8CSMxUeDudniraau5fmGGTFuPzw0XxUxa5Sw=;
        b=b4/H2/bGcN3xswvzlbGO5IeVO2PBXHVlnaEakHGAUlLUhBsGK+lfqSq/pOXOgkQhct
         F3VnKa033PDzT8rjmeqSlitVeCmbtKQUrFT23H6LFGeo04b7+yMfMq/Lu98szU9UbKxR
         YqXez3hn8pDQqspPtXNnmmeL9NVYkIuD3VigE3ilJ2pJM1Z1JFE+2n32ek1+HGJFgv9j
         U4G11ZC0Ag6l8HR2udL+VtmrOjc06bwE+txAvFYUJ4DeulPaX0Djt4Re3wOGSxIZ2PZ4
         2QWnR/Iv3jI7zDlHittRdr2I3aFZY4uUkFL51L1qNQpMoMKeGSrhWsKNgdbqP+8NuR/G
         QYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331940; x=1744936740;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5YsoHQ8CSMxUeDudniraau5fmGGTFuPzw0XxUxa5Sw=;
        b=OrBkjSUKVwe6+RyCQoq4EgXQkZsfQXnvRW9i7GCroBj3UF4AhWoqPT75XWTcqNgwgP
         7M/PJI2StjrgyDkHp1L6xAsFMqfqHfMUp7xHQZhARsa6mvzFEHKFH9XBuFAW+8OaNeQS
         raVGrYlcmONONnQmsMr4CSIa/dMpIKSyAiv9muunrAejZTSLN/0vLEBl1yH3cBPUyAFy
         Ot/GyWf1IkXe6NGRKX+mjsleui2R7N+V5f5eaBY0m18fxsFVVmsmyFjxZ9hTfcWAn4ES
         /OSL1eb3qhG6Uigt7Xf8BJfW0zIaugKM63JXljTHSjyEDxV/WQPMs5XkWloGaFPuElSK
         FwCw==
X-Forwarded-Encrypted: i=1; AJvYcCUsBnX3wWoSu/8YBaNGgSJ0WgJd5+Ch49QeOBTo4Lnl2w6pabalEOcCNZ4bGRFdZXHo8QR5OIJBo3sgOO9bXQXR@lists.infradead.org
X-Gm-Message-State: AOJu0YxPPGJQvLy9IF1gHtgKzro8EyTNNL9AtbONzSLytzhNsmhrCHni
	O+jvCwFXSjAHldYWZsHeN9Fod1qYzDqB7e9F1sS78OsCL/iwPC4/pGqKNEgDdV0=
X-Gm-Gg: ASbGncvYUbZAY1PLIDAHyhiZyN5791ljqlZjFFTjefzhdIH6WIb7XIV5v/bFXGy9gSk
	mmFU1w+/qFgZ1vLiM+YhnOwVlD4SphIMzaKWkwSOnwp+w5Uh/ZsXl+E/5yXcdJSLwsjftX4u17S
	SUJyOidFqL5Q664aUZQNq/d6ltRtjXDh1ASr8RxPpL2Hhm1box6twxLbv3ctw63iw8B4iSY9hhv
	7khELgtTV0QYd85fUQYaheOJ119Rno47t+D4Sb8xqt9uESobpB6cOXnQtpATpjFRucr2i+ufoY5
	JyYOZIfOYyJ48fo7uV38Ey7e8N9LAu1UBNF0+7XVHDsxJjfL2Q==
X-Google-Smtp-Source: AGHT+IH81RSmoGv2vG9iqqRjG+DYtBzAdJMaGkRjl+5vBHC3a1xD7FDcQMu2Rp5DtnM0NFxvXyDmyA==
X-Received: by 2002:a05:6a20:2d13:b0:1f3:33c2:29c5 with SMTP id adf61e73a8af0-20179787583mr1577432637.7.1744331940263;
        Thu, 10 Apr 2025 17:39:00 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2335294sm212602b3a.176.2025.04.10.17.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:38:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, rogerq@kernel.org, tony@atomide.com,
 linux@armlinux.org.uk, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable I2C devices of GTA04
In-Reply-To: <20250228112750.367251-1-andreas@kemnade.info>
References: <20250228112750.367251-1-andreas@kemnade.info>
Date: Thu, 10 Apr 2025 17:38:59 -0700
Message-ID: <7hwmbrwmzg.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_173901_231604_A0FC98AF 
X-CRM114-Status: UNSURE (   8.81  )
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

Andreas Kemnade <andreas@kemnade.info> writes:

> Enable I2C devices of GTA04 to get better test coverage when using
> the defconfig. Until the I2C host driver is fixed, BMG160 module should be
> blacklisted when booting on the GTA04A5.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Queued for v6.16,

Thanks,

Kevin

