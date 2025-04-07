Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5242AC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 13:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFIP6XDPaujD0AY1TmOKkalJoLKXh2kY2KwYTgo5wRE=; b=NiYTSKLdS/25ink3D719BTIBGm
	CKpakaLWrACHCJvJH79ALzUFmC/tNABUiyN5YwgUYxnYRLH7M6F7Fusg8mn6pgjMUMkpU9JMCK1XY
	vN7O1NqeZr3B6efCDX4WbJbpwAQy/HMPjs5BWaakq0w272RB9RD0zC41rzWbpAu3MvV8UfgS+Jr1N
	G8SGHpM0QRbQeZ+Vg9c+k4prJAQ00SSP+CezsMZz6BwHYKgViaKJLiqpB6ooGJLWH2zXE2sokX0PB
	R1i+MgbJQkm6sxdT2RRimyCA6wJo5MB6Z9XRYJLiYBi1+BVIjwQYTdRkkLNekgqTfYxOW12BrDcmP
	u25NHXLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mSB-00000000URW-0Dei;
	Mon, 07 Apr 2025 13:23:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mQQ-00000000U0n-0AqT;
	Mon, 07 Apr 2025 13:22:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 87396A485DE;
	Mon,  7 Apr 2025 13:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0E6AC4CEE7;
	Mon,  7 Apr 2025 13:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744032124;
	bh=JaSD1slroXG8EfiX5HR0eSyQaxOR5hoY6v6GGmonORU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1KQEh8RWl7GMy1SAP0XKZi/pgV8Cg6mxJVtZt8juDl3uknq8f0P7G5VKbmR5rKBv
	 hIXPGqp5mmGjqr+B9+f87Yg/8dSGqde5HvQnlkTpMo5+xhQk1sf/YvZvct53zt+9zn
	 WeP/+SV/ShRDtxj+7MaP+yoK/BI1ftms/po5VSJSLJIzDXtddagqWYqHwSLy9f3iBW
	 xfxrmr+waXw5Py4N1sC4qiaBC1G/u6av+rF9g2UcHiTy6ZU1Mirh3L4n/ISCQBxmF2
	 CWOWQX7e22rja/jYhZYZHLAGe62pTyF14Sn0LRGhu/iDIZik+TE+6G5GvqX+OAAwvA
	 L4znjFY5GEpBw==
Date: Mon, 7 Apr 2025 15:21:59 +0200
From: Christian Brauner <brauner@kernel.org>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, eperezma@redhat.com, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, benliang.zhao@mediatek.com, bin.zhang@mediatek.com
Subject: Re: [RESEND] virtiofs: add filesystem context source name check
Message-ID: <20250407-handgefertigt-duzen-d92bfc181937@brauner>
References: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_062206_204921_26E4A9EA 
X-CRM114-Status: GOOD (  17.31  )
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

On Mon, Apr 07, 2025 at 07:50:49PM +0800, Xiangsheng Hou wrote:
> In certain scenarios, for example, during fuzz testing, the source
> name may be NULL, which could lead to a kernel panic. Therefore, an
> extra check for the source name should be added.

Oha, that's not great and easily reproducible:

[13344.588906] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN
[13344.602350] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
[13344.610367] CPU: 8 UID: 0 PID: 1427 Comm: anon_inode_test Not tainted 6.15.0-rc1-gb96146cd957f #21 PREEMPT(undef)
[13344.617410] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009)/Incus, BIOS unknown 2/2/2022
[13344.621368] RIP: 0010:strcmp+0x5b/0xb0
[13344.624462] Code: fa 48 c1 e8 03 83 e2 07 42 0f b6 04 28 38 d0 7f 04 84 c0 75 50 48 89 f0 48 89 f2 0f b6 6b ff 4c 8d 66 01 48 c1 e8 03 83 e2 07 <42> 0f b6 04 28 38 d0 7f 04 84 c0 75 24 41 3a 6c 24 ff 74 ae 19 c0
[13344.635506] RSP: 0018:ffffc900050dfd28 EFLAGS: 00010246
[13344.638112] RAX: 0000000000000000 RBX: ffff8881918158a9 RCX: fffff52000a1bf86
[13344.640726] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8881918158a8
[13344.643279] RBP: 0000000000000069 R08: 0000000000000000 R09: fffffbfff2aa7c82
[13344.646722] R10: ffffc900050dfd58 R11: 0000000000000000 R12: 0000000000000001
[13344.648844] R13: dffffc0000000000 R14: ffff8881e2110ce0 R15: dffffc0000000000
[13344.651382] FS:  00007f891cf53740(0000) GS:ffff88843fd42000(0000) knlGS:0000000000000000
[13344.654257] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[13344.656296] CR2: 000055dfec6997d8 CR3: 00000001cbf21006 CR4: 0000000000770ef0
[13344.658863] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[13344.661325] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[13344.662722] PKRU: 55555554
[13344.663266] Call Trace:
[13344.663776]  <TASK>
[13344.664303]  virtio_fs_get_tree+0xc4/0x1060
[13344.665237]  ? rcu_is_watching+0x12/0xb0
[13344.666047]  ? cap_capable+0x170/0x320
[13344.666802]  vfs_get_tree+0x87/0x2f0
[13344.667540]  vfs_cmd_create+0xb2/0x240
[13344.668317]  __x64_sys_fsconfig+0x629/0x9f0
[13344.669143]  ? vfs_cmd_create+0x240/0x240
[13344.669956]  ? rcu_is_watching+0x12/0xb0
[13344.670738]  ? syscall_trace_enter+0x129/0x230
[13344.671617]  do_syscall_64+0x74/0x190
[13344.672354]  entry_SYSCALL_64_after_hwframe+0x4b/0x53

This needs to be backported to all LTS kernels.

> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>  fs/fuse/virtio_fs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index 2c7b24cb67ad..53c2626e90e7 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -1669,6 +1669,9 @@ static int virtio_fs_get_tree(struct fs_context *fsc)
>  	unsigned int virtqueue_size;
>  	int err = -EIO;
>  
> +	if (!fsc->source)
> +		return invalf(fsc, "No source specified");
> +
>  	/* This gets a reference on virtio_fs object. This ptr gets installed
>  	 * in fc->iq->priv. Once fuse_conn is going away, it calls ->put()
>  	 * to drop the reference to this object.
> -- 
> 2.46.0
> 

