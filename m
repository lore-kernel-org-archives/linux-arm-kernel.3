Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01D9C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 00:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Y8RC683iT2VsDtkgaelNCnjCMRoziScledaiw/g3Oc=; b=bLTLWcHJpO1MGGyqDiBHk8McIo
	3gXGmSiN0I8rlVH+1szyjSK4tpQQMeq+H5d81expXv7GhbRxKA1bhZuHXkaD4qmi3rVpt1JAltr1p
	dZpG7wsP1sQbP3Anf+GGd95Se+lKtOPvze0jPKOq4aXcITdGVtmKsdjM7kEA35OXB9U+iH5ZWhlwy
	7+ZXEiv3sp1cwnQ20uhnAn7xsOL856uCgP4vgsgHEm3uzeTCEv4idJlkV4BtnS75z2rloSApqdBGK
	93ImsdNdhmONa5X0xmXtasDRiL/OUsRwfLfk5hY6ih2lsoQdEF8L/NMR3u9hklz2PwvTSz8BSbfAM
	s2nd0HJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgtuS-0000000DqEg-3unz;
	Tue, 07 Jul 2026 00:43:36 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgtuO-0000000DqE4-0ftr;
	Tue, 07 Jul 2026 00:43:35 +0000
Received: from zju.edu.cn (unknown [10.97.40.56])
	by mtasvr (Coremail) with SMTP id _____wB3QIysS0xq0CwVAA--.45077S3;
	Tue, 07 Jul 2026 08:43:25 +0800 (CST)
Received: from smtpclient.apple (unknown [10.97.40.56])
	by mail-app4 (Coremail) with SMTP id zi_KCgDnGDCsS0xqMYUgAg--.55541S2;
	Tue, 07 Jul 2026 08:43:24 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH] media: rockchip: rga: quiesce IRQ before releasing m2m
 state
From: Fan Wu <12321260@zju.edu.cn>
In-Reply-To: <06f42aae24e2e441b04549bf5be2825cf1f8e2df.camel@ndufresne.ca>
Date: Tue, 7 Jul 2026 08:43:13 +0800
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
Message-Id: <B5F15436-EDEA-46F7-8A7E-9D19E4971521@zju.edu.cn>
References: <20260704022853.77291-1-fanwu01@zju.edu.cn>
 <ba54b43f90b46960ce4e57f99ead11e4200d283d.camel@ndufresne.ca>
 <CB4C9604-8CCF-4A2E-B8B0-FC49AAFEA514@zju.edu.cn>
 <06f42aae24e2e441b04549bf5be2825cf1f8e2df.camel@ndufresne.ca>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-Mailer: Apple Mail (2.3774.600.62)
X-CM-TRANSID: zi_KCgDnGDCsS0xqMYUgAg--.55541S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?uzakngXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnXz+g1OQfMo27QHy5TwQyZzNfPJr2n5FahIHCyRu/DI8+2372QRG5qO3x55iWePRzTjB
	IcBX4L4dk4ma73EMVz6p9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoW3Aw1UWF18tFWxWr1Uur1Dtwc_yoWxurykpF
	W5Jay2kr4DJr18Ar9Fqa17uF9Yyw1SvFy5Wr1fK347A390qFnrtryjyFyY9F93ur18Cayj
	vr4UJ3s3uF4YvFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57
	IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE
	14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
	IYc2Ij64vIr41lF7xvr2IYc2Ij64vIr40E4x8a64kEw24lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jbo7NUUUUU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_174332_473580_FC6875E5 
X-CRM114-Status: GOOD (  34.40  )
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

Thanks for the explanation.

I agree this is better treated as defensive hardening rather than a
demonstrated teardown bug. The normal m2m release path is expected to =
wait
for a running job to finish, and the remaining case I was concerned =
about
would require unbind to race a still-running RGA job. Without a =
reproducer,
the explicit IRQ teardown and extra field look too heavy for that narrow
case.

I will drop this patch.

Thanks for the review,
Fan

> On Jul 6, 2026, at 23:57, Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
>=20
> Hi,
>=20
> Le lundi 06 juillet 2026 =C3=A0 23:27 +0800, Fan Wu a =C3=A9crit :
>> Hi Nicolas,
>>=20
>> Thanks, that is a fair point that RGA is not a free-running IRQ =
source;
>> the interrupt should only be raised for job completion.
>>=20
>> I looked again for the abort/drain path, though, and I could not find =
one
>> in the RGA teardown path. `v4l2_m2m_release()` only frees the m2m =
device.
>> RGA does not provide a `.job_abort` callback, and `rga_remove()` does =
not
>> reset the engine or disable the IRQ before releasing the m2m state. =
The
>> driver also leaves the devm-managed IRQ installed until devres =
cleanup
>> after remove returns.
>>=20
>> So unless I am missing another path, teardown does not actively abort =
an
>> in-flight RGA job; it relies on there being no in-flight job by the =
time
>> remove gets there. In the normal case that is probably true, since =
the
>> hardware is not free-running and the submitted job has normally =
completed
>> already. The case I was trying to cover is the narrower one where
>> unbind/remove races with a still-running job.
>=20
> I've never looked very deep into that, and so this report isn't a bad =
thing at
> all. With the m2m frame work, we have m2m_dev (which is in fact the =
scheduler)
> and m2m_ctx, which are the instanced. The second are found to =
open/release, the
> first is probe/remove.
>=20
> I don't know by which mechanism, so I'll try and learn that, but we =
expect
> platform remove() to only be called once all the file ops release() =
have been
> called. If that is broken, we should certainly do something about it.
>=20
> Now, about not having RGA specific code to abort, this is fine. What =
the m2m
> framework do, in the default ctx_release() impelemtation is to call
> v4l2_m2m_cancel_job(). That function optionally call job_abort(), for =
drivers
> that requires it, but otherwise, it will just wait for running jobs to =
finish.
> Since most m2m, specially the simple case like RGA finishes quickly, =
the delay
> isn't a problem. After this, no more jobs will be scheduled, and no =
more IRQ are
> expected. Meaning protection against late IRQ is defensive. We've seen =
some HW
> bugs with other drivers, so its not generally wrong to do so.
>=20
>>=20
>> That said, I agree the explicit irq field, `devm_free_irq()` and the =
long
>> comment may be too much for a defensive corner-case fix without a
>> reproducer. I can drop this patch, or respin it as a smaller ordering
>> cleanup if you think that is useful.
>=20
> What I meant is that a hardening patch based on quite hypothetical =
case should
> come with matching wording. Reading your submission, it felt nearly =
critical
> (and it could have been for sure). Let's investigate the remaining =
bits above.
> Then you can either reword or drop.
>=20
> Nicolas
>=20
>>=20
>> Thanks,
>> Fan
>>=20
>>> On Jul 6, 2026, at 22:22, Nicolas Dufresne <nicolas@ndufresne.ca> =
wrote:
>>>=20
>>> Hi,
>>>=20
>>> Le samedi 04 juillet 2026 =C3=A0 02:28 +0000, Fan Wu a =C3=A9crit :
>>>> rga_probe() requests the interrupt with devm_request_irq(), so =
devres
>>>> does not release the IRQ until after rga_remove() returns. =
rga_remove()
>>>> currently releases rga->m2m_dev before that point.
>>>>=20
>>>> rga_isr() uses rga->m2m_dev through v4l2_m2m_job_finish(),
>>>> leaving a window where an interrupt can run after the m2m device =
has been
>>>> released.
>>>=20
>>> I have a doubt that this can really happen for this type of =
hardware. Its
>>> not a
>>> free-running HW that emits IRQ randomly, plus we have the abort =
sequence
>>> that
>>> ensure all jobs are completed before we pull it down.
>>>=20
>>>>=20
>>>> Unregister the video device first to stop new userspace =
submissions, then
>>>> free the devm-managed IRQ explicitly before releasing the m2m =
device. Move
>>>> the command buffer release after the IRQ teardown as well, so it is =
not
>>>> released while a completion interrupt can still arrive.
>>>>=20
>>>> Store the IRQ number in struct rockchip_rga so rga_remove() can =
free the
>>>> IRQ without looking it up again.
>>>>=20
>>>> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
>>>>=20
>>>> ---
>>>> diff --git a/drivers/media/platform/rockchip/rga/rga.c
>>>> b/drivers/media/platform/rockchip/rga/rga.c
>>>> index 43f6a8d..118887a 100644
>>>> --- a/drivers/media/platform/rockchip/rga/rga.c
>>>> +++ b/drivers/media/platform/rockchip/rga/rga.c
>>>> @@ -828,6 +828,8 @@ static int rga_probe(struct platform_device =
*pdev)
>>>>   goto err_put_clk;
>>>>   }
>>>> =20
>>>> + rga->irq =3D irq;
>>>> +
>>>>   ret =3D devm_request_irq(rga->dev, irq, rga_isr, 0,
>>>>          dev_name(rga->dev), rga);
>>>>   if (ret < 0) {
>>>> @@ -919,13 +921,21 @@ static void rga_remove(struct platform_device =
*pdev)
>>>>  {
>>>>   struct rockchip_rga *rga =3D platform_get_drvdata(pdev);
>>>> =20
>>>> - dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
>>>> -        rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>>>> -
>>>>   v4l2_info(&rga->v4l2_dev, "Removing\n");
>>>> =20
>>>> - v4l2_m2m_release(rga->m2m_dev);
>>>>   video_unregister_device(rga->vfd);
>>>> +
>>>> + /*
>>>> + * The IRQ was requested with devm_request_irq() and is freed by =
devm
>>>> + * only after this function returns. Free it explicitly here, =
after the
>>>> + * video device is unregistered, but before v4l2_m2m_release() =
frees
>>>> + * rga->m2m_dev, which rga_isr() dereferences via =
v4l2_m2m_job_finish().
>>>> + */
>>>> + devm_free_irq(rga->dev, rga->irq, rga);
>>>=20
>>> I'm not saying we cannot do that, but its quite verbose for =
something that
>>> probably can't happen in practice.
>>>=20
>>> Nicolas
>>>=20
>>>> +
>>>> + dma_free_attrs(rga->dev, RGA_CMDBUF_SIZE, rga->cmdbuf_virt,
>>>> +        rga->cmdbuf_phy, DMA_ATTR_WRITE_COMBINE);
>>>> + v4l2_m2m_release(rga->m2m_dev);
>>>>   v4l2_device_unregister(&rga->v4l2_dev);
>>>> =20
>>>>   pm_runtime_disable(rga->dev);
>>>> diff --git a/drivers/media/platform/rockchip/rga/rga.h
>>>> b/drivers/media/platform/rockchip/rga/rga.h
>>>> index 72a28b1..f76c45b 100644
>>>> --- a/drivers/media/platform/rockchip/rga/rga.h
>>>> +++ b/drivers/media/platform/rockchip/rga/rga.h
>>>> @@ -81,6 +81,7 @@ struct rockchip_rga {
>>>>   struct device *dev;
>>>>   struct regmap *grf;
>>>>   void __iomem *regs;
>>>> + int irq;
>>>>   struct clk *sclk;
>>>>   struct clk *aclk;
>>>>   struct clk *hclk;
>>>>=20


