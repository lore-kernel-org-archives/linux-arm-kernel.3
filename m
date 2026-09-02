Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB280C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahQZkdikvVjzkT6T9UmwO3n2/e5NTjCRZNNcesXUjLU=; b=EinbgG8EKyHKYD5pclJvLzSHCJ
	ItDMaNQSx5DNAa8BysJpxIiCQ3SS0ispIUShrKqgnIiNMxjQ4+ieqgrKD886mF4LuoXPMa0e3U7Cf
	r5Vc+B/vG7L57LYFBgjVrQQW+5pmmTT5orGs+NXaNNybFAiWcFNS7Cpe/KUag0KxDYsNhWsmKoAd8
	B2QpkPzGzRQaIKscckvyBBGV2dj+tsyAfzwDAskGPp0/olujqxaeCKFRIJQGvye97fg0mD++212b1
	3VOUX/qBFo3muecwRqHmuq9X6kqN2xGnBX1amM7Auo8tyUnZCDcbSJEG8nQ8YcWYRbREux1TyHH5U
	4teBx4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gfE-0000000E9ED-1WSD;
	Wed, 02 Sep 2026 08:49:48 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gfC-0000000E9Cp-00PL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:49:47 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-90e828b309eso9941146d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 01:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788338985; cv=none;
        d=google.com; s=arc-20260327;
        b=WtmIZOgu0sPCbS91+fOzVzp9d/K+NCoL8w4Wg0bj7DU5pl10WJOTR0DMjSmEurGKxA
         ROoVm1sz0RELcR+hxHkHCzTugN38CzbWdAWtrNErAWokqQkbYnU+8UuDDyyMj44sww/e
         xFwzBfKWq6v6IyhPV8/ZC8i4qpSynIKJJOiisdQHUc8MlSx7W/OLqw7VupvVkLQv6cn8
         ipeWrVhJXyU/SMSJbfbwtSjeCt/UIINz4faeJtlaE04MrqNSFzSB8fGOOFbyjRuz0ViS
         haXTXECk3NA4u8+0qN9DG0rVOLoAHjLqxrArunXPy/WSyX/9DoxWtntoxnm/Sa9pcB4A
         j/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ahQZkdikvVjzkT6T9UmwO3n2/e5NTjCRZNNcesXUjLU=;
        fh=FzJNCQIf/Rs9xQ1bE6of8ez70oz/AMejAgcvHPYbduA=;
        b=NI6XTpM/iJiLcVkqOrF2Cx5jyB4ftleJZ0NPcnRjp/BLymRldhfZNqCXZ8eWW3c1Vl
         iuoI2rlbvNv8CAmv7LSfaMMtYwNCRJZTh8fMAA29zv9qm4TZtvVFkIVj6gknXntwHJhs
         QygdptFItdn8HOTprR6LfStEYjhR9to7BdG1rJlCC9xQ/+Nh1RPJuzdQjUqaALTyWrWz
         IzuqiQ00sAa6oFBYpTsGlh1YSlcxHiJy6BMPiHU5HYT1TnmMsLsJnLmgklBSKCxYuyzf
         VrICgt6enBZEsmLyGmaAKMIIL6ceWrZNhlR3uMncJqastm6i3YJSbFj0zLvS03E32yTX
         Lylw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788338985; x=1788943785; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahQZkdikvVjzkT6T9UmwO3n2/e5NTjCRZNNcesXUjLU=;
        b=hucpsyquc5Y4Xfy7byDGyuoB5qMvMTU39dc2ezZpTuYCYyLhLH5HvrAZniJuUrMmhC
         h/qtQcHNqYywbCdlvL990ewyVZqN+gIoxzmoONPC0AqtWsTfS8x8qRp/su88sqagzVXg
         RSxSadO++EyQWKhwb6eIx7dhfan3IfWM9txZ9DLnbv6FYqxZmaJG3qt0oOy7tsgTI7NN
         jfh++3/ou6eZA6hOBDIWitNYKi4IqhXls3x85dh7uwtT/0p/HxTPUZU0loySN422n7Dq
         C4ZAR1IhvJ2EXm9aB8KPujbO3aEoNmj6reHLKGrDgObB76eJs+Z56tI3JGB0dOonHzyn
         5zbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338985; x=1788943785;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahQZkdikvVjzkT6T9UmwO3n2/e5NTjCRZNNcesXUjLU=;
        b=CpJeTb/CGiwXzfpr4Y+dL6Re1vbqt56OkGctSGR+Ka5V3jENk1Y8NyY8V0hoiTIYRD
         ZWgnWyOPICj4shzaV3Yo065l71CTKduFD870GXWY0Z+aYw7+TfbP3GeqyE0R9mjACbSK
         Hgdr/y8/qNpxNBPtIUoUdPvGwsnXK3uQSmC5fJ0O3sw7XFza7YJf/Z5wHCcWk6KhhfhH
         Atvo2YSs8yyW6t8atHjugZIq0owaxOajqkwtgsx4CrRmLCt/kjJkxPsQ3E+f8I/yZDYF
         +D+88Pf97KiKarJVDGtxLzbgbVOf1vQNmhYoCJkWG6wmwjsO8NYHyjuYnlwAEtX192VH
         +xPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCNb6k0/QNMusxWDLhaTthC/Ff95B9f2gDEAoYxFsl3YyyVQ0J3MYR/kvD42U1+E9ddW2fV6RbmLG2QUQ0RoK9@lists.infradead.org
X-Gm-Message-State: AFuF++niRAtjp6iX9C0E6uNzOOzKrZJeNgA9E/vHiPQTNWkSe4Khmue9
	fheVGTO5NRCnrqBuqkms9FIjYe9D+RhpPUUaEWQkK5B8NsUpGQAiDXn7vMmseCfT7z5CeljcRr8
	YUStbQ/Fdt5/HEVCHwboHrrLkW5Y/gRs=
X-Gm-Gg: AYBFou1sBi4W/ou8feGSTI4tTk5mu+CJ05WryPQ9ymCCB98SvcfU2osb0yrkqVao49N
	6e+BtA0t2QvNSSX81dNtuq1Z4s9Ds1WoT+Ggrwx/R/T9DLAeh3dJeLaUOvuBmbzvKobacQ5cdlJ
	T+vBPiyvwnnU/IgtYoJiosfsm0iH+Z6xohKr8Cj5VOFgZc927CShMuzeK76QzyMc0I9GOCggk45
	KgAQhdMRKA9drAEL79ZbpodNqc1Nj3Cl2Gb4vO6cZQTqXmvUjOqOfsEsFUU6Ci8W8oM6FnkWa/1
	OZuxMJqqeA6ms2kMniN5mst3psXNx2voQm+rFvPkgjWloK9TeaCv3/OvHChMA+bpKOKHBveopv/
	SyZ6n5DQlAw3jpwHFYP4lXBCmb9vxO/sW1qa3I92O3ZeXBG9M3o1Mh2L7W2WVGQpFOZwMDc5WpB
	OG3XDkim/zff9yyr09TfEIFdaeqP6dL828WWelqYo=
X-Received: by 2002:a05:6214:434a:b0:8cc:d29:9f73 with SMTP id
 6a1803df08f44-90ebab8fb94mr48871086d6.21.1788338979975; Wed, 02 Sep 2026
 01:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260802145109.728793-1-pbrobinson@gmail.com>
In-Reply-To: <20260802145109.728793-1-pbrobinson@gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 2 Sep 2026 09:49:27 +0100
X-Gm-Features: AcwNN1UlM_Tc8DR5l-MabxNMXioOiMJnlb69hTglEaQjvp97HJXJG9SkJC1Szww
Message-ID: <CALeDE9O1oPtbJ2p+pYbEw9BZOXuEtgO+uhE2s2a8i6XjSo4urQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Some minor RPi5 bits
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Andrea della Porta <andrea.porta@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_014946_038951_FE220B27 
X-CRM114-Status: GOOD (  12.14  )
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

Hey Florian,

> These are taken from the downstream kernel device tree. They
> are small components that already have upstream support, from
> older generation RPis or existing arm IP with just minor
> changes for upstream, tested on rev C and D variants.

These all still apply against rc1 with the already queued display
adjustment patch, any further feedback?

> Peter Robinson (3):
>   arm64: dts: broadcom: bcm2712: add arm PMU
>   arm64: dts: broadcom: bcm2712: Add thermal monitor
>   arm64: dts: broadcom: bcm2712: Add USB OTG port
>
>  .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 ++
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 66 +++++++++++++++++++
>  2 files changed, 72 insertions(+)
>
> --
> 2.55.0
>

