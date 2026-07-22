Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AF6C4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1T255FBAVRpsE3tq9z/FW5Ond2TyHbYpvN4C1oqBhzE=; b=OIZLbbpd+XSk3S/juiKbntnE9P
	f32UvsvsfNP78dg4sUJUzaJuZMcIo9iPAglYVgXl1CXN4tR+8dHSL1A2aUzLh2Ih77YUGbbyJ6T13
	jFt1pWUc4J6u+lCY9SykJ3YE4RqTzeRCunzgfEVMjTECdT92bB+XJCR5iZyLrCtToDB4lP85/alfd
	AFxrdPExytchj3J2j9GTOgy8mbXRJLVh4almgrBeHCCZooPzrZLbffS7M2elvPSN22zBVQE/h9A2/
	STpCF+AxLoZRjSe7RUKQHFIj/vsX/VD0FugTU0lCXBE76R1K7dejgtgwQOaDpa2cFvZtA4A5Ty6zv
	zOBLFpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXyl-0000000C2PC-0mRU;
	Wed, 22 Jul 2026 14:31:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXyh-0000000C2OL-2ggb;
	Wed, 22 Jul 2026 14:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784730676;
	bh=Xy3tAVt5E7mi3XkBjs6KrEBelylsYHGiFrUqKz9Q8DQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WmTjGMWk9WtTkZLaRbY+SYDd9kDvymiWfkBTTg0DaReP6qlQWDho8rQo6cjQnW8s2
	 firq1bdfIvJYJcR82j3j/KGHxRKRvr2rfQ/yks/wXPHbazcn3vKQsDMuZp0/BuQpIk
	 REkG+DUjS33EryikB2yy5zARTD/e7pirB4kE6k4AZ/DZYnCSC1Svmjy4KwUyZJgnMv
	 sQ8UtcfR0rgqJrLbRAbAEZhtODn5i917tWCgG+rO12GGGA7ASQwIItT9/YnvzST1Y1
	 no+kl2yZpfEqAyqU++1ZFr8LYVunH9D13TzWjhEs5OeVHAyNBNzEPI0q02y1Q32Ksj
	 G0tGfjf46lOmg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 44AB317E023C;
	Wed, 22 Jul 2026 16:31:16 +0200 (CEST)
Message-ID: <84149703-21aa-4432-87e0-eeab49e0fa24@collabora.com>
Date: Wed, 22 Jul 2026 16:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_073120_159433_02061CD1 
X-CRM114-Status: GOOD (  12.67  )
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

On 7/22/26 15:27, Dmitry Osipenko wrote:
> Depending on firmware, part of the MFG domains may be left ON at boot
> leaving only some MFG cores powered, to let the ACP to prefetch the GPU
> region when the display controller is brought up. This doesn't play well
> with an eventual delay in probing Panfrost when the display controller is
> fully set up, as that would make genpd's sync_state() to power off the
> domain while ACP tries to prefetch: this is causing an AXI stall,
> effectively freezing the AP indefinitely. In order to prevent this from
> happening, the sync_state() functionality must be obliterated on all of
> the MFG domains: while this guarantees a power leakage if the bootloader
> boots the kernel with MFG PDs partially powered on, this is the only way
> to ensure stable operation of the SoC during boot on devices with such
> firmware because, of course, those will never officially receive a
> firmware update.
> 
> Fixes Kappa Chromebook hanging during system boot.
> 
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


