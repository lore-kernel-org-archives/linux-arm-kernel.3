Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5ECC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADEThMSry5ykbyZHq7Sgt5uZWEbC/3nt8AD4Dy+XktM=; b=BdIAKgRok6O0MPa4ndb1WM6PtS
	uKkLlnU970gaVb/rbOBb8DUqd76Zz32QTn2b68ubuUNy9M8FnAz2movGnDA4m3S6zVJ47YNz5Uw9M
	w+Ffj6nAoaqgpXrxnRCYMVJrQQ9ZOQyJz/jmUUDACNiIJ/Jz1vKyZdSFIfyrIh/HaxeFExLQadGf4
	XGeYY7xRArqRd7QEdl1CZs+AVmvHAU1WawYYAjVE2CRBsdCOWwT5it+iIQeVtaQNdGTbxtp3FsEaH
	vAXUXPz2OyeOeBpK3dn0XrGeMhtaiYTZteabwToA4yVOcMR6rsq7+IkOEbjqkYN0GRhvEd4Bau+YY
	K+P/u8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnao3-00000006wq6-3tA6;
	Thu, 27 Feb 2025 10:07:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnakC-00000006wLp-1Ao0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:03:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C4512BCC;
	Thu, 27 Feb 2025 02:04:07 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5927E3F673;
	Thu, 27 Feb 2025 02:03:49 -0800 (PST)
Date: Thu, 27 Feb 2025 10:03:46 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: Re: [PATCH v6 06/10] perf: arm_pmuv3: Add support for ARM Rainier PMU
Message-ID: <Z8A4gu-TV-XqbdOY@bogus>
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
 <20250220180427.3382482-7-vincenzo.frascino@arm.com>
 <Z77tD1VuD_W0CK5B@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z77tD1VuD_W0CK5B@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_020352_366135_1277C48C 
X-CRM114-Status: GOOD (  13.06  )
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

On Wed, Feb 26, 2025 at 10:29:35AM +0000, Sudeep Holla wrote:
> On Thu, Feb 20, 2025 at 06:04:24PM +0000, Vincenzo Frascino wrote:
> > Add support for the ARM Rainier CPU core PMU.
> >
>
> I can't take this through Arm SoC unless there is a strong dependency
> and/or urgency. I can take 05/10. The other option is you can take
> 05 and 06/10 via Will's perf changes as usual as I they seem quite
> independent to me.
>
> I can take the rest of the patches through Arm SoC tree for next merge
> window.
>

Sorry, even I manage to reply on v6 instead of v7. Please ignore the
previous email. I will reply on v7 with updated information.

--
Regards,
Sudeep

