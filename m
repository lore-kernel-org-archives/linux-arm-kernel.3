Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BF9C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mboPEqvEACJTAtKfdZ1iQemoHuICqAXG3If2FFLFlMA=; b=or478DiN8Yc7quyhGU1RJbFsw5
	lmvMjIpja9F+OL4aNyUz8T7SWFRTnOJMQBA7i+2SMUXDkiO/Gyq/ksqzhHr/rUyaYWUxW+jD+QMOr
	3dkE1fUrhjcGWgRH4mUlIgQq+x5Mwn7EXjnzD9tT63aCLWyaPFf0wzccTHBFviGPJUUNl4knkMqRB
	jwW8LkdTPNlmWcfxEh+y/ppSf/gGuwnD/8ABPz3R8HYayinvU+6MTjsPwbXB8BBHF3mGGHAW3OvYL
	LA8gwV6NKZ05AQtef+9g/E01Da/R0I+3S5+x9YrkSgpM+yUeba19jFU4J5k512IZtK2ZJjHfDx3hw
	U9WFVCXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Vik-0000000E5Qn-1tdi;
	Fri, 18 Sep 2026 10:21:30 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Vid-0000000E5Or-2Okf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 10:21:28 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260918102113epoutp01cc8d0f6839119cc864ed767ae77f4696~WYxwJDTn50116101161epoutp01_
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:21:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260918102113epoutp01cc8d0f6839119cc864ed767ae77f4696~WYxwJDTn50116101161epoutp01_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789726874;
	bh=mboPEqvEACJTAtKfdZ1iQemoHuICqAXG3If2FFLFlMA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=q5/rYOyzAIRpwubUTigeHz6catvyr++oiaU0INH8BrZP7KLLV9GmF/P5lT+WyNEqy
	 UjLYF4YCdC/VH4C7Haw4t0HWT7x0kdeA4NnZG3++Eq4dMR/OGK38YtBcwoHISHcvKG
	 4qkctIkTlEfF4mqOP/2EOkD1nnjrUbES0DxJmT9w=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260918102113epcas5p2a37090873c7e08a5b15b0fecf005810b~WYxvgUOtV0355903559epcas5p2C;
	Fri, 18 Sep 2026 10:21:13 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hmTDS15Ysz6B9m7; Fri, 18 Sep
	2026 10:21:12 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260918102111epcas5p202e3b90fcfd624683f76a2ee45f199d4~WYxt86RB51756317563epcas5p20;
	Fri, 18 Sep 2026 10:21:11 +0000 (GMT)
Received: from [107.122.5.126] (unknown [107.122.5.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260918102109epsmtip1577c944b77491d8b4992d17593276ce2~WYxrze7hA1639116391epsmtip1_;
	Fri, 18 Sep 2026 10:21:09 +0000 (GMT)
Message-ID: <32029c62-faad-42e3-b1bb-e66772ca8ac0@samsung.com>
Date: Fri, 18 Sep 2026 15:51:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	vkoul@kernel.org, neil.armstrong@linaro.org, krzk@kernel.org,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, pritam.sutar@samsung.com,
	kernel@lvkasz.us, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jh0801.jung@samsung.com, dh10.jung@samsung.com, akash.m5@samsung.com,
	muhammed.ali@samsung.com, thiagu.r@samsung.com
Content-Language: en-US
From: Selvarasu Ganesan <selvarasu.g@samsung.com>
In-Reply-To: <950335110f9d9c22a026fa5174e492c4194299a5.camel@linaro.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260918102111epcas5p202e3b90fcfd624683f76a2ee45f199d4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0
References: <CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
	<20260831070309.158069-1-selvarasu.g@samsung.com>
	<950335110f9d9c22a026fa5174e492c4194299a5.camel@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_032125_276696_3C10F387 
X-CRM114-Status: GOOD (  19.54  )
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


On 9/18/2026 2:04 PM, André Draszik wrote:
> On Mon, 2026-08-31 at 12:33 +0530, Selvarasu Ganesan wrote:
>> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
>> creating both UTMI and PIPE3 PHY instances regardless of the SoC
>> capability. Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990,
>> and ExynosAutoV920) provide phy_cfg arrays containing only a single
>> element.
>>
>> On these SoCs, when the loop reaches index 1, the driver reads past the
>> end of the rodata array, populating the second PHY instance with garbage
>> data. Since the configuration structure contains critical function
>> pointers (phy_isol, phy_init, set_refclk), any subsequent access to this
>> PHY instance via exynos5_usbdrd_phy_xlate could result in a kernel oops.
>>
>> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
>> store the actual size of the phy_cfg array for each SoC. Update the
>> probe loop and the xlate function to bound their access against this
>> value instead of the hardcoded EXYNOS5_DRDPHYS_NUM.
>>
>> Assisted-by: Claude:claude-sonnet-5
> Shouldn't this be 'Assisted-by: LLM'?
You are correct. I will update the tag to 'Assisted-by: LLM' as per the 
kernel documentation in the next version.

Thank you for pointing this out.

Thanks,
Selva
>
>> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
>> ---
>>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
> Other than that:
>
> Reviewed-by: André Draszik <andre.draszik@linaro.org>

