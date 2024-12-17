Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C773E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gk4RcM9aoEcltTSIN+UAXyLDoftjcHRAxwNl+W6CGjA=; b=CXrid4DLVIEqiGEyyV8t6IKIBX
	0CuEuXoe2saIRXzOvmMJCjwBWnsToZ8g39qTRgdlRn89298rWG4Tu/tgF0vpk1lQamUhjreEQwt0F
	XWtwL3bQQqYdxiyf2qW0AWXdMOfCL4xwF5n3Xm5IUl1DHJj8ODclqDXgBTpzhk9mCXWIvg6MzXgmP
	wSf7q8iimbfXvwAhAaq8jCJYqw/zcJWRi8ljGyp20QznpljsNDsyXszQqpx8reKfHPKYQgWoMmB8l
	K3sYV6mYEpLxDcnWKs3QyDefediXMWNqEzQaPARzixxvk9ez7jjnx2HZawSiQPVDXuZwTMF1aLTVh
	kMKKvXpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSMo-0000000Cd97-2Oud;
	Tue, 17 Dec 2024 07:51:42 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSLD-0000000Ccu7-2q8n;
	Tue, 17 Dec 2024 07:50:04 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso877510366b.1;
        Mon, 16 Dec 2024 23:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734421802; x=1735026602; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gk4RcM9aoEcltTSIN+UAXyLDoftjcHRAxwNl+W6CGjA=;
        b=hq7mVEuq1MDzPHPZQYPlAApvfvEjFVoL9jyWjhQMutXeH+K6m2hMtOyMaL37Y/nbDP
         Fr47xmsaPuBRSNwdWf6YqJ/eGT2jDK9P673ssVNJeIBsCl//UGQIuvoi8VrYs/iJVRu2
         E25vPFORSKD2ZJfKWaAtNz8iixoVDx6yz0ztOErr1edxBCm0vAXmzSDoSOIWEeeJGWz0
         /1bqW5n47KeIp1LylLWLp0IjWW3ixthjAf+KmYEqcetP/RbkEYtJH9Funp4E4TQyoPAb
         W5vmdiWX9P8uTf867EGbYgpPJx6/hfbIIfftLAfsBFtcQTB4e6fDCIxqIgXdQD/w5O6I
         5K5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734421802; x=1735026602;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gk4RcM9aoEcltTSIN+UAXyLDoftjcHRAxwNl+W6CGjA=;
        b=oUqG/wyr9QDhcZCrCxoDgaT8E7+uUe+Zb3+OvYe+fHcZi9jyb8W1pM0eX6O0/Yt0ve
         +rEXm8ff2w3m6yaEtP16ilt6JKozxTotmAWIhArRZO/0sUIrgOP1p+dxLmeHLuV1bott
         h8aQLxTqLN1pXCk/TKlYrwDwSwegca6lOhzshAiPjAy3G9uDu/vWersLelwclvPVPVvs
         Z8ktK3jB+ANyVBZQHWI/VwFTqrhtRJuhTvYov0VfzRAah3eGLBXQs/bCuNmkyEmjiwVL
         EcZBC8Ryq3Bb63Ph+vWiKdRXNB1eTSv1ePQFQmffx5EG2OeZA+sSyEtw47jdsyUV+KCM
         UkCA==
X-Forwarded-Encrypted: i=1; AJvYcCURutz6osOq2spuJ5zoNIy8BIJ7teMg+i1nliIyQoK9plbzolS69KTUo1M0pKvp16qwhQQ136VLohly5UFjI2VX@lists.infradead.org, AJvYcCXFoA5H2OLJhL4b929ghu3xk1EAgpRhWfGZ4Cf5CS4KbhbgmRCUxKyRjsLnfKDfiHuVt1Ma10q9gafnOnIQuHo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwddKpsAIOO+5+8OgKqg3tq08zhk/LAmGH3l+F3y1JZTSs0rMoT
	qbvCLbAEeqpZa+NbH+IJ9UBltdmg6uM6t2H9TD+8uKryBTFOypOr
X-Gm-Gg: ASbGncvwRLuXKUxd8hzXL7Krv+uQ02bacPNq3cWmUalJ7MWxBntNKsrI47iVi3yDerF
	GVfDnWD0Bor3PZn5K33825olh/aPKE2OzbjpAqUaE3SYYFiJiyXijAlNB3SnNl3Em6izpUuPuKq
	pyRVrZ/xkjFACw1OA2qbmgY+UNBUgeqIF+snaxv4fmCrZgQLMUeTmGc63axicLroRLPQn9xNh+o
	QodXDkxGin8qK8C+HjuGIJAHAfNXFCWYx6UxXONsqTo05yWxY4qI4e7u0B30djs/K886+Uo2KlP
	Wj2ZfHNQnWrvNoYLxNH3x8A+59TlCcW1qtVXXwmn3KrcDS+7C7W2Mohe1rG5jbgb0fSKOwe4RnI
	Dh3PRKsB78VmqNn5rb2G7iOsk9ZJMxnY=
X-Google-Smtp-Source: AGHT+IHbCRByMXBtQymiivOVjXWEpEJtUdTZwAxA7kak7fLa7ofz1GdLtTXeNFcTkveghwVJFd7PcQ==
X-Received: by 2002:a17:906:7da:b0:aab:de31:52d0 with SMTP id a640c23a62f3a-aabde315b3dmr177449966b.18.1734421801590;
        Mon, 16 Dec 2024 23:50:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963b33b0sm416941066b.184.2024.12.16.23.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 23:50:01 -0800 (PST)
Message-ID: <e1e271e3-b684-46d2-879d-e3481d25a712@gmail.com>
Date: Tue, 17 Dec 2024 08:49:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: pcs: pcs-mtk-lynxi: implement
 pcs_inband_caps() method
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexander Couzens <lynxis@fe80.eu>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <Z1F1b8eh8s8T627j@shell.armlinux.org.uk>
 <E1tJ8NR-006L5P-E3@rmk-PC.armlinux.org.uk>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <E1tJ8NR-006L5P-E3@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_235003_727504_354A6B45 
X-CRM114-Status: GOOD (  16.60  )
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


On 12/5/24 10:42 AM, Russell King (Oracle) wrote:
> Report the PCS in-band capabilities to phylink for the LynxI PCS.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/pcs/pcs-mtk-lynxi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
> index 4f63abe638c4..7de804535229 100644
> --- a/drivers/net/pcs/pcs-mtk-lynxi.c
> +++ b/drivers/net/pcs/pcs-mtk-lynxi.c
> @@ -88,6 +88,21 @@ static struct mtk_pcs_lynxi *pcs_to_mtk_pcs_lynxi(struct phylink_pcs *pcs)
>  	return container_of(pcs, struct mtk_pcs_lynxi, pcs);
>  }
>  
> +static unsigned int mtk_pcs_lynxi_inband_caps(struct phylink_pcs *pcs,
> +					      phy_interface_t interface)
> +{
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +	case PHY_INTERFACE_MODE_2500BASEX:

Isn't this the place now where to report to phylink, that this PCS does
not support in-band at 2500base-x?

Best regards,

Eric

> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +		return LINK_INBAND_DISABLE | LINK_INBAND_ENABLE;
> +
> +	default:
> +		return 0;
> +	}
> +}
> +
>  static void mtk_pcs_lynxi_get_state(struct phylink_pcs *pcs,
>  				    struct phylink_link_state *state)
>  {
> @@ -241,6 +256,7 @@ static void mtk_pcs_lynxi_disable(struct phylink_pcs *pcs)
>  }
>  
>  static const struct phylink_pcs_ops mtk_pcs_lynxi_ops = {
> +	.pcs_inband_caps = mtk_pcs_lynxi_inband_caps,
>  	.pcs_get_state = mtk_pcs_lynxi_get_state,
>  	.pcs_config = mtk_pcs_lynxi_config,
>  	.pcs_an_restart = mtk_pcs_lynxi_restart_an,


