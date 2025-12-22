Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057A2E6ADFE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 20:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbxaNpLxFAH3dqMAl+p1IRk5i2JFW/cXOJCZG2bLHVQ=; b=LVIRkrqD3gaelekFCRvolIlvb+
	nFcrn9wZBQWVVT49W5qw5+/hSxD6DXyz14TvconYqbo0K9kjpSkJ8RlwPi0M/DK7+EawYZxUSwJY0
	MZ/4fdKpT+wyQM8f1IwwDlIX9gQGR8vlvRm++tTC/N9lA5m2KK0Tg8STD/s3C5FNmG7W1ENgnQmlC
	9MycW9+d8yU030tHZXr8ON9yXfJp6kolOkJYsaKeGXvCapNqs1h1oWZI42KsVxUD62O8wssbZVUdh
	T/6W0rDZGRy8yTaDFrH51ac0XivvdvxXNclPZ77WIkX6ZShZntgttdm2WOKy5bqduGq8mqF+AMQaG
	WEE9Tb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXmox-0000000E9e5-0VVy;
	Mon, 22 Dec 2025 20:47:59 +0000
Received: from mail-10631.protonmail.ch ([79.135.106.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXmot-0000000E9d4-1Oyu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 20:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1766436472; x=1766695672;
	bh=rbxaNpLxFAH3dqMAl+p1IRk5i2JFW/cXOJCZG2bLHVQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MLK8f6kFrt4HaO27kUwVilQF/dtxIh+J/vyaqkpzIGDx9Zt6VU5EGUiBVJTkuGxmm
	 WKAl9fPWKpZOn7aVb9GHPp8SqCHsuSI5BfevxaoHXGlJ1s1Z5hlB2kzCArnQ9Ao4PI
	 ilYuyrKXH2s2YvfSMrVUeOtwd+MD6B0qbwrVJ/bmUcBkIjrGtytFZX1c90H3HkQCho
	 nwu+5Hq1d8xVLnzv1jElb9z5ji2bMdRFLmZ64vzapurn4aEmNG/UvSMv0tCObMsiys
	 y2QibfvqWHdubaTGSIYHFYZ8lXSGh9vBYHyIzGk9Mm1Iy1/yUrklUkPxWLgYT08vZr
	 BnRkP9YawosbA==
Date: Mon, 22 Dec 2025 20:47:44 +0000
To: Harry Austen <hpausten@protonmail.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: fix buffer overflow bug
Message-ID: <DF51GPM5N848.3L90OHP3XRWTV@protonmail.com>
In-Reply-To: <20251222180437.1938-1-hpausten@protonmail.com>
References: <20251222180437.1938-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 7cbfe6dc198c2829d8087c095262b79223caa22b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_124755_535334_926A0503 
X-CRM114-Status: UNSURE (   5.24  )
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

On Mon Dec 22, 2025 at 6:05 PM GMT, Harry Austen wrote:
> Prevents attempting to read an extra byte from the origin string.
...

Ah, my apologies. There appear to be a bunch of emails about this bug alrea=
dy.
And an existing patch [1], which has already been reviewed. Please ignore m=
y
patch.

Apologies for the noise,
Harry

[1]: https://lore.kernel.org/all/20251205161202.48409-1-mikhail.v.gavrilov@=
gmail.com/


