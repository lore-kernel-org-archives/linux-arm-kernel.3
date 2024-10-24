Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724BFCE8E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 12:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuoWczUSRxhSFFtvg4xgN7fh42HyXqtTGDOJfAdgT0o=; b=BHW3Wutg8foZVwjth8UWuMdpRI
	9whHuV9HW9z+E9Ed6mqXqsngpTaBNnB90yu0HFaxctmK97NOTvSEqSQ7Gta7vZl8wsvj6Cb/iXVRI
	kwhsg3yM43xpuSyZtYSCsKKLC0Fa/ny2Nk0P0zblVcQwwgtdXPdDpl0gEyyUed/Pp0KAQKmv9jYbE
	1OpVCkcq1KEolFAMuUMhjv2Y/4Xaxjdutwe+ufQZy3ePvWQ0+Vdpa6/FeVZmX6JS+4UUiGenV5KYb
	EZWsTRKr/Cn4vAlqe17c7SqFcFLoFdl5k6Qneg4LLNdM2WuxctVc6IFDrjBe1vzdcPPtxe2WprudK
	Hao5flkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xGl-00000000Or9-3zwD;
	Thu, 24 Oct 2024 12:48:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xEt-00000000OTm-1Yj3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 12:46:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D092339;
	Thu, 24 Oct 2024 05:47:24 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 610E83F71E;
	Thu, 24 Oct 2024 05:46:53 -0700 (PDT)
Date: Thu, 24 Oct 2024 13:45:28 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH v5 17/37] KVM: arm64: Sanitise ID_AA64MMFR3_EL1
Message-ID: <20241024124528.GA1403933@e124191.cambridge.arm.com>
References: <20241023145345.1613824-1-maz@kernel.org>
 <20241023145345.1613824-18-maz@kernel.org>
 <33681a4d-2ea4-416e-9e2c-81a89a78c4ed@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33681a4d-2ea4-416e-9e2c-81a89a78c4ed@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_054655_496214_141BA495 
X-CRM114-Status: GOOD (  10.44  )
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

On Thu, Oct 24, 2024 at 01:32:09PM +0100, Mark Brown wrote:
> On Wed, Oct 23, 2024 at 03:53:25PM +0100, Marc Zyngier wrote:
> 
> > Add the missing sanitisation of ID_AA64MMFR3_EL1, making sure we
> > solely expose S1PIE and TCRX (we currently don't support anything
> > else).
> 
> >  	case SYS_ID_AA64MMFR3_EL1:
> > -		val &= ID_AA64MMFR3_EL1_TCRX | ID_AA64MMFR3_EL1_S1POE;
> > +
> > +		val &= ID_AA64MMFR3_EL1_TCRX | ID_AA64MMFR3_EL1_S1POE |
> > +		       ID_AA64MMFR3_EL1_S1PIE;
> 
> The changelog is now out of date, POE has been added.

This will disappear with a rebase won't it? Since you made the same change in 
d4a89e5aee23 ("KVM: arm64: Expose S1PIE to guests"), in Linus' tree.

Thanks,
Joey

