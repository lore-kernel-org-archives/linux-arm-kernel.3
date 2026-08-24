Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D92C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1c5VU/tF7UHH11M1RoR7ZdAC67p9CnNgwtWnc1vGqc=; b=a3U79PsepG8H7eot4t0Y4jKtxB
	5QhxH5zvzIlvCxp+zLigv9e0+dcGazQLnKlIo19pr/nT9wMTjH2ZybImuyChf4Z8w8CfUUsS3e6xG
	sN6qaCT0pmzu6vR5rLwBRBna1BAMO7iPDBtv25NU14/AjhpLDIalgPzikr/LT9A93JoNXZUfOz2Ie
	Jtj2MzkSQXLLX9d8NC7g3hZ0Cdiu+yo2Z60uOHFfpr/G0sXpy5WdBmRgmOksMdycQNOgqu63UIu6m
	wJOYEK8Va8c0944dKv5o40b7+u3wPbFrv66vusynh3PNC1n6a7sU5gdU/DEn3DOu2HJHlu/MWz8Rl
	gfSjbAWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySWb-0000000GSL8-1kYk;
	Mon, 24 Aug 2026 11:07:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySWZ-0000000GSL1-1EwV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:07:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 690AF600AD;
	Mon, 24 Aug 2026 11:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 966F21F000E9;
	Mon, 24 Aug 2026 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787569650;
	bh=Z1c5VU/tF7UHH11M1RoR7ZdAC67p9CnNgwtWnc1vGqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dc1Dcpgx1HL94nR6AD7Cil26lFoX3Hu3VN4VC3A7PP+nW4WtwX1umap0UBuPrLBsL
	 8jsoLYvJvB4f+zrd4BTehXzme9xLwAqrv+gmcNv6qUSdTKFQvCPrrqFX+kGfTbKql6
	 7Vor6kcsABOie6nBEJrLoa+j4Hm1NnTq1n24WLuKbvC/zSvJf2NDUIAQgWQEpguaUD
	 LMXlxGjidRnt+NJSsQaMOdOuccSW/dI4l375jzYu0np0ulKHOfERu2AqhAs5Sw9DXi
	 zH7HEkuNYoSiJO2F/GzhT6HBX2VMngWAanvnVcSBpiiBA8MbY1rnI8W9q3QnVMWOiY
	 hWFBwuWZrw8xQ==
Date: Mon, 24 Aug 2026 12:07:25 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Shen Yongchao <grayhat@foxmail.com>, 
	Karl Mehltretter <kmehltretter@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] KVM: arm64: nv: Delay freeing of shadow S2
 structures until VM destruction
Message-ID: <aowl4sQHuoooFhqS@gremlin>
References: <20260821161829.1032561-1-maz@kernel.org>
 <20260821161829.1032561-3-maz@kernel.org>
 <myjs4ge5zolj4drqql7lewoazu6simr32acdgi3jgy65quolhc@amx3hctoyuth>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <myjs4ge5zolj4drqql7lewoazu6simr32acdgi3jgy65quolhc@amx3hctoyuth>
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

On Sun, Aug 23, 2026 at 03:11:31PM +0100, Wei-Lin Chang wrote:
> On Fri, Aug 21, 2026 at 05:18:29PM +0100, Marc Zyngier wrote:
>
> [...]
>
> > +void kvm_destroy_nested(struct kvm *kvm)
> > +{
> > +	for (int i = 0; i < kvm->arch.nested_mmus_size; i+= S2_MMU_PER_VCPU)
>
> nit:                                                     ^ missing space

Ack will fix on respin :)

>
> Thanks,
> Wei-Lin Chang
>
> > +		kvfree(kvm->arch.nested_mmus[i]);
> > +
> > +	kvm->arch.nested_mmus_size = 0;
> > +	kvfree(kvm->arch.nested_mmus);
> > +}
> > +
>
> [...]

--
Cheers, Lorenzo

