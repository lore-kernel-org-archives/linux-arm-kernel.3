Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F73FC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7v68eUbMhdBb1FN26U9K+vJv5tGLAeNVJMhgqgmwlM=; b=xSFLZsXLuADrld1/HPkRubdL1j
	5/NqzwEMwpGRP/96ZuE5qePKBK9cPT/ZLeGwgEYk1QQmaeWJeeAXaeOYj+1OhSwaekP1iVNbvjQ6t
	nhu1RP5uMmfHbWWVUiPbnlhhQz9vzzjLm0QLZxpg16t8JUBxzuX/vXxERESdyuZRk1BMhIPOCTJhK
	vy6Zo0tKGH2WxOLo+oFsE0KrZVUSM507FUDrY1tttOPEEz5p1JV/FeO0bzmdgFyx2rKaj6wGUSN38
	fxPL3MZiI+aS7Ukw7VR9T/PeHUB46y3htCNd4VfsFjhrOXS0CbiY54846w1Hc85UZa7F3s9qRZVZ8
	yIKwfb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNz-00000002SsP-30gV;
	Thu, 28 Aug 2025 17:26:07 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcG4-00000001esu-08fx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:01:41 +0000
Message-ID: <e177027d-9286-4a30-9656-e0395094b2c1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756386087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7v68eUbMhdBb1FN26U9K+vJv5tGLAeNVJMhgqgmwlM=;
	b=ra8FPJf02ezT/Z6Od+0hGN4l4CJBp5cRRQwc7kivX348XlYc76qHJiTCY2Zbr6BzuhziWV
	vtp6ovLknz+EW3nWC8g/Y5koIGMS61GWL+j18xx61d5DIBaIiGVrOdIF2zednYc5wZw2gS
	Hu5qlNzC2MneYgUfwtN/+OFL0BuZwcQ=
Date: Thu, 28 Aug 2025 14:01:23 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] net: ethernet: ti: Prevent divide-by-zero in
 cpts_calc_mult_shift()
To: =?UTF-8?B?5p6X5aaZ5YCp?= <linmq006@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Grygorii Strashko <grygorii.strashko@ti.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250828092224.46761-1-linmq006@gmail.com>
 <11d46e56-b8d9-4776-9969-d3767d8cda41@linux.dev>
 <CAH-r-ZH+0rsji1f9eEaVDtG3XcMCD_EnAHAMwr8DuqO4D4Ps=w@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <CAH-r-ZH+0rsji1f9eEaVDtG3XcMCD_EnAHAMwr8DuqO4D4Ps=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_060140_204469_064D68CC 
X-CRM114-Status: GOOD (  11.43  )
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

On 28/08/2025 13:38, æå¦å© wrote:
> Hi, Vadim
> 
> Vadim Fedorenko <vadim.fedorenko@linux.dev> 于2025年8月28日周四 20:06写道：
>>
>> On 28/08/2025 10:22, Miaoqian Lin wrote:
>>> cpts_calc_mult_shift() has a potential divide-by-zero in this line:
>>>
>>>           do_div(maxsec, freq);
>>>
>>> due to the fact that clk_get_rate() can return zero in certain error
>>> conditions.
>>
>> Have you seen this happening in the real environment, or is it just
>> analysis of the code? I don't see a reason for these "certain error
>> conditions" to happen...
> 
> This is from code analysis, not from real environment.
> The !CONFIG_HAVE_CLK version of clk_get_rate() returns zero.
> With CONFIG_COMPILE_TEST && !CONFIG_HAVE_CLK could have the problem.
> This may be theoretical.

!CONFIG_HAVE_CLK will have cpts_create() doing nothing as defined in
cpts.h and it means the patch fixes impossible scenario.

NAck


