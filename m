Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CFFF8FA99
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 16:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFiz0CyeOckhiA9EYbN/NC00NzTdpaNoN9BrgHdHe58=; b=d2gWy6oC/xrj2Mf61kCZ+Y5JXx
	NHOZoOdqEtv+EZSITNpbcf0p63Wdga0AVdqYjhAIDSk0rzr91EUZD1yja0neAal7L/nsuNtSr1lZ5
	aBRB7UggWgTC2tbM2p3nuw3RfCW2UJFHst4XLFa3Ro4RkJTJ2ag4KFDIkMTnPW5m0flhlCBznU5kd
	BxwY4+KFxqFKeWvKeLovW64ZhZ4HqUFhzobOZtPyWvlq2+4H9bs71s69einopGWjkl6PsdsrHaiQJ
	gcOfIAcice+WPnr4g0q7lDXfXFrdqfS5djbapQCh10jMACfsVexRdB5q3fIwT+dnF9ZOAOTnnWaav
	XBKayrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDYG-00000008stB-23BI;
	Tue, 21 Apr 2026 16:02:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFDYD-00000008srS-06J4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 16:02:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDB6F25DE;
	Tue, 21 Apr 2026 09:02:05 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 297AC3FBD2;
	Tue, 21 Apr 2026 09:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776787331; bh=Pg2Y2R3dJ5pv9N735vZc4+rPfmTMTkbBWHFgyQTkLPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tN3ViIKRFv45siGrW8eN0HA/EJUvCGUkv941kRhDYq7PAJ5xaotuWYZ3WwQKCfOuI
	 jD8Sav5zF9x7kFSq8GppUweChWsbBrgog4Y1Qe/MZmZ4dlillcSnzl0fFviygeXAdy
	 WKpyhTDYcqaER63gKip0z31n0hcQTInm+k3xzXHM=
Date: Tue, 21 Apr 2026 17:02:07 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: Re: [PATCH 12/18] KVM: arm64: selftests: Add missing GIC CDEN to
 no-vgic-v5 selftest
Message-ID: <20260421160207.GC3862683@e124191.cambridge.arm.com>
References: <20260415115559.2227718-1-maz@kernel.org>
 <20260415115559.2227718-13-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415115559.2227718-13-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_090213_104744_30E2C2B5 
X-CRM114-Status: GOOD (  14.23  )
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

On Wed, Apr 15, 2026 at 12:55:53PM +0100, Marc Zyngier wrote:
> From: Sascha Bischoff <sascha.bischoff@arm.com>
> 
> The selftest mistakenly omitted the GIC CDEN instruction from the
> testing. Add it in.

Compared against the list of instructions in the spec.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

> 
> Fixes: ce29261ec648 ("KVM: arm64: selftests: Add no-vgic-v5 selftest")
> Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  tools/testing/selftests/kvm/arm64/no-vgic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/kvm/arm64/no-vgic.c b/tools/testing/selftests/kvm/arm64/no-vgic.c
> index b14686ef17d12..e09e3fac904f4 100644
> --- a/tools/testing/selftests/kvm/arm64/no-vgic.c
> +++ b/tools/testing/selftests/kvm/arm64/no-vgic.c
> @@ -159,6 +159,7 @@ static void guest_code_gicv5(void)
>  	check_gicv5_gic_op(CDAFF);
>  	check_gicv5_gic_op(CDDI);
>  	check_gicv5_gic_op(CDDIS);
> +	check_gicv5_gic_op(CDEN);
>  	check_gicv5_gic_op(CDEOI);
>  	check_gicv5_gic_op(CDHM);
>  	check_gicv5_gic_op(CDPEND);
> -- 
> 2.47.3
> 

