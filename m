Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D01D6207F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 17:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AdKf+NWnk9+whGHJ/hk/PgxG+IEXbwjzGjd9H8RzFuA=; b=JAG2UYmvFqpEYb
	NUtZ7n9QTJNeWgvHRLuQZSMmsta5tqEt2sNIWvbBUO5d9ZGUADcCL0rj2I0hjEi4yfcJ5cJyrGcPA
	aXzWe1mg4/LopRukYPYZZjIEPf9KVAwooJCOQNJ40n9FAqOdXSmnxaoXdJ+XZvNEs8842GwHakfNf
	B51LrtT0NmmXrZrM+Io5qAjYzdKVwtOOJ1deS6nYBbYXUfDk2I/eT4G28rwBWwgJAOp7ljeuqeMcm
	cGRdduiCjRmbtoMgZ5p2Y6nfdcLSjqAusrFORKdpM28+rqqUN34ctqNumN/uM6PQhIIyhKfRsJ5kj
	vWq21XaWmiPdeU0jnr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSMx-0000000DGpM-3809;
	Tue, 19 Nov 2024 17:50:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSM1-0000000DGff-313G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 17:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4336B5C5741;
	Tue, 19 Nov 2024 17:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4C4C4CECF;
	Tue, 19 Nov 2024 17:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732038573;
	bh=Zwb06hTnOtFrHP7uC9zV5bZQcN0CA4khs24iBIrl7+I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=JCdnclNQlZXxVToquWNgU1QlEZt47JOaYSV2UA2ypZ04fzpSqN5brOnWcWT69lKjE
	 lB8kUeTCoZi81CNNjdMfzbPMrAsfjP/aUNURVo7kCrRdWF053YIXoji9UiGIZZz+fO
	 Iv3/r/qbDC3jgZFZhzfDC+wdDG3ufIPlzh1FRGEjADIslzI/ecq8i+yL0vCKNIUOWT
	 B5NZSYuIRoEe0J+4OM9Aaq4zYf90IKVOauUUsiTQS6F1Q+BqRk+GIIHP4PPW4nvCD5
	 L65IW39bNU85JM/O1D7uR4iL+oSHrMbR+WMFNEkheFY2Mf7omE0LYD8hPaIDiUVgjb
	 Qt8Ik+W7FW3TA==
Date: Tue, 19 Nov 2024 11:49:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	"open list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] PCI: check bridge->bus in pci_host_common_remove
Message-ID: <20241119174931.GA2270058@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028084644.3778081-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_094933_796012_312F4A3F 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, Oct 28, 2024 at 04:46:43PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When PCI node was created using an overlay and the overlay is
> reverted/destroyed, the "linux,pci-domain" property no longer exists,
> so of_get_pci_domain_nr will return failure. Then
> of_pci_bus_release_domain_nr will actually use the dynamic IDA, even
> if the IDA was allocated in static IDA. So the flow is as below:
> A: of_changeset_revert
>     pci_host_common_remove
>      pci_bus_release_domain_nr
>        of_pci_bus_release_domain_nr
>          of_get_pci_domain_nr      # fails because overlay is gone
>          ida_free(&pci_domain_nr_dynamic_ida)
> 
> With driver calls pci_host_common_remove explicity, the flow becomes:
> B pci_host_common_remove
>    pci_bus_release_domain_nr
>     of_pci_bus_release_domain_nr
>      of_get_pci_domain_nr      # succeeds in this order
>       ida_free(&pci_domain_nr_static_ida)
> A of_changeset_revert
>    pci_host_common_remove
> 
> With updated flow, the pci_host_common_remove will be called twice,
> so need to check 'bridge->bus' to avoid accessing invalid pointer.

If/when you post a v2 of this, please:

  - Update the subject to say *why* this change is desirable.

  - Follow the capitalization convention (use "git log --oneline" to
    discover it).

  - Add "()" after function names in the text (no need in the call
    tree because that's obviously all functions).

  - Mention the user-visible problem this fixes, e.g., do you see an
    oops because of a NULL pointer dereference?

