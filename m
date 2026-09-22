Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91A3C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHdoMtqTcyEFnKcEGKtf+gXpBwhRndA3VPqIQwhO6u0=; b=bCmChAdH7Wf04Q0MB5i4cCGWi9
	RK9va56To0WOWoefbBvlhnxM6RXFTVgiq5XXn15et+3SdpTiO6q37hCrVXeNgd7Gp3MVy4cDMyag8
	5BHQObrJhfL6oC4UOnVNnpO/DkdEX9s1JYsRtCPVR0HmZHyp5iHhEf9+ODyztWMFV9bhlTZ0rbR2l
	VQy5KEVKbffFeESz7TuoQU6s5YlPSNFyyWwWas3Dql/ePbNPAxcBgovWkJOQAZgXJRxLr8KfR8AGc
	QGdGfZN67uBEeMy3GslHe0Ng33yzpJzU6lkQiTul7qERYIs49BRGPOvIOxIUd5JAxOAa1NzMDCg0L
	oQQkMc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9910-00000006gFC-3XWa;
	Tue, 22 Sep 2026 22:31:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x990z-00000006gEj-1skl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:31:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B9CF600D4;
	Tue, 22 Sep 2026 22:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A971F000FF;
	Tue, 22 Sep 2026 22:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790116264;
	bh=SHdoMtqTcyEFnKcEGKtf+gXpBwhRndA3VPqIQwhO6u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m2fT1CnbsmgDLs/vXAhUi2PVTPtWv77mptNg9sblMISCnW0xAzYZ1R25XouRGAjOV
	 Put7EPbRYBxpDjBnKTIdgahacBMn3ufCNKC4v0uYRLWYYL+/Rj/LJqne0KQXBtupdL
	 xOyDeiHhETN5ztTnyxtpKlXIyw3A8hweXtqpqcNyN8LfT1dYlVx+Fi9fjcdSK1L5lg
	 QUcDUChYP9Y/tDVyfA94SI7pt5OhjtBCipFTO9mpdRS1I/wrs6r8UbvvQcYpi6RPxG
	 brUkfPgIQmLxF5T7asvuadoVHci1b724RNcLuBskqrKciETeVAjqLGEcUXPV3wLEJ8
	 KmRDsqcxqpbyg==
Date: Tue, 22 Sep 2026 15:31:02 -0700
From: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Rob Herring <robh@kernel.org>, James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/boot: Disable trapping of PMZR_EL0 writes to EL2
Message-ID: <arMBpmlUi1Hm9hIB@kernel.org>
References: <20260922181430.3532371-1-fuad.tabba@linux.dev>
 <arLbbtuRuOrxlh1Y@kernel.org>
 <CA+EHjTx8JsXfrjKUbhhrfSmFPrWxyYaTbKqMeYAJPt-vqGfLvA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx8JsXfrjKUbhhrfSmFPrWxyYaTbKqMeYAJPt-vqGfLvA@mail.gmail.com>
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

On Tue, Sep 22, 2026 at 10:09:37PM +0100, Fuad Tabba wrote:
> Hi Oliver,
> 
> On Tue, 22 Sep 2026 20:47:58 +0100, Oliver Upton <oupton@kernel.org> wrote:
> [...]
> > We can trim 3 instructions from this by using the read-trap bits as the
> > starting point for the write-trap bits, like below. It also makes clear
> > the point that most of our trap bits are symmetrical for read and write.
> 
> I did consider that, and went the other way for two reasons.
> 
> The read side has three bits with no write-side counterpart
> (nPMSSDATA, nSPMDEVAFF_EL1, nSPMID), so copying x0 into x2 writes ones
> into three RES0 bits of HDFGWTR2_EL2. Harmless today, but it's this
> bug in reverse: the first revision that defines one of those positions
> in the write register turns the copy into a silent behaviour change.
> Building each mask from its own register's names can't do that.

My thinking was that we could have a third block, but...

> It also matches __init_el2_fgt, which already keeps x0 and x2 apart
> for HDFGRTR_EL2 and HDFGWTR_EL2. And even in that form the copy would
> have to sit just before the msr_s, after the SPE block, or
> nPMSDSFR_EL1 only lands in x0.

new feature-specific initialization blocks will make this an absolute
mess. So I agree, this is the right fix.

Reviewed-by: Oliver Upton <oupton@kernel.org>

Best,
Oliver

