Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE88C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+W8o1tXdHgTSySdRh3T8J3kSRDgzM5YrIz/Xilyxtc=; b=dq+Cl0RlT/NZKgmoWRtYQhg42I
	Qx9aIaeINGVkuhZ9nxVG91Zr+qhULbQDJpTfio4S3eYIMQOKk88lxBxW3yUPOCP0wSS/YHOEpb1+6
	mt4rpMykUHiku7NO0VT1To+r+uLiyQRlk7NbPmRAG3TZMaeb/CHUtIfdh3RPsxp5GgVKHaenoEMJd
	ptEmiL1gemCckuKrkyiasokLrXkyYV4pta8muVtucckJ0IPJpERyBMdl3VquiWjQdZH20IVBxWbL+
	n7kIFFInmPGD5wlpOr4iI9UFq7tViI8StGHb4cfMUj4DuvstUePER8noNCRcasnP/48QqqARnLnVx
	ENnWvCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGOT-00000009gpT-0lwT;
	Fri, 25 Jul 2025 11:15:17 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFYI-00000009Zjc-26vs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:21:23 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2ffb85aed35so1538982fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753438881; x=1754043681; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h+W8o1tXdHgTSySdRh3T8J3kSRDgzM5YrIz/Xilyxtc=;
        b=ZC037kd9vhhOoVgN4KDYUL2e60E1P3qmtnz+BCLyIfw+deIXHsV8RLrzIHRtJKBq1V
         nsZK6i5Ezi7ch+uEwVGzS8caAp03TpGASzZugTOQp1QFrZyrUeKoVbhJBBf2lnQyMcRk
         VtDRsm0umCe1aZZv4T/sljApi+UGs6JRpW9CVVhQSXBgdrfBnIAj4TlrB+DHkRtY6JLc
         BQLgMYWm90zJl09zfDg62M0/x2HoXQJXixBZ2Zi/2Pjzm/32N31I5CwGfUODSkv/amAb
         82g7CSFJCHsjs5oQssRqQjvFYX1tCAkwDd8rC7rlEcjm5Hq1FYwKdXlAs0AUgXHLe64e
         BYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438881; x=1754043681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+W8o1tXdHgTSySdRh3T8J3kSRDgzM5YrIz/Xilyxtc=;
        b=wwNDhD5oy+kiZYriDOZgNHSDqaEIx74dhj2aqNrKWDTXNF9CbaQn0ZpiP17dBtKyAj
         PX3KwQOCxSqfL2C6u8ee1SwcsI+NQep4xYyCsgc700355yod9Draxgp5RpxFfxoXHB7h
         hgFCoa3NdNjVHDMcpuQM7XBW5IEN/pZuKEZ/04khRAc1vP5v/AyrDsjyZE4dl0jBQgIN
         EGSrcOw0IksmNANgKr9Jci/2fziBc88+MpZfvsE2Md7tKoG3jX6MIh0bm2J+bCRaWLUa
         II6f92XK9gzNGIpf864I09URzvRpsOz9VRMBNMM5XTd2uftGBtp3Cgl9YR3efPXgrvGK
         ZU+g==
X-Forwarded-Encrypted: i=1; AJvYcCWgcoJLupNabk1dKKWwQLG5xNu825Gfq3fpNWBtU2HUpzFZV15rBf3fDGruQOffDexlzVFgm8S+l9SAS5VTc+lt@lists.infradead.org
X-Gm-Message-State: AOJu0YxZQGGuIP5PJ486wtQ+nu7XywOTfjotgkpYzCgoO47pV2qVggRD
	bBvdmNPNqthkgCtMMeSxnFm56sJW96ggz3psqDP/JvEAIwV7BuUGP2UM+IdTISA5q0IpD8OGY8g
	ZwcB4ZVzRs4drEvl3USaxQGGvVZDLIVYHN69Q2pE32w==
X-Gm-Gg: ASbGncto1XuEf483qOMe0qirP+CRj+R0GdBuVG7/Hib+OQFR2nnSMFwo2pWSgtQfg6S
	O6WLrRDYHNpMK/Efu+Nh8e3yS8g+kG3oXTKdp2ZfCKMKCbMSB+ZsIY0IkyxnHiy0pF5i7rOz4wG
	1lvbPX/FvFbcr/pjcoFgWQbSwGgInpYmUQD/uUM/PkD765nHtndbZYrrR8m3QS1aqQFhl6tYBx3
	XsNRqX7
X-Google-Smtp-Source: AGHT+IF4IPPeqGE8IrCql8xlUV+MwQLcQZYEPRKBMxQR/S2iO04ByExRiRrPSmHU2qswauG+HfoP94tz8CGpjmGBGP0=
X-Received: by 2002:a05:6870:b98:b0:2bc:7e72:2110 with SMTP id
 586e51a60fabf-30701d11d29mr708886fac.13.1753438880979; Fri, 25 Jul 2025
 03:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
 <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
 <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
 <aICKM-ebp9SMAkZ_@vaman> <yaz4ozb55t3pkwd2gj4l4d2hdspdcsqjm2dfsux7lfdxy6lxjl@uae2qz2vjo64>
In-Reply-To: <yaz4ozb55t3pkwd2gj4l4d2hdspdcsqjm2dfsux7lfdxy6lxjl@uae2qz2vjo64>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 25 Jul 2025 11:21:10 +0100
X-Gm-Features: Ac12FXxv6c8kZOcLBybYFZLsdsetcBPXWMr6v-O5jaqEZC0sK8Rly_5B_kDSrns
Message-ID: <CADrjBPpE0ab3MD6tAS-JQns1HaPfmngRhixkUpqqAfj_2D5nmw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_032122_546580_9683A362 
X-CRM114-Status: GOOD (  36.26  )
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

Hi Vinod, Mani & Neil,

Thanks a lot for the valuable review feedback.

On Wed, 23 Jul 2025 at 09:04, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Wed, Jul 23, 2025 at 12:37:31PM GMT, Vinod Koul wrote:
> > On 22-07-25, 22:04, Manivannan Sadhasivam wrote:
> > > On Thu, Jul 03, 2025 at 02:03:22PM GMT, Peter Griffin wrote:
> > > > Add a new phy_notify_pmstate() api that notifies and configures a phy for a
> > > > given PM link state transition.
> > > >
> > > > This is intended to be by phy drivers which need to do some runtime
> > > > configuration of parameters during the transition that can't be handled by
> > > > phy_calibrate() or phy_power_{on|off}().
> > > >
> > > > The first usage of this API is in the Samsung UFS phy that needs to issue
> > > > some register writes when entering and exiting the hibernate link state.
> > > >
> > > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > > ---
> > > >  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
> > > >  include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
> > > >  2 files changed, 50 insertions(+)
> > > >
> > > > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > > > index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
> > > > --- a/drivers/phy/phy-core.c
> > > > +++ b/drivers/phy/phy-core.c
> > > > @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
> > > >
> > > > +/**
> > > > + * phy_notify_pmstate() - phy link state notification
> > >
> > > 'pmstate' doesn't correspond to 'link state'. So how about,
> > > phy_notify_link_state()?
> > >
> > > s/phy/PHY (here and below)

will fix

> > >
> > > > + * @phy: the phy returned by phy_get()
> > > > + * @state: the link state
> > > > + *
> > > > + * Notify the phy of some PM link state transition. Used to notify and
> > >
> > > Link state change is common for the PHY. So remove 'PM'.
> >
> > Is it really link or phy state?

I think it is likely both link and phy state.

Looking at the wording in section '9.5 Hibernate' in mipi unipro 1.8
spec we have phrases such as

9.5 Hibernate "Hibernate is a UniPro state in which the PHY is in the
HIBERNATE_STATE, and the UniPro stack keeps only a minimal set of
features active."

9.5 Figure 99 describes Link hibernation where one Device, typically a
Host Device, initiates Link hibernation with a peer Device.

9.5.1.2 The local PA Layer receives this request and places the M-PHY
Link into hibernate using the PACP protocol (detailed description of
PACP protocol can be found in Section 5.7.7). Once the PA Layer has
successfully hibernated the M-PHY Link, subsequent layers of the local
and peer
UniPro stack (L4 to L2) shall be hibernated by the DME by sending a
<layer-identifer>_LM_HIBERNATE_ENTER.req SAP primitive to the
respective layers.

> >
>
> This is a bit of ambiguity. But as per the spec, Hibern8 is the low power state
> of the M-PHY and Unipro controller.
>
> Maybe, phy_notify_state()?
>

phy_notify_state() seems like a good name. It might be better suited
for other peripherals as well rather than narrowing it with link_state
or pmstate.

Vinod, any thoughts on your preferred name?

> > >

> > > > + * configure the phy accordingly.
> > > > + *
> > > > + * Returns: %0 if successful, a negative error code otherwise
> > > > + */
> > > > +int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
> > >
> > > I think you need to use 'int state' and let drivers pass their own link state
> > > values. You cannot have generic link states across all peripherals.
> >
> > I would avoid that, people start overloading this if we let it keep
> > open! I would like to avoid the api -(ab)use
> >
>
> Then we will end up with peripheral specific enums in include/linux/phy/phy.h.
> If you are OK with that, fine with me.

Ok I'll add peripheral specific enums to include/linux/phy/phy.h in
the next version.

Thanks,

Peter

