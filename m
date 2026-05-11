Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458E3CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPyxbZ3AcCD75LMHae2uAmjEIPXHNYPin6mLYOVDV3w=; b=OIbnTKLU7/CS1gUIrmtc2vT+v4
	R/xLeqKDmL2uI8z16rTYcTilwj8G4k0QmyGUscZzMPIE7Kh8BiqFHEiUWVzfRW05vFVMYgM4irBvy
	0bTlREnly+SuTL0AIPQJjhXmsJwLEO7DCfYtTyVF6pmsPaZtysz8ZyF6q3fopWLovIJTG5Np3QgXo
	O/PhwXr4XcNG/ksna8Unr2ddzKbG5f7gt10mVt+NZcaiW383dAwRq2MUc1elvIQQ8ZP5f6eGh2vxU
	aPIMMQHU0Uj41zLhy4lYWK6NSX96pT1X5syYuZlbuc31CfmTXtKcMK4mFBblsf3ADpywW/W3BlAd3
	WTscKycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMrD-0000000Cu5M-1UzW;
	Mon, 11 May 2026 09:23:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMqz-0000000Ctsp-0p3I;
	Mon, 11 May 2026 09:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778491384;
	bh=z53vm2qhXxvQAfXzZc2lskc12FPIJfghOzT0pM/FsXg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b+sb6Rz8q5ernh10wlrWjcVxrJLoTmJjff0Me+riFzRlRcKE4mOqNAopZmXdd+IdQ
	 UkDdDVFNlCC022mlFV95pur9+/eJKEnspSTdWscj+6kn7oOqB6V7qnQ/Vh6+8IZaT0
	 SeQyJlHVHvf97wMw1LBLrHpR/+wf3+y0TjFAOIxlPkEIbUGFQ1WUEU9ObbxF+I1mSh
	 38taxprdieWSRekc4M2nI8nbfV422Re9vW+ycsmMj18/GYRkpG1yK9ubnihX1FjgK6
	 Zb0tgNpgFKCywxTNyDk8086qo+btK187Gmo06A+Gu7Vzy+7gCHE6OA9kS/o76g69dh
	 Irq0JLRmRlRfg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C58517E05FC;
	Mon, 11 May 2026 11:23:04 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, 
 Xiandong Wang <xiandong.wang@mediatek.com>, 
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
 Chen-yu Tsai <wenst@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org
In-Reply-To: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
References: <20260325035836.2110757-1-jason-jh.lin@mediatek.com>
Subject: Re: (subset) [PATCH v2 0/5] Migrate soc, drm-mediatek, mdp3 to new
 CMDQ APIs (series 2/4)
Message-Id: <177849138397.112419.16661288513842004996.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:23:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022309_433218_1C66C447 
X-CRM114-Status: UNSURE (   6.61  )
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

On Wed, 25 Mar 2026 11:57:37 +0800, Jason-JH Lin wrote:
> This series migrates the MediaTek SoC, DRM, and MDP3 drivers to the new
> CMDQ APIs introduced for MT8196.
> 
> Series application order:
>   1. [Series V2 2/4] Migrate subsystems to new CMDQ APIs (this series)
>   2. [Series V2 3/4] Remove shift_pa from CMDQ jump functions
>   3. [Series V2 4/4] Remove deprecated CMDQ APIs
> 
> [...]

Applied to v7.1-next/soc, thanks!

[1/5] soc: mediatek: Use pkt_write function pointer for subsys ID compatibility
      commit: 004361f01625fda9f6d4009d0dc5a59e32b7be7d
[2/5] soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing shift_pa
      commit: a4656aef98dd6f163c55063c36297d45912737f4

Cheers,
Angelo



