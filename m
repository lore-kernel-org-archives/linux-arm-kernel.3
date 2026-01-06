Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0697C47BE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMjfK2t8QsNFhjjG7j0g41uUsp4KdIehsgKNNU8LrRk=; b=XreFElB21cCNPKtKoQuCFFY8/W
	Tx7MyToOl8w3Tg0NZomdVevlW/DqVGOkGGArFm6eytJAIxHnaYQuvjfvZxv3nNsfdPiKUF0/YO5Zg
	zx1ScMZJDGp5Wk65LfHKA4zk7qbHN6nNyugk182L5ovzUFO5XghxM+OSztsRnJXCZTTa7vhs7ZYK/
	boPPbyoc8ZIywb5dLBikhCijNa21T/khkeESZjnykLC0w8OuoqKAP0k+YrdSlDZgSMoPehugefVD5
	nSRq0LWM5LfU5LtkzPt9bfEifkHTaHyfClKWNutaL/+CtPjmkhzfALcKdmGI+mANJv8iy/JpvYJIw
	sgCH5nmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4iJ-0000000Cpdl-0peJ;
	Tue, 06 Jan 2026 10:54:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4iG-0000000CpdG-0QpG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:54:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 573B5497;
	Tue,  6 Jan 2026 02:54:47 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B632D3F5A1;
	Tue,  6 Jan 2026 02:54:53 -0800 (PST)
Date: Tue, 6 Jan 2026 10:54:51 +0000
From: Leo Yan <leo.yan@arm.com>
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, kernel-team@meta.com
Subject: Re: [RFC PATCH] perf/arm64: Add BRBE support for
 bpf_get_branch_snapshot()
Message-ID: <20260106105451.GB336318@e132581.arm.com>
References: <20260102214043.1410242-1-puranjay@kernel.org>
 <CANk7y0j7hAJ7OcH_HgN0cVGnUh=iBz=iuD9sYZmSy-koMjB_cg@mail.gmail.com>
 <20260105212213.GA336318@e132581.arm.com>
 <CANk7y0gb8TM7obqWgaNY3aK_TZLX_nivYEATv2GndN5Ghz1hcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANk7y0gb8TM7obqWgaNY3aK_TZLX_nivYEATv2GndN5Ghz1hcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_025456_198587_995DFF31 
X-CRM114-Status: GOOD (  14.28  )
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

On Mon, Jan 05, 2026 at 09:46:01PM +0000, Puranjay Mohan wrote:

[...]

> Thanks for running the test, it will help me debug it better. But as
> Mark pointer out this has fundamental problems which I will try to fix
> first.

I saw the discussion.  Maybe we can refer to other architecture for
how to resolve the issues.

> P.S. - The test on FVP RevC, does this need special hardware or this
> is an emulation platform, in the later case, can I do the test myself
> somehow?

FVP is an emulation platform, and the best chance is to download
Shrinkwrap tool [1] for access it.  Below are some notes:

- For a FVP with BRBE enabled, I created a addition.yaml:

---8<---

layers:
     - arch/v9.5.yaml

run:
   params:
      -C bp.hostbridge.userNetworking: 1
      -C bp.hostbridge.userNetPorts: 8022=22
      -C cluster0.has_brbe: 1
      -C cluster0.has_brbe_v1p1: 1
      -C cluster1.has_brbe: 1
      -C cluster1.has_brbe_v1p1: 1
   rtvars:
      CMDLINE:
         type: string
         value: console=ttyAMA0 earlycon=pl011,0x1c090000 root=/dev/vda rw ip=dhcp kpti=off

--->8---

- Build firmware for FVP:

  export PATH=/path/to/shrinkwrap:$PATH
  shrinkwrap build --overlay=addition.yaml ns-edk2.yaml

- Build Linux kernel:

  ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make Image arm/fvp-base-revc.dtb

- Run FVP:

  shrinkwrap run -o addition.yaml \
        --rtvar=KERNEL=$KERNEL_PATH/arch/arm64/boot/Image \
        --rtvar=DTB=$KERNEL_PATH/arch/arm64/boot/dts/arm/fvp-base-revc.dtb \
        --rtvar=ROOTFS=debian.img ns-edk2.yaml

You can download a root file system image from [2].  Just note, FVP is
slow so you might need to cross build kernel and eBPF selftest on your
host machine and then mount your host folder onto FVP's /mnt folder,
something like:

  sshfs -o allow_other,default_permissions,reconnect \
      username@host_ip:/path/to/build/folder /mnt

Thanks,
Leo

[1] https://shrinkwrap.docs.arm.com/en/latest/userguide/quickstart.html#
[2] https://releases.linaro.org/debian/images/developer-arm64/debian12/debian.img

