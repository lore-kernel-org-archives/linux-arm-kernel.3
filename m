Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD43F483D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SdmzKrbttKk8CS2PW7W7J7Z1zJmb7SdqxhA7wA2j7E=; b=Bv3NMqBNvGLZMtFHoy+Yq38pEh
	a673FfKJuzg89po/AMgqm1YlaGkpNRqm2SruziChqd6BOIvQ1Md/wsqDkfWRbSB5uFRu4NN9OwlFQ
	g2OU0o5IMewLhsHsWq6rJovoLmxoJbscHXzZ9uvxIhoZ71wkWX5m3peH/r5zlZJ4huOv3F1cbtheK
	/alsoNwiQUfSLO3HaVoLdI7p/KZ0APqPZ/WaqGamGV7qVwMs8iunmJ7GDH+tfPe6ua7xXvmPAOPXD
	s02udlJ2waTX6QKQDfWZRt6xlt/gUlNaNLqo/Aed1wHOlT39BqRqpKq8KA9OT1coeL/0xjZBgMDeC
	lr2fjLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jTH-0000000HH03-2618;
	Mon, 23 Mar 2026 17:53:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jTE-0000000HGzO-459I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:53:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CEC51476;
	Mon, 23 Mar 2026 10:53:37 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 569533F694;
	Mon, 23 Mar 2026 10:53:41 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:53:39 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>, Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 0/5] arm64: Work around C1-Pro erratum 4193714
 (CVE-2026-0995)
Message-ID: <acF-I7zTF-daRlZa@J2N7QTR9R3.cambridge.arm.com>
References: <20260323162408.4163113-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323162408.4163113-1-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_105345_068983_2262AE94 
X-CRM114-Status: UNSURE (   8.38  )
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

On Mon, Mar 23, 2026 at 04:24:00PM +0000, Catalin Marinas wrote:
> Here's version 3 of the workaround for C1-Pro erratum 4193714. Version 2 was
> posted here:
> 
> https://lore.kernel.org/r/20260318191918.2653160-1-catalin.marinas@arm.com
> 
> Catalin Marinas (4):
>   arm64: tlb: Introduce __tlbi_sync_s1ish_{kernel,batch}() for TLB
>     maintenance
>   arm64: tlb: Pass the corresponding mm to __tlbi_sync_s1ish()
>   arm64: cputype: Add C1-Pro definitions
>   arm64: errata: Work around early CME DVMSync acknowledgement
> 
> James Morse (1):
>   KVM: arm64: Add SMC hook for SME dvmsync erratum

These all looks good to me.

FWIW, for the series:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

