Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B61C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMLpjqBMiG0QAJnu6K5ue6Z2J4hOxDdx42FnKNEaR8k=; b=RQsvEs6xIXR3ppnOubQ6rb8XvV
	UsB6ZYBWsbq8GD5jpZ3iTzD4nvilkPv4H30+UMUrRn5NX42T1PdgCBc0A3JJwl/fFAB0nKUDR8MhR
	CRKhm7TEeZ1xTtlmYjPG33eJ5Hr7y69BMa/T9itxtTRezWkn2amu43y9dg64tgzDR2MXlbKDi0Zht
	mo4vX06T4Aex1aIY6cpwIBCWcsGgPje3GwTtlWT/v8JCLhCVSkVAcV8AiHOBPGEMfTB261zgqAznK
	VRNmiNMuy+st6ryt4LQWFBnhylv+LitCkzminu63nuay03zN+a9vez3X5OdeN/4ds31aNewwuMdx7
	Bs6Xc3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPPE-0000000GsW4-160Z;
	Wed, 08 Jul 2026 10:21:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPPB-0000000GsVb-46Am
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:21:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0360F60008;
	Wed,  8 Jul 2026 10:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D871F000E9;
	Wed,  8 Jul 2026 10:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783506084;
	bh=iMLpjqBMiG0QAJnu6K5ue6Z2J4hOxDdx42FnKNEaR8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MBkuwrWCZFsty1/oywDMtDpA8qd84gYEqc/DFTNGxQbi2mAm0VybN8dy17H8JMyH+
	 OFe+bHPTwQMP6fANHKHXIKeQLu3bARuqoUtKfTxI4V6abtP8KWiwB5GAJzBPa0DkPn
	 QF5PrQoiCH+800R0aXSo1KEzHSR1Lp5r5Az7lwWIwQX+Aufg1oaWVVBvmHu7NO7yaK
	 QGUWpbQ2bB67bZ/CPRLNVIoXC+UQbr1jIOnotaeOuZ7L3/qhD/OcIoZXI5kvwUEylJ
	 Bdsw8zoR9abq7So9pJF0pRFbFpdMezLlLw2SSbq7Oh/+ab4eEkiWcIO71KpjBKP47X
	 qd3kZgtuse+OA==
Date: Wed, 8 Jul 2026 11:21:18 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	dmaengine@vger.kernel.org
Subject: Re: [PATCH 09/11] regulator: db8500-prcmu: Remove EPOD regulators
Message-ID: <20260708102118.GG2108533@google.com>
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-9-eb5e50b1a588@kernel.org>
 <20260702155113.GW2108533@google.com>
 <CAD++jLnEDzkinxjv6Ce7JRCLy1A5BSHLTBp2KpQ5sOvKUygCtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnEDzkinxjv6Ce7JRCLy1A5BSHLTBp2KpQ5sOvKUygCtw@mail.gmail.com>
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

On Fri, 03 Jul 2026, Linus Walleij wrote:

> On Thu, Jul 2, 2026 at 5:51 PM Lee Jones <lee@kernel.org> wrote:
> > On Thu, 18 Jun 2026, Linus Walleij wrote:
> >
> > > Remove the obsolete DB8500 PRCMU regulator drivers.
> > >
> > > Drop the regulator build hooks now that EPODs are power domains.
> > >
> > > Keep the MFD cell around because a later patch reuses it for a
> > > small compatibility regulator driver.
> > >
> > > Assisted-by: Codex:gpt-5-5
> > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > > ---
> > >  drivers/mfd/db8500-prcmu.c             | 239 +---------------
> > >  drivers/regulator/Kconfig              |  12 -
> > >  drivers/regulator/Makefile             |   2 -
> > >  drivers/regulator/db8500-prcmu.c       | 501 ---------------------------------
> > >  drivers/regulator/dbx500-prcmu.c       | 155 ----------
> > >  drivers/regulator/dbx500-prcmu.h       |  55 ----
> > >  include/linux/regulator/db8500-prcmu.h |  38 ---
> > >  7 files changed, 1 insertion(+), 1001 deletions(-)
> >
> > Any deps?
> 
> Not really, was planning to split off the stuff that can go
> directly to MFD and resend it with all the ACKs.

Sounds good.

-- 
Lee Jones

