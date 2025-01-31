Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AC8C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfhrbFnrL3d3Cf7tDim2jlKBHjPB4qclCdoZjmmVcCA=; b=NZJhAAeO4hScQ7noCgqn4Jwji8
	FodW2c3SedHEvlA0Wp3L8Ae6anGAOM6f0GW3nozbc88zTSZNAz0WbdNWaOeMwnRGIdUwuierQtZtH
	HKEBetFbczqIvVAqzqhJXrZyfX+FdiQvWYSBgEZy5bebSO4VCmePZNaH11CNgPmx3qc6UtlmVAfE7
	cQ2sFOogWHSeX1SH+UHNCIvF7bPp5QSqk7JdcFRjaVr/XVFwIMqTeH8mW5EwrCwAZmLtsS1tdbW5Q
	7d/YRx4fiMg0AiCP1pNflIfl/fFZ0J42VWTuJ2VlbeCg6h8VEKJ4ZSs36+eMRiFmWDwWMULLDPCv/
	C5bI0bJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdu5x-0000000B1O6-1KBV;
	Fri, 31 Jan 2025 16:42:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtye-0000000Azml-47j9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:34:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98281497;
	Fri, 31 Jan 2025 08:35:09 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6FC53F694;
	Fri, 31 Jan 2025 08:34:42 -0800 (PST)
Date: Fri, 31 Jan 2025 16:34:39 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<ionela.voinescu@arm.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <sumitg@nvidia.com>,
	<ptsm@linux.microsoft.com>
Subject: Re: [PATCH] arm64: amu: Delay allocating cpumask for AMU FIE support
Message-ID: <Z5z7nws-_7VEe_d-@bogus>
References: <20250131155842.3839098-1-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131155842.3839098-1-beata.michalska@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_083445_060679_22C79612 
X-CRM114-Status: UNSURE (   9.17  )
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

On Fri, Jan 31, 2025 at 03:58:42PM +0000, Beata Michalska wrote:
> For the time being, the amu_fie_cpus cpumask is being exclusively used
> by the AMU-related internals of FIE support and is guaranteed to be
> valid on every access currently made. Still the mask is not being
> invalidated on one of the error handling code paths, which leaves
> a soft spot with theoretical risk of UAF for CPUMASK_OFFSTACK cases.
> To make things sound, delay allocating said cpumask
> (for CPUMASK_OFFSTACK) avoiding otherwise nasty sanitising case failing
> to register the cpufreq policy notifications.
>

I thought I had provided my tag, sorry for that. FWIW,

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

