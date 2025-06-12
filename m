Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2407FC71149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2brnDyX2RdfWZaowl+U6ywciKsVMQieC6WvQHg1iV8=; b=QgYBiBbxd3sQkYQWe44U/UJHw3
	VAlLERA7R+64EsHyrijYKOnAmLxBDnzO9FJas0qTv7gA49mj/8Ggcs8QgDNBPG1bWilaNjMtElfAm
	mHULTpmhFshshJYEAZCLJLI5VcblwLDBTi2Dt5ILnRZX6dMIx1qKi2LL2fzxO8qJJ5lEhnQINJTly
	rQ26xvOpvYasj0UztR1lPx/gAbqg4LVaY5UoZrnv/OQJ80F41Q+f+SDH7Z93XF/Pav6/+Tf1JmUVO
	kJMHDGAgKrbtIOb4rEc43yQ2Nzr7F34NrVruHb/7Jjsjx3GcWOlV2CHqdpGAEiEM4aS78NzhoFmIP
	Evse2zjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnqY-0000000EIpP-3GT0;
	Thu, 12 Jun 2025 19:44:23 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjUd-0000000DjEf-1n5F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:05:29 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id D44AA13805C6;
	Thu, 12 Jun 2025 11:05:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 12 Jun 2025 11:05:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749740723;
	 x=1749827123; bh=F2brnDyX2RdfWZaowl+U6ywciKsVMQieC6WvQHg1iV8=; b=
	Jm5Tqtx+yk1k2lGRaFOeo2qQR4+VMyseQTEKG42iSTo9P6jMwKWKxgQ9Iwqk6iI8
	lf4fGeCpzFFE+CgHlMxYSKP7zDq3J0XJU5nE3OnUbiUXlQNC9rb8DH2Oy3ZX5JcR
	0NFR3yQVoi9d+qzJyiSgmqMxE8EJp5E1Rb2JejI7NSlWJ4Jrn18wiLF8okqYWsVa
	RXMQrTG2ZS9n4vnc/LqLV5cp1n4H6Yyg4GQZ7HWrboQo3Vrsf94Q3IiSeDn1oFRQ
	7yMjlxnr4iej+yMzGhOfwJY5T2QdSwL0ut1df66NsRC11gxZnzSi/3r+F7qa02ZJ
	aRP74315z5Sz3fwtha7yUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749740723; x=
	1749827123; bh=F2brnDyX2RdfWZaowl+U6ywciKsVMQieC6WvQHg1iV8=; b=J
	VD8+AvqEq1VJvmoypW5EPfC3mFllRnFuJEfEg4zHvXlMukjVmaSZhryCTQbm3eaA
	0Fh1XLNxOMOhIWizIcdPuTeoA4MktyLzHHdnlhpx3ostDMYmEocxybbp9dHl6qfN
	DA0/06CZPn/GDkq6ZDNm0U4RxAnktIvU2GA9jXGAvfT8GzpW+w68gNtkQdz6D/Cd
	KjI8ayYWSu9P+dHHezgD47utUXkDoEQQrAtvDw9xBzSJduPsz/6ppYVwz3VnrqC9
	Cl2OoM/RSaslVa2HtpTZWoTlB/h1sFP9WkMSvOGdqjF3R0ehRw+l6iKc5c9xpvLb
	UKcROEiF0juumr9gIrtug==
X-ME-Sender: <xms:s-xKaH34P9m8uz7hV427SUVGaDNUksqr_CYe9SDRYAHlDcO9vnyodQ>
    <xme:s-xKaGE3r7qLnHcKobFcB0f3aQZuhWhKHKLHHKEqFwDl28BUN8EpOcenxen5G2urQ
    0Dm-xaUlEnI6fWY89Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduheefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprh
    gtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskh
    hisehlihhnrghrohdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieek
    khdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtsh
    drihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhl
    ihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshgrmhhsuhhnghdqshhotges
    vhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:s-xKaH4SKAslg6GaVk3KwslqGGvlTgs9tgucsMNFsvLValYWOnOmlQ>
    <xmx:s-xKaM1_uFV8rVSaGmZtdIio6EoSJJr8B3qXjtCAu64uAPCFj3L6TA>
    <xmx:s-xKaKFcoBVn_K_jB5B61X_GRyU0rPYMVnwc0v4jMwnMUleLRlCsBQ>
    <xmx:s-xKaN-y0st34moHmInI4RYu2-ubKc-ELP3A2tpmXDnj7iR1jrQnkA>
    <xmx:s-xKaF9tXKePnpmYLrwW5E9xrOPmpcVk5d3Z3GQFRQ9tqykg9UqvMB_n>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 186A0700065; Thu, 12 Jun 2025 11:05:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T0983471eb64d6916
Date: Thu, 12 Jun 2025 17:05:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Sven Peter" <sven@kernel.org>, "Janne Grunau" <j@jannau.net>,
 asahi@lists.linux.dev, linux-samsung-soc@vger.kernel.org
Message-Id: <b8783289-6670-4254-9049-786ae7cdd6a1@app.fastmail.com>
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_080527_956061_ECFA9FBD 
X-CRM114-Status: GOOD (  10.71  )
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

On Thu, Jun 12, 2025, at 15:44, Krzysztof Kozlowski wrote:
> Sound drivers are not essential to boot boards or mount rootfs,
> therefore in effort to reduce the size of kernel image (and boot images)
> switch the ASoC drivers to modules to decrease the size:
>
>   vmlinux: 152864 kB -> 154528 kB
>   Image: 39391 kB -> 39067 kB
>
> No difference in resulting include/generated/autoconf.h, except making
> modules: SND_SOC_SAMSUNG, SND_SOC_SDCA_OPTIONAL, SND_SOC_APPLE_MCA,
> SND_TIMER, SND_COMPRESS_OFFLOAD, SND_PCM, SND_SOC_SOF_OF and
> SND_DMAENGINE_PCM.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> If patches are fine, I will take them via Samsung SoC.

Nice find!

Acked-by: Arnd Bergmann <arnd@arndb.de>

There are some nasty interactions between DRM drivers calling
into sound drivers for HDMI audio, but I checked that this is fine
here because of CONFIG_DRM=m.

