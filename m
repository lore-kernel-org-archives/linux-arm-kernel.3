Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B140C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yM8i5FvIFIlmOfv14Kb5YSEjxQ5hZ6nkxPnVmlMU1Wg=; b=iEmxJCbGbkOY8OhdKbctenLgxs
	/nYipJxHof2ohSVwkYCqcycAz7Ojkbldgf1NRNjJOYqS8NTm5jtHbZnJvwRXZKHW2FvGXTp7xT6jm
	/0M7ljytM5cMfW6kB8uORI0gwWdBkGpyzu31LKBVxFbOkR1oBt9Lb1lQ9bsTwbDzhhLjCNhbRIUiz
	w3cNYWsdiTLteHFGt2tYa71JMwDwDZFYZYClxDeBW+Vg5y3yzPcp64Z4j2vgZXsujpS1HxGjSioQz
	LmLXcJefpBFGHEQThq92U41kyQ6LKXlqnf596uegZQzpXgS/CQN2WpDVUgxLqlO0l8tHsCu+VSDa8
	NJ9f/uqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknMr-0000000Dxgq-0tEL;
	Wed, 19 Feb 2025 16:56:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmBB-0000000Db1k-12BW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 15:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yM8i5FvIFIlmOfv14Kb5YSEjxQ5hZ6nkxPnVmlMU1Wg=; b=mA2ADUPYSa5WW0zC1z55tmLEGL
	CfIpSpglb8yESLtY2Pa+4slEZcKIBdcxCKgQQrqYCg2V+IiHazw8th4fs8/BxJjV5iYtqViQYSXS1
	zxC/IwpChFUIuSAMdPz9HnENDypT5I2qWh3paw1KoJtfNwUihBgRwkrSY1nbCuQpCf0yLc8AcRsTp
	0eU1Rd4lIM3a/GN2ksUK1dOBFcZS6EZ5K4G2TjAFme/lJUcUtoL0GbJ9IWGnZSux2RKFqAO7TbEcx
	EijnDFXoQ7+DbcZ6CsKHZWtwEb2a1h4rS9ztOH6SoHm2BqMzNUxhLt88ZuZCDa91nH6khBunub1qU
	fWhqeYiA==;
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmB7-00000002Ft0-1hCr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 15:40:04 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id AE183138099A;
	Wed, 19 Feb 2025 10:39:55 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-10.internal (MEProxy); Wed, 19 Feb 2025 10:39:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739979595; x=1740065995; bh=yM8i5FvIFIlmOfv14Kb5YSEjxQ5hZ6nk
	xPnVmlMU1Wg=; b=TQvtLg8DSzJSEQUXeOqOIDlcnH9qkH0bSZyu7i7UdvzbIlgl
	TL1f1XqGWUSPD2B0OMJczkCLj7yObX5qlym/C1qDOcPaLUaJJdisU6DWyd3qQiCW
	WbyWd0Kwlzzx1LRcktUvztHOKd3kwgDqzZzGLnSEBtmPybEsOyxLuSzheJla1fc6
	P3iG06UelS0uvjlkUSZc+NRqrWN1d4QgzHzxJnzu3xAu+Co3djHoC0JLlvptszAv
	3pccvsVNf0ND4iveqrHnRklhO16/DST+HuGBAkmRHMjCg6AWTU0N5NkOiSd+c+bo
	CvNQOJ583gEJthBuY4+aPk8Ga+OvE0rZIDruiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739979595; x=
	1740065995; bh=yM8i5FvIFIlmOfv14Kb5YSEjxQ5hZ6nkxPnVmlMU1Wg=; b=P
	LBxrmDmWKXdq5Q95t82qxGvq8dPQ3F3xQorIhnQnh9UqPEVwj0sugo8gRNsFvXdl
	WAONl11zXFmuQUXscbMNkplIQ4/EvB3ljbf7A16XzGruCykLkoYqcS6QnYDZCX1V
	w+is2BVlaAhz93L+/0wgtYoKEb8va7xmmFt5TmcvwbhjnnbMG3szJo0lzUL45/yy
	IpziIiSplzjJXdmOVIuFT0hG4JeD1ucpqCGFYJ8+seK0WyOkcTgQnrRTmc3JDfuT
	zPFQ/EoKuZHZIywOu58o7yR5diVXk2Trm625bXwDiX/36mP4JTbBmmmUcqedR3Mr
	3I7X/u+idOjPVKHCNURtw==
X-ME-Sender: <xms:Svu1ZzJLfe0cVjoF9LdBJtgfXAKqp7C2poRQx-1g-TUCJq8U0PhVig>
    <xme:Svu1Z3IM9qVJkCNDiYPD2Kmf7JtRJX2ObB_-yX4mfDmmNFsujTaK1c2PM6bI8FbZP
    xQ0ucokGzKykZmzMKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeelfeetueegudduueduuefhfeehgeevkeeu
    feffvdffkedtffffleevffdvvdeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghr
    tghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjohhroheske
    gshihtvghsrdhorhhgpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgt
    ohhmpdhrtghpthhtoheplhhinhgrsegrshgrhhhilhhinhgrrdhnvghtpdhrtghpthhtoh
    epfhhnkhhlrdhkvghrnhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopehjsehjrghn
    nhgruhdrnhgvthdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhm
    qdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhope
    grshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:Svu1Z7sQagXCXImMH_hnqANaHEBR4ZfrQ8jM-MuSFz8jvG0d3O-FKA>
    <xmx:Svu1Z8aNeHRscB1mqVgv9NvRU6e-SbuLDDsnCSbI9hA2Ya7aJkpRhA>
    <xmx:Svu1Z6YFgIm3EL2_H3oH3SuUGc3w7h1aW9ioyyFo-9bX98s6o1Yh_A>
    <xmx:Svu1ZwAohDpAkzRn2IiemR9ieb6u7ER4JTQvIdSeawV6yy5_PijJmQ>
    <xmx:S_u1Zyp5COJntRW17ipM7Ayu_QstX7Z7hBh8yjM7wZAlsRgHUv_hhhHU>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9B8C6BA0070; Wed, 19 Feb 2025 10:39:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 19 Feb 2025 16:39:34 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>, "Joerg Roedel" <joro@8bytes.org>,
 "Will Deacon" <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>,
 "Hector Martin" <marcan@marcan.st>, "Rob Herring" <robh@kernel.org>,
 "Janne Grunau" <j@jannau.net>
Cc: "Joerg Roedel" <jroedel@suse.de>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Asahi Lina" <lina@asahilina.net>
Message-Id: <d6f24197-7f2b-4c12-9014-94e31a9aa6aa@app.fastmail.com>
In-Reply-To: <20250219-dart2-no-sp-disable-v1-1-9f324cfa4e70@gmail.com>
References: <20250219-dart2-no-sp-disable-v1-1-9f324cfa4e70@gmail.com>
Subject: Re: [PATCH] iommu/io-pgtable-dart: Only set subpage protection disable for
 DART 1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_154002_318946_9705E5BF 
X-CRM114-Status: UNSURE (   6.72  )
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



On Wed, Feb 19, 2025, at 10:13, Sasha Finkelstein via B4 Relay wrote:
> From: Asahi Lina <lina@asahilina.net>
>
> Subpage protection can't be disabled on t6000-style darts,
> as such the disable flag no longer applies, and probably
> even affects something else.
>
> Fixes: dc09fe1c5edd ("iommu/io-pgtable-dart: Add DART PTE support for t6000")
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@svenpeter.dev>


Thanks,


Sven

