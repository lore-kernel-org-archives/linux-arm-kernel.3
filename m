Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D74ACD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8s7T14guVVA1hYC7S3XxdGklNY+6gEtX0/TBeS8rl0=; b=CtV5ferltoL2cIDBEJ5Z5b4442
	Ms+Xcq4gptMX/ftoTfbDBoO0uCXEh6GAUBck9K/dHjmeM1mOTfD335wg+DI6yyiyGo/qthnr5elIo
	htMmUB9uWDb+6G09ZES5B6s1SMFpzjLITFtJCxhWY3MRyn9GNsPK9ToNP7HbC8PcizSDGLclVo9T0
	Q4k+aJmWqTPQZ4Y1ZAI7wyBH4KgdqfqkrmUzXLxozMIoLI+LSkYIKXeuQHe4nGO14/uA4ykGb6OLt
	7VdCeGPoNPidTrXCcCtPAvAfenXq/zEH35iqi/tbKjyBv3m3teUr32TfshstsVN7RVixQnV9aKtp/
	go2HBXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH6U-00000007X2B-1cvL;
	Wed, 10 Jun 2026 11:28:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXH6S-00000007X1j-1nWs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:28:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD046339;
	Wed, 10 Jun 2026 04:28:03 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99CC83FD88;
	Wed, 10 Jun 2026 04:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781090888; bh=yV2n5HYiQ06aTJOFX3gt+GSH9PHTvaCFQIZLG+04Zyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wt4DnpbGPuLCIezGfm1cPxXbkPy5cWIVdsEz+JqBySZEBJ8OhhtgSzJGEvJwG3wlY
	 hgSqb4Knew2ijMzZLd2nXGFZTRM6aZMSnm9pBARA8DQlIoox4Y8M1qDTiPQTBhtVDV
	 NJYWvvjOyagzdzrX+djSh+d1dPMKuvMAlR/M38ms=
Date: Wed, 10 Jun 2026 12:28:00 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>,
	Alok Mooley <amooley@nvidia.com>, Rich Wiley <rwiley@nvidia.com>
Subject: Re: [PATCH v1] arm64: errata: Mitigate TLBI errata on NVIDIA Olympus
 CPU
Message-ID: <ailKQJQuDSsHijYc@J2N7QTR9R3.cambridge.arm.com>
References: <20260609234044.3945938-1-sdonthineni@nvidia.com>
 <aik1owW9Rz8B7rEz@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aik1owW9Rz8B7rEz@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_042812_594061_942AA64D 
X-CRM114-Status: GOOD (  10.71  )
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

On Wed, Jun 10, 2026 at 11:00:03AM +0100, Mark Rutland wrote:
> On Tue, Jun 09, 2026 at 06:40:44PM -0500, Shanker Donthineni wrote:
> I have one minor comment below, but that's more for Catalin/Will, and
> doesn't require a respin.

[...]

> As this is getting increasingly long, maybe it's worth reducing this to
> "Various" in the title, i.e.
> 
> 	bool "Cortex-*/Neoverse: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"

Sorry, I messed that up when copy-editing. That should have been:

	bool "Various: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"

As above, that doesn't need a respin.

Mark.

