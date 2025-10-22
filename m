Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2578DCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7sgCBTfR/C5p7zZIiaptFArrV/CiFPWvjAdAnJc6HU=; b=ibvUC0v5zp+7Mab5tf+V/GhH+v
	NrkxftL6ZbryPC8HsW34WAhYzy3OBPYWDB6dgUHKt+W5eVBKgvnIlDNBwpkCJN1O0ecnySBjHgz9p
	XYBupWlzRw88AtKkScFpHiraglujL1kci0yhw0BAFzZLa57PyrqVhqqWZt+Ui7ECG8VE/aaNLwGiX
	4IOpZiKRxIfIJiWjNHdWsh/jesmZNo8oadbQb9wm2rQ3h912z8EDzuJlQH12NPrUkJ9fU/EIy9jUZ
	/iD/+F6PcirmJFwD3BVZbXPgllLTbxeiaPa2kSkLT0xOHdmF4EnFRELEzg7oCohOynSEvaDeN4hOB
	/0g2AN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZSr-000000038d0-2xQo;
	Wed, 22 Oct 2025 14:05:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZSo-000000038b8-39YL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 14:05:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D72F143AEA;
	Wed, 22 Oct 2025 14:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D67BC4CEF5;
	Wed, 22 Oct 2025 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761141903;
	bh=Z2fhMvuqsJ3srCnp+0oTmljFG+7/qaPNlbN0encLOvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STCa7qfpl6r6uM36aHFZSqIEcjThWmFFBHbZeEBZwFO8JG1xNRTCUnIFxQwB6AxUZ
	 hFGYpNVAxqNd/I5p46l4Cy2SAgYZFO0TyIto+xhaTBnNIYsfvM/lV4ldsIP/iNifBq
	 gE58Huk8mbgwiMyUZjii1IrxZV9ADPPrUHDNf9Y9C6QY8lTjbU3B0+w6cMcKIOu8Xa
	 bEYRm1nNNEslseeSK3INJlTQ8i4LbnZT3sU3ZVCPUj+1muSl74dFB/aY2Q27r29DTd
	 +kYcYEV9n/v4mMHuLHXl3qqCPIavBR6pW4a+gaAyKZDIdI3kb7suetdkM1v/xj4A3b
	 Rwp0XZcyISUcg==
Date: Wed, 22 Oct 2025 09:05:01 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v4 3/5] of/irq: Export of_msi_xlate() for module usage
Message-ID: <20251022140501.GA3390144-robh@kernel.org>
References: <20251021124103.198419-1-lpieralisi@kernel.org>
 <20251021124103.198419-4-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021124103.198419-4-lpieralisi@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_070518_806799_D47670B7 
X-CRM114-Status: GOOD (  10.60  )
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

On Tue, Oct 21, 2025 at 02:41:01PM +0200, Lorenzo Pieralisi wrote:
> of_msi_xlate() is required by drivers that can be configured
> as modular, export the symbol.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Cc: Rob Herring <robh@kernel.org>
> ---
>  drivers/of/irq.c | 1 +
>  1 file changed, 1 insertion(+)

I guess just iproc needs this, so:

Acked-by: Rob Herring (Arm) <robh@kernel.org>

