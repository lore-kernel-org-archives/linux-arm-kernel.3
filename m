Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862D3C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHCM6K2iW1+fqMDLh9KgVtF4x5CiQjRva8x012yrIyc=; b=xV9MrTPJAmvMlNTEcc5TNAlTm1
	0rjFp6xcQYbej5jzRSYX/YItlJQKyB80y4OWOwylC2vLZAevJrzGE2vF3xEA9ViohsSFEWs0qgEFx
	nK2r34VcsHSGwP1EPV+XbRPHYph0SdG3WUWJ6b8iVISXEaetjX2NyTw/TZ65+OqYFXqSKZsRtUPrI
	Mw0ujD+s0DIZq5nEvtH0tkvF9tYaLNKCUMTvH0Or6A6wBIf6HCxDEDa8detVQQssbJqw6tJ9L0NhJ
	/B2+YfYUu8m2Tp5lAd/qYCKxMyWNN9g6ufmcBRIZEZuAMh2vMwbIR8e5m+6vvvnqD1mWjYVtxCQu8
	2f/GpXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcSf-00000002Tw3-1Qu4;
	Mon, 24 Mar 2025 07:43:05 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcJm-00000002SYz-3Kae;
	Mon, 24 Mar 2025 07:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742801632; x=1743406432; i=markus.elfring@web.de;
	bh=lHCM6K2iW1+fqMDLh9KgVtF4x5CiQjRva8x012yrIyc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MfUf2jm8rzqT28e1mSOGEbVg8GcCrSXq2DnnZIIL6CTEKFw1O8B1YYAxVR3p93wK
	 3jSrck64eNT3wIJZpj9xLbDs2WFdV+V3BrAUGpCKr7vLfVCO58+OYnJl61DhYjIlu
	 MCzZwMljjNCF7kBE2aU4SN9wyn/V0zSZKLCt9KlPP1pneusEByXOSzQiyj2WNUyJh
	 6uEf1GcbkuX99CUJheyEtV2PWaOJiviHiqgBRX5zMNJ5OUWFWi8bZkzQhHRe4OupG
	 YPDLypzmvAauiEAh14zVPbCGoRXox3OQWwzKB4Oud7aSyFh1REI2kzew/1ph/8WXL
	 gYY3wuMLFHS7Lub3Cw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mr7ac-1tKrO21bXi-00oDxV; Mon, 24
 Mar 2025 08:33:52 +0100
Message-ID: <46a53498-6c20-48fd-b090-02163baefddd@web.de>
Date: Mon, 24 Mar 2025 08:33:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: mt76: mt7996: avoid potential null deref in
 mt7996_get_et_stats()
To: Dan Carpenter <dan.carpenter@linaro.org>, Qasim Ijaz
 <qasdev00@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bo Jiao <bo.jiao@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 James Dutton <james.dutton@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jonas Gorski <jonas.gorski@gmail.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
References: <20250322141910.4461-1-qasdev00@gmail.com>
 <d1df5d97-4691-40d4-a6cc-416505f35164@web.de>
 <92d1a410788c54facedec033474046dda6a1a2cc.camel@sipsolutions.net>
 <CAAMvbhGrJ9b3Aab9+2a5zmvEgf0GZFmHLCC7Hud+egUE28voHQ@mail.gmail.com>
 <223c7280-443d-49b4-96b2-90472339dcd4@stanley.mountain>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <223c7280-443d-49b4-96b2-90472339dcd4@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hPisYZtNHtgdSzDYvkU7jZ10PJssmACwm0eKAkVLKsCDI3b7xsG
 lzCWmSJHsssVXlIH/WXbNoTQQWdL2uKRi5+cu2aBCoRq8td+NnkT20JfBooQvjsecx0XC+a
 Ml1Bx1ENSjGs/NZ8CrOU68lZCqAPXZoL5nCXm2TCFWIKoraDOy7dtISm16LVoMimIarUZ88
 wJXlpqLJg8q3B3nWr5f5A==
UI-OutboundReport: notjunk:1;M01:P0:jO20oZj/TDE=;aGj7rYdAkRcQW7DeTxELt09CwZj
 IMJ4QmMwA/3OFvwsgsx+W+vN98ShDLwI66ERueilwHOK24GN90dOcZ2A1m+MUdhx2kH9EtOb8
 GpBM4wwOWefzfn5U56aJhfP1E3DwV6ungO7Vvh74LZqMJE6bGTdHJMTx6R4zKOtsb4INcAHwM
 poYPqYUg5HK0TM6npx137BrPjtnruqBeRO2GQsLqZ8FTj724duSrnDT3//T6S7aMztQUaFx6J
 SkDU9SXpaIdDOp6/YoaNw8JrB1RpTKSxNIpLOrF5wOCnormOMXjAmMM5e+vSmJ0M02DS7F1cl
 DYw5vfl/PBhGELoXNFOrMyp5oFu1x+O5E51HA22nRsGOXftFcaEWTSzdxsVEePdyG+QTWEjAJ
 wMPXa7wmzCXtohStcMSk3uRk/QbwW/PW2X6bUniVdn8oAcFwVQ+0YFGYyzEog9tasB1pHsWtw
 TYAZFhNFHl+u+CzIFI2/ozAYEtATj/tCrR0g7XUTxT6TSqB2Vdb9TjvcE+gGayNWtdXm/yM5U
 e1cCx7Q+Y2syqylyrykPExIaqEnzrFA8Lmq+eReqbjcav6EsWZUOvdSF7kwCaBefwGBvcf22f
 ROchFCHsXAhpSK9gBgrAzVxoQl4qblOrpsOENuTWx9jcHsDvv5w2vHkvW4GdpzGRPRKiq5l8j
 KbWP+xgKx1HV8FpskDsEAb7/1foieNAjOwCLRZJ7SGcoTeaVczjWxg3cTG+YulML9AmTgHBA0
 zffaTDuiMvucBG2SAj/2LloeSBPIMg0xQtjHwTWkEqGcppQN8hOYzNXKcGpJiVszgB3wnjW+0
 wIczXjNR4Z8Paj5H+g537DdGuw8lrAGoQNfWK1ScAauE2IYtJPyO+mFtEzQkmYNnyVk/ompDb
 3PnMdlmAKZpPuzRbfCT+I+Z7ty9PEExDxvkJ6b3epvlbzLVtnYfPH+XSWwXIHGP+7HEehn4/s
 Rimek8h2ei3UvTqbuJK1crjfaXpN9urR0vFRJSANz0uTwLnUxicEX+vZ9RNl0TTikF2jzECix
 a1JaA88odXlJOG/WCeqZXv6AXYa6kwUXwQkBUnz22/J5H6+p9tqWcrhfA9WdtVDg+BCeV9niA
 /bRV8bytHFiTFBvTfULpmLU8HPC+bInE8AXFA5FI4r9FYSLQxHO+HKGSeTdSbL+h4lL78WAfc
 rIIjTih9nMGSlskR2OXtFxGnuIC6pOnrvPWespFIh47fwCDCzXv7v9Mo2aT6IA5NWAgtbL3Zg
 fWofTQ/7m+MeZu9VGM1GPm2mrWkMZnuGhTOdIcweduPdrWKQ6aR/zKIdha8QxSumnsIcXC9Ro
 lKvoiXS2En6XgEWktqn+GL5Q5O9Kfj1eZKVeHoKG3V769mQmQFGUXtJchtPR9FZL1FCyjwDS9
 L8/za+xtLeL4VD37A+P28rCywVzjlh5f7uhpm9p5HX05l1OMqNr+Hck7WhI+ww7k+NBvhXglG
 lbaKo5Cuq4xGEPQlwWhoMX2SpxUnXuT/h4kczqgy9ikO/HlEg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_003355_202142_AA5427AD 
X-CRM114-Status: UNSURE (   4.26  )
X-CRM114-Notice: Please train this message.
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

> Also the "phy" point will never be NULL so the check should be removed.
How many tools can help to determine such a software aspect with inter-procedural analyses?

Regards,
Markus

