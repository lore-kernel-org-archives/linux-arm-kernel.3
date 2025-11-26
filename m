Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C580DD1038C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kMxEju5M/nKc9DOThZPJgB81pFJ1BBy6AQBjiH7yQ8=; b=X5tNSP55bUyFzmQ7qjVxk/jog0
	Zh/fhMeVuwIfJjV8hAz7FaxQ0aASWxQPzczBZb13cV8G9uvdkmTHjTEFeKEX4GmgBKGFdCtO07U5e
	VTiCGYAc5nBy66y7YRltqicpCc8doaIICUWYmiKGRRJ6gQYgQKaqAm6GRn6WSPV1TAIcZwY3bhiWw
	qXo4HdJGn5viwD4jGsGFOjCZ+rmr11Z2wgV6/i73m7fG3ImcxUFwQeGBfhbckHtx8X85OTkGepc5Z
	fP/GYv8mpPGFQsRC3sZsLsbhwYxOrC5T7zPi6qn6UMo5COZtjO6QpN1VW0+I8B0sdkuOEYMzwq2lN
	49ugBbrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBG7-0000000EeLz-3AH1;
	Wed, 26 Nov 2025 08:52:19 +0000
Received: from sender3-of-o54.zoho.com ([136.143.184.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBG4-0000000EeL9-3vXx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:52:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764147129; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EozE+DQrrfnCJQj1hNrK39Qej1ArM2OEIOAdUb9dYdn4ekF/mV6GCULrPHmc+HXFeUDf91WkI1WLUk5M+antVsx8OhxVU97UOIWlE9JXQJvTPv+g7O4CTRFWcGE32iBNLOaLQ1SXZqXVFyhG+GOIYjD0XEhgpCJKy6UgxD+0gf8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764147129; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4kMxEju5M/nKc9DOThZPJgB81pFJ1BBy6AQBjiH7yQ8=; 
	b=XO/k7zRjvg5DJES+Z7O4fBVDcXkr495nzZ2gZiefk84q4eMNybbNzMS1+a5fk4/gVJVmbBLAChWpiq9pG+X3VuyikUTiwHT+JP4jsCcWjkXr/oqE5um5IzX3X6eko3IZj8wTSXFxZXBTMwVmyZ9eNMol2L9Un8zIxvZKuldfur0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=anirudhrb.com;
	spf=pass  smtp.mailfrom=anirudh@anirudhrb.com;
	dmarc=pass header.from=<anirudh@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764147128;
	s=zoho; d=anirudhrb.com; i=anirudh@anirudhrb.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=4kMxEju5M/nKc9DOThZPJgB81pFJ1BBy6AQBjiH7yQ8=;
	b=AzWGxEINhyaf9Qe+BWKH+NZJVrxv8NBMjcNINDPYzYvRpgYVKYnnKEYrqYkUdDtv
	z7qjNz41mKXNNgDt3cgB04f4MvxZhrGhjZZoDuxIvmjrITReaIHHMPsZkjYXkxd7ZAF
	15eQYl9dVfhiZaVJGab8YnaExsH59ZlBynzqldzQ=
Received: by mx.zohomail.com with SMTPS id 1764147125272486.14699736135515;
	Wed, 26 Nov 2025 00:52:05 -0800 (PST)
Date: Wed, 26 Nov 2025 08:51:59 +0000
From: Anirudh Rayabharam <anirudh@anirudhrb.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, Arnd Bergmann <arnd@arndb.de>,
	akpm@linux-foundation.org, agordeev@linux.ibm.com,
	guoweikang.kernel@gmail.com, osandov@fb.com, bsz@amazon.de,
	linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 2/3] irqchip/gic-v3: allocate one SGI for MSHV
Message-ID: <aSa_rxG80LDXDlhr@anirudh-surface.localdomain>
References: <20251125170124.2443340-1-anirudh@anirudhrb.com>
 <20251125170124.2443340-3-anirudh@anirudhrb.com>
 <86bjkqq9dp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjkqq9dp.wl-maz@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_005217_160034_BBB8F906 
X-CRM114-Status: GOOD (  24.53  )
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

On Tue, Nov 25, 2025 at 06:01:38PM +0000, Marc Zyngier wrote:
> On Tue, 25 Nov 2025 17:01:23 +0000,
> Anirudh Raybharam <anirudh@anirudhrb.com> wrote:
> > 
> > From: Anirudh Rayabharam <anirudh@anirudhrb.com>
> > 
> > From: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
> > 
> > Currently SGIs are allocated only for the smp subsystem. The MSHV
> > (Microsoft Hypervisor aka Hyper-V) code also needs an SGI that can be
> > programmed into the SYNIC to receive intercepts from the hypervisor. The
> > hypervisor would then assert this SGI whenever there is a guest
> > VMEXIT.
> > 
> > Allocate one SGI for MSHV use in addition to the SGIs allocated for
> > IPIs. When running under MSHV, the full SGI range can be used i.e. no
> > need to reserve SGIs 8-15 for the secure firmware.
> > 
> > Since this SGI is needed only when running as a parent partition (i.e.
> > we can create guest partitions), check for it before allocating an SGI.
> 
> Sorry, but that's not an acceptable situation.
> 
> SGIs are for Linux to use, nobody else, and that allocation must be

Why does this restriction exist? In the code SGIs 8-15 are left for
secure firmware. So, things other than Linux can use SGIs. Why not MSHV
then?

> the same irrespective of whether Linux runs virtualised or not. This
> also won't work with GICv5 (there are no SGIs at all), so this is
> doomed from the very start, and would immediately create technical
> debt.

Hyper-V always presents a GICv3 so we don't need to worry about GICv5.

> 
> If you want to signal an interrupt to Linux, expose a device with an
> interrupt in a firmware table (i.e. not an SGI), and use that in your
> driver.

You mean in the ACPI tables? That would require us to modify the
firmware to expose this virtual device right?

Anirudh.

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

