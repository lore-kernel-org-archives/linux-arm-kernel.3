Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABA3C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/13R35Ko8n5x1HSY7U0Uzka9E1kCrKuBvxR7qOaTxKA=; b=Er7lpO+Cx+QQXeKeik9bWQhKfE
	GLugijNVPc64lgDm729y81Sh0/pvvvK0B8d16CVYfpH29/K+gbjwm+mfAN6/2ZQtjfARXkt14oDeZ
	buB506VuyC1XoAQIQxstQBT2mVleEWJrL6cUg5xelnLNb4zL9EijLlD7FurYG6cuf1Z8ZathtE1z7
	zMx4rDJ6vrVywq5c/YgOFrkHeDkRxzLZRf/ktK2fig8Z3m28cZMCwuvhNlgMJRkbk7fqLjrC6zHgp
	fXgo1vBQeB15huFrzdfMGsng6G97Yimf01sUU2t4XCBZRXFCG8k8sxkHsBp0cTEvUgsytoSCwZyXd
	UEr9DMtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzpt-000000077EZ-3V9T;
	Tue, 10 Jun 2025 14:20:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyCK-00000006mqD-1pwA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:35:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06A3840C1F;
	Tue, 10 Jun 2025 12:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F17C4CEED;
	Tue, 10 Jun 2025 12:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749558923;
	bh=CSmYS/pEFaVijBjHY+AHpQU5O1e+HZuwLLbg9pOH0U0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLy814kHt42+XDyorgdKuhyW4Kp9DnDA1Yj7xT5s0OTL8tQtGZCvJPaPuY+r3W3BD
	 AlgG3tryBBHPYzAnqZTGCLIf+VKJ98RGPtseBnslkqZ8wh9NNBnwQjF5Wnc/MNAInH
	 tstKUA+jlZo0X3EUr/A6M2gS5zWsJPyfPNvOLlODu8fNs5KuX/lXGM/YZvRehytEhI
	 6AMRMIVO90DWDla+Jp6LbN48mJ17GDGMFl78vNI1+JS4dVmQ/oJFtvUx6tluRUsYtK
	 L4c6GdcyjV7ncWDm0WDpoteQjZR3ObVBaIzpraIFybRL6BKKlhnC7lGuYpUI+U2jH/
	 bAflbXLO0z0sA==
Date: Tue, 10 Jun 2025 15:35:19 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fix failure of integration IMA with tpm_crb_ffa
Message-ID: <aEgmhwu1RP27yBpw@kernel.org>
References: <20250610060334.2149041-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610060334.2149041-1-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_053524_493870_1F1BE228 
X-CRM114-Status: GOOD (  16.16  )
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

On Tue, Jun 10, 2025 at 07:03:32AM +0100, Yeoreum Yun wrote:
> To integrate a TPM device that uses CRB over FF-A with the IMA subsystem,
> both the tpm_crb and tpm_crb_ffa drivers must be built as built-in
> (i.e., ARM_FFA_TRANSPORT=y, CONFIG_TCG_CRB=y, and CONFIG_TCG_CRB_FFA=y),
> because IMA itself is built-in and the TPM device must be probed
> before ima_init() is invoked during IMA subsystem initialization.

The description of the problem and motivation to solve it should be
first; not the actions taken.

> 
> To ensure this works correctly, the following initcalls must be executed in order:
> 	1.	ffa_init()
> 	2.	tpm_crb_ffa_driver_init()
> 	3.	crb_acpi_driver_init()
> 
> Unfortunately, the order of these device initcalls cannot be strictly controlled.
> As a result:
> 	1.	ffa_init() may be called after tpm_crb_ffa_driver_init()
> 	2.	tpm_crb_ffa_driver_init() may be called after crb_acpi_driver_init()
> 
> For example, the following initcall sequence may occur:
>   0000000000000888 l  .initcall6.init>  crb_acpi_driver_init
>   000000000000088c l  .initcall6.init>  tpm_crb_ffa_driver_init

This symbol does not exist.

>   0000000000000a9c l  .initcall6.init>  ffa_init
> 
> In this situation, the IMA subsystem fails to integrate with the TPM device
> because the TPM was not available at the time ima_init() was called.
> As a result, you may see the following message in the kernel log:
> 
>   | ima: No TPM chip found, activating TPM-bypass!

TPM initializes before IMA, so there should not be a problem.

BR, Jarkko

