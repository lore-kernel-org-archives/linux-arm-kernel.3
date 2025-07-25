Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264EEC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 12:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX3Sod6bQ4J8kY8g6SMBYCTMuOOksQmjlw0t4ePXhwE=; b=BD/o0rBPg0opM3Lbd3PugICy6g
	Cuti8qnnqdmTuQBccVccyGm70L4e2RiZpihOnir5thp5jk8RZ97xClzU2IC3NMeiOOF5hHnMZOSQy
	3diot/cqDGBWVAb9sRa9MhbiRP7H9NPuCa7VdzlkNVoOpr/P+StNlrjlxF27+UHuv7XuuIF9/jfC3
	m9xnZCi/SVWpZ+k8IUnY5AgVJ0Ddu4rrLMruVIa0MTjqcV1zp6yE7fGghwRSJLf3Rw+LKBYlxrJoY
	CXl6C+XxSKigN4A/g7PSkrgdgkIG38pPzVbHhKJ2y6Y6D+UcsUz63YLaVE4tHgcElhQVPuy09VlZZ
	5Tm1z9Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufHL0-00000009nSi-3rgS;
	Fri, 25 Jul 2025 12:15:46 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGv1-00000009kit-2P1O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:48:57 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 154B41400043;
	Fri, 25 Jul 2025 07:48:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 25 Jul 2025 07:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753444134;
	 x=1753530534; bh=iX3Sod6bQ4J8kY8g6SMBYCTMuOOksQmjlw0t4ePXhwE=; b=
	HaM0kJbGFO46KYskNpftCyKLsUBw8uWJ0PpGuXEJbG0yUjKpwOvk3FBPCIEkRhbp
	3nVZlcigkUYZXSu60eJsJwnqyITBqeQ3GMD5qfK61kjoaSD/hdkTZeXb9jLvw78V
	TTGc/hHdIL6ccKNcsMO/tb7FhgbOCXkApIlKNmC54zRPI7Yg0rSaNjymTwOeSaOb
	2FeFqWCjxq0MT2+1xH1dT4Cd6PdslBtB4gBhBiu6w2uB/7OKB263Ob06QgdzEj/T
	cqCNsO1a94RdAFYqbEavzliOyiaZYPUc6CSBlwYmQrJJfe0VwVBp9Ff1+HgrDyvs
	MHSg/PwzYgz4e7Geu5W/1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753444134; x=
	1753530534; bh=iX3Sod6bQ4J8kY8g6SMBYCTMuOOksQmjlw0t4ePXhwE=; b=n
	ueOdbnN0rgWHMfsBN1NCsFUULARZXhTLTuC0bfOlfL6uuCISs1NfeetUR3N7Mn+2
	suERSpgYZHd1fqeH0R5fQB5LGM6qzN/NrAk2CPdd4i0yFkZyDeQuoiWWY2srj2sq
	3G3lWSI26bQ3IDtK1wcJROmUvuExQtplh65FvBptLjYYVodc5e1cBUPXrxhjAf8P
	tDtQwBu6jXyOkc8n43Qx3MCIKxW/xq2LIQbmeJ+P0VRDZaw9QDJBvLbYOEc+7CFC
	J5x67GQpfOPcGMqsFmcMRemw0aF2hQWQ7TnJibpmCc6OU6w3C0EOQyUDOvfwlcvQ
	U9aa0wOrVTcKEbs0226jw==
X-ME-Sender: <xms:JW-DaPElu7SGv8YRqTeq07tiNq28gqyD6OUFQKhlkejLWMTdPJ35ZA>
    <xme:JW-DaMXJ51fbI3lg6CzAhaHRr9pn135DkLVy9wjf8P0gyEwFnmeNEcljXtOcqXRFO
    7sGfa1k0Uxfj4YyPQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrd
    gruhhughdrohhrghdrrghupdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:JW-DaLORVqBMetOPbqzHMV92hH-i8JPF9cuGx6RR2_3Mh1SdG5b6Tw>
    <xmx:JW-DaNVRz6TcnnYubIDplV-CdvY01L0rTzkc57m3t3DGP-oZ2m8wUg>
    <xmx:JW-DaP059ZTjD6oC7nNlJ66Q37nUB14kwPQ3sImiMCrboRchNpW2VA>
    <xmx:JW-DaLraAoWWiy4jQMUkbVz_XLqvD6Hh8Thgv_wKsJtQufzwZ-VXlA>
    <xmx:Jm-DaFlJT9i23Q0VVcgYzNAU9iifzm3xLv97lOm9c1a-dhzwdiM0zq2T>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4EA9A700069; Fri, 25 Jul 2025 07:48:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T8969479896fa1a68
Date: Fri, 25 Jul 2025 13:48:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <a8d0eb68-fac5-4878-be16-05f436a190df@app.fastmail.com>
In-Reply-To: <20250725113539.GB11056@google.com>
References: <20250725113657.039aa5ce@canb.auug.org.au>
 <20250725113539.GB11056@google.com>
Subject: Re: linux-next: duplicate patch in the mfd tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_044855_962091_C542B984 
X-CRM114-Status: GOOD (  12.22  )
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

On Fri, Jul 25, 2025, at 13:35, Lee Jones wrote:
> On Fri, 25 Jul 2025, Stephen Rothwell wrote:
>
>> The following commit is also in the arm-soc tree as a different commit
>> (but the same patch):
>> 
>>   ba9ae011e837 ("soc: apple: rtkit: Make shmem_destroy optional")
>> 
>> This is commit
>> 
>>   0445eee835d6 ("soc: apple: rtkit: Make shmem_destroy optional")
>
> Odd.  I don't see an applied email for this.
>
> This was applied to MFD and a pull-request was provided for the other 
> subsystems:
>
> https://lore.kernel.org/all/20250724102529.GA11056@google.com/

This is the one I pulled in

https://lore.kernel.org/all/20250722163258.62424-1-sven@kernel.org/

I did not see anything from Sven about a shared commit. I can
throw it out again without too much trouble if you already have
the contents. The only other commit in that branch is 
65293c3276de ("soc: apple: Drop default ARCH_APPLE in Kconfig"),
which I'm sure can wait as it only changes the default.

     Arnd

