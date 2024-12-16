Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97399E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 14:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqXMnMp6hhXZL3e84NoPUsPAoICp3Dp3s1x6cAO3aEo=; b=Qcet8tNKwKU8UhnCrHYaQSiTNV
	aWsdSPXUs3vRt3YwOJSsXiFzQEseKxKyiUeD6woOmkyrd3u2tpJIzq49PAJ4KNvjSR2mBTvW+UcZS
	JMT3pHaowZztUZAMyOF0RNR0gIIv7jOtXt/G+AwlnEpnw/Ka3830pQ0fbpW4TjiFS0Fpr0zFD4M+p
	VAZRnu8lm4SJClarGip0PvyFDL012I62+jU5+mKii0U1GYk87JssKUCNWTG3tl0KHQDp8s0OBLFCt
	EZyi5b8reDhEg3IvYVPA/fs/KHwIAfQC9LdhXgL1WAHevs384Jx6PVD3DYsdqIgGHwLAK6YqB/z7V
	ZpaRG9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBq2-0000000ACAT-1x7B;
	Mon, 16 Dec 2024 14:12:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBnp-0000000ABIt-02P4;
	Mon, 16 Dec 2024 14:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734358227;
	bh=nG37q2u8on3vNP2Zolwo/se6L9hAgrE+qzx/aLiEgHI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=X/Kut5C9BR/t6lHy/V2i347zv2+fSQK6z43ppMtXf3XoZ8zx9bPmwyUX/9fq1hPUy
	 SMjT/t1UZChMLCPo3j1rJsCU2bLxZPYiushZsu2xMhAnIwXY499upS13XDnuX/G+be
	 XEHJkk2r4DFAuwu4pI08PqK6n1wyMQjQ2mZdx5r7ftQooTxB8+MesnNFeb5YmSlf8y
	 fIZKz2vBbE4/ft58kmF0/1Tj8dVz5JWcwreH44kPFZVnu5YyHtSOpIgdTpVYgBBgmu
	 Pok9P3s39Fcmz1LBsMXdWYENdBNJDR9FxyV1fOBtSHoETWS9ILEGUSyYqDYnFNA3SX
	 4m5dz4bQImqhA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF96D17E377E;
	Mon, 16 Dec 2024 15:10:26 +0100 (CET)
Message-ID: <33c632c4-a14b-4901-b758-43763dfb271f@collabora.com>
Date: Mon, 16 Dec 2024 15:10:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: mediatek: mt2701-vdec: fix conversion to
 mtk_clk_simple_probe
To: Daniel Golle <daniel@makrotopia.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>, John Crispin <john@phrozen.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_061029_197721_ED966B10 
X-CRM114-Status: UNSURE (   8.94  )
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

Il 15/12/24 23:13, Daniel Golle ha scritto:
> Commit 973d1607d936 ("clk: mediatek: mt2701: use mtk_clk_simple_probe to
> simplify driver") broke DT bindings as the highest index was reduced by
> 1 because the id count starts from 1 and not from 0.
> 
> Fix this, like for other drivers which had the same issue, by adding a
> dummy clk at index 0.
> 
> Fixes: 973d1607d936 ("clk: mediatek: mt2701: use mtk_clk_simple_probe to simplify driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



