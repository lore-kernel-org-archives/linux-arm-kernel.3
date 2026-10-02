Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2D5CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3XSvVIqIJb9n/x3qaYL7kH0gfxPLdje2eVvkPwfr1I=; b=pvvuTxMGyzwWVi3aJSNwc8vN3W
	0fYLk7R92dtlSQ/WNBNo0Z27+aEfB8mz5yqhGKDyuxzFgnRgD4BB4RDif3xUQWdDP88Ah5SABKGPt
	7cfuiEGtJeXUu8hIVUQ+tCtovbN5AogQ1I9jaIw8/62WaZC39UGsHW5WPcVxupqS1A3VWm1XPLYvK
	x9M//cpFyBQZiIo+54LJ+ZVUwefEMeJ9zB+ZyilZqjapAMU7RGK7KxpmnTMCAJEniIVPT2Vbqdpoa
	kLrDCD+eUEIj/qynmqycpQ9JkfdL2wZMtqsDcs+lQ/+zHQuahh4wRniKfCzYesY6b8pWVNL+Burw9
	gN3lHNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbQq-0000000BTTf-0XYY;
	Fri, 02 Oct 2026 11:28:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbQo-0000000BTTU-3Bun
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:28:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B8FD409B8;
	Fri,  2 Oct 2026 11:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488E91F000FF;
	Fri,  2 Oct 2026 11:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940482;
	bh=r3XSvVIqIJb9n/x3qaYL7kH0gfxPLdje2eVvkPwfr1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nAYNTtyxSvEJWlBwMsuLcNL+tHeMYXYUfLPsAX1ucTE/y72zAPwEggidfF76fDiuw
	 Kh+kphHP4rWdvz0VzThertJ6AM7Q18c8vkZQtWmoyMAPKyOPdxs/4OILFBZl/O8BVZ
	 9y/cD1gaXPdFeM5vv8wEKYA0GnzUMqJZ9tQYI4hlGD1wp5TB0GN52P8GZcBUjQXrP4
	 g6yqw6Ka9jpHj5CiKGiuxz4alEMWuwHFafNDDa/qwCm0NdVH70yl8xQjkfAhWmBks0
	 1J1PQJR6gukcWrNsBzOKVB1E8vOjMW45NxETR3F0WMvt4v6wrGpIaG1mm5PsprQ8fC
	 JSyhpUqm8cW5A==
Date: Fri, 2 Oct 2026 12:27:55 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 12/15] KVM: selftests: arm64: Add GCS to set_id_regs
Message-ID: <ar-VI92hceN5njfG@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-12-3556644cd927@kernel.org>
 <ar6MIFW2vfM893yd@gremlin>
 <8eb4d0f8-3080-4efa-afaf-bbe2a16eaa37@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eb4d0f8-3080-4efa-afaf-bbe2a16eaa37@sirena.org.uk>
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

On Thu, Oct 01, 2026 at 07:14:26PM +0100, Mark Brown wrote:
> On Thu, Oct 01, 2026 at 05:38:54PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Wed, Sep 30, 2026 at 10:48:22PM +0100, Mark Brown wrote:
>
> > > Now that GCS is configurable via the ID registers update set_id_regs to
> > > cover ID_AA64PFR1_EL1.GCS.
>
> > Should maybe also mention adding the GCS-without-S1PIE test?
>
> I'd have said that was part of the coverage the test now has for
> bitfields TBH.

Fair enough, all LGTM at any rate! :)

--
Cheers, Lorenzo

