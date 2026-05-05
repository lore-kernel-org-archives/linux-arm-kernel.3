Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5D7CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 20:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slB+JxKgDShuj1onoapW+Brn+Ree9yJxr7H7uqFs8aw=; b=zd7BRlzelxiYxvdO6ZQOwg09+A
	L6sWCaCGyVJM+yn+FdhUh+DNIQENg8zI15tMXs8ynwgwIjiKqwqUn+/hDNrUNyfhA1KuI5iEepHVp
	q5ksUO3JZ/OMjrpX0tNjM132d4BV96uO1RWMU2TYmevUir3Q9b8Yq3bszTjms4cwyuwnKW4yw9DUk
	uAiCcKEugESnyhiL1CdLeSiZ02r3tDqTE1aVckt+8EnIdgKbHkZOEzFX+Ct/kwjpa8TdoKyXHHU/c
	n9Wzrw6Jxv/WxzOUYx6NeSOtsaMxXYByq6C72rqN4T2h34TkiZnecBr3/vQzxB4Y1F3kE4jAAahS4
	rvof2gnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLx2-0000000HMso-1ovv;
	Tue, 05 May 2026 20:01:04 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLwz-0000000HMrI-4ARm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 20:01:03 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 159467A0115;
	Tue,  5 May 2026 16:00:58 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 05 May 2026 16:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778011257;
	 x=1778097657; bh=slB+JxKgDShuj1onoapW+Brn+Ree9yJxr7H7uqFs8aw=; b=
	SyXuXsibDWmDIvGMuropPfwcuhPTFJasgJ814kb872VG7zz+jfhpuPFklSJmasVZ
	jeG7qjRsdQUicowkJ6pn0IQD2RwtlGUhFGOqo8+rBD/nwT5/nL7K2gQvCHkbOHtb
	yIDwEzRjEpDlrBTGz2zddaxJf+KYA1ep+K0sQwEwuR7uxxobznlnmm1/IAJzAmjq
	uAEM+eDAMA4CUIX8q354pGARhd/xid/Te8rePIY1c53I5Cd22wARMQYFG/+rUzyA
	ijGIYoeBDf9GKhvdIzJc6eeqd74kwy/hdB+CYxChwPsGsee8XTWpXeXarHCevSIj
	la2xgiVMIRT2G0NBiAJT0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778011257; x=
	1778097657; bh=slB+JxKgDShuj1onoapW+Brn+Ree9yJxr7H7uqFs8aw=; b=o
	9M8oCnP6kBiG6H7REmllcEA9vbxYRXHE1YN7XW3T3sAkRrOOT/EGzRkzH9KkqsSO
	Gu84mhwPlwfvO8XD4mz9OrSB4p8WNEwYXyaGLqdsYKWoKGgFsceFe3rGm23UEhVF
	F+2+QvLoEGBOsD9+fJ+EKR7MlDQqQpLY0RpIgkjMDHg/40Cfz+zw/jZ1xpGFDhWH
	/aAL1HnWn5LklXJYKIQ2ESfCae1vlthtwlroe0sdGh2KHtkBhvECxq6rQz+Yiidv
	EcY5gpjGzs/iE6ikoLbprloHotkCOqSHMHu8BkgJWFl/e+CTz7gwwp3t8YfHNU/J
	1yu432ubdd7jd/9WHWGvg==
X-ME-Sender: <xms:eEz6aeEkyL6LFnsv5dbzI1ZOxl-USAD_mcTkY7BoA301IU65fhevcA>
    <xme:eEz6aaKtVAXCrDtWzgNmkUDS5jQlWcFETD9i-Uk3xRbBuYQcogtzIUQyZS_oOVz8O
    li5Ssoq9c4qzQCk0MZWKEird633sZh2cmNAUFv2ERdHeyrUapYpE0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddvieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosggvrhhtrd
    hjrghriihmihhksehfrhgvvgdrfhhrpdhrtghpthhtohephhgrohhjihgrnhdriihhuhgr
    nhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnh
    hkohesihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepthhrvgguihhnghesnhhvihguihgrrdgtohhmpdhrtghpthhtohepph
    gvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhm
X-ME-Proxy: <xmx:eUz6aWCZCSLFciJhpPxL7Pl9dH9wNxs1bk8_VLtkkjuHopEt6Ae8_w>
    <xmx:eUz6aW4MzRRYrXk4pLiAJ-YD4uy7bd0rbvWAm3ofT-A9AX1DU-IOmQ>
    <xmx:eUz6aV1A0WpD5PXRkmggGfhtZTkyIsKZJkabEgw9BjOnB0wNNfRnbQ>
    <xmx:eUz6aSmVFdx6OnNVW75NV-wF2yEIIl2qXZ2xyrF9LWiJQ_Unsqqw0w>
    <xmx:eUz6aWz-ZN1z3GIsnkC4r7cGLjdywdEPEvSDywam0Rp8ZgNwEnxCfas9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E3EFE700069; Tue,  5 May 2026 16:00:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A7hCdP3FbXcs
Date: Tue, 05 May 2026 21:59:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Thierry Reding" <treding@nvidia.com>, "Mark Brown" <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Message-Id: <ca83fbbf-e7d1-43d0-bb5b-0fe02644c91f@app.fastmail.com>
In-Reply-To: <ae-Hl4LZiZzCh8dy@ashevche-desk.local>
References: <20260427144658.3609647-1-arnd@kernel.org>
 <20260427144658.3609647-2-arnd@kernel.org>
 <ae-Hl4LZiZzCh8dy@ashevche-desk.local>
Subject: Re: [PATCH 2/3] ASoC: pxa2xx: push gpio usage into arch code
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_130102_457663_BE2694A1 
X-CRM114-Status: GOOD (  15.30  )
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

On Mon, Apr 27, 2026, at 17:58, Andy Shevchenko wrote:
> On Mon, Apr 27, 2026 at 04:46:30PM +0200, Arnd Bergmann wrote:
>
>> There are no remaining static platform_device users of pxa2xx ac97,
>> so the rest of that code path can go away as well.
>> 
>> Since nothing in the driver uses the gpio number now, constrain the use
>> of the legacy gpio interface to the architecture specific code.
>
> ...
>
>> +	if (cpu_is_pxa27x()) {
>>  		/* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
>>  		rst_gpio = devm_gpiod_get(&dev->dev, "reset", GPIOD_OUT_HIGH);
>> +		if (IS_ERR(rst_gpio))
>> +			rst_gpio = NULL;
>
> Have you seen my
> https://lore.kernel.org/r/20260415150412.365989-1-andriy.shevchenko@linux.intel.com
> ?
>
> Perhaps you can incorporate it into this mini-series, as it looks like that one
> hasn't been applied yet.

Done now. It was already similar to your version and after
addressing Mark's comment about error handling, I now squashed
it into this:

        if (cpu_is_pxa27x()) {
                /* Assert reset using GPIOD_OUT_HIGH, because reset is GPIO_ACTIVE_LOW */
                rst_gpio = devm_gpiod_get_optional(&dev->dev, "reset",
                                                   GPIOD_OUT_HIGH);
                if (IS_ERR(rst_gpio))
                        return dev_err_probe(&dev->dev, PTR_ERR(rst_gpio),
                                             "reset gpio failed\n");
                ...
        }

       Arnd 

