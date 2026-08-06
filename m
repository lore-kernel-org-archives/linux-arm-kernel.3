Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76568C55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGK/RoC19nUT02iTa9oP7JFher0vxY/EWJohRihzv6k=; b=rVSrrz0gASXRJ+TWoeSGe671co
	cpxwST0PztOBsZY4Wpkg0DGes5mYXTXibvEcAwzhmB9QV4Le3gdymuhMZjndw/P1LRXH8AIQuRXHB
	2Pns2t/85TUh0/lRudIP6+1XfBmKWz/2HFC5WOBd6GcHdXDVQHp4IpYOPlp655aQiCHmwBH5Qxx38
	NzUCC/bXjF9YUOpfUhns/HRPbha1SrpG6kKQk3h2DKvwee/neQcpYaz16Lo/Hl6UhWw6TEE6+L4pm
	HG56Ny4ALuGg6y8uNhTmaA9mUqv2p7zbcTrnWeGzD8gdM/MET1EyOSLVAtBo05/GVnjsjeNpxyY3h
	hbfvcu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrxT-000000055ZZ-18xE;
	Thu, 06 Aug 2026 06:52:03 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrxQ-000000055Yw-11OY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1785999118; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=aGK/RoC19nUT02iTa9oP7JFher0vxY/EWJohRihzv6k=;
	b=r5kLjVWjQyf39TRWFihnyL0MDzQWHeNVWN/QHW+7QcnbIGUvWMtGNM9PQom+r2HiMxJRKaK+kArfIC+B25/Qcx+eCJqhhA460yWNdQFU92v6etRY7xKdt/yQRIG2xrai/UXN4QbphQLBd8xWm3PX9+vRrzU2866HdBm/kZVoUAU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=yaoyuan@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X8TCDP1_1785999116;
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0X8TCDP1_1785999116 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Aug 2026 14:51:57 +0800
Date: Thu, 6 Aug 2026 14:51:55 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Oliver Upton <oupton@kernel.org>, Peter Maydell <peter.maydell@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <rduid57zbypxwiujgfez67walqgqkekhyktkbibtiqcjh5buge@jqqcu52yl5nc>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
 <20260803-arm64-gcs-v18-3-fd8c40f5ad88@kernel.org>
 <enhoyivbkdaacgyazubgfzftt34xjemtrybvgpuqvr4czjtbhm@7qvrce5lmdyw>
 <6d63905e-8c6e-4c88-b60b-d34ab1401783@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d63905e-8c6e-4c88-b60b-d34ab1401783@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_235200_642011_BDDF361B 
X-CRM114-Status: GOOD (  13.74  )
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

On Wed, Aug 05, 2026 at 01:32:26PM +0800, Mark Brown wrote:
> On Wed, Aug 05, 2026 at 05:48:04PM +0800, Yao Yuan wrote:
> > On Mon, Aug 03, 2026 at 11:56:48PM +0800, Mark Brown wrote:
>
> > >
> > >  		if (ctxt_has_s1poe(&vcpu->arch.ctxt))
> > >  			write_sysreg_el1(__vcpu_sys_reg(vcpu, POR_EL2), SYS_POR);
> > > +
> > > +		if (ctxt_has_gcs(&vcpu->arch.ctxt)) {
> > > +			write_sysreg_el1(__vcpu_sys_reg(vcpu, GCSCR_EL2), SYS_GCSCR);
> > > +			write_sysreg_el1(__vcpu_sys_reg(vcpu, GCSPR_EL2), SYS_GCSPR);
> > > +		}
>
> > Looks the s1pie checking for GCS vEL2 context switch is
> > necessary yet IIUC, KVM does vEL2 context switch for nested
> > L1's EL2, it should follow same rule as non-nested L1's EL1
> > context switch.
>
> Right, it's not really needed in either case but hopefully helps code
> generation a bit.  Thanks for spotting that.
>
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Sure. let me try delete more next time.
I delete some but decide to leave the whole context switch
diffs to help other guys to see the realted changes when
read my comment.

