Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6715FE67493
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 01:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6D1Wm3FMJcQXu9DNBHAKX/TsEgkUYA/96V4XySBVqQ=; b=q4msN60nPposXj1g5e+5mP15QB
	e4lq7JKGPdNFA/Z6ucm9QIOI1mX+sfrtD/NEjx0Q96kODKLdfvp8GbNjdL6XY38ca0aK4skjrFE5C
	3FviwLfcw/YJHqlLmst9PjWVkbusEZZSfZ0wH5jzF4QHL6LahQ7ewaytclPU5i1ztjDtUiNdafZ9p
	po2q9eaXYTLkQLYFzA5sjeQMfAQy5lKcf/t178gEs7e8gFbi1x2udFAbFPUqoS/APoQJ2+KIQ5qCS
	XOzch71ZXCOHKoL/QKVFBhRAP3MR8yHBKNpXKZXwj3ANUJ7QKZVylkXbj3yoHYzKOKoZ8s42EzzYv
	9+pPELfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6gt0-00000005Uoi-3Dzo;
	Fri, 01 Nov 2024 01:55:38 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6grL-00000005UXd-2J9C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 01:53:56 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3e6105886dfso1227352b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 18:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730426034; x=1731030834; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F6D1Wm3FMJcQXu9DNBHAKX/TsEgkUYA/96V4XySBVqQ=;
        b=aUjMy8bQF01p5AQ+8ZEHKWPU6g7d8gngeAVXhx5fqn3Dm7TIhituncDimvfKXPEA78
         VgHIbqsajHb3ObHHkXJJKQU26hhWJYBJb39eAtou4wRAE7R2/2d0vXkHMJQVyq+hIgDH
         8kYE4oJI+35ZiPR97IjsdG35qG9aZqHbFnnn7vTpoig+JTcKm5GIKvGhe41k67V4W9ZW
         XHCCzuChNLU+al5a36JjW+Otg2UJdAQH7X7A/SyN2h4Eow0e/sq2sbNCfJKH9bVV3amw
         1ZSOZw7OU9QQbyh4vwSpRXOsDNUHFVzqsZz6yaXlEUxB3KGsrWwMuY7/AvI6CgBYkzaz
         bswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730426034; x=1731030834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6D1Wm3FMJcQXu9DNBHAKX/TsEgkUYA/96V4XySBVqQ=;
        b=qnvn8DSwrtfxady+zaU4QPPLdSykN2mzYhIWoxjOWm9c+WP+md83OG7Z6Si+B/JXX4
         Fhkor+avwmjcUPZk0Bc8mU/vZbMQst0c7IRVJ+MhtjMSufNRjIQRA2sm80S+2bW7g5Vg
         GFDwvzxZNPLTLCDPn1D3/Mqt7SIbK4Oz8MISm296u198FOPyrI3IyqwuvLzHKL9ENEmG
         DpXbUwMTpbiQdnmpF74EBpnfi948qezzwuen2dn3Wea4BfLtkHvhDM0P7asOisggk9Ct
         syCtlR4wrPoPBTVzu2p8/Jbu1ZYDZv0hfYDSc2TuT5NQk6NXJVsNT0GLn86aN2h0S3gG
         aH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6US50NjwTD4V2a8TjR+BbqpbpDihl5fN6Vk8vL2aB0dorrQTBSndbMfhetF40X/bmic2bVFiEo5EQF024XG9h@lists.infradead.org
X-Gm-Message-State: AOJu0YwdjsILOOXrcVupAOuQYkCcO6DXXnyZtQFFfLhZkFFMQuDGcpLT
	Otvi5cf/TDvvYAYv9HwMzZ/MeCYPC+uB3hak7eh+B0qgSaohj6n0hs559fiXGFnYYFJaejs8xOQ
	SPQHG4xFFcDxLPLg5E3dsFQ7IMIw=
X-Google-Smtp-Source: AGHT+IFZQ4NyGNMCDLgv6bCZyw5Zsw65CYGtv8tMY/DPPDyDLkJOAPDiCRinE+4bVOEGfk1xiPcwEU7dyPJOaeEVW6o=
X-Received: by 2002:a05:6808:21a0:b0:3e0:468f:7c5b with SMTP id
 5614622812f47-3e74c3d95c3mr1351262b6e.17.1730426034446; Thu, 31 Oct 2024
 18:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723716331.git.stano.jakubek@gmail.com> <e57ee9b94f128753d156d77015f6cc3dc24fd9e8.1723716331.git.stano.jakubek@gmail.com>
 <ZyMyJrSPTfFrSC-t@standask-GA-A55M-S2HP>
In-Reply-To: <ZyMyJrSPTfFrSC-t@standask-GA-A55M-S2HP>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 1 Nov 2024 09:53:18 +0800
Message-ID: <CAAfSe-uC+G8iEk_37vBr3+dQsv4a4tTTsz11hUguVRnU=r+4qQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: sprd: sc2731: fix bat-detect-gpios property
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_185355_613109_9B56948D 
X-CRM114-Status: GOOD (  26.15  )
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

On Thu, 31 Oct 2024 at 15:30, Stanislav Jakubek <stano.jakubek@gmail.com> wrote:
>
> On Thu, Aug 15, 2024 at 12:13:18PM +0200, Stanislav Jakubek wrote:
> > According to DT bindings, the property is called bat-detect-gpios, not
> > bat-detect-gpio. Update the property as such.
> >
> > Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> > ---
> >  arch/arm64/boot/dts/sprd/sc2731.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
> > index 12136e68dada..c8b30c0479fd 100644
> > --- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
> > +++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
> > @@ -97,7 +97,7 @@ pmic_adc: adc@480 {
> >               fuel-gauge@a00 {
> >                       compatible = "sprd,sc2731-fgu";
> >                       reg = <0xa00>;
> > -                     bat-detect-gpio = <&pmic_eic 9 GPIO_ACTIVE_HIGH>;
> > +                     bat-detect-gpios = <&pmic_eic 9 GPIO_ACTIVE_HIGH>;
> >                       io-channels = <&pmic_adc 3>, <&pmic_adc 6>;
> >                       io-channel-names = "bat-temp", "charge-vol";
> >                       monitored-battery = <&bat>;
> > --
> > 2.34.1
> >
>
> Hi all,
>
> looking at this patch again, it seems there's some confusion going on.
> The bindings specify the property as "battery-detect-gpios", but the driver
> checks for "bat-detect" [1]. I assume the DTS was added with "bat-detect"
> to make it work, even though it's not conformant to bindings.
> It has been this way since the bindings/driver/DTS were introduced
> back in 2018/2019.
>
> What would be the correct way to fix this? Change the bindings to
> "bat-detect-gpios" or change the driver/DTS to "battery-detect-gpios"?

I would prefer the second, i.e. change to "battery-detect-gpios" in
the driver and DTS.

Thanks,
Chunyan

>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/power/supply/sc27xx_fuel_gauge.c?h=v6.11#n1186
>
> Regards,
> Stanislav

