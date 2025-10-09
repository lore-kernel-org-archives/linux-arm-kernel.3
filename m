Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778EFCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KH6EA01iNoWWQLdys6bhNpHe2bNXOlNbpESaQ8UscPw=; b=TljQgqPm0xzwlik9mnZUKv29W4
	G3L3w3xDM//1+zmOvTBpjwDvXCyGMHT7sy5OA7qWpsH/zUIL5mmpX1MT90QZTaqcjfuX9eVeNuxSh
	lfz3uADFOqAvQy+8mdmVvsPj55lWWiNsZ4VIDjKl78diHYFG+9Ixjgmg2eR3OsZxvvVnzkSTFrrvk
	JNazMHrEePZa6yF0Cvy7Y2iAXP0YNoh+pxQ4Vfyst+LnPeLII1Dp10FDcVrYzL9uw3IA2Bqgx0mPp
	+ufjtF//E7REPxj7n02sXea9x2bpGtFM2UAKOqBtXz332Ue40uOxgC7NS8rFIGy0xlzD1euliVlAy
	7vJridgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pGI-000000062ed-2XlW;
	Thu, 09 Oct 2025 11:56:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pGG-000000062dH-11cs;
	Thu, 09 Oct 2025 11:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760011002;
	bh=GCdo2WRMgThuwdhdaxtmNPngX0ETlYCYQ7iuLMzkZt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CmhDm10oocxKkaF5tmsjNvE52BrCVUfY7m30lN8iDm/aVW6yLyk8S1fhLyy9JJ//o
	 lG0OcN2d0Z2SWsBUAI3OhbZXzKXhfR1yZcmyvHpZzUL6pTFpJfFuIh4XnSaab5jd8B
	 o0N9PVKK0WHJAcGZ/8dxQ3XfceDixM5FEzlZW05IATAEtz1pQT5b1UI9+OdKH3d35n
	 PnWEquwvVQmvNo7qyjKcaJ/9B+VTxIAVwzLTtq7/Qsbl4/WQnklBP9buv+0imB3nYw
	 JI9zcHMU6Gzh7EVV/ISC+9s/fRIs50+wXg36F+NQ3IxHGdjohcrHAP+Gsb4lt7x8Lb
	 Ejw8718SW052g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6940117E0125;
	Thu,  9 Oct 2025 13:56:41 +0200 (CEST)
Message-ID: <dc04ae37-7707-4d32-8b01-f4804cd0cd90@collabora.com>
Date: Thu, 9 Oct 2025 13:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/20] soc: mediatek: mtk-cmdq: Add mminfra_offset
 adjustment for DRAM addresses
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
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-12-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-12-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_045644_446641_10B0A8B3 
X-CRM114-Status: UNSURE (   8.40  )
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

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> Since GCE has been moved to MMINFRA in MT8196, all transactions from
> MMINFRA to DRAM will have their addresses adjusted by subtracting a
> mminfra_offset.
> 
> Therefore, the CMDQ helper driver needs to get the mminfra_offset value
> of the SoC from cmdq_mbox_priv of cmdq_pkt and then add it to the DRAM
> address when generating instructions to ensure GCE accesses the correct
> DRAM address. CMDQ users can then call CMDQ helper APIs as usual.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



