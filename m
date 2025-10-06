Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FE3CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 10:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJBmsaEWV/PQPqtLjn4QFVtp94L9sn70njKbWvJVnvs=; b=Ac0nPkaU8Dx2zkF26PwU2/L6MK
	JIoSfAy9N8IH8JFK2Fh0UvdGNj2tTTAa0seyCXXUsdzFCaEE0q4+U8fBogFdoiT3f7AfG39ynazp8
	Qug0SIV2LXHslX5w7VbLxNAIU7aavjRuZckdPZNbWoqGzt08M8rYAtUHphTcwXH12qpN3ZLNlY0AH
	CTg66aApK8BKdVOl68O370xa61oJSlSwc5biFPb2zQdP9Mfxxw3IAlNzUj1kdRKOoWm2hJzfE4fkm
	E01FZ/bqbju04ISIYJSY+Uy14TZhykIIYrIbRcUop2ZdTsAhJYbCkpW2DZ0WUv29z/4jf2wcpafNR
	sc0P+ziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5irS-0000000HRDT-3mYJ;
	Mon, 06 Oct 2025 10:54:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5irQ-0000000HRCh-0bIf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 10:54:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4198D1515;
	Mon,  6 Oct 2025 03:54:23 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16AF33F66E;
	Mon,  6 Oct 2025 03:54:28 -0700 (PDT)
Date: Mon, 6 Oct 2025 11:54:26 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: smp: Implement cpus_has_pending_ipi()
Message-ID: <20251006-manipulative-urban-antelope-31101f@sudeepholla>
References: <20251003150251.520624-1-ulf.hansson@linaro.org>
 <20251003150251.520624-3-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251003150251.520624-3-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_035432_225316_05145B97 
X-CRM114-Status: GOOD (  14.84  )
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

On Fri, Oct 03, 2025 at 05:02:44PM +0200, Ulf Hansson wrote:
> To add support for keeping track of whether there may be a pending IPI
> scheduled for a CPU or a group of CPUs, let's implement
> cpus_has_pending_ipi() for arm64.
> 
> Note, the implementation is intentionally lightweight and doesn't use any
> additional lock. This is good enough for cpuidle based decisions.
> 

I’m not completely against this change, but I’d like to discuss a few points
based on my understanding (which might also be incorrect):

1. For systems that don’t use PM domains for idle, wouldn’t this be
   unnecessary? It might be worth making this conditional if we decide to
   proceed.

2. I understand this is intended for the DragonBoard 410c, where the firmware
   can’t be updated. However, ideally, the PSCI firmware should handle checking
   for pending IPIs if that’s important for the platform. The firmware could
   perform this check at the CPU PPU/HW level and prevent entering the
   state if needed.

3. I’m not an expert, but on systems with a large number of CPUs, tracking
   this for idle (which may or may not be enabled) seems a bit excessive,
   especially under heavy load when the system isn’t really idling.

-- 
Regards,
Sudeep

