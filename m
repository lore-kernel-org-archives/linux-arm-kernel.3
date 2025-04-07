Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585D4C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPULkuol+Ic13d1hOHO533ytujPHPGoJFOaw2W/s/9U=; b=EmFMUt/OYsZZHW1if5PTYglVv6
	YKM/54lshjDr8El7o19ceVNWeYoZO+/6h1D3RF8VYLmg5T/zf883HjHZlEEsZqP0u4Cm33+mtByTW
	KwmAGcFGvHNOD5LgySYUqTNYGpQKCu08FCnKyErx1cvqgAAV+JNWkNwTqCledOBp2EP4ypdnMzuPs
	ByO8a0l0IwxZSufHy1hTNTSkNMMb5IqRrIzP8eR0nM09ddwG37E8aEKCMCQOwNyfwzpoWzqZI6/yp
	XGG5xooZuRY4X2c3M2Mb/SoXPk7P5SfgQFIh0nKGJ0DoGxR+OmLPsD9T0g2w+74z3atWQpkj4OQWY
	3zrhUySA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hak-0000000GwkO-0d0a;
	Mon, 07 Apr 2025 08:12:26 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hQF-0000000GueP-3IqJ;
	Mon, 07 Apr 2025 08:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=vPULkuol+Ic13d1hOHO533ytujPHPGoJFOaw2W/s/9U=;
	t=1744012893; x=1745222493; b=QZEFYLlfk35glPyFnCjs6Bbm4pIdxOYtA5Tmm4PHF5jnPtZ
	cQZE6lZwFGFUikDT+29+6qhWR/65mmLaOhrDOEAqPwRr5/FAOuxTYg82sIHLLlsnaONDDG0JnKuvd
	z5MbXmLeNCifP3ngu/QPRagrq1BkUovycH2Kkeg1oZYMiEPfpRpvlaVw5bSAoYS/jn9RapI6BGWm/
	84Xj5Ysy8pDR1rV8R+01rN4/DRJZwdIe7x3ndC4uMIAGIPB73KXzq/QvbBa+fg3SDZ1CrgbNVKhdm
	ZDNKpmw2ndGtnOuslVTHhDaFIYD/N0fXwMZiTQJL8p+kt5JQmW7rhgqqPCIfG6kA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1u1hQ9-00000002E8o-03C6;
	Mon, 07 Apr 2025 10:01:29 +0200
Message-ID: <e26c752637c133290858d4acb6e5141a51181f8a.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mt76: mt7996: Fix null-ptr-deref in
 mt7996_mmio_wed_init()
From: Johannes Berg <johannes@sipsolutions.net>
To: Markus Elfring <Markus.Elfring@web.de>, Henry Martin
	 <bsdhenrymartin@gmail.com>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Angelo Gioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Peter Chiu	
 <chui-hao.chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo
 Bianconi	 <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rex Lu	 <rex.lu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Sean
 Wang	 <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Shengyu Qu	 <wiagn233@outlook.com>
Date: Mon, 07 Apr 2025 10:01:28 +0200
In-Reply-To: <b429eb4d-514d-410f-8443-7e3f40709951@web.de>
References: <20250407032349.83360-1-bsdhenrymartin@gmail.com>
	 <b429eb4d-514d-410f-8443-7e3f40709951@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_010136_095822_3E42498F 
X-CRM114-Status: UNSURE (   7.44  )
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

On Mon, 2025-04-07 at 09:50 +0200, Markus Elfring wrote:
> =E2=80=A6
> > Prevent null pointer dereference in mt7996_mmio_wed_init()
>=20
> Would you occasionally like to mark the end of sentences with a dot?
>=20

They did one out of two times. Go away from the wireless list.

johannes

