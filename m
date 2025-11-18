Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CA7CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5aAqnDwEBfsUEa2nCzxbHYsEw/eHnf3iITovYt8cUU=; b=Z1Ip8urln47JhvUffsWAxKYPHG
	ABbbVOkxeOhgvOwUkRHldm684YEU42Z1+sslH1goQwpdpWBS6oonpIKTE5tK+DTYOWoKgyYGirYTa
	/kB5CbmxndS5Wcw4qbKRN1YuaRYIq24EAMolrIMSofECzq7MgQ3NmACuhgl3jFU2ZHmpMzAfWXxFP
	XR5qBryI7vhpgXecmwqUwDU4Lf9cJwqn0YjRPIUb5OtoxJMcSqKT7dKiJMDLlKkRxy69UgjThvEVd
	L1BE14vPcrT7VvDb7U0z5ETuwgZ4BdBNDSNUIiHc3T5rBqiARmcbRKY+Glth/vG8kJSg7Dd4piKYZ
	CAIOEB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHKc-000000004Yq-0KQd;
	Tue, 18 Nov 2025 08:45:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHKU-000000004WW-0UpO;
	Tue, 18 Nov 2025 08:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763455486;
	bh=hTbUmuYiKLq322sR4T6juTDTdLLt60pQ4qpIzW07z4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aHHRJwHkiFdn6JxXxB5hQhpE7ppddqLDGxV1vBq6SgOjNfqxTMqwc/lnGNXvOe4WS
	 0OW8OcNFlljUz9zfizY9w3ZekI5MU/rgcjWo6p3YzM1hgIEBtRh7K9csXEJv9idwzo
	 brSGfdPUTj8yxMjvBLWxk73e1yGSFViasnF2RXmWGFC2TN3X7D126AB3F0iLCWYgsk
	 ThlxvbOKIh7F1Cy91DBDUNImfBMpwomEVAj0VJFLseZ1fo2BaSxudhIzBOqSry/Xnv
	 0pG1yUK1KNUYDtUYx7BvwNDJ8r2FHv1Rtk1Y62/cXf9imduV4t8JJWEIsyu044QFys
	 +IJn8cnVRFBuw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 395A917E101A;
	Tue, 18 Nov 2025 09:44:46 +0100 (CET)
Message-ID: <67bc01ca-10a4-44c2-a588-1516df832108@collabora.com>
Date: Tue, 18 Nov 2025 09:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/mediatek: Add check framebuffer width and height
 size before config ovl
To: Xiandong Wang <xiandong.wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251118022437.1284-1-xiandong.wang@mediatek.com>
 <20251118022437.1284-2-xiandong.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251118022437.1284-2-xiandong.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_004450_337024_D306A387 
X-CRM114-Status: UNSURE (   9.27  )
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

Il 18/11/25 03:22, Xiandong Wang ha scritto:
> During the execution of the IGT test kms_cursor_edge_walk,
> the screen experiences glitches and the hardware hangs.
> It was discovered that the framebuffer dimensions (width and height)
> provided by IGT to the display driver are zero, leading to
> abnormal parameters that cause the hardware to freeze.
> Therefore, it is necessary to verify the buffer dimensions
> before successfully passing the IGT test.
> 
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>

Needs a Fixes tag.

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo



