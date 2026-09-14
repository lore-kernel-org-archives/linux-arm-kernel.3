Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87BEC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRaJme1U9BAUta8IxD8bUprqETCA0s9c46EftPXnlHA=; b=c47YMTLNn2oNPl+ujDuTCIQR+R
	gH2q4/Mr+Qqiqn61LBMBheXTAne2PW/zT2e5b6Fdr9yOvHW6g5yLZ+wxZKYp4K3oNAahPDCbUQOVu
	Pd0dBDm0+6H4E2jg66pHqbAkSv0M5JfEZTjrAz+H5aHNuk2LajGuaYWsg3ulszj97oOjzjsQAlR+8
	97gyMfV7//WNuZwfmioPxNSfx8eCxLob93vezY2h0bZHxYi8FGjtHaCnSCQemFcouXxyX1Xnl3MyI
	QqeIvAJro9D+bJogkEE/anYYQd8QLv84gTMqSKzYz5YvGwmvrt1U+H9sBA68WvkB4/oXKrN10CRpR
	DzeKcADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66iF-00000003l3V-3rZY;
	Mon, 14 Sep 2026 13:27:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66i4-00000003kwG-2lcP;
	Mon, 14 Sep 2026 13:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789392417;
	bh=VlDvCei3Ewb2SoPuYgJCEPOPSVxpLt3TODjVs4hS56c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fh88qEzc2+dSsZSK6i+MXYgENumL07wsca23XykwLS2+F9N+g2opfMVJAZCSpPw9I
	 RkkFDH7ru/ugJBrHqXd8qkEEBcl/0+blRFecNrC12YLrLr4ADl47K7JeMsUElk5vIG
	 hiW3HP6Uo3EWp3YGt4T8JWnSeLWKlxKcH0Jg/sy5pu7dL9Fx7kRrFAayII/XlHv5KK
	 HQeCWLLEFZJjL/0nHfS/OWGQR/WhHHXjqsoHXWR9rqvTN9GSRqDqY5cJ6x2PyzCGQz
	 xrLSkE3O5sL2ZKR9JRbhQzMexSOy+ssNovyD22/OzI0Vr81Ef7C78hlH8+zc1KKkd8
	 92MR4PtfpgzBA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D4B417E020C;
	Mon, 14 Sep 2026 15:26:57 +0200 (CEST)
Message-ID: <6f55e127-a39a-4c9b-94f0-57cc951d7ed6@collabora.com>
Date: Mon, 14 Sep 2026 15:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] ASoC: mediatek: mt8189: Use dev_err_probe() for
 clock errors
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-7-phucduc.bui@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260914072842.24420-7-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_062701_407765_DD3152CF 
X-CRM114-Status: UNSURE (   6.15  )
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

On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Use dev_err_probe() when obtaining clocks to avoid redundant error
> messages, particularly for probe deferral.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


