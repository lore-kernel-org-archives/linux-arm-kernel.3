Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29328606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FLkEewpz;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=h5JU/H53
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uOlICXe5m6UkPEsKQm5ZQ2HRTSw6FYz/OTKxqH66Wss=; b=FLkEewpz7POoQV
	RfjkV7PW8Toc4W76zyWKxU3mQpEvtJZvbeSt6u+192BQUqxO0dS6SStzU4QbUQbm2OWood1H9pkZx
	opJxX4jM0RFOQhoTAwRup82tWswj8eALuG7asYQuwFen1z/xEToPNEsALcrLGxFy2z2sfSrn3RHZB
	AnLcHXzDkSAXPbqiOepTXQm3nOX8yAjjZABrXj67hVfgK3xxg6nlA1GPiopVXeE+TE1wrLT/OIqlP
	pFOt2n2JxF/UaJnG56i1URn/t1lPKT8PQeu8i6leQkBOhU8v7OEFlKTseAVrV+rANFOh4u7CbEv47
	5/GWGbi0CNKVRRKEYJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHsU-0000000C6aq-3wA9;
	Fri, 06 Nov 2026 11:13:02 +0000
Received: from mx5.mail-out.lima-city.de ([91.216.248.207])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHsR-0000000C6ZR-2N3j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:13:01 +0000
Date: Fri, 6 Nov 2026 12:12:50 +0100
X-Lima-ML-UUID: 21ffc2cf-d5b5-4b50-bff9-4d2e6e69e61b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793963574;
	bh=uOlICXe5m6UkPEsKQm5ZQ2HRTSw6FYz/OTKxqH66Wss=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h5JU/H53ovbcvOj9+4xwyKZtltEwUv5agWdUg/jQ7GqdM26PDum6snSV/4YFPG1fG
	 SbN9TAjgfxPK/5YVKP10X3R5Isn2FdfgVTJLZ/lO/qPBcXkyEeB6WYP3onoGtXXKNk
	 S+0Yqu4DV3FsKXwQ8eODr8JhLbSt1M+D5EabULuP/rfjug1oxH4Jr+9bk86CaIkEo9
	 PzHG9wAM/xhyckWLV/9LsoPcxmoeopCG02BKo+JW//M4aTJvP1rfFCeqc5Fhl7Q0ST
	 +2fh/+4cTqdMSBESXqsp/AFlHnmnqm38p6GL6BTUM1JrWPF5DxRiqHyBAppirQm/KC
	 JdHIgN6H74zgQ==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Myria Sarvay <myrialsarvay@gmail.com>, marcel@holtmann.org,
 luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Yossef Osman
 <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <20261106121250.0caf3299@kait2en-mbp15-1>
In-Reply-To: <5F81A6CC-46B6-4C45-BB05-8483057EEE7C@chaosmail.tech>
References: <20261105085750.120392-1-dev@deq.rocks>
	<20261105085750.120392-2-dev@deq.rocks>
	<au1uH6uxtsw2vHfP@macbookair>
	<20261106083339.677cc75d@kait2en-mbp15-1>
	<CB3B84A2-76AD-45F5-B2B9-39E5A9ED3BE7@chaosmail.tech>
	<20261106113946.60c6c5f6@kait2en-mbp15-1>
	<5F81A6CC-46B6-4C45-BB05-8483057EEE7C@chaosmail.tech>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_031300_042955_5203500B 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 11:53:13 +0100
Sasha Finkelstein <k@chaosmail.tech> wrote:

> Sleep. I intened to say sleep and I have no idea how I managed to typo
> it as stream, but that is what I meant. Sorry.

Bwah! Well... np. But you know we are using s3 on T2? So the
controller will be off to Nirvana anyways. My last info is that Asahi
is stuck on s2? So even when testing with s2 on T2, we have UART
transport on the 4634 chips... So if at all the 4377 on 9,1 and 15,4
T2s is in question, right?

Andre

