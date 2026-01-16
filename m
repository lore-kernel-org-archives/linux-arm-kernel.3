Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9241D4A5F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 03:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgeXhAk6KNlbJlhP3Z45ZVXFzRmMcBeJhfIQXTAsmxw=; b=D1ug2SxscWmBNdWteH3dYZ6QI6
	+doq0ryGpPMKWGgr8PeLZcLOisaTG1veHcC1hx9CGGTkQXIGu59WV9Ko2/0y+U/VpBgQdQro/HmI0
	DcJ8e5z+Qe8yMoebRkA0gck6sWOZHH0I20bfpA3+IXAGLLnM8xh7xWAq/FgMH+C+2e7U9VxqhiqLB
	6cmmNrIHCNBgjZU5mwDy39Jypo8hCtmOQ5v0WkY+Qqzw06a/mTAClOd21vMl/SPBnPaLgup+WMTUv
	vQhzAaIGyZ7FdoT8TkTEIQozenbwF81CH48EJg69zV2fOK1UbAed1bZb6qdFwLj/uLNTIQZmWbsbj
	MvfT5NBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgauH-0000000DYCT-1SPW;
	Fri, 16 Jan 2026 03:53:53 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgauE-0000000DYBl-0y1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 03:53:51 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-34c1d98ba11so1205512a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 19:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768535629; x=1769140429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DgeXhAk6KNlbJlhP3Z45ZVXFzRmMcBeJhfIQXTAsmxw=;
        b=i4rJyO0TIjH6oXddarsO66RD+rlBo3ka4vQAQDvUovKBTTGyiH9GOhioBWVLvc0Jgt
         F4B3qTGCfAa2Beh+jlEozfjO1Y4FxWYkYh28Iw2IhqLjV2Q3dImmkMYtDfuaseu0XUK7
         dk2iEiHw/fNk9867NZnyJL3UgTt03cE0OXhMvLJFmg3xqXwb4HP9xon7iQG9t34ns5wU
         f6zSqxp/DBP+YIyNDzucO5jG8Pfohu2K86FiT/Mm4ZUqi/wxJwwHd44TS6gx4tq4s3z7
         4sMwK4v/o7gqTQzNA62mbtFU7fAsZGq0kEIDBgBC3ExUpErpy6mn+ywHnOhEZ8Qk4Hu+
         vy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768535629; x=1769140429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DgeXhAk6KNlbJlhP3Z45ZVXFzRmMcBeJhfIQXTAsmxw=;
        b=MYhJGzy+2A3rDUI0nqZKqYa7X0k0q7zHgLmAn5X1iKApC9dqscIrI9Ae7OamCrJgMi
         k883Scf2zlAS0p9mZnzS7IcXdwW4jHGu1+BEzPcc6T4FmaDZGSP4ftwWX0ZXdDd41LHF
         OzOYaZJcYqk+R3IaijIsBtxckA0xGpUNYi64TCNH+iGDQtfWwvS7iioeEGAExkwqc6Ll
         rGfCVQaMH2HvVyqZhL+ZNol5Ey2hX3WmKNuAFQytRVo7MZET2fJPkKmYs2wO4GUCB9up
         OZ5K4K35FKnpqxJ5iFCkD/czAPSHHkK/VU8GHX4L1A5Yzc7LZhU7IgjL4nq252QhQ+pr
         A2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVsqvrSn9ch/RZpVZRIfscN91v3MZ3cN3Ya+xHkHAFU+Nd0AYcEoPIyJAWFspXx6HxTCxdhdP8P2V8Y1bzbaq5f@lists.infradead.org
X-Gm-Message-State: AOJu0YzqZw907e4EneiU2rxH2E/CYtpWytn/OZW6G0NrYth5MQ4ai/2U
	7T9Fh1AcM1vptzgyubHJgSzIQzWDWRc36+yTih8Ec0Lx2zdfwzTns2zO
X-Gm-Gg: AY/fxX6GpOLl46CIm2ZbzoVmb8y0h+mT3VJcJpp4vRtFTTpwLaZhlVS5O/YgLiPVaV0
	xPwP1c2po36ffjrYFEZxPZD69O2x05R5ZAPdGrlH+lJ5SBkRd1OoF2nXVEenqb8qscZDXp2u4Hk
	W+XoazdYKdrHUqtdfgymLGlPRNdxbsb7HDcaYrw2fV01lx1bhlDTc78lCyNd7V7MJvVRfjmvQi6
	qGruwUzLmLIE9FAzXMuGsVLdD/PvdqM71hYqiovRbcpC6ntL7+5ZuyDfRd/cUsUURU2QpHPcsLP
	P4MUYqGCm7Q5FapJ7LRKg8pyzLssJrdMYgwDCHkbx6c7jHUvg5xTV/nNqbZbn4f298yy4vqfvOd
	/oLLSuFWQsfsC3WP0Ke+VMIjfDTGMkECg1t/ATiscAFU1u5PQgvu0hr0amTf9CfKt2efL1faid5
	o/Xf4rRx2vR2eQHPKArB/BWy+5cwd5RzKL3XXFeeNI3LM08xSSo44/G76A3vtsjFuDUIt+k019A
	LRStJmHxTOayrO277i1gn6NSahLAHqQ3d9Tf0AWCsxZecC1ihXnwyphe33bXK2eiTmSU4A=
X-Received: by 2002:a17:90b:4ec3:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-35273296f05mr1371287a91.33.1768535628572;
        Thu, 15 Jan 2026 19:53:48 -0800 (PST)
Received: from [192.168.1.110] ([125.253.50.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527305490fsm751473a91.1.2026.01.15.19.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 19:53:48 -0800 (PST)
Message-ID: <121ede67-dbfc-4b79-8076-04693e9d3d53@gmail.com>
Date: Fri, 16 Jan 2026 03:53:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712: Add V3D device node
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel-dev@igalia.com
References: <20260114120610.82531-1-mcanal@igalia.com>
Content-Language: en-US
From: Peter Robinson <pbrobinson@gmail.com>
In-Reply-To: <20260114120610.82531-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_195350_302548_30B2F4A0 
X-CRM114-Status: GOOD (  18.12  )
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

Hi Maira,

On 14/01/2026 12:04, Maíra Canal wrote:
> Commits 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
> and 6fd9487147c4 ("drm/v3d: add brcm,2712-v3d as a compatible V3D device")
> added driver support for V3D on BCM2712, but the corresponding device
> tree node is still missing.
>
> Add the V3D device tree node to the BCM2712 DTS.
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>
> ---
> v1 -> v2:
>
> - Rebased on top of linux-next (Stefan Wahren)
> - Fixed node's address (2000000 -> 1002000000) (Stefan Wahren)
> - Link to v1: https://lore.kernel.org/linux-devicetree/20260113192902.48046-2-mcanal@igalia.com/
> ---
>   .../boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  4 ++++
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi          | 14 ++++++++++++++
>   2 files changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> index 7d4742ebe247..97522c6803c5 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
> @@ -247,3 +247,7 @@ &pcie1 {
>   &pcie2 {
>   	status = "okay";
>   };
> +
> +&v3d {
> +	clocks = <&firmware_clocks 5>;

Looking at the upstream DT [1] I think this also needs a clock-names entry.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi#n233

> +};
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index 330a121ebfcb..661668ef7419 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/soc/bcm2835-pm.h>
>   
>   / {
>   	compatible = "brcm,bcm2712";
> @@ -642,6 +643,19 @@ mip1: msi-controller@1000131000 {
>   			msi-ranges = <&gicv2 GIC_SPI 247 IRQ_TYPE_EDGE_RISING 8>;
>   			brcm,msi-offset = <8>;
>   		};
> +
> +		v3d: gpu@1002000000 {
> +			compatible = "brcm,2712-v3d";
> +			reg = <0x10 0x02000000 0x00 0x4000>,
> +			      <0x10 0x02008000 0x00 0x6000>,
> +			      <0x10 0x02030800 0x00 0x0700>;
> +			reg-names = "hub", "core0", "sms";
> +
> +			power-domains = <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
> +			resets = <&pm BCM2835_RESET_V3D>;
> +			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
> +		};
>   	};
>   
>   	vc4: gpu {

