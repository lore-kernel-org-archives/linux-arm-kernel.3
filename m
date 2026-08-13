Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D048EC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi8JANOgLxs5xInmNcIsw1Pu2PyS3DSLV+30DqMtpsM=; b=XmepeEluMVNCkU1V9y/DaYwlzE
	wfc0BnRDZvUOeDaa+e8tiPkQ6tlKw6Wrpq/QhgK3QZIZpkW2Vze8LJCxLe331+c7XLRtFttNQ59+O
	ucGotIiq6bgBJV/wy6blfCooIQR+mhkEHRv5nDLsrt2RzHteRPMJ4Qksm8XMjYzvIqahOHmY14EsZ
	+VgSE8w2+NfUsVX5Ai6rpPikQGQi4UkOTFOGP7GPdTmzzJb0MQZlFRGgr/g5KZHEWfA4M/G6kP5fZ
	J41Pi1UUFQWjjLuqsjr0vR6Cc7mty+WMO5JAtSnAQ+u2fHUQnIvLst6CpTotCWLtOt4S/r8fQTqE3
	uZH1psGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGO-0000000HWMJ-2n6Y;
	Thu, 13 Aug 2026 06:50:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPGA-0000000HWG6-2Mng
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:49:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F8F144020;
	Thu, 13 Aug 2026 06:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01C8B1F00ADF;
	Thu, 13 Aug 2026 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786603790;
	bh=bi8JANOgLxs5xInmNcIsw1Pu2PyS3DSLV+30DqMtpsM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=neGyp4u+YLVE4HABA9HaV4tNSyG2JxRxbut8qrRY20DW9eBQz5vxqsBOzWmyGfmMz
	 SD2A/qbTej9LcHnNZVax9hBxTCdKDKB/QzlLLZ6I2eSiI7Mv/K0ZvKPFTN+h0E7/CS
	 EOGv2YUomqXCHoI/kPew4ywApT2SkL+ti5P6QAN3kVsv3jxGumybD/lKjtR8csTbmH
	 a8xh/mdYhEvGI9+boYeMSNhYdVQ51iS2zQrdfy7LWz9YYMdpu0/7+gKf/oUIUEgZOU
	 fvVHDDlKqCbNF7VnCG/opckNDmPpxaCR8Z0Z5cL4xR845oJraPqc5AuJbk2CiFwUn2
	 jPi4n8saUsJBw==
From: Oliver Upton <oupton@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Correctly cap TLBI Range to the architural limit
Date: Wed, 12 Aug 2026 23:49:45 -0700
Message-ID: <178660378192.666424.18260188450907943902.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810170616.746100-1-maz@kernel.org>
References: <20260810170616.746100-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 10 Aug 2026 18:06:16 +0100, Marc Zyngier wrote:
> TLB Invalidation by Range has a fairly powerful way of encoding pretty
> large ranges in a small number of bits. This range can be based on an
> arbitrary VA, which means it is pretty easy for a guest to generate an
> overflow should the hypervisor be naive enough to add the range to the
> base...
> 
> Make sure the range is capped to the limit dictated by the address bit
> that determines the VA range. For an IPA invalidation, this is further
> corrected down the line to ignore the upper range.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Correctly cap TLBI Range to the architural limit
      https://git.kernel.org/kvmarm/kvmarm/c/69a598288195

--
Best,
Oliver

