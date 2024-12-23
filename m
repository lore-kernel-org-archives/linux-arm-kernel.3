Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1EDE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 11:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJ4L88xTb6+qQKLsDNZJegf3ciUWBHf+5wdBmZktWTE=; b=dDaUOyNMIeykz5gnuvEx5K09rR
	eYrtZ62t4w2WtMbBf84YWgdih8Zq9WHucfdilBWA5hVRxSJFYM00ENCyrkuUTZ3STH/t54s+mi+1r
	OagCzPQYICZDtI/AczVRMzMmGxkxWYzop6JROvyfuJf2v0OrmPtNqW+91EPL22nuMUdFETDiffk3Z
	Et53qf+g+JogOGGLKhqPsTgd+sJDCc2SrsTJZK/yC7oIJ2uT93OABQ/Bmq6IBIxC3xJK/XdOQTMQr
	pkeiySjsMI8iMUnn9sLkDyJobjhRmDqlkACFyS0RgFz3O+mW2rQbxFRu6IEfJtuSfFB3yZOjoFpSV
	JjW7l9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgQ8-00000009sO2-2Ujm;
	Mon, 23 Dec 2024 11:16:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPgH1-00000009qbn-3Qaq;
	Mon, 23 Dec 2024 11:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734952013;
	bh=uAlo+ULnWIqf2cgYUKQAKueI8CJurgRHKq0A+C/3s9Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d2zfIiW8g5ELhktY/4rR2tCQf6VaZRSJfHPzLl5tE5D3Frym7FD3B29n7ZITHh7A+
	 lTcXaAlCHlYtD2aQOCtBMln7AGGyYvDhKBzK9ziApJTulk043ash0OyhooayOU0wUD
	 QzZEPMdMO7z9VywpZA6CEMiwvyYZI+HnHbXiXX9jp0eyBRfv/UoEzfi5OCnymIZCf7
	 pYJM8gDAWJMJVdw7lSWauAv1yTjhVHtZ7eRDNrHLvVBHQTwJlyTVDET4qrupKU2pPl
	 lLyig2oxxfyNccj+qfOvsvPcsPjDnujK7SKVWFHtgMzauLgX1VCqxFUZcuIPnuTKS5
	 SyL7kwWKJXYog==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 07B7917E362C;
	Mon, 23 Dec 2024 12:06:51 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
Subject: Re: (subset) [PATCH v2 0/2] net: stmmac: dwmac-mediatek: Fix
 inverted logic for mediatek,mac-wol
Message-Id: <173495201194.34262.3657458124783082964.b4-ty@collabora.com>
Date: Mon, 23 Dec 2024 12:06:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_030656_042099_D2BD68DA 
X-CRM114-Status: UNSURE (   7.96  )
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

On Sat, 09 Nov 2024 10:16:31 -0500, Nícolas F. R. A. Prado wrote:
> This series fixes the inverted handling of the mediatek,mac-wol DT
> property. This was done with backwards compatibility in v1, but based on
> the feedback received, all boards should be using MAC WOL, so many of
> them were incorrectly described and didn't have working WOL tested
> anyway. So for v2, the approach is simpler: just fix the driver handling
> and update the DTs to enable MAC WOL everywhere.
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[2/2] arm64: dts: mediatek: Set mediatek,mac-wol on DWMAC node for all boards
      commit: f8a032834abceed9db3f20a5eb56064b21c84613

Cheers,
Angelo



