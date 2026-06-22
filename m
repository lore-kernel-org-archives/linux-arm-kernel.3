Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F84CDB46D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 01:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9f8PIvMVF+hZapXjR2Pan8tM2MhsJBoGLqzWF0navE=; b=pcZ7x7rhKge+Mb+D/51Uy+86L1
	RMVBl+qBDH+2MCJbmCoXBmr+qaL8assc1iLLykROw0F9OeF+EXDXIp5XIWPEt2WEXr99mBcVBZfQn
	u7viBEcX8B4GxM/QfVKhDTNh9DBlPine7Vy0JWizlZwXLjyer2yuoNPg7TAGoYH8fWSLpZVeO7k12
	4nKtXV5kkQ9iXiZsxsu/NigA1VBQp/XpI/hhC7i5xZZoXZzdODT7bkPZMJHJJVN2FK7/36YzHiavH
	chDeIsmGtN33wv866HGhwY/jdGa0eX2YRF8dBuyjApVNQKQ0hmhfsUoOAJNe+at0tYtYfRqz91/on
	hQ9PPFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbT9w-00000004GTr-2alm;
	Mon, 22 Jun 2026 01:09:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbT9u-00000004GTF-291w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 01:09:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c6ec0af575so23420165ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 18:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782090545; cv=none;
        d=google.com; s=arc-20240605;
        b=GzNAKsm9eV8r7UJlNz2/MCIfW0E3ieHO7wZ3l4fetqx40/0WiAA56PjdTtSsAVDG8X
         AOMrpH89jfXf3rPKzkRMDyM3in/fIO3AW16qoIYJVOWueTiEBL1RiEeP235X1qlFlk6D
         w2Y6PUM1MrkiVhfgiZhS2aQbrjPFZIQtuXza+Qy7fy3G2cGIk1tBXK9wHhpl9X4CdN2f
         f8AnR3asEuBeHSJh0lhA9yhhwQpQby1b8L4HOvp9Rthrukkm9toMjvtyg/talmSSvIsZ
         9bcL4WkLMXY+wuqIpaboB6R4T7QKYZeBrFQ0kaP4IIg6zy1EzM6FnQOE8uMliOnc3M9I
         sbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q9f8PIvMVF+hZapXjR2Pan8tM2MhsJBoGLqzWF0navE=;
        fh=9nSc9DSU5T5ZozseF6j0YnyDXuz+dI7lxjKsNJPby9Y=;
        b=LL85zW+x+R7dFZYCyLCvk7cFogapeGryFhqGnYapeFZhD1T5Ov3XErq9dK4IzlNaAs
         GYe+5ZY4Qhx7zbiNUmtuEB8G4wbQUKGBoQ8LUGW4Be6cGhJHd4KnA5OU5ImjUg5i1Dbu
         sUB5FS4VKWIi3cNUEjbQK389fyjVPTAXy5/Zml7pA+Ht5RRvX5gC/Tur+JLrtZn24m70
         KiOEgzH4lHzX9GQFHuZb7ohaDJThfRGem93oj73+H5FC5UX9AhMY6TUA1IJxN4/YpmVn
         qlF9zQq5Nww4a/hcf1e+gYTGkGOQBklJjPr93KRhakAbNSlLR1sig1VQMZpcDBbGrOxg
         sibw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782090545; x=1782695345; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q9f8PIvMVF+hZapXjR2Pan8tM2MhsJBoGLqzWF0navE=;
        b=EfG6N/Wi0g9VtsXehyEqwXFZaxOxqc8LJb6kq2LA8hFIfrJMtocy+6OxFN9LIonfpP
         Cl5wIph4bYBm5gXW2aRUpVaKm4WjlhzgNbzEiTJoX8lWRkbJEZAPDj3S566SqEpr0+1D
         lcKjLThwmPSK5/tqXPPW05w7LSNB9A/I2LK6e8RGjzdITsIlaQhronMMmaL9CqofoVDT
         ZDn/FiWPyoX2a7ZEtX/YsVm1U1TlhIrfFNby8YRMb/e5ihzipCljZjvmJHvobIVwve8n
         /IpdLsfFL7626PGzJFxPkw8omMInCXColaL/G7inZG8nPDtIdmZt7UdLY4i6qZMeS4hW
         GPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782090545; x=1782695345;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9f8PIvMVF+hZapXjR2Pan8tM2MhsJBoGLqzWF0navE=;
        b=VmOE3N0C+fcdC/wJT5JY+G5j99KGQrkSaucSL8gqoWV6HnTGG8ABDpMkietWNXtGXp
         2oykYXcWDVfucf8J1/HHBpzF9QLmbwjnx0L3D75c1DQVyrch26w0Q/JdsA7XBT8FtAKV
         AYqPjQyeLbuAs/2as3xplDGqFj10YVPRMIzdlpAfbBqCGbHIKj68uwdmFmPwHYXGqk4i
         1IW6022CWR33hjOoTJiWzzHvEnkI1g6XhUfM5dOKDP0SUJGJPurfw3SEI3kF80ZJ40Xe
         97/Lqk8KZ8nM+DJECxevauERmIFdQ22kRDiFokXINHD0roj/iX0DplOwQ2cvxYNeNXQ8
         hGoA==
X-Forwarded-Encrypted: i=1; AHgh+RqzvxJBHnK8+cbU4+FkfQYFXdOkbc0V0XP/9cxbOQz9pkiiGY+2PrAJHL4fXeAP/1xPumkxB19lU2Sy48orOOW4@lists.infradead.org
X-Gm-Message-State: AOJu0YxIzi5C3S1iX/USX9WS+M42ZWVPmsmHZQZohqNWq4CSdomwuwoT
	qAHaZkT20HtzIFuj9w1rQBplvvH+Q2vDWgjKQ/djqiG8TSNFWNGzjVAuxOHs12/6FFY8tI+uwfP
	L+4U5gGbh7qGAKU/MUpg6lQjWrvMOiSvoMf/6
X-Gm-Gg: AfdE7cnkPNIURxW4geTJExhi2Gy4Ppj1D0rC+44bWr86FtCEuEs9GyTUkhfsH6p+ALt
	nIZfp805kzeeInEJwuS5b9Ebj2gRPPWcykVf/PmAoPDrd+wvCLCXnSpHlqCorTAGDjRBGwcP+mm
	Gz+YmJ6apQ7xUAHf9vU4fH1aHSGF4RMrAbUJ9UC+nj1p0iFQ3m501XzJmkahr2UuZxA541suL3z
	J6BtkN42+zQo3lv6nYhTOSD2JdDOb7wdUsR5l3gENvTI9COX4tgw+H/RI3Bu7RK54yrVn3UjiFP
	2qecxcYD56B3DnYfW4M4M0MhTJ8Tx99hd4aSSQ==
X-Received: by 2002:a17:903:4b2b:b0:2bf:2114:ecc2 with SMTP id
 d9443c01a7336-2c718f965c7mr131313365ad.35.1782090545565; Sun, 21 Jun 2026
 18:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260604033554.96996-1-phucduc.bui@gmail.com> <mPIrpl-QRw6_Q9DZcTQ5xA@collabora.com>
 <CAABR9nGEHmy4YSqFSyh+gqXVwNgpaGOjqBeUZyHBmMibHwvMxA@mail.gmail.com>
 <D9b19fqJSQK5FO2BflNEKw@collabora.com> <CAABR9nEJg2R9dkGOrn9aZ_b=J7qMU06UKv+HcwdLmzckBoGL3Q@mail.gmail.com>
In-Reply-To: <CAABR9nEJg2R9dkGOrn9aZ_b=J7qMU06UKv+HcwdLmzckBoGL3Q@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 22 Jun 2026 08:08:53 +0700
X-Gm-Features: AVVi8CcmgoD8a-6Hq5plimGJij8Yn44KzsAgWV7isqS6VvBWdYzEzn5_4Mf-32s
Message-ID: <CAABR9nHBcfmdJu2=gT6iJ0efi9QtqKFC6gAt1rLJaUpyOmPzfQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: rockchip: Use guard() for spin locks
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_180906_576385_24999274 
X-CRM114-Status: UNSURE (   9.38  )
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

>> If the patch worsens code legibility through excessive indentation and does
>> not make any functional changes, then I do not see the point of it.

I completely see your point. While on the subject of rockchip_sai, I've created
an additional patch focused on improving readability rather than just moving
lines around. Please let me know your thoughts in this direction.

https://lore.kernel.org/all/20260622005613.21870-1-phucduc.bui@gmail.com/

Best regards,
Phuc

