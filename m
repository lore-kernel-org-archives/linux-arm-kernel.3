Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 17:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJcyRBCuDpTSk1/d5SQB/+Lx7UTikZcZTrFMFGtoOvg=; b=WwZE46o4pu7x3/bFdOHh9YA3qN
	CHEjCNvLamARzfDRkT9fSFtMjJfM07zZDE72Pj0zf2C5y1r2g+8MwwfYOftgunLvu604MQzJg+o9t
	fG1Af27zc2F5qQ1SlGUQzC9VB//zxeOKnLOEs4KrIdu6bLTA+rXqPJ8x+W2dqsFXzIWOW7jfAGMeb
	2+JANKK/9TqmJyNUKlKppNdJWvbYey855Hue0GhJHbGWD3kQ1mdoMqrY9Yv5Kf2wStmdDo9KcdvHk
	HHOnxRO2dR9WY/vKjlc/ESj2uduVL8Dn0iR911vOZ07kVLil0Cb3+SJzM0ou/im/ilb/IuxzhFTnI
	Jw+BYK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFgW-0000000FIES-3khh;
	Mon, 29 Jun 2026 17:22:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFgV-0000000FIEM-0mjy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 17:22:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9774341876;
	Mon, 29 Jun 2026 17:22:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089DE1F000E9;
	Mon, 29 Jun 2026 17:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782753734;
	bh=MJcyRBCuDpTSk1/d5SQB/+Lx7UTikZcZTrFMFGtoOvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gbqz5hrO7fBgXQ2j8893haOH/rdMwMKj41c+b2V2Z0Uo3rrpysIT0kZCrTydl+GhZ
	 145+yOuR91ka9e4QPcbrDM+idcikLa659R1gY+j1y1uS1dDmSNW8dXSuWr1B6lJkLL
	 kAVrQppzIlhrGfDSiz2YNzptozjTEwWYYr7/tGdGPBs/fxoBW7Z+Ez2QfbLbdgFA9J
	 ZykRMu6xyVfadkTOBtnK2AY5uTFemwfRyG7jHE0ykI9P7deLIn4g7Y8h2uLHtledv/
	 lYvsaYxpKEGUe1vN5bOzExuP7k+IByZyCirBWzi7Zgz/NYHbLJhuUP/9cojUeTzoae
	 wQB/XIUGPvRiQ==
Date: Mon, 29 Jun 2026 10:22:12 -0700
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Chengwen Feng <fengchengwen@huawei.com>,
	Kees Cook <kees@kernel.org>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	James Morse <james.morse@arm.com>, Zeng Heng <zengheng4@huawei.com>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	James Clark <james.clark@linaro.org>, Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 05/13] KVM: arm64: Detect (via ACPI) and initialize
 HACDBSIRQ
Message-ID: <akKpxDulRN7zDrgM@kernel.org>
References: <20260629111820.1873540-1-leo.bras@arm.com>
 <20260629111820.1873540-6-leo.bras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629111820.1873540-6-leo.bras@arm.com>
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

On Mon, Jun 29, 2026 at 12:17:53PM +0100, Leonardo Bras wrote:
> Find via ACPI [1] the Id for HACDBSIRQ, initialize it as a per-cpu IRQ
> and make sure any cpu able to run virtualization has it active.
> 
> Introduce a per-cpu structure used by the HACDBSIRQ handler to keep track
> of entries size and the status of HACDBS. Size is used to detect end of
> processing in case the number of entries being processed is different of
> the supported entries size.
> 
> Status may look easily replaceable by checking HACDBS registers now, but
> will make the OFF/IDLE detection easier in next patches.
> 
> Signed-off-by: Leonardo Bras <leo.bras@arm.com>
> 
> [1] https://github.com/tianocore/edk2/issues/12409

Reference the ACPI specification instead please. Any link you want to
include in a changelog should use the Link: footer, the linkage to the
inline citation will be obvious.

If we need to initialize the IRQ I'd really like to see device tree
bindings for HACDBSIRQ as well. Pretty much any system us plebs can get
our hands on is gonna be DT anyway.

> +static irqreturn_t hacdbsirq_handler(int irq, void *pcpu)
> +{
> +	u64 cons = read_sysreg_s(SYS_HACDBSCONS_EL2);
> +	unsigned long err = FIELD_GET(HACDBSCONS_EL2_ERR_REASON, cons);
> +
> +	switch (err) {
> +	case HACDBSCONS_EL2_ERR_REASON_NOF:
> +		this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
> +		break;
> +	case HACDBSCONS_EL2_ERR_REASON_IPAHACF:
> +		/* When size not a power of two >= 4k, exit with reserved TTLW */
> +		int index = FIELD_GET(HACDBSCONS_EL2_INDEX, cons);
> +
> +		if (index >= this_cpu_read(hacdbs_pcp.size)) {
> +			this_cpu_write(hacdbs_pcp.status, HACDBS_IDLE);
> +			break;
> +		}
> +		fallthrough;
> +	case HACDBSCONS_EL2_ERR_REASON_STRUCTF:
> +	case HACDBSCONS_EL2_ERR_REASON_IPAF:
> +		this_cpu_write(hacdbs_pcp.status, HACDBS_ERROR);
> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +}

I have a pretty extreme distaste for creating a state machine between
the callsite and the IRQ handler. The callsite should poll HACDBS for
completion. The thread has nothing better to do anyway.

Thanks,
Oliver

