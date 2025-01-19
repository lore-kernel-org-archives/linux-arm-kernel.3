Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46994C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 15:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZAYLxkgTuJqE+KNkFf+UOOQy4pcqWaU6mHRJg10BxY=; b=JGQq59UPIy4mHPf1o0CcYcWZGx
	VwMVwPszeYEu4kkMNZa1ivSID/XEDPJUcsJD4UeG3o1OW3VkVJf/ExMyOVIuv47TKsgs3gRuMPt+8
	SkrviE+Mb7rUxK1GDS8QtrZwUxTwNihDWNoAMN/jBocXd+3HjHqDPYzc8fX2lNz5AWNoUEYY2wTZS
	NiFMHI8PU0BjEoxlk5YjcRY/GuRDjI5EPyvgg5qrhqgPs93BkoBV5tVz1/kJ7i+PLKRX6dF+nZJSb
	QbGrG3kkaFOJtfTlDSjUrPGKpo8scEAfefnsJ22VYqX/eToRO1pbbRyoqIEPhHq/3XLByDb9dE0vK
	oyaayv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZXYH-000000044dz-01y2;
	Sun, 19 Jan 2025 15:49:29 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZXX0-000000044Z8-1pje;
	Sun, 19 Jan 2025 15:48:11 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso4695251a91.2;
        Sun, 19 Jan 2025 07:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737301689; x=1737906489; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZAYLxkgTuJqE+KNkFf+UOOQy4pcqWaU6mHRJg10BxY=;
        b=EYjAH8tTnLAuZrugVDXQntbV/2or3AZReUEA0LKJ6PfZtqtFKAPxNqRInVUaXJ6Hn/
         7xKtv+tne8/9+2vFuUzK5mmN/CLATarTR7RmPBL3lp29T/whIO2eaUvf/PCGSqSaEoTy
         Cq0Qs17IuoM90NHEKicnapaoPysm4u2XnMw6WC2UlhOBpNsUn1b0E44VC+WQvbOSqz2j
         fYlpJAYUiASVK2RJLIL/JfXd2Wz4NE1NB1JNIbFbHWVxWhrAZk0/PWgHVgfBjRwFZ9l1
         r7H5bgcKHbP3GWYIONLvnDrezU4Y1W0sitqKVzCniAYyKUTKMa39NxCYcl3fzLkHZ61t
         sA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737301689; x=1737906489;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZAYLxkgTuJqE+KNkFf+UOOQy4pcqWaU6mHRJg10BxY=;
        b=r8gUVoKPn1XUw39332f9q2kSm+2iRs8QYMb38QK4/jfHJtAMHifKzrpWj2s5xOMiBB
         TNJA5YL2NlPEJoO8bY6uTJ8OIo0W78z8HM0C+3y1XNqLrxtYagKZtw15JPUs3pIvnR45
         +pZSOH8J8/5sG+hZJAcLigfNNEfbEJjpYjzHWpvuCoTz/VM4FJET4M8Z/za23h51dBS7
         S0l34+B1QgugRmgeAc0Izro6sh8i4MuSjrXYUXeJBwxGeZMngrajeXLHPmRpjkndp5Zn
         G4jm6ZJcFgtBRrD+FBh3XFj+iB8vO83Hwwpb1tQA5tDVi4GzzrMWTaC9oylqwAlIHgUv
         0Y9w==
X-Forwarded-Encrypted: i=1; AJvYcCV7Zdp0uz8/gw51ajpj7g77uBEygknM8pJ+RO/b44fyP1HkgE7wOfwGqZUZDuFkSqLzNWHezcHQdYGuZW2mbunw@lists.infradead.org, AJvYcCXuhJFm0k6MykLzxrOfyasytBnr+Af4+VqE9kHQV2ssw/GoLmuUO3PWqolT+YpH0iaD9Zrs1linpeetD4QytDM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq9fAekmZBkBafsREz3Mx0jCSALLL8uPhmUROpJSRIOq+uvDnP
	dAGqyKhNN3OcVfBjEekpNZtaFPCyu93c9E5lzr29b/hojomDsLxj
X-Gm-Gg: ASbGncu7Sz2t3AdX52a0RXfEHLeegkR1IxXsfNMAcuEyCVZJz4tOPVIERen9Giov4Nj
	GjpZGnUxCVV2dkatCqfJehLRRvn4/278fD2xXLZ8gGm2mYPVIC5GaORcCdIMO5Ic7hy7nzUZze/
	4dHU06rPUbW9X/GVwXzNjUKaL/uKWNAv3+VlvEC+FscSqSlRy95OfL4uguOGzIXAneURrCZjhVv
	mEmaDsaBch4HWSj0MhJgFBOhuSIPqVxUHaHse5TT+ZwZ0+oQj3HGMHDvYlpIfZg+MPGEmp/3sBc
	CWCp5CBLt9Rzi3Uh6pEvnaYVO9i0PxPu7lz9
X-Google-Smtp-Source: AGHT+IGvCdSeQSGbyX+8aN4u/Fdvmx1BdTLz8cpVCt8/MNmK2Wh5evJPRODkKIm2pkBBFPhYUCnl6A==
X-Received: by 2002:a17:90b:6c3:b0:2f6:d266:f461 with SMTP id 98e67ed59e1d1-2f782d8c839mr14076613a91.30.1737301688910;
        Sun, 19 Jan 2025 07:48:08 -0800 (PST)
Received: from ?IPV6:2408:8362:245d:4738:bc4b:53ff:fead:2724? ([2401:b60:5:867d:3631:b7db:c3f4:aae2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c14ffaasm8954154a91.4.2025.01.19.07.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 07:48:08 -0800 (PST)
Message-ID: <65f4e27f-3dc4-4eaf-be4d-265ce0325ade@gmail.com>
Date: Sun, 19 Jan 2025 23:48:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: change eth phy mode to rgmii-id for
 orangepi r1 plus lts
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>
References: <20250119091154.1110762-1-cnsztl@gmail.com>
 <ce15f141688c4c537ac3307b6fbed283@manjaro.org>
 <59893a67-18c7-4ab3-9b2a-5a17091d4b6c@gmail.com>
 <dffd06a341b58e9689f578c3456cc11d@manjaro.org>
From: Tianling Shen <cnsztl@gmail.com>
In-Reply-To: <dffd06a341b58e9689f578c3456cc11d@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_074810_500530_63DC83D2 
X-CRM114-Status: GOOD (  19.35  )
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

On 2025/1/19 19:36, Dragan Simic wrote:
> On 2025-01-19 12:15, Tianling Shen wrote:
>> On 2025/1/19 17:54, Dragan Simic wrote:
>>> Thanks for the patch.  Please, see a comment below.
>>>
>>> On 2025-01-19 10:11, Tianling Shen wrote:
>>>> In general the delay should be added by the PHY instead of the MAC,
>>>> and this improves network stability on some boards which seem to
>>>> need different delay.
>>>>
>>>> Fixes: 387b3bbac5ea ("arm64: dts: rockchip: Add Xunlong OrangePi R1 
>>>> Plus LTS")
>>>> Cc: stable@vger.kernel.org # 6.6+
>>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
>>>> ---
>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts | 3 +--
>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts     | 1 +
>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi    | 1 -
>>>>  3 files changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git
>>>> a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>> index 67c246ad8b8c..ec2ce894da1f 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
>>>> @@ -17,8 +17,7 @@ / {
>>>>
>>>>  &gmac2io {
>>>>      phy-handle = <&yt8531c>;
>>>> -    tx_delay = <0x19>;
>>>> -    rx_delay = <0x05>;
>>>> +    phy-mode = "rgmii-id";
>>>
>>> Shouldn't the "tx_delay" and "rx_delay" DT parameters be converted
>>> into the "tx-internal-delay-ps" and "rx-internal-delay-ps" parameters,
>>> respectively, so the Motorcomm PHY driver can pick them up and
>>> actually configure the internal PHY delays?
>>
>> The documentation[1] says "{t,r}x-internal-delay-ps" default to 1950
>> and that value already works fine on my board.
>>
>> 1. https://www.kernel.org/doc/Documentation/devicetree/bindings/net/ 
>> motorcomm%2Cyt8xxx.yaml
> 
> I see, but those values differ from the values found in the
> "tx_delay" and "rx_delay" DT parameters, so I think this patch
> should be tested with at least one more Orange Pi R1 Plus LTS
> board, to make sure it's all still fine.

This patch has been tested on 2 boards, and we will do more tests in 
next week.

Thanks,
Tianling.

> 
>>>
>>>>      status = "okay";
>>>>
>>>>      mdio {
>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>> index 324a8e951f7e..846b931e16d2 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts
>>>> @@ -15,6 +15,7 @@ / {
>>>>
>>>>  &gmac2io {
>>>>      phy-handle = <&rtl8211e>;
>>>> +    phy-mode = "rgmii";
>>>>      tx_delay = <0x24>;
>>>>      rx_delay = <0x18>;
>>>>      status = "okay";
>>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>> index 4f193704e5dc..09508e324a28 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>>>> @@ -109,7 +109,6 @@ &gmac2io {
>>>>      assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
>>>>      assigned-clock-parents = <&gmac_clk>, <&gmac_clk>;
>>>>      clock_in_out = "input";
>>>> -    phy-mode = "rgmii";
>>>>      phy-supply = <&vcc_io>;
>>>>      pinctrl-0 = <&rgmiim1_pins>;
>>>>      pinctrl-names = "default";


