Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DA9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 15:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNqt5U9GOUsRRqGjKu27jmxa6soUqk9YUPA7tKq4cmQ=; b=e1EkaXQyo0OUlakdlErFXXn6CH
	0+k5dmSN5oNcWM523qy3NsVNuZPbcjF3E9Tka3zpSNlHDwtAIEtHMosilx8fSsZx1U8V+DOAmsz+v
	H2ecbTGp216zUDmYwRpQuMkVYoHbqweMbo+dq6yQOYJWW8yQgOtQcOKD6aQ6pvc4WNf6QoQo1d6Gb
	GbRDaCDeWQ4kouMqPeExkMW3KkhIarA4F8F1NCPmXNvNLVKWUAO08NL7PdQXrqrrGzLnVxZyYA4vM
	GoErYJ2GI0Z/llA8Q0MwHkt8YElcAvuJyqXA03O8KOqoFnoOnwI9oiHZcQxr6GbNxjUQUJzTqnd+0
	h0Abw1YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkPeN-00000008mWL-2rjG;
	Tue, 18 Feb 2025 15:36:43 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkPcR-00000008mA0-3uat
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 15:34:46 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7A88825401E6;
	Tue, 18 Feb 2025 10:34:40 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-10.internal (MEProxy); Tue, 18 Feb 2025 10:34:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739892880; x=1739979280; bh=vNqt5U9GOUsRRqGjKu27jmxa6soUqk9Y
	UPA7tKq4cmQ=; b=tDb+G7QIGPYi+Fs+28MJiKIZFjovpT+nbWDuHk9SCVY7vG8B
	FDE+Oj3ct6izKaBhS8TTZrdJJF2zcGypfbY7eMaR5EUknH27Q4+oIJltEVQNI1LG
	zdoAcncw3B16d7+EK9rmqfxp1E09wLJrxiANy9g8ck6YCzzpJvg9O57HZlGPkvCE
	BxPLSYql2SuHy41fvIv8dbvYHX73gMAKTn9MPvqoT7031TVIewipcPZFI17XdFwJ
	Tm3UX86otR7V1GjxL6faowXM+ABjsGAN6iNvJFg+PHW0+2FvnQauPunSYsSJhvKy
	X2Ivblu9sHz2k2oNJTEJF142RIe+7pQ7wP8bqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739892880; x=
	1739979280; bh=vNqt5U9GOUsRRqGjKu27jmxa6soUqk9YUPA7tKq4cmQ=; b=T
	SMrSP2fsBeXreOuMb300Z2us+GwogmneAy6jSBBlMkE2DpFiIeNShZCJixCWBmsj
	N9N2ek/z+T99ppO8D+MBSelQu46TrnLyf4VmyGQl1uhKkbYK/NN6BhWHL9UA4r/i
	AFcFsb+7/TYPv9RFDaYLhQ3W9ocB4iwq/G9rDJ/f7CddKDZyYHKPkJbbWxUhqTwk
	p7FtlSBmWbLwzyLmf1hSmAr+mcoQq2Tli+Jfq3rcvr6PqHtvex5NxnfB+6dGzozw
	+MEQT8PcmbHYZSZu+x17VnLVXmJIrRus7vNZ1S8NJIcFpPfkoPczFLs6yELzlREq
	78IhWrDxwBcvnHMzmIlvQ==
X-ME-Sender: <xms:jqi0Z4nMHOJMaKq8uG_NlDxLPaw4n-vggnNKA9xjP5O_bl8OWzpscQ>
    <xme:jqi0Z31ISMrHY9hMU5YrjERGwn_v5tQSLO3CnnPAkOab1N-ZgOpyuE8JzHg6qzc__
    7Cc6WtJf4x-TMsTdP8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeeutedtleeiuefgjedvgfejvefftdekleei
    gefgfffhheehkeetleehgfetgedtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghn
    sehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhhinhgrsegrshgrhhhilhhinhgrrdhnvghtpdhrtghp
    thhtohepvghrrhhorhdvjeesghhmrghilhdrtghomhdprhgtphhtthhopehjsehjrghnnh
    gruhdrnhgvthdprhgtphhtthhopegrgigsohgvsehkvghrnhgvlhdrughkpdhrtghpthht
    ohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtth
    hopehhrghrshhhihhtrdhmrdhmohhgrghlrghprghllhhisehorhgrtghlvgdrtghomhdp
    rhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhioh
X-ME-Proxy: <xmx:jqi0Z2qDg0I7zAF77FbLuIaV1_8_wROYP2UYLMvCln1_tUcZQgGytg>
    <xmx:jqi0Z0mcq9CMwg__3FKOFptFKMlafcmGjCb3mchG7931NM9T4rmRNg>
    <xmx:jqi0Z23lCqX-FAKEjK0lSMxxuJj8DFyJMGJDDOCStSLrbnSsfBnskQ>
    <xmx:jqi0Z7s5JpdjaV9TyuvDZ5uPko3ClOed0aWVbeyL6WyXaX2WzH-Cng>
    <xmx:kKi0Z_usWWPE6CYtwzc8mZU67wVkMuPUMnI7L_RTvOCU9obF1tlfrnA_>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6AEEDBA0072; Tue, 18 Feb 2025 10:34:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 18 Feb 2025 16:34:17 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Harshit Mogalapalli" <harshit.m.mogalapalli@oracle.com>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, "Janne Grunau" <j@jannau.net>,
 "Asahi Lina" <lina@asahilina.net>, "Jens Axboe" <axboe@kernel.dk>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 "Dan Carpenter" <error27@gmail.com>
Message-Id: <0e609fea-48b0-4b39-aae4-90395a782ed8@app.fastmail.com>
In-Reply-To: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
References: <20250212085853.1357906-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] soc: apple: rtkit: Fix use-after-free in apple_rtkit_crashlog_rx()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_073444_704987_D16C4CCB 
X-CRM114-Status: UNSURE (   8.94  )
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

Hi,


On Wed, Feb 12, 2025, at 09:58, Harshit Mogalapalli wrote:
> This code calls kfree(bfr); and then passes "bfr" to rtk->ops->crashed()
> which is a use after free.  The ->crashed function pointer is implemented
> by apple_nvme_rtkit_crashed() and it doesn't use the "bfr" pointer so
> this doesn't cause a problem.  But it still looks sketchy as can be.
>
> Fix this by moving kfree() after the last usage of bfr.
>
> Fixes: c559645f343a ("soc: apple: rtkit: Pass the crashlog to the 
> crashed() callback")

This commit isn't upstream yet afaict, did you mean to post a review comment
to [1] instead?


[1] https://lore.kernel.org/asahi/20250202-rtkit-crashdump-v1-1-9d38615b4e12@asahilina.net/


Best,


Sven

