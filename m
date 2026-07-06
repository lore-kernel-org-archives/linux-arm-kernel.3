Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BEBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBcKvaitl6TGKL/fg12umkfFHChEJFVRuFuHd7Ccm5Y=; b=kLT3Tla20ywqDsaXyLaX3RBxIZ
	w8A+ywWfnRxAqR6S8n1RBnWL9Yprwdun6vBLlCl179zkesPqfN/QG75EJL8j/bWPGrJiK1vS4yiWX
	CPsClSFXh/2o5Gf0og9ANIfYaauHR0E9mODUHmULlU01hm2wdteqfLQotFo5CCLyhV/+UGO6XEMpU
	mK5xb5RHsI88nXAdsu364L8jkbXK9omiUO3pv/m3cl4xJ6m1XIaTDQHWfygmgUTqup0hFmx2TVlY4
	GzpCi0EPZChK79NmaaoWfBW2pHIY2JjEcrCcp4ILOTcVovIjbk7SzWeDblzMq7eDrIZVhgli2cWW8
	J8yhQqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgd9q-0000000Beq5-3rOe;
	Mon, 06 Jul 2026 06:50:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgd9p-0000000Bepo-1ANP;
	Mon, 06 Jul 2026 06:50:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B2E5661383;
	Mon,  6 Jul 2026 06:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E051F000E9;
	Mon,  6 Jul 2026 06:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320620;
	bh=MBcKvaitl6TGKL/fg12umkfFHChEJFVRuFuHd7Ccm5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=INOnzt4tSmE/dVljgT+XcA6lbhwyBP1xun90kstroUCflGF5BhkiCaHIWf90V0ERE
	 SpgABeN5sE8ZVwDCvMJm3gjPYN3MPdRIoIgqJb+ilBy0sF2JSEuA4rbU37vte0NAJN
	 XwzSKQ45QdF3c76tUCyK1IHxE0zv68FmmlGNsLUgztP4/hB5DQ/XYXKrRcVL9IrAr6
	 alUNpCJLlLmaUIgteZZqUuglxVMFgTPtGU5Cj4G8ZvBRWIfSKwGkfet3o1YGpdEi/E
	 HBnhLEhHiBok2FaYXLeI5PIQgKsF4UhsBGA44elzdUIpLH130SRvoJlaMsaacmtvL4
	 /k6oj4VzzBeFg==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wgd9l-00000001d97-3Qv5;
	Mon, 06 Jul 2026 08:50:17 +0200
Date: Mon, 6 Jul 2026 08:50:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: platform: mtk-mdp3: Fix SCP device refcounting
Message-ID: <aktQKf4QrsnUADdf@hovoldconsulting.com>
References: <20260704173119.254975-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704173119.254975-1-lgs201920130244@gmail.com>
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

On Sun, Jul 05, 2026 at 01:31:19AM +0800, Guangshuo Li wrote:
> mdp_probe() first tries to get the SCP handle with scp_get(). When that
> fails, it falls back to looking up the SCP platform device with
> __get_pdev_by_id() and then reads its driver data.
> 
> The fallback lookup returns the platform device with a reference, just
> like scp_get() does. However, the fallback path currently drops that
> reference immediately after platform_get_drvdata(). The driver later
> still calls scp_put(mdp->scp) unconditionally from the probe error path
> and from mdp_video_device_release(), which drops the SCP device
> reference again.
> 
> Keep the fallback reference until the existing scp_put() call, so that
> the fallback path follows the same ownership rules as the scp_get()
> path.

Thanks for catching that.
 
> Fixes: 8f6f3aa21517 ("media: platform: mtk-mdp3: fix device leaks at probe")

This one should also go to stable:

Cc: stable@vger.kernel.org

> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan

