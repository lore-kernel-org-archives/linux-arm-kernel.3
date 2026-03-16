Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF13F53D70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/7u46HVFreO77BQISwzQt6pB5dfQEcsd1olzNEfcTI=; b=lAvGLVLDfg9VoZe3s4nOiYSu+U
	1LzG53jB5/oqNc7NYqjI9HGFG+KoWZAV3idvDtXsAWjQCDudCw4/NN/1ScHrD8KgI07+s6CXe71ng
	JImRILhV2zbYhvtQJay63bKqxvN2FcQ92Ze3RoOITk4yUqIQkhm/d3mOjiZDYRQFc7i3/4yiOp90s
	uYCG7njlRy+npiBw+m9ZXg8swjhcT1/PeY8v9/KLj1YPixGdTBA/M9nMdrYS0jKtQKyIj79cEs9NN
	wRFDORRKLuXeoGgVNXzzQGTKV29FcEG4uN3jGXxiKPTV+seNX27sqStPf7/qAX1VNIfcPdlRLKLqx
	IHw2lbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AqY-00000004SRq-37Xi;
	Mon, 16 Mar 2026 16:31:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AqW-00000004SRM-1RMS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:31:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C2CC744252;
	Mon, 16 Mar 2026 16:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5D3C19421;
	Mon, 16 Mar 2026 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773678671;
	bh=ogWJS6+fbkJKhwd2cn3COve3OtrIPc4ti934RTsFUDU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tzN25Hksy4MeH/oXFwsK7O4YaNxhpcrzCXC+b23Gsro3l336xpZp8qt1VXMDJVxcW
	 EEYgvZNIyezaFWmF2DRaS6DBNCtMCewOBTo38imkrQWoB7f4i4yZvI1sEZu1fdLuA0
	 QcCkui8dgqAyPS/2H9GWahAaeJKnXMh3qScXZ2d0hz5yOgkWRxAfskYr+hmpjqNQtC
	 fEIAwFasnDA46BtbiIpIWPMUgWOOsp5m1+NK2Jza+6ItFdI5vSBRpXaKjWn6wg+1rp
	 C0ROyAPJqV2dNEN1dKuqXo2VjuuudHirK808KxON1ohIbdIvxu3pOY0vy915ozzEMz
	 cLbuzcPuLtmqQ==
Message-ID: <e1cf4c86-f777-4b2f-8dd0-e47554006660@kernel.org>
Date: Mon, 16 Mar 2026 17:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Francesco Dolcini <francesco@dolcini.it>, ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, benjamin.gaignard@collabora.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 sebastian.fricke@collabora.com, shawnguo@kernel.org, ulf.hansson@linaro.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 m.felsch@pengutronix.de, fra.schnyder@gmail.com, linux-imx@nxp.com,
 l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com,
 eagle.zhou@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
 <20260312173349.GA137045@francesco-nb>
 <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e559b822c5f4fc9167d40544172c6c450d88636a.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_093112_524749_8032F248 
X-CRM114-Status: GOOD (  14.62  )
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

On 16/03/2026 16:25, Nicolas Dufresne wrote:
> Le jeudi 12 mars 2026 à 18:34 +0100, Francesco Dolcini a écrit :
>> Hello,
>>
>> On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com wrote:
>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>
>>> Fix a kernel panic when probing the driver as a module:
>>>
>>>   Unable to handle kernel paging request at virtual address
>>>   ffffd9c18eb05000
>>>   of_find_matching_node_and_match+0x5c/0x1a0
>>>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
>>>
>>> The imx8mq_vpu_shared_resources array is referenced by variant
>>> structures through their shared_devices field. When built as a
>>> module, __initconst causes this data to be freed after module
>>> init, but it's later accessed during probe, causing a page fault.
>>>
>>> The imx8mq_vpu_shared_resources is referenced from non-init code,
>>> so keeping __initconst or __initconst_or_module here is wrong.
>>>
>>> Drop the __initconst annotation and let it live in the normal .rodata
>>> section.
>>>
>>> A bug of __initconst called from regular non-init probe code
>>> leading to bugs during probe deferrals or during unbind-bind cycles.
>>>
>>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
>>> Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
>>> Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
>>> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
>>> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
>>> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>
>> What's the plan to merge this? It fixes a quite severe regression,
>> a boot failure.
> 
> To be decided this week. The commit message does not say if it was released, or
> came in RCs (and I didn't check myself yet). I'd say, if its the first one, it
> will go through next and backports, otherwise its is really tight to get that
> into the RC series, but serious enough. Please fill the gap if you have time,
> and I'll handle it later, probably tomorrow.

As Francesco pointed and earlier Franz, this affects current users so
please consider bigger impact of the issue and applying as soon as you
have time (I know you have many patches).

To help:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

