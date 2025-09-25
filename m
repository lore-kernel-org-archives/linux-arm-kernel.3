Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69D5CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZP6i8t6VjyohhnaOw+R5p+q7sTs7Hkp2pGWlk4LB/z0=; b=kJxg5Y+a3di8Yp4J51iDy5RCGR
	YQKAmYEJz9lqDBfBbMFSvDZIj1qO/4RjbpF7h1XeSPdc5pocy8IAtgiIutkUjzvqKRQYYAmVlW0Ic
	65a45KEA8IEOCHuEYqSh3gtjQkYj4aUFEfH/nQOWTVtE5nYoumvWZRzbzKy0pNcT5uVYWWQeTHiFu
	RyTFYU3Fz3qf/50gES86B2McHOEvhZInrM6bQBGA/dJszQguQjNDaM23rNc5rbKhIrxe7fLrOYmI8
	QKw6x/9YU6YyeO35iQeppAH+0YidMIsPQPZ6MO0fDSp59/43XM3Q8SK4Yj9XnwxeiL9ovqUlm6epK
	vZ+vqyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mBo-00000009Vew-3qYJ;
	Thu, 25 Sep 2025 13:39:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mBn-00000009VdX-2FcU
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 25 Sep 2025 13:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZP6i8t6VjyohhnaOw+R5p+q7sTs7Hkp2pGWlk4LB/z0=; b=UKKib+feRfGVUtzzuhanFirnq/
	RHQzkvNEwhGRsgZq9RomLxgCifqX1UKCaQ8fHuzdnSBoVEVIZCUVdJ746WMpCjIO8S9F4uhI7jDrB
	BV1e8fMSbQ6SKH/llQLuc+IOpkZPQXHVfDDL6D3fSIKpSSb7E1BzmPr5xo+ie9ARsNqJy4eVsEn1P
	ORKQGQ55kiFJuBMYc51AOBTq1bqKFQ9WnvLiSwU5HIg80RDlK465RzAIlh5dyGZ5Whjx3YwDzX/cG
	lGA4wllXh98BCa9CV9G0w5roBRfXYHOKsoa2wa/HCdI5ebGYyux/Xum+xW5Bkmoc1LZFGvVOgAP+w
	WmKY0fzA==;
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mBj-000000099ua-1l20
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:39:14 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id F1365EC01C9;
	Thu, 25 Sep 2025 09:39:05 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 09:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758807545;
	 x=1758893945; bh=ZP6i8t6VjyohhnaOw+R5p+q7sTs7Hkp2pGWlk4LB/z0=; b=
	Yga0bisAcqKTV0DnIf+ALNVaHGED9hccLWEpVcu1AS2ugQrXux+JA34d+GEbwyXx
	e1FF0+O80vgwnO1ne8rdph8It6i84gUkARzZip9XgVMLc71RtQMA4wXJtW7w4JSu
	xfQfTt7AmtsdAOVuYNusA/41h2FeDK2+dOSS0qUiliUaAJUOB13CWyvxCH/wWWMQ
	iAuYirlk7aD3gyuTEJeKhbPXgaSS08grLJPvb94j9DcstOCoRVhWSAXJl9VGVuP5
	C0z8eTH5I4m6zXWUkNFI9lMlVUVIMkuV2nktR269Zk3NtdV6VQ+c7F7E3C0SKXKg
	TuNZ6PgokfHTn3+f1bTJQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758807545; x=
	1758893945; bh=ZP6i8t6VjyohhnaOw+R5p+q7sTs7Hkp2pGWlk4LB/z0=; b=S
	LCZyK/WT4E/AJqkEn4I4YpM3gmtkrGKSMOjemO5DGw0dS4DogzqSSjqto2aMHMpR
	wxUYOoTA8WID/3kdzBpXjaQnfpnyY7XgqLMM0saOJUcdjGCQE3807d7McA9iLy9Z
	okhcLBhPp7+ibK8m6kYp3xbfXzN9EGSc5MFyM43ORS+YUaSaJpVdV0Oq9TFNTKcP
	cWwUTPMgxTMKp2GOJ+Xj71wxH4ud2RC1KPocZwQJogiZcAVPUmT7J+wO5wO3cYmn
	d7WBwyG9R74WaI80m86f1ZYTfllRUQ7iu7kkfzcs1L9zzRlvxIA173SmD3dGOdjC
	bEMa2uPMgyMDuPlgWi5ZQ==
X-ME-Sender: <xms:-EXVaFl1peFBt9BoXygc2Q9r-wWTKxr5LzzwlJgArNIGdcACKp-2mQ>
    <xme:-EXVaLrAe_LPjNZ12OohpAcXUeOrXAnHR-81spEbJf5SpKs011LLasvgsMa8VUxFx
    j2lnOBq0do6AlL5CL7iJp380yyg7zO99ls4xSuWLkWl2Oc9LYdKS24>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiieeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopehgohhrughonhdrghgvsegsshhtrdgrihdprhgtphhtthhopegsshhtqdhuphhs
    thhrvggrmhessghsthgrihdrthhophdprhgtphhtthhopegrughrihgrnhdrhhhunhhtvg
    hrsehinhhtvghlrdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehlih
    hnrghrohdrohhrgh
X-ME-Proxy: <xmx:-EXVaKcqt-fv8lOleOx8L8kijJDVWj7-P23o48SsNRvckojD-eQdzw>
    <xmx:-EXVaLwC1bOigfMDX-tFoRmlBM74SFARXzeAqG86RqlIDGh71P_hHA>
    <xmx:-EXVaLIcIpoRWcV4NKcNP5fBP6qfFJmG9of8HUkN1I7UU9i2YVjKww>
    <xmx:-EXVaEuDGcpXdm5BN4EAXo4c4CRynPUdv6uXY39MKc2saKqSfkRcNg>
    <xmx:-UXVaJ-JhawVLmBEvgcMBDrywJHyP5BoJ5x4etVHw-smF0Ja35YcNudd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8EB47700069; Thu, 25 Sep 2025 09:39:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AYQZGcjF-1nJ
Date: Thu, 25 Sep 2025 15:38:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ulf Hansson" <ulf.hansson@linaro.org>,
 "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>
Cc: "Adrian Hunter" <adrian.hunter@intel.com>,
 bst-upstream <bst-upstream@bstai.top>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 "gordon.ge" <gordon.ge@bst.ai>, krzk+dt@kernel.org,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Will Deacon" <will@kernel.org>
Message-Id: <f64b0e00-1c30-47a1-b6b0-1bc28cc7f8ac@app.fastmail.com>
In-Reply-To: <CAPDyKFp3onTDGgygvOrK-G40w4mSx4S5=PbdZ+26hsQ+nPVRSA@mail.gmail.com>
References: <20250925090412.2068216-1-yangzh0906@thundersoft.com>
 <20250925121155.2401934-1-yangzh0906@thundersoft.com>
 <CAPDyKFp3onTDGgygvOrK-G40w4mSx4S5=PbdZ+26hsQ+nPVRSA@mail.gmail.com>
Subject: Re: [PATCH 0/9] arm64: introduce Black Sesame Technologies C1200 SoC and
 CDCU1.0 board
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_143912_375982_96978CDB 
X-CRM114-Status: GOOD (  15.91  )
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

On Thu, Sep 25, 2025, at 15:34, Ulf Hansson wrote:
> On Thu, 25 Sept 2025 at 14:12, Albert Yang <yangzh0906@thundersoft.com> wrote:
>> On Thu, Sep 25, 2025 at 05:03:57PM +0800, Albert Yang wrote:
>> Subject: Re: [PATCH] splitting SoC and MMC parts
>>
>> Hi Arnd,
>>
>> I may have missed an important detail in my previous note. If I split
>> out the MMC-related patches and submit only the SoC parts first, I
>> cannot validate the SoC on real hardware: both the kernel and the root
>> filesystem live on the MMC device. Without the MMC stack (DT bindings
>> and the controller driver), the board does not boot to userspace, so I
>> cannot properly verify the SoC/DT changes in isolation.
>
> At least to me, I would not consider that a problem. As long as you
> can test the pieces together "manually" that's fine, I think.
>
> I mean, the platform was not supported in the first place, so it's not
> like we would be introducing a regression - or break something, right?

Agreed, it's rare for newly added platforms to immediately have
everything working, and we can still fix things if they don't.

It's also possible to test userspace by using a standalone
initramfs with a login shell or an automated test suite, but
I don't require that.

     Arnd

