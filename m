Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299E3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 17:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgKePZmFYwjhJtEiWP7XPzaLUB6D8I/GV5Iwv1U/Nh8=; b=J2QjEgTSxDWfRXNpJgLBwRK6O5
	d6axfnPVaUyLUOqjXDpRGG1+PsxKjjOl7E/yRzaUS9wfPGBJbLWE/9IiYd+COd3UvpbKbeAjSfu6m
	xni+SRCTaBpB5W3IR6WCXycFroJnZFOLpJYSN+H4IiIuL+mV92WEc1Oub1HNqFrzMAcjCRtpo0cuG
	I2InIoblkQimCLb0MPxQ7N2lrCyOt9gbigfTBYg+wTnfYI931ZFd2dIkwf+XLtY/YqQwGMqVSCq41
	vMERH1po+XxF0QXIR8wRcyoFKkZmpILtMuUwxx8HkVHRlrWGTyssFOhsRuo8uUTOtBfAdrQsK/TZQ
	dEeMWn4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdA2t-0000000BgMb-3Pki;
	Fri, 26 Jun 2026 17:08:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdA2q-0000000BgLs-3uM9;
	Fri, 26 Jun 2026 17:08:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 257AB1F60;
	Fri, 26 Jun 2026 10:08:42 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957343F632;
	Fri, 26 Jun 2026 10:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782493726; bh=rb1Nhqvs1XlSDSk5VERksIA63vzT0pBLcAGctl0TJvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRh2fSM1w0RA/f7DdFOM6oKxz6hXfVBie5ckL/3weQ87bIDN7SCNt2xMtuwm9FhYp
	 kyMLvwMZUagoubp85JXpDj2yZoTL7f7cvdigJoPrLCQJ2DFBRgtY40muEvErE3Pb5S
	 ICovpjmRGZsUs7qjCbZW+YhPjjeER+GYX8VXMaBM=
Date: Fri, 26 Jun 2026 18:08:41 +0100
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
Subject: Re: [PATCH v4 4/4] arm64: escalate smp_send_stop() to an SDEI NMI as
 a last resort
Message-ID: <aj6yGbnPDjUpboFZ@arm.com>
References: <cover.1781709543.git.kas@kernel.org>
 <cover.1781709543.git.kas@kernel.org>
 <97a870d0670b7e1c2fb9f5142f6e36c594282017.1781709543.git.kas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97a870d0670b7e1c2fb9f5142f6e36c594282017.1781709543.git.kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_100849_084306_43E410CE 
X-CRM114-Status: GOOD (  12.58  )
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

On Wed, Jun 17, 2026 at 08:20:05PM +0100, Kiryl Shutsemau wrote:
> +void sdei_nmi_stop_cpus(const cpumask_t *mask)
> +{
> +	unsigned int cpu;
> +
> +	WRITE_ONCE(sdei_nmi_stopping, true);
> +
> +	/*
> +	 * Publish the flag before signalling. The SMC is a context-sync
> +	 * event, not a barrier, so WRITE_ONCE() alone could let the store be
> +	 * observed after the event it triggers. The barrier is cumulative: a
> +	 * target that sees the event is guaranteed to see the flag.
> +	 */
> +	smp_wmb();
> +
> +	for_each_cpu(cpu, mask)
> +		sdei_nmi_fire(cpu);
> +}

The smp_wmb() is not sufficient here. In the GIC IPI code we use a
dsb(ishst). It should be similar here. I think TF-A does this already
but it's unclear from the SDEI spec that it is mandated.

-- 
Catalin

