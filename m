Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D22AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qX9b2uVSsrSRFgal+JULFhtiy26+JWv0aAV8SKRUC80=; b=rFFPFOKdniCkLZ2ebpXRrluQWK
	bQzI+5ImoJ++iFVLTXoMnYyngN426eqtzQHrTOBEbXizOYQPeR6f3aXOhWfl7AF7H7+HxOO8qRZFg
	KTV6z4em5dmrk2iGz4IVD7tDGulJ0wCZ3QkR7rzGUjR4PE0SbAMU3+8C0vkMEwK2Fu+HRmsH1H9W6
	7GaD2Sgke28CMhUBhJ5gr1oQtk6ZVfUctIU3jlHoQte6dnm4MlDIBb+mkA26PrpHIq3Ek0Qu9cvyX
	jG8bIPnlTwj8JisaVWJkXKaGJjQHPSDyrScdBGuR/Y7p/fUOK6guZckaoBAYla1VU4uW6qCJGXns+
	fnpwggCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8bL-00000004kgu-3ZM2;
	Tue, 07 Jan 2025 12:22:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8U2-00000004jKt-0Gjn;
	Tue, 07 Jan 2025 12:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736252092;
	bh=rhdZ7OGyC7Ood7ZMdwK/jY/Cve9yhiV6qZLyfcQwRhE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dlr7bC68M19b4kKjKNgfKoIm81gHCu5tM61jLwSddjDBUw1qUMNzSegR3dIqimwOk
	 iWYii9OBuNqm5Ku7ptwWDY81jjoVj63I+7YA/UIQbtTPFNtyhDcMR06cBMe2G8R3qS
	 UBpQ+u7ueR7OSzJzozljlLHbkqi4r8zRwanHVMkaWogKCT65Uy8qrUKn+BisIA2alk
	 oVGNPWY2NYe89bdZhkXOIpPSDVYHsZ3s+NI1U/BqylxWaip0U2QEB5ihEo896XQJm5
	 XiBs+VVhNI+ETFKx20eTS2vvxE3t6MsbOV0BAtk9XkhkNuIrpbdGBHaLZgtKFoA0P7
	 fCfdTqOKaR9WQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40EEA17E156C;
	Tue,  7 Jan 2025 13:14:52 +0100 (CET)
Message-ID: <675ce53f-14fd-4a6b-9480-9d936faf3f53@collabora.com>
Date: Tue, 7 Jan 2025 13:14:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: mediatek: mtk-devapc: Fix leaking IO map on
 error paths
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neal Liu <neal.liu@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
References: <20250104142012.115974-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250104142012.115974-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_041454_265894_6FF7FE43 
X-CRM114-Status: UNSURE (   6.62  )
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

Il 04/01/25 15:20, Krzysztof Kozlowski ha scritto:
> Error paths of mtk_devapc_probe() should unmap the memory.  Reported by
> Smatch:
> 
>    drivers/soc/mediatek/mtk-devapc.c:292 mtk_devapc_probe() warn: 'ctx->infra_base' from of_iomap() not released on lines: 277,281,286.
> 
> Fixes: 0890beb22618 ("soc: mediatek: add mt6779 devapc driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Please disregard the previous email;

This series was applied to branch v6.13-next/soc instead.

Cheers,
Angelo

