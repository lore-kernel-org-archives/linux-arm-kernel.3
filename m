Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C77ACD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 19:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScHxK0KjwcDjCF7wIFpDfscF/na+ZbrKo5E+v1XgI3Q=; b=TpWyAUfh4LqxNmi3GmAt+Po0jp
	yAyxRgxAEXHoS625JFVQQqS/NNhrTm+Qsi1aoKB6lEGBLgn/VwPu2qdonUConBU4hNf36kErXEofH
	6rBpIBI06WKyHEmuCT27wqgw8YseZtJ0W1F2FxZf1LVBn8kxWuD8ndOUN7zzvUVoahkY+rn1GHeMK
	4hsxH562cgknQq7JIYt7ywW0vn83sT6EZYcRZ3cueH4Bh7Tuc8eckhd7ohMf0bDfYKPzt7XcZh5hL
	NU35z8e3ag7wYev3db3OEbH2sVFuWsi+HG3faqTGukF9JgNkROmn6ww2Kt3ckAsNvyiHDlrmffCd9
	XvgTN+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7n1-0000000BUnc-1CSz;
	Fri, 12 Jun 2026 19:43:39 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7my-0000000BUn3-1L1a;
	Fri, 12 Jun 2026 19:43:37 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 634811400080;
	Fri, 12 Jun 2026 15:43:34 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 12 Jun 2026 15:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781293414;
	 x=1781379814; bh=ScHxK0KjwcDjCF7wIFpDfscF/na+ZbrKo5E+v1XgI3Q=; b=
	ZGjGA/FNU+I271Pne8RdFpKjp55QCYbk0m/C5MJz1SBrzVAgXdwwRGeE8Ne2Wjg2
	8WknTpaLh8uq0nEHe64FJ/bsR5leVrgiy5O3M5QgnglCy4DPGMQ9j/bvnLyD46eh
	mFrPEPnIb8EmcMdPQiW9/t6+g+GrbT7eu4iQ0gjwiRMSEISujCcJvMKWMdBiBn54
	RSF4dRKkMAapi7zLrGR/FPag/3W1DkAMqo3XTS93JdMaRXoI5VGv6dTyeP0e8PmN
	nU4GfVV/VLIfFkIqE1sHG33Awnjf4beCiops4EPBcX/3LXwUBlwxSRCcULd2lDwo
	/00DYrl36GV8ZqsGFkymPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781293414; x=
	1781379814; bh=ScHxK0KjwcDjCF7wIFpDfscF/na+ZbrKo5E+v1XgI3Q=; b=D
	o3Bg+HHJnuac9ktNURT3WRam2ihewmNQxsiMm6c0HYB+4a2ZHOOWFRdi/8bL/P6v
	+unfUms/KCGQoOLimyglYpq+T3B22E8jhHuFNoYfrlnlwlZisf1TCSZgnDjFemqq
	ldlNtTS+7knuXWuEZoCXRw6vn6yeLKzPz9ALEQl6dCYpLljmYg0h0a0VEWqq0p16
	o2m+T0ydl+SwSt0qJyU9gM3Clk+irpwk4mDq+OnhicM405bjFM4ia/VeGNd3YyYG
	+15sDbslvMAJm8OWb57JdSTsUnGcnCmT+J7Nmlh86PL9h52sjQK23N1xlqi3DwnZ
	yxBF+FCeB3rFX5hndN7kQ==
X-ME-Sender: <xms:ZWEsaozEC-9WnkaD73NzstBFX80Jgz8jzet7FwnqLyaKbrftABv-jQ>
    <xme:ZWEsanFLN896QHPogvtjFIuuu4NghPDLLqxBWX8-oHPHjDBZQM87GaMR3aKy9Nqv8
    RY3R-wmusXm8neOk16ltZuh0MDeKM0j4R_lHNA61EmAORjZ5FA1YUs>
X-ME-Proxy-Cause: dmFkZTFZ7zD3Be8B30SaPbI6nkvYJJfGP2gTYuDGgUG73DODbZQp82HeUaNu/TitzBkHG1
    Bm6NVvqGTGV7y//ssMJjzYKMPiywgRQiaiT8BVVkQn6I7ky78pM7QStYJ7VpyHQ42GDCte
    HrZip5gfYkod+IeYjY/36Uvqp52bP350VDvjnLnC5e1DtyystUv7YtrSolpVWyTuPzZwyz
    wZdbors2yB7lsgP0OZaEFEFu7jrihO5UeH4fnwoSS9V8vXJF+GE7Jrf7GJ32aK99B1hOUt
    h0jhEawH7CZQDSD94l9OuB/sR+qwVzcUOcSgi9JUGI2CcEQTGimB7m4xrZImaf6If7A5qK
    pmBsoyOg3KQaqkCxtHxDuFU+qkYECpUUj0ODpdbVX1yXN777h5x0TkFhpYHyqEUOuuQUH3
    bUtNOzZfLUuKGArifAXitz4N9E2FgDahk1cDTk47x6cdL5IPcMbvJnDo3GntvAxF6rW/e8
    uocXx84MXuUy0i/tqXTX32XW6K/mYhiNTfwDqWiHrGKmhLV4uVssFRMn4XjzN/4LVlDkxM
    U4FtDaruULz9UCzR6Unhwp6ldDfaGAipl4EvrmHFa2kxzK+MZ0MXYmqlgl5ipWUtWcs+/p
    OlFDDWws2EM3w3L9KUBl30iVzdNa+XzF4xVQUY/PYOPBDlQiyx3d5ymCfMhw
X-ME-Proxy: <xmx:ZWEsatoCUK_FJIacnjEVzkR_R0GDHj2sahnI55ohaE8E8TMXyVmkXw>
    <xmx:ZWEsauKaA1RYhMzamZzOIRJQL1CwYEBqL7f1HpMPPuSlvIMIUxznow>
    <xmx:ZWEsals9JmXoCGYd6oKZZbyXtnng3SVc1bdWAzzPQg7PML0EzfjBpA>
    <xmx:ZWEsajB1x8jherg_MCaV56p44EdsSOJPrBDFRstaDB1hDwPGemRRKg>
    <xmx:ZmEsahLo9-hEGbgIc4j_NhjXsaiv9ZenPUEte2YzEurQHG3Z7w16WQ6j>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D82FB182007E; Fri, 12 Jun 2026 15:43:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AXdheGxGYoOk
Date: Fri, 12 Jun 2026 21:43:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, "Felix Fietkau" <nbd@nbd.name>,
 "Lorenzo Bianconi" <lorenzo@kernel.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: "Shayne Chen" <shayne.chen@mediatek.com>,
 "Sean Wang" <sean.wang@mediatek.com>, "Rex Lu" <rex.lu@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Message-Id: <9370dc9b-a10f-4dda-8255-d59e9a8130ba@app.fastmail.com>
In-Reply-To: <20260611125912.3387021-1-arnd@kernel.org>
References: <20260611125912.3387021-1-arnd@kernel.org>
Subject: Re: [PATCH] wifi: mt76: fix airoha_npu dependency tracking
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_124336_643977_DF5C18E7 
X-CRM114-Status: UNSURE (   6.58  )
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

On Thu, Jun 11, 2026, at 14:58, Arnd Bergmann wrote:
> 
>  config MT76_NPU
> -	bool
> -	depends on MT76_CORE
> +	tristate
> +	depends on NET_AIROHA_NPU=y || MT76=NET_AIROHA_NPU
> 

Further testing showed that there is a typo here, it should
be MT76_CORE instead of MT76.

I'll send a v2 patch.

      Arnd

