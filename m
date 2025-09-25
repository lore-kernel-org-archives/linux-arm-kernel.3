Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFB1CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 07:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83Nn5b4JSEuoWgZrR/ay70JX8WRfWcMJ9A+FdwfFYxo=; b=qT8ERb6n8ZYKt7E1iHjDQrIZjY
	2mf1KfjBv3XsP7ybq5n8TdWslbmId9XKzaPk8scJPrhIDrTCGaTIiirBhmy8QwBVk3qrEdwOxA35y
	FBV56vrcv3wsQFvH6vBWLC+orS8L1e68CISXnnVVB/s0yjWEYcmevN6mrgG2osfC1yh0e7euqPWhe
	raPl3lFcZdQdNTCU6/rUsO7r6JVPYDyuGPEMGdxOYKCpDS+Q16A6OWX2MMfo+X0wqxC34E+ItOrP+
	QyRzEVBdV/7MC+wiqOcKgVRAV6dVX5aHiWfFrS8FpHLcWBTAfcGVcbTUWUTwucmOcm1CharQ/Thpk
	GmKedyQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gkP-00000006rze-3zij;
	Thu, 25 Sep 2025 07:50:37 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1gkN-00000006rxE-14QA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 07:50:37 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 501437A0179;
	Thu, 25 Sep 2025 03:50:33 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 03:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758786633;
	 x=1758873033; bh=83Nn5b4JSEuoWgZrR/ay70JX8WRfWcMJ9A+FdwfFYxo=; b=
	pItA3ruZW5T9+PNMdSyjosQHJWW2SIzFRB1T+1RzR7XetYb5u8pq+kAbshCqp/hb
	CFNDPCk/hLBLyz+H2ZWs8UcaNdg2+zOCRg4++29TjH3JlmivlncDIp3x2zeX+vBG
	D7QG5D+gm9SgVgUgjgBJ+FMTmm+DsPGr9bUhzqdyqqoNL8fi52jH8/JaQRCTGDw6
	FHaKU+6MtiCOQ9tjMdscENdigKG4iD1fTydgYzyoz42edBo442pHGC79hqjyPTeM
	KLrbZIPCADoFDoWyI3qavcmg70ybpiHfptnQAZhImMoeIsR9wzwiEjJn+rQ3CVuD
	s19XNKOjyD2KuoK1LpTONw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1758786633; x=1758873033; bh=8
	3Nn5b4JSEuoWgZrR/ay70JX8WRfWcMJ9A+FdwfFYxo=; b=F8gtftuPlBTRVn1pa
	p6m3cdU9OIig8dVcgg67TXV+KxF/F5/oqQuQtWoojwNQFfeWb9lh60R1TFw5At2k
	ucwafUPANpmkWItrpNtP6w/ecFxZY6orzb8rLkFMPHCaxGenNmbGRjn8cw47yjC3
	CEM8OQgKbtdagWJTFDLLyttBR68IenIRaa/R5DjkQ4+jtNlvJbpX4YQiVGF9w03f
	gFhednbXnVH92My128e7yjsMVQWIHnXvGi9sOe62bgP2AXIe49x1Vpxtb1PmgupE
	G4Qf8kwq1rkfBS7XpfjGFyttT9FbzheIlA1iIJhMEG8AUoi8h7OoslJwdsuXo5Ep
	4k7iA==
X-ME-Sender: <xms:R_TUaHKqyXCy2u6drtgXYPqbK830VmCmZRElz_DxuwtMju8m69zJgA>
    <xme:R_TUaF_Spg3m16H2kIU2QNq19M-W6m_bYrAS-PE379QzEhamyqoaJemZmQQCgCESV
    qQxXHQ6hkXbx7M93XBEbT1Ud93NJp7l_uBkLfCJI1hbt5dyFRJTNRY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiheelfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epfeeilefguedtueetjeekkeegkedtudfhvdetuddtleeihffhuddvhfeufeevlefhnecu
    ffhomhgrihhnpegrshhpvggvughtvggthhdrtghomhdpkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepvdelpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthht
    oheprhihrghnpggthhgvnhesrghsphgvvgguthgvtghhrdgtohhmpdhrtghpthhtohepph
    hrrggshhgrkhgrrhdrmhgrhhgruggvvhdqlhgrugdrrhhjsegsphdrrhgvnhgvshgrshdr
    tghomhdprhgtphhtthhopegrnhgurhgvfiestghouggvtghonhhsthhruhgtthdrtghomh
    drrghupdhrtghpthhtohepnhhfrhgrphhrrgguohestgholhhlrggsohhrrgdrtghomhdp
    rhgtphhtthhopegvsghighhgvghrshesghhoohhglhgvrdgtohhmpdhrtghpthhtohepvg
    hlsggrughrhihmsehgohhoghhlvgdrtghomhdprhgtphhtthhopehrohhmlhgvmhesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepfigrkhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:R_TUaCQNWYf7xcnmutE64H55YDv-wG_GnNWltdQu47-XLEWqRqLfSg>
    <xmx:R_TUaIOGhz3Vc68QV44f-9EIYj5iy7WDrZlaTmUb0lEw2sqnov865w>
    <xmx:R_TUaGs6JGuiXFJq0DvGWqw7-yzX8QP7i5v3zM4zrDjbepspj5BVdg>
    <xmx:R_TUaERxoCYP_AJ0GAgc8B-gPD7Mo9NYBnBevlzOuDiBbh8IvNkT2w>
    <xmx:SfTUaArooyr620KNVFTum50IpoHqBjBTm12tNgGDbf1of-N0qVf46SKF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 508FA700069; Thu, 25 Sep 2025 03:50:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ApQpqsW9_EUk
Date: Thu, 25 Sep 2025 09:50:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ryan Chen" <ryan_chen@aspeedtech.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Joel Stanley" <joel@jms.id.au>,
 "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 "Taniya Das" <quic_tdas@quicinc.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 "Eric Biggers" <ebiggers@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, soc@lists.linux.dev,
 "Mo Elbadry" <elbadrym@google.com>, "Rom Lemarchand" <romlem@google.com>,
 "William Kennington" <wak@google.com>,
 "Yuxiao Zhang" <yuxiaozhang@google.com>, wthai@nvidia.com,
 leohu@nvidia.com, dkodihalli@nvidia.com, spuranik@nvidia.com
Message-Id: <41705e13-c61d-4249-9492-b83f1371d3f9@app.fastmail.com>
In-Reply-To: <20250901031311.1247805-1-ryan_chen@aspeedtech.com>
References: <20250901031311.1247805-1-ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v5 0/5] Introduce ASPEED AST2700 BMC SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_005035_757730_016782D0 
X-CRM114-Status: GOOD (  14.09  )
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

On Mon, Sep 1, 2025, at 05:13, Ryan Chen wrote:
> This introduces initial support for the Aspeed AST2700 SoC and the AST2700
> Evaluation Board (EVB) to the Linux kernel. The AST27XX is the 8th
> generation Baseboard Management Controller (BMC) SoC from Aspeed,
> featuring improved performance, enhanced security, and expanded I/O
> capabilities compared to previous generations.
>
> AST27XX SOC Family
>  - https://www.aspeedtech.com/server_ast2700/
>  - https://www.aspeedtech.com/server_ast2720/
>  - https://www.aspeedtech.com/server_ast2750/

Hi Ryan,

Thanks for you submission earlier. I see that you had sent the
series to several lists including soc@lists.linux.dev, which is
what I use to keep track of patches that have been successfully
reviewed and that are ready to be merged through the soc tree.

Unless you have been told to send it here by Joel and Andrew,
I assume that they will pick up the series through the "bmc"
tree once they are happy with it like they do with the 32-bit
Aspeed SoC (ast24xx/25xx/26xx) patches, and I have dropped
the series from https://patchwork.kernel.org/project/linux-soc
now.

For future submission, please send the patches only "to"
them, with the other people in the "cc" field to avoid this
confusion, and leave out the "soc@lists.linux.dev"
recipient. You can add me as arnd@arndb.de to the Cc list
for reviews though.

Please also add a patch that changes the MAINTAINERS entry
to reflect the added arch/arm64 contents.

     Arnd

