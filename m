Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46836C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBm1Wzj4BfERzM11I76dZxF/81NgZjZU3GpBir27U1A=; b=BXMg0o2AqM9AUTLqzT50JhraPj
	CHx1q+btZIHknRI//HYyE2Seuq0gDBp4LIOV2lhilpoKLMq47ZwhACW+22WNNXNppVpXnnLyLDuwj
	PzSGvUpEqy+VhtF4QMcmLzYnYxcDPY4DcgXc3W+4iW8IfrhSjKDdW4VtgnXKLc4q5b5pxCuooyUXn
	+2oZh+RFZCtVkqPXdiDiXvSNatJ0hxPCUTGicP1trXSzg3FbpWzl5/HpyEuoc25V7C1Ix0PczL2JO
	xoxYUTzV5EGNV67OUHKVzONtbc9TQHWFmEoLDwwbtB49vIIir+Bv1lisRF4E6im84ey0vR4npm5t6
	uYWqq6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveZO-00000004vSb-0N1k;
	Sun, 16 Aug 2026 17:22:50 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wveZL-00000004vS8-2a6D
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 17:22:48 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1988219a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 10:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786900966; x=1787505766; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBm1Wzj4BfERzM11I76dZxF/81NgZjZU3GpBir27U1A=;
        b=aEZF+I2c9BZZyJdu8Vdn79OZJfqEdGtYrwiCygKbJXW+XmVO3R8x82UM9j3Aqo4OXe
         ch3OC6JgrBjL52KN9xkqe+2RMIVt5n/YiEEtrswvOMHHmrO2S0bStP+thQcY07++O2Hl
         L+i3G8D9/av5A6NOaeUGhbySIjq3s/dj4Lsy5f8NWOThqklsVUnv9m3viHb55EfxOljn
         RdT1OndH9Li6X0EDXTmL2e/ddbstPCyya+c6VF8eekOaQC2cdMdg2JFDlHVHnkxDbPlN
         kna8RV1qT7IC3D9+UOfqGYbtlvf7m4qu8l+Ci125rP5ReKX/K7dffhJQRMaISuGeygDQ
         1YOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786900966; x=1787505766;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBm1Wzj4BfERzM11I76dZxF/81NgZjZU3GpBir27U1A=;
        b=M98Hh2sg70XIiz5zMmD1WseXhXS1W3p5d+I9PK3KSVpgi0dlr9Wo2DysS/PuB9FYjf
         FIXJ9DH4uANsyeAUiV0PTXD8id/lyUyog8ZVdD1meYGIKOTzIKh5eHSYVuIyWFkIzY20
         eEKxKBAsQHbeOPwLI0CF4B6CKo3ievRTL0k91Da7eUou6Di235rvML9ySxi1EgPwLZSx
         6yovZjmitFqiGn1jN1cpj9pVmZ3harX/UHSCz/Y8GBt+sK7hscrfAqPb2be8A08+f3fU
         r84Nd/bpO+XPAQ//dBd07t9C5+mZ6LFyPxRykbFr2BjIy3zutGixjaoCpPu8GhWvJZA7
         KPsA==
X-Forwarded-Encrypted: i=1; AHgh+RogHfI1i6Hdagu6BmvodH7QhL4SlERQPF9TDly99udeWy6yBBn8ZnDXQrAFGddMw8X3W9K6KNfyNxBNj5xYJE1+@lists.infradead.org
X-Gm-Message-State: AOJu0YzKSVsMqUv2Uw4T+gTKJj/+aQ9vE8SsgbkHDlP7gNr39qCg9DVD
	njmI71e0EeMnkNucPJX2EalePXPGjnfkHd3vQ/9IfHIlmkuWPyWQkHw4
X-Gm-Gg: AR+sD13nPH/v0yynu/kr1tn8UxXZVboelq0smC1lhXVjzd4+vLCm+gc4uxj7exSfzid
	ysAXojFcDH9+TwJZ1kDMXPNEq5U/fxw8vZSAqqj1JBHJAkXei1TQwZQ65fdZFyB3N9CBd7CO+Ll
	cvT/npdjuTqIQpQUFI7s4+dK0914Ijd8V5yzzr2dAUKPULXKM8lIGWGkI+J3mr8cLaykb0P0WJY
	T6M45QXrpNw7b5B40jSFkvL7rPCIu02GXNwJ1GNZnqa7rym8lShadQ/fZGXwAelDg8xkqqJqg9V
	sukZKYkjqa22Hyndq2/oKaeM+68ztAhQARXBZDpvvgBZDpCYudK5HXNSCmqWdzAGfYt8qdghlJ9
	OW/wvtBf7FSZp2zWwb4NDWsht40iLHC3D/GyJxPlsbcU4OD2/GF9jWv5knvpnRIVztWVOGcomag
	EP/efKQlYPNglAH2nQGnR5HGKD1XMLIK0sDs0pWBjIQZ8iuCBturi+OQBqlI2vMpDs0xf0LOFsf
	IYuUyqgpOWTLWPkDmJtUEZlGRHE088g3HwSO40=
X-Received: by 2002:a17:90b:3c91:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-3933b78e3c2mr21847371a91.7.1786900966082;
        Sun, 16 Aug 2026 10:22:46 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:e503:403c:f88f:3e17:55ae? ([2406:7400:56:e503:403c:f88f:3e17:55ae])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03f9sm28351382eec.19.2026.08.16.10.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 10:22:45 -0700 (PDT)
Message-ID: <fd81d0ce-46d4-4655-aebf-1387e5b030b6@gmail.com>
Date: Sun, 16 Aug 2026 22:52:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ARM: dts: ti: keystone-k2l: Rename
 ti,davinci-spi-num-cs to num-cs
To: Bhargav Joshi <j.bhargav.u@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com
References: <20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com>
 <20260816-ti-davinci-spi-v2-1-6c6f5171422b@gmail.com>
Content-Language: en-US
From: Dhruva G <goledhruva@gmail.com>
In-Reply-To: <20260816-ti-davinci-spi-v2-1-6c6f5171422b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_102247_715498_61466ADD 
X-CRM114-Status: GOOD (  15.75  )
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

On 16-08-2026 03:53, Bhargav Joshi wrote:
> Property ti,davinci-spi-num-cs is present in the SPI
> nodes of keystone-k2l.dtsi, but it has never been documented in the
> bindings or matched by driver. Driver relies on standard num-cs
> property instead. Use standard property num-cs instad of
> davinci-spi-num-cs.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---

Reviewed-by: Dhruva Gole <goledhruva@gmail.com>

>  arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
> index 330b437b667f..39a846d7f8a4 100644
> --- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
> +++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
> @@ -401,15 +401,15 @@ mdio: mdio@26200f00 {
>  };
>  
>  &spi0 {
> -       ti,davinci-spi-num-cs = <5>;
> +	num-cs = <5>;
>  };
>  
>  &spi1 {
> -       ti,davinci-spi-num-cs = <3>;
> +	num-cs = <3>;
>  };
>  
>  &spi2 {
> -       ti,davinci-spi-num-cs = <5>;
> +	num-cs = <5>;
>         /* Pin muxed. Enabled and configured by Bootloader */
>         status = "disabled";
>  };
> 


