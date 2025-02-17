Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587C6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 06:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BlNWjMvH32bt0VwRarRhttzzRaU06jOP281HprHsXs=; b=jw0ApT1cdpW2vM
	fN+7BTKS8Yf7VJCMQmcwx+tgArPoR1bP+G9O0O/37edasv645RNTo+CzsaDYuuMdGsUgmBDNcCIkW
	O/DKj5GRfjPW7mT404r5/KlaVlPYhFgG+SWnDL7+FkljVbMlu2+/aEmMfb+Y+IEbRNihuK8+Wfejw
	M72RkryWCVKZw/papvDdytrQWnQ04ZSQXDlliKfPaBRhzI6WlJyoGvxXTnYt41zo+hPRkV7RlI7EY
	Mh1KgfxbAzQKGnC3KHukv/Wy1bSLBlL9XBnR3HpPVYoxwQC85+Ee1RKDCcFOhWuVKBkOCf2UqgQj6
	30AV6yW7HdvEw2MNXEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjupz-00000003WCS-114f;
	Mon, 17 Feb 2025 06:42:39 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjuoS-00000003W4Z-2qr0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 06:41:09 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aba868c6e88so374564266b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 22:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739774463; x=1740379263; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9BlNWjMvH32bt0VwRarRhttzzRaU06jOP281HprHsXs=;
        b=T+nLxpkheS+t1kViKM9q/zhJERe4LM+cIWLiBPR9SALdi5oi06SYC63B2D65hmkODF
         kEpKX/phXOk/3Soz1hjWUFOSM5WG/81pu2rrqfqphwLnnvjaAp6ZcL1JDT/v0WEJ4EqA
         jZ8UfcrJTBCNMxvcAsYEp5yKp5ygs3QrLmJ0s8lZ+FQ96KZosy6k6/L+yKk/vnKQUaB+
         9HzDk24Xp5h4HLuzqcJuCOI0tqc99g+Eh0IaKf1oqJmiQGkNnWIkjOwkCjeJlj5OVwkw
         Xv8DcMJFvDdCOmEiGX2cu57GO/bNCyT+3uxkXG6UcI6aRNHOkC4K6ySP9hBIZXFqETHK
         uuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739774463; x=1740379263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9BlNWjMvH32bt0VwRarRhttzzRaU06jOP281HprHsXs=;
        b=H4O4o8kt0QzfM7sbxMIXgmDpXoGGuSjRUeLsOY/82rsvjapO1W4Pv2WSEpJA7k04jy
         dEwTBzhsMZR9MnPy2qwjq2qjvSwtEZyK5+46SCA8rKsL7iIzjIsSqVShURFVKw1kqfw7
         tJKhaN0ME1Nr/KbGzqXlcwdvCnzMzP9Aw4PZQJipCW9LCJTrC1APrzjYCYT4BL+qlOW9
         56luGmoKrFnPnzoOr3dXHIgIRtCRKB2rzyLI68iVglubmyfv6AaT/xHM/yERTVmbDA6Y
         dIjD0hMvBjVvAWvDMeKTjyJnjTanfRyskhSdKEz0MCr63jXq7YEEPcbaT23JirgySe4b
         KgRA==
X-Forwarded-Encrypted: i=1; AJvYcCXJA37m9W48qelMHSCuL9iWoXtgfOYFNHba+kO5qgxEJTSUBdwH1uoqpAIMAy+t0OtuR82ems64+xKRUBP3AStV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhkz3qO3xcnGtVqM4Wx2inGjaD5LPKA15twYHfBm+QA6EstrG+
	8M5kV6gCXKB1V5RxPpyQHVX6Rgf4g6kc0GDO+WQt2DKfEKMfkG/zoPNimqcBBDMmBWYBRixyXVx
	XQ2SMTrMpCgvkcfh8Svy0vopR2Ok=
X-Gm-Gg: ASbGncuJfAiXTfAfwGPVTYOVPOgpLQTha5aZt3XrX6Ll+ex7z8Od5UMprEUvTkB41Zj
	6MFysQzGvCH0rrm0ewXOWQxjNKfyFqvS/J4w8CrdmCVzJJ8vxMlv/8Wgd5AnBFzCzhXiedLS4
X-Google-Smtp-Source: AGHT+IHEblpWy0E8o/GwtXXK/ARtPn4+t2mJ/jkAoJv43EWaA0zUoUZ//XGdmh3n9p1/b1WAK7vkij5W6JHPpq2qDSI=
X-Received: by 2002:a17:906:7312:b0:ab7:6c4b:920a with SMTP id
 a640c23a62f3a-abb70a7a67emr862003466b.6.1739774462705; Sun, 16 Feb 2025
 22:41:02 -0800 (PST)
MIME-Version: 1.0
References: <20250211143910.16775-1-sebott@redhat.com> <20250211143910.16775-2-sebott@redhat.com>
 <Z7BoydkyT_h0gwOV@linux.dev> <CAE2XoE_8ihJZQF856w-_F+cgJW7fLWGz7M7Ztoxzw2vE51_m1A@mail.gmail.com>
 <87v7tb17os.wl-maz@kernel.org> <CAE2XoE9=hjP+qpsy+FcYcSDectDajiXjtcMCVpacSo4cFOo=tQ@mail.gmail.com>
 <86jz9psqwd.wl-maz@kernel.org> <CAE2XoE8i=jPgSea5jXY0eOxas9Y_2pa7QheqS1xuw2qeTQDNyw@mail.gmail.com>
 <87pljh1zgj.wl-maz@kernel.org>
In-Reply-To: <87pljh1zgj.wl-maz@kernel.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Mon, 17 Feb 2025 14:40:51 +0800
X-Gm-Features: AWEUYZnfZwhUG_EoRZ2LP7nC3OQtiJSnvldFjppzrrBppJQq32TWm_4wX3cJYI4
Message-ID: <CAE2XoE9Xc0CeNiRZnwANU2Q9Mbg6f0hCOyrkNA+h5Jp-2mrsBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Sebastian Ott <sebott@redhat.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
	Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_224104_720881_697FB6B3 
X-CRM114-Status: UNSURE (   9.17  )
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
Reply-To: luoyonggang@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> Well, there is no magic. If you don't write to VPIDR_EL2, not much
> will happen. You need to apply Oliver's change instead of the first
> patch in this series.

Thanks, after applying Oliver's change, it's working, my concern post
at the beginning is to ask if
 Oliver's can resolve the issue:)
Now after testing Oliver's change, it's working, thanks
Sebastian,Oliver and Marc Zyngier:)

My test result now is:
```
/home/lygstate/work/qemu/build:/usr/local/sbin:/usr/local/bin:/usr/sbin:/us=
r/bin:/sbin:/bin
/home/lygstate/work/qemu/build/qemu-system-aarch64
+ qemu-system-aarch64 -cpu host,aarch64=3Doff -accel kvm -m 1024M -smp 1
-M virt,gic-version=3D3,midr=3D0x412fd050 -nographic -monitor none -serial
stdio -kernel /home/lygstate/work/debian/arm64-kvm-hello-world/bare-metal-a=
arch32-qemu/hello_world.elf
Get MIDR EL1 origin:0x410fd083
Set MIDR EL1:0x412fd050
Get MIDR EL1:0x412fd050
Hello World midr:0x412fd050
```


>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

