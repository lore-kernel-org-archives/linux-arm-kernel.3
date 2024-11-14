Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FFCD65C64
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 09:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AJuPtUdcf4gMP07orDi02mqA1QMuefpCr3pHy904fM=; b=BjLtj4iS9qpD3h/ri00eOtWBA9
	TXhMAfjUzVk1p+0h2etgtpJSsJbwF7xKE+B17Gj40EKJusXFSfeqTyk2k70d72cLrxsw0h3FKSxoj
	dVoDl08km5z2Zz9pIkTsZf87i4FUa0RpOPZXKDRv8MCXRLAT8EmzHSvyCWDukMwmyBbLIXSEtOIch
	cFan/uaTYEZ1rAG+GzkH8+GI4ggaR12qTA+VkYn/P3WQzXkcoRRXsMeBg7E0QwS9shN9uPy4GGKVp
	JMShpDbAihkOJh/49w9SpckKhs8XwoXcSt94CFXsDa9rl2C1aLTHrNLMOurXmyFfOabayh6eHmXWl
	FX9Z0Zww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWBG-00000009Mtp-37kD;
	Thu, 14 Nov 2024 09:30:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBW7y-00000009MFN-3Bs9;
	Thu, 14 Nov 2024 09:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731576420;
	bh=R1UuyuwvMBWD8gJ/Fcy+U58DhFWCQIj7bRdSdDaqNf0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ocg8pOXB/RFjyyLYKOx0U8otxoGt1VOSJt2PixWnbqJ+7x3kZRzCsSWpXnJZr3xtb
	 Fa8DwpRljft0AsOCd4WxjR9i+8xIeHkgjrlv5j9AmmgZGB1MVSzq7PAkwMcBdnmuTl
	 yM34YZG/egcITIYOH2mBP/Peh4K1RWXeNIEKV6stKkVCN4g9vmc68JDELT5NqOt1Ib
	 aB68Pqq4ohEF+q3/1xUF1IcCFWEdXoWx8bx+HGKUM9S9W+ZzkVwtl8PcBy1sWEuctz
	 g8YcoFA45nsmqcGKj4nsspQqx25NGJNx2W5bh0h2LX/AYRv26xSA96p7YHzlhIWByT
	 kgGqZ3D8yUHrQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5217817E1574;
	Thu, 14 Nov 2024 10:26:59 +0100 (CET)
Message-ID: <224443e5-2ba0-49e5-9d59-2b37c2d0ac4a@collabora.com>
Date: Thu, 14 Nov 2024 10:26:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: stmmac: dwmac-mediatek: Fix inverted handling
 of mediatek,mac-wol
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
 <20241109-mediatek-mac-wol-noninverted-v2-1-0e264e213878@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241109-mediatek-mac-wol-noninverted-v2-1-0e264e213878@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_012702_987855_A2CC5E70 
X-CRM114-Status: UNSURE (   8.56  )
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

Il 09/11/24 16:16, Nícolas F. R. A. Prado ha scritto:
> The mediatek,mac-wol property is being handled backwards to what is
> described in the binding: it currently enables PHY WOL when the property
> is present and vice versa. Invert the driver logic so it matches the
> binding description.
> 
> Fixes: fd1d62d80ebc ("net: stmmac: replace the use_phy_wol field with a flag")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



