Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90766CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSkCBy2L6yxGioEuLuUQDLNE7fmBb6lAJg/O1SrGrdc=; b=aoHaMnyfZL1PrABTMf5i8u+Nws
	OhRPLfoyQXlcO98lZVBjskyF2MtWc9fmIyl58Gyrl2aNvUjes0eCb6mSkU95D3nAMaqGkvNgmGDR0
	BEIZgfLjCZjIl/3jxnwjNpZZatrhwsl0ZdcSk8tvlRmnIGyD+E+rLQkGLplmV3/2q+QEgFQQ0vWI5
	iRvMZeh17/PHdirBLIQR6+tXQiGeGQtFr+weFpBSH72QQEJEt6ZeCfF6ulpIR+h2tlh9nUbhMFujg
	3vCa8KBdpqyOEmNYvjw2c+x+EY35WNAgfB+97Lo+P5ssCXVafBurgIXGY25REUu1DR6YZsBRWeuGy
	NJqZwcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkLi-00000005cyD-3zPO;
	Fri, 31 Oct 2025 08:19:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkLf-00000005cxh-2eyG;
	Fri, 31 Oct 2025 08:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E3184517B;
	Fri, 31 Oct 2025 08:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951DCC4CEF1;
	Fri, 31 Oct 2025 08:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761898741;
	bh=AGxEpfdFzeMPLbbU8OvwzY2XUqW8zSz0RQQyFpRG6d0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9B5iD6So1tBa+W3HGzzdrJEoYssS0I/TdaKA7iETf4GbEXCu8eFd4N07emeZtW56
	 V+IS7Iyijb7uQzSiI2cHacxEZzVs9qL16hGYusSWjQwaJv2YbFR0oKuDria3hAl3VS
	 oFA6KqXuvmAXuP6HgqfVGrcu6Wt79oXUjOfaNYB/DsochjvqB5NGCiSEid5QiypFLj
	 4qEbvqjfEP1VVqkXfOib2NJDYYoABI9TEWJz2s7zqOfUJNLVbKqcZdadh5BuD5CUYN
	 FGZohvODi6HmGpcVVMrruhTtwodRy4J4WI+hL1gRwd0Q5ilDY96c4Z7nhnksSgnDRq
	 6VMwh4Z4n2N9w==
Date: Fri, 31 Oct 2025 09:18:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jack Hsu <jh.hsu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, srini@kernel.org, 
	ukleinek@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	daniel.lezcano@linaro.org, tglx@linutronix.de, chunfeng.yun@mediatek.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, sean.wang@mediatek.com, 
	zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, 
	jitao.shi@mediatek.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 07/11] dt-bindings: usb: Support MediaTek MT8189 evb
 board xhci
Message-ID: <20251031-clever-yak-of-expression-d9a6f1@kuoka>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-8-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-8-jh.hsu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_011903_834650_AC89DAD7 
X-CRM114-Status: GOOD (  13.19  )
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

On Thu, Oct 30, 2025 at 09:44:39PM +0800, Jack Hsu wrote:
> modify dt-binding for support mt8189 evb board dts node of xhci
> 
> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml         | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 004d3ebec091..05cb6a219e5c 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -34,6 +34,7 @@ properties:
>            - mediatek,mt8183-xhci
>            - mediatek,mt8186-xhci
>            - mediatek,mt8188-xhci
> +          - mediatek,mt8189-xhci
>            - mediatek,mt8192-xhci
>            - mediatek,mt8195-xhci
>            - mediatek,mt8365-xhci
> @@ -119,6 +120,9 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  reset-names:
> +    maxItems: 1

No, drop. Not needed, not related, not explained in the commit msg,

Best regards,
Krzysztof


