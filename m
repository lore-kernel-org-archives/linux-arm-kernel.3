Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C018D25031
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 22:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VktVEnIPQweX+OxiIakMUxGGo+Z02M+QO1+zUPTcwc=; b=MCIjjNvKLPYtYZ2xssS7g7tLqx
	pfVqtlvB9qT3aESaKfcd0felYVmnBdlvt7DDeI40is4FTQ1JnhJXES+6WaPhBnM3MxEPKKQ6d916+
	tbRq+wDODhpSboI2nnBc0bTmKGj9UrozmEnR7HVW4wqcVyxhGiY8XeYlNRIiLCr7PrKliHgC3Qv3R
	eZDa3wmFp3fjjyWTBJigSetv9NkNIPI1buu/EXJQSqGueLdVCrsmYc4EoWD4+OBGpES4Rsb0VtCWw
	MezH5dipl4MuUeK363bfY2FF6qyxoclJLg1qEArM8rv1zd/Q9qGTxUXw3h9ZSKrZl2QncwGGz/LOn
	Wfu6BpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf3s4-00000004Xst-1Bva;
	Sun, 11 Jan 2026 22:25:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vf3s3-00000004Xsn-1YrZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 22:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6590660165;
	Sun, 11 Jan 2026 22:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF31C4CEF7;
	Sun, 11 Jan 2026 22:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768170314;
	bh=OguSzA8sVgcIVytHQtpBFDSEbItc4oTWM4Bzc3s71Nw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=td4nRqJZ/5hUdA97a8i7BphQbdnT19zmpR7u0CbnG9PD421n4PNQypSfrVCeBqgbm
	 I8Pk86W0xfLAdAEftenprMv8nY38LiHrDl0+Hr7ghdrOwEvkKq5uKfUkepHUzOLsyR
	 Y477lSOp0UOxJHfI/rNxZ5MmT8A7W6dS3b8BwTfroBc0boYH/XbvuSB+vpUZxx0UG8
	 g//86ObVy0ZRD/XW3CGgs+mHGoaVDILoZgaZqRDlwELK1el96k/tCt6UeR/EgvdgYO
	 lfcDJyeK95gqDgcYtlilnNZvoJevj8dFBoS0n4O2t/pv17qZCbyMpD7gsjDAzcN0NO
	 Ebf5RELVlsMtw==
Message-ID: <b53286ec-5c3a-4f8e-93d4-de5ea37f645a@kernel.org>
Date: Sun, 11 Jan 2026 23:25:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RFC: pinctrl: apple: Implement GPIO func check
 callback
To: Linus Walleij <linusw@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Bartosz Golaszewski <brgl@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260111-apple-req-gpio-func-v1-0-6deb1b695371@kernel.org>
 <20260111-apple-req-gpio-func-v1-2-6deb1b695371@kernel.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260111-apple-req-gpio-func-v1-2-6deb1b695371@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 11.01.26 21:29, Linus Walleij wrote:
> This function will check if the indicated function enumerator
> i.e. the value set into bits 5 and 6 of the pin configuration
> register, is zero and thus corresponds to the GPIO mode of the
> pin.
> 
> This may be necessary to know since the pin controller is
> flagged as "strict": once you set a pin *explicitly* to GPIO
> mode using function 0, the core is unaware that this is
> actually the GPIO mode, and clients may be denied to
> retrieve the pin as a GPIO.
> 
> Currently none of the in-kernel device trees sets any pin to
> GPIO mode, but this may happen any day.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Just took a quick look: When we use them as GPIO we always set those two 
bits to zero and all "special" functions (like i2c or spi) always start 
at 1. As far as I can tell we can still read the pin value even when bit 
5/6 aren't zero (and e.g. observe i2c traffic that way) but we can't 
drive them anymore.

Since we don't have any documentation for this hardware that's probably 
as good as it'll get:

Reviewed-by: Sven Peter <sven@kernel.org>


Sven



