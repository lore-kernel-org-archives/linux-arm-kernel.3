Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F06C47BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb4VHzcBBEVV/nkZ9gO8H0W8mrhm5Q0+rtZI3EvIfac=; b=PPpj/DuCzv2n18g8rpbpp5hbQL
	dmxr+YFLQjBeVvAc4mSgai5e8SjQGMwKZdmyRDtZlGvRBzEJwXccvGMuiiom+xvLumdPUrGX3H68Q
	KtgpWkU9yjsqYxc9hBxXGPLoehxR0sI7GP/5zlVfBylHCeIbzsLDPdc5FAK7QMcd5ppPtdSJlJb6C
	IrEQK0D5YO0N0PrJdZH6SgR1m04r2N/zNU9vRPLNQwVDeJamnxYe15wonj0itqpixmqoJP+Jwqw2z
	vTSV5dHGxI3A6OCZyDkG/Utcs5CkYPETa7VZF7pcd911e5sOHv56TzYtwANW8iLxK0R8WjbO+9z8V
	TI6ksTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3tB-0000000Ckmj-3axp;
	Tue, 06 Jan 2026 10:02:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd3t6-0000000CklZ-41zG;
	Tue, 06 Jan 2026 10:02:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28B1543E36;
	Tue,  6 Jan 2026 10:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B692C116C6;
	Tue,  6 Jan 2026 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767693724;
	bh=j1gUdKmv3XuJj6LFBGkTEJLtEAa3uiiwtVctcrQmZ2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHg35A2cTOmiu4D+xyXdaYjYdPwenE7p5dv5Z/wEeSS5MhiimugcUswAmK5dhUeQP
	 iaSFiG3xHl1nc6FAk2J31iBlehdnYPZPLwlbFnaCOmbnEHgEXjnQwewAgJBlII0KdO
	 SHaaRDACENjSgKg7SNYisEtDJC+N/U6xeyQ7xhjM=
Date: Tue, 6 Jan 2026 11:02:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: jirislaby@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, fred2599@gmail.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Digits_Upstream_Group@mediatek.com,
	liguo.zhang@mediatek.com, Vasanth.Reddy@mediatek.com,
	Yenchia Chen <yenchia.chen@mediatek.com>
Subject: Re: [PATCH] MEDIATEK: serial: 8250_mtk: Add ACPI support
Message-ID: <2026010643-ladybug-tiring-7f3c@gregkh>
References: <20260105024103.2027085-1-zhiyong.tao@mediatek.com>
 <20260105024103.2027085-2-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105024103.2027085-2-zhiyong.tao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_020205_157578_BA8C6BB8 
X-CRM114-Status: GOOD (  10.72  )
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

On Mon, Jan 05, 2026 at 10:39:55AM +0800, Zhiyong Tao wrote:
> From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>
> 
> Add ACPI support to 8250_mtk driver. This makes it possible to
> use UART on ARM-based desktops with EDK2 UEFI firmware.
> 
> Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
> Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
> ---
>  drivers/tty/serial/8250/8250_mtk.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)

This is a resend of the previous version, right?  Or did something
change?

confused,

greg k-h

