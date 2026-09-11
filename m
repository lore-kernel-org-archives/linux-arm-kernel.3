Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D21C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uQF0MuyNToaBt9DpafQJxRAVFURVBijgxEMUA/ciAc=; b=BnQJIVSzJ1qknEP8YDNKOHCp3Q
	xLLeUJ2/aEUIkH8qxq5GIXGNAC9e6ZL2NWO1nf6NJWHBC/kr4W/DaOjgJfNXMjAox8Hu8ciyJ/pml
	K0uOPjT+vPwf5X/WgjtGfzBrrU1Quxn0SspqCCQYwzrVdvBHsfB4EaYf6EiKTEqtzo8T7NBOMAZGb
	L01TFnacQvX6RdLbeBi85/r9vpycnga0bpakr1A75n2P7borVG75LwNjeCE8pxEG1jT8Y3VobZQ+D
	1C5l0K4iFHRhhBt8vsfhQbNEZVQYF/huXPBB0NWF2YZ4ABKspnFX9TiVvVDDqUiur+3jUYbAQlZcT
	zePDLilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4voF-0000000G2YL-19Jg;
	Fri, 11 Sep 2026 07:36:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4voC-0000000G2Xj-3XWA;
	Fri, 11 Sep 2026 07:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789112186;
	bh=fsWO5RfUtrwYBghqZbddt7joHj5CDeK4xYY0+hFA124=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qkaji6DEBChYB6Y1WQhTLVJgKyo3Ywqi8KCx2nY3VQm2QuhK6l0yLy/DVuZeBbHf7
	 Qkg9/u23+zPY1aMuhsNdEnkZ/84v/EInCLzKV/hnd9Ga1Og8FQ9WLKpR86/Dbghy1v
	 OKo+pptyBeZ7pFKyQYQydwrnBZlKxoM8U6Kk1wx33TeXEIo9K8XLNIIWyGgOn951Q5
	 HB1s6+cEDdbFopVBRAxAEeJo61OYb3IUwWtM+gqVapJkHRCFfx6h+M3UwP4B9o965U
	 AwOaXyKI/9gJOD0VBpfQiGL0H8BLP1L5VGAXqJ4k2K44w5jxUunabAzBmcaJieRDLE
	 iBfpIEDY2850w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 77FA917E0260;
	Fri, 11 Sep 2026 09:36:25 +0200 (CEST)
Message-ID: <8fc8791a-911b-4c17-b291-5bdd468335ce@collabora.com>
Date: Fri, 11 Sep 2026 09:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit
 ratio setting
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: chunfeng.yun@mediatek.com, p.zabel@pengutronix.de,
 chunkuang.hu@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
 matthias.bgg@gmail.com, granquet@baylibre.com, justin.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260701121936.19407-1-angelogioacchino.delregno@collabora.com>
 <20260701121936.19407-3-angelogioacchino.delregno@collabora.com>
 <5bmxa4pcwkiemubwfjun3dti4szu66gnxe6yw2pudq3wplpc23@inyswc2bdlhw>
 <cb72ff50-b62f-47fe-af40-d38558bdff6e@collabora.com>
 <pptwnkay4jvyom2ihwtice7usgndsw2fnffkbenkg7gyjejure@4y2znrvtmbtg>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <pptwnkay4jvyom2ihwtice7usgndsw2fnffkbenkg7gyjejure@4y2znrvtmbtg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_003629_046619_752B24A6 
X-CRM114-Status: GOOD (  11.83  )
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

On 9/11/26 07:11, Manivannan Sadhasivam wrote:
> On Thu, Sep 10, 2026 at 10:39:06AM +0200, AngeloGioacchino Del Regno wrote:
>> On 9/9/26 17:06, Manivannan Sadhasivam wrote:
>>> On Wed, Jul 01, 2026 at 02:19:36PM +0200, AngeloGioacchino Del Regno wrote:
>>>> The comment in the mtk_phy_tmds_clk_ratio() function clearly and
>>>> correctly explains that the TMDS ratio has to be 1/10 for data
>>>> rates under 3.4Gbps, and 1/40 over that.
>>>>
>>>> Unfortunately though, the TXC_DIV register setting was wrong, as
>>>> in value 3 means to divide by 8 and, in order to achieve the in
>>>> spec 1/40 (tmds) data rate, this has to divide by 4 instead!
>>>> In order to achieve the correct 1/40 (tmds) data rate, this has
>>>
>>> This statement is cut-off!
>>>
>>
>> Oh oops. It's just a forgotten line that has to be removed....
>>
>> Should I resend or can you simply remove the line
>> "In order to achieve the correct 1/40 (tmds) data rate, this has"
>> while applying?
>>
> 
> I do not apply the patches, only Vinod does. It would help if you can just
> send a next version with this change and tags.
> 
> - Mani
> 

Sure, will send v2 in a jiffy.

Cheers,
Angelo

