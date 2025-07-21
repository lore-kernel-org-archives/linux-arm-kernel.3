Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3373BC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 22:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h0Y/vUQmTbtoADLUGCwDI72dzoGASBmyiGNAfF51R4=; b=h4eKGot7RM9LeXQ2fkyFomw6Ir
	ORutCdfXdKWQ2OpaDey4VuIjW/nAdK048+C7PIkGNnc91V8WjZ6QK6EW0TRH3qptYCZpXbLzJqL4E
	9d+/V/u4Bk36OkxhdMmkQasfvjEb9PAHt3up0tYtmxbRH46LOwGaIO564gRpoCMkmRNaK3UtdSgGF
	3dEehMlSRZsQtaXYUZ3fJC4CbCF8QkQ9cvot9fSmLdSpHcUg0+icj4d1Ygd0QBygW0nTdlCUDtvDj
	b5LAl8hy9PyeJCqIMb5OVNNPEnEj+Fc4cE5CUzu2vc4/ZwE2OB7IQ0vzmFpRr4fU/QOzonxun2j6g
	FHTB3M5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udz1H-00000000obE-30Bd;
	Mon, 21 Jul 2025 22:30:03 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udywO-00000000oHW-2xeR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 22:25:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753136696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6h0Y/vUQmTbtoADLUGCwDI72dzoGASBmyiGNAfF51R4=;
	b=MfLqUbtlhwAYv0liHJSXD0gXHU4lVULzmtS+CvpD5osa3CNSR9orcz561bZvDpoqfIqZ9i
	9/CuHFWEv+dtKm3rf5T6c5p5Z1tBsW9ykVmDSo68SxwZOlZp1gVJRMW/Jd7t7C8D2TLJET
	GI/QPwJ/m58FwDO00A1JdRoLH/OhtiM=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: (subset) [PATCH 0/7] KVM: arm64: FEAT_RASv1p1 support and RAS selection
Date: Mon, 21 Jul 2025 15:24:44 -0700
Message-Id: <175313657130.2592298.13962133220387248424.b4-ty@linux.dev>
In-Reply-To: <20250721101955.535159-1-maz@kernel.org>
References: <20250721101955.535159-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_152501_517055_FEE6B132 
X-CRM114-Status: UNSURE (   7.75  )
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

On Mon, 21 Jul 2025 11:19:48 +0100, Marc Zyngier wrote:
> As I was debugging some RAS-related issues[1], I realised that:
> 
> - My test box is implementing RASv1p1
> 
> - We unconditionally advertise it to guests
> 
> - Issuing RASv1p1 accesses doesn't end very well
> 
> [...]

I haven't reviewed this series in full yet but wanted to pick up the
HCR fix that we need urgently and the obvious FEAT_RAS change.

Applied to next, thanks!

[2/7] KVM: arm64: Filter out HCR_EL2 bits when running in hypervisor context
      https://git.kernel.org/kvmarm/kvmarm/c/303084ad1276
[3/7] KVM: arm64: Make RAS registers UNDEF when RAS isn't advertised
      https://git.kernel.org/kvmarm/kvmarm/c/d9c5c2320156

--
Best,
Oliver

