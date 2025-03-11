Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEC8C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbzRBzD4zy1+woI1kw2/XmxJI77CaWyhRb9Se95W7PI=; b=EkxxjvYm3OFtDcIWuJMGSaT+ot
	gGYWeYODk74085mLeJVuy2mGyKMPDivvHxVd5cZt3EDIdynsC3Pav+QXL7yLdUJQN4j72iEk6ma/p
	6wmgRRqtCLT2hgWILISsvF/AmvChDcgQ81MW7Pvz7aBnrIAWLjd+Wx/7xU3pkDViN9gujPeR13sdJ
	WOo88aTyqKKIfzpfjGzJSWLw5hrgSEFySHmLENeON3rQaKr6cSOVuE5feTXcCka0E4Ydp4vE7jQ3+
	OGHfCxaMJpB54K7o25LfEzC2FGexeD8dp0hu8AWIXS6It2QgRir3uHCCL9q4PH8/j1FPWeh4GpVxY
	xKaz2ZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tru4I-00000004pyM-0Esj;
	Tue, 11 Mar 2025 07:30:26 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tru2b-00000004pe7-0qRY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 07:28:42 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52B7S0Ds644784
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 02:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741678080;
	bh=PbzRBzD4zy1+woI1kw2/XmxJI77CaWyhRb9Se95W7PI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=clqEGs7DEHEsKaeENmPF1f7pqFSp3QgVfxlDlCYu/oVNDolvtnCKDqdbHlSjPzb95
	 2m1ZsLm7e+NylWm0dsInjHa0bGykRmvn14PvWYpEgJ3mVs6VfL2j/g63VPdbSrpOJh
	 6LMluOUQDRQVTnJ8DlqkCR5Ah1rH4kg0/PugVLvM=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52B7S0kc061754
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 02:28:00 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 02:27:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 02:28:00 -0500
Received: from [10.24.68.192] (dhcp-10-24-68-192.dhcp.ti.com [10.24.68.192])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52B7RuHV002607;
	Tue, 11 Mar 2025 02:27:56 -0500
Message-ID: <8f03c097-e2c1-452a-85e2-90accbac7443@ti.com>
Date: Tue, 11 Mar 2025 12:57:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add J722S CSI support
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Vaishnav Achath <vaishnav.a@ti.com>
CC: <linux-kernel@vger.kernel.org>, <jai.luthra@linux.dev>,
        <y-abhilashchandra@ti.com>
References: <20250218185452.600797-1-vaishnav.a@ti.com>
 <174133309362.1072814.5440404016847301624.b4-ty@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <174133309362.1072814.5440404016847301624.b4-ty@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_002841_414532_074B2847 
X-CRM114-Status: GOOD (  11.43  )
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



On 07/03/25 16:06, Vignesh Raghavendra wrote:
> Hi Vaishnav Achath,
> 
> On Wed, 19 Feb 2025 00:24:47 +0530, Vaishnav Achath wrote:
>> This series adds support for CSI2RX capture on J722S EVM
>> and enables IMX219 and OV5640 overlays to enables
>> 4 sensors on EVM, this provides a reference for a user to
>> enable a different sensor on any of the ports.
>>
>> Test logs:
>> IMX219: https://gist.github.com/vaishnavachath/60cc2ef257601f27f28a315f8cf669c4
>> OV5640: https://gist.github.com/vaishnavachath/648202286d4d34d4d25f7c8c9db8b8bd
>>
>> [...]
> I have applied the following to branch ti-k3-dts-next on [1].
> Thank you!
> 
> [1/5] arm64: dts: ti: k3-j722s-main: Add BCDMA CSI overrides
>       commit: fb1b230bf9c45f5d6579dc329c2aafcd1263b70a
> [2/5] arm64: dts: ti: k3-j722s-main: Add CSI2RX nodes
>       commit: 8fea4519f625e6c1b05078f2ecea252b7b28b06e
> [3/5] arm64: dts: ti: k3-j722s-evm: Add camera peripherals
>       commit: ce553288ad2368f0d27e47b39a23121a825a2b33

> [4/5] arm64: dts: ti: k3-j722s-evm: Add overlay for quad IMX219
>       commit: c24ccb1cd77fb44087b2f7008d99626796b33ca4
> [5/5] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI OV5640
>       commit: 938806652b0a3c90d67e7137c91708d06940b03d

I have dropped 4 and 5 due to issues Rob pointed out in the other thread.

-- 
Regards
Vignesh
https://ti.com/opensource


