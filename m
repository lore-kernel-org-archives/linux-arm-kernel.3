Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B306C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uthDb2V9VnfDGIFco/8/5Vth9/1+6ayqM33H17ywDDw=; b=cE0jl1COh2ZqD5a11wgjxb/Iwm
	BtLmQscx3i+XhrDzdXBge9dxwUbHC73BnmVrSIB8kxH8n1NNiPVO0FLvNPjlAjNWYrI2+rog+HH/8
	FVRipKjw9b4ft4rqJ285NePVU66ixk6h4qBgXNFgnwCXQX1kC8Kej1l24UmUUK9GHRM7BcyfYU3zJ
	gBKw5IpJSVYDQdkbgJkkowL7XLlEa3sS3Y4F0Ga1G3tQXciMshno8Qq/B26QYElWHDQnu3MKypS11
	ja1xhlNQ56Un/cNGksxS1T+zVvEl/dDsqvZwLq8VboGtcG/dCoT4BVOvzfJR3e/JUGj+TrczTgNCR
	D1E+LPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukRIZ-00000003R65-01fn;
	Fri, 08 Aug 2025 17:54:35 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukRG1-00000003Qti-0BH2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 17:51:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754675513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uthDb2V9VnfDGIFco/8/5Vth9/1+6ayqM33H17ywDDw=;
	b=TjBv3uTPpnUUUk1BOXj2DLhhvAirakucf1WD1UeUTLhIZzcMCu5BrrLjQSiNCyZ48vzpYG
	AcTpsZu1YGa/k38Jxuet+m5Hqn/IhN5tAHbcarvWnCTsURVefdFTUfJ9EcW5oGyj5MVUTG
	hblrSi8R7bLZ0CuccLJ4J+pBnfFS2f8=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: nv: Properly check ESR_EL2.VNCR on taking a VNCR_EL2 related fault
Date: Fri,  8 Aug 2025 10:51:33 -0700
Message-Id: <175467548051.670500.10792473108238657623.b4-ty@linux.dev>
In-Reply-To: <20250730101828.1168707-1-maz@kernel.org>
References: <20250730101828.1168707-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_105157_710571_11CAB885 
X-CRM114-Status: UNSURE (   6.84  )
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

On Wed, 30 Jul 2025 11:18:28 +0100, Marc Zyngier wrote:
> Instead of checking for the ESR_EL2.VNCR bit being set (the only case
> we should be here), we are actually testing random bits in ESR_EL2.DFSC.
> 
> 13 obviously being a lucky number, it matches both permission and
> translation fault status codes, which explains why we never saw it
> failing. This was found by inspection, while reviewing a vaguely
> related patch.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: nv: Properly check ESR_EL2.VNCR on taking a VNCR_EL2 related fault
      https://git.kernel.org/kvmarm/kvmarm/c/07f557f60a9a

--
Best,
Oliver

