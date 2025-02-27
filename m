Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8EBC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9gKbMls8JcPodgTXFcP0NunrUCm3EdPae1E65HDWVI=; b=YvsdvJ4zIEykSMqYpNSWrqb8zd
	VVc5Jp+JMnB4FckIK69lqGacPN4YJMm/rLTZ7ikaMha2TUhTipLAAMYXj9OqqWwo7HgZGA45uIZRt
	Z1YGdrVI08Fgw0Yn8Qw/gn2MPnpXP+ernZw85/+7TXbrAXN4SY3zQmWySYRUtoDB7k9hcSgc2YAuf
	gNr2/EbihWUkdQS9JzNioqgSUqShw0yftXceyoL1eTW2057fwF/GZyvcscwtykmz1LaYO3iXx3rpp
	syGOwx1ZVklOthiUEFWEaW3wZf1hyiAGzjT6J+YgUHkH/sTYXdU0In4Ywq96LpPKZOqcCp5pp61li
	zMeLc0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnasH-00000006xOe-03ki;
	Thu, 27 Feb 2025 10:12:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaqi-00000006xB1-1GGA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:10:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED78E2BCC;
	Thu, 27 Feb 2025 02:10:50 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07D6A3F673;
	Thu, 27 Feb 2025 02:10:32 -0800 (PST)
Date: Thu, 27 Feb 2025 10:10:30 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Will Deacon <will@kernel.org>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
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
Message-ID: <Z8A6FttvudR6rjzk@bogus>
References: <20250221180349.1413089-1-vincenzo.frascino@arm.com>
 <20250221180349.1413089-7-vincenzo.frascino@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221180349.1413089-7-vincenzo.frascino@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_021036_380718_0C47CA42 
X-CRM114-Status: GOOD (  10.32  )
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


On Fri, Feb 21, 2025 at 06:03:45PM +0000, Vincenzo Frascino wrote:
> Add support for the ARM Rainier CPU core PMU.
>

I can't take this through Arm SoC as the DTS and dt-bindings changes
are kept separate from the driver changes in their pull request to Linus.

I need to keep the bindings(05/10) and the DTS(07/10) together to avoid
DTC warnings.

So the 2 options I see are:
Defer this driver change until the bindings last upstream.
OR
Just take the perf driver change without the binding via perf tree

For now, I will take all other patches except this.

--
Regards,
Sudeep

