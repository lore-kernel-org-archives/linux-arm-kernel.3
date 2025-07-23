Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F740C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgMCEelREMSB63NKXySj628l6amD3USq3iPvkC04eQw=; b=EsPe/4UwR+oLMxTyFxO9FMqyBh
	XkfjxXxCVBrKorgaZ6jrRgI7ubzXSkmfcXsiIRWZTsJ8kFHj1fIylulKr9rtX1m303jcx0NMSvwyA
	rsWNNu7qKlKQKMlosMUGXOuIQ2WWmC8hTQqtOFe0a5KZDyKqolbEEdwQ3pEswahpap/5sZqfiuTJG
	ARPICx/MaK9TGCN5cD+pZQKazaLOFLPwaR/OYeWpGdyzJfAhYP3AaxfRVt4/tN8RRpgUziPCKf5v2
	f3w/VbNqdOm3gbDz+7Qo4VJ37t+cvnkg6gti0Hi3bi/ZEQTbUaLSo01N//V+ohVFcgnYvq2X4VhRs
	8shEX9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUjK-00000004MWZ-1hMW;
	Wed, 23 Jul 2025 08:21:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUSS-00000004Jrk-0nVK;
	Wed, 23 Jul 2025 08:04:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5EB695C593F;
	Wed, 23 Jul 2025 08:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6BAC4CEE7;
	Wed, 23 Jul 2025 08:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753257851;
	bh=5G0MzIPGQyVzSDEfSUskutOnD5XbLYr6VIzJy8hOBhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvK5C2/fwmiSxXzWTRkggiNfcnyKIjny40VwN1Iu+CBZ1S39waBVQlHolf1xIA0Xt
	 TK5zIgXYTW8ZuXP2B+q48VTDm5AmPwfzuIc/4N3oQPphbF+AaEOf1g4FJIdL3JARUy
	 qyhtk6UgCl6sPP4PmVreb+IpEEpXpxBx94fmxIHGjaA+yUsR9Gt3fKGw3/A2v85Q84
	 FtmhCs70ViIr6RsOPpzQKp5yfDSd+tLJgqKTyKp+QBARrdCgfxEfA4dFP73MJAGWmB
	 uQQJl2gW580fJJXyZJ97+j7n2gpNTZRiN7P/A8lPx3GU7npGE+dSKb3NrLMjLFtO8r
	 Eig/hwOm4gQnQ==
Date: Wed, 23 Jul 2025 13:34:01 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>
Subject: Re: [PATCH v2 1/2] phy: add new phy_notify_pmstate() api
Message-ID: <yaz4ozb55t3pkwd2gj4l4d2hdspdcsqjm2dfsux7lfdxy6lxjl@uae2qz2vjo64>
References: <20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org>
 <20250703-phy-notify-pmstate-v2-1-fc1690439117@linaro.org>
 <e2lhm237c3xtbdjux2wuesq5fwu7nky3w7oq2fnsgn2pqcg5kh@xhxktriooyes>
 <aICKM-ebp9SMAkZ_@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aICKM-ebp9SMAkZ_@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_010412_317960_7F6413B9 
X-CRM114-Status: GOOD (  27.52  )
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

On Wed, Jul 23, 2025 at 12:37:31PM GMT, Vinod Koul wrote:
> On 22-07-25, 22:04, Manivannan Sadhasivam wrote:
> > On Thu, Jul 03, 2025 at 02:03:22PM GMT, Peter Griffin wrote:
> > > Add a new phy_notify_pmstate() api that notifies and configures a phy for a
> > > given PM link state transition.
> > > 
> > > This is intended to be by phy drivers which need to do some runtime
> > > configuration of parameters during the transition that can't be handled by
> > > phy_calibrate() or phy_power_{on|off}().
> > > 
> > > The first usage of this API is in the Samsung UFS phy that needs to issue
> > > some register writes when entering and exiting the hibernate link state.
> > > 
> > > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > > ---
> > >  drivers/phy/phy-core.c  | 25 +++++++++++++++++++++++++
> > >  include/linux/phy/phy.h | 25 +++++++++++++++++++++++++
> > >  2 files changed, 50 insertions(+)
> > > 
> > > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > > index 04a5a34e7a950ae94fae915673c25d476fc071c1..0b29bc2c709890d7fc27d1480a35cda6a826fd30 100644
> > > --- a/drivers/phy/phy-core.c
> > > +++ b/drivers/phy/phy-core.c
> > > @@ -520,6 +520,31 @@ int phy_notify_disconnect(struct phy *phy, int port)
> > >  }
> > >  EXPORT_SYMBOL_GPL(phy_notify_disconnect);
> > >  
> > > +/**
> > > + * phy_notify_pmstate() - phy link state notification
> > 
> > 'pmstate' doesn't correspond to 'link state'. So how about,
> > phy_notify_link_state()?
> > 
> > s/phy/PHY (here and below)
> > 
> > > + * @phy: the phy returned by phy_get()
> > > + * @state: the link state
> > > + *
> > > + * Notify the phy of some PM link state transition. Used to notify and
> > 
> > Link state change is common for the PHY. So remove 'PM'.
> 
> Is it really link or phy state?
> 

This is a bit of ambiguity. But as per the spec, Hibern8 is the low power state
of the M-PHY and Unipro controller.

Maybe, phy_notify_state()?

> > 
> > > + * configure the phy accordingly.
> > > + *
> > > + * Returns: %0 if successful, a negative error code otherwise
> > > + */
> > > +int phy_notify_pmstate(struct phy *phy, enum phy_linkstate state)
> > 
> > I think you need to use 'int state' and let drivers pass their own link state
> > values. You cannot have generic link states across all peripherals.
> 
> I would avoid that, people start overloading this if we let it keep
> open! I would like to avoid the api -(ab)use
> 

Then we will end up with peripheral specific enums in include/linux/phy/phy.h.
If you are OK with that, fine with me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

