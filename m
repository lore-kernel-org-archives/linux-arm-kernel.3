Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C54C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhjPX55qNqqjOxzpxaedZHl4L7VXx1ilpZg/AhTGduY=; b=z7S55Nct5hnCzDTkDJOOi/bYkw
	whVdymtRzsCvqIHddPIti6s/vz99BKQ+yjjptLAt//gzNuvaouIx1AUAv5VW28yhAXAiHa6f6r5FN
	NJaz/Ym437JZ+Nd9Iw1hhsOEB74c/yOmf0/qUtuyF1xvKTqylQxm8Bhv2sdBJ26gsQfRxACA74QMh
	JoN8o38IgyHioVL8au+tQYPLBsvILMHZ5I8TkzZ11Xw9wpPfZkRPmEOYIe4hODSzxwe/E32PCHuf/
	PVfQmxNVPeNHM5q27Ou0hnCfo8nBa2UuyK9sZJPKk+QL0JbHmr7DinpqL02IVhS2LUDwqd+E2ms58
	g1vrOMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzDo-000000095RF-1SZS;
	Mon, 19 May 2025 12:03:56 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGz8v-000000094em-1bWe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 11:58:54 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JAPBUH010261;
	Mon, 19 May 2025 13:58:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VhjPX55qNqqjOxzpxaedZHl4L7VXx1ilpZg/AhTGduY=; b=sTzvXOOswe4ROvPG
	wsi9pzxc8l7SmQtEn1cEs8UoqqJbLbbcZ1xMECJbiq1S3y0RA8viWW7igJfs4KlW
	NQ8v1y/7DTwtB5EfpKOR3ECofwz8Jt0GqCb3pERCqHa36EAXZqdmKzPFp1PgG/QF
	mGIirgK2io2f+MnsimmDdwRpapmyu1M3a8v/L3G85d4lMzNJOzW+R9/jO1o/37TE
	s6XFHANiQhMqJwyt/3C0sDM5Qpt10E4Cc2LcpAxcI3Dv14swyuUQb6/BotJtw7gx
	yfOHwbuoXUrItpHiKj4LwLP2P6XNIbmoFN26X+MsUbTC5W4n6CRrm3+nS+PrHEbi
	tjjGxQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfk9ybbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 May 2025 13:58:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 38C8F4004A;
	Mon, 19 May 2025 13:57:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C7E748AE37A;
	Mon, 19 May 2025 13:57:02 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 13:57:02 +0200
Message-ID: <d783a0cb-9b5f-4757-bba2-ef425c79f6c7@foss.st.com>
Date: Mon, 19 May 2025 13:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: Add nvmem-cells to ethernet nodes for
 constant mac-addresses
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Ahmad Fatoum
	<a.fatoum@pengutronix.de>
References: <20250328171406.3307778-2-u.kleine-koenig@baylibre.com>
 <xvhstvgs5bpfebeolozdbxh2empviijqq6hg2k2kuav5xykpqw@a3jgkrqzj4xm>
 <k5sznrkn6shjn3d5uj675sktkgwf3aivfr7hchialln433ktjs@u42bfyo7tnej>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <k5sznrkn6shjn3d5uj675sktkgwf3aivfr7hchialln433ktjs@u42bfyo7tnej>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_045853_693840_079DF44C 
X-CRM114-Status: GOOD (  13.72  )
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

Hi Uwe

On 5/16/25 11:50, Uwe Kleine-König wrote:
> Hello,
> 
> On Thu, Apr 24, 2025 at 05:07:00PM +0200, Uwe Kleine-König wrote:
>> On Fri, Mar 28, 2025 at 06:14:05PM +0100, Uwe Kleine-König wrote:
>>> The efuse device tree description already has the two labels pointing to
>>> the efuse nodes that specify the mac-addresses to be used. Wire them up
>>> to the ethernet nodes. This is enough to make barebox pick the right
>>> mac-addresses and pass them to Linux.
>>>
>>> Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
>> I wonder if this patch is on someone's radar?!
> 
> I still wonder. Is this just due to -ENOTIME for the maintainers, or are
> there doubts about this patch?

No doubt just my fault as this patch went off my radar. Sorry.

Applied on stm32-next.

Thanks
Alex

> 
> Best regards
> Uwe

