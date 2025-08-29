Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC71CC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 06:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaCbYkm3D+dAUgz/KUTMt7nQlTsb/6sXwJR7a006pDE=; b=hp/BBL0t7jfAVos4QrrvNjsy6F
	7wdOmF7HPdduGINowyhEFMA6b3o7CcIND1XuUoLbB/wMJFgLr3ILDDab6JFLhsNDoOnLPrpxOYu5J
	vhvN9mpXSYCstZQq+hh2TXc3HE51Gtp19Dh68ssOs+b2tlgHMv80PktGSMgfIj1ezOq0/Txp1/BKV
	sS7Awnk4bklbmaaR3F8YHm4/UG+cvIKwh9Y6fyyYKj3FlCl6K/hfmmdX0TnyA4Lh9pAxKWdCC3Rq7
	+o8JW/WxE/BQz/ZaGqHW9Y9FKhywjRaANuds+9lQCb7HG7QCRI3JjmizZTztksJrB3o9cSHh7lLbH
	MbtkAQXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursMj-00000004bpA-0JsG;
	Fri, 29 Aug 2025 06:13:37 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursCS-00000004aFk-2Zll
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 06:03:02 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57T62t3B1686363;
	Fri, 29 Aug 2025 01:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756447375;
	bh=FaCbYkm3D+dAUgz/KUTMt7nQlTsb/6sXwJR7a006pDE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hXp00+zS9Co8zbtsZ/N6SdXSl8ghhRxsSsaoDDnPxJ255qssrT+8JjY0E8QNc1atr
	 SVbAWldeSH8dYe8HNcV6WaG+515tl02vEThND6k1nVI5AqZdIbpNd2pLkYicktMTlX
	 M0njbjPkYPV7VdRe03Wx9WdqWIex/rMghn7ag1oA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57T62s533438457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 29 Aug 2025 01:02:54 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 29
 Aug 2025 01:02:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 29 Aug 2025 01:02:54 -0500
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57T62nvC1872968;
	Fri, 29 Aug 2025 01:02:49 -0500
Message-ID: <877c2edd-851d-4722-8bb4-94fdc3c058a0@ti.com>
Date: Fri, 29 Aug 2025 11:32:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/33] arm64: dts: ti: k3-am64-phycore-som: Add missing
 cfg for TI IPC Firmware
To: Wadim Egorov <w.egorov@phytec.de>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Matt McKee <mmckee@phytec.com>,
        Garrett Giordano <ggiordano@phytec.com>,
        Nathan Morrisson
	<nmorrisson@phytec.com>, John Ma <jma@phytec.com>,
        Logan Bristol
	<logan.bristol@utexas.edu>
References: <20250823160901.2177841-1-b-padhi@ti.com>
 <20250823160901.2177841-19-b-padhi@ti.com>
 <b745deb3-b625-472b-b55a-468eebbdfb16@phytec.de>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <b745deb3-b625-472b-b55a-468eebbdfb16@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_230300_749232_415935B3 
X-CRM114-Status: GOOD (  17.52  )
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

Hi Wadim,

On 28/08/25 17:12, Wadim Egorov wrote:
>
>
> On 8/23/25 7:08 PM, Beleswar Padhi wrote:
>> The k3-am64-phycore SoM enables all R5F and M4F remote processors.
>> Reserve the MAIN domain timers that are used by R5F remote
>> processors for ticks to avoid rproc crashes. This config aligns with
>> other AM64 boards and can be refactored out later.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>
> I am not sure you need this patch, because you are deleting everything you add in patch 32.


I am also including the "k3-am64-ti-ipc-firmware.dtsi" in patch [32/33]
which has these timer configurations.

This [18/33] is an intermediate patch. We are putting all AM64* boards
into same configuration first before refactoring everything into a
common file [32/33]. That way if there is a bug someday in the future,
due to added configs, the bisect lands on the [18/33] patch and not on
the refactoring patch[32/33].

Just trying to keep every file same before & after the refactoring patch

> But I tested the series on our hardware, so
>
> Tested-by: Wadim Egorov <w.egorov@phytec.de>


Thanks,
Beleswar

>
>> ---
>> Cc: Wadim Egorov <w.egorov@phytec.de>
>> Cc: Matt McKee <mmckee@phytec.com>
>> Cc: Garrett Giordano <ggiordano@phytec.com>
>> Cc: Nathan Morrisson <nmorrisson@phytec.com>
>> Cc: John Ma <jma@phytec.com>
>> Cc: Logan Bristol <logan.bristol@utexas.edu>
>> Requesting for review/test of this patch.
>>
>> v2: Changelog:
>> 1. Re-ordered patch from [PATCH 28/33] to [PATCH v2 18/33].
>>
>> Link to v1:
>> https://lore.kernel.org/all/20250814223839.3256046-29-b-padhi@ti.com/
>>
>>   .../boot/dts/ti/k3-am64-phycore-som.dtsi      | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
>> index 03c46d74ebb5..1efd547b2ba6 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am64-phycore-som.dtsi
>> @@ -275,6 +275,30 @@ mbox_m4_0: mbox-m4-0 {
>>       };
>>   };
>>   +/* main_timer8 is used by r5f0-0 */
>> +&main_timer8 {
>> +    status = "reserved";
>> +};
>> +
>> +/* main_timer9 is used by r5f0-1 */
>> +&main_timer9 {
>> +    status = "reserved";
>> +};
>> +
>> +/* main_timer10 is used by r5f1-0 */
>> +&main_timer10 {
>> +    status = "reserved";
>> +};
>> +
>> +/* main_timer11 is used by r5f1-1 */
>> +&main_timer11 {
>> +    status = "reserved";
>> +};
>> +
>> +&main_r5fss0 {
>> +    status = "okay";
>> +};
>> +
>>   &main_i2c0 {
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&main_i2c0_pins_default>;
>

