Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E23ACAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 18:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RC7eubVcKmE1gmhpljtYimUCuSEOTYRl8t1InZvmTo8=; b=PZUq5cwGFLK6RZtLJgs/vM2l0I
	uUVPebOP7/A6BdO7vUmt3YrBzpM36JebRcp1JqF67qGn31CUOsQewNR5SEAJ/XcIe/vpy08k/Hb21
	wxn8pfvFXOAnB2MW2YnaCUe8iWldzWiqiiyksgqvCWAWkCPh17jMF7GuUPsakoxOYShwe3GvDb7oS
	c4OpGYEDC7sHj1CoMV4mVu0nQG8dgFBPx6WS/nn4DAlVlMA2XgVoHGjkKj3aS6ZqJIClZYJKJVIBG
	Jvq1fsG0tFFdWQaMhAf6RkYk4VNluhSyYxmDjj4ogOTMT1IVoD0l7BFKwMolg4nRU+a0z3txcZOvU
	FXaoBuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3IGb-00000003Cru-1Ys6;
	Mon, 29 Sep 2025 18:06:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3IGZ-00000003CrV-1HVP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 18:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D9E6402A4;
	Mon, 29 Sep 2025 18:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFA06C4CEF4;
	Mon, 29 Sep 2025 18:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759169186;
	bh=aXF6dblNZTmlNaQRE73OUxEz9KeOhfncEzYh4mOBv34=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=klcrZ7ZUFDGA8KX4HAryBRfyd2QyRv0g2WQkq8/HCU1OXGe0kN2UlS3NIhlkE0t6/
	 PyzM7dnrMjhVj3pvZcDwQ1ev2pM3Za7lVGjZxumRHVZtZLO7gXrpDcAr2DJA+vsbS8
	 xrRAxEY7SJxWX7StZzS1p2tgG9bQIKV83TYAn3cSDNTZ+T7DC7gFAu1vMZgg6T1frf
	 FfwVNOM61NC4z3KVG2ji9CrFe1Ub/BSvvEn6ONz+39nlfHG8Qw0icDCpEyiulhzPkA
	 BlK4aQ1jUULq8sEUbx5zjK6QYVEHk1VSjGy+nPvLHMZ1CWjTOkaakOR3op/Vo2Pdgl
	 zRVDCXJRnaYwA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: vigneshr@ti.com, s-vadapalli@ti.com, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
 linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250905211436.3048282-1-alok.a.tiwari@oracle.com>
References: <20250905211436.3048282-1-alok.a.tiwari@oracle.com>
Subject: Re: [PATCH] PCI: j721e: Fix incorrect error message in probe
Message-Id: <175916918016.21534.16971810252510733613.b4-ty@kernel.org>
Date: Mon, 29 Sep 2025 23:36:20 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_110627_372004_2F6F9B86 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
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


On Fri, 05 Sep 2025 14:14:34 -0700, Alok Tiwari wrote:
> The probe function printed "pm_runtime_get_sync failed" when
> j721e_pcie_ctrl_init() returned an error. This is misleading since
> the failure was not from pm_runtime but from the controller init
> routine. Update the error message to correctly reflect the source.
> 
> No functional changes.
> 
> [...]

Applied, thanks!

[1/1] PCI: j721e: Fix incorrect error message in probe
      commit: cfcd6cab2f33c24a68517f9e3131480b4000c2be

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


