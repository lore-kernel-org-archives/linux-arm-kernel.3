Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08057CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzSNHix+jDzhryW7L6rWS044+qiGmGt0CFqW85ry1ZA=; b=pnQ8tTt5xO/JVhBfiwynFb6hK9
	1ltoCjXV1Irgx+T5Pu1T/JGp2fGSKkAFcheZXJIiEM24sagG7oUuHXICUL1Ox+A+cCA+cTP79EKs9
	f9NazX/PStsby1fNQSiMUOLIBOmkh2bjwsr16yLUheNiDk9UN27HT1wk4tWr6SauD4r6A6IbkWaI8
	9m3VDEbTGvKVY5iZrLt0oESyueNTZNUEMQnkATRr2wlC8bKj0S4uPQGtvW80xVwLamdhdBAICGuYw
	blPIuUMnNll7GYS6e8RLyobyUdGqZLML8sOUKCoijzG4V5lnacxcq4Iw/eRRAMQKsl6NLrMwsVJHl
	I4FQcmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umY9s-0000000H4g1-1OAB;
	Thu, 14 Aug 2025 13:38:20 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXFV-0000000Grsc-0HNI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 12:40:06 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57EAioq1010546;
	Thu, 14 Aug 2025 14:39:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	WzSNHix+jDzhryW7L6rWS044+qiGmGt0CFqW85ry1ZA=; b=MXCMvXlNHKbc+con
	Gfz+5BevdW0tajuBGnIhEJT5lDj+ijrbmRk/6w1spiO43qCkWl3tZW7gwJ/x36SA
	Qbi0deGn40RBnP5ubhNCLBvz0iAjYE6XmPBN3c60DRZLovhvuEE1GNx84ZR8Hbee
	fFl9MEdnS0k5WqzrGo0JKjLlikmtpaFgtnWE6cic9Fy8xgIvDxVOmmg6t50qAFqJ
	cXPLf9+oWcXdRmy/P11Hv6e9XESlfpbCUObOs00BlYX71IoHDRugn6zS/mG5K/SM
	4cq8ZLBZGub26xJdIXbTKZaZqbHH2ltlsk2vPjFrP+DbHnXWA+i/8KiBMx/twoPk
	66sqnw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48eh9nh6xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:39:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 38D9A4004D;
	Thu, 14 Aug 2025 14:38:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A1B671CEDD;
	Thu, 14 Aug 2025 14:36:49 +0200 (CEST)
Received: from [10.252.20.8] (10.252.20.8) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 14:36:48 +0200
Message-ID: <2c13bf48-5453-4302-9cde-eac51e314af1@foss.st.com>
Date: Thu, 14 Aug 2025 14:36:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] dt-bindings: display: st: add new compatible to
 LVDS device
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
 <20250812-drm-misc-next-v2-3-132fd84463d7@foss.st.com>
 <20250814-dancing-nautilus-of-camouflage-ebb441@kuoka>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250814-dancing-nautilus-of-camouflage-ebb441@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.20.8]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_054005_361250_14582A74 
X-CRM114-Status: GOOD (  14.65  )
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



On 8/14/25 11:09, Krzysztof Kozlowski wrote:
> On Tue, Aug 12, 2025 at 03:49:00PM +0200, Raphael Gallais-Pou wrote:
>> Update the compatible to accept both "st,stm32mp255-lvds" and
>> st,stm32mp25-lvds" respectively.  Default will fall back to
>> "st,stm32mp25-lvds".
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> ---
>>  Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
>> index 6736f93256b5cebb558cda5250369ec4b1b3033c..b777c55626e4b322d77ef411ad9e4a3afb6c9131 100644
>> --- a/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
>> +++ b/Documentation/devicetree/bindings/display/st,stm32mp25-lvds.yaml
>> @@ -31,7 +31,13 @@ description: |
>>  
>>  properties:
>>    compatible:
>> -    const: st,stm32mp25-lvds
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - st,stm32mp255-lvds
>> +          - const: st,stm32mp25-lvds
>> +      - items:
> Drop. This should be just enum or const, no need for items.

Why would items not be applicable in this case ? I want the compatible field to
be either:

compatible = "st,stm32mp255-lvds", "st,stm32mp25-lvds";

or

compatible = "st,stm32mp25-lvds";

example-schema.yaml states the same pattern.

Best regards,
Raphaël
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Best regards,
> Krzysztof
>


