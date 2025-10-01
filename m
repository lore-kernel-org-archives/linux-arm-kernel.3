Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59CFCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxM0pTNTypZ0HeAYZW4XLBg6ib72j+qtlk3b5q/6YZI=; b=Yqv7lgBOEH+Od3masvCn5KyVIL
	tDn8dhSS630+QBwAjo6V7vM+KYJKqCvKthdc5nPDlZb1cCOIPcQpN50KgHwSkJNcZdbh5O2KdDkWN
	xEMG2k5e/e2eoqeHOWYgnIhMRjPU/uTH2h2abEyouh5vuokhVNC9WUmwvaKiYM7v3J5zlfqGPPDvs
	OLbG80sPTwgW9B6MD6+XUj0ZSDsu36rv8I++nIuDI+5AM79FaTAi2nqtwWNDu2MSn0xGLqs3GEHMz
	BT3HPSkt7bUgsiLIDVca7Rz0y/SAD/Rn5uDc6Rn3gJLfdaD1y5ICXgzq/keRGbRUJ9ZPzES5IXfJF
	Vu0cx71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v64-00000007P5Q-2Sn6;
	Wed, 01 Oct 2025 11:34:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v61-00000007P4j-3RBR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318447;
	bh=41SWZdcJyCda+Y1x9K2FRogst2ZLFrtZo76JuwTw8ps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E1dEv9CVRNQ7BJrOoKDCByEI7aAk9L85vkqjNfy4vGsrR0VJIv4Dzotn+Tc32U3Yt
	 rWiAVRauD+oXxcUXWPg7xkSLsaK7XVVbNUv31sogZnI0NjC6BPberE0V3VYMMnhkgH
	 yVmjnCirmelNzj4AkibN/UtXSStM7daaNGPF0eazzefy3yZ5v9cTWqnmX2p9ZoLEvG
	 arq0B68gxQ5K6fJr4DqKom55SXHvLr0l7Q3LTsw/ROblq/0pGwfv0Vw5vsIFBsg25e
	 qdH6XkxDY6nidGaJjSzjFVUF6FEK2EpZtoaIqfXRIebF/KrfLpY5HJBQz/MGLEOeNQ
	 3AXSyRF9b7KAA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85DFF17E120D;
	Wed,  1 Oct 2025 13:34:07 +0200 (CEST)
Message-ID: <70083e67-242d-4f67-bd51-0638749926a1@collabora.com>
Date: Wed, 1 Oct 2025 13:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 11/13] spi: airoha: set custom sector size equal
 to flash page size
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
 <20250930022658.1485767-12-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250930022658.1485767-12-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_043410_015033_16BF5EA5 
X-CRM114-Status: UNSURE (   7.83  )
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

Il 30/09/25 04:26, Mikhail Kshevetskiy ha scritto:
> Set custom sector size equal to flash page size including oob. Thus we
> will always read a single sector. The maximum custom sector size is
> 8187, so all possible flash sector sizes are supported.
> 
> This patch is a necessary step to avoid reading flash page settings
> from SNFI registers during driver startup.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



