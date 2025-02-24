Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F30C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FcfdZAXTLXvcHgZD//PibXN7xW8sVKwsd4qd15t5hw=; b=tWFM5ZwmQsGOLY1fcSoJXyoMIS
	rbhCIW5reVJ0Ap2HU8jvvsI6aeemgNltlufcCOF0kDOfT4V5G3fGCYAJ5IXoKqrx7hmRE4sObfIqg
	Kda7Ng1HYXaGZsWey6Yc+OA3Q4aqpqE045ItMC5mu+CPCwHK5umxBe/Du/HvjawDxH+u1a8oSteef
	ooiqIQf8FegZpHOjPHBv9ehrcOG/TgUcTxHrx6f04sslqAI8JKqv+L7ugXrU5A9SZ30ZLaBt1sMs6
	pXQ9eF0QvUuRVNvazCtd+/ADvp6F7EBsqy9EIlXkzltFGaSEEJNdU/svTVEWkAcM1rPfZcWYjRWzW
	r9YrhHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZUI-0000000E6Vh-1wT4;
	Mon, 24 Feb 2025 14:31:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ2d-0000000E0Ut-0SaE;
	Mon, 24 Feb 2025 14:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740405757;
	bh=NtQ8UJ5HySKPPmQnEnNNQwk1UmdTw09FLFYUk5geJ0s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lmYWGnuVgm+KmTD5YIxehDk+tVlRC1vDVfK3HtWmF4+Xq4+qBxIDwOjpAaJvHPift
	 Iui0tPLrBtCwaPZFe1Y0gbWZIrnAXC10sAKWIMuEnQs3olEYWEDjRCysz/YtqhkcYH
	 lWyzHOV4kXH761x7If9uEk2Ps2sjc7XQNhouXivC3kLAogKB4Fj1QFoIWUjp28UJIW
	 VwWMp6/+QipGW+jONwhGszvac4z5tVDFcVG86uo2VvwY+0EjwCVhO4/kTG+8wgKlRP
	 QNzimmhM4cg2etTnbrfvkeV0PvBbGwLAEkIuJjOqVK/BRTREvZESd7DV3lvUAh0NU8
	 CAzRrDrDeB5rA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B74F517E00F6;
	Mon, 24 Feb 2025 15:02:36 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 Sirius Wang <sirius.wang@mediatek.com>, 
 Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
 Chen-yu Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20250224105414.3576243-1-jason-jh.lin@mediatek.com>
References: <20250224105414.3576243-1-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v2] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
Message-Id: <174040575668.71176.5895162308675381424.b4-ty@collabora.com>
Date: Mon, 24 Feb 2025 15:02:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_060239_316269_98C10071 
X-CRM114-Status: UNSURE (   7.01  )
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

On Mon, 24 Feb 2025 18:50:13 +0800, Jason-JH Lin wrote:
> Add cmdq_gctl_value_toggle() to configure GCE_CTRL_BY_SW and GCE_DDR_EN
> together in the same GCE_GCTL_VALUE register.
> 
> For the SoCs whose GCE is located in MMINFRA and uses MMINFRA_AO power,
> this allows it to be written without enabling the clocks. Otherwise, all
> GCE registers should be written after the GCE clocks are enabled.
> Move this function into cmdq_runtime_resume() and cmdq_runtime_suspend()
> to ensure it is called when the GCE clock is enabled.
> 
> [...]

Applied to v6.14-next/soc, thanks!

[1/1] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
      commit: 6b9a5fc65a7880f7ac6a981a0a30b5ecba7bd5ae

Cheers,
Angelo



