Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB94C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gqdWLmhlmvRAVAbQEmyb3OnvKFUT4lR61wher7OOzk8=; b=fX60GltuY382xLphSGlYV1XCA3
	r7+4yUdSW1LbPZDQhZVT2Rocja5ffWZFRuB51+2/vF6RZMNSLaXoothUhmCfV1KIJAz+Ij3DWk3qI
	tsDOUkzThDYPxedsOQvVvNjcam4iJo6wB+u1mpJrl4QJWpiqcR2cJxyIjJCvftOYyTY7ddiOSbc8K
	4vchiJbHzwtOjtrRgn7UDCxRQrNzXpCQbjSuHky+26O9B7b27Iu7ubt2fpuYUhC8j+OLk0ArnNE+Y
	NASeYZVLXI/099mQA2ASBbNzCttQgjN3LvE/l9pj4IRov3rjbuL0d5pKS3cj7wKE4QwEJLk3gT997
	cK7tLSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyHU-00000006nxY-1o4o;
	Tue, 10 Jun 2025 12:40:44 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxia-00000006iCs-1wPd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:04:42 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9ILvm010710;
	Tue, 10 Jun 2025 14:04:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	gqdWLmhlmvRAVAbQEmyb3OnvKFUT4lR61wher7OOzk8=; b=uxkwqydqfyLrmp7t
	TJl3Ulbxd6zF2T+xkvCBu74SD8g9pfxIaq+Wx4f+3NsfoFn/aLhc/wEQ0W22K7qt
	OzKjtrs7t++64ir1Z3zVov1dj3kFY6yVlBy30euB8rO+sUZUIgYwV9TaGGN+8C/n
	p2HDupMKjgC5tITajvL/4tB0UMAGeKUUc6w6Nm36KVBrdKZaVDh+U2uErYt+qinW
	eH/QibaZAAeyFICgO7TUz3Ycfp/1ZN1lhXoHugTDYpt6U7vxSSv3nvhU7UasK/WF
	ib3EjRS/7SELBKfeh1X/Fw8ig3urGWYz4Nu2sV/taSA77PCIpdFb7hU46/a7ZClb
	vfPkQg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y052bdd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:04:27 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2495040044;
	Tue, 10 Jun 2025 14:03:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D6EAAB35036;
	Tue, 10 Jun 2025 14:02:35 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:02:35 +0200
Message-ID: <714ad17d-53f1-4703-8e13-61c290a8da89@foss.st.com>
Date: Tue, 10 Jun 2025 14:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
 <5b7a2102-ff68-4aab-a88d-0c4f9195ef95@kernel.org>
 <3c868c4b-8a0e-44b5-9d6e-3a0526d9deeb@foss.st.com>
 <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <3ba588ed-1614-4877-b6fc-b5aa853b8c2e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_050441_038076_61AC6EFD 
X-CRM114-Status: GOOD (  12.16  )
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

On 5/29/25 11:01, Krzysztof Kozlowski wrote:
> On 28/05/2025 14:14, Clement LE GOFFIC wrote:
>>>
>>>> +		};
>>>> +
>>>> +		hdp: pinctrl@5002a000 {
>>>> +			compatible = "st,stm32mp131-hdp";
>>>> +			reg = <0x5002a000 0x400>;
>>>> +			clocks = <&rcc HDP>;
>>>>    			status = "disabled";
>>>
>>> Why are you disabling it? What is missing?
>>
>> Nothing is missing just disabled by default.
>> The node is then enabled when needed in board's dts file.
> Nodes should not be disabled by default if they are complete. That's why
> I asked what is missing. Drop.

Hi Krzysztof, OK I better understand now.
So yes the 'pinctrl-*' properties which are board dependent are lacking.

In the last patch of my serie I add them (only for stm32mp157f-dk2) but 
keep it disabled because the pin is on an external connector (the 
Arduino connector of the board).
This prevent any issue with a possible connected module.

> Best regards,
> Krzysztof


