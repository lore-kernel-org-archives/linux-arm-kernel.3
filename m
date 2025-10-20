Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF04CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CD/LIh7PvgqcCrkwDpGD9B7oZ/NQsooPSvaEIwUCNfc=; b=tHn2bvNUuCk9rSZZkYUHlUuUpo
	7fc7KlPxH/3vPVpxabfaTnAI5/00cdS1f830Xujr3/zFLJi10yYhqS2De0WBbWQJ+Zl7p3x4H2JOP
	k8QWYu5sxgruYQrO24YITzDVFqM/FM9DFQtV/yAtXoz1VuKNyZIGUeVGJpjoPrN6zr0QKQe8lp+gI
	qIcmy3hPiqJjYyNEe3Xtj50uUyDF/KVd7PAXq2T8xhXveJL2fdI584OuX4Yq8WjVprlvyTgFjRy5O
	2N/YSqybN5VjX1tnmgaPDASyZFYOz8dsSeydsgn5K0nb2NakxTTQB/dXZq1kxG7wjbBVsufH8SBQv
	ivM53Qeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAml1-0000000Ciyd-2b2f;
	Mon, 20 Oct 2025 10:04:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmkm-0000000Ciec-37Gp;
	Mon, 20 Oct 2025 10:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954673;
	bh=h3N0Gm87ALyNcMBnk14h1KKNXe9sbhc0PNDBK6yXbfU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UZpHQW33ZW2yMdrw+jf9iIk/dEEIrtba/DdToyFk+k5pA+T78Z/DdZQAHjTbGoJX5
	 YttNV59CQ1DBx10iPVo+BaVOKjXQ7Vc2WUPRxPQxkhwKTOsQRBEImPfb1NKxvvVI+t
	 jgTHaf/Wg1UYDlfBp3cZyhlbxVp7hNPp6KinhjUVmL0a9/Awts4aVRvpjJq+S92YuR
	 1M135gTH7zV75y/WKxrYQ+evqiLqm0XZPx3mdrOo2C5jHsdz/C5DDrfHZtFiGjR9+a
	 Q0irX2k8l3ES8/gySgnuN8yccLqR8GkPiec1CreRONBzl0HPQCeLX7esVrL1fcF28t
	 6pn1zf97lIiRA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 731F217E108C;
	Mon, 20 Oct 2025 12:04:32 +0200 (CEST)
Message-ID: <9258e1ca-56b2-4fb6-bf17-40c86b8c05b6@collabora.com>
Date: Mon, 20 Oct 2025 12:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/20] media: platform: mtk-mdp3: Refactor CMDQ writes
 for CMDQ API change
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-15-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-15-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030436_944890_CE770933 
X-CRM114-Status: UNSURE (   7.71  )
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

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Update CMDQ register writes to use subsys-aware APIs,
> cmdq_pkt_write_subsys() and cmdq_pkt_write_mask_subsys().
> This conforms to recent CMDQ API changes that split access by
> subsys ID support.
> 
> Since all current MDP SoCs support subsys ID, and future MDP
> deployments will not run on SoCs without subsys ID, only
> subsys-specific API calls are needed. No logic for non-subsys ID
> hardware is required.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



