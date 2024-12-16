Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB80E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQhTwHXTggxFjc63CUZlapYJybRkDmqVTgGY45+0fKI=; b=CPJnMQE/Lqt3o5mxFBEaylsusF
	t6V5BSMhe0ub6B5Fab8JzC9YTI57F6RMbzt86OF2rWeenkhr5QZNNdTeK9w90uV/n+VKhaIgjATg4
	r7ES1VFKeFK/1b7VpjfsM89Q7wS3FCpMi2K65eA2dOJmweDZ4LqQB7QCtYii5Wkdgtkqqbicz4O+V
	jlyhYl38LZFXb1dlHj2qs9YbDRLQr1rg7Hp6pzUGzswOrFgNiIhT41SxT+ppq8p/AUMff/Ahd9C74
	oWmDukS/mxVXojOM25BfYojYWBO7/cDqqEnQUx+fqDcfKHAMW+Mbk+l/tnyClwyQczTmSJJ8n/Ihl
	OBThZs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBtJ-0000000AD67-1i36;
	Mon, 16 Dec 2024 14:16:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBns-0000000ABJh-0ljW;
	Mon, 16 Dec 2024 14:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734358230;
	bh=emtkLwwySWPoWElXvJPFdw/cj1Vtoq6kbUzlYSmOgAU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=SVr93H2qBzeUxWA7TxhTrqzCuPtPio1LUz/b3TvykZVUKWqPpMACsC9N4uueT2xSX
	 aUYRAXYT+0RCPgZOeuh9Twn8vdFiyD6MX/2ntlUCkxVtJ9908xy67kcXryunfrAuM+
	 RpDL0dOJ02ayjKx7vnAcb4rFjz9aQfo7NNB/uemSU5SdE5AXllOdrKEZ8xlrURli4p
	 txBHOCQ98PmAGqCkeLH28QCZTssvs9y1PkeRwCtNpscDAgDiQVgP/bc9aEWWugSvcW
	 W3bUMPOcZH48rHLEGgdkkwcjprUW0EX4K1qGQ6U0sRduQe88NRJ/hVuV7GhByZGkhI
	 /21+GQLNSTexg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0876817E3783;
	Mon, 16 Dec 2024 15:10:29 +0100 (CET)
Message-ID: <8cf8accf-51dd-47b1-9b02-07a96e897714@collabora.com>
Date: Mon, 16 Dec 2024 15:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: mediatek: mt2701-aud: fix conversion to
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
 <a07584d803af57b9ce4b5df5e122c09bf5a56ac9.1734300668.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a07584d803af57b9ce4b5df5e122c09bf5a56ac9.1734300668.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_061032_380735_FC45F040 
X-CRM114-Status: UNSURE (   9.14  )
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

Il 15/12/24 23:14, Daniel Golle ha scritto:
> Some of the audio subsystem clocks defined in clk-mt2701.h aren't
> actually used by the driver. This broke conversion to
> mtk_clk_simple_probe which expects that the highest possible clk id is
> defined by the ARRAY_SIZE.
> 
> Add additional dummy clocks to fill the gaps and remain compatible with
> the existing DT bindings.
> 
> Fixes: 0f69a423c458 ("clk: mediatek: Switch to mtk_clk_simple_probe() where possible")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


