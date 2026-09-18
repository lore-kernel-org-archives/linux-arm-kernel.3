Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6579C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/6THK5ybFgfnJ44IwMV41p5iO6sYAnbdxfxWAQES9w=; b=QAB5+o7woN2UgU9gyzjuD0EZpu
	cnpLOREx/PorbOedsKalm3H23hWZkbKqlH9WkaWAIeA8bjLsuPCyNpV6kowSBKzUxenL+MhcXYex9
	WAeQiUIYh5sr5xK+0la2Z7YSX+Ha/vwI0ghbwWCJsCVVezUL9XmaSZfsNMNZFuBwgd3Vc8sasjlOj
	IsxnCdmNowFn8aQBM86CJbB9aw+rVclVhJ8QTDtaY2n6Yjic+S/U9LCc0M7hqCVfPCu8HODoI9AYF
	LUiA5eRe5QEckOBspQyHCkDVEfqyAN82kM1V+7DGjShx+wfSAbS5DgDiu2WHf3lvcbDvzGVuVTzA1
	axXZXYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ysw-0000000EcVa-1TM5;
	Fri, 18 Sep 2026 13:44:14 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yss-0000000EcUE-1lEZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:44:12 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260918134404epoutp0180bc6ff5185ec6b954de707301de6149~Wbi2iGtPX0781807818epoutp01A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 13:44:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260918134404epoutp0180bc6ff5185ec6b954de707301de6149~Wbi2iGtPX0781807818epoutp01A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789739044;
	bh=M/6THK5ybFgfnJ44IwMV41p5iO6sYAnbdxfxWAQES9w=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=BvdJV45BfaSNm3RBet5A4cWePbMXofrFm/MfD3erSc3oygiJg4jzT6iesCSkZBSIt
	 7esRhTulZAIixielR7/NYvk28QLkI8TlZ5S8eN9v04wmQ2FXZfjkteXFt0cihMirdV
	 UeG4gHNUPJPn7hvXKKwQLnnEebgzWKMZvbYNYQ68=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260918134403epcas5p259a04e149d24f77658758604afbc56b2~Wbi16PIyF3098530985epcas5p21;
	Fri, 18 Sep 2026 13:44:03 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hmYkV3WySz6B9m6; Fri, 18 Sep
	2026 13:44:02 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20260918134401epcas5p34a132942523dca5b7e6831894b7ae494~Wbi0dtpu52504725047epcas5p3C;
	Fri, 18 Sep 2026 13:44:01 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260918134358epsmtip1c1a77ba9b4a8af69fba914d4067d77f4~WbixpWZaJ2193021930epsmtip1S;
	Fri, 18 Sep 2026 13:43:58 +0000 (GMT)
Message-ID: <14b69f98-7fd9-4b66-a1c0-0d1c29ab25b0@samsung.com>
Date: Fri, 18 Sep 2026 19:13:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] MAINTAINERS: add Samsung USB DT binding to
 ARM/SAMSUNG entry
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: peter.griffin@linaro.org, alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com, mani@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com,
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com,
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com,
	thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <20260918-eminent-wooden-shark-97b8be@quoll>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260918134401epcas5p34a132942523dca5b7e6831894b7ae494
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
	<CGME20260916122351epcas5p37666f1232d3b2bcc1d02a96ab0df4142@epcas5p3.samsung.com>
	<20260916122229.2604003-2-selvarasu.g@samsung.com>
	<20260918-eminent-wooden-shark-97b8be@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064411_118654_D4367DC2 
X-CRM114-Status: GOOD (  22.75  )
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


On 9/18/2026 3:28 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 16, 2026 at 05:52:27PM +0530, Selvarasu Ganesan wrote:
>> Add the Samsung USB devicetree binding file path under the existing
>> ARM/Samsung SoC maintainership.
>>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index a53620839407..87a1ab24a375 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3576,6 +3576,7 @@ F:	Documentation/devicetree/bindings/arm/samsung/
>>   F:	Documentation/devicetree/bindings/hwinfo/samsung,*
>>   F:	Documentation/devicetree/bindings/power/pd-samsung.yaml
>>   F:	Documentation/devicetree/bindings/soc/samsung/
>> +F:	Documentation/devicetree/bindings/usb/samsung,*
> I think this is not really needed. First of all, files will be covered
> by N: pattern further in the entry. Second, patches for these should go
> via USB, but listing here the directory could create impression that
> Samsung SoC is responsible.
>
> This one entry is harmless, but if adding this, then next time we got 15
> more updates for each of Documentation/devicetree/bindings/*/samsung*
> files. Is it worth?
>
> Interested people can add themselves to the bindings maintainers entry,
> that's always welcomed.

Hi Krzysztof,

Thanks for your detailed explanations.

Agreed. We will drop this patch in the next version.

Thanks,
Selva
>
> Best regards,
> Krzysztof

