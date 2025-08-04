Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06794C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k7PNCKO7CmyD7zu7JPwzHc3IbLDKNNoDi8H44jK8e4=; b=abtLCRQLDCo1HM0wbZeCIeCAJv
	P97O6FlG0u6AE5mOCTBowF/b6YZgWkIN9MHlshAEOtYxwnZvzYI142Ic256XPrPSxAJ7HALXdxFS1
	Y52zNGpE48Zm/UcEk+ZuzdDKT66Gmexpl14QV2g5yPEvoH17y1+/3DsS/LdQypNX18Q0yyfxFXUXI
	ioprQL1jNpTsHqxSsJ1G3EdQteCNHGBgBqj0Bf2fHO/d12O/vB7KQ/O16EtbNOC3s8q7kH35q4iKK
	dOPGVOwVecchXDFYOJB1EzZYfLIO4ajuZxq2kV+dnk13tILp2pM8JhaK6YEU9dEdNp04i0VmG3hTu
	NMOIvW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqyB-0000000A14X-3zby;
	Mon, 04 Aug 2025 08:54:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqsw-00000009zcy-0Lbk;
	Mon, 04 Aug 2025 08:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754297372;
	bh=3qrX1jknYp4qOJKggBsAx8Iwi18RT/dYzgUfn0sqFr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hnUxh6WBTaOpXfYFHlkV61oo8O6aw0KHmCGDH3VVACls9w0uVgRfRtpnMlYM3RD57
	 cnGWmgvJxNX5nAqOLNTkWHBvByEj11WlgfSriaZFxcMSeYzoxY9zJuKC9sx7sMzd/A
	 b9kCYNAzkusFQ03F1QnGXe3aIxDhkjiw9NZjWvHcMX5Xaswah+WEDUkBY7rYQKbVlj
	 3mtPbfwndY5KhDTZTKQPQNGypluMxB/YtOpgtQfP5H7ZPfLJQ/Lri5VgFUWNGcxhXj
	 c1AVh26T8p7zyUTcuTs8Pve4typc5Ege+rExN9rp2evHEdcENt60fQzP+D5TR8vIf3
	 XBKIEVy0Nnd8A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 67B4C17E04DA;
	Mon,  4 Aug 2025 10:49:32 +0200 (CEST)
Message-ID: <606f520a-9921-454c-9967-e545cbfa5a3b@collabora.com>
Date: Mon, 4 Aug 2025 10:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] pwm: mediatek: Lock and cache clock rate
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
 <20250725154506.2610172-17-u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250725154506.2610172-17-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_014934_335458_07A89983 
X-CRM114-Status: UNSURE (   8.35  )
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

Il 25/07/25 17:45, Uwe Kleine-König ha scritto:
> This simplifies error handling and reduces the amount of clk_get_rate()
> calls.
> 
> While touching the clk handling also allocate the clock array as part of
> driver data and lock the clock rate to ensure that the output doesn't
> change unexpectedly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



