Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25611C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9mXwE9ODkBmpyguSH9LXsw4A0SfZeU6XVV0ENKKe0k=; b=O5BhCLN3U3YAO2awXqdF/DvDLK
	M4r8xsQizuJo5+3cSUdW2cIjjDNXrDMTA4r+GyGmZtflyTXhXqdNmUcKb3ax96GVYUkwYavpIj660
	EqSwwowYp8du/SYYhdLZ/ijaSiivvg7iAxWnCKdH9li/6xFwDI8/w95hkVaqOeHaR78boUDTBNMFw
	BJqBPhYDTklScRzQEIDz6a4OCZuHo0vg81HtoHzL3cTEu9OVwkhQ9qspIbW2LjFcPCqQ7Muu3n6V5
	Z1GY/qibCsHaVI+KKMKEfyMqlQ7PHFwCWIQJ4iqp8Q5qFm/MnAje3WNlBCqsUnwZ/hUOmsZgoK9on
	K+juGtYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJTF-000000087u8-0PF8;
	Wed, 12 Mar 2025 10:37:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJQZ-000000087Vo-1FIi;
	Wed, 12 Mar 2025 10:35:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741775705;
	bh=GAAKQGlAjAuFb7UCdS2YikzUcIS5KkMpOhjlyDoWf2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NkpHAdAK4bSBd/fK+25DC9Egq4jUa32E+759mAKcA6fomtUOkLF82BT1EPpm5AM4q
	 9LGB5GO1/tfBSEPlAKFD2J0u4mUoczY2yESMRW3Ole4kjrTrFFGn/UpDGIPT5O2w98
	 GcA1AB4LQMxvu6yDvEumnhavuFqFA/malEUxvTgdZ3ntUns2kuJ7r03+z+qdY9exjt
	 0Tlv9fSkYrXnV8tEhBrFBkHtnHtj1Ed3fWQz8edyykAxJMAbX9YXr9D8UzP40tux1o
	 C1ZrrMP6+Voa1uZmCTaZ0QAIuGynAZRQwqD34wUkWGUCX15l4XcSQXUlfQZ0PYhPtv
	 Wld+8PyfNM1nA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D1E717E1010;
	Wed, 12 Mar 2025 11:35:04 +0100 (CET)
Message-ID: <9dca8772-6bc0-4105-98d7-e4f804b0d637@collabora.com>
Date: Wed, 12 Mar 2025 11:35:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
 for MT8188
To: Friday Yang <friday.yang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250311122327.20685-1-friday.yang@mediatek.com>
 <20250311122327.20685-3-friday.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250311122327.20685-3-friday.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_033507_519157_BF76F3A9 
X-CRM114-Status: UNSURE (   7.06  )
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

Il 11/03/25 13:23, Friday Yang ha scritto:
> From: "Friday Yang" <friday.yang@mediatek.com>
> 
> To prevent handling glitch signals during MTCMOS on/off transitions,
> SMI requires clamp and reset operations. Parse the reset settings for
> SMI LARBs and the clamp settings for the SMI Sub-Common. Register
> genpd callback for the SMI LARBs located in image, camera and IPE
> subsystems, and apply reset and clamp operations within the callback.
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



