Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEB5FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 07:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5txGQwjnvMfmMJt5h7DPCSnr4hPNNXEjb7mJC12aqP8=; b=eTw/wxKXVHtvSOLTteFfDASlmM
	+mLAwOSSNEy6gits7JMHmd955VA0WmTdtBDoRqK7xDeRwkS4WPx6aFNm9RQ7dCzjuM+lN15ox5TGa
	J/uNcJHf8thMHXKkwgIdCsommkUgJgKEncI1oR5ATZICCvoktRXX0w60dnRsh6MQWgpN14nKxNatX
	KBCR18hexDKaH4JNCz6EVOQ/78IlW6uqn3qvSHb5Y9sk6VHNmlV/pWfTK4DBkfxuXbbFuFcRqhgy8
	4gahSEcuTuwfsOoZ55xoOgg2De19ojTgwa2JDHKumVhgU9a0q1dbIsNTccCDAWV0+1d+fgMJko62e
	cqUbSXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnJP-0000000CYmB-3LxV;
	Mon, 04 May 2026 07:01:51 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnJM-0000000CYlI-3JxQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 07:01:50 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 4C3B2EC00AD;
	Mon,  4 May 2026 03:01:45 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 04 May 2026 03:01:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777878105;
	 x=1777964505; bh=5txGQwjnvMfmMJt5h7DPCSnr4hPNNXEjb7mJC12aqP8=; b=
	I5O2S/fQJmsAwR42HgchN9BYhwETD+UrtNmgqbfFXRTgXvnIA0pUs9gVS5hUU4Es
	fTBxWst4NbZPh3BxwMb7xcKL4SToqJ7yQVcnbsiG/xAHKBpAg0MdNu7FFWGM2ume
	ZaoGBTDtGvyHCtPPFKUsg+Ii4PbLk0Ssi96eH6gLPS6Ce/INvwzoBDYMTFi6PVc+
	e/hSDjMV0wHk0noQov80SF4txs84pAmmv/ep62W+36zmB7QxoaQNrROE6Fr+Vx23
	DhyfsuMG0bFecPuN0l7vvH/FQ8pGLktwk6hq/Wx7PP6H5BdqSVrXcnuczL1hLSs0
	bgoxkZGZVEOaOM0QTFKfgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777878105; x=
	1777964505; bh=5txGQwjnvMfmMJt5h7DPCSnr4hPNNXEjb7mJC12aqP8=; b=o
	jSoVPXISvQrOwzI8Lx+YPk68Qzg/8+Koc3QzJ9lMft6MhyZZV7AIA56wPee2khAj
	PFriq1pTmS0qFi1LgQCbxdB8oyKtlt/zMmwHp7SWswgIYGqsb0Evv5gpOQFCVZnR
	MwaihWO0y2a3GRFDSdo/rIIh1SO9HKi1ekO75ZWDU3yYPlgZrNR3Z0gWi+iPIGD+
	e1mw2krdHb6T5RdnezJkCusWevV0SpLcaBXKgv/TkHexSrWtb+r/tbXxSJAx+o2n
	MywfIKJBnNLxbqLJ4QbvujqkZUVJZXrVQbJ09Gb4mGmm6cZgeXPL0d8o3jGtQoq1
	pqiqssPa8isRFJetTU27Q==
X-ME-Sender: <xms:WET4aV5v_ECbWwSTq_ZTTpppnl10QEaJt5DNxlTE9c-1F1Kd7KcRtA>
    <xme:WET4aduywIFjL1VHQ4dw_-GMR-VoF0Ho_htWBniw1GRFeIi8lwQtg0k4aBMUzzumf
    IQx4OIXDdyF8QQZ2Fn_anHg90klPtyUaKh7qWTdvwU2ar0Kti0HYyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelkedulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoh
    eprhguuhhnlhgrphesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehquhhitggpjhhjohhhnhhsohhnsehquhhitghinhgtrdgtohhmpdhrtghpthht
    ohepkhgvrhhnvghlqdhjrghnihhtohhrshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:WET4aT8vlBfmpluhyNh2yIqXddM_09TTCCUxKl4644vI2YSOp5sIVA>
    <xmx:WET4aTiMU6Qp25FL4r-7GlaArVdB9V0qKV8ucVBSdimJuEv2MpZjIA>
    <xmx:WET4aaFjei3QmAMylMIB7rBJZZQT5Qz-dZpCzkvqHE5IYxZTdLG3fA>
    <xmx:WET4aS9t5TyodaSvcYSmAq08s4p47p_TynZPMQC4oPSe0Rsmwhq0SA>
    <xmx:WUT4aWMbIrmMnSMsYG--QIYkO8E1a4NyC2RxLOZY0tBJYXblWMVsCQGL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AD858700069; Mon,  4 May 2026 03:01:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A_0bUCm6dRrc
Date: Mon, 04 May 2026 09:01:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Randy Dunlap" <rdunlap@infradead.org>,
 "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-Id: <734617a9-487c-4053-aaa3-095b517d5bbf@app.fastmail.com>
In-Reply-To: <b52d5383-dd57-4bbe-a6cc-fd584cf68957@infradead.org>
References: <20240622-md-arm-arch-arm-probes-kprobes-v1-1-0832bd6e45db@quicinc.com>
 <3808c973-1315-420c-900d-122a73a34f9e@quicinc.com>
 <05cacd03-686a-4ede-b485-7f4781f69b99@app.fastmail.com>
 <b52d5383-dd57-4bbe-a6cc-fd584cf68957@infradead.org>
Subject: Re: [PATCH] arm: kprobes: add missing MODULE_DESCRIPTION() macro
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_000149_263938_2950218A 
X-CRM114-Status: GOOD (  14.42  )
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

On Sun, May 3, 2026, at 23:12, Randy Dunlap wrote:
> On 7/19/24 4:28 AM, Arnd Bergmann wrote:
>> On Tue, Jul 9, 2024, at 21:53, Jeff Johnson wrote:
>>> On 6/22/2024 9:34 PM, Jeff Johnson wrote:

>> -#endif
>> +MODULE_DESCRIPTION("Test code for ARM kprobes");
>> +MODULE_LICENSE("GPL");
>
> What happened with this cleanup patch?
> I don't see it on a mailing list or in linux.git or linux-next.git.
>
> I was about to come up with the same patch since it still seems to be
> needed in linux-next-20260430.

My mistake. I've sent it to the list now, will add it to the
patch tracker when I get an Ack.

       Arnd

