Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985E5CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9p6dXsZViJWn+CRLJlHV3uMGF72/jYjpGcHfpeU7DUI=; b=bkQnwxJtZmNOFRylaId/9KxPRv
	K3zI29nParGLpht9K9uaj9hiUc0cruYScTVzRJIDjga8POaAvLNtQZHzoQftG7MGBcxDwIR8zyOag
	3FSRiCHuYkmp8nBpttbtYBZnqulMqem9tcHoKoRtCzqwGzHISVvYji+a+89yOadDJw/xZZDHNDwjw
	H1bqKYNPFlHossCGvfsVD1f4PlgTOtdl9V0fW/0EcxACTHKIIrdG5m2CsUSAqu9QRyUvOtHrkm14t
	nJuGVMLJq6EKy6oP665yqF2R48+xR0Unw9tv5SPoefFcpxDeqlNkYZH6G59YeHz0vqi2zar64yYzk
	8ibNXT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrhY-0000000BSrU-0RBX;
	Wed, 17 Sep 2025 12:56:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrhU-0000000BSpX-42v2;
	Wed, 17 Sep 2025 12:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758113754;
	bh=iM1Ge96MSy9d5GIEcr9i2KqaPvJKQbrBss9JVjoE4n8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RfG/9ifMvBEGFEIC+XN9CijgdpmIfuqmstTEZ4/8BemAIF1WmT9Cxhglj8HWkARE1
	 /olCpzXlNG9855fxB+akysWcMeTTptfnKkO7p9P3N+6GBv7dPBFKWJJO8DvzMfmksj
	 O5vxUdHM/roQO07ztvBHVGVpyaDAHP3+9EPj+tbJa308CC40txRguesvpLgADE+eU4
	 MVF8/TW86xlpH2pgkrxj7rkjWpbGYaoc72ogUVdQqrHKB4uqShZUn0qMnx6zRd8AD3
	 z1Txld4j0es2zYZ6dIN7zWwiqpptBhjBE6wfYuOig2O3c4CTnggeGFJRPAV5iGjh7r
	 PVn8bULGZsLmA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9B4317E0C21;
	Wed, 17 Sep 2025 14:55:53 +0200 (CEST)
Message-ID: <1ec8f9f5-fd61-47ff-b9c3-437fba7f17f4@collabora.com>
Date: Wed, 17 Sep 2025 14:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
To: Friday Yang <friday.yang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250917120724.8650-1-friday.yang@mediatek.com>
 <20250917120724.8650-3-friday.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250917120724.8650-3-friday.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_055557_198377_13C99695 
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

Il 17/09/25 14:07, Friday Yang ha scritto:
> To prevent handling glitch signals during MTCMOS on/off transitions,
> SMI requires clamp and reset operations. Parse the reset settings for
> SMI LARBs and the clamp settings for the SMI Sub-Common. Register
> genpd callback for the SMI LARBs located in image, camera and IPE
> subsystems, and apply reset and clamp operations within the callback.
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



