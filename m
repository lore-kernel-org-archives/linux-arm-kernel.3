Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7362C10A88E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQ1hDzJlfrRklF9YY8ud/90bJ0SI0yIhi54T9lEnFo4=; b=XmYMN2djPquqoz7nzTAYSRUfVG
	LbORKJgNfGm6qj53+u2tZoMeleNFoQgRmg2erDUr7DkGuYSC7lt1HSY31UC/4Uc/jPVJI2BAp6g7O
	O9EyXCw6YrbaWRR/KzgJdNVSThjK6MPSrpl9zSyV8tUbk6NMh+/NRfAGjIweDF8fIIr+RySQXfFPF
	SLkCnihWgQ8+5Tkx/OA1b7GepDmmVIhBkBZaIkmjSsAJyS7ClxkL/PHCjgkHQsAlx9ftbP8KkALF4
	BlPyp+d2JJZkmbgP1GhzDa2PMgcriAhH8FN0SdclSZWZbDfDcvoTUzvRIdECJXU9C5JAujbBquNjK
	9WSmsuhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5n0v-00000005ns7-1wQf;
	Thu, 26 Mar 2026 15:52:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5n0s-00000005nrK-2tKR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:52:51 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-439b611274bso599927f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 08:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774540369; x=1775145169; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SQ1hDzJlfrRklF9YY8ud/90bJ0SI0yIhi54T9lEnFo4=;
        b=d2NCmEmPk6zLaAd8NXCKiEJQmVzbXOUa8O64NuMtMQ6EGoEK0iixk2sz1h5uNPglzn
         r/FiqFN7cHYJDhJ7HUY6iwSNEIrsC6nputacjF/GgUZVeKqLu4qg6tl1XaRPTt8dc9XH
         yyeVF3LwZ8JQppAH9Z3A88Hsp9DVaOWjpEHNaTfEsUpJNI+TK+Jl0WVFYWd73Tar/xbV
         DkNZnT62Z5laxklNpb+XG9mef4TInHo+u2MOby5i/sGAH7Q1YbuTlO3T1GHoynCEf8KQ
         vJic9KP3KgpUn5020kJHOwMCvWDR8ZPvSRhwcqBgHQNPwZtvbn3ALeRF4xgPzJ9rHBjK
         xK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540369; x=1775145169;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQ1hDzJlfrRklF9YY8ud/90bJ0SI0yIhi54T9lEnFo4=;
        b=Yxt4k7Xp2aeu1fkwcSScAmcNSlexp+2tPY5Mo3YY3I8Nm7TjvaM0lcE/LSnNRYwBb0
         cWHE4s+h9aJZ8QA1d5nRwsDjN9ZVm6fIONxBPy/neYRUuYSsCrJjSchtnE2Wtn3h//Qw
         vPMCZODA/Rm2e82JUPT6Vlh974iFdpOieI1MdciG98jlazsg2Dd5DUOKGG8PLcepAX37
         lqe+9tBhXcUFDhUlDyCUVveC23vt32TPJJyoomITmNTSV6WQgz/uTZyWhkiFqJFYeVxN
         R05CbvNH6uZ1BDBZqJp1tmw2M0UBiNYZEfKBRd7qNJCoIyuPRDhWAmBIKXaUAA7F+gEL
         TzeA==
X-Forwarded-Encrypted: i=1; AJvYcCUEkr5Hj3ZGuhShfZU+0HbtGsAAmphHN2LLLi8ythlKe0g1u3AsAE7Z+L7YKWwUvW0HPSGF4+kqmR2VEvsK/ual@lists.infradead.org
X-Gm-Message-State: AOJu0YxCkr3xo1v+9wOMYb6ZPbBip/+yUcVZ7WfwyjP001189tDvGpJA
	t7HFoR/mPxrQbNCE4P+5AwZVA/St2pIZX9HSAHH3Aih4I/N04f6KVyJ8
X-Gm-Gg: ATEYQzz8QW9bGt3UiCyOZ2lfvvyiqCkbw8Z9wDyRg1QqFuHmqipNCK20WN77cO8UeqW
	cQWgppV8lNEGuejFxnBT5R8ZAVhMTu4iH4Mqq6UIP0li4rIIJSG80ST9ShSRCJ016jC4+0447Z0
	dmNdAr39FtiHKkx0vLW0YbTLcDI/EzDjA9T+O+hEKOrVqk1IjLNQcaU5u7qNA4BxOraZwCYyghW
	Q+B3xUcpiTSP8YmGWyVQmNOprSOKp2FHJ4xxgyF92kmF4Uif8Sc2Tj3OvjdUN7xua/ui+VJgAT1
	AnqXIIQM2LgGT+Yy/LpGqTN5KaZw0VRDHVGODKed6vrMvaAqrEnH49+gMQ4Q4/xCTrHTZ9cXDPY
	TD0RYHTC3gqnybPhO6mS46+j5BqoyMtRkXKUYfpVVrwdtrC9eJ6amJTujbHqFCMlX4pJwNlv+bQ
	ZqABHX0OHkoW2kwqKQuX51akQ7SmaEYx09f2pWYyuwvTAm2x9GRbXngRyjJ5IkZb0RIYzE/DRiJ
	D3e3bvWrLhcogeWwiKZrE8tAiGrqvCY+Ujpb+ZdXmm+ClfFbQ+hS2ocQ87AERB5zoiBsgPIDg==
X-Received: by 2002:a05:6000:18a8:b0:43b:464a:28de with SMTP id ffacd0b85a97d-43b8899cdb7mr11877706f8f.14.1774540368645;
        Thu, 26 Mar 2026 08:52:48 -0700 (PDT)
Received: from franzs-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf5aesm9975594f8f.24.2026.03.26.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:52:48 -0700 (PDT)
Date: Thu, 26 Mar 2026 16:52:47 +0100
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Manivannan Sadhasivam <mani@kernel.org>, Frank Li <frank.li@nxp.com>
Subject: Re: Clear CLKREQ# override breaks functionality
Message-ID: <35zryv5twyy5qzqlfyebnfqllm6xbosxn5h2qlkibvxqogmzix@svk73dvj4tf4>
References: <jfefktil6ywvugvbxdplbvry6g5efka5g4bpr2dwhha2mtrkm5@6gkcmj2glvwo>
 <AS8PR04MB8833063C53B769C0ACB086958C56A@AS8PR04MB8833.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8833063C53B769C0ACB086958C56A@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_085250_745602_687C99FE 
X-CRM114-Status: GOOD (  21.66  )
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

On Thu, Mar 26, 2026 at 08:17:29AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Franz Schnyder <fra.schnyder@gmail.com>
> > Sent: 2026年3月26日 16:00
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Franz Schnyder <franz.schnyder@toradex.com>;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org; Francesco Dolcini
> > <francesco@dolcini.it>; Manivannan Sadhasivam <mani@kernel.org>; Frank
> > Li <frank.li@nxp.com>
> > Subject: Clear CLKREQ# override breaks functionality
> > 
> > Hi Richard,
> > 
> > While integrating the `supports-clkreq` DT property on our iMX95-based
> > SoM, we had failures in our CI on one of the two M.2 PCIe slots on our
> > development board.
> > The failing slot uses a card that does not advertise L1 PM substates.
> > This issue comes from commit a152a90f5390 ("PCI: imx6: Clear CLKREQ#
> > override if 'supports-clkreq' DT property is available"), which clears the
> > CLKREQ# override based only on the DT property.
> > 
> > It seems that clearing the CLKREQ# override should happen only when the
> > driver knows that the downstream device advertises L1 PM Substates.
> > Otherwise CLKREQ# should remain asserted to keep compatibility with cards
> > that do not support L1 PM Substates.
> > 
> > Thoughts?
> Hi Franz:
> No, CLKREQ# is not dependent on L1 PM Substates capabilities.
> 
> According to the PCI Express Card Electromechanical Specification r6.0,
> Section 2 (Auxiliary Signals):
> 
> "CLKREQ# (optional) signal is an open drain, active low signal that is driven
> low by the card to request that the PCI Express reference clock be available
> (active clock state) to allow the PCI Express interface to send/receive data."
> 
> When the 'supports-clkreq' property is present, it indicates that the endpoint
> device supports CLKREQ# signaling and will actively drive the signal low when
> it needs the reference clock.
> 
> Therefore, the RC (Root Complex) controller can safely clear any CLKREQ#
> active-low override settings, allowing the endpoint to control the clock
> request through proper CLKREQ# signaling.
> 
> If the endpoint devices on your platform can't drive the CLKREQ# signal to
> low, remove 'supports-clkreq' property from your board's device tree file.
> 
> Best Regards
> Richard Zhu
> > 
> > Kind Regards
> > 
> > Franz
Hi Richard,

Thanks for the explanation. I managed to find a PCIe specification, and
I can now see that my assumption was wrong. The L1 PM Substates mechanism
requires CLKREQ#, but not vice versa. To be safe with cards which lack
support, we'll just remove the 'supports-clkreq' property for now.

Kind regards

Franz

