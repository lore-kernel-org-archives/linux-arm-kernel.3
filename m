Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFE6CD5BDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 05:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Subject:CC:To:MIME-Version:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/BiXb+f+RdbNY+mkS/FO+sRGrC8T8yS5135DO/Z7kE=; b=wSUfpitU0YaNMgVmr2DzLUBspp
	b/frn33MPwL1j8N/a5aV72FgFITl9FjKZ4MOSw1krXZOCR2cL3W+FkEXTTQrVGOD8TZfenHgx2niR
	qs+zGSpNqWdXIYZNpcVD4f79oJr92ZbKsFxz+clpVPOHDK1sAJicaWur/G1D4S37IN3mMiLkDkHBx
	vEcZLygjiEthkAC9v0jH9fjsD6TWITVKdLlkt+KoABA2Y3RRX92OFcmvHjzmabsDBus9z1azjByxC
	jtTsljnlCok72bH0sScayHAp075E31TAwNma343oHYwLWRBI8jTTIuyVffWbDaDDirBP7V4z0KLxs
	fYht+SQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS6vk-00000003Lxy-0Vwz;
	Wed, 27 May 2026 05:35:48 +0000
Received: from m16.mail.126.com ([220.197.31.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS6vg-00000003Lx6-131W;
	Wed, 27 May 2026 05:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=P/BiXb+f+RdbNY+mkS/FO+sRGrC8T8yS5135DO/Z7kE=;
	b=MDQ+o5rLGPjjxgfsygZLTcJuRBIWE2s2S95pbrHpgnXB/jyHP5tNCtwa4IbwzY
	1hLPdhuGTaCeNIsx0d3ezc5M4NjAGTEvRMJPSvr36bsPtYbV5p7XzJI0XNx5qFsX
	ZNpakpB4WVGfQHd+SIKHqxssICMwkDVQSUzjH19EjjJTQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSkvCgDnT_OLghZqhX4uAA--.38309S2;
	Wed, 27 May 2026 13:35:08 +0800 (CST)
Message-ID: <6A168290.1030507@126.com>
Date: Wed, 27 May 2026 13:35:12 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Sean Wang <sean.wang@kernel.org>, 
 Hongling Zeng <zenghongling@kylinos.cn>
CC: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
 shayne.chen@mediatek.com, sean.wang@mediatek.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 xiong.huang@mediatek.com, madhurkumar004@gmail.com, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: mt7921: fix resource leak in probe error
 path
References: <20260527034350.527482-1-zenghongling@kylinos.cn> <CAGp9LzruaD57tE5XHHAM8mKoPc-JQSAcaTdgvdSfESJjz-9XnA@mail.gmail.com>
In-Reply-To: <CAGp9LzruaD57tE5XHHAM8mKoPc-JQSAcaTdgvdSfESJjz-9XnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSkvCgDnT_OLghZqhX4uAA--.38309S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw4UKrW8Xryruw4UJr4DCFg_yoW5CFWUp3
	yrXa4YkFy5Jr47WanxAa1UZFn0vws5Gr1UGrWYvw13ZryfArn7tF4xK3Z0yryFv39Y9FyF
	qF4jvw13Cas0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j4Hq7UUUUU=
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBoQzjtGoWgowLLQAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_223544_726593_8ADF7887 
X-CRM114-Status: GOOD (  20.58  )
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

   Hi Sean,

   Thanks for the review! You're absolutely right about the incorrect 
Fixes: tag.

   Here's v3 with the correct Fixes tags pointing to the actual commits that
   introduced the resource leaks:

   - ee5bb35d2b83 introduced the pcim_iomap_region() direct return
   - 222606f43b58 introduced the devm_kmemdup() direct return

   Thanks again for catching that.

   Regards,
   Hongling


在 2026年05月27日 12:48, Sean Wang 写道:
> Hi,
>
> On Tue, May 26, 2026 at 10:44 PM Hongling Zeng <zenghongling@kylinos.cn> wrote:
>> When pcim_iomap_region() or devm_kmemdup() fail, the code returns
>> directly without cleaning up previously allocated resources:
>>    - mt76_device allocated by mt76_alloc_device()
>>    - pci irq vectors allocated by pci_alloc_irq_vectors()
>> Fix this by jumping to the existing error cleanup path instead of
>> returning directly.
>>
>> To avoid using an uninitialized variable in the error path, move the
>> dev initialization before the error checks.
>>
>> Fixes: 234738ea3390 ("phy: ti-pipe3: move clk initialization to a separate function")
>> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
>>
> The code change itself looks correct, but commit message Fixes: tag is wrong.
>
> It points to 234738ea3390 ("phy: ti-pipe3: move clk initialization to
> a separate function"), which is unrelated to mt76/mt7921.
>
> The two direct-return leaks appear to come from:
>        - ee5bb35d2b83 ("wifi: mt76: mt7921: Replace deprecated PCI
> function") for the pcim_iomap_region() path.
>        - 222606f43b58 ("wifi: mt76: mt7921: handle MT7902 irq_map quirk
> with mutable copy") for the MT7902 devm_kmemdup() path.
>
>> ---
>>   Change in v1
>>     --fix uninitialized variable warning
>> ---
>>   drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 15 ++++++++++-----
>>   1 file changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
>> index 7a790ddf43bb..49a37185f056 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
>> @@ -343,11 +343,14 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>>
>>          pci_set_drvdata(pdev, mdev);
>>
>> +       dev = container_of(mdev, struct mt792x_dev, mt76);
>> +
>>          regs =  pcim_iomap_region(pdev, 0, pci_name(pdev));
>> -       if (IS_ERR(regs))
>> -               return PTR_ERR(regs);
>> +       if (IS_ERR(regs)) {
>> +               ret = PTR_ERR(regs);
>> +               goto err_free_dev;
>> +       }
>>
>> -       dev = container_of(mdev, struct mt792x_dev, mt76);
>>          dev->fw_features = features;
>>          dev->hif_ops = &mt7921_pcie_ops;
>>          dev->irq_map = &irq_map;
>> @@ -359,8 +362,10 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
>>                  /* MT7902 needs a mutable copy because wm2_complete_mask differs */
>>                  map = devm_kmemdup(&pdev->dev, &irq_map,
>>                                     sizeof(irq_map), GFP_KERNEL);
>> -               if (!map)
>> -                       return -ENOMEM;
>> +               if (!map) {
>> +                       ret = -ENOMEM;
>> +                       goto err_free_dev;
>> +               }
>>
>>                  map->rx.wm2_complete_mask = 0;
>>                  dev->irq_map = map;
>> --
>> 2.25.1
>>
>>


