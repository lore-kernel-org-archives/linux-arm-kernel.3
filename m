Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 819F6D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 05:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RuMEZxyBp5QJpAJ6hs+oV9m2Amxvb4+cvbaqkXic/k=; b=MR38nZwT8QHdGgU8hSap6oEh6g
	oEYjFLLZSpYmuYqTQ5QVxupLZF1F8/imG1YOmy9z89XiHJotBVAaBNcRboXJ1f7rzPmWw7ZtJz6Lk
	q6dvPdfDYSufi4DNbmO1wfBBp8col4i7uEdMzmRwq78LB7/8kTtTgMaelC3NRZaVuUqXgxdd4nJ+p
	sUx2+mbcGT1CfRai3WqAA9UBU1agGl4qhHyGX8Z7DbLv84rNImJe6PWTb6rjurY1ChJGroHJrD4Jh
	18sL3WDcYUpCSS4y6uERMqigvAu/5u93maMJNrwrCEtz9OkcWWvM8Z8qhYoi8YwGlMLSLQGz7dRrT
	xGaQPIbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOr7s-000000000F7-2atx;
	Fri, 28 Nov 2025 05:34:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOr7q-000000000E8-24vO;
	Fri, 28 Nov 2025 05:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 078FA43B0D;
	Fri, 28 Nov 2025 05:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFBEC4CEF1;
	Fri, 28 Nov 2025 05:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764308072;
	bh=olnhcKJPXjotw9MWUbQP+asLAvOtuozbVFnAjBvTurs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qsWOVwho2u7GvII3tw6luK4JNQG/lTFnllj2lsF2ZIWnBLyDvYR67dfXg9bLeANWK
	 m3tmO9ftT/LM4Posf6H3F2wtB7IgqKppFLwFibmgVPM72yaGXfxvmTo46WnuKKwt2U
	 4jA8h5eDImpQQFeiZqcnOy9qBLfGGUvLz3nkCBfijjaID1gCk2NZ0wWZIOFFGCPOvX
	 uD5eoHrPaeTGHioZCoi/uU4CC3Kw6tEAXIQh+6mOPZ/+y1p+/NYjH0jtvA2vbJnxjG
	 /WE03zXh1Nki1jHkAAhqKGphivYCADUkoiwbJmn28YyuBZt+Rz9frGP7Z8qtjPpc0b
	 vKmyUcTGIwAFw==
Date: Fri, 28 Nov 2025 06:34:27 +0100
From: Niklas Cassel <cassel@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
Message-ID: <aSk0Y74kPnsX0fGe@ryzen>
References: <20251111105100.869997-8-cassel@kernel.org>
 <mt7miqkipr4dvxemftq6octxqzauueln252ncrcwy6i2t7wfhi@jtwokeilhwsi>
 <aSRli_Mb6qoQ9TZO@ryzen>
 <585D6D29DF1A6436+9b5db091-8d6e-42a5-ab8f-4b152f82ac54@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <585D6D29DF1A6436+9b5db091-8d6e-42a5-ab8f-4b152f82ac54@radxa.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_213434_556390_2DAFECA3 
X-CRM114-Status: GOOD (  10.78  )
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

On Fri, Nov 28, 2025 at 02:15:28PM +0900, FUKAUMI Naoki wrote:
> Hi Niklas,
> 
> Should I try
>  "PCI: dwc: Make Link Up IRQ logic handle already powered on PCIe switches"
>  https://lore.kernel.org/r/20251127134318.3655052-2-cassel@kernel.org
> 
> instead of below approaches/patches?
> 
> > Neither my suggested approach:
> > https://lore.kernel.org/linux-pci/aRHdeVCY3rRmxe80@ryzen/
> > 
> > nor Shawn's suggested approach:
> > https://lore.kernel.org/linux-pci/dc932773-af5b-4af7-a0d0-8cc72dfbd3c7@rock-chips.com/

Yes please, your Tested-by would be very helpful.

It is basically the same as my patch above, I just sent it as a formal patch.

Since you said that it does indeed work for you, it does seem like a much
better solution. (Because if we would have reverted the patches, we would
have wanted to reapply them some time in the future.)


Kind regards,
Niklas

