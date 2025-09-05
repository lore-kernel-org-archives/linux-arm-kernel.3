Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB1ACA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AimxSnqAg/PYk0/+Yu7w959oIMCqjnKqkDuKgUOQXrc=; b=eHT/xzjuw3kaRosrb2VfdKmYIK
	SzbCFv5Be06KLsLgrfmzUHpOoUjHnwcobR94ecwhkOPKX6idVMoaSLisf+sjjPwlQWUxMp0lWnMzX
	1f7PI1CNmSG/XHOe9mhginbn1QhsHcQ/i3jsu13FKdWTEaLOZrzPdeCJRxHMJszySFFPI4lcb/khH
	ZZKzUy7rU3kKAFhGfg7EXAg2+K8bxrhJNdv1015MZOOaGo7jJcgFKreTzQ03ViOLx6kM4nz97NFR3
	4xJdDNA28hf85RwshObX6zjSSg7ct1HGDr1t0ZdlpU8YE7MnE83yBwzrEAuLOjAyEnJOdp95kif8X
	42XcxpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXVZ-00000002KzK-1wkR;
	Fri, 05 Sep 2025 14:33:45 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSuA-00000000nLG-2WFz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 09:38:52 +0000
Date: Fri, 5 Sep 2025 01:16:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757065126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AimxSnqAg/PYk0/+Yu7w959oIMCqjnKqkDuKgUOQXrc=;
	b=IPFOiGd6nIg8BQj/3OlbgYRSciVmUyCRcdp3IWtWHp2QxD5/bhIaXR79alskup155NcZS5
	w0/e8HFUNtN6zzSHOFf802lfw2wW4PHS+kCM3v46gqsSXvEmo7kBoCBf/BwCTU1OwYhy71
	WEflbCu1/Q3gwE1mfci2KBBWQJT/RKY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: p@sswd.pw
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, maz@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH v2] KVM: arm64: nv: Fix incorrect VNCR invalidation range
 calculation
Message-ID: <aLqcZ6zL4rTtxfaS@linux.dev>
References: <20250903123949.24858-1-p@sswd.pw>
 <20250905083008.27725-1-p@sswd.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905083008.27725-1-p@sswd.pw>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_023851_146745_A913233B 
X-CRM114-Status: GOOD (  15.39  )
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

Hi Dongha,

Thanks for respinning. Please send new versions of a patch series as a
new thread (i.e. don't specify In-Reply-To), it helps a lot for patch
organization on the receiving side.

On Fri, Sep 05, 2025 at 05:30:08PM +0900, p@sswd.pw wrote:
> From: leedongha <p@sswd.pw>
> 
> The code for invalidating VNCR entries in both kvm_invalidate_vncr_ipa()
> and invalidate_vncr_va() incorrectly uses a bitwise AND with `(size - 1)`
> instead of `~(size - 1)` to align the start address. This results
> in masking the address bits instead of aligning them down to the start
> of the block.
> 
> This bug may cause stale VNCR TLB entries to remain valid even after a
> TLBI or MMU notifier, leading to incorrect memory translation and
> unexpected guest behavior.
> 
> Credit
> Team 0xB6 in bob14:
> DongHa Lee (@GAP-dev)
> Gyujeong Jin (@gyutrange)
> Daehyeon Ko (@4ncienth)
> Geonha Lee (@leegn4a)
> Hyungyu Oh (@ohhyungyu)
> Jaewon Yang (@R4mbb)
> 
> Link: https://lore.kernel.org/r/20250903123949.24858-1-p@sswd.pw
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Dongha Lee <p@sswd.pw>

This SOB still doesn't match the one you used to author the patch.
Please make sure the author and SOB lines are an exact match, both name
and email.

Otherwise this looks good to me. I will apply it if you can respin once
more.

Thanks,
Oliver

