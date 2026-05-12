Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAC5CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rq4RL+Vka9BqWTh+n74cXJ8jiIkAjFYQA9ezbcVKwM8=; b=GJluWRWzZTs3URs68dwGj3Uwd1
	BfWvsdSu1IeElzmrwGJHps37asJndoSz6gRiQtKhTcKFMjuaj6Q3WmnSJ05XqhbfOKRwx88ymD6xi
	G0Zk0+7GLLZZdtL2pCclkaWlwPM7W0AUVTImMCyaIxWkWzKFdlybPZkzm8KB1l9ueuX62rYLzTlBE
	77T7b8DKqPjbSGYAZ3TaGlLUBkkWPVAAQQasjmwPq1ut93v3WPucYqy3xLc1IKehfIauECu34/xuA
	gcQlLZ8xbL+JjuPP7ynvgh1Cwly7p8KoDqhi6hSyd6OU/8FdECpBWSojwxBwdgWQjFVYlCOQqDsn8
	/R+CV3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk1T-0000000GNoQ-2O2D;
	Tue, 12 May 2026 10:07:31 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk1Q-0000000GNlb-1bTr;
	Tue, 12 May 2026 10:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=rq4RL+Vka9BqWTh+n74cXJ8jiIkAjFYQA9ezbcVKwM8=;
	b=l11nVtHhS05LPBjraPnJUV3epcd49eg7vnfCSTy3DkvxfB/Iem6EvnQ4JrZ+O3
	BhcY7irXVFlck61xjPG4X8Hus9w0cfkoycqGiyCMqQ/WFdniOD93FdgJ9AxJeoGe
	dVHmA2apbi2ME13a7dgimnGQ49LaIn7Vkbs2WArMTitJE=
Received: from [192.168.50.71] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgB3yRC0+wJqHlnODQ--.89S2;
	Tue, 12 May 2026 18:06:46 +0800 (CST)
Message-ID: <a28b7442-8bd6-4a05-8864-af6c0ad35a2c@163.com>
Date: Tue, 12 May 2026 18:06:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
 mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 claudiu.beznea@tuxon.dev, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
 <20260511070139.GA1096586@rocinante>
 <e600d0a4-b93e-425f-a5f1-c76802c65622@163.com>
 <20260512071328.GA3606279@rocinante>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260512071328.GA3606279@rocinante>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgB3yRC0+wJqHlnODQ--.89S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr47XFW5ZryfKF15WryDWrg_yoWxuFg_u3
	y8Awn7ur43XF93WwsIyrn8XFnxX34DuFWFqry0vrW2gw1jga1qyrsIgFs5ta1xC3y7JF47
	JF1vkw1xKwn3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjeT5PUUUUU==
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xZH6moC+7ZuEQAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_030728_774959_C2526ED0 
X-CRM114-Status: UNSURE (   6.82  )
X-CRM114-Notice: Please train this message.
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



On 5/12/26 15:14, Krzysztof Wilczyński wrote:
> Hello,
> 
>>>> -	/*
>>>> -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
>>>> -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
>>>> -	 * after Link training completes before sending a Configuration Request.
>>>> -	 */
>>>> -	if (pci->max_link_speed > 2)
>>>> -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
>>>> +	pci_host_common_link_train_delay(pci->max_link_speed);
>>>
>>> This comment could move to the helper you added.
>>
>> Hi Krzysztof,
>>
>> Will add.
> 
> No need.  Per Mani's feedback about macro being well documented.
> 

Hi Krzysztof,

Okay.

Best regards,
Hans

> Thank you nonetheless!
> 
> 	Krzysztof


