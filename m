Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FECC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXM50UaQ+v2RW26b1dTg0Ev9rPimptaN1Wl73I6F/hA=; b=u71E7f0LfqywBOXEoaqasJX8kO
	4N+fgghgIKfVY2uMD5X3/yEMbFLfnPBASMu9UjPaVaWUvyB6EORt/6mESLumQGwS7C9kRo0rKEBMv
	WTZv3ma9t5ahOoTZciJnpWXs7S3zDz4Li+cYQ+JiUAHo+R1KKE5TMREZvWlGAgA5/WDuRdfsxTeo/
	ole0e1GUCzYRGkzYgNnlumsrfRCe2KTwIEzroxGYQud7uCROIkvNd8bMl1wkO9DQd4xbePGpYth2J
	qoolC2Y0IduIr5sHLJ2xATL81LwjkBk+LEY0a1WCk+fcnbeA10B/AXKPW6FygUGynLqBRaFibrHvV
	uMGeq8Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCFf-0000000FKKn-2yHJ;
	Fri, 27 Jun 2025 16:48:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBHI-0000000F9bV-3WG1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 293E56111F;
	Fri, 27 Jun 2025 15:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99534C4CEE3;
	Fri, 27 Jun 2025 15:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039170;
	bh=2cCP1Ap1iSIzpfN4H6SU8c9BHkTqxYdiFOIUYUfpaVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEl4ccI4dcxu9hgUCojelimrFGF70rROOs+53GqGKauH+7HgqZfFWCJwTHNj++Ook
	 uJZauRNe5pqeRZ54cK/VoWopC1shAfY4m33v1JDmsNzA9zv6u6QzZEUDVDLiFjYrUt
	 RJQsw9lE/EkcgpPVIpPgt40hMwvigO/ylRVg05twCS3/PisIogVP6A3XgNOlgKyCTX
	 68or0gJO5T9mseVYujOLelELM3pTZuYtGO5XUthtQlB6d1syISC9n2+iVGYcoOSsz/
	 h2d6pYb79wHgnBNNLdEjPwT3S6tY1atjfsm2LtsJ+ELOPodd4RX26rYVNnltsAQwWX
	 kxxWFOMnHD2mQ==
Date: Fri, 27 Jun 2025 16:46:06 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 06/13] arm64: entry: Add entry and exit functions for
 debug exceptions
Message-ID: <aF68vrSjOtt0Gomf@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-7-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-7-ada.coupriediaz@arm.com>
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

On Fri, Jun 20, 2025 at 10:12:00PM +0100, Ada Couprie Diaz wrote:
> Move the `debug_exception_enter()` and `debug_exception_exit()`
> functions from mm/fault.c, as they are needed to split
> the debug exceptions entry paths from the current unified one.
> 
> Make them externally visible in include/asm/exception.h until
> the caller in mm/fault.c is cleaned up.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/exception.h |  4 ++++
>  arch/arm64/kernel/entry-common.c   | 22 ++++++++++++++++++++++
>  arch/arm64/mm/fault.c              | 22 ----------------------
>  3 files changed, 26 insertions(+), 22 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

