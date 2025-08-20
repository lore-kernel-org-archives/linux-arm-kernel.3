Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34DACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 03:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vdg4dKKl5Y5qxmdvIci/v8EsYo7STve3t3ZtY/n9Z0=; b=uU4oQWW2MufA4yyNcFRpCqSw8g
	uohP3ZxavEsnxN1z18zO+1bthkLgfpk15PbZH7kSso2Jlos+/Uu8a1UwqoN5F46g/BR/b/0FSgp2W
	D2uIphodJyJOWJxqZEWFGLM8N/moMi60xfQfHa5vBsCk1JAyQBtyAZu9vW1V71EvC7ygJiFjCeNG9
	ci7LE5ZuNDtWVfoX7Nzyuumtn0Ll2SoVbCv6IGfC/7NngSFpX27KEzD+y3XPx7Qfgldj12FxWXqvm
	/Jss0GsABzsUPNdCa5zZ6QWAK3qXH6WeA2QfiCDcBzDAEgpumOhGW1WrJ6B2IK2gGDjttdDksM/Y+
	XQZL015A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZRx-0000000CGZe-19Q4;
	Wed, 20 Aug 2025 03:25:21 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZLr-0000000CG8k-2x7b;
	Wed, 20 Aug 2025 03:19:04 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-afcb78e70c5so932632566b.1;
        Tue, 19 Aug 2025 20:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755659942; x=1756264742; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vdg4dKKl5Y5qxmdvIci/v8EsYo7STve3t3ZtY/n9Z0=;
        b=DLey6+u9WCKaptscL0GzBe4qV6U5rcyFN1jjS32bVgtGIAZUDz5PatzAHDd9FaLGI7
         YjMda4bEaG6fSSQmj9uu8syPbOcA7icMi/KpIhnz1/gE2ud1lU2oin/GKfcd3fRqldx8
         68xKra0lV1RodoPyUmo4SuvpcnLQkLqb+C4fDBiXZhI4mhcCb85cjKPDdGaw25J32/kn
         xobNLVfHU5fZW0xa+jBJVl3vRQISrMuH0TpBKhaZ+pjw3ND7ipyFBrDarT/ElB3tkJ2D
         sXcxm0OZpk0PWynQSN2MdPKF4QwVzzUkkkyzG28ZnxXuZiW3lv4tWT3MPB7U8xfeFIV7
         /Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755659942; x=1756264742;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vdg4dKKl5Y5qxmdvIci/v8EsYo7STve3t3ZtY/n9Z0=;
        b=ks7wTAeyCFSiaEgDGV+sKBtsXBzL7E8lqXvLExjDZ7eqwfcxzSRHJvk6q9mwI4WpNM
         BWaSJDs48FQ7dSMqdVuPMw2MNPBdqDokLR9sF1PdaTIhoZX9XIlrOWzMeMLayb8WVYiy
         0SdjI/yMV4jogIj/oCulBeRcsnUMP8l8Ozmw4BxUiuFYn73ixOjE5K2czr58peq0pxBv
         xOVdZqLXNYW6hvpsiAWG7GIJk9quE/7o19988gbRcy5LVSaLEdx/aukU+LHxoqDEIfiS
         2qN9AHISIvRjJ7zEOPDUQQVfCQ2EDTg4d59GBcBaDiep7R+EkCfK53UnsBZTmiTKsPom
         LlDw==
X-Forwarded-Encrypted: i=1; AJvYcCVFJlMDyK6S66WhOy+HPMNtCJc7+YyQUpfCJRdTijpogfir21B1j8FAd8YO+A+89FdLeFcLogrPq3DK67EPqbM=@lists.infradead.org, AJvYcCW/KG1InlANcrd0X0OmgTtgz9f66yGKkth64yvWpsstbZ25K46cC+a++vAOD9bAWL7ae1p7pBWkz+WxN9260wOm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1l60prZttKiw8zI9yjmEkttbtDM4ZevmsDIs6UTww5jeSBLpu
	z2A8WIXxSG1Et5qPf1urp34MtswevcKbVgL8+bh1nSAJLrFgyCh87SMu
X-Gm-Gg: ASbGnctfqgoYzKNbKZTVigK9UA9a+3cQAF4QttjK1004Eqk9TwKxN2wZlbWwLWOF08m
	MdZts5lOOxKv4DEQ5zgsdNk0AcuH7Akt3iuhaDIBQ3o64VzW3ublmT9Wzj54oIpD32+9G0JQsE/
	jNm3JCZhwrYnuxpCMvcQDs1uE9F/TwmLfEOAT8LLy4FqqOFNR6vdH8g/z54uQBFD/5rdHCpGUug
	lSKnoGv/BdC2A6EPbeB+zbl4hT1qHFkxymJJEw2Arj8OF33xIJlakz6DUzFJ+opYjh55FbxNEG/
	zmft2RXl7SL9P7Qfjo5v/LLLZXloBRVqokSZPuqHQvMZ/RwDNlE+193I7j7TFZ5qnBtVa1Rr2Yy
	1HprHfsb84tI1UHfKhO1e4V3YDfCL870ptcUlwbQBu7wO3HPz910kIETZr8wPZ+Iuvxg5BqscN0
	wgpbyaws5GYVe6RAIOq8Du5bHvUG9vyYLO0g==
X-Google-Smtp-Source: AGHT+IEIwwlIwoTIiNuhUQ07/bBrVkoWwe0s7LnQYSy2POy+c888AvHzKbMqqWN1VrmqgpQIHAF1pA==
X-Received: by 2002:a17:906:6a1d:b0:af9:237c:bb35 with SMTP id a640c23a62f3a-afdf00e2e81mr95410766b.22.1755659941758;
        Tue, 19 Aug 2025 20:19:01 -0700 (PDT)
Received: from [26.26.26.1] (ec2-3-75-144-20.eu-central-1.compute.amazonaws.com. [3.75.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded52ea4asm96482666b.101.2025.08.19.20.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 20:19:01 -0700 (PDT)
Message-ID: <d6b852bc-328a-41af-b125-e250c72c0d22@gmail.com>
Date: Wed, 20 Aug 2025 11:18:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] pci: Suspend iommu function prior to resetting a
 device
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
 jgg@nvidia.com, will@kernel.org, robin.clark@oss.qualcomm.com,
 yong.wu@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com,
 vdumpa@nvidia.com, jonathanh@nvidia.com, rafael@kernel.org, lenb@kernel.org,
 kevin.tian@intel.com, yi.l.liu@intel.com, baolu.lu@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org,
 patches@lists.linux.dev, pjaroszynski@nvidia.com, vsethi@nvidia.com,
 helgaas@kernel.org
References: <cover.1754952762.git.nicolinc@nvidia.com>
 <3749cd6a1430ac36d1af1fadaa4d90ceffef9c62.1754952762.git.nicolinc@nvidia.com>
 <550635db-00ce-410e-add0-77c1a75adb11@gmail.com>
 <aKTzq6SLGB22Xq5b@Asurada-Nvidia>
Content-Language: en-US
From: Ethan Zhao <etzhao1900@gmail.com>
In-Reply-To: <aKTzq6SLGB22Xq5b@Asurada-Nvidia>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_201903_751116_005A4566 
X-CRM114-Status: GOOD (  24.26  )
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



On 8/20/2025 5:59 AM, Nicolin Chen wrote:
> On Tue, Aug 19, 2025 at 10:12:41PM +0800, Ethan Zhao wrote:
>> On 8/12/2025 6:59 AM, Nicolin Chen wrote:
>>> @@ -4529,13 +4530,26 @@ EXPORT_SYMBOL(pci_wait_for_pending_transaction);
>>>     */
>>>    int pcie_flr(struct pci_dev *dev)
>>>    {
>>> +	int ret = 0;
>>> +
>>>    	if (!pci_wait_for_pending_transaction(dev))
>>>    		pci_err(dev, "timed out waiting for pending transaction; performing function level reset anyway\n");
>>> +	/*
>>> +	 * Per PCIe r6.3, sec 10.3.1 IMPLEMENTATION NOTE, software disables ATS
>>> +	 * before initiating a reset. Notify the iommu driver that enabled ATS.
>>> +	 * Have to call it after waiting for pending DMA transaction.
>>> +	 */
>>> +	ret = iommu_dev_reset_prepare(&dev->dev);
> 
>> If we dont' consider the association between IOMMU and devices in FLR(),
>> it can be understood that more complex processing logic resides outside
>> this function. However, if the FLR() function already synchironizes and
>> handles the association with IOMMU like this (disabling ATS by attaching
>> device to blocking domain), then how would the following scenarios
>> behave ?
> 
> That's a good point. The iommu-level reset is per struct device.
> So, basically it'll match with the FLR per pci_dev. Yet, the RID
> isolation between siblings might be a concern:
> 
>> 1. Reset one of PCIe alias devices.
> 
> IIRC, an alias device might have:
> 
>   a) one pci_dev; multiple RIDs
> 
>      In this case, neither FLR nor IOMMU isolates between RIDs.
>      So, both FLR and IOMMU blocking will reset all RIDs. There
>      should be no issue resulted from the IOMMU blocking.
> 
>   b) multiple pci_devs; single RID
> 
>      In this case, FLR only resets one device, while the IOMMU-
>      level reset will block the entire RID (i.e. all devices),
>      since they share the single translation tunnel. This could
>      break the siblings, if they aren't also being reset along.
Yup, such alias devices might not have ATS cap. because of they
are PCI devices or they share the RID(BDF), so checking ATS cap
condition might be useful here to skip the prepare()/done() .>
>> 2. Reset PF when its VFs are actvie.
> 
>   c) multiple pci_devs with their own RIDs
> 
>      In this case, either FLR or IOMMU only resets the PF. That
>      being said, VFs might be affected since PF is resetting?
>      If there is an issue, I don't see it coming from the IOMMU-
>      level reset..
Each of the PF and its VFs has it owns RID(BDF), but the VFs' life
depends on the living of PF, resetting PF, means all its VFs are
lost.

There is no processing logic about PF and its VFs in FLR() yet.
my understanding the upper layer callers should consider the
complexity of such case.

While we introducing the connection of IOMMU & device in FLR(),
seems we brought some of the logic from the outside to the inside
part.

One method might we don't handle PF either by explicit checking its
VF configuration existing to skip prepare()/done() ? till we have
much clearer handling logic about it.

Thanks,
Ethan
   > d
> Thus, case b might be breaking. So, perhaps we should add a few
> conditions when calling iommu_dev_reset_prepare/done():
>   + Make sure that the pci_dev has ATS capability
>   + Make sure no sibling pci_dev(s) sharing the same RID
>   + Any others?
> 
> Thanks
> Nicolin


