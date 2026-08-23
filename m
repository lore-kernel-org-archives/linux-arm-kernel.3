Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04333C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gic4a9l1Tysqkb/KXwcHfceHx++tdNsSZ7fJK8rIj4o=; b=Bj54bUyLvOO5Gq5rCPR5fYAcTp
	MXr7XJ5oQgqASVybeJpUauPSLvgs6xIAuVeNUhgMfq6BUFgmZr/M+oiYmhu7fBf9HnX6BrE+YV5o0
	LGmi+/+lMymLNFYbk7bg/MnsFJr7Beqit4gSxKmuzC0xQKyCgQLOxfdT6FQdkXnTVPqwSNAz25pL4
	ptM11QBUUMYmUL7hG46XR2ir9teRkqY2u6IaqBJdhZbLH3A29ITv5cT0Nvp08l6YaSCWnZs8Jo1cc
	RwtaF8QweRsyRpXkLsOlg9ySaNB+amBbMIthGm51l5/mhv4w6rDrQstjm8kDpHTwxi6SblYJTUWI+
	YILsaFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6OY-0000000FHWo-2cwQ;
	Sun, 23 Aug 2026 11:29:46 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6OW-0000000FHW9-0HqQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 11:29:45 +0000
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso14890215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 04:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787484581; x=1788089381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gic4a9l1Tysqkb/KXwcHfceHx++tdNsSZ7fJK8rIj4o=;
        b=a8uSrTgUpqJe+aSDl68brYV16mgUmpB7tfD4R+4cZKCd4QwRRb/vusHoDfNtuOAnL0
         mq/rwMoqLu8yqWzXrWfZ+n4YUtb5rGbXA7QDHqIK82MR4opkxnqbcmPkFQBKKDz71hSc
         cLbvRL616B3HFuzbDxumI2CY7imAtcciys/K4ViSyhnHtuTJal6Rdo+zLEKxgutZ50as
         xzwdabtjI8GDzCL300jyuEVSnOXynhNBD1NofeJiyUrUxx70pwXii+OY4jKmiZXd0iv8
         opPFkdkgedPv8zHKSt9/ZpuSYftKcxQp+0ojTSJZRGzHw2dFbcf6om2vQYXi2yFcn5CO
         K/VQ==
X-Gm-Message-State: AFuF++lV/j+woIURWAjBJp1Wv2CBjfMQQfm+cvS+En9hgD+dcpsBvv/2
	BYvMZ9m99YNinYrhuLSKyC7U1fqz8k3mP0TmZv6JQeu5rqyOabczlyje
X-Gm-Gg: AR+sD11wCJK6mcN+mogU5u3RF/lHTnuXfnJCXP0Fs1ezYDTVwShVQY7eWayNnAVF+hm
	U/5aXruONT1PW9VFsRyWgSvwjhavSzTV9blmG4v7KjCY0cngFgAWB7rKaV3TJruZdRRK73f8h3q
	adg6zpXHPNo7Od5KZL7BPv4kEWMWY/X8k/cDBYZ9BZM9VObG1RvP31IH1XhAFa6HUt65oS4Lq7F
	3zb6zYXh2zf44nuem2J8ZSLLiK1ZhXDGiHb1sBENcJPjpiWW5HZNyGiy301tH/PtQsHZHqyyhKO
	OoAAyYjEy/1JAmmxMTZrGBuQAQr4o5NhT7MbueMPvyvB3OAV3O4y1EndTem7hVI83MPk5KtnFr+
	YRsT6x0OctHifsYmV6QtTM7FEvXXFlahn3iFoFcjmTNjog9OsTwWsWRFGP9H9iQMGydnGl+tAaX
	yvVWizWWy7rJ1fu1W/GpR4TuTz3cjxgZ+tiNmF68JQPtgt3bIP+HbdAaOrSP6q4tPMVcjNe/sd7
	DYKaGUekn07mpdxw0TnVGJ5cglBOxKd
X-Received: by 2002:a05:600c:548c:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499c19f514emr95373715e9.14.1787484581078;
        Sun, 23 Aug 2026 04:29:41 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c3553681sm46417835e9.1.2026.08.23.04.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 04:29:39 -0700 (PDT)
Message-ID: <78722571-a418-4962-b1ac-216519303aa2@linux.com>
Date: Sun, 23 Aug 2026 12:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_042944_118213_C43F2D47 
X-CRM114-Status: GOOD (  18.38  )
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

On 19/08/2026 03:39, Xianwei Zhao wrote:
> Hi Lucas,
> 
> On 2026/8/19 03:11, Lucas Tanure wrote:
>> uart_a lists the 24MHz crystal for all three of its clocks, because
>> the T7 clock controller driver did not exist when these boards were
>> added.
>>
>> That leaves the real UART bus clock without a user, so the kernel
>> turns it off when it disables unused clocks at the end of boot, and
>> the board hangs.
>>
>> Point uart_a at the real clocks, the way meson-s4.dtsi does, and drop
>> the placeholders from the two board files.
>>
>> Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add 
>> initial device-tree")
>> Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
>> Signed-off-by: Lucas Tanure<tanure@linux.com>
>> Assisted-by: Claude:claude-fable-5
>> ---
>>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 --
>>   arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 --
>>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi                   | 4 ++++
>>   3 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> index cab2ee9ea0d3..dcbcd08a78b9 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
>> @@ -33,7 +33,5 @@ xtal: xtal-clk {
>>   };
>>
>>   &uart_a {
>> -       clocks = <&xtal>, <&xtal>,
>> <&xtal>;
>> -       clock-names = "xtal", "pclk", "baud";
>>          status = "okay";
>>   };
>> diff --git
>> a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> index c41525a34b72..677069e58f30 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
>> @@ -266,6 +266,4 @@ &sd_emmc_c {
>>
>>   &uart_a {
>>          status = "okay";
>> -       clocks = <&xtal>, <&xtal>,
>> <&xtal>;
>> -       clock-names = "xtal", "pclk", "baud";
>>   };
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index cc371fcd1896..7847582e77ed 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -587,6 +587,10 @@ uart_a: serial@78000 {
>>                                  compatible = "amlogic,t7-uart",
>> "amlogic,meson-s4-uart";
>>                                  reg = <0x0 0x78000 0x0 0x18>;
>>                                  interrupts = <GIC_SPI 168
>> IRQ_TYPE_EDGE_RISING>;
>> +                               clocks = <&xtal>,
>> +                                        <&clkc_periphs
>> CLKID_SYS_UART_A>,
>> +                                        <&xtal>;
>> +                               clock-names = "xtal", "pclk", "baud";
>>                                  status = "disabled";
>>                          };
> 
> I agree with moving the UART clock configuration to the DTSI file. 
> However, it seems a little odd to keep the XTAL clock definition in the 
> DTS, as the alias may not be consistent across different boards, which 
> could result in compilation errors. Could we move the XTAL clock 
> definition to the DTSI as well, similar to other Amlogic SoCs?
I think keeping it in the board files is actually better here, as the 
crystal (xtal) physically belongs to the board rather than the SoC. To 
keep things clean without moving xtal into amlogic-t7.dtsi, I've updated 
v2 to modify only the board DTS files.

