Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C21D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 18:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA9FTV2ejX5xguOwyiDUL1hpvKOTwyB0xhI2crLeIWM=; b=cA5Y74jsG0zUa8Oyv0mewPeGqN
	T2QHmVU1JA+N1aErs7ejnm2WxFWshokDUYOqgqFlp0ujs/N4BeWu0ZKSCeskSlsnqIQXPU/8F+E00
	2iRHWLtHLj0el6dHzENRYbeITHOVT8zqGPn28OyMBnlL7yllqTajSFIa1EJAJ0sHlRYKdUniH5dS4
	n0jTwAlc5iO/+GVJh1r1rPNylcJQN+ubOKj50jqtMmZTi1sY31KJJOVzi1lBjnyw11Tx87GVgSJA8
	gmwXtpbCR6m0QAg2avLzCQPvdVUeXudHe6K3DCf3cGyuXOwIZusOQR4/S2DBOmsVkmxCStn+FlBXm
	l1YP0JRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgYf-0000000H42w-3iOO;
	Thu, 27 Nov 2025 18:17:33 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOgYc-0000000H42F-2xML;
	Thu, 27 Nov 2025 18:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764267379; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VHNPgFqZa0o6809/T+8jHJoMCBYjd2yZiYvEH43ecdDw0RDEoZBASvS8GXIRjf443u9HWsC87weywb65C5DIBcudiiLSfw66tyl4FaLNKaejlEIJIohOY954WwUx+6cfKsQdPDjAUxOAHUCJW2JVa5BuwC53SzyModibprg79Xg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764267379; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GA9FTV2ejX5xguOwyiDUL1hpvKOTwyB0xhI2crLeIWM=; 
	b=VzgCDjp9rcRegJe18G1VoZpp248pQnSYb2nnPRvNYWxHUdyyrlHItaUgv2yGSNf+L6cT0ioGjEOUEpK+K0iTAkjcNQ9RhPc7ICm06mhWm7aOWDC7aTqGKcy/QGw9e2DvPfDfeB5pm0C9OwDjdwtPltUGw2ChGO1r7cznhhdiZRQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764267379;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=GA9FTV2ejX5xguOwyiDUL1hpvKOTwyB0xhI2crLeIWM=;
	b=MrrmR/EbOR0f5Gb5Xbhy3YhzRySSoWvRdfWRmCgcQVrMezcKplDmR9LS92M5F8YU
	44hmR7lvwMtOD/5nw3ELxQb8PadU5cfnfMx7ngMJ02a3mou1wD1bDW4FltRjo9ZXijV
	BVrAa/6yr4xsF2CvbF/50U6ILU5JghWfinyStD5c=
Received: by mx.zohomail.com with SMTPS id 1764267377521567.410213066609;
	Thu, 27 Nov 2025 10:16:17 -0800 (PST)
Message-ID: <2dd059f5-96d4-44a1-84be-b14dce28cf06@collabora.com>
Date: Thu, 27 Nov 2025 15:15:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] dt-bindings: net: Convert Marvell 8897/8997
 bindings to DT schema
To: Rob Herring <robh@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-4-ariel.dalessandro@collabora.com>
 <20250912140619.GA1293647-robh@kernel.org>
 <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
 <CAL_Jsq+eeiw9oaqQPWt2=rZSX98Pak_oB=tfQFvEehwLZ=S52g@mail.gmail.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <CAL_Jsq+eeiw9oaqQPWt2=rZSX98Pak_oB=tfQFvEehwLZ=S52g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_101730_831641_1B8174AC 
X-CRM114-Status: GOOD (  10.36  )
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

Hi Rob,

On 11/24/25 3:54 PM, Rob Herring wrote:
> On Wed, Oct 1, 2025 at 12:28 PM Ariel D'Alessandro
> <ariel.dalessandro@collabora.com> wrote:
>>
>> Rob,
>>
>> On 9/12/25 11:06 AM, Rob Herring wrote:
>>> On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
>>>> Convert the existing text-based DT bindings for Marvell 8897/8997
>>>> (sd8897/sd8997) bluetooth devices controller to a DT schema.
>>>>
>>>> While here:
>>>>
>>>> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
>>>>     schema definition as these are currently documented in file [0].
>>>> * DT binding users are updated to use bluetooth generic name
>>>>     recommendation.
>>>>
>>>> [0] Documentation/devicetree/bindings/net/btusb.txt
>>>>
>>>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>>> ---
>>>>    .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 ++++++++++++++++++
>>>>    .../devicetree/bindings/net/btusb.txt         |  2 +-
>>>>    .../bindings/net/marvell-bt-8xxx.txt          | 83 -------------------
>>>
>>>>    .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
>>>>    .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
>>>>    arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-
>>>
>>> .dts files should be separate patches. Please send the bindings patches
>>> separately per subsystem so subsystem maintainers can apply them. All
>>> the Mediatek dts changes can be 1 series.
>>
>> Ack, will fix in v3.
> 
> Are you going to send v3 still?

Yes, will be sending out v3 asap, with the remaining changes.
Sorry for the delay.

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


