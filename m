Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D14CCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0xW1ECQl1jI0BL+wij76Qj8jsOKsICj1DWAClibVrE=; b=mVWGLzKbaZnwiZZfooy2Rh8dLt
	rVhV95Q8OVG/2NuDGT3vyz1qhDv1/fEOHs2J0J97dF7QyDpbYkKP68gGB5tGreFnUUoQsD1kay0f9
	S8JXzOSgC/q577tGC1TOfn7cTJyu9kwRpxBF8h+5Zc+GkoFHiYGYrkLhwHh31mzEnaihCd4wq2K2S
	RUG2N6XcpxMsYG2uJL6Y9H4q5Ri9196srrVVRxJ1yPi24yB9Yl5KMlITPR6iCcZa/TWGdioiJF0KW
	7qdH0LD0VZ8OuWtmmeBOnRI0szlpzRy+Ju6iSDNOh0vTMf0Ra4GnrFjKNyJqcLnb6Cn+Ko4uMa/9m
	ZpVjgFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjAo-00000003Bqf-1VpU;
	Fri, 16 Oct 2026 14:44:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjAm-00000003BqZ-47Pe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:44:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 68C4141185;
	Fri, 16 Oct 2026 14:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652B01F000C4;
	Fri, 16 Oct 2026 14:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792161880;
	bh=j0xW1ECQl1jI0BL+wij76Qj8jsOKsICj1DWAClibVrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bwr/nzaglzAmR+wBeAZmq2eOT7MEcrWX2lvXEGeDyhE51bVxI3SgaShKfUBiYf95g
	 PmPSn2XhibSE4eN8cv06IVMobz4lNmloGh/vbUBPQPMRA+LsYlBo0nz0c8vJpFUK3C
	 slQkDPLs6z92+ufgm/Fa8TFMhnbV0q/2Z/dJ3rGmonEBvA+JaJN11IxFe7clZgUeDJ
	 miRiBu7BSUf9kZeip6s4AfA6WfKCbpjIzAdzbyD93F2r8xbjiTsSds49Lsg9YIgyxO
	 f38Mt2XTtZuhAtxAIKtCr2LRW0txknrlpTenmZXyjebLSbgcK/6JId8DQ/Ooshdf9D
	 JLjwJt40G4clA==
Date: Fri, 16 Oct 2026 15:44:33 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC PATCH v7 11/28] KVM: arm64: Add a new VCPU device control
 group for SPE
Message-ID: <atI1NfqxWsPOhvBX@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-12-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-12-alexandru.elisei@arm.com>
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

On Thu, Sep 03, 2026 at 05:06:06PM +0100, Alexandru Elisei wrote:
> From: Sudeep Holla <sudeep.holla@arm.com>
>
> Add a new VCPU device control group to control various aspects of KVM's SPE
> emulation. Functionality will be added in later patches.

Again fairly thin commit message, be useful to provide more details.

I'd also explicitly say you're adding stubs and the foundations for this but the
actual implementation isn't in place yet.

>
> [ Alexandru E: Major rework ]

Generally [] stuff is for small fixups done to a patch, so a major rework isn't
really suited to this form.

The done thing for this kind of thing I think is something like:

Co-developed-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Note that you require Sudeep's explicit permission to do this though! :)

>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Overall this looks obviously correct (TM), so with the commit message +
authorship stuff addressed:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

--
Cheers, Lorenzo

