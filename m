Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5D3E77169
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 00:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuKyh758gXL4H4w1qOWYdSoyL7IX7eUQIvDf/JiLSic=; b=I/Zbhvm5a55SWiuP/Y/dJ5JiJv
	5tTM9GqQE0apQkfiSw2NyopuqWWHc4YUfo3MSeyDfDJ88kVAeZX+b370SaYRyHEiBC6f3IgCBhgeq
	vvmETZeVDJMPEN7Uc+15SR+lelkttyoZvkj7uhzzCYS/a8ZBde+N90GMK+PuScCyPY1xKs+GZCk2+
	OjzqxAwbMZg0XD4StQhUnOFF4tJvPhoyaBlnkONCjSzNrIMVPjt6+iXMWREj+U1iyuUU7iKYQyL0d
	GtiyQeYdOcWIJlTVxGYMKkTix/5z8CzYwgbC7IvO6WSM9JjdIYTP1RgERI0YDS4CPcCQkh0nk5lzp
	n6Fa+2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIdS7-0000000B8OL-2quH;
	Wed, 04 Dec 2024 00:41:15 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIdQA-0000000B8Di-2iS9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 00:39:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733272752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BuKyh758gXL4H4w1qOWYdSoyL7IX7eUQIvDf/JiLSic=;
	b=GF99kdzHwPOPu8J2EKxn4AZYU4VtBVBTgBSgGQpLRe4dqm0Usij0/YgeP/TwfIEWMzsIdJ
	okjsGMZ6swvZymbOrNECi2alxbeBxt5roZGJetiMWmQQaCbPKbqMq59LkttJDiMm7DyKXg
	Xrn0znXvUv8G7xPO+7hnusDvfmje/Uk=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	stable@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH] KVM: arm64: Do not allow ID_AA64MMFR0_EL1.ASIDbits to be overridden
Date: Tue,  3 Dec 2024 16:38:55 -0800
Message-Id: <173327270646.1289915.18344519507054696527.b4-ty@linux.dev>
In-Reply-To: <20241203190236.505759-1-maz@kernel.org>
References: <20241203190236.505759-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_163914_821707_CA104A91 
X-CRM114-Status: UNSURE (   9.01  )
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

On Tue, 03 Dec 2024 19:02:36 +0000, Marc Zyngier wrote:
> Catalin reports that a hypervisor lying to a guest about the size
> of the ASID field may result in unexpected issues:
> 
> - if the underlying HW does only supports 8 bit ASIDs, the ASID
>   field in a TLBI VAE1* operation is only 8 bits, and the HW will
>   ignore the other 8 bits
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Do not allow ID_AA64MMFR0_EL1.ASIDbits to be overridden
      https://git.kernel.org/kvmarm/kvmarm/c/03c7527e97f7

--
Best,
Oliver

