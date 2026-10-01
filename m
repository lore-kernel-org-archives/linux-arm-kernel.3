Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E5FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkYtUBxUyQXi2wHjivuAC69Sw5c4fAlKZiLrX6CMriA=; b=MWRLVChEfMv25iA8MN3liYsuXw
	StVpx6DacWQILbqLb2TDGgn8DlcgFT2Z0ct/h5NAp69w340gVyYW18XoLFimMLMVJQjIzcs2ExkRL
	DyzvDiIuXZSm4fP47F0Ap8jK1YHHaXmFLbmpYpYk7K1mITaaPvKNPK3mSzRtHti/n6CWt0JcgwLbf
	iAVfo1Av1Dl7uPf6Fb2/d8nPrdOMLYkbde7KwAg8MdICCNf6X7zW7V15sVw0dymCQo/hYVjjkLWvV
	Cu8m/sGTlWO/RPLHRcooNETDLgsEtUPKWR8ww3EdbqM1JL6+z+Z2jG7uBVf+ka5OP+ZeMUHhK2MPM
	m1+CBLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCT9-00000008GOT-3L51;
	Thu, 01 Oct 2026 08:48:47 +0000
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCT6-00000008GNd-3tcB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:48:46 +0000
Received: by mail-pz2-x2b.google.com with SMTP id 41be03b00d2f7-cc78dd54610so2286630a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844523; x=1791449323; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkYtUBxUyQXi2wHjivuAC69Sw5c4fAlKZiLrX6CMriA=;
        b=eoYSOPX4OnyUESUwFLsMX8Oya4uob9cQSHZmLWlm5Xrx+4sX/2I2QOOf9Z1MuJELRp
         Leyq+dbGSx0EBkXpJdRACryDpOYOZPeA9bVvHL+YCngA1sJ+uo8Z5evF2rpuDxyhYzke
         Dcx56z0wp2vfSpetrp7L1j4hVx3Mw8n4o8H63jCZJJ13X1PcZpItSohvHefMFgm7nB75
         F+AmlErADs5C8yb4QSTh3PxE6LNUeqb23HTZxXs5qlI843OwJf+lxdXRCqDWp55sxkzO
         ldXP0Yjcstt1iM/q3tIkIzqeNve7Aq5XinqPUUfU8zSE8c156haXGmSBmdySYM+iLBYn
         +5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844523; x=1791449323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkYtUBxUyQXi2wHjivuAC69Sw5c4fAlKZiLrX6CMriA=;
        b=ME8Z7ebgJKz89bWI4jNhm0Siu0xGsXcd1efTcuSZxGSMEnsRgR6osDlKtVPKYoNHXG
         ZFj5/OEGGP0c5hvagtcWsu6/xPu1z5p9tJ3qdteGhqHIQIKOqpbWG2uXhY+icBucXk8n
         9xMjSUQKwcEsbyLtYhtbfJFZAz2jJZxf+lbLMfpNjTw4oFm+kHbJpoI6Ko+mARpWsh0T
         RdDKgTcnm3GClM5XbqdhYw50r3PWkEA5KVUwzm5UHRYwjrwmEiBV2Y3FlV7ZGu6mhlzW
         Hqba8aaTNz0/2syRWXXf1jC+zqap29gBgNEGpGfCvIgtssosTl/C0s0z/v2tEr/fAyO9
         U+pA==
X-Forwarded-Encrypted: i=1; AKwUvBzvFXidtZzdBxWYooSDCuQs5rnIROI+X/hYPaRum7TlOs8NUBJuV5TgzoZHpgjacVcIGWJwcPuDT8zN8B9gfdWt@lists.infradead.org
X-Gm-Message-State: AFuF++nExuVgX4B9XoSY2v+Ynyf1qhJyM7+Lnzz3WV8fmKsDJ/rBnBVV
	jKanhQsfn0nkbhl66Cv1rM3BN4JMnJV5obG8l0/tSNBWEbCw6PBqbkpf
X-Gm-Gg: AYBFou2lC3TgrJnUysWtxvTs4bJbgZffvYbmZrJWua8u+WRopvRG2y6XpqQTIuETesc
	vJ8vpcVABi23aVpJKO/WxDyi0eJzcYDeJSdxsq1VSpifQxv0BwZItSoOoBPjEnOb99lkoeTgzjs
	lxE3OYlwG4ZILmEwpKHPE+5UMFUl6T6JzjuSv8M0El8g3NvcK98DDvkzaVVKwW859PpUyudW4SK
	zH66KdJzEns90qZJEzK4SFvxsuJGKRxNWPgiI1Ebj+1axyECN99wdYV0GuHKanzWdGsti27B/lX
	NbQV586e4Qe6CE2Gp8sV6pgHLs70upIJKEpM39QACjYeIzt/mOsYKwI2xo6yTutR7SbCEq+3LB9
	eurXkQxUCPMweGef2EdjUm9bCkWuzUltSzWrP0OaCRyZN1Gw432kVl4WGilbaknNk5CxOxpJhUT
	sZCxiPgMkgaRbRl9XPocvqPMfTRRaJpoMZ9ZmtALdWnoTvB9tSy9fqk0dKHtHOnrgiJeaELUKdt
	KG0CjSXXEaaO92vE9U0rIe4QJp/OKSCE/qq4rIoHIC78UbvAbpyITU=
X-Received: by 2002:a05:6a21:9218:b0:3dd:85a8:cacb with SMTP id adf61e73a8af0-3de9e8a898fmr4391298637.34.1790844523436;
        Thu, 01 Oct 2026 01:48:43 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e546039dsm1125695a12.8.2026.10.01.01.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:48:42 -0700 (PDT)
Message-ID: <92216f9b-6c8a-430d-9bca-eaf583106a3e@gmail.com>
Date: Thu, 1 Oct 2026 16:48:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: Joey Lu <a0987203069@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260929020854.1282339-1-a0987203069@gmail.com>
 <20260929020854.1282339-3-a0987203069@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260929020854.1282339-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_014844_974904_0964C775 
X-CRM114-Status: GOOD (  10.31  )
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



> Add the USB subsystem nodes for the MA35D1 SoC and boards:
>
>    - usb_phy: standalone PHY node with #phy-cells = <1>, covering both
>      the OTG port (PHY0, index 0) and the host-only port (PHY1, index 1).
>      Uses nuvoton,sys phandle and HUSBH0_GATE clock per the binding.
>
>    - usb (DWC2 gadget, USB0): phys = <&usb_phy 0>, dr_mode = peripheral.
>    - ehci0/ohci0 (USB0 host): phys = <&usb_phy 0>, companion pairing.
>    - ehci1/ohci1 (USB1 host): phys = <&usb_phy 1>.
>
> Board files (ma35d1-som-256m.dts, ma35d1-iot-512m.dts) add pinctrl for
> VBUSVLD, PWREN and OVC signals and enable all USB nodes.
>
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>   .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 36 ++++++++++
>   .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 36 ++++++++++
>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 65 +++++++++++++++++++
>   3 files changed, 137 insertions(+)
[...]


Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang



