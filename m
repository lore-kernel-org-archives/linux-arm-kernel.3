Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF20CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWTuV8nTat+7Ise5DAVZrckoXbB3rEEMphlZwWdvIzs=; b=Yod9GsOVcv8LZE
	oAHHf4TUBQolkj0G2VVivyK+5Daa6el14XMBWuHoIwl3EXbStVKq7GI+UXdzkA4lH+aR5zET7ehHE
	wu5aRcwhg7DdWXVS310B+LMxg3jKCQE9W00aWRrCmi++kiDvRkwCdUqEUSUIiE8sFL7IFyimCNKAi
	5IMXW/E1/2yyj/5ohMJmsJWRAhE/zoeoUONCBwJyM+dzvneXLblCmigxtEuiM5vgKWuYzBF+y8GO0
	W3BWmvFfXbejk/UtRzarZTWsaplbEkPuYcDPumua8MsGdugJb/dE9ZOrz/wXsP4Cuhjh46EERHxcy
	A3jtr6rCMYSrLYCUZcwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3eK-00000005Zmu-0ioj;
	Fri, 09 Oct 2026 06:00:08 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3eH-00000005ZmO-2RFF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:00:06 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8828138cc95so17820837b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 23:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525604; x=1792130404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWTuV8nTat+7Ise5DAVZrckoXbB3rEEMphlZwWdvIzs=;
        b=RcP8yzd/qkI/U/ZiyB4ififueSq9n/6FOy92rTzF6EXBIw+7TQ2IPJ3md3YmdYKon/
         +MR4b0CR2iAZgcINNxnRJ7dEI56P6oZnqmPkN+yvItXrYC8z2TWSdTGNxJlKRMnQygjt
         ehEtf2gwVHj6cCyLH1tzzqPPNXRzmBBiEFuxr4wQf5fhMefVEcHIqkYEwAP28c1JNoLD
         CjJHj/ncPtUsbc/Ww7qzY1TxjQMUtKxdkJkRbGVVhaxm+WXJ58KUv4QmYehp8whF2/EN
         ffMITDdza22BR9QBpi31hG15ELca5d04Ov7n1nRd25K7Ejf+1ifuXmGdDF+baghlKsdG
         PI7w==
X-Forwarded-Encrypted: i=1; AKwUvBwLjpcW+f/WYxv4sVB7izMIXM9K8vL9jWKHaVI52WcftehicrCgeTJhNBOoe2BcXPKlaAYkftXsV66uNvM28Abu@lists.infradead.org
X-Gm-Message-State: AFq9FYLWNo07AgiRECwm09qJbRms3N2nSzow4oFTbXOySpwx2KEtT8Lt
	aibe/0WGcCAAHSk+FF8d0xtXoFnRfNP72HgAH0GXGEiQDVf/OYneXHQ5ZXz9rJmFVf4=
X-Gm-Gg: AYBFou0lWPw7EYWDlGtti9uX7dKbVQBGcH5IKouH/RkNoGdWK69okNdS9l/c8bhrhht
	1d4LQnLPGfyJ2wurGYX3j0AunZ8nICzfsJY7mFHXXBCtnPK2raFCEYGKnsKcaDNFz5K/FBbNGeH
	fhWBAVDpWyXqkZAqMsrZYRwYosGBHDOE+67Uj9Anm6/rj45l+RA9WrN7YfFSkZDbtEiTgQ5s33+
	01gbe4ayznJvc7Vvzy2YWnt0/nFl7pklra0b0WtOmVQuR+M30jw9vaeTXEHo2RflRR7HjL5Worb
	ouzzWGj/oRtpaLDenUjTG+hHw8tXqoZVsCFTHWZwjqUhoppNuRmK9YimXPpY9CzKhvGP8SxDEe2
	lAX6e4Fs3PrDgBuk8hh2qkN361m8l0kfzzC6OEwPSsZgcErKf58rQS8lRz9h+vnxtK0Td99tPNC
	82/uIAwWpN9q4Xz1LDwpBW9363lIJ1x1w6//Y7GuRD01llkwVNltYAq9p38hIhdcz6niYvFjYFv
	/vZUVt2S+Glju0lsX0+t1HszAQQwkMaWN76O3q9wZIGkCTZOrGfCV1EzkXatyIHFasWIPVb/Bar
	600=
X-Received: by 2002:a05:690c:e3cb:b0:8a0:9ec0:e13b with SMTP id 00721157ae682-8b07edb0699mr3341507b3.17.1791525604075;
        Thu, 08 Oct 2026 23:00:04 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1b8ab5sm3561817b3.17.2026.10.08.23.00.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 23:00:01 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-885cf67963eso40812667b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 23:00:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx6p1daSfG+r0PNMj3EO+yacgSGz28CPiJ55rQpLr5ngSgzBfddav0MWCU/uX6I40NhqeaTaB2HGMVX87HgsFf1@lists.infradead.org
X-Received: by 2002:a05:690c:ec4:b0:8ae:8d28:77ca with SMTP id
 00721157ae682-8b07edfbad7mr3120487b3.33.1791525600619; Thu, 08 Oct 2026
 23:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
In-Reply-To: <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 06:59:49 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
X-Gm-Features: AclHuK8Z8XHB904erYGkjWemp1Y2Gn2Ya3i9_K0CjW0XJN3l42AYcMZ32Srg4dI
Message-ID: <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_230005_634726_64C4445B 
X-CRM114-Status: GOOD (  21.72  )
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
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Oct 7, 2026 at 2:01=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Oct 07, 2026 at 09:26:20AM +0100, Lucas Tanure wrote:
> > The T7 pairs a Synopsys gigabit MAC with the same glue registers the
> > G12A has, but nothing described it. This adds the binding, the driver
> > support and the device tree nodes, and enables the port on the Khadas
> > VIM4.
> >
> > Unlike the G12A, the controller reaches DRAM through a pipeline stage
> > with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
> > clk_disable_unused switches it off and transfers stop.
> >
> > v2 changes the RGMII delays, after review. phy-mode describes the
> > board, not which chip adds the delay, so this board is rgmii-id.
> > dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
> > properties. Patch 1 fixes that. The VIM4 needs it because the RTL8211F
> > transmit delay does not work here.
>
> What is special about the RTL8211F?
Maybe nothing, it may be this board. I cannot tell from here.

The RTL8211F does add the delays, the driver sets both bits and the
chip takes them. But when the RTL8211F adds the transmit delay, this
board gets no working link.

I measured the receive side by sweeping the MAC delay against the CRC
counter, with the PHY delay off and then on. The window moves by
about 2200ps, so the PHY receive delay is right.

Transmit is the problem. With the PHY doing TX the peer sees nothing
we send. With the MAC doing TX it runs at 935Mbit/s both ways with no
errors.

I asked Khadas about the board, no answer yet.
>
>      Andrew

