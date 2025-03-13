Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBCEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/+YQAaORtFq72+AzSNa9rIFM3dYh93tUAjVQzN5T9E=; b=kiZjI4+Hj/X0ttfyiPyzHb2FR3
	d3tHyNap2egcv8ZJA3ZwDPl5Xx7JdBAAvTxBBTPM8P9DhpODmHCe2oQrN7uuI+y3IYA1cyehU3ma1
	ctzkU0cFTsiIDtJUuo/hkTEmgzukwntiUgOBk+xp7NN1kmbNUond6nnFnZgbv2QN+wpHyO/8zX1MS
	z9aTMu14hTN8RNlnoAVOZWsm1xEiYGt90Q2sG1figwfN3uZpzHMcvigapxZTKd2O4MOrp0qaH8p1j
	PJEm/ZzR5e3r5mTkjIMDRtug2l/ES3FxUJeDqt11LnlbmJM5G+yzQxGo8T37Har6D773ZpDeZO5Lc
	3Qain2VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tse6v-0000000AZd3-1UE1;
	Thu, 13 Mar 2025 08:40:13 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tse21-0000000AYt1-0dWG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:35:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741854893; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=KEPvXMGotsjK1iqztyIGMqzbe7HTl1dCtkOsT4nwTU8gfy3AK18fa8KnOYFe/zHOWO
    LaAZm21k+aZQkn2Fy8zZybyB7AUQwsj9BiNBqpAQyDEb7NQ+Zrumpl0yBYzHVIvCKnD0
    GDl4jZvrMx1w4ppFIg3+zduE6YmvZPcVk22+6y58E1QaI+Eyky+Vslsl2W1ESbJxWnmt
    YSiydrp+Bg8mUJ1mvTZ+/DDLiKzD1eZIWUK0C/9OGM93AQQtdTdWPLfF5oK63TCVYIX5
    kRkHqfbjAmKbLEQssz4ULvbtl6mmJC4l1HZBK4kutedpQHRzKUdiCBOYavXvmR5Q3K81
    EDlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1741854893;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=l/+YQAaORtFq72+AzSNa9rIFM3dYh93tUAjVQzN5T9E=;
    b=Em3ok13s7CI8A1KZ1jqKtbzBsqCm075PymQoL7ryL6ql/1HmxzsK5Pzl/gSrHLrlNm
    6Cbrsu/SVT443nCbliuTEfBrJeaG61K9646/KEWftnwdEswO4sXjpnIUAygNumF6pdtP
    6Qll38h/M0mKqO6z/GkhSFH5HbO0B2Ir0i6O4nFvooGZFEHAeovi20JsI8+CgCQhVIU9
    8IFdCv8VCiOwo+cAyKdmYIwaZickrpGsH/B4NwTpjarfm8r5F3/m19PaCRJii0uX1xnm
    UPX+dOliYwWYUMB7QAVIqKb74w/dFBGyvQH4RNF12CWeDXEPeD6GEnqAokXNndkiOsv9
    COzQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1741854893;
    s=strato-dkim-0002; d=fossekall.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=l/+YQAaORtFq72+AzSNa9rIFM3dYh93tUAjVQzN5T9E=;
    b=J7uDMJrMZaUVnc4m8KoVFsFeclWLcdEbf3jACE+SezKqMZVnhLFEaAWdaqcEai6Bis
    rrO5sEK9is/KLys6ZvUsf1N3DW+/Dj33vET+8lB9S4/2fAJJw3qmjmiNZzbA5s2Mkcef
    qbC2+8Xr98DhVwnfOHz23r82XHovdxnGhCiH0CiV+RJrZQ31A0g5QoQgLm9d+Kf4ZHgb
    3IpOqgIZ7nPjMQvqT5Onge3VsspaYZSj1SRKq+TTXiJ+QyTEyVkICqFSYjDTiwBe/vs3
    X+I9LjrerSXcc3MSaTwpE6UM3sAz5RbywAbIvX/ZWsfdE9WZ4Z+nmWjW9s0qVYO6GC45
    wX1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1741854893;
    s=strato-dkim-0003; d=fossekall.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=l/+YQAaORtFq72+AzSNa9rIFM3dYh93tUAjVQzN5T9E=;
    b=AFuXUWzvpfTYjw7mJqf1HU03u5VMueFtVE1i4UtZqI5Y+XepqOYT52R5M9JjqI+pnn
    x1bDI6X0O8i9XlqPkaDA==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b3512D8Yqmsr
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 13 Mar 2025 09:34:52 +0100 (CET)
Received: from aerfugl.home ([192.168.1.2] helo=a98shuttle.de)
	by aerfugl with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <michael@fossekall.de>)
	id 1tse1j-0006BM-27;
	Thu, 13 Mar 2025 09:34:51 +0100
Date: Thu, 13 Mar 2025 09:34:50 +0100
From: Michael Klein <michael@fossekall.de>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: bananapi: add support for PHY LEDs
Message-ID: <Z9KYqlfUYxRaWnGQ@a98shuttle.de>
References: <20250312193629.85417-1-michael@fossekall.de>
 <20250312193629.85417-2-michael@fossekall.de>
 <4637912.LvFx2qVVIh@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4637912.LvFx2qVVIh@jernej-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_013509_346079_D0DAC393 
X-CRM114-Status: GOOD (  17.30  )
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

Hi,

On Thu, Mar 13, 2025 at 07:07:24AM +0100, Jernej Škrabec wrote:
>Dne sreda, 12. marec 2025 ob 20:36:28 Srednjeevropski standardni čas je Michael Klein napisal(a):
>> The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
>> Add the corresponding nodes to the device tree.
>>
>> Signed-off-by: Michael Klein <michael@fossekall.de>
>
>This is patch 2/2. Which one is patch 1/2? I got only one.

https://patchwork.kernel.org/project/netdevbpf/patch/20250312193629.85417-1-michael@fossekall.de/

Sorry for any inconvenience in case I messed up the patch submission.

I made two commits for this change and submitted them via `git send-email 
HEAD^^`. The first patch went to netdev@vger.kernel.org, the second 
to linux-arm-kernel@lists.infradead.org, which seems logical. Have I 
done something wrong?

>Best regards,
>Jernej

Michael

>
>> ---
>>  .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
>> index 46ecf9db2324..4976453ed192 100644
>> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
>> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
>> @@ -48,6 +48,7 @@
>>
>>  #include <dt-bindings/gpio/gpio.h>
>>  #include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/leds/common.h>
>>
>>  / {
>>  	model = "LeMaker Banana Pi";
>> @@ -169,6 +170,32 @@ &ir0 {
>>  &gmac_mdio {
>>  	phy1: ethernet-phy@1 {
>>  		reg = <1>;
>> +
>> +		leds {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			led@0 {
>> +				reg = <0>;
>> +				color = <LED_COLOR_ID_GREEN>;
>> +				default-state = "keep";
>> +				linux,default-trigger = "netdev";
>> +			};
>> +
>> +			led@1 {
>> +				reg = <1>;
>> +				color = <LED_COLOR_ID_AMBER>;
>> +				default-state = "keep";
>> +				linux,default-trigger = "netdev";
>> +			};
>> +
>> +			led@2 {
>> +				reg = <2>;
>> +				color = <LED_COLOR_ID_BLUE>;
>> +				default-state = "keep";
>> +				linux,default-trigger = "netdev";
>> +			};
>> +		};
>>  	};
>>  };
>>
>>
>
>
>
>
>

-- 

