Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFB5D0D16C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 19:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zl7jPZSCOKmQefRhPIZxs7VL4P3V+1Kpru7OX3zIlIk=; b=AhHDGzweYNhPHNBNuHvn4TU0n9
	6/ADYFHWkEH9rqiTVi51qplonfVO7nulWPsfnHE/xcNX0J3iwWqBR2MxaMK0DfU4rBGdYV4MPOhGw
	pUb4c0VwRnYwuVQV+IvMb/VIk7Mu6/AxueQIsZucb/AlBJGgo8SKQ6w3LcC65/xoq/fybuqvtby2e
	9T9F3SKIGszyOj2QGymMZ1Meu1w+pST0POwGbwzb9b32fKexujI5WTBfraA6b59JR7pzkPA0+JBwt
	ffxN6YFQzTNkmtAmPghj61ypNF5Zxj/sxiLK9kbt1Irp5JLxCG6RGHIIfT8Q9b1uaYNvcYkBIVzkJ
	BW4OIgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZM6-0000000FYcw-2aKY;
	Wed, 07 Jan 2026 19:38:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZM3-0000000FYbH-0j7V;
	Wed, 07 Jan 2026 19:38:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70B10434A1;
	Wed,  7 Jan 2026 19:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEA9C4CEF1;
	Wed,  7 Jan 2026 19:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767814682;
	bh=dS7+wC/J/N4NPj+M59OGoF1CMuagn2uO6v6kqhKO6ig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWwGoY6hJdViSG6iRV0glBiuy0hzEzrSAYxm6pgvElxvQw7PIzyZb/3TT7AxcbhTo
	 TUxKaXNtOp+EiCLr5CBCbmYKi4KjvNqm9irZBdjQQpOM7C0BhxucB3gNp4FqP6HjtL
	 tRz/AcQeiIMh3m9H6LPQ5SxdQZC3lYyS8tWKHwl0=
Date: Wed, 7 Jan 2026 20:37:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, bagasdotme@gmail.com,
	catalin.marinas@arm.com, conor+dt@kernel.org, corbet@lwn.net,
	dan.j.williams@intel.com, davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org, dev@kael-k.io, haren@linux.ibm.com,
	heiko@sntech.de, jose@osyx.tech, kever.yang@rock-chips.com,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org,
	neil.armstrong@linaro.org, palmer@dabbelt.com, pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org,
	will@kernel.org
Subject: Re: [PATCH v2 0/6] virt: Add Bao hypervisor IPC and I/O dispatcher
 drivers
Message-ID: <2026010746-usual-rentable-4746@gregkh>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_113803_263351_5B11C863 
X-CRM114-Status: GOOD (  25.80  )
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

On Wed, Jan 07, 2026 at 04:28:23PM +0000, joaopeixoto@osyx.tech wrote:
> From: João Peixoto <joaopeixoto@osyx.tech>
> 
> This series introduces support for Bao hypervisor guest-side drivers
> under drivers/virt/bao, along with the associated Device Tree bindings,
> UAPI headers, and MAINTAINERS entries.
> 
> Bao is a lightweight static-partitioning hypervisor for embedded and
> safety-critical systems. This series adds:
> - Bao IPC shared memory driver: Enables Linux guests to communicate
> with each other via shared memory regions.
> - Bao I/O Dispatcher driver: Allows Bao VMs to share I/O devices using
> device paravirtualization (VirtIO).
> 
> Key updates in this version to align with upstream requirements:
> 1. Switched to misc device API: Removed all cdev, class, and
> alloc_chrdev_region code in favor of misc_register() for simpler,
> standard device management.
> 2. Clean kernel style and formatting: All code passes checkpatch.pl,
> with consistent variable declaration, function naming, and comment style.
> 3. Architecture abstraction: Consolidated ARM, ARM64, and RISC-V hypercall
> logic into architecture-specific headers, removing in-driver #ifdefs.
> 4. Commit messages: Now concise and Linux-kernel-style, describing
> behavior and impact clearly.
> 5. Device Tree compliance: Fixed all make dt_binding_check errors to
> ensure DT binding correctness.
> 
> This series has been validated on Linux guests running under Bao
> hypervisor, confirming correct initialization, IPC shared-memory
> read/write operations, and I/O Dispatcher functionality for
> backend VMs.
> 
> Feedback and review from maintainers of virtualization,
> architecture-specific code (ARM, ARM64, RISC-V), Device Tree
> bindings, and UAPI are welcome.
> 
> João Peixoto (6):
>   dt-bindings: Add Bao IPC shared memory driver binding
>   virt: bao: Add Bao IPC shared memory driver
>   dt-bindings: Add Bao I/O dispatcher driver binding
>   virt: bao: Add Bao I/O dispatcher driver
>   virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common header
>   MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT
>     bindings
> 
>  .../bindings/bao/bao,io-dispatcher.yaml       |  75 ++++
>  .../devicetree/bindings/bao/bao,ipcshmem.yaml |  82 ++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>  MAINTAINERS                                   |  13 +
>  arch/arm/include/asm/bao.h                    |  60 +++
>  arch/arm64/include/asm/bao.h                  |  60 +++
>  arch/riscv/include/asm/bao.h                  |  60 +++
>  drivers/virt/Kconfig                          |   2 +
>  drivers/virt/Makefile                         |   2 +
>  drivers/virt/bao/Kconfig                      |   5 +
>  drivers/virt/bao/Makefile                     |   4 +
>  drivers/virt/bao/io-dispatcher/Kconfig        |  15 +
>  drivers/virt/bao/io-dispatcher/Makefile       |   4 +
>  drivers/virt/bao/io-dispatcher/bao_drv.h      | 361 ++++++++++++++++
>  drivers/virt/bao/io-dispatcher/dm.c           | 405 ++++++++++++++++++
>  drivers/virt/bao/io-dispatcher/driver.c       | 185 ++++++++
>  drivers/virt/bao/io-dispatcher/intc.c         |  64 +++
>  drivers/virt/bao/io-dispatcher/io_client.c    | 405 ++++++++++++++++++
>  .../virt/bao/io-dispatcher/io_dispatcher.c    | 179 ++++++++
>  drivers/virt/bao/io-dispatcher/ioeventfd.c    | 323 ++++++++++++++
>  drivers/virt/bao/io-dispatcher/irqfd.c        | 314 ++++++++++++++
>  drivers/virt/bao/ipcshmem/Kconfig             |   8 +
>  drivers/virt/bao/ipcshmem/Makefile            |   3 +
>  drivers/virt/bao/ipcshmem/ipcshmem.c          | 252 +++++++++++
>  include/linux/bao.h                           |  44 ++
>  include/uapi/linux/bao.h                      |  98 +++++
>  27 files changed, 3027 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
>  create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
>  create mode 100644 arch/arm/include/asm/bao.h
>  create mode 100644 arch/arm64/include/asm/bao.h
>  create mode 100644 arch/riscv/include/asm/bao.h
>  create mode 100644 drivers/virt/bao/Kconfig
>  create mode 100644 drivers/virt/bao/Makefile
>  create mode 100644 drivers/virt/bao/io-dispatcher/Kconfig
>  create mode 100644 drivers/virt/bao/io-dispatcher/Makefile
>  create mode 100644 drivers/virt/bao/io-dispatcher/bao_drv.h
>  create mode 100644 drivers/virt/bao/io-dispatcher/dm.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/driver.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/intc.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/io_client.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/io_dispatcher.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/ioeventfd.c
>  create mode 100644 drivers/virt/bao/io-dispatcher/irqfd.c
>  create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
>  create mode 100644 drivers/virt/bao/ipcshmem/Makefile
>  create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
>  create mode 100644 include/linux/bao.h
>  create mode 100644 include/uapi/linux/bao.h
> 
> -- 
> 2.43.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

