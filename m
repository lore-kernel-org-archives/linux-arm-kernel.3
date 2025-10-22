Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4792CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 18:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QGp0U/4pbaeep/z7J48UOg7Dw8fa3jK3AlCVPGVI18=; b=P2dEyitg2u4TmoGM7JStu6CVAV
	yWBlld3kpUYsHOgCIeUStiReINuP2sDYuEPQk/4F5+GT1K+PKbxPKBvAJYyW3Jy06joqVdU3tNobI
	G0hi+hUU4MghoByzWv/V9i0Yv8mfpXy74xVDmQe2d7huivDij2SE8zAfLEn0o/FFYxwCGiQj9Yfqe
	pkQGtIcIUnWBgcrgxmYbHgBi3F/icLBpC9PepUI7DrMnrzec9wj2DFH1gOPyGjFG8e4tDFgZpqN9r
	QrYK432yAT7NlZ+X7LNsdFg9g2hGLgMZwkQ1yGitUmOlTkz535BTBFN+DLdgD6v+hysC4LqQnx/ov
	FpC1DfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdNR-00000003xYQ-1bur;
	Wed, 22 Oct 2025 18:16:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBdNP-00000003xY6-2tKh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 18:16:00 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7a26ea3bf76so783189b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761156959; x=1761761759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9QGp0U/4pbaeep/z7J48UOg7Dw8fa3jK3AlCVPGVI18=;
        b=dchP0eKrpDiOfocQtuy1lgTMyjU1BXlC8NOo8i8o3W1KVGu7upaX7JqJMM8Ep8K48Z
         2t8sDvXHIDju10FwJwr/LECnQQKXcDhenS6+IlPi2AT/g3RyzDq7nykasFXhyGXfNlFZ
         QxBXGZnj0aQxg7DLRhjdDXk37zewwbOYK+09RT0xKUM8CpBHT/fOL5tjQkS4PkuYI+W8
         emNXOxRRgElsSi9Al7NtEUeSewNEq27mIHvzP1UNXtxI957LdY1u1S+zHmjpDMxAAbOg
         fCZ+66dGp1jRDMAPnpunVsJlatN9UO+kl9fAfRX8Xj8MY7xPPEBW3zpEYSmIskD9/peP
         V4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761156959; x=1761761759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QGp0U/4pbaeep/z7J48UOg7Dw8fa3jK3AlCVPGVI18=;
        b=w5/bHgJ9t1Ye5yjO3sMVbEsZsSorWAdBz1p1GzjWLHK2roMt13DyeUsfKoyDQRayhK
         FThF3DppRlnYularfL6eep1mUA1vdNJi0e9ZsB5qxllTBzJtFynsv+QtfPWkLixWXh0B
         em/TQNJX4iACr0uNhH3obQhT/3mNzU8puN/JIZ7U5ltVWl8YgF0Z52zPP1reu3jq9PZk
         /JevrncKO7E6O52iliporGXcldwbeGQDEFD76PjQUOx/Q1hS+BjdUUfPIHx1fgVue0Z/
         TPX/5ryW69q6vbBdxKUOt+DYcdVj5atHC51t8Cef+vJYO9Gf00KEAUsh7ND7h7trIfe0
         OY6w==
X-Forwarded-Encrypted: i=1; AJvYcCUIKE04IlCruxKJ7klExyB4vWnST1VqHfdZjxz8i7lcPSKX2zDbouhausIiAQOw7xxAGWbOPlc2CX60pB7nynkz@lists.infradead.org
X-Gm-Message-State: AOJu0Yykx+edvr/ar0lzSi9ht3pQsblckAdZ4cbQjKhWFmm75HRlpAuY
	xlXfJvGte8hyiz4UN/NSMrrlJItL0iqqpcWXw9L/PSd8EvxN1LxI/1UW
X-Gm-Gg: ASbGnctbYZpZXTWqaVt3AplnlarcNhHf2Y5KVwv0hQYrDwmaVh2d9d8clBITwpVv5uT
	mcSfaKnxWWgdjAwkvIWepOKOAjZ9ZImSQFC3NtwK5x1ghDCejQaUyxuUzjOZhWSQNcAlWtbpH9b
	/PX4ywZQd/OrNYrHiQoMECNHrtFDFgrW0ojlvrYNodR+s7ARn8YyBqrqtf6rwKbRS7VCKoXciyN
	82HA+CQdfGLYW8zFWMWkDpIvrTpfa6uu/xR2hY9b2ZpbWdFqOhpDOE8GQmiGgCAZsImSMqj6TOt
	r/KyVtnMs8VjdBzFX4ouqPUThu2nhJfRdgNWoqpWcJA8+JfypWSidPDlzkMrFPSnPan18HZ2svk
	mCQA0rGs6ZZH5MzPPlNypdECnZupC3u9GsGeKsXYSND4vxwpERqauUcLFKYA87sfYlltLVEXsMF
	XFluscENDrkJrqSNBufukuJi7apSo=
X-Google-Smtp-Source: AGHT+IFMLQ6LX3tUc8TguSda9gIy2Uw3Gh8Ff81wUitAtyD2okPrCzKkucLqxqPjpTHJn/jjBsd/SQ==
X-Received: by 2002:a05:6a00:8d3:b0:781:24cb:13f4 with SMTP id d2e1a72fcca58-7a220a95434mr26308242b3a.1.1761156958833;
        Wed, 22 Oct 2025 11:15:58 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm15114561b3a.70.2025.10.22.11.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 11:15:57 -0700 (PDT)
Message-ID: <6a962d4b-f624-4eac-8a59-5472fb82b591@gmail.com>
Date: Wed, 22 Oct 2025 11:15:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/6] net: phylink: add phylink managed MAC
 Wake-on-Lan support
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <E1v9jCT-0000000B2Ob-1yo3@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_111559_734881_3DA6AF4A 
X-CRM114-Status: GOOD (  20.41  )
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

On 10/17/25 05:04, Russell King (Oracle) wrote:
> Add core phylink managed Wake-on-Lan support, which is enabled when the
> MAC driver fills in the new .mac_wol_set() method that this commit
> creates.
> 
> When this feature is disabled, phylink acts as it has in the past,
> merely passing the ethtool WoL calls to phylib whenever a PHY exists.
> No other new functionality provided by this commit is enabled.
> 
> When this feature is enabled, a more inteligent approach is used.
> Phylink will first pass WoL options to the PHY, read them back, and
> attempt to set any options that were not set at the PHY at the MAC.
> 
> Since we have PHY drivers that report they support WoL, and accept WoL
> configuration even though they aren't wired up to be capable of waking
> the system, we need a way to differentiate between PHYs that think
> they support WoL and those which actually do. As PHY drivers do not
> make use of the driver model's wake-up infrastructure, but could, we
> use this to determine whether PHY drivers can participate. This gives
> a path forward where, as MAC drivers are converted to this, it
> encourages PHY drivers to also be converted.
> 
> Phylink will also ignore the mac_wol argument to phylink_suspend() as
> it now knows the WoL state at the MAC.
> 
> MAC drivers are expected to record/configure the Wake-on-Lan state in
> their .mac_set_wol() method, and deal appropriately with it in their
> suspend/resume methods. The driver model provides assistance to set the
> IRQ wake support which may assist driver authors in achieving the
> necessary configuration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

