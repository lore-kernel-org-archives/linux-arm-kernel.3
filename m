Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2614CC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EwMBaZiRikE4UhesM/k13Od68Mvz1kBp58RalHCuuA=; b=2Dm1WykZuYHyshH3GRpP1y1u7b
	3PQgTeJzPuwbKTAdv+cF4FC17OnewkXwpJRlVbrR4LsNoZusMLxFqkamST0QsusMK9uaaTTZpmF8i
	MUZ4CI24R6Wzublh6qT6C7Yi6IRTR2ay/NCkgKaFwdMkWXSfAK5BW1AVa2ZvG607oMkpAl4ycl6RR
	Ud/Hwseeb7xI/PAxP0LgiBT2uJbVd6z9bpJu1AYiqYjku0lrOzvl7SBnzNvkjhjCiZGq2k1D4o++u
	S4Uz1ORRtPlAulrm4w1CUXc1lNrCtVsWcpN4WNgIbLZhGWj29EO2Vlqn1ZFmNllkWKpWdlp05PeC2
	GVbJ8MwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkr-00000008afA-08tA;
	Thu, 27 Feb 2025 19:41:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhXY-00000008CAx-3yEH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:19:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 821711477;
	Thu, 27 Feb 2025 09:19:31 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 889613F5A1;
	Thu, 27 Feb 2025 09:19:13 -0800 (PST)
Date: Thu, 27 Feb 2025 17:19:10 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v7 06/10] perf: arm_pmuv3: Add support for ARM Rainier PMU
Message-ID: <Z8Cejs-jkYwHr_90@bogus>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <20250221180349.1413089-7-vincenzo.frascino@arm.com>
 <Z8A6FttvudR6rjzk@bogus>
 <20250227171456.GA25617@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227171456.GA25617@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_091917_027073_205D4ED8 
X-CRM114-Status: GOOD (  16.94  )
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

On Thu, Feb 27, 2025 at 05:14:57PM +0000, Will Deacon wrote:
> On Thu, Feb 27, 2025 at 10:10:30AM +0000, Sudeep Holla wrote:
> > 
> > On Fri, Feb 21, 2025 at 06:03:45PM +0000, Vincenzo Frascino wrote:
> > > Add support for the ARM Rainier CPU core PMU.
> > >
> > 
> > I can't take this through Arm SoC as the DTS and dt-bindings changes
> > are kept separate from the driver changes in their pull request to Linus.
> > 
> > I need to keep the bindings(05/10) and the DTS(07/10) together to avoid
> > DTC warnings.
> > 
> > So the 2 options I see are:
> > Defer this driver change until the bindings last upstream.
> > OR
> > Just take the perf driver change without the binding via perf tree
> > 
> > For now, I will take all other patches except this.
> 
> Works for me. I'll pick up the driver patch.
> 

Thanks Will.

-- 
Regards,
Sudeep

