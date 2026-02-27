Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCEAFEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 18:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhNkkAkwhMCH2ojVKzEb17U8rjl6Ex5AfW5DMIGvnfY=; b=fVoazlcFGtirG2nmdAnz01At5/
	pQvOQ6s/N//aE51Tl5Cax/XMGcB1RQleEzVYxbDa+HZuWkPrHCHC1Jt72yj6/tS4ABilex7VXjR7z
	RAGv7KbOEhTtqwOOsAeV5z3DzSdnuy1T+Bm1WdrwPgCEcNr/BWYZaO/1bl7oK8rr7UqVDCn4EXpqS
	pB/NsvP/JXtkwYXpQegWiwgnqqfIAsdB3x6Meo1JI6+qUfknL2XRyBQ1OL78K3MuowZnrDn/+6ArH
	62UHvZCbbPNMjv0OE38XbvLXGI4hwECPX1euGzDPzHJyIioKCQDbAPeuEpOPTMNlIMPH09IS55GTO
	SUh14HPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw2Fm-00000008tYN-0bX6;
	Fri, 27 Feb 2026 18:07:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw2Fj-00000008tXs-0r3V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 18:07:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86537419BE;
	Fri, 27 Feb 2026 18:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE74C116C6;
	Fri, 27 Feb 2026 18:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772215670;
	bh=1JaPmS/NjlHcJLGjdFc4aDc/hp52cYihGMOI5f7LB8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WzsHFuy7pm+FNqHNSbLlMp8LoQC8o4Qo4GqEJGKmeQRt3Awa4nmDwygz2u4p20Gyp
	 mvsxs4hfjGHx7ga/TckwTLTS+qtG/ohlpTTOyX6PgulVPdcR8PvO3JkQosmO1UjxU0
	 LRlh5yDe9eZqjWqE0VZebK254zyuVbHyBYY7clnE2pp7nsF0YsMn8KTOt+yyQuBaao
	 dvQwauZSsB/EFOr6C2ctGC3XEq/Nlssj1smP8lSmH7KWPmUBFTfw1NmigKk6RP7o1w
	 s6Pc3r54DOJyubKNym8vYmC3/LhuyoT9VcKdchWoBeTXK0pAMzgwE1sYj/8qy9ahuK
	 9WNamjsEhcJog==
Date: Fri, 27 Feb 2026 18:07:44 +0000
From: Will Deacon <will@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: yabinc@google.com, James Clark <james.clark@linaro.org>,
	Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	Oliver Upton <oupton@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH] KVM: arm64: Disable TRBE Trace Buffer Unit when running
 in guest context
Message-ID: <aaHdcKGE94ze2fq9@willie-the-truck>
References: <20260216130959.19317-1-will@kernel.org>
 <86a4x8bw38.wl-maz@kernel.org>
 <d2f6877a-534d-4862-a61c-fb3cb5b96618@linaro.org>
 <aZNec3B0Iou9PYGw@willie-the-truck>
 <20260217141917.GA136967@e132581.arm.com>
 <aZSAsC1YI5_lK3e0@willie-the-truck>
 <20260217190121.GB136967@e132581.arm.com>
 <aZcWC25GE2iUKsNt@willie-the-truck>
 <20260219185800.GD136967@e132581.arm.com>
 <20260225120956.GD4184494@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225120956.GD4184494@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_100751_264407_A94B7F5E 
X-CRM114-Status: GOOD (  16.81  )
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

On Wed, Feb 25, 2026 at 12:09:56PM +0000, Leo Yan wrote:
> [ + Yabin ]
> 
> Thanks for Suzuki's reminding, I should mention that Yabin reported
> another lockup issue caused by missing CPU PM support in TRBE driver.
> 
> We have a patch series to fix the issue:
> https://lore.kernel.org/linux-arm-kernel/20251119-arm_coresight_path_power_management_improvement-v5-16-f615a301ad0b@arm.com/

Two nits on that series:

1. It seems a bit weird to me for the ETE driver to manage TRFCR but for
   the TRBE driver to manage the other registers

2. Are you sure you don't need to save/restore the TRBE state when
   LIMITR.E is clear? Maybe the driver is fine with that, but I'm worried
   that we could suspend in a half-programmed state and lose some of that
   configuration.

> Besides your fix the translation regime issue, I'd also suggest applying
> the CoreSight PM patch series to fix lockup caused by CPU idle.

Yes, we definitely need something like that in the android kernel trees.
I've previously bodged a hack into the ETE PM notifiers, but if you have
backports of your series to 6.12, 6.6 and 6.1 then we should merge them
into Android. As it stands, I don't have a TRBE-capable device running
mainline.

Will

