Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C32EC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 11:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFfnpU97awFes9jgUdDKwNpgjmWlBXvjCr68+Ux49Bs=; b=2KvtftS7XcDOCnYu83OQohamX+
	G+S5y99kyQDmoySmAx12+b8oz1cawI+XXEezy6/DtfZ3vOMb//XMPWYGztQfZjIF7KNMQz8KYyyw5
	vf8GP3XkKtBuRHgr8Wzuc2jfrdibl73GyNiHPgx6ladSBXHhf5gH/ERmY0wMYPYkEee5+zks/uxJY
	RcOfs+kUhoSj8yujqSMjKwd4iAmF7ewQJWxGWpLgmfGgtJ+HFoLR2otX5UZ+89/S4Is7o+gTCWI2o
	WKFdkH6jWiok+42WTMBmx8aQJdqwOrGquDkMowUZlgBX76nWc2qJfWHZTiuHgh5c49GY07VD7e/Bb
	SNFFZMCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxJI-0000000HLqW-2St2;
	Sat, 22 Mar 2025 11:46:40 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvxHc-0000000HLh4-00Rl;
	Sat, 22 Mar 2025 11:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742643893; x=1743248693; i=markus.elfring@web.de;
	bh=mFfnpU97awFes9jgUdDKwNpgjmWlBXvjCr68+Ux49Bs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nd3PdTXR2NHOG4NLMEtbvWuTS6pf4HfFYMaXTVZHgmhomrR3xJlntI2yzZLAgspe
	 7rl03NZQH7x/eN7YxpOQYV6YKtbVXw+LmLaRb1wF1tQIkQxAOCkt+5kxZxITxLuRP
	 ytTIWG1VJ42nVQHucEmDC9Pmc+VADHmqIHwfXRW/Fq1pi3AXuaLrGWA+5mJTPtzaF
	 /G7iyv6Aajm/FrYFtQNsjbbVlAlZLLhwWig+n3XQSLHZeRJxlqEikf20LEYyHhb7R
	 LQcAbDVMOQ8Iz8cuP/jhsc0rm0gjD0Quoa0Y9yM/cEBNF6ZlI3xtn1RDQY0fACa+q
	 V7dRmWgfRbsCYHwugQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.73]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MyNwk-1sxQ6b2pjw-00zyyA; Sat, 22
 Mar 2025 12:44:53 +0100
Message-ID: <3bef0804-83ca-44e1-87da-db5b777d68cb@web.de>
Date: Sat, 22 Mar 2025 12:44:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bo Jiao <bo.jiao@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes@sipsolutions.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
References: <20250320201914.48159-1-qasdev00@gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: prevent uninit return in
 mt7996_mac_sta_add_links
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250320201914.48159-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E32HW/LuQAt+dgxIqxH4J6+FnSTIt/wYp4Z7yidI5yov1if9MIm
 R4aFvdUtaYcFB3aT2mQF4V3IxZgYhhxiRpsVvAKkfRMw1DUb0UaNNaWroo1LwiWkwN7yXER
 Hg2Clkx01/urCsqt+quQn5aFjk8YqnuplRUIOryX7XX2d4LNYm1CFOpIzXjg1nBwxmX+Jsm
 bh7bBd9fp79aMr5sDMB0w==
UI-OutboundReport: notjunk:1;M01:P0:ei96pu+qF4A=;kiDEfaqAiBKtwiRBQgBPgncthLu
 Ym1qAWuaLKjSJzbM2owQxFnQf5EkpRaPg9v93YrdGx4sDJa9rwQasu2Fxm6yd2EFzMTQHco+4
 L/gj1VVspKWJG6lbLiFkHQ3cQv+/pTRuQQXvKXIBYKf4Mbf0vBRGdPcKi9Erx868xBt5r+Y0h
 mej4vYbdk3+ExUu4BXLxpRqo6xHa+6Fr+WtD3E2V9LlU8QWiaMgfKLit0Bv/ADYVz751DCo8Z
 BSU+DNN1u30vS+JY5cC6Diq/81HhrYVy2ORYWh8RSvtE80HvR5NIUL6GtyVLPfRHGdJvZNvHt
 fYKSCVV27WVQtcnhjAmITzuNm9EgR30dwSkW+7prH5nhCli2LFr0YaO7DOgbcvuFI83tw8mye
 oRamgKeGi7Ox/P+ugi/rSdqMWV3+V5Gblw+AQR2j3nG/cwrPIJJGhHuLa/4I4a7kweBFGqX5m
 lHLQOqRwh+sTULuMfr+C/6wuFoFli+yoJcJtc/6GN/CQQcu0WlluLyo6KPNyo/HsAcdKtRpH2
 S6kr0SBHI7YjHv5fNtLEAf12onKpbVU7Upac7msxu8TLGqfo49VPPP5iO/MhAcafN6MyssmP8
 7Vj1/VTnygipmzUalsD4eU3yONPq5YliRTfErIv7UYATA5bZiOOxW+6LIGvP++PCJ5me6IIPS
 FSCMu1TOeQtekJuRb4P40sXwQwJYvgRCsTesCfDJpG34BN/uEUD/B15tHPUbWFLV6TNKWmMl1
 PJhBEmVym/1jQmLKnkij9E7G4CdZezRpHfbTkInpiv7yWEi+/ZAfQqQRvH2g+SXjgUour/c6D
 SID5mGs5wqD4u9QpvnoZbTdOEQM8ujbqokp7iej1UmfMsuAwwQZfcHyaXxoYStH2SAhT+lXoR
 WmBgF9Fr/VNMAxFCSc0y3y31ZPiF9/fEhZyXWSL2xnPLILulefIkisAa9H90Zea1v2WBo3ixo
 rCDu4NI3QsjebZ6UBlGID3LcMm1ghhjjJYJFRaFBsuEXyIBi3R2FQ+NRxCZJW5qEWg6mPNjO1
 RX/6KvIe075nZZBHqsCxDEeMTOxK96iV8DBrrfu8b3QL/vmtzj3NwcnSF8gK3fF+DLXw5nzWo
 JzwSbQ9TDeKR6FHKMtdmmCaDRZ1Du3B2F9gO3wD6FVMNLTkbeaWygdoPM+EnoW6gxkgPZPq9u
 AI0kgXk4hGBqrz8OPxL7D7EGaZUIaagxnjMbjEvGWrKWzMfhOv8YcA7RtTnW9KH8yhEqWyl8G
 RddxPRgJMVfa/YAcg4woQVCbeZIs9vehR7FFncA0J9H204vogTDS1NoOqlMECFCD9/fNMqsVT
 KG4Uc4q0y1sne8/bIkgatZgtK+jlaDdVMFdVgSmIdFCUP6u6Pq6GB/AL/cvhMsn60u3Jx1YjL
 I/wLcOEDJzn822oAsiVGU1gkp0BIW3FDodWdcucWQAb+YI/JwQmVB+wmUYe3KXn7YKpVkvFUO
 boaowATydHoTLzEGiyW1r+DPMp6p5aR60ifYq0Ojn9nrHh0QZxpXS8synnr/8odEEj6zWXw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_044456_416213_A5B5CABF 
X-CRM114-Status: UNSURE (   4.90  )
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

> If link_conf_dereference_protected() or mt7996_vif_link()
> or link_sta_dereference_protected() fail the code jumps to

                                      call failed?


> the error_unlink label and returns ret which is uninitialised.

                                     a value from a local variable
                                     which was not initialised properly?


Can the summary phrase be improved also another bit?

Regards,
Markus

