Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999C0C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzy7oP/MrQugtWAPysPEgPdLMHw/maF/p0uyK0T8ED0=; b=LB0dpwgmC6TNDpBqzWtftS0gOa
	sglfnnkYuxyXEiwtoRepcPF3SdKoSg82KtE/8jZXX7OvJGZVzcQk8PS1YGWxe2guPXX6uqcGxc5Hx
	gBmBI3DrM2RozNk8Bg4VXQU1S4D2lrLKWLxtIsd8UF6LrXT0byDPcLXJiuW7RajQNHNXiGEzAiZoM
	xsjFjYI4tgtMpbbNLIbdJfpl9QruRs/kj/ppop+gGdjSMWmRPySC+sqEiTUfJCTZBEfMfqQMJmMBX
	zadXyetTXeCz2iZPw28vxR5Og/JLQKK1RDgel6WYWT/ysNHiX/7En5p/rSJv8pBpFbSVsuK6PK/tf
	e/xgt1eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmxN-0000000HF3d-2Ws5;
	Tue, 29 Jul 2025 16:13:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmc7-0000000HBlY-2Cp4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1753804299; x=1785340299;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MB5fh2uBPuAehbQY8QqFk4AryWaAIPon9NPjqNjtLx8=;
  b=ncjOcGD/PhpYwTKHk76y4oh0calsZ4C846UBczJyADSDUMMUdZGnbHdd
   4jEEBwrqwVe4LdkuDtF1jmZSkGopB9KnmoGOHsrIwN4E28D97Aij4U4xi
   PYYat/6FiC0nvLHndzAHkNb/z0O1cMxRdCh8Zz3uwLCMvaLomnl/7oVan
   DUVZKU6mikupU2h1aMioZHEE5rz21eIG7oYyBpUbsSPyJgf1C6s1WAKSj
   HYy4g78CAbXqfGtB4VM+76mLfRbpS10rLtDIJwkUxl/Y/QXxtE5U70x4F
   ALyR9Qyif8YoxKX38d84DeU/G+CnvaeSMDG1YGKh1yyn9Wfq0UziF4qqW
   A==;
X-CSE-ConnectionGUID: kwjiFHDITVCVqkiL+FzGcA==
X-CSE-MsgGUID: cYRXmoNxQqKn9Y6AII0baA==
X-IronPort-AV: E=Sophos;i="6.16,349,1744095600"; 
   d="scan'208";a="44033233"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Jul 2025 08:51:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 29 Jul 2025 08:51:16 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 29 Jul 2025 08:51:16 -0700
Message-ID: <76e7b9fc-e0e2-4d21-ba5a-dac831522bb2@microchip.com>
Date: Tue, 29 Jul 2025 08:51:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] net: cadence: macb: sama7g5_emac: Remove USARIO
 CLKEN flag
To: claudiu beznea <claudiu.beznea@tuxon.dev>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <cover.1752510727.git.Ryan.Wanner@microchip.com>
 <1e7a8c324526f631f279925aa8a6aa937d55c796.1752510727.git.Ryan.Wanner@microchip.com>
 <fe20bc48-8532-441d-bc40-e80dd6d30ee0@tuxon.dev>
 <848529cc-0d01-4012-ae87-8a98b1307cbe@microchip.com>
 <681b063c-6eab-459b-a714-1967a735c37d@tuxon.dev>
From: Ryan Wanner <ryan.wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <681b063c-6eab-459b-a714-1967a735c37d@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_085139_855208_2A68541A 
X-CRM114-Status: GOOD (  17.38  )
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

On 7/26/25 05:56, claudiu beznea wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> the content is safe
> 
> Hi, Ryan,
> 
> On 7/21/25 18:39, Ryan.Wanner@microchip.com wrote:
>> On 7/18/25 04:00, Claudiu Beznea wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>> know the content is safe
>>>
>>> Hi, Ryan,
>>>
>>> On 14.07.2025 19:37, Ryan.Wanner@microchip.com wrote:
>>>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>
>>>> Remove USARIO_CLKEN flag since this is now a device tree argument and
>>>
>>> s/USARIO_CLKEN/USRIO_HAS_CLKEN here and in title as well.
>>>
>>>> not fixed to the SoC.
>>>>
>>>> This will instead be selected by the "cdns,refclk-ext"
>>>> device tree property.
>>>>
>>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>> ---
>>>>   drivers/net/ethernet/cadence/macb_main.c | 3 +--
>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/
>>>> ethernet/cadence/macb_main.c
>>>> index 51667263c01d..cd54e4065690 100644
>>>> --- a/drivers/net/ethernet/cadence/macb_main.c
>>>> +++ b/drivers/net/ethernet/cadence/macb_main.c
>>>> @@ -5113,8 +5113,7 @@ static const struct macb_config
>>>> sama7g5_gem_config = {
>>>>
>>>>   static const struct macb_config sama7g5_emac_config = {
>>>>        .caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
>>>> -             MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |
>>>
>>> Will old DTBs still work with new kernels with this change?
>>
>> That was my assumption, but it seems it would be safer to keep this
>> property for this IP and implement this dt flag property on IPs that do
>> not already have  MACB_CAPS_USRIO_HAS_CLKEN property.
> 
> So, this patch should be reverted, right?

Yes you are right, more testing I see that this could break older DTs. I
am new to reverting patches, do I send a patch to revert this and would
it be an issue now?

Ryan
> 
> Thank you,
> Claudiu
> 
>>
>> Ryan
>>>
>>> Thank you,
>>> Claudiu
>>>
>>>> -             MACB_CAPS_GEM_HAS_PTP,
>>>> +             MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP,
>>>>        .dma_burst_length = 16,
>>>>        .clk_init = macb_clk_init,
>>>>        .init = macb_init,
>>>
>>
> 


