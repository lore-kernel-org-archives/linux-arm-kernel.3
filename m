Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA25C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/SbMJsZTVEbKRuVrUDYyc5PB99lv959TP0uVc5Xd2A8=; b=mTkOdQpWaEVpKFlxsU0/YPJcTS
	L9AJeV+NgMwJQe6ghV9Hd7FDofXSb4mfVSypMZROazhjluh0P5B8kb/NmAV0084CNRQmH78sZxdPH
	fO9zUfuFuMZIsqZ/tk2Bos5kvXJyJCWcXECpwPYbOcSLb7HR1XP8gHdn7ExRi+ZK+R3xepgr1qvs9
	bYNhuK6T+zu/lATbJtADR1Lk+hf/+X4JevbGAmTB1u00gS1faL2AhKaTB6+A46ErZsM6p1rCjRGTT
	3wKWxCt7d41/7i3IGCoqsQZKvwL8/beCay3YupgV6vqKzyBSsuJIl3TEPVOTpplyuqjZbPixqUFw5
	5NAw0J3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tix1w-0000000FDQE-0kPj;
	Fri, 14 Feb 2025 14:51:00 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiwuW-0000000FCBp-2lvo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 14:43:22 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 67B6D1380894;
	Fri, 14 Feb 2025 09:43:17 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Fri, 14 Feb 2025 09:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739544197;
	 x=1739630597; bh=/SbMJsZTVEbKRuVrUDYyc5PB99lv959TP0uVc5Xd2A8=; b=
	fs60fQ7BtStTUuwD8Q8P+uojYJ9MTo2VLZrNnTANUDP9iK3Se8p27diSIjh3sXyU
	uwbZNUVjqs99k0schJIwsyoYU4Mcnxr6LPZ0omnJJXPthtmrKP0SNdgkd/ricOnf
	BNdN6i/qMPcIXDkmI1mKuWlukFjMNlsmfARyXod7pAcluMUT97gJXtO/lKWV5Buj
	25oYwqqjrjWadiMQLkfkAZADuvjOH4uDccjeCYBUov7fvM7UBkE0nwppPywsdBzx
	g7moeNP0APLqgZhD7i1xLY6CAeXRMmgtEcIb/SECkYsKM3mfQ7iQMz5fqNGyAn2l
	0Wh6IXTmoOZ8YMNpX4qtDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739544197; x=
	1739630597; bh=/SbMJsZTVEbKRuVrUDYyc5PB99lv959TP0uVc5Xd2A8=; b=c
	uuM4BawgJTWa5LmvMeClLgw7jOrfiHdwckzVV+t43Im4l34SxLhId9hgEj8Btqux
	eXqUSQxBvr5r3TG8suRPv/T/RO2H09EDTk9tuZAifcWkGeBwaQ/KiQqKE20eVE+x
	IneZJ3go+Nd3qBNF9Qkp/b03OHm2bGvNTyuVy6ptON3JNTHlv+J9tbKh/6CHnkvZ
	qs6FYcvUG7aaj5b0M+ffoK6aFfoHDDQti8Ab4L2xp9fHgK/vcFC1AFfyAYF6xhnL
	4+TFaPc4khMdDQcgqUU9rii40v0GU+73LGErb9CN7Q85hx7+20Qbw6nNtLV+rd4o
	k4vxkSXcMCJx5EqnpEgEA==
X-ME-Sender: <xms:hFavZ0DuHdk3xOAWhFZEdYESurpx1uHeUvh3RyltzVZhz_Qy1vfCtA>
    <xme:hFavZ2gNwsAqf2F3WSSW-h5qqB6K4K3xo7TDuNJsFMSIB5uRqDWGbMUweQfCMan49
    OKeHkNdtsQzXlt5FSU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegleelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpeefhfehteffuddvgfeigefhjeetvdekteekjeef
    keekleffjeetvedvgefhhfeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegr
    rhhnuggsrdguvgdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:hFavZ3l96-0p0JHEEXGAmVruAvob4iabU8xg4PZ9HsV--2xGhK5B2g>
    <xmx:hFavZ6yObr5oqRwXPuyTKzmJRjCsI4UqGi8yAzcEbJza91NLIuuG3Q>
    <xmx:hFavZ5QLFVS_rA3WkNmkCjlItZAH1Kl58HpcwjX3IkVJdeuTQ37azQ>
    <xmx:hFavZ1aCszo7vYHc70g1zV239uwSrnkQOCN_SYP8wPNWMSz82y1gzQ>
    <xmx:hVavZ7ecLTXSFUDpGYlLgAAFj_R81csrc_xcheXbwboeyCkObn6ja11K>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BFC6B2220072; Fri, 14 Feb 2025 09:43:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 14 Feb 2025 15:42:56 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>,
 ARM <linux-arm-kernel@lists.infradead.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <8f70d200-f55b-4ded-97a3-9586615bcaa9@app.fastmail.com>
In-Reply-To: <20250212093147.02ddbf2e@canb.auug.org.au>
References: <20250212093147.02ddbf2e@canb.auug.org.au>
Subject: Re: linux-next: failure fetching the arm-soc-fixes tree
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_064321_186884_E6EDB12C 
X-CRM114-Status: UNSURE (   7.14  )
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

On Tue, Feb 11, 2025, at 23:31, Stephen Rothwell wrote:
> Hi all,
>
> Fetching the arm-soc-fixes tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#arm/fixes)
> fails like this:
>
> fatal: couldn't find remote ref refs/heads/arm/fixes

Thanks for the report, should work again now.

     Arnd

