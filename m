Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B2D606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bqkX/Crj;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=uCkjDFcp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+Mmd9iz+6l+RtzunqHn07DyKAk1sZGUOJe891sWi+Nc=; b=bqkX/Crjj4cj/z
	nI2fZQBDtHWdizXQJyUmIpyq8LVEG/vPK57QFxQCNBNdrhnDf2RHojg6K9ws4SejrnF5K0BFuGf1/
	YpUqJCCh52mWzfA0oKEQDk6P8S+GOt4AUJt8k7Kd5UZeDwX1QVBZEsuc8u3ecmPMW6VWhLr4Ddl1C
	nADb4yw/D9Sd8OQgx9hm0FKfojDYuBriihm/0wtllFaXXY77cim0vZBX9891X48+/8DfDWdg/YKu8
	Nm9Lbq1GAl4y1Qe+bNZtOLoN2ShUefIkiy5dgwtz6nONZQv/oHTKyITz5qnLetO+bbtunUMify9kg
	YhHt1IjL530lCe6c+wpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe9C-000000064oz-3Yu2;
	Wed, 04 Nov 2026 16:47:38 +0000
Received: from bulk0.mail-out.lima-city.de ([91.216.248.212])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOe90-000000064kq-1UDJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:47:35 +0000
Date: Wed, 4 Nov 2026 17:47:20 +0100
X-Lima-ML-UUID: 1fb7ae95-0ae2-4b9e-9cfd-6a995782d75f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793810843;
	bh=+Mmd9iz+6l+RtzunqHn07DyKAk1sZGUOJe891sWi+Nc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uCkjDFcpV18IotsW2/mO8QwbUqz2kruKoz/mzn/mqm97aaG+9qIqQQTJxN136PzNd
	 1yLb/GTpobe0/76DBqk9c81b54TwUdcjye6wpIC1xwGCI/PdFT+W8fI91tr51/YV2Q
	 PDFyzzOvVF1PwGBr8m0eK8n9X3XuRxtIX6T1/ayXRqZ0ZFNIUCw3hh9sumtnWCeC9w
	 TmGfmORbv2YghVWGV8jV2SQ4FMN3DDwFIslRU2jhBYYkVLKi0KUEuqqkfg55xVjUcl
	 T/MQzMKJPsPBMDNbM2oFTn0QfyBYfjRAxOdj0IzHaPxbRU/wVWoMBbcaKllNCyqKwk
	 iXxxy/T5aREFQ==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
 neal@gompa.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 66ton99@gmail.com,
 josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev, Yossef Osman
 <Yossef.Osman@proton.me>
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE
 advertising report types
Message-ID: <20261104174720.254b7e00@kait2en-mbp15-1>
In-Reply-To: <CABBYNZLwMW68WYBVp=-R=4Mji+-Q5AEtrcu5F_7rRYju8d-XNA@mail.gmail.com>
References: <20261104151601.70493-1-dev@deq.rocks>
	<20261104151601.70493-3-dev@deq.rocks>
	<CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com>
	<20261104164647.5e9351cb@kait2en-mbp15-1>
	<CABBYNZLwMW68WYBVp=-R=4Mji+-Q5AEtrcu5F_7rRYju8d-XNA@mail.gmail.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_084726_827785_A3317D95 
X-CRM114-Status: UNSURE (   9.08  )
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

On Wed, 4 Nov 2026 11:29:11 -0500
Luiz Augusto von Dentz <luiz.dentz@gmail.com> wrote:

> Yes that would work. That said, I don't think it is worth adding a
> quirk for this. Masking the reserved bits shouldn't cause any side
> effects afaik, well except if those bits are later adopted by
> Bluetooth SIG. Then these controllers would become
> non-compliant=E2=80=94though they already are, as the bits are reserved a=
nd
> not in use. In that case we would probably require a quirk to avoid a
> conflict. So, is that what you are trying to fix?

No, nothing concrete beyond the scope, and I agree it is harmless as
long as the bits stay reserved. We only put it in the drivers because
our downstream ships driver modules through DKMS and not bluetooth.ko,
which let many users test it quickly. Let's keep 88397423671f as it
is then. I'll drop patch 2 and 3 and send a v2 with patch 1 and 4.

