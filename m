Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9A1C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 06:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSIocOw+TXBnqBucngWWomxUrtwVR6XyQakzrwOsw+c=; b=gh4DCMPrcKcuDZ0REcjmCzGIYA
	cxDfRxiGwgtN24S5PBPmRJiIQo7XKtD7aRNDY+XnUCrkWinaYvPGMJT6QboRcKoTSfQxR95nYMTU/
	oBH264MSPP0WSEeXn5FN+bDI/OJ1fhlLPJ7vsySxwlC/bW/d9cwLgmZVcMj4N83EaTgQOFoYF+tMu
	0/mTkRSmz+Tr4f+xpEsJHOvp7vlwiXPyS1LrbaPgfkKJgbGT/Lmm0LUcQzQeqm7ldWI1BYkGUz2a8
	WRvbMO6BpFSw18ifvDyVvp9eyRWads0Ts2N4P1x4kr8Wa8HJMEVBNXmfAuZyYzsCnioxq7g1eBbiQ
	8BK9DBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEN3p-00000008ZSn-0oJU;
	Mon, 12 May 2025 06:54:49 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEMtJ-00000008XFl-39sw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 06:44:00 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3A390254011D;
	Mon, 12 May 2025 02:43:54 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Mon, 12 May 2025 02:43:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747032234;
	 x=1747118634; bh=BSIocOw+TXBnqBucngWWomxUrtwVR6XyQakzrwOsw+c=; b=
	J641JMr5YcPIFe8iBhYxK5MmhOnDE4eWtO81QOMa9m2lGujHOTbIRy4VDIr8zDeV
	FbV+3fryN75KPeSbzTObiWPRS3pIf9egeihwPMWM8VPC8dJoQfCNVb6bL1Sx9BAh
	dPLZzsqWMdH061ZTJewrQlKRye82gxzDos98YYTbicfRoqQbk4qnUGpG00h0YzRx
	HCqJ7oilvYOq9isjtsI+W5OPl9UP49V64+fLlM++6XuCA5XDzK13Q462uCRT20s3
	L0rJCPlM07WUIXhn8IV679zSpkAoNPoaVFvDrtgY8YmEjhiui81AIlLJv5yx1wcv
	ggRzpabTEoRDbMc1yCMQMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747032234; x=
	1747118634; bh=BSIocOw+TXBnqBucngWWomxUrtwVR6XyQakzrwOsw+c=; b=i
	3Ly1Uik57CKRZfELEQW+4vXaQy9otc2FfkGXUVjWwBGGxq4YKySkS7DJ/MORnign
	5COCLaDSrt2srefs3s80BV1S4RWNhBZZxiXI5+w+816szRwVDRfRNo82/RfQB5MY
	Ja4S3POrqsuP6pL5ZHzeqJv5mI/lRaOTPL5HZ3c9+1r1XWoz1lB0laW8aK9CQBd2
	ipT78fVl2S6iMSqbxYqsMbTfnco3eckdyHSLZ6CKiFW1kfVKZ1RcXk/CxuZsoi8Q
	WKhRsBRQKCzb4uzfAFZPOdEEIw71FkRnwLO3042ndHq+Lq99nJ8lyQbOQ1Qd3pn4
	c/t5GXAXUG5LRD2Gcr+rw==
X-ME-Sender: <xms:qZghaNgMBjzHyeEZ9L16EbsBLvZuWas9UR_X_b1hQFSpAiuMKWbcvA>
    <xme:qZghaCCkM22aMm40Y__kkTMP4irVR3O6ifN_vT_qcr955wOzQ3agVGeK9GC3EXrmZ
    yyBD97CvGVVvyVAL-8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehk
    rhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrh
    hnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qZghaNH5UenF_83IJLNZ9ZsRUJi0R2CHgyQT5juWrh5EvxxnRLJlLw>
    <xmx:qZghaCSQ6M1r45xHJYyq1hq_jm00h26S62NJOuHbyYi5qR5xIShvuQ>
    <xmx:qZghaKx7-fLshdueNT16daH24NI4OgaW90VuZIq0sv3FCVBDDQURtQ>
    <xmx:qZghaI7MzEQow_BLo57BdtcPSrlLdGHP-jLFXVyyeJlMDH6XByuZvw>
    <xmx:qpghaE59Uuq-DdRZVDMChtc8oPxYwLDMoAr30P-M6uKR3JM3zInuFOfU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B93111C20067; Mon, 12 May 2025 02:43:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T9798bf764b1c8a11
Date: Mon, 12 May 2025 08:43:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <f52571c5-2d26-41cd-9266-21433423ba73@app.fastmail.com>
In-Reply-To: <2006c4aa-7d4e-48de-9c27-46ddb359ac48@kernel.org>
References: <20250512145955.617fd207@canb.auug.org.au>
 <2006c4aa-7d4e-48de-9c27-46ddb359ac48@kernel.org>
Subject: Re: linux-next: duplicate patch in the dt-krzk tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_234358_555254_31B6BEC6 
X-CRM114-Status: GOOD (  12.03  )
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

On Mon, May 12, 2025, at 08:34, Krzysztof Kozlowski wrote:
> On 12/05/2025 06:59, Stephen Rothwell wrote:
>> Hi all,
>> 
>> The following commit is also in the arm-soc tree as a different commit
>> (but the same patch):
>> 
>>   b112d9ffaa65 ("ARM: dts: vt8500: use correct ohci/ehci node names")
>> 
>> This is commit
>> 
>>   7dc891191e64 ("ARM: dts: vt8500: use correct ohci/ehci node names")
>
> I will drop mine, but I am surprised that this patch appeared in
> arm-soc. soc@ was not Cced on the patchset.

My mistake. I think what happened was that patch 0/5 and 3/5
(the one for spear) of the series were sent to soc@lists.linux.dev:

https://lore.kernel.org/soc/20250330193833.21970-7-wsa+renesas@sang-engineering.com/T/#t

I had some problems with patchwork recently and picked up some of
the missing bits through b4, which always applies the entire
series. I made sure that the patch themselves were ok and I saw
your Reviewed-by tag, but I didn't realize that I was not the
recipient for patches 1, 2, 4 and 5.

      Arnd

