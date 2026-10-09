Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8AECA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 20:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRIIxOajP0yzIY23BtbyoAhj2PBRdU9IpmRdYvRMNJ4=; b=fHLYNnbBjQH44S
	44+4tW7eI5mjQmBOtXtDfqh0odMborrpmPqPf9HzoM2cr2QB4w9ZGyRk3xatUktka0w40AAbFXQ1K
	ufpYpg2JJiz2Pys/qwlfOoXJqrxJBbXGvWUsHBhUlFTzeDZZ4Lv/HRDWd3e2ihPFqCrpuG2sHTRX2
	eIy7dANTOqzYlGH2ooA8Q5ooGPDjQBwh9FL75jy3nkGq4wZYUTTpaRSTRCs+rW4ETgWu5xrtkJdYG
	PPtX4sTZwJW9ns8Atf32SWON1w18G29DiE3bU/FvMz9Aq91yoSdpB/Df0+kTGx+knNTOZZpgniSWJ
	6BRUPhrY0C4YadUEKh1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHaO-00000007D8x-3Ohr;
	Fri, 09 Oct 2026 20:53:00 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFHaM-00000007D8N-07yt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 20:52:59 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ab3d3c5761so760927b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 13:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791579176; x=1792183976;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRIIxOajP0yzIY23BtbyoAhj2PBRdU9IpmRdYvRMNJ4=;
        b=BMfIH5KCi2nO4kbuPZ8EI3XsjCXnWlefMlRcu9n/2+Cz4jvig3/N/UV4JaozQso1iZ
         5RnMXxx5uVf5ZZeaWS/Rs+MugQkZnL3ohHzRK9vfv6gHnSGDyOzktbjRaNdl8SgrKA/z
         s3x5CbtuKBTiSBHfd8iHyjgP66CP/JC6cX1sybmPNFNmwF1BvYhgXQ/5K4CyTY1s3QS7
         VInLVeEwndufpMINLxrTAx+jQPmCKEc6TNTMKXLkxzg+UMvUFzBho30YQ0F/gORNpsna
         QXxvRss3K9Auk3XPjyEgIwtqlY+jdWYm7WorxIVJgG4g/7p1W8FaPmcI/pgCjwT196n7
         pxRw==
X-Forwarded-Encrypted: i=1; AKwUvBy5Uo3fxf0+e49wJLeGqklSS0WowEjjrjhZHsdNml7VtMMG/BagHXWHT1WCdwBXKKjhxe5UlHMbyM8+2detdlWh@lists.infradead.org
X-Gm-Message-State: AFq9FYIKDaxF+mT1T7rsNJ1qXZ9YOFTHOzJr8QA9a48FS9HLQoQu6BpT
	eOS8gmaG+9Dn3a/H4C7Wmgcs3oQxVUXoSp0hNyCKtwvo2/1mRuUkYC1v4YYlizwJxRE=
X-Gm-Gg: AYBFou1Waj7yU3SYlGqzHiZILraQiYqKNWZ7U72xOXNEZfZm2F1Q04f0THtlaICdyRP
	rnCMdTlvCIPtEtMp4lR8lyseoupKdR6eAKguuCJJ1uQxZznF6deeQ0YAyX0Nrufs4UxtEZdIrSB
	iGmYMVI6ScmyH6MGgiEJgpxH83C6n5RmGhZgOuvICC23LPtOkKjGdCzzhwvoTKHnfyb8meL5bwq
	fEEZxqo+xwGrRI9LIsjPZ/Mnsi01gD8PCiGhwti+Ke1enZP1A9nY+GM6JUk16fIPusvvtJi7Hth
	thrRi+mhZKK9zKsKFqcw4CWSQUIQz8gu0EfC7e1akrbg0oznsUk9KWdzN5mRf+3YXJJtxX5l2RB
	RlX6xcfX7ctbnlNRisejHRj9fASmXNyjPLRckLat1A6orwZXKK/MKph1dQ1M4kCZ/oDwpatxb/j
	FtUUdNq4br39WnqecK8q+qtv0Ap218sdsyy3xF7boniPzgPjE/pGBL6BLoRLd0ATWeOCHNDTy/I
	MJqnjOBZwrFOS0cUGBV5albcFT+OpvdlUmaifLOS+sSFpMDVn43I+f3MHm6+naM9od9qrFlWygd
	3A==
X-Received: by 2002:a05:690c:e3c8:b0:8af:5053:5c96 with SMTP id 00721157ae682-8b07edc6594mr12187037b3.16.1791579176598;
        Fri, 09 Oct 2026 13:52:56 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee8a075sm12437457b3.5.2026.10.09.13.52.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 13:52:53 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ad98c3fb15so642817b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 13:52:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByWyQ+WiS5chELGZKzqpAuHDRwypvDPErCLcwRegvbMW4+cYmbHys5DGA48qPTuSn6vyvOTlpVWAXTRT7sC53ag@lists.infradead.org
X-Received: by 2002:a05:690e:440f:b0:677:d3d8:990 with SMTP id
 956f58d0204a3-67936768725mr589216d50.6.1791579173056; Fri, 09 Oct 2026
 13:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
 <CAJX_Q+2au4x99kj=UBqn4joQCM3-D2kbaJ0zro9Y4RXka7ePvQ@mail.gmail.com> <3a037c87-e4c5-4a4e-9522-cf505e1c6399@lunn.ch>
In-Reply-To: <3a037c87-e4c5-4a4e-9522-cf505e1c6399@lunn.ch>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 21:52:41 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+22tckoRKsEt9_oakAsN=+cwHdX+WPcaGWR9_3EMqM5ow@mail.gmail.com>
X-Gm-Features: AclHuK_m9bgs2ZxoWfD-m6qDBIuQp5RI_xHW6gmLTuflU7vtLwdOlVbkLA0qUf0
Message-ID: <CAJX_Q+22tckoRKsEt9_oakAsN=+cwHdX+WPcaGWR9_3EMqM5ow@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261009_135258_102939_ACD9E55F 
X-CRM114-Status: GOOD (  23.76  )
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

On Fri, Oct 9, 2026 at 1:13=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Oct 09, 2026 at 06:59:49AM +0100, Lucas Tanure wrote:
> > On Wed, Oct 7, 2026 at 2:01=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> > >
> > > On Wed, Oct 07, 2026 at 09:26:20AM +0100, Lucas Tanure wrote:
> > > > The T7 pairs a Synopsys gigabit MAC with the same glue registers th=
e
> > > > G12A has, but nothing described it. This adds the binding, the driv=
er
> > > > support and the device tree nodes, and enables the port on the Khad=
as
> > > > VIM4.
> > > >
> > > > Unlike the G12A, the controller reaches DRAM through a pipeline sta=
ge
> > > > with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
> > > > clk_disable_unused switches it off and transfers stop.
> > > >
> > > > v2 changes the RGMII delays, after review. phy-mode describes the
> > > > board, not which chip adds the delay, so this board is rgmii-id.
> > > > dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
> > > > properties. Patch 1 fixes that. The VIM4 needs it because the RTL82=
11F
> > > > transmit delay does not work here.
> > >
> > > What is special about the RTL8211F?
> > Maybe nothing, it may be this board. I cannot tell from here.
>
> Yes, look at my other reply. The RTL8211F is very likely correct. It
> is the MAC drivers handling of delays which is broken. You get to fix
> it for this new device.
>
>    Andrew

Doing exactly that. v3 leaves the existing delay code alone and adds a
path used only by the T7 compatible, built on Maxime's
phy_fix_phy_mode_for_mac_delays(). Testing it now, then I will send
it.

Thanks,
Lucas

