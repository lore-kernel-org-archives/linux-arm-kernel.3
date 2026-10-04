Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5AFCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 14:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUXvy50bECQ2jjyhstzsZVcApJzJFF/Z6zq/JzULuvY=; b=iZ1exhNWAjwUaDZJepYOnotRXI
	gZuZPjB/BU4Sv8Q1vLDyEBOy9iteh4SM2wagVaw0cpfE4Vedcm9GfEx/Q9I2tuYrj8HUqQlHe5uzq
	pImtuBXnLzGwxKTcRWUhVDGTDIWR4OUMi1BC+f+fpcq4YfSdHs3jQephmK20D0GSv0xruYm6IZJeH
	qSuyxmP86gEP1ex2ryH+FsGTyL46efHgl824aJ5sneL4DC9hJrIioii8yWN4jNEgQbUfncwfYxqKW
	Bg5/Lfv3TTKsnmAT574Swb6tWhkOXVq99c8DnGpgqGDtYbdtlAme/WAJ7aQLSzHVmHpgoSEym7qb0
	DNdSqjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMra-0000000EtRZ-3Vzi;
	Sun, 04 Oct 2026 14:06:50 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMrW-0000000EtQq-3ost
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 14:06:48 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso5606665e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 07:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122805; x=1791727605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUXvy50bECQ2jjyhstzsZVcApJzJFF/Z6zq/JzULuvY=;
        b=bxHir5UPi2e9Zdh0KabetCvSFGQEkTW5VghmlNVyfXMikLk9jnl7BEZ8BSjfM42xk1
         IKJNDQqrUTeCU6A1uSnxOUepKYu1cEFK7wPfbmk2TMSvGjJP5hHF7+dqFBnMvykRasVB
         TVJ7agLeubP/kBF46GNcIAsEQx0FNAeZufpSoip02CBT6RncxkVQ0ePh0EbaY6ScYCc6
         6Y7XSJCMgzcIyJ7kHdbi806Q4Xq+JZmppn6KshEfjskQEMadtkKW3ofv3v+/XhP4nu4n
         LJ4FuC1kY1fFO63ntAylenZxrosuJKSBuBUuW1dsjyTbkCdj9aDsy8XmJ1sgbC/LvOzj
         OLew==
X-Forwarded-Encrypted: i=1; AKwUvBztk34gGGCFBehCR3nZ3rS8/Gl3OK99q7BjysDX/VlJe6ghx6ohcK/aWysfaVypClc4VHRBsRjC43XfplsVKHBC@lists.infradead.org
X-Gm-Message-State: AFuF++nhZwib8K/HWVtil7Iiqhf4UAv0LtxPKVnaaMCdE86QLh7lYLsG
	rYJJ9TDmXatVL8HNZoAvk/LHEwlOyXqavKEvpcQp9U+9Ls+1HfjAXnAx
X-Gm-Gg: AYBFou2FfjKnzswvNLOA0TG9LiAVqAuxDja13nlZmyMGhXWZlK1P9Oktcz277OxG7kP
	7mfu+QEmjCH+sS6PyDkNbs4UdBfmHc0C6ForxmVFSQvQ1O/V2oB+7VaxckvE4QBOfd9upCMQqzv
	52dfPa0fe1OLn9UfeMTeC2I7ceJwZJ9je7YIzZVs2Vb73AyqgLYh5cOc/fB098VEMZwBcEEoB2H
	qYQq/wlKufk1JzVc233F/kHkun8pdAq0G/Cz40ivtSDMqmz8p5t3z5I7HbbQKzWEU8KTZfz+dl9
	QYcx+fMuT2xamQlQJQOcXwT7a6xMQcH72Ho7FzlNodL9uYpIdDm0Yxybe59R0hc5fNLTafWkfrD
	iK3YjeU4XJPeFaAOFCA8HA5qBVPyzHoLeW1wJWAa/eNNFciOgYjv4Vdm2LbpHJj95ADOoMNkge2
	PZ3wep1idgKo/bPD8gLlhgONa9zMc1rALyapvBDZN5mffadUDyoLHjh7BcP2V9ki1v6ZugpsoQO
	VUZfe0s+qSYcGJEH6VJPmnmqIqH
X-Received: by 2002:a05:600c:6212:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4a0275432f7mr127957445e9.9.1791122804538;
        Sun, 04 Oct 2026 07:06:44 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17125adfesm30902405e9.15.2026.10.04.07.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 07:06:44 -0700 (PDT)
Message-ID: <4460ec4a-1a28-4481-a33e-3fe72f68bf58@linux.com>
Date: Sun, 4 Oct 2026 15:06:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: net: meson-dwmac: add T7 support
To: Conor Dooley <conor@kernel.org>, xianwei.zhao@amlogic.com
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260924-t7-node-new-v2-0-319d3c19b4b2@amlogic.com>
 <20260924-t7-node-new-v2-2-319d3c19b4b2@amlogic.com>
 <20260924-stinger-stoplight-7c327c3225fa@spud>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20260924-stinger-stoplight-7c327c3225fa@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_070646_996570_0F595D7F 
X-CRM114-Status: GOOD (  23.39  )
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

On 24/09/2026 18:21, Conor Dooley wrote:
> On Thu, Sep 24, 2026 at 05:51:09AM +0000, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add the T7 compatible to the Meson DWMAC binding.
>>
>> The T7 DWMAC controller requires the following compatible combination:
>>
>> amlogic,t7-dwmac
>> amlogic,meson-axg-dwmac
>> snps,dwmac-4.00
>>
>> Add a conditional schema check to enforce this compatible combination
>> when amlogic,t7-dwmac is used.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   .../devicetree/bindings/net/amlogic,meson-dwmac.yaml    | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> index 5c91716d1f21..b529ca5577a9 100644
>> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
>> @@ -23,11 +23,24 @@ select:
>>             - amlogic,meson-gxbb-dwmac
>>             - amlogic,meson-axg-dwmac
>>             - amlogic,meson-g12a-dwmac
>> +          - amlogic,t7-dwmac
>>     required:
>>       - compatible
>>   
>>   allOf:
>>     - $ref: snps,dwmac.yaml#
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: amlogic,t7-dwmac
>> +    then:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - const: amlogic,t7-dwmac
>> +            - const: amlogic,meson-axg-dwmac
>> +            - const: snps,dwmac-4.00
> 
> This is not how fallback compatibles are described.
> 
> Instead of doing this, which affects all other compatibles in the file
> by allowing dwmac-4.00 for all devices, please do this the normal way.
> dwmac isn't special, it's just this binding that's weird!
> Can whats currently in the binding (before this patch) be largely
> replaced by just doing:
>    compatible:
>      oneOf:
>        - items:
>            - enum:
>                - amlogic,meson8b-dwmac
>                - amlogic,meson-gxbb-dwmac
>                - amlogic,meson-axg-dwmac
>                - amlogic,meson-g12a-dwmac
>            - const: snps,dwmac-3.70a
>            - const: snps,dwmac
>        - items:
>            - enum:
>                - amlogic,meson6-dwmac
>                - amlogic,meson8m2-dwmac
>            - const: snps,dwmac
> 
> You'll have to check this yourself against the amlogic devicetrees and
> see if this is correct, but with this you should be able to add your new
> device without doing anything special.

I have the same patch in my T7 work and checked it against the amlogic 
device trees: meson6 and meson8m2 use the two entry form, the rest add 
snps,dwmac-3.70a. dt_binding_check and dtbs_check are clean. The example 
needs fixing.

Xianwei, from my VIM4: the MAC reports Synopsys ID 0x51, DWMAC_CORE_5_10
in common.h, so the core is 5.10a, not 4.00. And the controller reaches
DRAM through a pipeline stage. Nothing claims its gate, sys_ampipe_eth,
so clk_disable_unused switches it off. My node lists it as a fourth
clock. Does the AN400 differ?

I will send my series today so the code is on the list. Not a race: I
will drop or rebase whatever overlaps once you tell me.

Thanks,
Lucas

> 
> pw-bot: changes-requested
> 
> Thanks,
> Conor.
> 
>>     - if:
>>         properties:
>>           compatible:
>> @@ -38,6 +51,7 @@ allOf:
>>                 - amlogic,meson-gxbb-dwmac
>>                 - amlogic,meson-axg-dwmac
>>                 - amlogic,meson-g12a-dwmac
>> +              - amlogic,t7-dwmac
>>   
>>       then:
>>         properties:
>> @@ -93,6 +107,7 @@ allOf:
>>                 - amlogic,meson8m2-dwmac
>>                 - amlogic,meson-gxbb-dwmac
>>                 - amlogic,meson-axg-dwmac
>> +              - amlogic,t7-dwmac
>>       then:
>>         properties:
>>           rx-internal-delay-ps:
>> @@ -139,8 +154,10 @@ properties:
>>             - amlogic,meson-gxbb-dwmac
>>             - amlogic,meson-axg-dwmac
>>             - amlogic,meson-g12a-dwmac
>> +          - amlogic,t7-dwmac
>>       contains:
>>         enum:
>> +        - snps,dwmac-4.00
>>           - snps,dwmac-3.70a
>>           - snps,dwmac
>>   
>>
>> -- 
>> 2.52.0
>>
>>

