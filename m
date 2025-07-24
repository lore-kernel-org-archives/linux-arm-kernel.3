Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B61FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 06:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdPhV1djSORdygNBzM+zW90AvMnoqU9gTbw9K3O79nM=; b=XIukZpjwX1hNXugk3In5UdfaD1
	h1UnvaPnYVjKSRaHH5xa4NCn2p1QeGOPgnuHrg21Jtsil/ZLWifJNWr5O6JKPZISsh0caUtl8c9cM
	KFNI08tCrX+Q71D5Jde6ybvwGQomE6OFWaLl3Ye0gcns2wPw64l2XbNWq0TN+FjXlchQO8JvsfgTc
	/ZFZDR8bYAPoNESPhI2dc6UpP8v+4ii+aoXMPbk7pM4pOGYgu6cXtSMLK3p26Ux2LOik8N2YapbKp
	Kititp2B4pvL5gynb8hkOgqM2x+ZzT2Rp/YyITiuJPXUFucpEti8GXPRfp5X3QUu+LmU2L9kCMOOq
	rZhD+XHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uepoI-00000006di9-3Ywc;
	Thu, 24 Jul 2025 06:52:10 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueplp-00000006dNd-1KRY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 06:49:39 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753339770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YdPhV1djSORdygNBzM+zW90AvMnoqU9gTbw9K3O79nM=;
	b=w4JNZ6Yx5KIHPGvmSHnA9mjNs8BfRS+cx1o547/EFBYQ901cksc9I8GmD65dEvy3Cgfb2f
	5OjCZrBdZJuj37MB1wjtzP+UBFNGYjKMUHbNqefIzapCKxhweYzWW12k07hrUJ+K6v15oH
	CxXGvrrl1Di3Jqs0NcXBy0ePL3PJ5Dk=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jing Zhang <jingzhangos@google.com>,
	Kunkun Jiang <jiangkunkun@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Subject: Re: KVM: arm64: vgic-its: Return -ENXIO to invalid KVM_DEV_ARM_VGIC_GRP_CTRL attrs
Date: Wed, 23 Jul 2025 23:49:13 -0700
Message-Id: <175333974800.2689259.1785304263460558976.b4-ty@linux.dev>
In-Reply-To: <bbbddd56135399baf699bc46ffb6e7f08d9f8c9f.camel@infradead.org>
References: <bbbddd56135399baf699bc46ffb6e7f08d9f8c9f.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_234937_792885_43DA345E 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

On Mon, 23 Jun 2025 15:22:52 +0200, David Woodhouse wrote:
> A preliminary version of a hack to invoke unmap_all_vpes() from an ioctl
> didn't work very well. We eventually determined this was because we were
> invoking it on the wrong file descriptor, but not getting an error.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: vgic-its: Return -ENXIO to invalid KVM_DEV_ARM_VGIC_GRP_CTRL attrs
      https://git.kernel.org/kvmarm/kvmarm/c/4530256f3699

--
Best,
Oliver

