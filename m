Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828F4CCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x+icJ7cwSsUB7j48d1oxhcPwOVHz3o06BSkzbQJERg=; b=s8Qk39i6IKpBxVis7186PQAg9L
	+giYugiGVOBEhnx+uzOhcku3/cs23PWHaoC2/I5aXQozly8L6YpZpsFkP0FmwmT3znmUlHtAaQe/+
	J5eJAFPfe7lGzXFBMs+Cf98jXC/nM4Ird7UTploduKJ8bl/bjzNGw+xm+6UvGJ/EHUiPOWSu9Q+OC
	+ll9IVhFkt/fIfuuOoFcSpNYej2lJf8G1/szUSHYU/9m4P5yAI/x6Gc53Vy0RMeMCT5GZJwQ5te9w
	Tq7B2/Ck7ykMx4i3Tcx3dx9k+MkXw+Qsi4qX5mfo8w/0rVSOJhLGrTB+9o33xJDe03nt9hwsrDAm5
	KW9IkZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEksy-00000005hnE-1h7g;
	Fri, 31 Oct 2025 08:53:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEksw-00000005hmO-2YpC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 08:53:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B55EB612B1;
	Fri, 31 Oct 2025 08:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8990CC4CEF8;
	Fri, 31 Oct 2025 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761900805;
	bh=5lLjxIzAgzkUJ1WMCPxKdYVneDvO0fPVfQqhFcLinzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dm9k6WmWGVgybTFkgYPZXca2qmWqQBfx6bMJfZZSJwdWhAmrzi27tOCq1MjexlaH1
	 BY2MuUywMoh7JIihXqwl0TWcNhz4vBzrjJc9kSe2i4/bGnqLGmzgGc/DXeDZLtUymu
	 mYOGjSFGNrIkNJul/v9MWJZ46OuSijrTc8t/UBeJDTdX2uDAgdCzE5WvSyL00URSxo
	 jybwpLLoZR0iOb9Vz4ZYojPCp/k3EZtDDNRdYeiOS2gL0cZnqsdrgGBnTdguJbQoJO
	 FmwxoWuIYWkNkojuXfRm2U4Q+aBGvaTNj9eK13yjd53I1Yj7pguKTgmERcw68ovHab
	 22P89gdI3UFFQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Anand Moon <linux.amoon@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20251028154229.6774-1-linux.amoon@gmail.com>
References: <20251028154229.6774-1-linux.amoon@gmail.com>
Subject: Re: [PATCH v3 0/2] PCI: j721e: A couple of cleanups
Message-Id: <176190080005.8740.2017130135799803682.b4-ty@kernel.org>
Date: Fri, 31 Oct 2025 14:23:20 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Tue, 28 Oct 2025 21:12:22 +0530, Anand Moon wrote:
> Refactor the J721e probe function to use devres helpers for resource
> management. This replaces manual clock handling with
> devm_clk_get_optional_enabled() and assigns the reset GPIO directly
> to the struct members, eliminating unnecessary local variables.
> 
> These patches have been compile-tested only, as I do not have access
> to the hardware for runtime verification.
> 
> [...]

Applied, thanks!

[1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to get the clock
      commit: 59ba8c0981e73cb2bb70074be4ef46b4188424ea
[2/2] PCI: j721e: Use inline reset GPIO assignment and drop local variable
      commit: 8895c0fc0671f38746ee1c02b728b126f7dbbf97

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


