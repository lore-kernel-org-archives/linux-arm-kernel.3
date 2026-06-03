Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE66CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 18:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdBtN29xNi8/LyCh+t/0E+11ZLThWT9XDbN5icW4kfg=; b=4Pw6CYWL1GPNGkNcoJnzMrRA6p
	tgnk+CDRNK6PXi/OvY7e5ix5vr1ZiIi8o0WmjOFeLDvqZq2Sv63lGI9s5dD3ZquOhOg2bWoWZZiJJ
	DexQdKp+jh5yhdOUJHmiXs5IpTsHikl8tgpYLDh0ICattfO8EUW0nVL+2a5X47fv22Jqq/fHZ731z
	gFZNdkXYVsthGOEmTGT38ytliwO3yXwF6cax4FQafaA8825hWJPGruMnYfDqUNzog7UZkllYO9gOK
	5MSqU6nxcmktNu5IOxDr/y8aJoWKCmA60afiAeJaUViNwSPWf0KzK/oU+k2M46R0Z1tX7XGWg9i6T
	YJtouzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqk6-0000000FiOd-0gcU;
	Wed, 03 Jun 2026 18:55:06 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqk3-0000000FiO7-2cxK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 18:55:04 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-43ca73487d2so562319fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 11:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780512902; x=1781117702; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bdBtN29xNi8/LyCh+t/0E+11ZLThWT9XDbN5icW4kfg=;
        b=CQtGlfA0TtiwXlvvKTf8CGHnmlm4PaRQg0CKHEYSyow8QXqzLPO0imNIMhc02rNh7r
         aQCXyqbm9pBaQNkNvcj+plTt/t5XZsRK+Lz5TW1jDjISrxbM2uH6VRVpX6OMeIA95wuU
         Lm9MafG5AKGPo4oMQH2DudrGNHKAAT9Ylxp6T/7eecnowCqltdd7PJnnHfsIebMPSa/Y
         hxcTZBlM4yxNnyrojZRoJ0506A5BOcZKVAEe2NXTvCftHDfwD65WoGyAsGNwwMJLt1dE
         YOGSkEXEZl7E2vmArw6sH3CLUbM+bzMmVx/BKmGY3dRXz5ZdfSdG66wofCk+PFdCoGro
         n2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512902; x=1781117702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdBtN29xNi8/LyCh+t/0E+11ZLThWT9XDbN5icW4kfg=;
        b=Bd0grpfvy/xPBpaxz0RUsq328H3mB9PS7W/3Gq0JAOY4V1ds35kgvfifPenfa26T07
         iWytZcyncJYtKvNqRrEZb2MoDfclcbksDKNiu7KJzNr2yE1l14KQTm48MhINjd25d7hL
         0xUM3weqraRvgR3aumiHrQX8nf12LPWLxUWHjCRMbQw/Cm+XgigcITpLcOSQuRN4buKj
         dsmEUkfd/X2QCvHcbjiYw/sQ8CVdP5PUOjkAtvIR50S8hr0wE1/9xmDYei7KwHPUJ0xH
         xsTAk5VGFL7pShEdDMXN/tKCvLgIvpBxQ1wxTBtfE5oNxbSK3dLJhOeTT22tk6j+JQq0
         eEmQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mz9NQcqMiMm9JOYMemLs6MwxNNeD68Z0Z/yaV1GuGId/RDhjKurk/Czjk/W1WFMXAiD/ScdLiWk8J1XWNXwaQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwz9QwFoEuMXexjBmltA8w7v8jF6RGymhvFC8B2ETjJ2kDFOwf
	AskpMf538Zrm+WcBN8us1MmjAmiUPhdfjEgCmRHdYmEcClTM9LGGfw3U
X-Gm-Gg: Acq92OHdewoj0kD+1Pq8hjjNhHcIf7oZxJyMg4YxF68bv0b2DdWi9WdqcFSGxgEq2kE
	Kl+QMva9TCr7S8CvzV/4WsAy+CSfXjLBkBsM5rC7IPbiv3x8G2l1nGj2s+u9ymQ52BF/34Si8jn
	bcWUOvcjgLIZ8m1vueRGOqffqRDWqjosFI4BTGP2teJD3bG/uaXTF7Pq5Y6TikDJcWUJK3RopnG
	+5EkOc6hF8bdCIcst9fedTAKJQW+d5Q1YHfBiI6NXB77gQ0SI8xh43CAgz5CplRsPV6et7awEab
	UM+zqI9gDVDjWyqE/3yH3oXRrc6LL5uC370E8ao7RgAFeOgJdjBO/Io0gfv1cNBnDZgX9umjOzj
	kAh7/sS8QBEqbGZU6I/LIKoaDc8rDkabLf5hQQDB4lH+pArkuEJGhsJX1RUjUlv60BisNzfBZbT
	gYgSUUkvzMBqGQCjNEHUrsS6qb+mD7ZGs6S3/NL24=
X-Received: by 2002:a05:6808:3448:b0:467:e1a8:2b92 with SMTP id 5614622812f47-4866fdbe769mr357757b6e.10.1780512901986;
        Wed, 03 Jun 2026 11:55:01 -0700 (PDT)
Received: from gmail.com ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b5a5a64sm2454351b6e.4.2026.06.03.11.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:55:01 -0700 (PDT)
Date: Wed, 3 Jun 2026 13:54:59 -0500
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: xuwei5@hisilicon.com
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: hisilicon: hi3660-hikey960: move role-switch
 endpoint into connector
Message-ID: <aiBVHbRX3wxUNFs2@gmail.com>
References: <20260520215325.55353-1-akash.sukhavasi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520215325.55353-1-akash.sukhavasi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_115503_696301_D52D6E08 
X-CRM114-Status: GOOD (  22.34  )
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

On Wed, May 20, 2026 at 04:53:25PM -0500, Akash Sukhavasi wrote:
> The rt1711h Type-C controller on the HiKey960 has the USB role-switch
> endpoint placed as a top-level 'port' node, outside the connector
> subnode. This triggers two dtbs_check warnings against
> richtek,rt1711h.yaml:
> 
>   - 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
>   - connector:ports: 'port@0' is a required property
> 
> Move the role-switch endpoint into the connector's port@0, which is
> where usb-connector.yaml expects it. Update the DWC3 remote-endpoint
> phandle accordingly.
> 
> The TCPM core (tcpm.c) looks up the role switch starting from the
> connector fwnode via fwnode_usb_role_switch_get(). With the endpoint
> inside the connector's port@0, it is found through the primary lookup
> path rather than the device-level fallback.
> 
> Cross-compiled for arm64. Verified with dt_binding_check and
> dtbs_check. Not runtime-tested on hardware.
> 
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>
> ---
>  .../boot/dts/hisilicon/hi3660-hikey960.dts      | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> index c6056a85c..27fb08d34 100644
> --- a/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> +++ b/arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> @@ -550,6 +550,12 @@ usb_con: connector {
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +					usb_con_hs: endpoint {
> +						remote-endpoint = <&dwc3_role_switch>;
> +					};
> +				};
>  				port@1 {
>  					reg = <1>;
>  					usb_con_ss: endpoint {
> @@ -558,15 +564,6 @@ usb_con_ss: endpoint {
>  				};
>  			};
>  		};
> -		port {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			rt1711h_ep: endpoint@0 {
> -				reg = <0>;
> -				remote-endpoint = <&dwc3_role_switch>;
> -			};
> -		};
>  	};
>  
>  	adv7533: adv7533@39 {
> @@ -683,7 +680,7 @@ port {
>  		#size-cells = <0>;
>  		dwc3_role_switch: endpoint@0 {
>  			reg = <0>;
> -			remote-endpoint = <&rt1711h_ep>;
> +			remote-endpoint = <&usb_con_hs>;
>  		};
>  
>  		dwc3_ss: endpoint@1 {
> --

Hi Wei,

Friendly ping on this one.
Also, is the hikey960 board still actively taking fixes?

-- 
Thanks,
Akash

