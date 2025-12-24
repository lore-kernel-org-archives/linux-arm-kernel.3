Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A06E7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q83S4pYEhB0HtYYOOygwB637lGNrEiPhfDJt/rYuos=; b=dKJpG1VsfbnuqMVZrs7OkJGDcy
	Ij1/2AnLSBLegMVHlalErtnoLzHmjL0cZjmJYC7/vtaCQ70rgGm8SRK/oRYMHOGEGDC3kJqwURkoX
	Uu1hJVKreEFbJdWmTkKMVxjux2pJJy8DQZoodGDB0afceJtZvF1+oKQU2ikp14bXoEE0fdFxAJMzq
	VXVlf7rVoWfFgyyDU/luq5Zg9+I7tIhxJrKTQVU9wheDz3b7k9ZpndGmSa0lMEtCWW9Xeg0kqOuDT
	Yvz2z/J1oTkbtyTrLK4khX+6uEXKn3mrf/ez1zfZpYkSsz3ZmIi6UPFiGft7e0kKsA7TFMBb908Eu
	evJIfiXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRBF-0000000HA0a-33PN;
	Wed, 24 Dec 2025 15:53:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRBC-0000000H9zp-1EUF;
	Wed, 24 Dec 2025 15:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E876432C4;
	Wed, 24 Dec 2025 15:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2AAC4CEF7;
	Wed, 24 Dec 2025 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766591617;
	bh=itw1VGsb8caeZEnMIi0mGYNuh+cuyTYEgjoEbrWFsa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=na8tgn2Fx1vsIkYcIShFC2kkQs5palK2hGDXUPY3eM7gVuxBBrThBP2xZl+f1Mkns
	 h03B+oe1jaxFou7L4DW8/u88YXrF4YH6jZnW1ebWjq3V6cBdxJeWhyTHSAsnZV2dGj
	 IgxQ4vcfM4lrOzcEER2C3fkKnZlutWBSXrYF+rwg=
Date: Wed, 24 Dec 2025 16:53:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bagasdotme@gmail.com,
	catalin.marinas@arm.com, conor+dt@kernel.org, corbet@lwn.net,
	dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org, dev@kael-k.io, haren@linux.ibm.com,
	heiko@sntech.de, jose@osyx.tech, kever.yang@rock-chips.com,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, maddy@linux.ibm.com,
	mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org,
	palmer@dabbelt.com, pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH 2/5] virt: add Bao IPC shared memory driver
Message-ID: <2025122459-blimp-bobble-c772@gregkh>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-3-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251224135217.25350-3-joaopeixoto@osyx.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_075338_359728_6C95A1BA 
X-CRM114-Status: GOOD (  13.19  )
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

On Wed, Dec 24, 2025 at 01:52:14PM +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> Add a new driver providing an interface for communication with guests
> hosted by the Bao hypervisor using shared-memory channels. The driver
> exposes read/write regions defined in device tree and notifies the
> hypervisor via an architecture-specific hypercall (SMC/HVC on ARM and
> SBI ecall on RISC-V).
> 
> The patch introduces:
>   - drivers/bao/ with the initial Bao IPC shared-memory implementation
>   - Kconfig entry enabling BAO_SHMEM
>   - Makefile integration for building the driver
>   - A character device interface supporting mmap(), read(), and write()
>   - Platform driver support using DT properties for channel layout
> 
> Each device instance maps its assigned shared-memory region, validates
> read/write channel configuration, and exposes a /dev/baoipc<N> node
> used by user space to exchange data with Bao guests.
> 
> Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
> ---
>  drivers/virt/Kconfig                 |   2 +
>  drivers/virt/Makefile                |   1 +
>  drivers/virt/bao/Kconfig             |   3 +
>  drivers/virt/bao/Makefile            |   3 +
>  drivers/virt/bao/ipcshmem/Kconfig    |   9 +
>  drivers/virt/bao/ipcshmem/Makefile   |   3 +
>  drivers/virt/bao/ipcshmem/ipcshmem.c | 539 +++++++++++++++++++++++++++

Why two subdirs deep for a single .c file?  Why not just put this in
drivers/virt/ instead?

thanks,

greg k-h

