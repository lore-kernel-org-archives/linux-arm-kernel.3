Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9F0C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/p++9I1R/iIuwd/rK6+qw6C6VpxJR29WD3dxkeWLEtQ=; b=MEsM1v1RfBOGNNuaUXlSKZNP/G
	XoHEYDrfByYK7/G9U6MnBxCLLbLN16R2PG/fS+eWGkbq4L894ayOMpasGBZ7N8Agj9KU5t3sOhoki
	AkKrTvyZWwFp3MOwKC8wq8AlWEaLU8DWJJ0SdPjCeVXfrK6JcHh9WlDHpGQgRXCYrYMuxUt6Z5B38
	U8aLxs856k7R7liKkLho9sy6Spsb1dNi5Y91nw6yLTalMlaUEOPGGRTetjrrNQfnlQYOtRUvk6LiP
	JaToHrQvlaESRFRiYfIe7s+AaW1w1XNyq+H6VrmHh3MMztlt67p70d59A5lCGCPCYX40fu8Df6w6x
	8oZnyI8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hu8-0000000EzDk-1BFe;
	Thu, 10 Sep 2026 16:45:40 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hu5-0000000EzDO-2Sf9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:45:38 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1491384a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789058737; x=1789663537; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/p++9I1R/iIuwd/rK6+qw6C6VpxJR29WD3dxkeWLEtQ=;
        b=oNeSkWtOJr8i/CLl0+Pt2C4jsyoPMePDxKa3NtB0ikX9aHxn5lPWrAxqlIWTw0Ai28
         4IHTgoBmcC8RoZz7TgUrXKp1ejxZRgaQF5jDSB3v20aiShb+rKOCaNzdGrVaYWODCFAq
         tSceIdP78qhcDCCp+7CMWIe+Sc0YDQMD1ddC4yKnQY0oX2PydIYpTh2I+TkDq+yHp2aS
         bwNcZHTqe/9j+lMwxZeGfmrOP8aNsYo9unfZ4PDooUPh3l1cN/5DZcRrZRpD3bVB9Dvh
         poineqpZyQQManqqPCfVRTssedqy/NtZXV577UrcQ6sDbK0SXxpCpkQzGhAoGi3RXhw8
         tWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058737; x=1789663537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/p++9I1R/iIuwd/rK6+qw6C6VpxJR29WD3dxkeWLEtQ=;
        b=cK9xtr/jA/5wCl1gGOPUVERuXiNkzdi6T7NwGHUn7mVINVQtxCDlhIEBCnzvLJBFAy
         M3qsrwKWa5IO1i5dCoTISIQeiSqS/xjdVPvFRxEbHosIqkwY8+qJjR09ZiQhHk7xx8XL
         qUIliIQl9MRAMgr94iQGMR4B7VTDKhrxj85Ue6+nfV637uafud5Ao2THJLJDgfwJo6lQ
         E8DGOEMWm6NG8ILQSfpmvdMvypP8f87KM/vVL835ByO/MHyh+k6FC1xQ5dj+n24+b34d
         I0iJp0UY0XObDQQqjLxfNox+v/Am+XqCCigV9IKKoi3OXnU2g+Pn8kQ0g7VXw/MxOwz1
         pK3Q==
X-Forwarded-Encrypted: i=1; AKwUvByBhLAzPwSu7iLP3AdvTsNOKut2oeA3udOyFHdfRUW75MRQIEr3FjGA5BUjwO1mKyYE8X2g2PQwY+0u3InRE3qW@lists.infradead.org
X-Gm-Message-State: AFuF++lmYVCQnbx2JXbdx04P9RsFcjKAyD9isDPo1GeuNFVRejHPbFHF
	TPioKun7+AmplQsBtcnPUUQYUyeyVEjIVhOJQdGjsUnY+SWs7rKtbI7g
X-Gm-Gg: AYBFou05lS72SDSgEidfcaSuJi7FqapyPRzBAhc/UkUzTPGW/GLQAnANWxO2dt4dPBC
	RACqG+GYMw5GygqDitfZj2AMI3ZEhKDU9KNT70I3tH4wD8mfMOR5fayrtkSrYByt1W/pGiw2UFw
	EzVQ5DtJ5T7kEPl67iaJVQKGWLM4P2JoEcVQBBTby/Lxbg60FM1nCa3uaXf75g+h7uP8Br2Zcqb
	/KFG50a/7+uYuuYe4hKmit/D3ZyFkjfmBFFMP57V4+qRfPPQF4uHG2Y1qRI5BJBNhITbUsX7OhL
	fTf/2r9ovVH+Qi7NHZaQpb/HojKM7XbHRTVacmbOCHXGnGnaBo0SlDJvmn0RzTZxCnJ3xMYPRdr
	L1iQw25ZSwNOtFbBivPueE/hU4SPHsQ8U4QEzsHBSkCkZa+PcLE3OiSk9h7Ih8yuxK14hnz4nBZ
	IqkmPqJUjV7DZXq0pi8o1fq6p3fOT3H8YHzBNI1Eo9JFyK8Qot27/q5pPu0eYZEJoydfjP9Zmpi
	fT5u0fA6GgqOvkrp3QnidBb9FxLy+2jswVRmphjuPBqyZV7H5vryFA=
X-Received: by 2002:a17:90b:2b43:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d709e5464mr12712034a91.10.1789058736550;
        Thu, 10 Sep 2026 09:45:36 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm496465a91.1.2026.09.10.09.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:45:35 -0700 (PDT)
Message-ID: <3b6ec7ca-f3f0-4605-af1e-4f6197c7c1a6@gmail.com>
Date: Fri, 11 Sep 2026 00:45:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: nuvoton: Add QSPI0 node
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_094537_630479_7EEE6258 
X-CRM114-Status: GOOD (  14.53  )
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

> Describe the quad-SPI controller available on Nuvoton MA35D1. Bindings
> for it have already been contributed.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> index 7228ad4735b5..9eec44128d28 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -431,5 +431,16 @@ mdio1: mdio {
>                                  #size-cells = <0>;
>                          };
>                  };
> +
> +               qspi0: spi@40680000 {
> +                       compatible = "nuvoton,ma35d1-qspi";
> +                       reg = <0x0 0x40680000 0x0 0x100>;
> +                       interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clk QSPI0_GATE>;
> +                       resets = <&sys MA35D1_RESET_QSPI0>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
>          };
>   };
>
> --
> 2.54.0
>

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang


