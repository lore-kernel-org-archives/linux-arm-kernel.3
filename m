Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476B3C55174
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 20:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Se3TlLpuysYiEG2DYm26v81iW1ITt60yQ73LdmliEgA=; b=s2wL/3rRSE8f09NANsi1QCXL/m
	bxd578a9EkqG6Ff+YKj3XCEipx8MmQ+waACXdOM12VzaWmLYUBmMMEoyLx4fxyf0mEowHPMGzFhE+
	x/EXRktpXoCNqKUAc+QSlsTLlCcxDAziqfGDu3Orc2J3NoH1oL33oLv2RR5idCfNPP68eK9spzrWO
	7sHu67nc51x+kxOA5MIo5dyqbHXOuzlEkqT4EyaJtz53cQKatazOIpvOyCbh4Q+X6ngUVXAxxiK0Q
	JEMMMPqi1lc6UyPUSUDjbRHfvhyCXds35D9YIjxMmQj5KzFTP6Ksw6n3RaGsyaNcjDipEdC+ZpcOw
	r2BDJB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptvm-0000000DYcf-19kB;
	Fri, 31 Jul 2026 20:34:10 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wptvj-0000000DYbw-27su
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 20:34:08 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4758bd3731bso1525960f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 13:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785530045; x=1786134845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Se3TlLpuysYiEG2DYm26v81iW1ITt60yQ73LdmliEgA=;
        b=FRMuQ289n1irgsXgJR1bUcb8ZOxU5l4pAtqsxicToxkuPefcX5zh2adAmH13cmTbJk
         cCZoq/9NMlQUqmiM2WgSBTkwdg721Z+0zj+prJzQOvr/rVDR36+bu1ffWAFZCRXvlvZN
         cduaRK4Ay7IbgAYF6i28DON1t0YZGR9v39GPPKkjRC4p/PznjUC7kDZ9JJHr+CDP5/ZP
         PUuATMAu6EWZWMP4g2cq2UMVo24WWP5tFsbxpGrJJmEfJsvK2Il0zGXGMPdFXLNZI/IM
         p5s1J0/ZW7oMLHa53EtXPzZPNIKIv5MPPBPIeHmcBXL0S8DQrXto38o8oDG5QVJoGOuV
         1hgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4ugHhX+PEHfXGmYgEFmtpu6zsf+UzLXxHQ+yDieeiTx/OnEDuKuEvmWYytcRuZBUDZ/EHU/3ozM5VJRYvvDZg@lists.infradead.org
X-Gm-Message-State: AOJu0YzVaYoKa4VDetc63UvGXE1QtRTczusbW/qDGtm5Kx/JpV4iJRSp
	RjYiazxUXiF6fNSfgSIJo0dJY4bGFqVPBP+mvNyrXXDIKrJ6537z1bjM
X-Gm-Gg: AR+sD11uwdABB7JWPQ+XykX1sopye6FruB4PxPeats8br0zmy4iAIIzaJp/sBZDY6Rz
	3mQcZzzs7BCRTt/r7qQeE8Fkhyvcqj9zoP2nNNa23prfSEtNERWnDU+OB44ViYUsMkoSrk40JQG
	buUxBKuYD4Ny3cIgayXGyE9clNxvYlcPpG5SsVquohCoCg+zYrIKKMz9etGzx2JqIc3/FIfNcZ4
	JGFQ7Pv4Ai6MTHgybijcjXmDUvbGHm1YRry3qlnRhR/mz5ArngvEDW/jBbgybWRkVuH/cBSMwlg
	FEKCDJMnOBHd50AvmdfCTOfJVZyPBLLHyGrby9R3HaTWonyddm2c3J9RQ5T498sc1i8vNTXSjhW
	Wm4s++da6XgEdXuvszfU+l0KnD8Ss4c/d5I3EiYu60CtpEVlOfD0kU9JOk5jSPd7r4XGF5vHpue
	3e9QcQnETKOwKHuf59so91/f1qWw7K163igUPT1MVfwKgFgZ9i7aAPLiR6+xwt3l4SLqdCi2t9f
	gAqF4thMFqAQmxzhCYlu/wRidpjgQX4IwRmqA7xGMLEMBiBRZJfcWMUrvPkwCtq9eja
X-Received: by 2002:a05:6000:1846:b0:47f:6e8b:699c with SMTP id ffacd0b85a97d-47fd729208fmr2040027f8f.14.1785530045266;
        Fri, 31 Jul 2026 13:34:05 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm9618856f8f.19.2026.07.31.13.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 13:34:04 -0700 (PDT)
Message-ID: <6d9b28ec-0905-4cb0-9a62-980c7fa69572@reactivated.net>
Date: Fri, 31 Jul 2026 21:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 nick.hollinghurst@raspberrypi.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260727-bcm2712-iommu-submit-v2-0-0247b5c03de8@reactivated.net>
 <20260727-bcm2712-iommu-submit-v2-4-0247b5c03de8@reactivated.net>
 <20260730-small-solid-spoonbill-8a8bbd@quoll>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <20260730-small-solid-spoonbill-8a8bbd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_133407_557233_5649DAE8 
X-CRM114-Status: GOOD (  16.78  )
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

On 30/07/2026 08:00, Krzysztof Kozlowski wrote:
> On Mon, Jul 27, 2026 at 09:43:59PM +0100, Daniel Drake wrote:
>> +static int bcm2712_iommu_init_cache(struct bcm2712_iommu *mmu,
>> +				    struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct platform_device *cache_pdev;
>> +	struct device_node *cache_np;
>> +
>> +	cache_np = of_parse_phandle(dev->of_node, "brcm,iommu-cache", 0);
>> +
>> +	/* Fall back on 'cache' property used in old/downstream firmware */
>> +	if (!cache_np)
>> +		cache_np = of_parse_phandle(dev->of_node, "cache", 0);
> 
> NAK.
> 
> You cannot have undocumented ABI. I asked you to drop this at v1.
Is there any approach I should consider here in order to support 
existing shipped firmware versions that use the 'cache' property, or 
should I simply break compatibility?

While I was working on another issue recently there was a lean towards 
supporting existing/wrong DTs at the end of
https://lore.kernel.org/all/878q898ulx.wl-maz@kernel.org/

but admittedly that case has some different parameters: it was incorrect 
DT values (not incorrect ABI) and also was more severe (breaks boot). In 
this case if the system were to boot without iommu support it is not the 
end of the world.

Thanks,
Daniel


