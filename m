Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81868C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22m5iAqIpbmJxJVnpa24mBjkDMjZX1GabmsvOm2Bnq0=; b=e/H283TNRGcEzWgfzEnyRAUdoV
	w3us4Gl2NEi3jiW28ub+U0VMYCXVCvpRXbvTu9skFReKVHYIQXT/eKQjgTGwOYgMsV5E8n/idDwUR
	3AQ282/q4+akGtVtSNREt5negb9qnOJgWVYoQGJ39GPTlNnRRHUvmFYiP+xVB14x0YVzfVz+/UdmY
	twZq2oi62zNkTJUe1hHZ3j/Tlk+WNGrNLIUF75HVGwZn1CrBjB2AByiSRUUkyDXk96DDIP3TPQpN3
	lJ5bYhH5TfvgsSFyJwD+ZGVQsBDHKEw0zoeJ3kCzkPyeh9exWswc97AhtFvggSPC5FBv+Y4ISnZaJ
	kbBXTm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67Cc-00000003tfF-3BGR;
	Mon, 14 Sep 2026 13:58:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x67CZ-00000003tec-2gO0;
	Mon, 14 Sep 2026 13:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789394309;
	bh=5PRno6bDN7rPaMhefe1EXNUdAJWaB7rxNicPHWb0KnI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=II0/Ohlbjh/tfLR/rkI11YDxsqnSLpLp+L9XW6BiNCOzRWEC3mRcQEVoLdXNtXCcA
	 JTYgYVwNw031zm8hW0Bfk8I59I6BPT/8j86ie4Mgo4jzi7DcK6m3NejaDjdZ6MMM1p
	 XzWmDJDt/qAdomZoyDki5Kldwq9LGkpcGdj5Ao5iCVE7yn8vJYi66/1AHibngIeZUh
	 QA64XxXu3Pl4ZP6Wxy5Ul3VP8gpUxzwcfcMZpb0duA2dxuvw+FlmG5s1V4cPcSdf5d
	 CCVKZdP5gTiY7bPzYpgRrKvLCHk+y6B+Dw79gkN0R15OU/pD37PGw7hcNhzxYS8B7Z
	 ZKdnLoN1eCrkw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E739917E0700;
	Mon, 14 Sep 2026 15:58:28 +0200 (CEST)
Message-ID: <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com>
Date: Mon, 14 Sep 2026 15:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable
 errors
To: Mark Brown <broonie@kernel.org>
Cc: phucduc.bui@gmail.com, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com>
 <aqf7B_E7_Gv5iK2A@sirena.co.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aqf7B_E7_Gv5iK2A@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_065831_828868_989702A8 
X-CRM114-Status: GOOD (  11.70  )
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

On 9/14/26 15:47, Mark Brown wrote:
> On Mon, Sep 14, 2026 at 03:22:21PM +0200, AngeloGioacchino Del Regno wrote:
>> On 9/14/26 09:28, phucduc.bui@gmail.com wrote:
> 
>>> +	ret = regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
>>
>> Well, this is a bit of defensive programming here.
>>
>> The regmap pointer is already checked by the previous function call, and this is
>> a regmap over MMIO... and MMIO writes can't fail.
> 
> Oh, you sweet summer child :) .

lmao

>  Though practically speaking the error
> handling ends up being the same as if they couldn't fail since if
> something goes wrong it's generally catastrophic stuff like locking the
> core up completely so the end result is the same.

That was also an implicit point (that should've been explicit from me): if anything
goes horribly wrong here, it means that it already went horribly wrong "some
function calls ago", and the platform likely already locked up as you suggested.

In any case, I'm not against doing error checking, it's just about not doing it
when it's really useless (I'm sure you understand my reasons), and I believe this
specific case is one of those.

That said, should you prefer having error checks in such places... it's not a
performance path, so I don't really have strong opinions really.

Cheers!
Angelo

