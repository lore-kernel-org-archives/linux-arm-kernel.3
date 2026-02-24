Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D406F3C997
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrV9BhMxEEs17TmWJHa8CNzBUwr0TwzU8O3qC1THpDI=; b=P1pdO8NrH23OZPP/rvHdndEGLl
	4atnMXKQZqmLFBxNwnEbFmVjD4Yaodi68ffKCgmiPppJo+2cnoOW4On6pCGatvHvz1Jgea7BFi+Gz
	vO/ieOvMRg3n660NsuYCkEBaeAFH/aECg3YDpCtWaUB9FxEEWscfMaOtTLWp8hrvbYaCGGkACAII1
	uvbvGM8A+gP+zP9uj+3AivW3pW6WUzAYvk2xu2PltWKIjJ6xNgXYK5E9EulqvcT3vnjm2XXt5p2Ba
	SrYrW6YmNu1RijxLNsP7aRGR7IvS5AxdpC5K16ntQAAT+on0kw2i8pPYu6Lzo1J5LKr7PpH3UW1z6
	0dDUWGNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuIS-00000002JGr-3PLb;
	Tue, 24 Feb 2026 15:26:00 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuuIQ-00000002JGI-3jbD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 15:25:59 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1274204434bso4320104c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 07:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771946758; x=1772551558; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrV9BhMxEEs17TmWJHa8CNzBUwr0TwzU8O3qC1THpDI=;
        b=Vq6IWx/w5IHJAAxQA6bY6lNpB9oKzM5NoXnkda+2rMs8EdqpXCDEcPWTxeG9jl+qxf
         tAym4TL8+RkpRMipBmOsO+n+qTh4aFiJTs4iqBFE/T1K7o7SbMtiRDM6nMA97yCAaell
         OCxXJfygVicpnMX2lx6a2Jog72Hzu8ozoAmHDDMp7aKhmBHvMW6d5nCglJff4DU10+Dj
         CoTK/WV6afklY0O2jVQDbeqIWukhbzZcAjRyhMiGSghNaDUiTc3oClVj3UV5XFaSIlA5
         2N2ECB9R1wBYqCb4dxZeP866jQ1v3e0on5LzDx/IBHy2/BAzCSJKwSBX+BjmXTS7wvHk
         show==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771946758; x=1772551558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vrV9BhMxEEs17TmWJHa8CNzBUwr0TwzU8O3qC1THpDI=;
        b=uNX7rfjlhtici4HxiOsOSkqWCXTkuTc5Sf1u0u3RmoV+K/jv8Mli2X8wBs1ohgzJry
         GpXnQxSlk5D2V2SdyqpiwgfqU1e6QGwvVZcDZnBixuA13I7dTdxdpW1z5PfyHFZYHBtP
         PSUg/dh6GL3RwGF4WFK+Qz4uHJIUX0+YWPYGXfEJjf5kE7Xp3iumE3R7PZ4k3FCbtcJT
         IGRoX4x/po6vsZy7eliIRtBL1AtlTMOzaLU0XNZqfAMMldJQWefdqw+WilPW1dPmjeW+
         HWxEigl1McYaZTpTXtph0aIuzdnsSkBcB9WbwFFN4ZNpcjBqBzaEe5nBcnRr+U0+jc4G
         VTgA==
X-Forwarded-Encrypted: i=1; AJvYcCUQt3omXzKwJdHQgsZPBBhYe/j2gI6g+my43+0flDpRweR5t1TMFbqXZrGv0M9Hp4m/woRwnaUiEtP9KKKBNmt+@lists.infradead.org
X-Gm-Message-State: AOJu0YwmwfLVQ8QM5lJ27psTu4Sd+f9wSzFivUuCNDZTLCDi0GC/Z8e2
	b3S4tpBjt99pqvfl5L+e5aqFeMeP7RBiN2zCT+nqt0iRg2LcRvbrlSjF
X-Gm-Gg: AZuq6aIxmUIQwLjKPpDax3AD0CS63pmkS6sXUJ8HMdpHXiBAWVatCIiBb403kFiWkKH
	uy365R81ETyHmk4/JMi0LRmpz7ifIP7Zi7HZTQRC2HTuiTwc1vfMvKWBK68djXlPisPPSDiO5N5
	slOgmyKKWHbfo91VXLmumyB7mBggmOz6Q5IqVMpIy/IxDhzwULSsNyKtrDsVSJIcILI+OFGlSU/
	hv57qGOhmZW9H3dgcT3sIx9z2wR0o2JJwfBw6kGIg1IDwG/MaKsBVfvFqh2/2gCCB1NkrBOiZYb
	d7TgNFqzkV11hfwF27dn0T1RT3M2BQcj9W4df6E6yWjNEtCATZwPF22VTqoU0TPcRSvjyIyG9jL
	koR4aqU1kFe2f4I1wo55QLklL2BkBSBlSpLnbrtZuFt+PEnZe1+pr5qwWSbUx8P/m9/GMv2nQtj
	ARnOWmvQlqNdD6I324O+aWsyZcQlW13bpyIjrS
X-Received: by 2002:a05:7022:421:b0:11b:ca88:c4f1 with SMTP id a92af1059eb24-1277f5606afmr123769c88.20.1771946757470;
        Tue, 24 Feb 2026 07:25:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7ae99sm10658338c88.10.2026.02.24.07.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:25:56 -0800 (PST)
Date: Tue, 24 Feb 2026 07:25:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/8] Revert "hwmon: add SMARC-sAM67 support"
Message-ID: <05db17b0-d9f0-478d-bbe6-1efdd9802abc@roeck-us.net>
References: <20260223100459.844967-1-mwalle@kernel.org>
 <20260223100459.844967-4-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223100459.844967-4-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_072558_932320_D720B956 
X-CRM114-Status: GOOD (  11.09  )
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

On Mon, Feb 23, 2026 at 11:04:48AM +0100, Michael Walle wrote:
> This reverts commit 443b39c82c322c9f3c38bea0389fe927ba00b3b4.
> 
> I was just informed that this product is discontinued (without being
> ever released to the market). Pull the plug and let's not waste any more
> maintainers time.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied. Please let me know if there are any objections.

Guenter

