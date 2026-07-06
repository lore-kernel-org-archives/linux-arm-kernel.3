Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0CDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FSUFQZeQg2TGtjcSJ0ldrXi3zwErqPgrRk42nVLXNw=; b=D/2vSWggSJ0IHJEYP310LdmsVw
	YrwPhuT2ya9656OLowp12mBZxQn6c2+ES7Ku7cfjAUiSZVWeT9+OZZUkc9XNVgI2bCVP2LKYMceWJ
	z0Vz2K2VG5GizVWjpSAyTA1j/U0zRae46GvVoNwnEZEWFyrEt6sGd+8Ihxl+W9aqk9VDAXr/ulnh5
	6IpW55KCjoi/+TfmyRmPwtGb1FRWLwrCVW8RRf8UfcBY+DHagfUatOM2dNQGRgh+4PEQdmv5Dm0zn
	5ENV0S4/1AOI4CoMhQQ5CepuCSqzmh1h9FEFoVGVr4gNjPvVuPX9u1iOaXF2ADVEVbib3g0Y9st/N
	NyAboftw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglEL-0000000CsmB-2kiV;
	Mon, 06 Jul 2026 15:27:33 +0000
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglEH-0000000CskV-3Q5j;
	Mon, 06 Jul 2026 15:27:32 +0000
Received: from zju.edu.cn (unknown [10.97.40.56])
	by mtasvr (Coremail) with SMTP id _____wDHoV5WyUtqX1wSAA--.41010S3;
	Mon, 06 Jul 2026 23:27:19 +0800 (CST)
Received: from smtpclient.apple (unknown [10.97.40.56])
	by mail-app4 (Coremail) with SMTP id zi_KCgBXOzRVyUtqzJgdAg--.37327S2;
	Mon, 06 Jul 2026 23:27:17 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] media: rockchip: rga: quiesce IRQ before releasing m2m
 state
From: Fan Wu <12321260@zju.edu.cn>
In-Reply-To: <ba54b43f90b46960ce4e57f99ead11e4200d283d.camel@ndufresne.ca>
Date: Mon, 6 Jul 2026 23:27:07 +0800
Cc: Fan Wu <fanwu01@zju.edu.cn>,
 jacob-chen@iotwrt.com,
 ezequiel@vanguardiasur.com.ar,
 mchehab@kernel.org,
 heiko@sntech.de,
 linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB4C9604-8CCF-4A2E-B8B0-FC49AAFEA514@zju.edu.cn>
References: <20260704022853.77291-1-fanwu01@zju.edu.cn>
 <ba54b43f90b46960ce4e57f99ead11e4200d283d.camel@ndufresne.ca>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-Mailer: Apple Mail (2.3774.600.62)
X-CM-TRANSID: zi_KCgBXOzRVyUtqzJgdAg--.37327S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?dqOMzwXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnXz+g1OQfMo27QHy5TwQyZyj5fn2rqIkMhUMM0kYWus3lLILucikqw2VGVgn3TCMm059
	TPTTfv6HCtFDRH6LZYmp9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoWxGw4kCr18tw15Xw4rKry5WrX_yoWrtry7pa
	y5tayjkrWUGF4jqrnrXw47uFZ5Arnaya45Gr4Sg347Ar98Kr1kXryUCFy5ZFy3Zr97Aay2
	vr4Yqas3ZF4YqFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804V
	CY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AK
	xVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48Icx
	kI7VAKI48JM4x0Y48IcxkI7VAKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7gAwDUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_082729_990380_674F0090 
X-CRM114-Status: GOOD (  23.77  )
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

Hi Nicolas,

Thanks, that is a fair point that RGA is not a free-running IRQ source;
the interrupt should only be raised for job completion.

I looked again for the abort/drain path, though, and I could not find =
one
in the RGA teardown path. `v4l2_m2m_release()` only frees the m2m =
device.
RGA does not provide a `.job_abort` callback, and `rga_remove()` does =
not
reset the engine or disable the IRQ before releasing the m2m state. The
driver also leaves the devm-managed IRQ installed until devres cleanup
after remove returns.

So unless I am missing another path, teardown does not actively abort an
in-flight RGA job; it relies on there being no in-flight job by the time
remove gets there. In the normal case that is probably true, since the
hardware is not free-running and the submitted job has normally =
completed
already. The case I was trying to cover is the narrower one where
unbind/remove races with a still-running job.

That said, I agree the explicit irq field, `devm_free_irq()` and the =
long
comment may be too much for a defensive corner-case fix without a
reproducer. I can drop this patch, or respin it as a smaller ordering
cleanup if you think that is useful.

Thanks,
Fan

> On Jul 6, 2026, at 22:22, Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
>=20
> Hi,
>=20
> Le samedi 04 juillet 2026 =C3=A0 02:28 +0000, Fan Wu a =C3=A9crit :
>> rga_probe() requests the interrupt with devm_request_irq(), so devres
>> does not release the IRQ until after rga_remove() returns. =
rga_remove()
>> currently releases rga->m2m_dev before that point.
>>=20
>> rga_isr() uses rga->m2m_dev through v4l2_m2m_job_finish(),
>> leaving a window where an interrupt can run after the m2m device has =
been
>> released.
>=20
> I have a doubt that this can really happen for this type of hardware. =
Its not a
> free-running HW that emits IRQ randomly, plus we have the abort =
sequence that
> ensure all jobs are completed before we pull it down.
>=20
>>=20
>> Unregister the video device first to stop new userspace submissions, =
then
>> free the devm-managed IRQ explicitly before releasing the m2m device. =
Move
>> the command buffer release after the IRQ teardown as well, so it is =
not
>> released while a completion interrupt can still arrive.
>>=20
>> Store the IRQ number in struct rockchip_rga so rga_remove() can free =
the
>> IRQ without looking it up again.
>>=20
>> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
>>=20
>> ---
>> diff --git a/drivers/media/platform/rockchip/rga/rga.c =
b/drivers/media/platform/rockchip/rga/rga.c
>> index 43f6a8d..118887a 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.c
>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>> @@ -828,6 +828,8 @@ static int rga_probe(struct platform_device =
*pdev)
>>   goto err_put_clk;
>>   }
>> =20
>> + rga->irq =3D irq;
>> +
>>   ret =3D devm_request_irq(rga->dev, irq, rga_isr, 0,
>>          dev_name(rga->dev), rga);
>>   if (ret < 0) {
>> @@ -919,13 +921,21 @@ static void rga_remove(struct platform_device =
*pdev)
>>  {
>>   struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
>> =20
>> - dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
>> -        rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>> -
>>   v4l2_info(&rga->v4l2_dev, "Removing\n");
>> =20
>> - v4l2_m2m_release(rga->m2m_dev);
>>   video_unregister_device(rga->vfd);
>> +
>> + /*
>> + * The IRQ was requested with devm_request_irq() and is freed by =
devm
>> + * only after this function returns. Free it explicitly here, after =
the
>> + * video device is unregistered, but before v4l2_m2m_release() frees
>> + * rga->m2m_dev, which rga_isr() dereferences via =
v4l2_m2m_job_finish().
>> + */
>> + devm_free_irq(rga->dev, rga->irq, rga);
>=20
> I'm not saying we cannot do that, but its quite verbose for something =
that
> probably can't happen in practice.
>=20
> Nicolas
>=20
>> +
>> + dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
>> +        rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>> + v4l2_m2m_release(rga->m2m_dev);
>>   v4l2_device_unregister(&rga->v4l2_dev);
>> =20
>>   pm_runtime_disable(rga->dev);
>> diff --git a/drivers/media/platform/rockchip/rga/rga.h =
b/drivers/media/platform/rockchip/rga/rga.h
>> index 72a28b1..f76c45b 100644
>> --- a/drivers/media/platform/rockchip/rga/rga.h
>> +++ b/drivers/media/platform/rockchip/rga/rga.h
>> @@ -81,6 +81,7 @@ struct rockchip_rga {
>>   struct device *dev;
>>   struct regmap *grf;
>>   void __iomem *regs;
>> + int irq;
>>   struct clk *sclk;
>>   struct clk *aclk;
>>   struct clk *hclk;
>>=20


