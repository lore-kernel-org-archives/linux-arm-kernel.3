Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8639CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJO8l0QRuWP0pFrbvTYkzMC6Ke3KuvPS+wOCBatPTaY=; b=28OEk5d27UhEHqfohhmtJl8tYX
	Bg9X1IDIB7AV5zymX/yXh1sYB86TWRZq+LHn4kRNK3xc43/MKtaFFIKUkuVCuDGUEbCX2CqXyDpzy
	bOpKwOKG2rYHV8oWPzZfUlnqWw9PW+zbSAXjoaYrYC2+1Un71y05AdVKYHWvmloxfaOaDlrSojf/S
	lpML0hZaQRjraYmfgHJlBoNidBQ47F5dNCwZHHw7pB+DjD6ZKBQVfk2E3J/BtaftnVbW9goxrFed0
	Hl6yDzHigAOik0IogB0lAUnupR100xbZPEpVj47cjyqM6h0A7dx4HE5CSeXbW0Wg0RBjxCKGkunNq
	HMtnNF6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPh4m-00000004gx4-0pQI;
	Wed, 20 May 2026 13:35:08 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPh4k-00000004gwG-18k6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:35:07 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-12ddbe104ccso3423286c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284105; x=1779888905; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJO8l0QRuWP0pFrbvTYkzMC6Ke3KuvPS+wOCBatPTaY=;
        b=Vu16ZyJXbGkeJQJpJpNmfeH+JsrPjSg9u9DzRNhiXDJZOkmJhEcjpiueHvub6sLz6I
         cRkqLNDAYiMYMqZoUUD+l9PO7qoNYnbEQI8QRuk9/febTWaHPZgCkFOkqNSN4Yhm+hoY
         PpSIXJj4/3beF5ZHyQvmS7tcuGPg9Up+ZNciwtxSo1/XSLxVjFMfktVOVstemutD81/K
         ZxGQ4SRX/jh+qVsDWwkR2uSULzUm9vgFAgedsYFKlZEkjq4FOzDDAQtNlVOeg+HyVaWH
         2EB7aTChdKD8QBWNDwno7Wi3L9NAZ0FldTKld4xoXKvaYscIN6d1ZUsbHxacLyxygxPr
         TQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284105; x=1779888905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJO8l0QRuWP0pFrbvTYkzMC6Ke3KuvPS+wOCBatPTaY=;
        b=IrloszJlHiqSO1xjkxeeDgDAkerZ2v9kH1ZxTDKjVjBt7HKbcTyzaCXfJI5sRGjGw1
         3UnFqxlb0k+3Ycp6C6J4UfdulJ+OQrXEOyL3pQWWBvWBFCWYPe27zFjqyLF02oqgTBgq
         KCcymCkYYcKuqHKaQOGK1X5Hd5F2ugzxrio4wDwBxYBpwXUF2yIKNT5Z7P+0PfBPfosL
         FvjcXpJlXk5fhJ9oOEABebSTLEy0PJJKMaT9ffBqcZvDh6+7dJTytmtSVpiv0jipWouU
         MWtF/PAau60PZQgv2mqlRV04T9MLvnL2LNst4pkLqeld0Yiu1cEcZoHqQnDgz9lDSXM6
         kKGQ==
X-Forwarded-Encrypted: i=1; AFNElJ86qRBL2Lgxst9G56J1Sj+4lPcKgsnd1sg5sRN8kJ0k6xfaSVbaIuED+cuN0k2sH58mG/SxR+/UV6xvQGtbZ+Vz@lists.infradead.org
X-Gm-Message-State: AOJu0YzZFiNYxFS0v05bdrklT+1zciaNxwm6D2ZdqTEj8GYLE9xODf92
	w/LiY96pBvmTyN95Wpf/kdn9CegDbg/qsGbteL+D5tRpNr0H0DO0n6r6
X-Gm-Gg: Acq92OFq33MW9Xf02tG16cA64eU92MSpb1tcjc029d/jR5FUluHzLGzUOqlcOXHQYdP
	Bk5/kBEaowm8iKRcrHsKYMxQhakFRIq1KPy5ZVOfph+Theq0TvxPP7crI6aemjoBbiS9nO/QhUp
	1y3BIymgO3WR/p0PKgcM9fALoN8qc3+PiShBiycWrantKFjUFHMInho/faYLyTFTNcwq+A54VVq
	tFXvgElU1wmVqSX+h082M9kiy9bxZgZf0uKhhRGPPnhY/0dZhvDS/71XMPsSBfBbznwFvF9G58v
	It/HvkT6s1o1fT1H73K9SgD6KdNwmyyQa8bRxWzrmmRsAzJPAWgv6bUOhI632fEXja3VSHeA+eU
	8l4A0GU5+b9EBtjvrqtuRYKCIF4Jw3sdQ84Xfqv6zDeKF2BtNJlNjAy38Q9NRZBpaM2uDTdXV+e
	xhudJEn/go/Lf9nLvpJp5jJQiCM9JURFZyuxCS
X-Received: by 2002:a05:701b:270c:b0:135:e312:47a0 with SMTP id a92af1059eb24-135e3124911mr1830342c88.26.1779284105158;
        Wed, 20 May 2026 06:35:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm28779710c88.11.2026.05.20.06.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:35:04 -0700 (PDT)
Date: Wed, 20 May 2026 06:35:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
Message-ID: <82f2fae4-0c1b-421c-81e0-dcdc74d0225e@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_063506_313302_E57CA81D 
X-CRM114-Status: GOOD (  10.96  )
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

On Sun, May 17, 2026 at 01:34:43PM +0530, Shubham Chakraborty wrote:
> Add Raspberry Pi firmware voltage domain identifiers for the mailbox
> property interface.
> 
> Also add the voltage request structure used with
> RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
> definition from the firmware header.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied.

Thanks,
Guenter

