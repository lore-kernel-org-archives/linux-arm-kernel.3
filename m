Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD07FF887E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 17:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rzy3HW8rz3SXfIkHgjI2UdkxSDPn+w/155JMT4UN7g=; b=NWv8No5om90k3wXfdZrz+lwLIB
	HQXuMIvyEnWBHrRboIz0cpCdEpuiWoNv3fR1hjIG69AIsaqRNHeSyQQe+LwRPYO9vfFJeVydX4h6p
	Y5ijK5QIqpTI90vfKDGSuwdjNdTnjXUnquHGN1D0B4OJUjsD9+fkb8hmfjvTlL/Xf8ivrsqmPALWj
	Sciz+1oFhEMhNAicn8Otq1wh5s9MXMOwcoBPU5X1DeOGQqo6AXKhSP4DggrtUkDPAUola2bf4mPPR
	xyJiuoajUbZXHiQfRTFunTTR6swgK91m0a3clfySxA03lqbgwqgdO6L6cFyIggcPv4NiyHO7J5n/Z
	Ki+g8gdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8W3-00000003xdN-2njX;
	Wed, 29 Apr 2026 17:16:03 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI8W1-00000003xcz-06Ty
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 17:16:02 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso5323879c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777482960; x=1778087760; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0rzy3HW8rz3SXfIkHgjI2UdkxSDPn+w/155JMT4UN7g=;
        b=NeEDnk/RTYZnPxBUUdEkRFL8FE4ajY499/xALSvbfNfDR3i3QjbKKxeRoiO2lN1x79
         YkWlq5UawZWvRNbSXQpMathjHI35VLmDvf+flxNIgUCaldI7dsJbt3xvWcrvD/xIw8fH
         EXfqh+2R2ivefjNGoschRlGDVxHmOkzaTuUSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482960; x=1778087760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rzy3HW8rz3SXfIkHgjI2UdkxSDPn+w/155JMT4UN7g=;
        b=jH02ZLLHnNQxBUXaNH5+g0+BA56cEW1Ysgre5rSJoS4LgtKtnGVj7PDwOut6J42Z62
         qVWJaSu9wC4nkZpCqnI83jfyvKMSf300Quev5iwCijW/clifCX3kIcO5M71W5JzTtxGm
         cyzCuzQIX9q7/AIp3Oa/6pRyNKkBvGGnSXTLYjr26uKGsJ3Yr2JmtJntVWkbUliu4e4Y
         WT31sQPkSPF+IJAiuVIdsVjOyfY7vThPpCryzsou+/fDruJGLvnkJVA9ID4ozHq9FVaI
         x3o6IWcJviJEXJwEj9jlpSmNXkOWG5rQyQNs1FQEZ13Mxwiu6GcsF+OEW/CRIMJDso+f
         VfFg==
X-Forwarded-Encrypted: i=1; AFNElJ+t4gZSGWXy+k+3siGsQJ4FALWLX6wSevhjX/srQKvAFH0J1qMogMG8iufqBBp1xfD6yXQRpBY9MPLdkge4fjxE@lists.infradead.org
X-Gm-Message-State: AOJu0YyV/Rxhxl6L0X7UwbXgojFmGe5wBiD0KqgVvcOcrNL1Ko7WafLF
	w9AJU2YYF22+VZYS56eR+/9X47y7iFlngd850JgcUbnylFKXPbFmIOMK2J/fE1C91Q==
X-Gm-Gg: AeBDievVnD8u+kLvCEByBCG/n2aSMIoNgAiSgLyQX4HDY+72zw10ctJmOArKytwCwKZ
	TD/G1rOgRHyMXXgsX66xecnGbpgfV4M3L3Iq+MADmExyutzsrR4pIw+RIzBDnTh07lsjb6cpyeH
	0oi+SjKWN3pZnokInpjzZEEECAiPntz4TWnUK5KB2v4uBMVwjI7pp9U1agd6hMTUi6m2rH05PuK
	qMr7ENF3uFGfnBqn/Wk/J7rHpvSKqBoShQGmG/PgokS3wrOkApnF/3Pbf524xQvCwjlCitsG+K5
	Lsp7dcTU5orev7b0yK7Gu3MEqgqA1PBJDq6ou+CRevwdHa9cr/I960G3JILsPWmwsZqYuzKEgE0
	DO3N9OR7/3qu7WI9552XlvlcX9IJXgdhpuQTRCSMF/nX+hgxhLDUjkRzi3N/mSAB6dvHUv4+owK
	ORdgYgmv0y4tG8/3qqn422nxc0iOhe8+6SRwukNrZzvBELriRHl2LmCT4RDY9ETYTSxchYadfq
X-Received: by 2002:a05:7022:f8c:b0:12a:b39a:339f with SMTP id a92af1059eb24-12de2a546bamr2101891c88.21.1777482959913;
        Wed, 29 Apr 2026 10:15:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b8df:3c88:ad8d:d3d4])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12de32178cbsm2889982c88.6.2026.04.29.10.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:15:58 -0700 (PDT)
Date: Wed, 29 Apr 2026 10:15:55 -0700
From: Brian Norris <briannorris@chromium.org>
To: Karel Balej <balejk@matfyz.cz>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, david@ixit.cz
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
Message-ID: <afI8y70U7wFT_07h@google.com>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_101601_145910_A616A911 
X-CRM114-Status: GOOD (  34.35  )
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

On Wed, Apr 29, 2026 at 12:55:23PM +0200, Karel Balej wrote:
> Francesco Dolcini, 2025-11-28T18:05:37+01:00:
> > On Thu, Nov 27, 2025 at 04:29:12PM +0100, Karel Balej wrote:
> >> To reiterate, the firmware is generally available but is not part of
> >> linux-firmware and the entire process of upstreaming the chipset support is
> >> stuck on that.
> >
> > I'll try to see if any of my contact in NXP Wi-Fi group is able to help. Give
> > me a few days.
> 
> so I was in a long conversation over the past months with Jeff from NXP
> who was very helpful and tried to arrange for the upstreaming of the
> firmware. Unfortunately however, his efforts were ultimately rejected by
> the internal management.

:(

> We were directed to try to reach out to NXP via the customer support
> page which yielded nothing. The current situation is thus the same as a
> few months ago, summarized in my quote above.
> 
> Brian, what are the options here now? Would it be possible to make an
> exception and accept the patches without the firmware being in
> linux-firmware? This is an old device with no mainstream audience so I
> expect everyone who will want to use it will be able to supply the
> firmware themselves

I'm not really in the business of writing rules here nor their
exceptions. I was just pointing you at the existing rules, and how this
seemed to violate them. Since the websites have moved around a bit since
the last time, here's the page I referenced:

https://wireless.docs.kernel.org/en/latest/en/developers/documentation/submittingpatches.html#new-driver

I suppose maybe those rules are there so that we don't get drivers with
*no* legally-usable firmware, since it's about "New Drivers". This is
not a New Driver, so maybe that part doesn't have to apply.

I suppose I'll leave it up to Johannes on this part, and may be willing
to retract my NAK [1].

> and it would be great to not have to keep the
> patches in a fork, especially when trying to build on top of them
> further (such as to fix the driver-firmware incompatibilities discussed
> in one of the patches of this series).

Patch 3 is a different story. At the moment, it's definitely not
acceptable. But I tried to provide hints about how you can write proper
FW compatibility logic. I'm still not optimistic that'll be easy and
maintainable, and we still reserve the right to reject patches if they
make things unmaintainable.

(Marvell clearly didn't do any real work here on maintaining good FW
compatibility.)

Brian

> Francesco, would you perhaps still be able to help in any way?
> 
> Thank you, kind regards,
> K. B.

[1] I think you're referring to this:
    https://lore.kernel.org/all/ZUQN4Ua8byy-Fsy8@google.com/
    Re: [PATCH 0/2] net: mwifiex: add support for the SD8777 chipset

