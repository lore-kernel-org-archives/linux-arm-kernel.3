Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA1CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zc+9+hTIs1OZSxLrflx1dy+rP5rwK/Pg8JKVK5p11BU=; b=J6ckfGc3lzHrQNbNL4Wi1hXfBt
	aBdlWpOf4WLzBMv+bHDEOJbGTNl3CYE1iKlv0+S/QJCbN4BxOY+F6bZNNI3UXQyp5hrUOdPQWzr+9
	NUIEF9mM5Tx+NIlF8DySaQRQJzrN0Uc+ZBJtnd1uV7agF5sajtC9wosOXC6iQ3wlnKwQmFTqv/8WB
	7P+mvU5eOZKqqejWpZaQYfLR/srXFcpZgtXaNiCZdFlo11iyXWVor0Zbwsx7+vpqQ+NtbXIQ8jqJW
	5Ha/LpjaqxuW9ey6z0YXfqFI0jWz65Qvpd3pnB3j4YFpbjcw79hJt71A2UIiPi8FxxHK/TUtBa0ez
	UlDMzsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZbD-0000000DMO9-3HDx;
	Wed, 05 Nov 2025 09:14:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZbA-0000000DMNc-36cl;
	Wed, 05 Nov 2025 09:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762334073;
	bh=qWtgovMFKiTMTHDBfS7Kxt4dQ9VFI2F4oQIKhJkL1jY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z//sTn5cgHw750Qw6GxY5XREnvUNETEmFkS3svN8Y+59h7+pZt88kiAHz/G47pffY
	 QWaL2k7AHtjnpXrcMuvUJqv1R2UfglFDV0dt7hIV43tH2gG/gmimBSOhOYSf1rhc4D
	 dR065+SV4njc+oxNiFXJ8noBKGMa0MWKU/IO+E4/0VN23bslViMB7F4DT2pR7ETsyk
	 mJOD9Tvt8Ypt4kfd1WeubJp/2wjUTpX3cq2+JFCe3yKG8JztHPrn5IOOjw0Aaq9Onb
	 vxUjSm7DB7XyxM9sLF2A+aMrod/lsSZGURl17/u7pyApgFa9CJKTOtX5AoJPeI+1jL
	 IZUUIETtm/gSg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2B6A17E128C;
	Wed,  5 Nov 2025 10:14:32 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, 
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
 Xiandong Wang <xiandong.wang@mediatek.com>, 
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
 Chen-yu Tsai <wenst@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
In-Reply-To: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
References: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
Subject: Re: (subset) [PATCH 0/9] Add GCE support for MT8196 (series 1/4)
Message-Id: <176233407273.17051.14832672768529226895.b4-ty@collabora.com>
Date: Wed, 05 Nov 2025 10:14:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_011436_963661_E3CFDEE6 
X-CRM114-Status: UNSURE (   9.08  )
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

On Fri, 31 Oct 2025 23:56:28 +0800, Jason-JH Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
> 
> This series adds initial support for the MediaTek MT8196 GCE in the CMDQ
> driver, including related API changes for new hardware requirements.
> 
> Series application order:
>   1. [Fixes] Refine DMA address handling for the command buffer
>   - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
>   2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs (this series)
>   3. [Series 2/4] Migrate subsystems to new CMDQ APIs
>   4. [Series 3/4] Remove shift_pa from CMDQ jump functions
>   5. [Series 4/4] Remove deprecated CMDQ APIs
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[1/9] arm64: dts: mediatek: Add GCE header for MT8196
      commit: 355531a5ffd9e26f4d87ab34015c679e32d60e3c

Cheers,
Angelo



