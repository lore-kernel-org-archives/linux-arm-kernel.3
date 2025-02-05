Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C7AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uQPhe9Q9fTAa3bNgtFo33/GH5oRyrVQ+DZv0AxHQG/s=; b=mhfORRUjgSwVXFI0xBvGDO72T9
	gtdEpxs+dpqEo7yCp9+xm59CdPjoxJsU5QrfQunAzOsufKSHg2kpMUDM7DIzOPKM7UJNy5FKBkaxu
	YYWViIh6duqrUx9YTsqSKsdhsFXFMzwFGw3OKWXT9+VoY46S0l79rsPfA2XWPUiQHE8RLe8KZnysY
	hN7Slj+77LU6w/h+Mn72N8ZF0Z3tJcHRQsAIITFd8xELr8uS75v1OEEeKWuSfcdNTiJEnWXVSlxH2
	LXYD4RJp7tFOZTJV/ILfgGPH+Nt7/3T+/DlzugjcQBQc5R+Y+7x2vgJrcgjrhSaKEJzhasGj6Qd2s
	njhHVMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjOV-000000047zB-2Exn;
	Wed, 05 Feb 2025 17:40:59 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjEK-000000046AE-1GgQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 17:30:30 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A0346240101
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Feb 2025 18:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1738776623; bh=f2yEvU4TM3aZYdPhq5G+l+SmpWWP3YrRm11kspLYSHc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=bq3wprTFJ7yxSG9ilTIJrap/95T51GgcgFDWZkvJno2xrBO5accQnAvcMrqQ/r+ef
	 6c2kr7NL+K0Vv1ap8/iQuieLfDA8V/nrH3z/LSZLH4+AT8hxqKIu7GCkNaFbI3ckwc
	 KpKx8Mel4qR4r8HINtGVEMnhtxvEZP2uGOaDavSuBS31enMc5TrKx7WhOikl/aLzri
	 38KBizqPyWS+LgDNXtzodkwhBjSFFixdbbUyIBijHzXWbH1NaqYwD4LQ2iYrnKIt6G
	 7hZP7Yg1dzUlfE6bjclOcjAzrR4EVbHB92T9Va+nfzq50ug0bMC+k92X4Jatq/1Rdi
	 3rhwd3L1nwdPQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Yp6gv6fyqz9rxK;
	Wed,  5 Feb 2025 18:30:19 +0100 (CET)
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
To: laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: [PATCH] media: nxp: imx8-isi: check return value of media_pad_remote_pad_first()
Date: Wed,  5 Feb 2025 17:29:57 +0000
Message-Id: <20250205172957.182362-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_093028_628958_10401D92 
X-CRM114-Status: GOOD (  13.41  )
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

media_pad_remote_pad_first() return NULL if "no enabled link has been found".
Check for that.

backstory
=========
While trying to get a (Y10 grey) sensor working on imx8mp (v6.12.12 now and
I know the hardware works on an ancient nxp-kernel),
I tried to enable the sensor link, set formats and stream:

media-ctl -d 1 --links "'vc-mipi-cam 3-001a':0->'csis-32e50000.csi':0[1]"
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"vc-mipi-cam 3-001a":0[fmt:Y10_1X10/2592x1944 field:none]'
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"csis-32e50000.csi":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"crossbar":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
media-ctl -d "platform:32e00000.isi" --set-v4l2 '"mxc_isi.0":0[fmt:Y10_1X10/2592x1944 field:none colorspace:srgb]'
v4l2-ctl -d /dev/video1 --set-fmt-video=width=2592,height=1944,pixelformat="Y10 "
v4l2-ctl --verbose --device /dev/video1 --stream-mmap

and what I got was the NULL pointer deref, I append below. With this patch I
at least get a nice "VIDIOC_STREAMON returned -1 (Broken pipe)".

[   29.936640] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
[   29.947993] Mem abort info:
[   29.950791]   ESR = 0x0000000096000006
[   29.954544]   EC = 0x25: DABT (current EL), IL = 32 bits
[   29.959861]   SET = 0, FnV = 0
[   29.962935]   EA = 0, S1PTW = 0
[   29.966084]   FSC = 0x06: level 2 translation fault
[   29.970977] Data abort info:
[   29.973860]   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
[   29.979358]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   29.984414]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   29.989740] user pgtable: 4k pages, 48-bit VAs, pgdp=000000004536d000
[   29.996186] [0000000000000020] pgd=08000000452ec003, p4d=08000000452ec003, pud=080000004361a003, pmd=0000000000000000
[   30.006820] Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
[   30.013087] Modules linked in:
[   30.016143] CPU: 3 UID: 0 PID: 433 Comm: v4l2-ctl Not tainted 6.12.12-ge-24.09+-gd7393141dd76 #104
[   30.025102] Hardware name: MMI4.0 i.MX8MPlus (DT)
[   30.029804] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   30.036766] pc : mxc_isi_crossbar_xlate_streams+0xb0/0x10c
[   30.042258] lr : mxc_isi_crossbar_xlate_streams+0xac/0x10c
[   30.047745] sp : ffff800083db3930
[   30.051058] x29: ffff800083db3930 x28: ffff800083db39e8 x27: ffff800083db39f0
[   30.058200] x26: ffff800083db39ec x25: ffff000002eff0a8 x24: 0000000000000000
[   30.065339] x23: 0000000000000001 x22: 0000000000000001 x21: 0000000000000001
[   30.072478] x20: 0000000000000003 x19: ffff000003e3c4b8 x18: 0000000000000000
[   30.079616] x17: 0000000000000000 x16: ffff800080000000 x15: 000000000099e000
[   30.086756] x14: 0000000000000002 x13: 0000000000036754 x12: 0000000000000010
[   30.093894] x11: 0000000000000001 x10: 0000000000000064 x9 : 0000000000000004
[   30.101032] x8 : ffff00000348332c x7 : ffff000003483200 x6 : ffff800083db39ec
[   30.108172] x5 : ffff000003483000 x4 : 000000000fffffff x3 : ffff000002eff110
[   30.115312] x2 : ffff0000048a5270 x1 : 0000000000000000 x0 : 0000000000000000
[   30.122453] Call trace:
[   30.124898]  mxc_isi_crossbar_xlate_streams+0xb0/0x10c
[   30.130038]  mxc_isi_crossbar_enable_streams+0x44/0x16c
[   30.135263]  v4l2_subdev_enable_streams.part.0+0x130/0x2ac
[   30.140750]  v4l2_subdev_enable_streams+0x48/0x68
[   30.145454]  mxc_isi_pipe_enable+0x1d4/0x24c
ed 0 (Success)
		[V  I D3I0O.C149725]  mxc_isi_vb2_start_streaming+0xa0/0xe4
[   30.156596]  vb2_start_streaming+0x6c/0x180
[   30.160782]  vb2_core_streamon+0x100/0x1c4
[   30.164880]  vb2_streamon+0x18/0x64
[   30.168369]  mxc_isi_video_streamon+0x284/0x2f4
[   30.172901]  v4l_streamon+0x24/0x30
[   30.176391]  __video_do_ioctl+0x15c/0x3c0
[   30.180402]  video_usercopy+0x1a4/0x67c
[   30.184240]  video_ioctl2+0x18/0x24
[   30.187732]  v4l2_ioctl+0x40/0x60
[   30.191047]  __arm64_sys_ioctl+0xac/0xf0
[   30.194972]  invoke_syscall+0x48/0x110
[   30.198726]  el0_svc_common.constprop.0+0x40/0xe0
[   30.203431]  do_el0_svc+0x1c/0x28
[   30.206747]  el0_svc+0x30/0xd0
[   30.209806]  el0t_64_sync_handler+0x100/0x12c
[   30.214164]  el0t_64_sync+0x190/0x194
[   30.217830] Code: 937a7f00 8b000020 97fec7a3 aa0003e1 (f9401000)
[   30.223923] ---[ end trace 0000000000000000 ]---
_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)
		VIDIOC_QBUF returned 0 (Success)

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
---

the real problem
================
Obviously "broken pipe" for "stream on" is still not what I want :)

The "no enabled link has been found" seems to happen during "VIDIOC_QBUF".

Does anything come to mind what goes wrong here for me?

thanks a lot for having a look,

                                      martin




 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd173..e53a8e01c8be1 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -160,6 +160,11 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_crossbar *xbar,
 	}
 
 	pad = media_pad_remote_pad_first(&xbar->pads[sink_pad]);
+	if (!pad) {
+		dev_warn(xbar->isi->dev, "no enabled link has been found.\n");
+		return ERR_PTR(-EPIPE);
+	}
+
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 	if (!sd) {
 		dev_dbg(xbar->isi->dev,
-- 
2.39.5


