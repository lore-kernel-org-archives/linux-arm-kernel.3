Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74F9CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=472qNEhPpJBtpQXWPAA67Hvyd9m8FpDTVGwTd9jdzNA=; b=KSeU7LEfhTY3557uVaflo7F4Kr
	0klTw2rqnflpdgC4IfQhcidqye/mGk1cIHWKdKFD1EzXTcGlEX30N80HPvKNsyICmPX8jFgB0+lEH
	5+VOWjyLnnojGeNQdx9MQlAo8TIXhCRS+NRHHCAuI6Qlei69TdaoOZGceoF1f0hOv9apbkHx4Br/3
	rRkQ105zC+Sq31Ubfnuh+UOp06RKlcy7C38enFSt2xya4tTmAafWK10mer9ChZRYk9kWC4Ep78z0M
	pjWw1cinav4bweeUL0vHsFtsToe/0+XPVJ3VRJaujMNOPO1jUk5WpLYNjvI8NPMAF6nqFoNf5ngHr
	rpPSlwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgUm-00000001VIJ-0Mhj;
	Mon, 08 Sep 2025 18:21:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvci2-000000003go-0CnZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:19:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1FA6438AB;
	Mon,  8 Sep 2025 14:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEA8C4CEF1;
	Mon,  8 Sep 2025 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757341145;
	bh=yiJn6yvEIzXcaVGJDrahppkN2NuhubqGe8lDQpynQCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iubh/eA1nyg+Vit19I/0vMWi+wjsMmtMa/qL9jI6QjHzaoAuTHU3LiSSGvHn6ktvR
	 t9upV2MtJmetCjNvpwCFVrewdRWDQA8fieLrAGQaFcmEaFA1DEBR8S1VGMftYIjgZH
	 QPl/FB2GkpUT3OELCHZ/GL1s72wb49qgXR8KeinGluMaoKjq3KSkQGYqYovQnwhygD
	 JBKZNB/0Zp7v/pw9uQHdv+atGXR/v/PcadSA0QRKk5q70+9qUT2yEQ8plupNlMoJFK
	 QnZYC5Wk+Lz3oGhZAoH+CpbDZAIsMkgFkAuDNDcB40X8smUjSPuy73rRMAklqv7wxb
	 tzefnLAttKAJw==
Date: Mon, 8 Sep 2025 15:19:00 +0100
From: Will Deacon <will@kernel.org>
To: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2] KVM: arm64: ptdump: Don't test PTE_VALID alongside
 other attributes
Message-ID: <aL7l1NImpMfwTVfu@willie-the-truck>
References: <20250809135356.1003520-1-r09922117@csie.ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809135356.1003520-1-r09922117@csie.ntu.edu.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_071906_108380_25D2A40D 
X-CRM114-Status: GOOD (  15.41  )
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

On Sat, Aug 09, 2025 at 09:53:56PM +0800, Wei-Lin Chang wrote:
> The attribute masks and test values in the ptdump code are meant for
> individual attributes, however for stage-2 ptdump we included PTE_VALID
> while testing for R, W, X, and AF. This led to some confusion and the
> flipped output for the executable attribute.
> 
> Remove PTE_VALID from all attribute masks and values so that each test
> matches only the relevant bits.
> 
> Additionally, the executable attribute printing is updated to align with
> stage-1 ptdump, printing "NX" for non-executable regions and "x " for
> executable ones.
> 
> Suggested-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Sebastian Ene <sebastianene@google.com>
> Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> ---
> Tested on QEMU.
> 
> Changes in v2, thanks to those listed in the Suggested-by tags:
>   - remove PTE_VALID from .mask and .val
>   - make executable attribute output format identical to stage-1 ptdump
>   - Link to v1: https://lore.kernel.org/kvmarm/20250802104021.3076621-1-r09922117@csie.ntu.edu.tw/
> ---
>  arch/arm64/kvm/ptdump.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

I assume Oliver or Marc will pick this up via the kvmarm tree.

Cheers,

Will

