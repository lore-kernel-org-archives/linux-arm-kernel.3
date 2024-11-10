Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC39D3C931
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTR/nhj5MrW+3ggTFQ749a6iLnniw2ba6f0H4nA+qfA=; b=20WKKqiikPWYAZfpNfTDrFMPIY
	5k7pdq53kpqMmJ/E/WGq5pERTee2ZXNdWgSYKSoHW9bAmswPdw7PkY1QutuiDNe5Z/2apf81+r7qJ
	8KlACu1jdq9T11hGz0zLIGbRzOZ98K35+X1+xVzXYvZGteeFcSNiqkefOGfRax2mEFGjOWJsesVEx
	nek7iReQe+HixFuy//ne+COMH9DLva691SgNK0b72M1FDNtbAsScURJ3HwI7FkpTZFMX0w+LDN9t1
	cOguGQkkxFnvBk/UN9ek8qEPhC67hiJKPlR1V6qkJb4DFXu6vdrk6rABhkQgMhSeu7vzZB50hEuIm
	SPYoIehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA6nu-0000000Eotq-0may;
	Sun, 10 Nov 2024 12:12:30 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA6m8-0000000Eoli-1QQZ;
	Sun, 10 Nov 2024 12:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1731240625; x=1731845425; i=markus.elfring@web.de;
	bh=XTR/nhj5MrW+3ggTFQ749a6iLnniw2ba6f0H4nA+qfA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nAQdAjwgADWFJo5qTN9mgG2FdrguVGoYj/xwvqAfcuQW9i4WHJDNFjcD78cHmVaC
	 yIY3WmzjFZ41JAbXSHcXvEK7nJmSwG7TE9uhYOzbwVpdxMBpxlW4PLQjOQLRk+24m
	 AtSf797iZok8gnigCT2lWL6O8MNO95hGejezOlgmUa4pxe+GJalqWPXGmLkdAz4fo
	 YbI7xu4b1cMA56XnIzG3FNuNoI/iRDPIo1/P0Fl7xMX30JCfoL8kM/hcrRijT4Mkc
	 JHJSL/WwgWcSpf7r6al7B5Kw5B5V7O1C1OEJlQGP92jMS6eX0M4JygEZTK4nPSQmz
	 ChOvIvpy0LOUGOhiVA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N2SKz-1tw8eE1Vtf-00w35Z; Sun, 10
 Nov 2024 13:10:25 +0100
Message-ID: <28f2bba7-40f0-4015-af84-d3c08c9a14c1@web.de>
Date: Sun, 10 Nov 2024 13:10:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20241025080026.2393-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8192-afe-pcm: Simplify probe() with
 local dev variable
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241025080026.2393-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cFryH+0NX5oq80c/QNEmOxjeC51hOP9U2wT+P96GpQKaFgokGkG
 7Wf4Mn8YFwyLHHvCbMMy7JcZy5ok+8spkddeOF/7In/eQzmAe6ZLdtEX7AObfjUs7k48cJQ
 bOq79U5aJKSnzi3foN5ca5TGCXTnYYYP0k8wUbidQsVqnSc1M2E+ehKnocTiasfpdMF5C+6
 jGyK9d1+5Xa0gJAFHiGuA==
UI-OutboundReport: notjunk:1;M01:P0:ix+3Vngnm6w=;p5QE56Xzwca5K5BFHiuaLGJAO7e
 auLYxV4OV05Pw5RnzItnmtcO2ieqKwINlj2b7mgshnGe9v4h666f4G3PXQqhbfWO1gRZxzxXP
 G2o0xQEphxeYmpPNS9GcDQwG89SlGCCWZqeY15vwpzDg8aXkMD627qJt/pq78A/hFnvU8VbLJ
 uLnReYZtDslBjIcVTHC/d0h4H9DE81xMwOvl0HtOuIlM7KnabVQ2rabX/Z6CpQgprA2DoJDgm
 6UTisdG/AABwXS2pUv999C+jRLRRNMrY5XlrSt4LHnTo0SuwZaSmSxwNkEt9DVHlTVKa0kEJG
 Qj8uADrUnMEzKQvx8In0aTIJ7U8DPhBiSTqOL9qrKKvLlK0LVzltBz72KQ0IjUID+jkMY5eKx
 zuyMRDOca7cWeWhU8KPn7wAESWXGMai7IJGoMjFk5ii848OglElYfNamS4xzybeqbQGGRUYu6
 vxqauGbXI6yxyqiRkjU2xJif5KsbeUep1V0hSHU/8CzKVsEV9SyzikeaRe5TYxLMqpSR8PRM2
 d/3drYn8kg+G65WOE159FhvXYEDBBR4Bz0mK4ATVwS3JNj4LM4vHyhqcnDBXF+9ATbe+pWli8
 /pIblUEdqbL06nKzC4h0Gv2BKrMtpFnpNP9i7qS0jD96nxHcLwSH57Xu0iP3QBfF7e173NrSo
 bRp/Z6SMpvHpi8s/qiTfJUIr2/GNT2k9KBrMIfIxrUVPcCKGEmXyd4FGFdT6A8Z8+h+CvkXvu
 RKIpvVM+P2aMza0wS1zeq+oA2N++LyuFapUbaXM9g5lcaSNOji7/DoB0PGTUUbK0oI9HXh2ti
 AY1/w/8YCyi+PHKY2Md0odpg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_041041_154963_630D0996 
X-CRM114-Status: UNSURE (   4.79  )
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

> Simplify the function mt8192_afe_pcm_dev_probe() by
> using local 'dev' instead of '&pdev->dev'.

You may occasionally put more than 51 characters into text lines
for an improved change description.

Regards,
Markus

