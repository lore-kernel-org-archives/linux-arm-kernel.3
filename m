Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07861F459EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=; b=ffxoYvMtvf4mTxiPOwj2T8WUIa
	l5A1unYwhT5JwFyrVuG6jMyr15ci/Vm4D73s7iHJTMJOFYCDnhv6hU9R4veQ/EmWkO66cPmTxNf1X
	+6bDVTEBZf2UYE6aXIF6PSsJjzmLPm9/7+kOIJpSRynVTEMngtN4CZLq8jpwvuYrBLky13pvU2OPy
	8ulgbe8jJlq4aS7TYHvNPA8qp7XGD+dKyjOmguQQHQvKP0jzG/nsS57E/AewmmDEE2FV6SowxgHXO
	jj4sUTPtakY8dV99q36IgEYrDKzqozWYEwpYLWZo9rq5i0/zCtTi29GSrxwLFVufDsdPFZyOfyHA6
	ozFQ4RfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDqF-0000000CTEj-2GTq;
	Fri, 10 Apr 2026 15:32:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDqD-0000000CTEN-2XWJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 15:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=; b=eCQfkIEBOFHvCn4Tcn1Zyw16nS
	zuRCctOEiFZvSt3dJw7rtH9hnm9IUCT8OXlaIKoYjEJwUN27D9jMBcoPT+FPp5epMnEzK0A0HJo4F
	6W73ItnXMQqvF2CtNOWcfx3FJAFLBatDRuXQqDdNLDWEqW07Dj+mqh9+FzYEUkhnTzzGiAN9BnQgX
	0P+ivJGmYX08Ku+o5zlDxAivjnh6VdSdD1r0K405rNJHtvMXhWRosIqyUxaQHoSJ8/2AzqTGT7RQZ
	6ywYoWlnAm0WwmEuYh0mSXxS3nUk2SaKeu1kNEEJ0C9ip3BJwDtJCB5NNkIIueZxgtwPcl80atqsd
	kD7AmjDA==;
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBDq9-0000000Dmb7-3GE3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 15:32:16 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1271257ae53so9590774c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 08:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775835131; cv=none;
        d=google.com; s=arc-20240605;
        b=d7RfR31llKa48UP8RvHms/zBsDv9IVWvLa3i1b8dqXlY78E5DBOEwpnshLz2tgUX+9
         RE46x4wNZaOOY1L+rSEbIA9q8AvwYFwUWMRGXDhf289QaY6NdOMgRo5xZECnJSuEPyjS
         Y54OdXg0N4uuHCkqmRXuOygofPzQQuox7IvoQofaYSh6jAImPClRju0RALRrZgLsp2Lp
         OVbfGvnakeFvUJ+Wa4lH6a1UyFiF6YH0qwLTgpfvkM0oNz1a4XCnOcweye6T/6ODbwnH
         91CvgIoTSRZT6QeyJF7rhT/Vu2wo6+W4TTwzg7EFu9k2n7cSX0M5rMC/8OC5pskJ7Z9n
         F7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        fh=XfUuGst1jJxRRB4t93EeRTMetqLNTUL3FgkkD9S2j90=;
        b=X5vMLgj8Lfe4HAslTqDl1g/rAIa8fIauo0R52OwbRCdFp6Qwdmkzn1jmqhWYXZYH/E
         hfjP1vTzXeWg/RH6FNXJpAWON3TJvc31RW+9HrSLAWEyNaUSVRE5k/4d/vI/oMAnYwTg
         L3w1s18AfRauyFyaUUOfBCpxV9rfROJIdVP5XqsXbnnF9Hop+fp1U7/SEIcpASQjHp0C
         YLub7oestEY6oKymsG0XL4JvXZh8oswkC9vtGeQkR/vactFh7b/mF7DH4Hy1+Q7jwf78
         LdGW5dQ0KavhzXJIzvM9/GvIb0JRlyjYcLZZpERRkylN7zeIl1uneB+OvnahDizCWut8
         IRhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1775835131; x=1776439931; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=jKHDXuk8cwOaTKJEoMvEu8qvHBPM5surl9gUdqQgD/TmzJvCc08heD2BELBn1ujsR3
         980y7aAYSlbCW3DsJn4BG3xugV4Rm5Ow96tf/YV+p4sZlYedzjDWwmEzZd/VTes1Akcj
         k6GG+EprI1CiXUjLr5b2KiyNnJtEA5ijNWPMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775835131; x=1776439931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBQJPBhzAm5teFuL1it4zrQEsej5woZw67yMwyO4d8U=;
        b=bwYzfGovWN2xOunlPC15kGlbXNsUuXPfFOT8OmgWXt4ri93lMSV2YqwEr3+WaU2UWG
         T0zqi1CFpMkgffQl1AYFAOvvhrV/rEdBc6pcUrNUoIm3F9iovnPGkzrYAqnJriqI1BB6
         rVZ5H8uCYyaehAI9IVyAcmhVsDcouTs/+O0b+BGahpJzw8PTfGDB4vKUrhm7bvtVvM54
         sbNO5KUvOOqv8k59vj5wqVfgKCffZVFZ2KvsekojCGY18Mw6pdLLt8W+BdpTgNMMwXZB
         d2EyJDeU02F9cDbTZRPh0S1mdIz9Xe6FLoRUIqk/pYmzsKypRH3Ovyvf2pjyMCwz7R8K
         CkRg==
X-Forwarded-Encrypted: i=1; AJvYcCVcuOwecwCza/SGanbl55W9zOH39iM0tOObKbN2WQiZIeulT2b7FY4+sYScm5fDQGRHu+mUpEUzB7bJYjoyUwij@lists.infradead.org
X-Gm-Message-State: AOJu0YzV9jhgJVktm27aAdiYft/2FxfKW+QhWQmnE1lp1qy0gxL0cHNv
	lwK9MVKzcWef+Xv2cqde0buZ1YUtDNSmGWn4Y8E8ecEG8+C16jIBS4qDXT4aet5IA7gU42XNZzz
	z36M4jaMHWO6YmaelU1ZFmO8j/MIgrJrHfVVdrJEFXw==
X-Gm-Gg: AeBDiev9uDZ7mrhmWb/FFYwHTyzESTvU4WU703R1cM21RpEjtv/4IAjEpN7yfLyQD1M
	2sZTeXp4jmShpVfdNLmB61fu0PGGRh1p3c8wlxG3OzhkGnpeRvxROzh8u/fBw1C9gsXJ5eroFkW
	A9Yf2dH9fffbl6tb3nyJvzETdKZWoDrGqJuDfLoYCl3TdP9bkuSD+l6KOlldhIk1dKMI2uVBOjW
	QIVHf+CmNpR75/NFNYY3xH8EDzILHeVBwe0w1oIH3urPcDJ7g/Kb/DCZhm4JYhXgiVjEw73rpeo
	pNID
X-Received: by 2002:a05:7022:6097:b0:128:ccb7:7fa3 with SMTP id
 a92af1059eb24-12c34f069f8mr2159203c88.34.1775835130696; Fri, 10 Apr 2026
 08:32:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260410120044.031381086@kernel.org> <20260410120319.397219631@kernel.org>
In-Reply-To: <20260410120319.397219631@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Apr 2026 00:31:59 +0900
X-Gm-Features: AQROBzAnX-XEClLFV-qWYFUzCuq4P43sNZviESiWFI1yCPXm2VtVZ2QkaUGJoPY
Message-ID: <CAFr9PXk7qK8-2JWrrfgXHoS9JWTRL+WobLjmAesyCE9VLL8ZyQ@mail.gmail.com>
Subject: Re: [patch 27/38] m68k: Select ARCH_HAS_RANDOM_ENTROPY
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, 
	Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-crypto@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, 
	David Woodhouse <dwmw2@infradead.org>, Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_163214_506641_F11FCE31 
X-CRM114-Status: GOOD (  10.03  )
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

Hi

On Fri, 10 Apr 2026 at 21:39, Thomas Gleixner <tglx@kernel.org> wrote:
>
> The only remaining usage of get_cycles() is to provide
> random_get_entropy().
>
> Switch m68k over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY and
> providing random_get_entropy() in asm/random.h.

I have built and booted this on my Amiga 4000 and it apparently still
works so FWIW:

Tested-by: Daniel Palmer <daniel@thingy.jp>

