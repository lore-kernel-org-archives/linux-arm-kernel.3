Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C7BFD5311
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQBPoqGuy+Nk3Y+axMWMHgErBPv1pT4vgLvjPkfdeB8=; b=NPZHfV8KsOaP9lvIn4wWdR+EEX
	8viThqTRcWCmZA/3b/Zfs/5rWQWj85xKarWw7/W1vMyyiOQg0NiK2IbDUSsWpiwzheYyvZacZUoDk
	H7l/6gCPU0+IuUnZTKmOi/FD9zA7HbFEuHyJm/IZUl40R+AWr0DKeBkToJxWBNUYh+dJgttZIci/V
	z3i+VtM1Xd0l33hHmTarC8G2rtBQlNgAQAU+mhgZmcxKnjtP8ukp9aMUpztBPa4QqGhQGhnlATk/S
	O0N2QfCFSFwkAVfHTqX6SMNT8BPjwTXhmZXbiS4fjNtWILQk0Ovt6SZ9fd8YxyEingaR8uEhRYFp5
	2w7T4mOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtcp-000000082Ix-0X5X;
	Fri, 27 Feb 2026 08:55:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtcm-000000082IK-1kRT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zQBP
	oqGuy+Nk3Y+axMWMHgErBPv1pT4vgLvjPkfdeB8=; b=YiK3rVbvnQi5HCQx+CS8
	YBNCLH3j2e3tWPs3BGg10CYQGHxHKGNHXMa/1TPBdLEFDMgqW5h0gFf2h8CUROKX
	rbX2vx3nYJ6vVGVvsS/WdbSo2ys1bOesFZj1OD6XIH8eBy+Qr3ff7kgB8/ZtwYaB
	A6Jb7bFsW3BUULyobXH9XsGVBZms9oSRl4Bz75gPLgGaksueHlrfy2k+OLYEnVCy
	wxqTqsv39VUL1TvYAwhgqxjC5M8GdIHSKQOGfv+Wyw1LCFHmq1Ohua+F0MIVazYF
	fMnbgTwlMRR/HB1KU1SABkh4vmX/1MH0P/Az+PNRzgD+7j9EcTvFqVwAO/+6mVmE
	ew==
Received: (qmail 1407771 invoked from network); 27 Feb 2026 09:54:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2026 09:54:56 +0100
X-UD-Smtp-Session: l3s3148p1@7LYqZMpLnt0gAwDPXzF+ANZpdrMKUeLI
Date: Fri, 27 Feb 2026 09:54:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	linux-media@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aaFb4DW1yob1djDW@shikoro>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaCrT1SvMCIKQDmc@ninjato>
 <CAMRc=MfwR7TfAFXO4opu7a=v84MK9hY048woPg+-09wkGJgWFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfwR7TfAFXO4opu7a=v84MK9hY048woPg+-09wkGJgWFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_005504_730152_83909D2A 
X-CRM114-Status: GOOD (  11.08  )
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


> > I applied the series to for-current but squashed the user conversions
> > into patch 1. Changes are trivial enough and I don't want the pull
> > request to look excessive, so it can go in smoothly. Hope you are fine
> > with it.
> >
> 
> Sure, do you still want me to send these changes in separate patches for
> review?

Yes, this is totally fine with me. I think we get more tags when the
patches are broken out.


