Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4482DC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 22:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aggod8/in0cKWs0kG+tFQuM++ochnefqccqd7dtFIgs=; b=HK31NTaVWXpM2/7N5an/ItcdwW
	QvA31Tz5oS7iAJlNypScup4u1z2oXpbAShWtXKygd0DaJhHhjurk+VfPGeSKNySuD3AoNWf9yecy/
	WXGvdtaHP9bG9suBO5ittn1uaWgBnVduF1yMQcmIY8Uhdrsm2L6Dqr1/NKphKXUN2RdPhKU7rTjDK
	sz9wB/8zl9TMaqhBhYwcuNWc+KH25hAD9V8CXKS609Rp7cCaFxfcv4uO5+x8Rsfi2W8LFHnR8l1eE
	3bGok8gMY1hg0h8HQCeV6b51VF7QTnMG0ZouhCNbfE5Z2OXFfzcg1F8/tt5UBbeW/jSs7Y909FPaH
	L5kRm0Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tctiW-00000005tH5-0YaN;
	Tue, 28 Jan 2025 22:05:56 +0000
Received: from out-184.mta1.migadu.com ([2001:41d0:203:375::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcsbZ-00000005orS-3Hr4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 20:54:43 +0000
Date: Tue, 28 Jan 2025 12:54:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738097679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Aggod8/in0cKWs0kG+tFQuM++ochnefqccqd7dtFIgs=;
	b=BbS7v2kSahLi5d25+Z69i5JoQCAP7OvkfyTzOF7QqSM3a1LJPWaUbGnd5BOgOQYTxYIe4p
	jdYl7295TiVmYC7jZLhheMifHAOv0ZuiW0nWl+VdqgYmTQwf6c5J0Cq8ckZSP/ZQr+CV4P
	+ECaLlYzWSVbms3v5jOiZQmrJhBaZ5c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Zaid Alali <zaidal@os.amperecomputing.com>, catalin.marinas@arm.com,
	will@kernel.org, puranjay@kernel.org, broonie@kernel.org,
	mbenes@suse.cz, mark.rutland@arm.com, ruanjinjie@huawei.com,
	robh@kernel.org, anshuman.khandual@arm.com, james.morse@arm.com,
	shiqiliu@hust.edu.cn, eahariha@linux.microsoft.com,
	scott@os.amperecomputing.com, joey.gouly@arm.com, ardb@kernel.org,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: errata: Add Ampere erratum AC04_CPU_50 workaround
 alternative
Message-ID: <Z5lD8HwyQF7IQrEv@linux.dev>
References: <20250127201829.209258-1-zaidal@os.amperecomputing.com>
 <87msfbtjyw.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msfbtjyw.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_125442_095275_F6F32EAE 
X-CRM114-Status: GOOD (  15.95  )
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

On Tue, Jan 28, 2025 at 08:34:47AM +0000, Marc Zyngier wrote:
> > +config AMPERE_ERRATUM_AC03_CPU_50
> > +	bool "AmpereOne: AC03_CPU_50: Certain checks for ICC_PMR_EL1 that expects the value 0xf0 may read 0xf8 instead"
> > +	default y
> > +	help
> > +	  This option adds an alternative code sequence to work around Ampere
> > +	  erratum AC03_CPU_50 on AmpereOne and Ampere1A.
> > +
> > +	  Due to AC03_CPU_50, when ICC_PMR_EL1 should have a value of 0xf0 a
> > +	  direct read of the register will return a value of 0xf8. An incorrect
> > +	  value from a direct read can only happen with the value 0xf0.
> > +
> > +	  The workaround for the erratum will do logical AND 0xf0 to the
> > +	  value read from ICC_PMR_EL1 register before returning the value.
> > +
> > +	  If unsure, say Y.
> > +
> 
> An alternative for this would simply to prevent the enabling of pNMI
> on this platform.

There's also AC03_CPU_36, where the CPU goes into the weeds if you take
an asynchronous exception while fiddling with HCR_EL2. We don't have a
mitigation for it, and it can be pretty easily reproduced by using pNMIs
while running VMs.

So I agree, disabling pNMIs might be the easier way out.

[*] https://amperecomputing.com/assets/AmpereOne_Developer_ER_v0_80_20240823_28945022f4.pdf

-- 
Thanks,
Oliver

