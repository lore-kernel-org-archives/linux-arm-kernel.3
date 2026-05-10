Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A660ECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 21:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBXfcO0sCVR4C2syEAAYIryOuaMB2+89uN4LXuaBG0U=; b=GgbK3be2T1q19TkgW5Loq0fITy
	SsCzyyN4O071sIMZrYc/MQq3hWuDIvkblVN3/zs8o0mdVSbrgnzEbgOfWDaZOvG6JKiyzsY5wqekU
	5NtGGeYgBr98DLElj3IV1QLrzhE+/8AEAXppCKZiUXS+vmC997PyP9JvMsJAaAvyduKf14dJIOTIt
	7/P82cyVs6q90h+97gKB7DIt7Zkm2Ch4a0prz/s949mN6NbsxAyQVLHeDO9rvlJ3BPEYJrAdEJyC9
	/4AJzkyAE2kl03FkrmXIUqrNcUx7G4NlEiMfSoyFVMPAQzdqdh15ccHVp3iC4ykFSPAUZAvt30xaL
	jGUdGN5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMC69-0000000Bhng-1agu;
	Sun, 10 May 2026 21:54:05 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMC67-0000000BhnJ-1Kgn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 21:54:04 +0000
Received: by mail-qv1-xf44.google.com with SMTP id 6a1803df08f44-8b7ec7bedcbso16653246d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 14:54:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778450042; cv=none;
        d=google.com; s=arc-20240605;
        b=HiooqfmF7HbntlPwk9FGTUreuvAnkESO4irysfYdIy4ICk3/vAqKns1vvGLFTZrT1E
         2+M8PQhbg5C/5AF2PpTYL+Ew/TzCdnp/q2BpnWU/T81T9doG4rF9zS44C1xhKgFKeJ9R
         SXvlrDsyXj3OarFtBhbVqyCeh9+jKDZQajs96yKKVdIka0cjNCAdtlAcE9adgAHKRQ/I
         jE7tXklMUSvONPbYISxtrPNQ6Ctt2FT1wjNmsTDUNhM7/6STzRKg3eNXQ7uVcJF6Y2mg
         dk6gKR3AAjPOzG2mNH5XWsSlaj0do6iwLTTYq0DjSdLHDmd8wOoJJFUXVWjnSUfRQi1q
         UwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qBXfcO0sCVR4C2syEAAYIryOuaMB2+89uN4LXuaBG0U=;
        fh=AYqw3GhSqqckTkvnpJ2TnLQ1QD207l52m5yYekcDVBc=;
        b=iGbb6QvfzhJ3CmROaf7Lm6fkjE936By9ihNC3Y5iwkEYBIBj4fIHqNV4ywrWmOrDDH
         c39XZOwet56FpEOCtEX4OnOwnHPN6tmfO75zxQDI8tSO4YiFlfO5ShK3580wJd5gZ1ND
         saiEZOog9xx1/VZrV7pGtGPh2S+e9j/ObYadzi5PBVo5UQiGjW/UFUL8Ju46mx2u0O8/
         mZpDPKw+eIAYazSS1J48DZ6Y02K2i5UdjAkjz6/KSYlXSiYDoMa7LhAoRZUnoSlIA6ZO
         IacCYJA9OMi0Fcwa/7Rysj5XAODOLzJxJStp+1ytIyHfzgpFKzc/p/g7KgdgIskA1F8I
         ObRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778450042; x=1779054842; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBXfcO0sCVR4C2syEAAYIryOuaMB2+89uN4LXuaBG0U=;
        b=ar84/8IvubVnzGHplPgHEMUPxVsG2cxojSARPOl6Gd1/FwtLIYTsyTS6mVAQTvtMq5
         v9HDOcXzas5eXkU9dnwffN+KLJVO9hZ8hQh3sCazCaQ+Jf2lQ5pwwgJ3gouf5BrFW1wa
         6NbbSfXLAdXMZVkGBqKVjtGyHmP6BVqUiYYG8RtrEP1UPT1gQ23mlRkX0tXtyLTpkuTm
         JLmv97kQ/Z3/2/yje4RI8p2ItYhvDbUAhSXD5GhxCn1gub3QIZpvRFvSe/oA/GLD00UL
         E0IUPm9UQb7aonae2uKtTu4brjJLSmZOzLGD/X4iJwmjYw6NVGRClUsSAX0kftqVI06e
         JvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778450042; x=1779054842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qBXfcO0sCVR4C2syEAAYIryOuaMB2+89uN4LXuaBG0U=;
        b=MLADHy+hilGYf5F+T6elWQ3N6MUkmh2jeasIFdY+eDfkZ7VL+MB0euG/0UjHFJjcPl
         kh9vnzOwkqF2RMmHHTouXcjmtOnDZzyNe1HReGzVZjqFeTZ62El9PXNd8z1LVd0yDdfv
         CxVnEVrYL0FRAqOLLwOAaEMfEY+5MVUw2+soOUko+PsXRx8gIRP4XzXNr1fEhAsVd4os
         TKjoUhJDZgFuTjW/gzr9CpKo/lYYg2hRGQhm69rSuFTXgXhvFbfK+ArivEgdyUIYedN8
         zSxH2Fg/GfN+xsZ3QlhLll6w+IrCuveKB6bOaO0pRHNW85JvltFzrBYrJhdkdH09bMeG
         q66Q==
X-Gm-Message-State: AOJu0YytUUI9YCT2Ylh49tUxtBFoGqVYIymZbM4R42UfaK1ux7MTlw33
	3JQHAc7NMRIyi1MJmNrNzRkuOQRtlIcA798n4unRX2GZF02VTnIDaW9fizI9VFr+yhP7R5CZHbo
	0Ai/EdRLdGd1GDBwjWyOV4tUEhUMWPD0=
X-Gm-Gg: Acq92OH/4QJdmNkMrs0qjLxDCGtXmguGOsOo3/keu8Vqqx4P/wEOhl8X64eNq9Y6TNN
	VQXd8pfAzbsx1dAmJ0A3BHu6UqJN2GdOFtOZJ4YdasSAx5WIntbIPmsRUDTLm0OsIikfYqJMXey
	ShlNGK2QqciTf5svRjV2cyV67jB8z6mSUeMAF8jYh8cWTYWQhWzw8Zn/rzUpIr9OK8TQriDAQwt
	oho8Rpr2cdy0M569m8VdKavhf4RJbECHjTQKW/boxZQk5Rx6GGV7/Z0co8cN1+/X8JzjlFVsS2K
	a2Dke2kSg+sY+c8wHjQ4z9vWWgb7+1vQf4dIpTjjbEtv7w+iH8BLU+QI8HS1hSClCOxq
X-Received: by 2002:a05:6214:767:b0:8ac:a6f7:8a72 with SMTP id
 6a1803df08f44-8bc4600fee2mr331519686d6.43.1778450042086; Sun, 10 May 2026
 14:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260509223820.50347-1-enelsonmoore@gmail.com> <26be9a11b5f2a7d196904d9a97306d2aafb9bf1c.camel@gmail.com>
In-Reply-To: <26be9a11b5f2a7d196904d9a97306d2aafb9bf1c.camel@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 10 May 2026 14:53:50 -0700
X-Gm-Features: AVHnY4I_WgUrd-i9XjFdmdhF1r2cY5vqp8rcAwMEqvF8VlPJnZnEsMn9y1_K_dM
Message-ID: <CADkSEUiELMh-Rc2t8kYxhLr+a3Y9H_NEMnOrfh5qXvtjffFGNA@mail.gmail.com>
Subject: Re: [PATCH] arm: boot: ep93xx: don't rely on machine_is_*() for
 removed board files
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Hartley Sweeten <hsweeten@visionengravers.com>, 
	Nikita Shubin <nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_145403_362427_CAD87B00 
X-CRM114-Status: GOOD (  11.45  )
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

On Sun, May 10, 2026 at 10:40=E2=80=AFAM Alexander Sverdlin
<alexander.sverdlin@gmail.com> wrote:
> I most probably miss something, but what is the reason for removing
> the machine IDs from the mach-types, especially if they are still used
> by the kernel (though only in its decompressor code)?

Hi, Alexander,

My plan after all my related patches are merged is to remove all
entries for legacy board files that are not used by the kernel (i.e.:
boards that were removed, never in mainline, or converted to DT
booting). This would reduce mach-types from 579 to 28 entries and
would allow it to be used as a list of non-DT boards remaining in the
kernel. The last time mach-types was similarly filtered was in 2016.

Ethan

