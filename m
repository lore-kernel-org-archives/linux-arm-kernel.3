Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94BFD711DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 18:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JiCqnH/N5qplVZ7g7wn+S0HMki3DemVnIFDmIHExQpI=; b=dFJltQ+FxA3NaFdXBx0+FlAMYB
	ZLbPo4/yM9bXdKJO7iPugz5hdAt8Jr9jBX90DwfyUg2DEidD7c4WvM2ju+m9CCfrGjgY8uK6/0pT0
	Zgifo1smf+E0xgT9PscOM9J0WOxbLWxTavPwrVXB8fYLW1/ztIo8qGsgTl9KYPffOpVSEXAQRaWEv
	0ZE/yaIo+R9r5VCHcUqB0VX+y14uQYZbbZ0PxDp1DO567ZjDxAssqJKiCgj0NlwXBi+rdHLeDeKYa
	v28KeAo5KWZjIETEUQaeRR3zOfqY+XJVPA8F47Tea0sYAKgOnLncYX5KC/fHki6ilRUEmymrRBivJ
	umsV6f1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDpi2-0000000G3h9-3W5O;
	Wed, 20 Nov 2024 18:45:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDph6-0000000G3cT-3u36
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 18:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F8EC5C5E21;
	Wed, 20 Nov 2024 18:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC01C4CECD;
	Wed, 20 Nov 2024 18:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732128292;
	bh=B21EgymTmcGOhy1UvBRVGTv4bnnG/EQbIXgGJ4nsO10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wx+wAVwHGVZXt8ubFvTMZ+Lz66MNnfQkHKV6TBFd5iIPg13tdSeZ0/p8HaMdeIgq/
	 XVL5LEzS9X0Fik3g1APUNr3HGeaYMRXBZHo9pyyvWGDYy9L/SzrAGXTzmU0iaHVp4H
	 /bweM/UnSDAbjP+iLspKQHXc5oVmdOpj94LfE4xrcAMPyWO/xCmWj886HDF5BITaHC
	 QltaQmsub8E6hg0/yb3zIpAXWpIyYTkMG7WR/116c4b6OH8qgLfNxTwLHi9XWZbkWm
	 G4aKwYFJdah1C77Tusv9aRE5g66q8zA+vjMuyAlnJC4Ha5Nywnkxroiz1LXI9OJ+8o
	 Qk9qlJbWFmPYA==
Date: Wed, 20 Nov 2024 10:44:50 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Stephane Eranian <eranian@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf/arm-cmn: Fix arm_cmn_node_to_xp()
Message-ID: <Zz4uIoYS0fhJZTi3@google.com>
References: <20241120164110.266297-1-namhyung@kernel.org>
 <bb01b83a-32cb-4efe-b9d6-06a4cf138b3b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb01b83a-32cb-4efe-b9d6-06a4cf138b3b@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_104453_008490_2014B2BC 
X-CRM114-Status: GOOD (  17.81  )
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

Hello,

On Wed, Nov 20, 2024 at 04:55:04PM +0000, Robin Murphy wrote:
> On 20/11/2024 4:41 pm, Namhyung Kim wrote:
> > The portid_bits and deviceid_bits for XP type nodes are set in the
> > arm_cmn_discover() and it's copied to others in arm_cmn_init_dtcs().
> > But to get the XP from a node in the arm_cmn_init_dtcs(), it needs
> > the {port,device}id_bits.
> > 
> > This makes arm-cmn PMU failing to count events on my setup.  What we
> > need is the number of bits in total which is known by the cmn config.
> 
> Hmm, what about just moving the assignment to a point where it actually
> makes more sense anyway?

Yep, this looks good to me too.  Do you want to me to resend this?

Thanks,
Namhyung

> 
> ----->8-----
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 397a46410f7c..30506c43776f 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -2178,8 +2178,6 @@ static int arm_cmn_init_dtcs(struct arm_cmn *cmn)
>  			continue;
>  		xp = arm_cmn_node_to_xp(cmn, dn);
> -		dn->portid_bits = xp->portid_bits;
> -		dn->deviceid_bits = xp->deviceid_bits;
>  		dn->dtc = xp->dtc;
>  		dn->dtm = xp->dtm;
>  		if (cmn->multi_dtm)
> @@ -2420,6 +2418,8 @@ static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
>  			}
>  			arm_cmn_init_node_info(cmn, reg & CMN_CHILD_NODE_ADDR, dn);
> +			dn->portid_bits = xp->portid_bits;
> +			dn->deviceid_bits = xp->deviceid_bits;
>  			switch (dn->type) {
>  			case CMN_TYPE_DTC:

