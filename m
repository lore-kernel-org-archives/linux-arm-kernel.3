Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98499D3B9B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gkp2Sapys0kYO8jsfPFmjfn0MzZ+IuSBffwFi5s29j4=; b=3ejFqaEDWmNLy5P3wylJ8GWcWc
	ygWgAWs0usODiMzQ9vwJ7bhol3vXUOWSEbII8nMl4bEzlx/CZXdjZkdQqcmxx1GBQiY8uwM42P2Zh
	1BrTYH/b8Wr7N60MVIpudbxfKfVFYH1XLGjhVAw5J5/Y7wrS0ewSUGpnpRvQ+2oCdD+MrkZBvT1F0
	vqcWa4TiTzzhBRDvVfEXR5zz82rPIg/zfTxC7gJstxbAIfI0p3HK/CG45suXpBsywfTQmSuPibuUE
	sbfxPpjc6SK7zIxAjhWx7YSqS92JDjQpXHUoz6g2yd/Eh+MZdz/3XraZleGoskUuXfnbq15XnSfOa
	BIYn4Syg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFy1Y-0000000B5fl-0IO0;
	Tue, 26 Nov 2024 16:02:48 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxyh-0000000B5Cr-3tpf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 15:59:53 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732636788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gkp2Sapys0kYO8jsfPFmjfn0MzZ+IuSBffwFi5s29j4=;
	b=lNz1k5GDxV0nlmh//gs1hBl4HHm7gCFmQducd817A/IXnbmXFuJkb+QtyHC/xBIJgfEM5O
	hvsfDcrU8QX7GgJ3Fs+u1bAzfSza5o/qal+47zDq9q8472Tk6N9/s0rCahMMaZLVN7y87v
	/mPYj1XotZzJ0WtrwPapnkedNlewzp0=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH] KVM: arm64: Fix S1/S2 combination when FWB==1 and S2 has Device memory type
Date: Tue, 26 Nov 2024 07:59:26 -0800
Message-Id: <173263668483.68510.4488046767973544400.b4-ty@linux.dev>
In-Reply-To: <20241125094756.609590-1-maz@kernel.org>
References: <20241125094756.609590-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_075952_630871_8B392528 
X-CRM114-Status: UNSURE (   7.07  )
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

On Mon, 25 Nov 2024 09:47:56 +0000, Marc Zyngier wrote:
> The G.a revision of the ARM ARM had it pretty clear that HCR_EL2.FWB
> had no influence on "The way that stage 1 memory types and attributes
> are combined with stage 2 Device type and attributes." (D5.5.5).
> 
> However, this wording was lost in further revisions of the architecture.
> 
> Restore the intended behaviour, which is to take the strongest memory
> type of S1 and S2 in this case, as if FWB was 0. The specification is
> being fixed accordingly.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix S1/S2 combination when FWB==1 and S2 has Device memory type
      https://git.kernel.org/kvmarm/kvmarm/c/6fc3a49f2385

--
Best,
Oliver

