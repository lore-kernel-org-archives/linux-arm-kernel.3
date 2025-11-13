Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B41ACD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=wctOvvMwP9m+w4++iaGEvkJxbBsoHvr0uZelDqoyFjg=; b=pnwNlASycBfhow
	0tqS0EMMfzj1t1xxFTQ9SN7I+MDlrymKT35eZ7Hl2Tz5LTRjtWsayb41uCCDlkzfjawbJyrR58Ze5
	3enQPYEN4J2zioCAcxv762aITNewqQq/6AmZvG0SUm4EUUuFMktGm5BOsxHh4wzwtMjTHtI22SDMe
	HQIf7e1Ak3de+pwCtR+ki2k7PEtw2HqNH9jsU/L9vPmmb+Icz3ZxAA6gGFJ4l4u4tmf/vWRnh2cuW
	WT5gzxNv3iAKu/UlOoYgsjmTUR2HkQZz9U9+8TOgzcd6gsGnM5sA4J4u98/GdA4Jw529tsGU0EdLy
	LEmZj0UaxRVSOvsMtn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJc1h-0000000Avls-0aNB;
	Thu, 13 Nov 2025 18:26:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJc1e-0000000AvlR-2qy9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE69942A0F;
	Thu, 13 Nov 2025 18:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED10C4CEF5;
	Thu, 13 Nov 2025 18:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763058389;
	bh=21AbBLpgy/u/7BPPSmQEYkJm+sdPArtMZJpHj/edoWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=V2K0SRC8XD9sL4OBxvrcney4oUNpmOtrJfv1Zjw27y5hpZJnncKBqD9xnG4C9lUXQ
	 15Va4I+QGi9DLfKnPG2jvILewC8w+6frXb8DfcLNQg98w4PNr/f9ljm38W++fP7C87
	 RjDOvxOslx2LJZaqBvEAombr+rgMWKMjaSV3CAIPrAiHVDgIrMJY6DURcfgYHFtHwv
	 sEQX227AiXJrZHg7et0R9L7ez0k60a4lMj4UfQg/UB7OtnPdntSzf/jAKH5wlTwltN
	 m2KSUMf32DXlUNR34/5h02xuGDKy4hh9gHx8VAwTmXBHNjleLPHDFfxbG3VbOfW6lJ
	 SurtAcj61VF0w==
Date: Thu, 13 Nov 2025 12:26:28 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v3 0/2] PCI: j721e: A couple of cleanups
Message-ID: <20251113182628.GA2295700@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176190080005.8740.2017130135799803682.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_102630_738749_34943C14 
X-CRM114-Status: GOOD (  12.78  )
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

On Fri, Oct 31, 2025 at 02:23:20PM +0530, Manivannan Sadhasivam wrote:
> 
> On Tue, 28 Oct 2025 21:12:22 +0530, Anand Moon wrote:
> > Refactor the J721e probe function to use devres helpers for resource
> > management. This replaces manual clock handling with
> > devm_clk_get_optional_enabled() and assigns the reset GPIO directly
> > to the struct members, eliminating unnecessary local variables.
> > 
> > These patches have been compile-tested only, as I do not have access
> > to the hardware for runtime verification.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
>       commit: 59ba8c0981e73cb2bb70074be4ef46b4188424ea
> [2/2] PCI: j721e: Use inline reset GPIO assignment and drop local variable
>       commit: 8895c0fc0671f38746ee1c02b728b126f7dbbf97

Moved to pci/controller/j721e so they're separate from the keystone
changes.

