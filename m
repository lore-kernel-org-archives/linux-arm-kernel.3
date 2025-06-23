Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826BCC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 11:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcYwGv9iqkIeMCeWEP9899KFqJJduWiTFH4yvJ1CV6w=; b=kyYVt/bhzvYwsNmoXvPJwHRHrG
	JWg3wocrSXs9gAhEpBzpUP2AVhcVvST+O082vWm1auVHKiLIQqL+5/qTKk6jmUhOdstGx/Qr4XI8V
	UNq/TswbFqDnDmjJhzOhS6rCmQ+oWhU9/WwARRZchmHZbP2eK6OWDczK4BAHocNk9YFMa3Oy/gLHb
	rE/zCK/XZQ1vJN2U6pLotd9R4CN9+ewgpGP0a/CLRllCyHk0AvDaYAUEAbIxkOMGjD6v+v3pzJVlx
	G+bq6KhRSAObTyEUqmWcENiM9hp8Vmp+9DzN92dGea9yNnu2mcZ1Sq1SRmfei1kSAb77E61THRA5J
	KQ8X26PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfDt-00000002UdX-3IuZ;
	Mon, 23 Jun 2025 11:20:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdaa-00000002CBJ-0UBI;
	Mon, 23 Jun 2025 09:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750671342;
	bh=Elxj9GYOHcazH6V54iHsSYqjb7QlABuqYV7BQAi2XqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GL4UZv5fAgtltu9INSScSxlnP6N1thlBP+S+R0Bx2trCWoveWDVAV237v9mAfKNva
	 b8ET1c0wfamymcQqANzW3lkP3i/dBC2jqwNPJuLOkuKFxiySu5jiGhpoOhxpN76h3M
	 i92jKI8dWuHpPIMChTxtUe7tQW5ldy2iN0rT3nBEWkf1SYJ7HSDnfQiklbb8Ub2xR+
	 V6VOUFSmSHbLtlfdtzfiXg2/8NhtiIUhvj7mkJRANXfjipggtRiZGHYK0GtwCeNcTQ
	 43i8oX9U5eOkl1HCytszbqTFshL1UyaAO2p5vxpZverOTIbLekxqswajBRP9ejnsoa
	 ZppUcarbyXj1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A339217E090E;
	Mon, 23 Jun 2025 11:35:41 +0200 (CEST)
Message-ID: <75d0fe76-2fa3-4ffc-920e-a6a49f428036@collabora.com>
Date: Mon, 23 Jun 2025 11:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mtk-mutex: Fix confusing usage of
 MUTEX_MOD2
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Zhenxing Qin <zhenxing.qin@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>,
 Jarried Lin <jarried.lin@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250620024305.2303935-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620024305.2303935-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_023544_305984_89630DF1 
X-CRM114-Status: GOOD (  11.51  )
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

Il 20/06/25 04:40, Jason-JH Lin ha scritto:
> The usage of MUTEX_MOD1 and MUTEX_MOD2 for calculating mod settings
> over 32 has been confusing. To improve consistency and clarity, these
> defines need to fit into the same MUTEX_MOD define as possible.
> 
> However, MUTEX_MOD1 cannot be directly used for all SoCs because,
> for example, the mod1 register (0x34) of MT2712 is not adjacent to
> its mod0 register (0x2c). To address this, a `mutex_mod1_reg` field
> is introduced in the mutex driver data structure. This allows all
> SoCs to use a unified MUTEX_MOD to determine their register offsets.
> 
> With this change, the separate usage of MUTEX_MOD1 and MUTEX_MOD2 is
> eliminated, simplifying the logic for obtaining offsets and mod IDs.

Yeah, okay, that makes sense, but...

> 
> Fixes: e1e4f7fea375 ("soc / drm: mediatek: Move mtk mutex driver to soc folder")

...this is an improvement, it's not a fix, so please drop the Fixes tag.

> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



