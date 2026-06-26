Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD30C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juJVPnk1nM/NXnz2d98pIoSDNwa75f898mQYNM3826k=; b=DoiEYVFJbK85TRsHip6Z5iw8gH
	urubO+9UiMdnhg0zpbbazAP/DNEVJvTpNrhjem48Mbx1eHz+2x4+fBun7bq3L5HsYyMdRBgapsmX/
	BUzEMp48EN+gmQ+VzRSObsmZRTtf5j/SNCtmxSmZjoDgfLfPNYz3L/FnWIvgHzswVNC2aKcNi9S2k
	AHLHS1A5SBJCbiU0io7RgBmRW+QjgqPtPSNDCFjnG6BY0+Kz7Brf+3udfhP4i2+1LU75MW48ncTo1
	VlGCncc2gBsaXelM84iqqWEB/z/c67FWuL5kJDjL1FGYuM2YyZRyG6ru0YiNts633ECXmxrUSYCfz
	elRRzaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdA1S-0000000BgFF-1tnq;
	Fri, 26 Jun 2026 17:07:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdA1N-0000000BgDz-1bir;
	Fri, 26 Jun 2026 17:07:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 036DB1F60;
	Fri, 26 Jun 2026 10:07:12 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 793AD3F632;
	Fri, 26 Jun 2026 10:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782493636; bh=ylfDgokWIdBatf69Bqo3iSYQXfGqiAjcEuPHy5u2PLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JP49E4PS3c5WyTeeBtQ7DS3TS1dFSwX05hGVEdAiV/ydyNWiIoWTMyKGrntMHB5dI
	 s0qam6HkCI7dSTGsU7vZFmYIBYwP04z5RiCm9QrZa0B1OI1eSswlpKSdhpyCb5TxIZ
	 T0hMZ+udy2aE80t9jhGwoDxt47L+MGlZ1QCEtw6w=
Date: Fri, 26 Jun 2026 18:07:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Puranjay Mohan <puranjay@kernel.org>,
	Usama Arif <usama.arif@linux.dev>, Breno Leitao <leitao@debian.org>,
	Julien Thierry <julien.thierry.kdev@gmail.com>,
	Lecopzer Chen <lecopzer@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com,
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH v4 0/4] arm64: cross-CPU NMI via SDEI
Message-ID: <aj6xvvY4AA-fQG2X@arm.com>
References: <cover.1781709543.git.kas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1781709543.git.kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_100717_457398_5EC536F5 
X-CRM114-Status: GOOD (  13.72  )
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

On Wed, Jun 17, 2026 at 08:20:01PM +0100, Kiryl Shutsemau wrote:
>   - A CPU stopped by the SDEI rung is parked, not powered off via PSCI
>     CPU_OFF. Reaching and dumping the wedged CPU -- the point of the
>     series -- works, and it matches the shared stop path's own park
>     fallback when CPU_OFF is unavailable. The consequence is that an SMP
>     crash-capture kernel cannot re-online such a CPU (it stays "already
>     on"); the capture kernel boots and runs on the remaining CPUs.
>     Powering the stopped CPU off so a capture kernel can reclaim it
>     requires completing the SDEI event and then CPU_OFF, which hit a
>     firmware-specific issue still under investigation; it is left as a
>     follow-up and does not affect the dump's contents.

Just to understand, your firmware cannot cope with a PSCI CPU_OFF from
the SDEI handler? This is one of the required calls to be supported.

-- 
Catalin

