Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D56C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 05:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kz97nTQZlnksCETF2OO3FxTKc75UDfdQVAlEutLyMk=; b=J2uo10jF42wCYSLNhTE2up1KYv
	xCB0m6DGJoq6zDEmK85FmBKSGp+tGfp6kdK0LtEKAmDXiYxpwiTsKdaS1itX8aky31Qj/OVmo051P
	kNXYQkAf4iQL87rc2mp9BYVZIK0Se4Glt+ac/HzP9ynC/6OLFkiwVGl8jyDLotiHspTBoTauZd1py
	sT+xE86oObDsMVD2WHgFgruwdGdcWhM40f6myritSx0iehAuNllub17fr6gWhOaQvGB8DUfPtyMxS
	opeuT+LAFy3Usa3/ZxZBqLtjpr/XeGgeaOHuZ82iwbl6zzUToAMAcB5l+vcwESvHdZ1121X4Pyv1U
	fXCt8f8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR2qt-00000003SrS-0eNP;
	Mon, 16 Jun 2025 05:57:51 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR2of-00000003SjT-1Vh8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 05:55:35 +0000
Date: Sun, 15 Jun 2025 22:55:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750053329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+kz97nTQZlnksCETF2OO3FxTKc75UDfdQVAlEutLyMk=;
	b=ZWVWV3p4mOCIZ6vd1VtWMmbvFOZ/gc24FpyWZDUAQ7axxp1+7BwXiIHMiyV/URDGODXbgC
	YopKxt2lnCASWFo3uAQN0bAllHo7N1ZdWaB+xZZswK5kpTtpPcId3bWYvqYk95ILqv/mBX
	YxvQVQczSf7I6VeKWacsG0us+Mx5H+c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix s_cpu_if->vgic_lr[] indexing in
 vgic_v3_put_nested()
Message-ID: <aE-xyGGpHXdJ_pcF@linux.dev>
References: <20250614145721.2504524-1-r09922117@csie.ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614145721.2504524-1-r09922117@csie.ntu.edu.tw>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_225534_113463_F713779E 
X-CRM114-Status: UNSURE (   8.66  )
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

On Sat, Jun 14, 2025 at 10:57:21PM +0800, Wei-Lin Chang wrote:
> s_cpu_if->vgic_lr[] is filled continuously from index 0 to
> s_cpu_if->used_lrs - 1, but vgic_v3_put_nested() is indexing it using
> the positions of the set bits in shadow_if->lr_map. So correct it.

The changelog is a bit too mechanical and doesn't actually add anything
to the diff. Maybe:

  Shadow LRs may exist at different indices from the corresponding LRs
  in the guest hypervisor's vgic, as the shadow LRs are populated
  contiguously in vgic_v3_create_shadow_lr().

  Use the correct shadow LR index when forwarding vIRQ state back to the
  guest hypervisor's vgic in vgic_v3_put_nested().

Diff itself LGTM.

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

