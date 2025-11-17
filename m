Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B97CCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 20:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=pxqCaW3R313TyZdd34a3Q02/6uz03Wxy2finKb89PPw=; b=L/mKHWhr7q1Sh6
	hRkyTGlgz03H77gaQnmOiT4FqCgEJ/eYlKpjqXhwHKRW3Qs+BtEva1v+CMwTyq99VONtHPRgmUyHY
	An2rnCwpvUb5pNqLz+C6O9wX9KQMe+Rdz0y3aTgDJnFStx0PR4uC5JgZaPFAqgQakwW+27qbf/UU1
	1KO1QLsw098dYkq9FB87QATGfGglvPrnr7wf4cLDRJWgEB+Xmv4+nT7AilikLhKYGJ6k1X0SUX8Zo
	EjV+UcLrow0h+RIHuVw9cqO5lzNSzioNZWvOcgYXKppCutoIV+4je7xdsOke6Jwnuzz2w1q0YyLPp
	qd/0L0KKgaVehRSUxZaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL64o-0000000GpuY-21QC;
	Mon, 17 Nov 2025 20:43:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL64m-0000000GpuN-2rJa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 20:43:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD76C605D2;
	Mon, 17 Nov 2025 20:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AE5C113D0;
	Mon, 17 Nov 2025 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763412231;
	bh=8ed1/LqTDi9J6Cd/l8V0MNcIqQta3AJ4Jk23LfPDRwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=re3U4Mqpb5UfMPsEjbI9h8j/NOQXU9xKb6om6xXZDQ4bzV+8YGee5+2u5y/XEDuF5
	 dv0HHmUJ0QA8vHoT8R1QME1qkU21Va8lXH0yhNNJS0vePBBCa/rDLWcm9KTSytZXRQ
	 OcGw2qZ1bBnkdV6SV0fbxBjL2TAz6ftP6GRRAH1V6LZPq93OE7e7In6K9ILm69+9O5
	 +rs5VtSfgtKGNWMkW5b5w61EemVmnAd/tpPhdiWLM3Hi0eOwXyKv0huX/75IuFaXXm
	 j1b8zD8/d439dekML6TfSfyZfVuq5lEH+l8IZAMSNakKnGwXSTEHQ1rZsD2YGGV6MY
	 Up/PD1sWvTQrg==
Date: Mon, 17 Nov 2025 14:43:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 1/1] PCI: stm32: Don't use "proxy" headers
Message-ID: <20251117204348.GA2522408@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114185534.3287497-1-andriy.shevchenko@linux.intel.com>
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

On Fri, Nov 14, 2025 at 07:52:01PM +0100, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> In particular, replace of_gpio.h, which is subject to remove by the GPIOLIB
> subsystem, with the respective headers that are being used by the driver.

Thanks, Andy!  It looks like a lot of work to figure this out by hand.
Is there a tool to figure this out?  Maybe something I could run when
reviewing patches?

IWYU seems like a nice principle but I couldn't find any mention in
Documentation/.  Should it be covered there somehow?

Bjorn

