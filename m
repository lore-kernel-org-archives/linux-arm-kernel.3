Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C76CEACCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPYZEFN4B8QVskhjXZK7gRhi39tFK/rZrRsxQPoF5lI=; b=Bcvb9SvUX4ZzZV/KVuC2C4xIru
	gvFsXvT0oUUPzZq9m8vtsdKxyQVMJ/yWkSGZzfdqTWiwbdSJ/yCaGGY4LjAsj0sSBxnyOBkUBe2Av
	2g3+5EePMW3sYtFvbh6Ym8Zx1nk+9vbdFMSKaon5tvGuoL9OxuV8ZCb7jt2eCIu31PCe49O005NTX
	No8wa3HVf7DmI3zaSQvVwMJC9FLrYFuxUVUhtgAD3jDPcPjvcgOmtWqiYiDqmZ1wRRg16GFB/kBJD
	cShQSHUAkVlQfx/YHw2JQtReMiTArp9C7i2/ISC4/0NBjMSMTBo1XE6o1j+ZajiTkgKW+jJEPwVQH
	T/vyt/Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0NB-0000000D523-08ti;
	Fri, 14 Nov 2025 20:26:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0N9-0000000D51j-01Ug
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 20:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4C6442DA2;
	Fri, 14 Nov 2025 20:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA42C4CEF1;
	Fri, 14 Nov 2025 20:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763151976;
	bh=tbNTfMOZpk52rvNK4qNcSo5qJBKRDs2L51DIQLpStus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pikUzbE4Uil0KhxIF//+6qKeX+A9yajj87UnySF61nV2S5wxP8oOhZr0GyFJCedhm
	 yiTZHUgb9GNy0S+Kd2r/nU7UpCssa6Ps/hpqQSgTeNl475I21XzpkvjLTXe35HMdTJ
	 EZgeCcVo5PnXVTnCHYY+Ej979HdnciAgvWAtNtAQm6Mu8djq3Hb2tTuH/LKbVo0xmJ
	 zFDVFmVu3sq3GIXxf5ZRLFAlP0Hhk1+bmVF7AGG1UrohSNdbgBOFkQbn4zIZOQAIbo
	 PXNGMNguqKyYvQAVc8NA9m2R+CdCaAoVgQkrb2EgX9NTI6CwbvYx03cDR3SydFSRBV
	 BTSfRQSKr0Mdw==
Date: Fri, 14 Nov 2025 12:26:15 -0800
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Maximilian Dittgen <mdittgen@amazon.de>, oliver.upton@linux.dev,
	pbonzini@redhat.com, shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
	lilitj@amazon.de, nh-open-source@amazon.com
Subject: Re: [PATCH] KVM: selftests: Add SYNC after guest ITS setup in
 vgic_lpi_stress
Message-ID: <aReQZ7VCOMYv9I7G@kernel.org>
References: <20251114143902.30435-1-mdittgen@amazon.de>
 <86bjl4tyc9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjl4tyc9.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_122619_064741_90475D2C 
X-CRM114-Status: GOOD (  14.44  )
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

On Fri, Nov 14, 2025 at 03:42:30PM +0000, Marc Zyngier wrote:
> On Fri, 14 Nov 2025 14:39:02 +0000,
> Maximilian Dittgen <mdittgen@amazon.de> wrote:
> > diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
> > index 687d04463983..e857a605f577 100644
> > --- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
> > +++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
> > @@ -118,6 +118,10 @@ static void guest_setup_gic(void)
> >  
> >  	guest_setup_its_mappings();
> >  	guest_invalidate_all_rdists();
> > +
> > +	/* SYNC to ensure ITS setup is complete */
> > +	for (cpuid = 0; cpuid < test_data.nr_cpus; cpuid++)
> > +		its_send_sync_cmd(test_data.cmdq_base_va, cpuid);
> 
> You are making an implementation assumption here. There is nothing in
> the spec that says that the GICR_TYPER.Processor_Number associated
> with a given CPU is the same thing as the CPU number that the
> selftests infrastructure give you.

This is already rather widely assumed in the selftests GIC library as
well as this test (ex. guest_invalidate_all_rdists()). I'd be happy with
an assertion in gicv3_cpu_init() that ensures
GICR_TYPER.Processor_Number == cpu.

Thanks,
Oliver

