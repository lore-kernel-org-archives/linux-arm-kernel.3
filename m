Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F8BCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 09:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEoKUOwM51PPh6FV7fZqXSWft8vzV8AsvmeGrZqg534=; b=Cbm3+QmItKH87HL4Ijw7KTOaMe
	oUTTkDoCvwYtCH/vcE7xyIXbnya5dxDHzyWfZAzdKlj/4I4F8Mojp7wFrVACGf3BN+Esh7y1ECJP0
	mVhf1bTuCuDdlQ4y+HR5b4KDbouVzbgnwIv35kb1n3iz4PFDC02ORjNx+8yfCWZgqupKtLjkEYQPo
	3kHuSQc5I3Omg/7VlSyg6A6o2vAsByvVU8beAw/RWQGp2sOzR9YwMkw+GqBbXa+OrC39Wyj/xON4o
	A5dYsNQSOqqc3316r2oMhyp8BzfVomwjRMTafmZlmtJyKrW3mNF2bZskC+lwKAiFvCwBw8n/Qb2DW
	QRQHQf+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSXSu-00000005YBh-2bNN;
	Thu, 28 May 2026 09:55:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSXSs-00000005YBJ-3V0l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 09:55:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7BE443F7;
	Thu, 28 May 2026 02:55:40 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B76AA3F632;
	Thu, 28 May 2026 02:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779962145; bh=+1wVAqRlhKf3c7sqkfh3JBpBe6PeJ2dRxvJY09h7QHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTlk7cJDqHd0sZQpXVRVYcD8hxsY6lBkBhBkA+r5F0517v337AbDj6Qob2Uun5d7/
	 +BrBqlc5JPktWsiJejt+fw8ZV98X970/iuDUw9V69xjxreNfvu0kcmuzwTA/e06Py9
	 TMROGBUZVEZn/yeCGvnszzxxS2oR0vLKbNfFjb9s=
Date: Thu, 28 May 2026 10:55:32 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 0/4] KVM: arm64: Handle unsupported guest translation
 granule sizes
Message-ID: <iyfrjjhqej65nrfwmkws7kknpdcqr4uyzdtte3exlgf3ghfhux@pdi2wbnyyzcx>
References: <20260414000334.3947257-1-weilin.chang@arm.com>
 <177996023466.1525303.2108207515102273832.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177996023466.1525303.2108207515102273832.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_025546_936195_3BBFD496 
X-CRM114-Status: GOOD (  12.63  )
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

On Thu, May 28, 2026 at 10:24:01AM +0100, Marc Zyngier wrote:
> On Tue, 14 Apr 2026 01:03:30 +0100, Wei-Lin Chang wrote:
> > This is v2 of fixing the granule size selection for software stage-1
> > and stage-2 walks. Thanks to Marc for the feedback on v1 ([1]).
> > 
> > * Changes from v1:
> > 
> >   - Take the entire (v)tcr value for TGx decode helpers.
> > 
> > [...]
> 
> Applied to next, thanks!
> 
> [1/4] KVM: arm64: nv: Rename vtcr_to_walk_info() to setup_s2_walk()
>       commit: a878096e0e86b44e758aafc6b26af97e8f548673
> [2/4] KVM: arm64: Factor out TG0/1 decoding of VTCR and TCR
>       commit: d7768b4f718503e79e7c626d29e9131b747148ee
> [3/4] KVM: arm64: nv: Use literal granule size in TLBI range calculation
>       commit: b154da8288add1f6fb958797d0b3462800f9fc77
> [4/4] KVM: arm64: Fallback to a supported value for unsupported guest TGx
>       commit: 8853566dfbab1a255ae72676ab5ec43e1631ddb7

Thanks for fixing the small issues!

Wei-Lin Chang

> 
> Cheers,
> 
> 	M.
> -- 
> Without deviation from the norm, progress is not possible.
> 
> 

