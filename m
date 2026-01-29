Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB74D6101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 14:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d47mfWDfhwVOcY0sEOqFBeuehMSYc5UT+oKMWz/KtZk=; b=mDaN1iISQ2uEsyBDmoSxnYz6Z6
	VqZJvxNBoUONfGHsOnYWoARg4dfvR2Z5lx2ppfVBC8MzI6Fp2MY+bfrG+bBEvH/jYDwRPTeGKE3VQ
	DoYi4h6GBe2TfqgcG8pVhdrN/X0GRSPsyB5WtH19ZuWTjtCLxHXKRA5o5fDNckeV861hqtTeuqXU7
	Cda4qb4MNeSRlVUIjJt5IK1DeqjNSlhTZleqI6dE2Hg/RYoZq5Nt3e4SDXBDBeuvJ3QOKfrbcRCJd
	zJZD+QA2JLCrC+1PUwfzjsaOtmNp7mW05M9g3+stZqjezZzgi11Qzra3nICAGm4Uk40kBjWau7c0O
	A1o8LJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlT6R-00000000EbY-1wAe;
	Thu, 29 Jan 2026 14:34:35 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlT6N-00000000Eai-2qQe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 14:34:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AE7AE4E4231F;
	Thu, 29 Jan 2026 14:34:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AF90606FD;
	Thu, 29 Jan 2026 14:34:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BE85119A868D;
	Thu, 29 Jan 2026 15:34:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769697265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=d47mfWDfhwVOcY0sEOqFBeuehMSYc5UT+oKMWz/KtZk=;
	b=gA/8R/EcrIX++41cvrqp/HOTBjT97sS8ThTK0zE6yO46QKe9D9mjwcapsEAc1w9yvMAl2B
	C2uYG8LPXLVZjwMCHEft87k5BNPv3d++ziJXieQR+UsHaeU22YtmQ0VVAaAk8fo+o4R5Dq
	u2BhQIRnSIIjFsopSe7O9vs8ACZ8KxMAv+1XOEJvCviLlPXDvPZei88M1qOIH4nXoWEKIt
	Wedu41nhfGhpBy4Cfd7377shdp8vYT4c/Q5QOlOmoydIV1ITSwJCASogCENrbVaqYqQrUr
	jvSlhtEZ7fq3CGGV6uPQqTaDNFkVR3JQiszzOI0GTYgjQ8jtX3J4Y5YZhMucFg==
Message-ID: <8743fec1-301d-46e1-89bf-7952c73faa86@bootlin.com>
Date: Thu, 29 Jan 2026 15:34:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: cdns3: host: Add null check for host_device before
 accessing its members
To: Abhash Kumar Jha <a-kumar2@ti.com>, gregkh@linuxfoundation.org,
 pawell@cadence.com, peter.chen@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, rogerq@kernel.org, u-kumar1@ti.com,
 p-mantena@ti.com, theo.lebrun@bootlin.com,
 Gregory CLEMENT <gregory.clement@bootlin.com>
References: <20260119082242.1922599-1-a-kumar2@ti.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260119082242.1922599-1-a-kumar2@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_063431_986214_2DC2CEE9 
X-CRM114-Status: GOOD (  15.85  )
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

Hello,

On 1/19/26 9:22 AM, Abhash Kumar Jha wrote:
> In cases when the xhci device is not populated, we see a nullptr
> exception when resuming.
> 
> Add a nullptr check for the host_dev before accessing its private data.
> 

I was able to reproduce Abhash's issue on J784s4 and J7200 EVM board
with 6.19-rc7 kernel.

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000208
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=00000008856e6000
[0000000000000208] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 146 Comm: sh Not tainted
6.19.0-rc7-00013-g6e64f4aabfae-dirty #135 PREEMPT
Hardware name: Texas Instruments J7200 EVM (DT)
pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : usb_hcd_is_primary_hcd+0x0/0x1c
lr : cdns_host_resume+0x24/0x5c
sp : ffff800084fc39d0
x29: ffff800084fc39d0 x28: ffff8000840ac098 x27: ffff8000842e6ee0
x26: 0000000000000000 x25: ffff800084247958 x24: ffff80008427d000
x23: 000000048f2f5605 x22: ffff000801937218 x21: 0000000000000010
x20: 0000000000000001 x19: 0000000000000000 x18: 0000000000000006
x17: 0000000000000000 x16: 0000000000000000 x15: ffff800084fc3390
x14: 0000000000000000 x13: 383331203a74696e x12: 695f74736f685f73
x11: ffff800083c48828 x10: 0000000000000018 x9 : ffff800083c48828
x8 : 00000000000006aa x7 : ffff800083ca0828 x6 : 00000000fffff000
x5 : 0000000000017fe8 x4 : ffff000801935dc0 x3 : 0000000000000000
x2 : ffff800080e3b388 x1 : 0000000000000001 x0 : 0000000000000000
Call trace:
 usb_hcd_is_primary_hcd+0x0/0x1c (P)
 cdns_resume+0x6c/0xbc
 cdns3_controller_resume.isra.0+0xe8/0x17c
 cdns3_plat_resume+0x18/0x24
 platform_pm_resume+0x2c/0x68
 dpm_run_callback+0x90/0x248
 device_resume+0x100/0x24c
 dpm_resume+0x190/0x2ec
 dpm_resume_end+0x18/0x34
 suspend_devices_and_enter+0x2b0/0xa44
 pm_suspend+0x16c/0x5fc
 state_store+0x80/0xec
 kobj_attr_store+0x18/0x2c
 sysfs_kf_write+0x7c/0x94
 kernfs_fop_write_iter+0x130/0x1dc
 vfs_write+0x240/0x370
 ksys_write+0x70/0x108
 __arm64_sys_write+0x1c/0x28
 invoke_syscall+0x48/0x10c
 el0_svc_common.constprop.0+0x40/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x34/0x108
 el0t_64_sync_handler+0xa0/0xe4
 el0t_64_sync+0x198/0x19c
Code: 52800003 f9407ca5 d63f00a0 17ffffe4 (f9410401)
---[ end trace 0000000000000000 ]---

So I investigated and I identified two distinct issues.

1- First issue is hardware / board related issue, for an unknown reason
VBUS change after a suspend-to-ram or suspend-to-idle which triggers a
mode change of the controller (from idle to host). This issue shall be
fixed but it is not the right place for such a discussion.

2- Second issue is: switching from idle to host mode during resume
causes a NULL pointer dereference. I think it is a valid use case so it
should be fixed.

During resume cdns3 detects that the real role changed [1]. In this case
it switches to its new role [2]. Behind the scene, it runs the stop()
operation of the former role [3][4], and then run the start() operation
of the new role [5][6].

In host mode, the start() operation creates a xhci-hcd device [7]. But
as we are in the resume path, the probe() of this xhci-hcd device is not
run. Later in the resume sequence of cdns3 driver we call the resume()
operation [8] of the current role (which is host right now). But in the
host resume operation we assume the xhci-hcd device has been probed
which is not true in this case, so we try to use an uninitialized
pointer which causes a NULL pointer dereference.

I think we can skip the resume() operation in case the role changed
during resume as we already did the start() operation for the new role.
Then resume ends successfully, and xhci-hcd device is probed after.

I will send a patch.

[1]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L534
[2]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L536
[3]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L316
[4]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L66
[5]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L320
[6]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L47
[7]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/host.c#L69
[8]
https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/usb/cdns3/core.c#L555

Best Regards,
Thomas

