Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EB6CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 07:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DU11/Tr79cSSrMHUNkMp59yAjz/GPUE0u3hy/HX0Khw=; b=iqlHpKFmFuQx62iXgrXsHWC4Ek
	NikZJJeJPB0P6c0t6sJC3g/9YNi1flEThHsYN4r8tS79gZN3MgkcPrv47n3yKNBkk0tOGS62gRCtw
	tRIg3U3DspQ53r/WCoIcBMmPtaE+sIqBWgMUbhZXJadvt+/xrHz3TVbPdY144YA1mgy5CVtLKa4bO
	w1gvvLV9W9ZWv0j7CUzJV1wdOvc0gLX4pfbC8W0Cw42vwYpQTJFmO5sT5R5GDIsXzkLmZ5/QbxDT9
	UCKK14HXGtvrLvNxb9gzF4ATjy1npJ/RVM/b68Ht5Eiy0NnFrLQseuNmMRpPD/pB5v5ZqFoeFSxBs
	9gR0xtoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8s4-0000000GWKZ-1LOY;
	Thu, 18 Sep 2025 07:16:00 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8s1-0000000GWJm-2h0B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 07:15:59 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 546A2140008E;
	Thu, 18 Sep 2025 03:15:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 18 Sep 2025 03:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758179754;
	 x=1758266154; bh=DU11/Tr79cSSrMHUNkMp59yAjz/GPUE0u3hy/HX0Khw=; b=
	rFqZdDmzA2sHs6qelE+PUc1TQm0t28Q0OjaWqdAfG1wBl5nAvmpMBpBJ0H0MtZG9
	8GuVONn2o97BcBFfVu2driscQ7kWlBqlQr/KHBVD7m5++dsthNHYD5SjfHAj3Yr0
	Xlaq+rQQ2otYQhRoCjfYZEfR0ZPMjcYFKFJTKmKeUI9FnhC0XMamZn+IniAS7RGB
	lWzVfiCSnQzPaRII5ew3gv/ZvkX7WP+GQsum6MSQN8jit0PidX2oyM8e5ge4MZvB
	obiHuyJKvgRLFQIDNEOJ0qg2se+RuzpXCEVkPuWjKHFZTZBCbSCOOC521dl0Yats
	sgQ4qC2FUaPM/fLa08FzIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758179754; x=
	1758266154; bh=DU11/Tr79cSSrMHUNkMp59yAjz/GPUE0u3hy/HX0Khw=; b=I
	v9YMUd4i+kjXzN5QcWtQcZzxLekJDd5uKpR3aTaUjVxQg3OlK0HBJ/9ZalwZvi3r
	PCx+xTH7An0qlGGzKMttDnLbxZRsjp97SwhyACCIKcG36wnGtcXoxKMTkzqTTqgr
	w3tv2/eGzlM4RM8cOeOkEuuguWr3w0A6brmrrrchSbSREp2IgfaWcB4TU7ORov4+
	Gb4W2idOv70qoA/ZDWB6XnV+eJupa8nFWGHkZ29MttR2eLb/C+Z4Iu8vTFXTnAD+
	OkSt5kzKCgKUGVi5XhVKXSF0qC2PCWjYYUP9lIICl0Pk1I+Ib54J01dq7xijf2Ac
	coYRnq3tIiRn2x7GrhSxQ==
X-ME-Sender: <xms:qbHLaBdp_JkgrwdsLhPziaVYarONhdn75Bz-uRgeiqho5DCNi4Mj2A>
    <xme:qbHLaPOEDXIwb9yYGc7XgZ2aefiRLZ-DU9GfclUFSLu-UoFj0l-8ONXkcYDL1Gh_M
    N2vaCwD7LbdswqHfqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegheejtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprhhosggvrhhtrdhjrghriihmihhksehfrhgvvgdrfhhrpdhrtghpth
    htohephhgrohhjihgrnhdriihhuhgrnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    sghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    phgvnhhgrdhfrghnsehngihprdgtohhmpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgi
    drtgiipdhrtghpthhtohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtoheplhhi
    nhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqshhouhhnugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:qbHLaFK4PNHQyUqkHV_dgUof_om4S-pFHPkFmxvywGbrwGEfMYMD2g>
    <xmx:qbHLaA3phjWFaK9SbPYeHWmJRYj5osTWZoTX1vMOxI6KVQxYEYfs6Q>
    <xmx:qbHLaJVuR4BguJkrwHX95pqxH8UYFKbwjiZLjWwhdBsJoi00N9qIdA>
    <xmx:qbHLaCM3buqUl0IyL-4GjBWbWTjcfRqWCbijTVXMRNLi46Z_WcnADw>
    <xmx:qrHLaLymjW7F2MjNYIzgRU6hQBKT1o_dmIy-nCb3QHPXpS4je08F33XI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 83F6A700065; Thu, 18 Sep 2025 03:15:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AIKy7lM-vHXJ
Date: Thu, 18 Sep 2025 09:15:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peng Fan" <peng.fan@nxp.com>, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org
Message-Id: <fd5451a1-9720-417a-915c-1ee3149426f2@app.fastmail.com>
In-Reply-To: <20250918-audio-v1-1-e9d0df5c60d2@nxp.com>
References: <20250918-audio-v1-0-e9d0df5c60d2@nxp.com>
 <20250918-audio-v1-1-e9d0df5c60d2@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: codec: Remove pxa2xx-ac97.c
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_001558_211600_C498895D 
X-CRM114-Status: GOOD (  12.89  )
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

On Thu, Sep 18, 2025, at 07:44, Peng Fan wrote:
> With commit ce79f3a1ad5f ("ARM: pxa: prune unused device support") and
> commit 2548e6c76ebf ("ARM: pxa: pxa2xx-ac97-lib: use IRQ resource"), there
> is no 'pxa2xx-ac97' platform device created by machine level code, so this
> driver could be removed.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  sound/arm/Kconfig       |  10 --
>  sound/arm/Makefile      |   3 -
>  sound/arm/pxa2xx-ac97.c | 286 ------------------------------------------------
>  3 files changed, 299 deletions(-)

I think you are right, I was sure there was still a way to use this
driver either as part of sound/soc/pxa/*, or as an alternative,
but now I don't see how.

If we do this, I think we should just merge pxa2xx-pcm-lib.c and
snd-pxa2xx-lib.c into the respective callers in the sound/soc/pxa/
driver.

Robert, can you confirm?

    Arnd

