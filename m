Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663C6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 12:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1gp+v/xUd838KTXnOpW+gE7GMlB17UGSSaBKAG+Jgc=; b=KpYBjHTur8zmPmAiNno90yE1Fv
	HYK2uLP2G61HgfJE6wBHE+cxgu0T3erGwvyqX621QJrzaCKSYpEcr9WW0s8Meq36PiXaRTkc+Z/iq
	IKp1pIy8i01MwLXKskrkGcooTN7W+4+Yp+/j2IDpRjF5Ut6Un55Pb6y8J1bf74yu9on6iZlNjivVg
	lShrMhQ6EZquFunmWjIDmhdSUJw5ACRutVg1w5sJZtCzL38XJxW57mU0uDkTjuml/v8622mcepksP
	2w/d5bHs7YiRkIXy1wmCooDETEhQANHDMW82IhuKWbaqf8rZSvBLmJXclOq5M7W/yYN8Q1IN1ZBkx
	4uqVS8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYLX-0000000B0kV-3B0H;
	Thu, 13 Feb 2025 12:29:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYJT-0000000B0DB-2g2C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 12:27:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A29571756;
	Thu, 13 Feb 2025 04:27:45 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C05E3F6A8;
	Thu, 13 Feb 2025 04:27:24 -0800 (PST)
Date: Thu, 13 Feb 2025 12:27:19 +0000
From: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v19 09/11] arm64: Handle BRBE booting requirements
Message-ID: <20250213122719.GE235556@e132581.arm.com>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-9-1c1300802385@kernel.org>
 <20250212121046.GB235556@e132581.arm.com>
 <CAL_JsqK7eBmRKL0AC99hj5AipL4jki5rrhSvbZCbUxa0vnEKMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqK7eBmRKL0AC99hj5AipL4jki5rrhSvbZCbUxa0vnEKMg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_042727_718015_B258EE21 
X-CRM114-Status: GOOD (  13.27  )
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

On Wed, Feb 12, 2025 at 03:21:46PM -0600, Rob Herring wrote:

[...]

> > > +  - If the kernel is entered at EL1 and EL2 is present:
> > > +
> > > +    - BRBCR_EL2.CC (bit 3) must be initialised to 0b1.
> > > +    - BRBCR_EL2.MPRED (bit 4) must be initialised to 0b1.
> >
> > Should clarify BRBCR_EL2.TS to be initialised to 0b00 ?  Arm ARM
> > claims the reset behaviour of the TS field is unknown value.  The
> > assembly code below actually has initializes the TS field as zero.
> 
> Humm, we don't currently care what it is initialized to because the
> timestamp is never used. We would care in the future if we use
> timestamps. Will 0b00 be the only correct value? I'm not sure.

In initializaton phase, if set BRBCR_EL2.TS = 0b00, then the timestamp
will be decided by BRBCR_EL1.TS.  I expect the BRBE driver will always
write BRBCR_EL1.TS.

Thanks,
Leo

