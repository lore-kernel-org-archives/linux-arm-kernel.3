Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD12CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 17:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7mrSbEy/aAXg+6oqjnfTR08iGllMdtI2IpFi/J5V5E=; b=SJD/KuXTPRxSnZQz4y+1kU3ghn
	9zgKuPmRq3nQMzdPRTuavVP7S/xORkcsmwu4B9k9+zAwQjTtb4U7XnWDQJe0GkNX/z14m+rM54R7z
	UVq3McKQhDiM9j4kjUKIVX5g9o+Clj+ZMpef9ahZY7XHajcT0SdNxTZei2ceFUxKG1uJimnTCQgbs
	cGInbO0lcz7VC217Cf2J+JWPky3GVkaBgjwjhP8lXmTrKQyPdOHGLmcEqY4+FaoBewjgFKjw4z7OG
	1kcbuO2BxIkwkDI/WZuhl9gpPyZPH301UCdCGoyr8CZBJk1WkLudQw1r7JftV+oAmLNG19Ar8k+a/
	2en6Cr8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40cm-00000008e3N-42z1;
	Wed, 01 Oct 2025 17:28:20 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v40ck-00000008e2k-46R4;
	Wed, 01 Oct 2025 17:28:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759339654; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Dkp23wMelI93bQRBVAh4qzEHuDMvqEOtoSvdXxl/dCc2RST94/dd+ECyBhd7rmZZQBzInVt+3r87Nj+j2eogPBFO2zcRxZ0oASTeprZ/CtDxaGmjUQ1L7s204PulOqJ9IJfFtaEbWhx3lCZXLWsDSdVR0hFA5M4aIpuXvg8cM00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759339654; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T7mrSbEy/aAXg+6oqjnfTR08iGllMdtI2IpFi/J5V5E=; 
	b=D7FJuPtuW1gADbBSn6bbvkh0fP0Zx2wrTVz4MOQ332+7LEBrZ8QCh/J/fugV2uyGQ4+m55Hwc6Z+y2kXOiRJ350oRS1UihIhN+3Z/Sg2OiYMo7uILAXC8M9V0RmzpaSeHySMjHgJJT7p2y0VN4UJ6uPYj6qHSYRNS58idfhy6zA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759339654;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=T7mrSbEy/aAXg+6oqjnfTR08iGllMdtI2IpFi/J5V5E=;
	b=ayZLW0XUN4u7dJENrthFwUqHzKCDhi5MZ/2z3kwIntkS1giAhgscYr0ggvdmgqxu
	P1f5y5iKqKdyIhfIA/8gvQwUzkGiOQJ44EFtm8y5mUaEioqDTQ+FX/piTv/FbvMwjkL
	XKC7Kt6A08WtQwH6KFer0lKPTgDyK0iVLrO57yCI=
Received: by mx.zohomail.com with SMTPS id 1759339651509186.59741864627483;
	Wed, 1 Oct 2025 10:27:31 -0700 (PDT)
Message-ID: <fb20e4fe-df0a-4089-a7cf-e82bfe1f8e00@collabora.com>
Date: Wed, 1 Oct 2025 14:27:15 -0300
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
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250912140619.GA1293647-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_102819_068518_1E476DCF 
X-CRM114-Status: GOOD (  11.13  )
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

Rob,

On 9/12/25 11:06 AM, Rob Herring wrote:
> On Thu, Sep 11, 2025 at 12:09:52PM -0300, Ariel D'Alessandro wrote:
>> Convert the existing text-based DT bindings for Marvell 8897/8997
>> (sd8897/sd8997) bluetooth devices controller to a DT schema.
>>
>> While here:
>>
>> * bindings for "usb1286,204e" (USB interface) are dropped from the DT
>>    schema definition as these are currently documented in file [0].
>> * DT binding users are updated to use bluetooth generic name
>>    recommendation.
>>
>> [0] Documentation/devicetree/bindings/net/btusb.txt
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../net/bluetooth/marvell,sd8897-bt.yaml      | 79 ++++++++++++++++++
>>   .../devicetree/bindings/net/btusb.txt         |  2 +-
>>   .../bindings/net/marvell-bt-8xxx.txt          | 83 -------------------
> 
>>   .../dts/rockchip/rk3288-veyron-fievel.dts     |  2 +-
>>   .../boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
>>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  2 +-
> 
> .dts files should be separate patches. Please send the bindings patches
> separately per subsystem so subsystem maintainers can apply them. All
> the Mediatek dts changes can be 1 series.

Ack, will fix in v3.

> 
> The schema looks good.

Great, thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718


