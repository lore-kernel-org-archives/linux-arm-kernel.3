Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90799CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwKHh70JY+GXTFZ9akuGUGzP+mt92O/1MI1gWM+jXbk=; b=zAhUBuumuQ8OTA8jugk6/0pM0F
	eN8PKwWtgW2UbdUChtsCWABIQOwptHIPYCQ/LamZOoF4WFiZV5LRckUWqYLbuJ9yoWOv/T95ZPXzA
	qiP1KPLM8HP4rfh+bestK8IA22IB+pETn/tw9sCX0JyiEyZsLiHq1+HjHn4xFu5TviikYnQGLnceW
	dWdslX5Szb6B0jx6gUX4N3vGjRvENTF6wQT4wOnp+qYF4/H90pBm6tALqkUi8FdL8f1Gx5bkTlnj0
	YJheqeFD0HFCfcDlcIkKUA4rY7gJihIeq3c+QkJuYyslsO3S3tggVXAVhIiFvcoTxtlV4aA15WAJK
	lTzMEdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxGH-0000000DO3K-1kN9;
	Sat, 03 Oct 2026 10:46:37 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCxGD-0000000DO0B-0bTJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 10:46:36 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c2e320322edso75797066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791024391; x=1791629191; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwKHh70JY+GXTFZ9akuGUGzP+mt92O/1MI1gWM+jXbk=;
        b=xRGDbdFysW8TdBdSKvddTkMIdCq81c+tLWRd9K7poTrx7fjauewEGfPQ38qEUD1G0K
         rCkRyqK1s51L05PAcIF7dFWEO2sOZa2/IiZpFIIiBFUcSt2bhpedTlvzZEPAXw4t+joG
         Lb2HEWbWpNDqs8LKyuurHYqQd4GWIkB0phz5wDSgt5vpB2Z2PRjWan1ptuaWGtlx+dhP
         t1CWuqzVUkr4wEg6c/jaXUCpaJKhYohsY+eYmJSBQyjYiSW7dKWabCrS57+DZuWEA5hg
         Q9lbtwgSbJo3P5xuXXJ1OrYRWWz0q7AFrAxAXKd/Md85F5i9bTySg6fl49y1HPlD7Vsi
         unLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024391; x=1791629191;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwKHh70JY+GXTFZ9akuGUGzP+mt92O/1MI1gWM+jXbk=;
        b=ySvsH5lwujJJO5E1xDd96mvre/ivuzDZ3S/dkMKpIL4+WDrQfgXw5qT90g+VAK9ruO
         1k8fCQK3eWfRJxFCYm7TcMGoQ2Oc/9OFYLHw2waPn/wQ4JiCGDdUXt++JmjKzf8u+bNI
         MILrzQcPrZtYhty5AzSsCJEpuertNSWluoPgp6pF7yLp8FIe80ufGb5yozoNpwHDERMf
         aDzjuQuRLKLgv8Lc9UeL5wFZgGAUAJdwjpmbsvIu40I8qjiRhjaFRy/Ikmk+9zb6COnC
         hYcQrQyY8YUWoWPj8R9fI12dclxUBYpWsaeVA5TyFGNp30a+Io8CPjgdr/x3dfCaIVGx
         aQeg==
X-Forwarded-Encrypted: i=1; AKwUvBw0NJMa5os8ZW2a4MAJLOCVaMmwzU81ngxdptiTKyIHvbWLW0ylE5uhPF4qjrP+I7nEdVcXII4qVH55EeeZk9Lm@lists.infradead.org
X-Gm-Message-State: AFuF++kF4MYbR36elOy2lInCN3tJwDRg2gCi39rPy9bOrAjVaSGgQ5KT
	yG8FMFoZrI6Pw4bdTyKVKJehelREnCYRwxCJU2dbhG3AT7AR2GF6/QH0fjVHrmKHL3Y=
X-Gm-Gg: AYBFou0dG7vJJI6wC9yXqIpzElmeIWLnFc9iaVmdQQ9bguW+m5jTe3PWU0mQ1aRIcvb
	30EgzoXZH2o94L8kj2gVNe0lGmXpAgQ2/nbYC4BIyUhTjl2AaGYFBfnWlMhNz+ySqxosIp/0d6w
	7gjXHfSitqbwFg1O9HqzgFE7yVIh7C99tHQr09Zuaj/UcyEuUL6bdZVLSOi8cXAJrqYNW8LbY2j
	zUT8CcNeBmhbS1zoV2mh40fKC44acVZwsYJOGSpA9hgaTH6zxFnMth5JSWgWe+uTWcuQYUkOEHt
	DpAXA94Z71Ar2kQ2bpRUkLoTaCUpgK3Y0AtSgsPUKU8c9UC2mJCwxJcJqp0w4Rn3QY3Wflgc1nb
	e1RfflHFUsrGaarnorxCbCi/xk1MeBEFAZg/okmuRp/HIbSUpnA8LIonguCKUOrHHB8auVMSAZc
	7gb07Aha09TLJIH5eDoIvvQnrJbrSPSaQkahlVscpHSEp128GMilAYu+LlBhtYLL4MWeX/Zlt28
	fdRAR1NYUM=
X-Received: by 2002:a17:906:f58b:b0:c2e:30a9:c04f with SMTP id a640c23a62f3a-c2e4ad155a4mr454607266b.13.1791024391402;
        Sat, 03 Oct 2026 03:46:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.86.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf5f4e4sm192822066b.42.2026.10.03.03.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 03:46:30 -0700 (PDT)
Message-ID: <61a2d75e-4061-4be9-ad8a-a85c5bf7368c@linaro.org>
Date: Sat, 3 Oct 2026 11:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rk3576 variant
To: Amin Gattout <amin.gattout@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
References: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
 <Vv2QfKmkyPTU5VXXS1TYn-cg7DX3OD7InbT-5UjiZLMHVPPDWcj-0hgl7PJxI7ugjmudNTZJfhXCisY2fExubQ==@protonmail.internalid>
 <20260915-rk3576-dphy-v2-2-b56e68b54b8c@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260915-rk3576-dphy-v2-2-b56e68b54b8c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_034633_227132_7CB4DC55 
X-CRM114-Status: GOOD (  19.99  )
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

On 15/09/2026 11:42, Amin Gattout wrote:
> The Rockchip RK3576 features two MIPI CSI-2 DPHYs compatible with this
> binding. Unlike the RK3588 variant, each PHY instance only has an APB
> reset line, so add the new compatible to the single-reset group as
> well.
> 
> No fallback compatible is used because the RK3576 DPHYs match neither
> existing variant: their control bits sit in a dedicated CSI-DPHY GRF as
> on RK3588 (rather than in the shared VI GRF used on RK3568), while only
> a single APB reset is wired up, as on RK3568. Falling back to
> "rockchip,rk3588-csi-dphy" would make the driver request a second,
> non-existent reset, and falling back to "rockchip,rk3568-csi-dphy"
> would make it write to the wrong GRF offsets, so dedicated match data
> is required.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
> ---
>   Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 03950b3cad08..92d0c961f4c4 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -21,6 +21,7 @@ properties:
>         - rockchip,rk3326-csi-dphy
>         - rockchip,rk3368-csi-dphy
>         - rockchip,rk3568-csi-dphy
> +      - rockchip,rk3576-csi-dphy
>         - rockchip,rk3588-csi-dphy
> 
>     reg:
> @@ -89,6 +90,7 @@ allOf:
>                 - rockchip,rk3326-csi-dphy
>                 - rockchip,rk3368-csi-dphy
>                 - rockchip,rk3568-csi-dphy
> +              - rockchip,rk3576-csi-dphy
>       then:
>         properties:
>           resets:
> 
> --
> 2.43.0
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

