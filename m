Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E96ACC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqJITi1yynepa6R55uVgDB61+hhpepsYvwwFTVYeqSA=; b=coDSIwuHjZmZ8RyVlj+FNFpJPZ
	4dMsTKcg5CKqDzT13C3ji3a5wc6EwY66AyQX0dV6gZ8ecF8TO/CeH7KlSyLBrkHYMsnj3kNjQRa3m
	OFmSAbgAtoLc/I7bsHHyRGlxt5bXwr4c1bbimzrQ+YqVTLjmEtp8bv99f/vZM4HsjPNkgmFwXwnzf
	wjoE8HFOOa4b0QdFhZi7Ygmtjh+7SewtagR+WDszUJlgc+wE3oLPIGIKbu/4AGEOmHlOa4kRx8LrN
	teukLcoUzlrCAJs1LnUGWjHY8M0VXFxKBIyb1iohh4Y0uUVZPjr+vcGRcSS8/idmwruBN3aE4j5Cm
	hS3IQ3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwou-0000000FHmi-3DmJ;
	Wed, 14 Oct 2026 11:06:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwot-0000000FHmX-0RKH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:06:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5986B602C8;
	Wed, 14 Oct 2026 11:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B021F000FF;
	Wed, 14 Oct 2026 11:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791976010;
	bh=nqJITi1yynepa6R55uVgDB61+hhpepsYvwwFTVYeqSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=USk4I7LLhlBwYdN9f9H3UUrJPdb1inVFuwSGLjdRPCgeKK5ZIozwxQYiTnJS/Ks5V
	 HXeUupUPU3EIajws+r5Vj68Zcrw5/uy6Nuawtfx+cedPT1Oe56aogCeOuefkC5kRt9
	 VHS/d0M8dtXeTSfKXN6w4txqS//+cFxvI4B3U+4HEf8HGCYZl4AjWKVXdndHyQ4gvp
	 d5ZW/jGD3Oamg11QvZYIKCClV7OrMYI1KuSRivCePkORHvnbyYhIgXtAgIqDpTyGmb
	 BXU3HXTDwjjHwhRYcfb1ht5IDstiazc9Hf6brqQx2ieaQqVSS6qnslAENxFqHqwx+g
	 mESo37TQ6NQSQ==
Date: Wed, 14 Oct 2026 12:06:43 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, kvmarm@lists.linux.dev,
	maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v22 02/10] firmware: arm_rmm: Check for RMI support at
 init
Message-ID: <20261014-dark-adaptable-echidna-ef9e51@sudeepholla>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-3-suzuki.poulose@arm.com>
 <2586e689-c27d-4e4c-8c69-03e24259cb96@redhat.com>
 <8be050e3-8af1-4f04-902f-9bc01b209dd0@arm.com>
 <3fbd4739-a4eb-4428-95ae-ead22e7cf9f2@redhat.com>
 <799fb810-c33e-4d0e-9a70-7092c0a681ff@arm.com>
 <0ceda99f-0352-474b-a30a-c5e79b817c2d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ceda99f-0352-474b-a30a-c5e79b817c2d@redhat.com>
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

On Wed, Oct 14, 2026 at 08:58:00PM +1000, Gavin Shan wrote:
> On 10/14/26 7:19 PM, Suzuki K Poulose wrote:
> > On 14/10/2026 08:26, Gavin Shan wrote:
> > > On 10/13/26 7:58 PM, Suzuki K Poulose wrote:
> > > > On 13/10/2026 04:53, Gavin Shan wrote:
> > > > > Hi Suzuki,
> > > > > 
> > > > > 
> > > > > I think we need to ensure SMCCC version is v1.2 or a newer one here? arm_smccc_1_2_smc()
> > > > > is immediately called by rmi_smccc_invoke() after this check.
> > > > > 
> > > > >      if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC ||
> > > > >              arm_smccc_get_version() < ARM_SMCCC_VERSION_1_2)
> > > > 
> > > > We could. But I am wondering if that adds any value ? If the RMM
> > > > exists and responds to the RMI_ABI_VERSION, it must be so on a
> > > > platform with v1.2 or greater ? The extra check doesn't hurt.
> > > > 
> > > 
> > > It's required as documented in section "B1.1 overview" of RMM-spec-v2.0- bet3.
> > > In the same section, there are more requirements regarding the SMCCC version
> > > when SVE/SME are supported. I don't see a practical problem if the check is
> > > missed since the combination of TF-A and TF-RMM are the only RMM-spec- v2.0-bet3
> > > implementation (as I knew) where the SMCCC version has been set to v1.5 in the
> > > 'master' branch.
> > 
> > Reading the RMM spec again, DFNMZ lists how one can detect if the RMM
> > ABI is present. That specifies that the user checks for SMCCC
> > version >= 1.1, which we do by using arm_smccc_1_1_get_conduit().
> > 
> > Then checking the R{M,S}I_VERSION call is sufficient. So, I think
> > we are good here. Do you agree ?
> > 
> 

> arm_smccc_1_1_get_conduit() ensures SMCCC version >= v1.1, but we need
> SMCCC version >= v1.2. We will have problem if the firmware only supports
> SMCCC v1.1 and R{M,S}I_VERSION is coincidentally supported. In this
> rare (even impossible) case, it's not sufficient to check R{M,S}I_VERSION
> as I understand.
>

Indeed we need SMCCC v1.2+ as I can see the support for the RSI command
RSI_ATTESTATION_TOKEN_INIT which takes more than 8 registers as input
which is not possible with SMCCC v1.1 or below. Unless you have specific
check before those commands, it is better to have the check in the driver
init/probe phase.

> As far as TF-A+TF-RMM is concerned, I agree there is no issue. However,
> the extra check doesn't hurt and make the code following the spec a bit
> more strictly? :-)
> 

I tend to agree.

-- 
Regards,
Sudeep

