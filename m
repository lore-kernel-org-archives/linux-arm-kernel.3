Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3488FCEBF91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/y6VkKpBiwKJCEdrhOIQbvyQsOs4VpTmtklXttujfU=; b=KpW693g2AbhwhA9QFBDD91H31z
	vzmoQbPEDmVpikGbItvSaU/uIH8Hx9oQ2jTYXGNHBGWzhE/Y0bFSezrxGc+Dlc+U9T5d4rtg+YuUb
	R13sPgSF4m8LD9I5PjU2B4NjsP+KdLj/MSmy/sGaCYB3dTufcwKV1VEHxZVQygu7hjzAauyfg9lRU
	L3GfsQJhBrsTmRpwOY9Gg5HuLtwE9xcypw2pgmQUeyOlEPMx/vn9TcmDDkL8sRFfPaUVia+NL+5Rj
	qv60UU0MezuuJoAzuyMOMvMJ3VxFGr9vesy77ps02/Hs1ktPd1PqwefR3k/9zQdWaORCUFAykA9n5
	4fhcNBfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyWU-0000000G6Wz-0Wfp;
	Mon, 17 Nov 2025 12:39:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyWM-0000000G6Ot-1He4;
	Mon, 17 Nov 2025 12:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763383187;
	bh=Jw2sRzJoJU/CuzcziJhRnNu6CtWaCgLJpIwQLt9l66s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mUMAUTy7PNxVnPK272ufjc6P2C/ZiAcQF/azJRUjLl9QAQIiI73jDd7pS8u/SjerD
	 6o3iqGxrSEaskBwr/i8yLVTJ25fZlTktErORF5bIetaOWLnXRAWTSR0hsRowW0K3JW
	 mFZf3RO597TFbLvgzs9EXtqZQJEZkHusiGMgVwJAbFtWPZL/CJPPkarclyQyj8eaih
	 CxdtNncPX7f7GXCX4XDeWOjpPTka+9eI9sS+WURVkLW18EJNWHJSrFQ90q050lR14F
	 P9am3tZMqe3VQprE/X08Efb5rdmtvSnKyJl2sItlzAS9tSok69HCYDdV0hVOxO7Wwp
	 NUlo6OXHvmXUg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C17317E0B85;
	Mon, 17 Nov 2025 13:39:46 +0100 (CET)
Message-ID: <a804ec3f-ffa5-4eab-a20d-3abc204c4849@collabora.com>
Date: Mon, 17 Nov 2025 13:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] interconnect: mediatek: Aggregate bandwidth with
 saturating add
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-13-b956d4631468@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251114-mt8196-dvfsrc-v1-13-b956d4631468@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043950_536087_F0831F06 
X-CRM114-Status: GOOD (  10.55  )
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

Il 14/11/25 17:54, Nicolas Frattaroli ha scritto:
> By using a regular non-overflow-checking add, the MediaTek icc-emi
> driver will happy wrap at U32_MAX + 1 to 0. As it's common for the
> interconnect core to fill in INT_MAX values, this is not a hypothetical
> situation, but something that actually happens in regular use. This
> would be pretty disasterous if anything used this driver.
> 
> Replace the addition with an overflow-checked addition from overflow.h,
> and saturate to U32_MAX if an overflow is detected.
> 
> Fixes: b45293799f75 ("interconnect: mediatek: Add MediaTek MT8183/8195 EMI Interconnect driver")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



