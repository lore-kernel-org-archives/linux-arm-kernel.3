Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EC3C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6x/8vw2spQRcy1apTXVr0NE/W2ZyAVvjSaBTe5Xo4NM=; b=cNmR4bPSwXgo9bS+KZBWLO5Hbg
	deBjYX5sJqJeJoyVgEmK9PlLQK5DJ6l7tAl/hKJBbRc4zaocAm0gm4wi0ffWfa8TJbwEX+bQtIFUA
	QRnOqOLCl3z0/G4WHTw2ILlNd3q28Jz2RHtOG/piiisaQSs5xW5nqLTBp11VTUhxNi5xEg7Exw98Z
	H32MYvfKIkG3rTRsaZkWzPmTmMnVfVZjAkALwbvCdmStZOffuCVeHG1B1bJHkwUtt2Fr6eF+9oFbR
	WVYZGwW6U0R+Fwx7oIGqLFO/PY0n8qo4SSWi0nAlNiyMMHF0VF4qhTouP+K+XmAq/G1QiLPiqpSzH
	n7Smaiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6Va-00000005C4t-25WZ;
	Tue, 08 Jul 2025 11:29:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6FA-000000059sQ-0elm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 11:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96D685C5B1A;
	Tue,  8 Jul 2025 11:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4C9C4CEED;
	Tue,  8 Jul 2025 11:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751973131;
	bh=qYlJIQBZZw0QX7Jkhi3+cl9CFM1ZAaSQYY9DTNGZLoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uMvJNSSXJZOQ97hxkJGqHTHq1gJrmB7LR5lJL3TkMi189Qmdm08zr3t2Efa3Koyby
	 T5l+dbsvTuMBgRM79wxfqrpEvk5iZzWMRbEJ7xFmzqRjGouYk1x9GJUs5kfagP7f8m
	 2I1d4YhhcJCJSOdXpuytA/B2zMnsucdBmWpUav9YjZRP2+i1GhJDB2pmTjQcQ/+7Bd
	 owIDZ1wQWEviozdtHSW9OAsqYaYzL79b6dozKfFJu4y3aIrJnNJaYXn6nnI7lc3WCX
	 +ISVSm3kghRa12AMF9Oz6wolGPTad+/YAOKXw34JI+rfaFhl+zXampKZ3etHS30PcP
	 Vv7jEdahtlRvg==
Date: Tue, 8 Jul 2025 13:12:02 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	dlemoal@kernel.org, jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v19 00/10] PCI: EP: Add RC-to-EP doorbell with platform
 MSI controller
Message-ID: <aGz9ApsBD-gQ50pf@ryzen>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <roskp2zsjohrgll464u4jtbulzjid523u3yvgciifwiuoygv5t@7f7cj4wfy2y7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <roskp2zsjohrgll464u4jtbulzjid523u3yvgciifwiuoygv5t@7f7cj4wfy2y7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_041212_273073_94DED914 
X-CRM114-Status: GOOD (  15.24  )
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

On Wed, Jul 02, 2025 at 06:57:23PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Jun 09, 2025 at 12:34:12PM GMT, Frank Li wrote:
> 
> Frank, thanks for your persistence in pushing this series, really appreciated!
> I've left some comments, but no real blocker.
> 
> Unfortunately, I don't have access to my endpoint setup right now. So I'll go
> ahead with the Tested-by tag from Niklas once my comments are addressed.

(snip)

> > Changes in v6:
> > - add Niklas's test by tag

My Tested-by tag was added on v6, now it is v19 :)

To be comfortable of still having my Tested-by tag here,
I decided to test v19.

However I got this:

[ 3255.257047] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000040
[ 3255.257824] Mem abort info:
[ 3255.258069]   ESR = 0x0000000096000004
[ 3255.258398]   EC = 0x25: DABT (current EL), IL = 32 bits
[ 3255.258862]   SET = 0, FnV = 0
[ 3255.259147]   EA = 0, S1PTW = 0
[ 3255.259423]   FSC = 0x04: level 0 translation fault
[ 3255.259849] Data abort info:
[ 3255.260102]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[ 3255.260580]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[ 3255.261020]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[ 3255.261483] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000100a03000
[ 3255.262045] [0000000000000040] pgd=0000000000000000, p4d=0000000000000000
[ 3255.262639] Internal error: Oops: 0000000096000004 [#1]  SMP
[ 3255.263132] Modules linked in: rk805_pwrkey hantro_vpu v4l2_jpeg v4l2_vp9 v4l2_h264 v4l2_mem2mem videobuf2_v4l2 videobuf2_dma_contig videobuf2_memops videobuf2_common vidf
[ 3255.265357] CPU: 5 UID: 0 PID: 213 Comm: ln Not tainted 6.16.0-rc1+ #233 PREEMPT 
[ 3255.266009] Hardware name: Radxa ROCK 5B (DT)
[ 3255.266388] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[ 3255.266995] pc : pci_epf_bind+0x160/0x240
[ 3255.267350] lr : pci_epf_bind+0x40/0x240
[ 3255.267694] sp : ffff800081593c30
[ 3255.267983] x29: ffff800081593c30 x28: ffff0001024b2300 x27: ffff000102fc2800
[ 3255.268606] x26: ffff00010191e000 x25: ffff000100504098 x24: ffff000107b8ec80
[ 3255.269228] x23: ffff000104cf3578 x22: 0000000000000000 x21: 0000000000000000
[ 3255.269850] x20: ffff000104cf3000 x19: ffff000104cf3578 x18: 0000000000000000
[ 3255.270472] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[ 3255.271093] x14: 0000000000000000 x13: ffff00010245c037 x12: ffff800081593b94
[ 3255.271715] x11: 0000000528aa6179 x10: 0000000000000002 x9 : ffffa2593ce92b30
[ 3255.272336] x8 : 00000031636e7566 x7 : 00000000ffffbe12 x6 : 0000000000000003
[ 3255.272958] x5 : ffff000102413f78 x4 : ffff000102413f08 x3 : 0000000000000000
[ 3255.273580] x2 : ffff0001024b2300 x1 : 0000000000000000 x0 : ffff000104cf3000
[ 3255.274201] Call trace:
[ 3255.274416]  pci_epf_bind+0x160/0x240 (P)
[ 3255.274767]  pci_epc_epf_link+0x54/0xb0
[ 3255.275104]  configfs_symlink+0x208/0x540
[ 3255.275457]  vfs_symlink+0x158/0x1e0
[ 3255.275770]  do_symlinkat+0x8c/0x138
[ 3255.276083]  __arm64_sys_symlinkat+0x7c/0xc8
[ 3255.276455]  invoke_syscall.constprop.0+0x48/0x100
[ 3255.276874]  el0_svc_common.constprop.0+0x40/0xe8
[ 3255.277285]  do_el0_svc+0x24/0x38
[ 3255.277575]  el0_svc+0x34/0x100
[ 3255.277852]  el0t_64_sync_handler+0x10c/0x140
[ 3255.278233]  el0t_64_sync+0x198/0x1a0
[ 3255.278554] Code: a9446bf9 394ff280 b902aa80 aa1403e0 (f94022a1) 
[ 3255.279085] ---[ end trace 0000000000000000 ]---


Seems to be from patch 1/10:

(gdb) l *(pci_epf_bind+0x160)
0xffff800080892c50 is in pci_epf_bind (drivers/pci/endpoint/pci-epf-core.c:132).
127                             goto ret;
128                     epf_vf->is_bound = true;
129             }
130
131             epf->dev.id = PCI_EPF_DEVID(epf->func_no, 0);
132             device_set_of_node_from_dev(&epf->dev, epc->dev.parent);
133             ret = epf->driver->ops->bind(epf);
134             if (ret)
135                     goto ret;
136             epf->is_bound = true;


I can see that there is a lot of discussion on patch 1/10 already,
but please drop my Tested-by tag until this has been fixed.

Feel free to CC me on v20 of this series, if the problem is fixed,
I will provide my Tested-by tag once again.


Kind regards,
Niklas

