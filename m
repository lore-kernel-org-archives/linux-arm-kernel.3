Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB799CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 11:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXmiAx9QJn5Cd4yX+kpBqr8qGocn6PX/S5rUjKZ/oEw=; b=YSiriVI0qoQ0zVBbaUrgEDxvic
	3iUlfdD7fF3JkoZQVahbJuntWkv7JBRzr9nIfyC2Fe4pNK0MvkQH73MevdEPjXPXarjTQbw+0SiJh
	6QcK+Leh29GoQnoDjPxGsyHaemzd+/mo/BbVDfTr/TeJNtB/i26S/CjMu3Cd1v1o1KtQLtq5R4olj
	KoOa1z77wYX0u5I8rVHL/z1T0hCSxuL4y2hr4f/5Tz6l+2mWf4raAahOJsH8dAqRH9t21Ffx0Vhur
	79advTw9cc8GYCJRVnr+Adb3ivn12KHR3Sz0XFSWUCl0tQoP5mtS5bJiUFINP6GOeNqRmY5XKrz2k
	bJPtg/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsfz-00000009jdW-3kkT;
	Mon, 03 Nov 2025 11:24:43 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFsfx-00000009jcr-11ts
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 11:24:42 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 486CA1D000F7;
	Mon,  3 Nov 2025 06:24:39 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 03 Nov 2025 06:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762169079;
	 x=1762255479; bh=bXmiAx9QJn5Cd4yX+kpBqr8qGocn6PX/S5rUjKZ/oEw=; b=
	uPcwANjMBuMOSClbNsjXdfT3jFROU/h7nz+9i3Y3hq8AWCFhg/ouUyVIaRU8Z+Dk
	6cyrvNf4nthrGeQfHrmytYKkXQE/fXhJ8QOoSILRjPBVjW8ZyMaU6kekeV9zlA1g
	hmDHvnnpMzlOYfl8DJTVR25RkrZW/s0e71Sns0yncVsVhVFQo+SDQ32di0C1EyTX
	S9QG1md4NnVaCHzy7xkfhondN3q0AELEvIYmH9tZl9btYaxmlIClA2hEBEjU26f2
	7RmYm8g93mzS5+UOquXtMtnWbBCFqV1eUumWpco89/pr/0tuhPeAUBzh3znQq8IG
	n3A3zwZxKQlNQjC1cVQLvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762169079; x=
	1762255479; bh=bXmiAx9QJn5Cd4yX+kpBqr8qGocn6PX/S5rUjKZ/oEw=; b=y
	8QrTOGXT5IS5WAzIx7Uxk1bhBEHLz0onjHgb85OjRhMjy1A23najjhgb0lQYx0tM
	QeSzhG7DRF/aaf+uaBNQGbkl0jhm79UDMY6mrjRa3Jkr6Kba6hgjwwZmgt6neyqJ
	Zle3bINXobLTeqQR2R83h7sVhN4Q/PTMHa1FbL9K8DKCutWlCEJVLbhhHUdQj8dM
	npbLCjOdC2G4AW/6LH4Uk8AvVe31i+XkRf0WATqQCSNxMRFNC9CWVFcS0emuZO9B
	AqByD9aGxfb3oLXoKd/hdTfNc4HMeYcyN2Ztyf5QiUv13cJO2zXfXxkOP+8y9Lft
	my048fBXkCTYsrpI07EDg==
X-ME-Sender: <xms:9pAIaaEFPup_UWc6rDldMqa6lN0E2r5vG0zzsR8aO-48DnnxNDabwA>
    <xme:9pAIaWLfcR9uPDKU5-SBwiNvj27AP-JpnT40vzrFsVqBuRievBr3poR1-cY-ayjPV
    7yxRpXutFexchPtebCYsrLsNFHQnt8K_FfXReyEwoXTlWGqjCZx4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeektdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkedvuefhiedtueeijeevtdeiieejfeelvefffeelkeeiteejffdvkefgteeuhffg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigsegrrh
    hmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepgihivgihuhgrnhgsihhnudeshhhu
    rgifvghirdgtohhmpdhrtghpthhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegsihhgvggrshihsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtoheplhhinhhugidqrhhtqdguvghvvghlsehlihhsthhsrdhlihhnuhig
    rdguvghv
X-ME-Proxy: <xmx:9pAIadrwJyiUtStMoEUrK7D-CXsIwlXoXVSkkUCB-bXjHqnOWB2ssg>
    <xmx:9pAIaR5tKw8evsjbfFrAPgADcKX4enfqrj6m-xMQ7yyreS_ekfGnZg>
    <xmx:9pAIacdFcgD0OwpLiquAUFAZHgf9d6jqUDnHeaE38dcTF2goGu2Egw>
    <xmx:9pAIae7te0_n__Z2-c1AnqnAie7zru13R8WWasdpiABzt-KrnfjesA>
    <xmx:95AIaSfVtn3q7NWQkkFNtQquBId1rUbzpywIiRd5xzZy-YKm4R6n1JnG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9599A700063; Mon,  3 Nov 2025 06:24:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A9BOEV1KOSwF
Date: Mon, 03 Nov 2025 12:24:08 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Xie Yuanbin" <xieyuanbin1@huawei.com>
Message-Id: <740b1a09-24b2-4473-aeb4-490ac42da7c2@app.fastmail.com>
In-Reply-To: <20251103101545.760243-1-bigeasy@linutronix.de>
References: <20251103101545.760243-1-bigeasy@linutronix.de>
Subject: Re: [PATCH v2 0/5] ARM: Remaining PREEMPT_RT bits
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_032441_588951_17A58F3C 
X-CRM114-Status: GOOD (  17.05  )
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

On Mon, Nov 3, 2025, at 11:15, Sebastian Andrzej Siewior wrote:
> this is the last batch I have to enable PREEMPT_RT on the ARM
> architecture.
> Last time I posted them there was some discussion about making the
> branch predictor hardening worse. I redid it hoping it improved now and
> does not make it worse.
>
> v1=E2=80=A6v2: https://lore.kernel.org/all/20251029155918.503060-1-big=
easy@linutronix.de
>   - Allow to enable jump-labels on UP. The UP build does not involve
>     stop_machine(). Reworked by Arnd.
>
>   - Instead of forbidding HAVE_GUP_FAST with HIGHPTE enabled just
>     disable HIGHPTE on PREEMPT_RT. As Arnd explained, HIGHPTE is rarely
>     needed.
>
>   - Don't let ARCH_SUPPORTS_RT depend on HAVE_POSIX_CPU_TIMERS_TASK_WO=
RK
>     which in turn depends on !KVM. Since KVM has been removed from ARM
>     it is sufficient to unconditionally allow ARCH_SUPPORTS_RT. Noted
>     by Arnd.

Whole series

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Looks all good to me. The first two patches may clash with
the work on generic entry that I think Linus Walleij (added to
Cc) is in the process of rebasing, but I think that is fine:
hopefully the special case that you  adding here will just go
away after Linus' patches, so everything should be fine
regardless of which gets merged first.

Linus, can you have a look and confirm?

      Arnd

