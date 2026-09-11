Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A51C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 20:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EbnYxGqe0xixbnmgwrnZwLddp9Ao1JEq2A2JzywCcI=; b=l/NiGxDF3xHEwA2SNIz9IyLPwi
	FJiFm2xjdV5QEUkPK6Jybst2HcoKCcuSov+tMQ3hOgmrrHfrBY/BugJ7qbKoAHuX5HkSzkcKqwBn0
	7CmldhFp8dVvqfw5hM52r3VuXfjteOe3t/fT2848MTlGualRImvlpOmUNa5prcEnOxkeDPD2OsNpT
	qK2TzrpbWFAeKtmurpmoxegu8QX977rV4FHvUqaowtbiU2jTjO8gru5XA1xtVGJV5+pxAdVJ2bL2y
	wuJFCmUQPInwC3hneDlbntw72VnmyttHJOd36buXrX67UKDc3zx//iYjrI0HI/CIUD+ZHjCdG2Aky
	fQKgM6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57h1-000000004r1-2cQs;
	Fri, 11 Sep 2026 20:17:51 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x57gx-000000004qJ-459w;
	Fri, 11 Sep 2026 20:17:50 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 53CA57A00C6;
	Fri, 11 Sep 2026 16:17:43 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 11 Sep 2026 16:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789157862;
	 x=1789244262; bh=6EbnYxGqe0xixbnmgwrnZwLddp9Ao1JEq2A2JzywCcI=; b=
	Wu7myXEuTU4nZbcOAv+QPnbuAtWv8/+K/zriRJrhRxjnzdYRc2AU7kih4tjN7u4x
	FPsmMYEUWPKmpkcz4FTBjjna/GZEu6Nru1MDgU/VVsvv3wkFIfiiLgrOlm5athXV
	EpLnTenvHSogbwrLX5VrFXKiUXCht2PmwLZZLGYIbi3lnq+TzGADNgyzdTR6vFpz
	vlTbWSud0X+E7Twqix/O2qWfs1WhxAbh7Kq3Q5xN1tM2zkW6O4QX0gM1O+FT8hoB
	6gqZyDW4m4hLgylpWza7RRsgJflSKPybgiWSft13eFyuR2TQCis0g56wedFzPDyh
	09uP9TuOXOGPVBUdOyPXBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789157862; x=
	1789244262; bh=6EbnYxGqe0xixbnmgwrnZwLddp9Ao1JEq2A2JzywCcI=; b=W
	fxl++9NU0d8tHTjJWeMiF05jlpLzcp5E3OeAHqL/90wDxsS+Vhgpg3kIsI9Bu3EU
	XL09lXtwZ+TWYQAdTdDPNoAelXZjVG5JszCpgnKrNwfkBR3mx8e4RAfVxJMB4C42
	8Prv6vqIIhByMUEZIjDYld26i7/H/cUexctkJsp/WgiVDoMn/NUt2Gd5j8/bZr2Q
	BsJhHiK7aak41f7vAr3VSyVeboF41dMBB0gZOK891Uswa7Os9v1gMNh3GFtdylxl
	n+EgKweNNNW+0DYXIwbBr6QpesBHrdh8SzVAwsgdWlTMYXsSnE4tjIUo0H4F+EJZ
	G/0U49j1q5y/trkLHXvhQ==
X-ME-Sender: <xms:32GkasISX4WbD9wG2rxBdBe9Na4bcX9xm_JDGLFHnSAeHgzRE7Cr3g>
    <xme:32Gkam8cvJaPKT-InblbjyT5ZdW3r4rROkjQqvt8SwiQcNb90L0c13Ez9e1WWDZYt
    o8zuYY1S1ZV1Ph152Mjx68Bl1uPhuNaKoSyMdkdovZZRP6W8uTGFgo>
X-ME-Proxy-Cause: dmFkZTGh0gLZNZBxe6Y5EwujO7h5YSAbLaol936kXjDbPkBTmCLtncegw+FJypwAB0cXMF
    5VBA6L86GAs34nb9D7LOw6xcYkzdt4dfxfwMc8Df5DPPw0PSZiraAEsYITNStpuvxYvP85
    6dvdSeWKu8M2XUSW2E+8odMexOEm7bEeGAV1bLv6IUDtMPL42JsG7nVzKQ3TCK37XXCqpF
    92nRhGgzUy7iM+hCgmBshWzd5f6IuAsIj1DYDhgRWpdZJnswQNoYDbW0rpqX/Jrupgz+Ox
    oX9VL28TkUhg+2x+ivO5QRzZ/lXB/ma/Oe2TQkZPd7YTZf0gQEzke7B2TrNvpS8cf5e7dW
    YRtQzOcaJqvDbyTDiI/oDLnR6om5i0xGnn+PB0k/ganOZxbe0EHjVJz18oZTNUAD0EE8km
    qZf/fwV/9PWYrKrL7rpucLFdTIAGYZkafGJloWzOICo1mjJY1zl1AAfpAX5gvKvkt96MCe
    0g6F6eYAV2zE9g7/JOD0zhd41ta7wMu40/Y1hfJ/ksIarblZHeIFSeF73Fqru5qQzxQ9Yz
    biMdM4KTC/yRDvAI9oPHDbpFetrxTvBTseI+nPrLrcgxdSAOAIkK2JJWNR/MoL23csKjlL
    RFJJ1UuW2r5iPkr1kmh8qX6hejxePJJHDk8MSoQlBO74jfJQy3+CfQtAjkAQ
X-ME-Proxy: <xmx:42GkaqkWLW_2vJQHOwEHI3pQ7h_Ufp9XzEukJ1yf7GqRnnR9rf2R2w>
    <xmx:42Gkas2MNrwkQq_g4iUQMQl8VCOd2jaIkEptHlnfzmC8IFqtis4bMg>
    <xmx:42GkavRzfofbrj818MWgcK61z7kwSf12vFAwP0UXtZXA5hPaqKEUcw>
    <xmx:42GkasOoPcljqFc03VdUTftLcTXe_oRivwx_b_Y3omoLYCYky55G9g>
    <xmx:5mGkaqQwkNj47I5B8l0Garx2qvsPVJE3iphHAgJ8dCMedEAhlmY2b5NE>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C7F7532A0081; Fri, 11 Sep 2026 16:17:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Atvpn89t2M6-
Date: Fri, 11 Sep 2026 22:17:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bradley Morgan" <brads@mainlining.org>,
 "Paul E. McKenney" <paulmck@kernel.org>
Cc: "Frederic Weisbecker" <frederic@kernel.org>, neeraj.upadhyay@kernel.org,
 "Boqun Feng" <boqun@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 rcu <rcu@vger.kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, "Vineet Gupta" <vgupta@kernel.org>,
 linux-snps-arc@lists.infradead.org, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, guoren <guoren@kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 linux-sh@vger.kernel.org, "Chris Zankel" <chris@zankel.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org
Message-Id: <a817a6ed-7345-435c-97bd-a394b90e8366@app.fastmail.com>
In-Reply-To: <20260911192540.20983-1-brads@mainlining.org>
References: <20260911192540.20983-1-brads@mainlining.org>
Subject: Re: [PATCH 0/6] Add two-byte cmpxchg emulation and wire it into the
 architectures
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_131748_685698_DDFB5DC5 
X-CRM114-Status: UNSURE (   9.65  )
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

On Fri, Sep 11, 2026, at 21:25, Bradley Morgan wrote:
> Per Paul's note, Arnd Bergmann's platform removal series was
> checked before analyzing the users. It removes the imx31 and
> omap24xx CPU_ARM1136R0 selectors, but INTEGRATOR_CM1136JFS still
> selects CPU_ARM1136R0 until its scheduled removal in early 2027,
> so the ARMv6 path in patch 3 is still live.

I can still restructure this and pull the INTEGRATOR_CM1136JFS
removal a little earlier. At the moment, this is part of the
patch to remove CPU_ARM1136R0, which I had planned to submit
once the arch/arm/mach-*/ platform removal patches are done:

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?id=a8cfcc5533e33a

I could turn the mach-versatile/Kconfig change into a separate
(trivial) patch and add it to the platform series to avoid
churn here. The armv6 cmpxchg() code would still exist
in 7.4 then, but be unreachable.

       Arnd

