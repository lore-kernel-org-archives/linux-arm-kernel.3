Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE22C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hb5I4/2IdOfdGyllTI2W7LkWVdlsgKxVqV5mnOeQwE=; b=yWFtgwkHrYoTAcPhDfpEjypXfq
	OSTVJfB05nZX8N1Uvw4crf0ca2yLbvzwCRWlUxumsS6XWZJ7NexbgvPQbf8tq01Uwo/NQ4vy9rHF+
	uVPeNbhsls9Hvvye+Eu3QTLM4pXopte6kIN8ujxM+WebUHCQ2rFpAnX0xI7bbZzcZiuh5X4ZEafE5
	WhradDySAANmhZdZMfMIn2xaswA6Y5C0Q3txt3+bkWV5eibW31LnLnKDlJ8ihvvrnHxkW+NYQkc2o
	rSIVFY8f+Rq3tPD2IFw7QE+I8wO8HVzEZz+7SKhxyTFXxtRD8Ibcf+UydnSOXHNxgR2tvEWKkJt/a
	CodSu7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7Yp-00000004a4A-1hhD;
	Fri, 10 Jul 2026 09:30:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7Ym-00000004a2L-3v55;
	Fri, 10 Jul 2026 09:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783675811; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D9kUGQ255xhzZeQWelttSRUJxIH/MpLmXjGqKcC6Ovl5oHOIB2geAYmrjpj9UODZLafz4XVfbUeRE1Oypw5yU9N+nYLT56+FZfmaeOzags7Di/XoaJM0L/hm/W/ubEK5cBgbDB9zI5CZ7YstNJ8sBc4k2LqZJizEYptjkzSNv+A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783675811; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6hb5I4/2IdOfdGyllTI2W7LkWVdlsgKxVqV5mnOeQwE=; 
	b=SipXuD268ETrbmfsS5UXTmwpCTtgiwtUMgd+N5QdDCyhiYrxDBvGBdNJ2ZWLyz3jcoFlmmvcOMltXsGSicK6O+6BzHUtiZDaYlL4olwEopIYO+QvWHuBRx+qZl1vrqNWG4G18hmEsLAdsJyx8utWvgHCfQH7A2fJtfgkX1j4T0I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783675811;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6hb5I4/2IdOfdGyllTI2W7LkWVdlsgKxVqV5mnOeQwE=;
	b=T5Q6KMbp3jUFiOxL9g1l69BSL9Db9tKLBcOrZtqzbd4ZnRJNwGMuaaipJirsB4Ih
	zxU0w3wJS8vGnNlSW1La9QlxUU70ihBJwwGfOdmnAh+HG/srEQ4u6/gBZbxxDcU/tZ3
	Mw+TY97hFcHSK778cbqEaK1AL8z7goCZD22kuaOQ=
Received: by mx.zohomail.com with SMTPS id 1783675810094635.854368220136;
	Fri, 10 Jul 2026 02:30:10 -0700 (PDT)
Message-ID: <04e9a542-a05d-4608-ac00-d40da4763f45@collabora.com>
Date: Fri, 10 Jul 2026 11:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net>
 <20260630-feature-mipi-csi-dphy-4k60-v3-2-176792ab71fa@wolfvision.net>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260630-feature-mipi-csi-dphy-4k60-v3-2-176792ab71fa@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_023017_019750_F9DF2F60 
X-CRM114-Status: GOOD (  12.00  )
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

Hi Gerald,

On 6/30/26 09:48, Gerald Loacker wrote:
> Add support for the optional rockchip,clk-lane-phase device tree property
> to allow board-specific tuning of the clock lane sampling phase for
> improved signal integrity across supported data rates.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Acked-by: Michael Riesch <michael.riesch@collabora.com>

Thanks and best regards,
Michael

> ---
>  .../devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> index 03950b3cad08c..913aa688c0ae9 100644
> --- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> @@ -56,6 +56,16 @@ properties:
>      description:
>        Some additional phy settings are access through GRF regs.
>  
> +  rockchip,clk-lane-phase:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 7
> +    default: 3
> +    description:
> +      Clock lane sampling phase selection (hardware tap index 0–7). Each step
> +      corresponds to an approximately 40 ps delay as described in the hardware
> +      specification.
> +
>  required:
>    - compatible
>    - reg
> 


