Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54B7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fbu3o1viLABP5wwcyk1daQb3Sd8DU0YDTxiJGgrhldU=; b=PodUmNaRbaA7CY3+2ZP13MJZuZ
	dpLGWlez/Jy8ehKndMRiOw2RM0ZBsnLepScz4CHG6SKPGuQ/qhjeHYI8zTzdhsStvLdSnBpqWZtzv
	1OL5+2bjZnpK//j9N2GazNjFH3bColaJlooiLXjXKkVavp3fVhYOmxkqo6QkORqN+bR55R+tpE4sA
	M5fNaoHUKMYFJlvGGjQCl9Q0jpAKH940k7Vd6ErWtbULPV6Q++qw/tWE6GMUCDyO5uSDwwtbIztHp
	c5mofvOlqyvMSYnD0qGNlmywUeUZNnfOSmK3UaOp+tfuwIRvXpfQmRGs4yJcFjdC3on+CBKuz0ghx
	aYpYzfNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIq7p-00000007NDe-1Z8y;
	Tue, 11 Nov 2025 15:17:41 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIq7m-00000007NCW-1TJT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 15:17:39 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9D07A140008F;
	Tue, 11 Nov 2025 10:17:34 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 11 Nov 2025 10:17:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762874254;
	 x=1762960654; bh=Fbu3o1viLABP5wwcyk1daQb3Sd8DU0YDTxiJGgrhldU=; b=
	VUti9/T3aO3GOccYKmBXHz3ZdrMX+USsxgD0amkzVk56cWDvANDlSlFQnHoL7Kx0
	gqEWgqKdmekAvqSegPZhBB/5VzCy0IM4F7lPqffkCugMHgGDkyp3I6eZh7ddCGvV
	hA0cxUAa+uI3ad1XJVOLENV7i+WiczHGeZQjWbnmHYNjPqLoqK7NcKziXqoliPoc
	IUV0jQAO17DR9PYC76X53DNKjYZD/3+eZFq/wFwsOLc6VMQWnQTGJsMteX9rOhzs
	bVZOd1XOAmlfy4F+hT2XaPCA4Pc7ftIQjgA3tKXdUFDNJ7WTY3qtmOBV1dbjgDeD
	EBZB0Z8Il4CbhJDK4hPowQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762874254; x=
	1762960654; bh=Fbu3o1viLABP5wwcyk1daQb3Sd8DU0YDTxiJGgrhldU=; b=a
	MeGcHzISOSoh5+tCaefsiGr+j19DZT0+mU0YUmRIjtJpgZTg2e26E2A4PEW9HOH3
	Jb9tZVhL/KiLA+NRSd80EC7s9lLyDvQcjvT/C/zuhh7chKjARrBKdMV3G6lQ5zsR
	Tj8CapfRm4uP8G6a44DNsWRQkV6K0pLAQhRPLGnMPzn3kLx5qR2BIroXs2xLv0Yx
	oWjK2iFzulajNzAYY6d6SMihuTQDMeToY6lZ/QaXlC6S0pOsS8p3FxvOuKbNrFAG
	6D6I0ArYxUqJwPaUbZjK2BEZK+802ZtUF3YtDDJveUnofKoOhnA89uhsz1otvjGI
	pGX50DBKVNdh//PkUdiVA==
X-ME-Sender: <xms:jlMTaQQxtKQ-WgNTjxRcDDZ6uukGQ2s03XDaITI1-xtpUfxA7dUNyA>
    <xme:jlMTaYlKAYhESnDvbZ3pVH0MWYlUE7qq6crNRXpVZmLmk2xXjoW_dwvPODCMmF070
    uKYWslmioMtNCV-of0BfjPHvf_xnJj6e3ceW9-eL_GBoL1GGRY4H_Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdduheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepgfegkeelgeeuteejkeevjeekjeeijeehiedvteeghfdvvdetveeiuedugfehhefg
    necuffhomhgrihhnpehlihhnuhigrdhorhhgrdhukhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggp
    rhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigse
    grrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepgihivgihuhgrnhgsihhnudes
    hhhurgifvghirdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinh
    grrhhordhorhhgpdhrtghpthhtohepsghighgvrghshieslhhinhhuthhrohhnihigrdgu
    vgdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhrthdquggvvhgvlheslhhi
    shhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:jlMTaU2k2-P6zMJQgGny2FLIzH1cIO1K-TAnCaWgBbTNQXTCy2ZtBg>
    <xmx:jlMTaRUn7JWQaNE-MOQNT06EcmtP5qagvghBQRpUNVOqZ4syBuAbzw>
    <xmx:jlMTafJdSSnYdOd4HB7dpcblw4vGBoyTCA_VuShPAuRJoRHuk3g2KA>
    <xmx:jlMTaT3aa4RdA5wnMtHX-cCWmEp73qXsAS9dWpGWn_oeyQDvTng9PQ>
    <xmx:jlMTaQCwAqvl9XRUFEp7s6TE3RBJJhlJh4sHdsi4-i9T6ar8kUGG1nPn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0D718700054; Tue, 11 Nov 2025 10:17:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A3J-1TSmcyGB
Date: Tue, 11 Nov 2025 16:16:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Cc: "Russell King" <linux@armlinux.org.uk>,
 "Xie Yuanbin" <xieyuanbin1@huawei.com>,
 "Linus Walleij" <linus.walleij@linaro.org>
Message-Id: <8d7c55f0-ba20-411c-93c7-bb354614c0df@app.fastmail.com>
In-Reply-To: <20251110145555.2555055-1-bigeasy@linutronix.de>
References: <20251110145555.2555055-1-bigeasy@linutronix.de>
Subject: Re: [PATCH v3 0/5] ARM: Remaining PREEMPT_RT bits 
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_071738_461212_C94829CE 
X-CRM114-Status: GOOD (  10.19  )
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

On Mon, Nov 10, 2025, at 15:55, Sebastian Andrzej Siewior wrote:
> this is the last batch I have to enable PREEMPT_RT on the ARM
> architecture.
> Last time I posted them there was some discussion about making the
> branch predictor hardening worse. I redid it hoping it improved now and
> does not make it worse.
>
> Is this okay now?

Looks all good to me.

Please send the series to patches@armlinux.org.uk according to the
description at https://www.arm.linux.org.uk/developer/patches/info.php

You can use

$ git send-email --add-header=\"KernelVersion: $(git describe --abbrev=0)\" --to="patches@arm.linux.org.uk" --suppress-cc=all


     Arnd

