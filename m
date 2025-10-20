Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DF7CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tP0iOofRiT2pe+1BKA5B3cCMl1RLSxdbVBxvmXCilKg=; b=kHVUCSFbkKjUiO5oHSGHjm4Ye1
	8kVTpWtJXHOwXbsJqjqH9X2paQjIJSYxIp0xrJPihvB2oNVGhZJC7wbxPG8znftX+vxxoE2Q16/4Q
	OnSdlbrjwuKG9/QHH4d6pqwY/HIcisOReQ2jdpfHe4AZSB0sWBWwFVHGNBTNmicUiNiPzGUWfkyLe
	J7jjsfseE8IbwJjQ7c2/lWHfuu2nMdbxqBQpeWSVVQkqy7zlLwnY8DUi36/CKZgfU2KMNfsOVKB4x
	KAdtOrgV4rPUpUWAimTbeSCDoLs30YYWBJq1whmQwi2R16D6rUei2/blMU/5XgA35FDWLXRCkUmYq
	fmEXrQdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAml7-0000000Cj3h-27na;
	Mon, 20 Oct 2025 10:04:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmkk-0000000Cib7-1Kyd;
	Mon, 20 Oct 2025 10:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954671;
	bh=LtNMw27Mt4P/xIk8X58zhfmW/Kpfb3u6BFl+S4hGtOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dcUcu3EHnYluDoVoXcR9F7BHxyUnteEIvpDOxMvihLuRILQvJt1kaOtpbok9FeVnv
	 ydt+vSbxyfDeKJIE5380rO0PKXLIsUl5Il4T5BpncFm9JbqQFaAM5dfiD4Mbqbu7FK
	 fExDvjYCnmsAbqBf4a7URIuSdtiEX7tfC+hMg7X18itkESzk9TovchiewMukgHcevh
	 dJz02idY9Yt0KOgFcJgX/65eRndXReihVKMYaBQRRERf5aFkHfPQCg5byFqovQaVAJ
	 jdjb/VU7J/IXjT5s4Y5aPx/dO18lDsmtndNjhoQPAcRg9IV1XRN11wE143NK1CpX35
	 7u0S/BUa4RRrw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E7C7517E0FAD;
	Mon, 20 Oct 2025 12:04:30 +0200 (CEST)
Message-ID: <e28e45ee-db95-4c32-b2e8-16849670eaf8@collabora.com>
Date: Mon, 20 Oct 2025 12:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/20] media: platform: mtk-mdp3: Change
 cmdq_pkt_jump_rel() to cmdq_pkt_jump_rel_temp()
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
 <20251017065028.1676930-16-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-16-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030434_535622_6B565059 
X-CRM114-Status: UNSURE (   7.47  )
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
> To facilitate the removal of the shift_pa parameter from
> cmdq_pkt_jump_rel(), current users of cmdq_pkt_jump_rel() need to
> transition to using cmdq_pkt_jump_rel_temp() before the API change
> is implemented.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



