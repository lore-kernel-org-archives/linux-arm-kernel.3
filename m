Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB9CC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 22:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAeyHXN0Zof9oCVlItznCba1s0MUdsF9dzRH/tkJGa4=; b=CRgnB6rk/YIBWbUsNEpE6MUR2i
	audnAna+EUXbOMPPkF6UQZQnb3mpV4ZUB8g3PfEQPHfXVWJwa2audPxITtq+a7fvBuiv5/aMXKv8k
	UB/ZJRHZWUVqbtXnPX+AGHWKIkk2XTtp/ZUHGZJLMeYKFpOkrgd7wHkfIWo5vtNR+SjGHTF7WzDci
	gY58NT1wNvesKUIoyGGfuHX2zkiEZPIgV6rwZBwcAksLDmPmjGDd5GrR4MET5Oqj0VVEjrmv0BEDT
	w/TLg7Sxjqzq84tP9djnMmnG0T7QuD353altx6YprFwGGdkuCYBuKTiaIE+u98sNhqp+cx5V8sZop
	AVSDQWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwSB4-00000008iwI-1xw8;
	Tue, 18 Aug 2026 22:21:02 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwSB0-00000008ive-2O8T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 22:21:00 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-4b28df1f600so338622b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787091657; x=1787696457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OAeyHXN0Zof9oCVlItznCba1s0MUdsF9dzRH/tkJGa4=;
        b=blJzYCJao6JnJwDBMAohWFBLJveibO8Ea81wfGsdfUHO6yuXluldPibdZRcBjDkyrp
         P1L3I4jDY4hFWyvMzfBT3Sp7Zvr2AN/zPjGB7lHQ0DjEKSX2+7GTlvtZ/+/LLSxOZJ4Q
         HpfMIerCF8uyKQ3+XjAbe+0tga4pJ2xAX1dfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787091657; x=1787696457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAeyHXN0Zof9oCVlItznCba1s0MUdsF9dzRH/tkJGa4=;
        b=Aub7pgfNSM3zTmJOjZ48lK23dGWkcAM88aI4nYASFDo7S/AWoGNdlHSYfr7cuEGN55
         PhQzIEbaHNASmS/474WTp9r73XCwlm5afyDfh2RldRdAMkwa+Ir5aSiPtES2+0JnJ2HT
         GvPZCkldRhC0+QiQ+ByKdh7yX8Oor7RBCpi1erPXV/hhhGdDKsJPKHPbBjyIv5fMiYNF
         X5MpOFdFgLCZO36wBG8nmUnNuGlv7kEv/bHeMQHc0K5pNxu0xIREXADRxoYrlOYYnNyE
         xU1DCODbhyoQmVNC5VUgdcgweHHazQKRNPu/Y5VWljdOLvWwbNKG3ky+kiRV7NZ1hJuM
         7nrw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4rWpq74Lec5gLAOA6c0qcUo3FVv1mZzHYOFmQmBr0pXNhzzYehb4l1wZLkOUAomhCfELgMgUMBaE/8oWh1hFv@lists.infradead.org
X-Gm-Message-State: AOJu0Yxaa42YUhRAuTHl/hdaEA6RQldmoitT+OZYZYfvDk9ZmzizfQtT
	RxiC3M22RqBNlET4uE37FeeIcb6X5xasY688GqD9AR09fLG5v1uPV+VGQTNA6GDBdcBCuJhm4Gy
	cpLM=
X-Gm-Gg: AR+sD13UvZQO2uQx7C0pGdT9Gj5xDxR58dtf4Hc7n0mP50SaUkyaWVRNne7lWgztzae
	pub1CVTIQGC7YSSAW2E/E8bs9ShMmjGHD7hFG7df4zCk5Eb92UiPtZQUm/8f4NgnriKgwQ9X/YL
	rG6IEUIZg8qXBNxHrTr829kwiHlsho9WKqsAWkjulVWKmt34vgyNFw7nNAHk+XPNqB71EsujVPo
	KtLFMSyJDeaiL4vXcMcGYCw1ts0B9sTGaknCTcmtoPBDcBMJnL2KMA64VpkVen5TKfOAL4mp8OP
	HPWX1cFNELhTVP1nXHzQTrKiS0mMK5nofo/h4UO5/e4piSsuAOhAyNxmBWVcNdzFYUKVMH/SnJE
	364mceVCKeihMv2XmwrIGSs+mBuM8bwdXPUqNpLQ/unpXRoLneoBrEK8HQTgHvuMMUHjlD2CqqI
	sjw9tlpGMK3HnJ3sCncI+wVrfZ3nHnlTQxkZjiSWQ9H7XPjAlsrgt3rxRd6e9SDvo0XUyltclio
	jQkQycCYR5a2nU4P+L1n+fhxI3jVY8=
X-Received: by 2002:a05:6808:1303:b0:4a4:c12:46f6 with SMTP id 5614622812f47-4b2b8e822admr1004008b6e.2.1787091656506;
        Tue, 18 Aug 2026 15:20:56 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b290a412f9sm4951342b6e.2.2026.08.18.15.20.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 15:20:55 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4b28df1f600so338600b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 15:20:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrdpuwYeHJ5ulUpH6QKxF88nLCLWW41ggoize51lITDxKGyWF4kNcYK5xIZAlc5G3FicsnnQCvhUHFBugJDxbHz@lists.infradead.org
X-Received: by 2002:a05:6102:3f02:b0:772:5acc:b849 with SMTP id
 ada2fe7eead31-777b68d3b50mr613053137.5.1787091192379; Tue, 18 Aug 2026
 15:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
In-Reply-To: <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Aug 2026 15:13:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
X-Gm-Features: AcwNN1X4wWbBuO7BL4eki7ShctQouAC-d3_rSaFZoxuWUTz7v7oqnlkPyiKP63w
Message-ID: <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_152058_993402_26A60B9A 
X-CRM114-Status: GOOD (  53.09  )
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

Hi,

On Thu, Jul 30, 2026 at 4:32=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> > > +     /*
> > > +      * The Pixel bootloader considers it a fatal error if it doesn'=
t find
> > > +      * a `ufs0` alias so it can add calibration data to the node. U=
ntil
> >
> > Fake node is ok, but alias won't fly because aliases are not allowed fo=
r
> > ufs. Well, would work 10 years ago, but this is a device from ~2025 (so
> > SoC maybe a bit earlier), thus Google already knew that they MUST talk
> > with upstream open source maintainers before they ship such ABI.
> >
> > They did not talk, so you reap what you sow.
> >
> > There is no more excuse for a vendor to ignore open source and push
> > whatever-ABI-they-wish into their product, if they ever want to upstrea=
m
> > that product.
> >
> > I know it is not your fault, obviously. And I know that not much you ca=
n
> > do, so that is not rant towards you nor towards Doug.
> >
> > You will have to keep this part of patch out of tree or fix the Pixel
> > bootloader.
>
> FWIW, it actually _is_ a rant towards me, since I added the "ufs0" alias.=
 :-P
>
> When I was originally bringing up Pixel 10 with upstream, the
> bootloader had a hardcoded path to the UFS node. It looked for it at
> "/ufs@3c400000". That certainly wasn't going to work. Downstream
> _still_ hasn't transitioned to having a "soc@0" node to put all the
> MMIO peripherals under, so the equivalent upstream path would be
> "/soc@0/ufs@3c400000"
>
> Now, I certainly could have made the bootloader search both paths, but
> that seemed bad to me because:
>
> 1. As I understand it, DT paths aren't ABI. While it feels unlikely
> upstream would change "/soc@0/ufs@3c400000" to something else, I
> believe upstream would feel free to and not consider it a "breaking"
> change. This makes it feel unwise to hardcode the path in the
> bootloader. In the past, upstream has renamed nodes to clean them up
> and it wasn't considered a violation of the sanctity of the
> device-tree ABI.
>
> 2. If #1 is untrue and we consider DT paths as ABI, it's still a bit
> awkward. We have one bootloader base that supports multiple SoCs. The
> unit address differs across SoCs, even though the IP block is nearly
> the same (bootloader still adds the same type of calibration data to
> the node). The code I started with had a bunch of #if statements for
> the paths in various SoC variants, and that went away with the alias.
> I suppose the bootloader needs to know the UFS base address anyway so
> I could have probably constructed the node name based on other
> #defines, but it still was a bit awkward.
>
> 3. I certainly could have searched the whole device tree for the UFS
> node by "compatible" string, but the Pixel 10 (and future) UFS
> controllers aren't upstream yet. We wouldn't be able to land the Pixel
> 10 device tree without the UFS bindings landed yet and I think we're a
> bit far away from getting the Pixel 10 UFS bindings landed...
>
> With all that, the "aliases" seemed like a pretty clean way for the
> bootloader to find the UFS node. It also matched my understanding of
> an appropriate use of an "alias".
>
> Any suggestions for how to resolve this? Do we go back to hardcoding a
> path in the bootloader and cross our fingers that upstream never
> cleans up anything that changes the path to the UFS node? Would it
> really be terrible to allow a "ufs0" alias for this case?
>
> As a side note, I did "talk" to upstream shortly after adding the
> "ufs0" node by sending the Pixel 10 patches upstream, but I guess we
> were so focused on the overlay topic that nobody thought to comment on
> the "ufs0" node? At the time, I'm fairly certain my resulting device
> tree files passed schema validation at the time, too...

I guess no response / silence =3D=3D my email was so dumb that it wasn't
worth responding to? Even despite that, we still need to find a way to
move forward, so popping back here...

I did some digging. As far as I can tell:

* Nothing in the DeviceTree specification 0.4 [1] mentions that
aliases are deprecated.

* Nothing in the dt-schema repository [2] causes validation to fail
when you use new aliases and there is no "allowlist" of old aliases
that are allowed for historical reasons.

* There is a single reference in the kernel "Documentation/devicetree"
about not using aliases to assign an "instance ID" [3].

Is there some other documentation saying "aliases =3D=3D evil" that I
missed? Maybe some email thread we're all supposed to have read?

Is the only issue here the fact that the alias ends with a "0" and
thus implicitly provides an "instance ID"?  Would it be OK if I
changed my alias name to "ufs-primary" or "ufs-internal" or "ufs-boot"
or just "ufs"? We're not using the alias to get an instance ID, but
when I added the alias I followed the pattern of all the other aliases
and put an number at the end.

I'm happy to attempt to fix our bootloader using whatever scheme
upstream suggests. I'm trying to "talk to upstream" as requested, but
for it to work I need upstream to talk back. :-)

[1] https://github.com/devicetree-org/devicetree-specification/releases/tag=
/v0.4
[2] https://github.com/devicetree-org/dt-schema.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D6a57cf210711c068a650bd86acae4a88303dfd5d

