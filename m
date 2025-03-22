Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9F8C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSMXTmA7NHlO+etZYtz5b3FTs1rltNj6XepKrdcM7Vw=; b=IDnnnNjAjHDLQ3QZHxkkSemBAT
	D2N/Vu1qbZPaoCzMcjEC8y9m+jhcveHcCadC/bRjDQSuHQIwLS+H7W0VNjYg10kYJEQBQ30Wyn+cf
	eMOQZNeWLx7SrwS81YJSQbYkd0QO7Pw3nd6COW30pOSS69xpqP0gyL1rqFBpJtgNv0Ceb16V5AD/h
	W0uOf0sdt2zg7gaYtxNpUgALp9MJ4ZK48vEwrzFPeLqRQbgHnhDjLSxXKQ03qYWqj3/7fMNqV0X+h
	UM06DLvYDz23WP1EbB9S6e4ItneBL6MYztrA2Q93Y7SRlGpdrHUgl4GLCSGsm2P+lnkB2eUu//QPh
	0/kQq2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw1D5-0000000030m-1lnv;
	Sat, 22 Mar 2025 15:56:31 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw1BP-000000002si-1TjK;
	Sat, 22 Mar 2025 15:54:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=mSMXTmA7NHlO+etZYtz5b3FTs1rltNj6XepKrdcM7Vw=;
	t=1742658886; x=1743868486; b=Q6TFQaYl5CX/o0vJMOmAUcUk/ZyIdAwU7tLROf9JHibAsH7
	DvzW1RMKEPsOyVeTzpaO/4sIJodDEE0OAm/zyxVTlG/bQoPzNVokw3cew4h4CQFaaq4qyKluCb4MJ
	iClZqANzQMzweSvW2FxTW/gFku8padxJwYCTcq3rtP0kP0sgT2rZYYVSpID8NH7IXJ5gFqll+Ub7o
	d/E2N+fsUxVmOV9r+mkrP1Ya6IYQ9bjAR9RO8+Zueabg6QxwktzYravux2MNBlebgvXO0SrLcJFRD
	tmMM8LixaLtUsPbG2XSYDIHQh2i5nrAiz2m5WF2Ytn8ucC5uSZW6JqgAoejnBVgQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tw1BK-000000024Ph-3HW4;
	Sat, 22 Mar 2025 16:54:43 +0100
Message-ID: <92d1a410788c54facedec033474046dda6a1a2cc.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mt76: mt7996: avoid potential null deref in
 mt7996_get_et_stats()
From: Johannes Berg <johannes@sipsolutions.net>
To: Markus Elfring <Markus.Elfring@web.de>, Qasim Ijaz <qasdev00@gmail.com>,
 	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Angelo Gioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Bo Jiao <bo.jiao@mediatek.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder
 Lee <ryder.lee@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>
Date: Sat, 22 Mar 2025 16:54:41 +0100
In-Reply-To: <d1df5d97-4691-40d4-a6cc-416505f35164@web.de>
References: <20250322141910.4461-1-qasdev00@gmail.com>
	 <d1df5d97-4691-40d4-a6cc-416505f35164@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_085447_388963_2498E9FF 
X-CRM114-Status: UNSURE (   8.03  )
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

On Sat, 2025-03-22 at 15:55 +0100, Markus Elfring wrote:
> > Ensure phy->mib is only accessed after the null sanity check for phy
> > otherwise the code may trigger a potential null deref.
>=20
> * Would you like to use the term =E2=80=9Cnull pointer dereference=E2=80=
=9D consistently?
>=20
> * Were any known source code analysis tools involved also for
> =C2=A0=C2=A0this software improvement?
>=20

Do you really have to double down? STOP. You're just wasting everyone's
time.

johannes

