Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A11C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 23:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nlmmq2d0QvJ5WscW4ch7Y8eUJLzw3S8VyL4J0bxbRqo=; b=l6W/WYNaopacubSWTDZBbTrw/a
	J3nPF0BXgrPNqnV0Az5ziWF98O3dTmbVEgApmYHMp56/DQymt5m7XK3wXKxtYiUYpsptvKumHcU2w
	uqNKp5WYjcXeQz86eM1S1ittdNlvoE3SGs3D8rp3BvskjyJpptGJuHIQqKlbT/cyRPn0/C7sRQxKS
	E6BLS58dZuZqTFYdd5PApybn+7ZngphkZgcyGgu3RbWuMTeM7vAP7h5ijVBp2tGZttLD+Gpb/51Rw
	3ZH8CD3SceJ1mNnItYFSyYWw1vmlsRcE9JfnIvQ+cwqAgKovkD3xAjgjpo/vdV40gKkHA+WZPSdhv
	6aGG+boA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u86CC-0000000FZFL-3jhN;
	Thu, 24 Apr 2025 23:41:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u86AO-0000000FZ8G-0BXE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 23:39:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB4D9339;
	Thu, 24 Apr 2025 16:39:33 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD4C23F59E;
	Thu, 24 Apr 2025 16:39:37 -0700 (PDT)
Date: Fri, 25 Apr 2025 00:38:36 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 arnd@arndb.de, hdegoede@redhat.com, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: soc: sunxi: Fix possible null pointer
 dereference
Message-ID: <20250425003836.74f068da@minigeek.lan>
In-Reply-To: <20250412165700.2298733-1-chenyuan0y@gmail.com>
References: <20250412165700.2298733-1-chenyuan0y@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_163940_129551_ADB33946 
X-CRM114-Status: GOOD (  15.28  )
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

On Sat, 12 Apr 2025 11:57:00 -0500
Chenyuan Yang <chenyuan0y@gmail.com> wrote:

> of_get_address() may return NULL which is later dereferenced.
> Fix this bug by adding NULL check
> 
> This is similar to the commit c534b63bede6
> ("drm: vc4: Fix possible null pointer dereference").
> 
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> Fixes: 4af34b572a85 ("drivers: soc: sunxi: Introduce SoC driver to map SRAMs")

That fix looks alright, indeed of_get_address() returns NULL if the
slightest bit in the property is not as expected, and we should check
for that.

I am just wondering if we should issue a firmware warning in this case,
instead of just silently skipping an entry.

Cheers,
Andre

> ---
>  drivers/soc/sunxi/sunxi_sram.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
> index 2781a091a6a6..1853dcc806ea 100644
> --- a/drivers/soc/sunxi/sunxi_sram.c
> +++ b/drivers/soc/sunxi/sunxi_sram.c
> @@ -122,6 +122,8 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
>  			continue;
>  
>  		sram_addr_p = of_get_address(sram_node, 0, NULL, NULL);
> +		if (!sram_addr_p)
> +			continue;
>  
>  		seq_printf(s, "sram@%08x\n",
>  			   be32_to_cpu(*sram_addr_p));
> @@ -134,6 +136,8 @@ static int sunxi_sram_show(struct seq_file *s, void *data)
>  
>  			section_addr_p = of_get_address(section_node, 0,
>  							NULL, NULL);
> +			if (!section_addr_p)
> +				continue;
>  
>  			seq_printf(s, "\tsection@%04x\t(%s)\n",
>  				   be32_to_cpu(*section_addr_p),


