Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33704C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1VczZASN1ju/PtlN0YK6ARHb5nxIHPBkAIF3+xzank=; b=U0qkbBC0uaqpMk7SzHWjWc17JK
	SImipgaSg9wfP5NkXjNi+jL1N3EeXslND2uYnGW6Vx2rLAGcarcQH/U/Y/4MmwztN5uHotAwQLuVG
	f3dT4ja9mfcwxWCPsKUUrd4Q8DdYaRm0+OHcMDonLIuSRI0FMIBkqTdiBakfIqkM7sKXcgZOWVyir
	gGHCFYmqcKGBb3RiPLHUoVwEQ7Dog5fsa5T3t59jQJh4vqwM3OmOZAHO1Fn7h8NG13Ub7NL7MGAEW
	wtOiMjJCfba9wfdnRhs7qQ/fxKbtm/SNWz2Rxx0Z/hojFH5XlFjFGjN1cJTYCxJaUmxhwPhQ71nVC
	0LN9jrNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6Ek-00000001pCV-0HZw;
	Mon, 17 Mar 2025 08:54:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu6Ak-00000001oGd-0KPD;
	Mon, 17 Mar 2025 08:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742201407;
	bh=WUiRsmcXf/5mpOBvUvpB9sSawrbuJ+mi9kvDgMHpCz4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VhdM3Sgy+M9TR4PPkjJ+jOpE7S79oBu32SNg0SksjR13gt9lNt1AeP68lupTSkOwx
	 xAdcorLe6RRO7Ip1w8/aSlFynrlfZDVLPNxGA9XpbGw7r7WYu9dN4rzXLs0RDZlPyL
	 LsrJoXr0hTqEYaGKb7NbG0gHgVi1WwLN1r//y2xNABVZcahZNd1Mm4FzGWKS/7eik5
	 KxkGLycxmXQsvXZgBCwV38qwlzeZRnCIaNYjBo5qxei99gOp8UHapemXJ3J7dBunAw
	 QKL5Wv5GFrNB15v+v4GXEYCK3p1IiL6PVii5b4sOBbAnHPn3wGJaEl7EcgdwOoZ9b8
	 1OgWfjcFzzsfA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 064F217E0848;
	Mon, 17 Mar 2025 09:50:06 +0100 (CET)
Message-ID: <0cd19f91-2726-419c-ba92-fdb8e7a38377@collabora.com>
Date: Mon, 17 Mar 2025 09:50:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/panfrost: Force AARCH64_4K page table format
 on MediaTek MT8192
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sjoerd@collabora.com
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
 <20250314173858.212264-7-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250314173858.212264-7-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_015010_261562_17F2CA89 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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

Il 14/03/25 18:38, Ariel D'Alessandro ha scritto:
> MediaTek MT8192 SoC has an ARM Mali-G57 MC5 GPU (Valhall-JM). Now that
> Panfrost supports AARCH64_4K page table format, let's enable it on this
> SoC.
> 
> Running glmark2-es2-drm [0] benchmark, reported the same performance
> score on both modes Mali LPAE (LEGACY) vs. AARCH64_4K, before and after
> this commit. Tested on a Mediatek (MT8395) Genio 1200 EVK board.
> 
> [0] https://github.com/glmark2/glmark2
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



