Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C530C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 07:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pc/i3R0EsXUJAT9pg0+rOwqYu4pBq73rKzE1QpfopW8=; b=jAcBnIMoqgkk5f+6qXoluAElrp
	kWT2fpHnfwd/tKNrO/vJ8ywMU7cl91RzGGbEcMJPtMrcK4e2zKkO1+aDrqdiptRWpB0gRtQPVtXpI
	2d6sq/vDPy///wvtNOJUwP03Yvg4j1RA6GKvRj7t3umGuhTXNbHLnRzFusNHmUWH/MXuZFgGJcsn/
	Qq+JeDBLRPXzKbaDWXS3jaJ4s+jv0TlkwjNNB05j9CPsMl/z9dUpkk5k/U/Db/Q/J1D4rUXSQx68e
	6sb73+xfAf9GUaiXHgHQRCmsIb/3oRb0mQm46g0YVfAfTQAJqGMZLlZa0PC8ETb4NXoQv6ubZS9yc
	MdbHX+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21zc-0000000Gbqx-46Jo;
	Thu, 03 Sep 2026 07:36:17 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21za-0000000Gbq3-17Iv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 07:36:15 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hbBGw1d6bzKmTr;
	Thu, 03 Sep 2026 09:36:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788420968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pc/i3R0EsXUJAT9pg0+rOwqYu4pBq73rKzE1QpfopW8=;
	b=OxtpLIsjA7dmdhW4ZtU2eVetk7xtkvucKCvf0IpwuBWmFWJX8U2WmyyPU2SiutjZQHqlvy
	UalX1wTEMs2DYOkRJGbjtrDiClXWZu6fnB2e6Qz+v9K4blKnEHFJyGPxN0sRdDuiafZg44
	+mlojOVhvK0wJe8txf3wg44RUsE+GD+Bhy0znABmaM20chgQLaA/90r7bsczJwKPaWV+g1
	PmwmDSJhEw+XeZ8KmU89vQCtQPRfvC8Vmkz7Rq3S2/g2oha8xs0sAVmzau54zvXolu8UDE
	5NAP1gq1Z7+qfnnKFWTrGmEAIQyZS9Oyt+56vdjZYJB9f+/R345dGIaIogGR8w==
Message-ID: <4695582913c5f171a1b887eb0e3d2d4883d319d5.camel@mailbox.org>
Subject: Re: [PATCH] crypto: arm64/aes-neonbs: transition to kmalloc_obj()
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Kees Cook <kees@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"	
 <davem@davemloft.net>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon	 <will@kernel.org>, Cheng-Yang Chou <yphbchou0911@gmail.com>, Eric
 Biggers	 <ebiggers@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Sep 2026 09:36:02 +0200
In-Reply-To: <202609021314.8A9C0B8@keescook>
References: <20260830101714.625728-3-manuelebnerli@mailbox.org>
	 <202609021314.8A9C0B8@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: s7pfz4jjsjbq71k4ut1jabpb7qjd4p8w
X-MBO-RS-ID: 0a912c93b982c91050c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_003614_444084_931B202E 
X-CRM114-Status: GOOD (  15.25  )
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

On Wed, 2026-09-02 at 13:17 -0700, Kees Cook wrote:
> On Sun, Aug 30, 2026 at 12:17:14PM +0200, Manuel Ebner wrote:
> > I have a couple similar patches lined up but they could be automated or=
 maybe
> > the script is already made by Kees.
> > Kees can you make a script assisted commit (again)?
>=20
> This lead me down quite a long path to try to figure out why the existing
> Coccinelle script (scripts/coccinelle/api/kmalloc_objs.cocci) didn't
> catch these. The answer is the cleanup.h macros and poor interaction
> with Coccinelle. I think I've got a work-around built now, and I'll send
> a new tree-wide change to Linus before -rc2 gets cut.
>=20
> Thanks for noticing these got missed!

I think they got introduced after the big '+_obj' commit, this commit 652a3=
017c485
("crypto: arm64/aes-neonbs - Move key expansion off the stack") is from Mar=
 6 2026.

I did git checkout this commit and run checkpatch.pl (from Mar 6) over the =
commit:

WARNING: Prefer kmalloc_obj over kmalloc with sizeof
#37: FILE: arch/arm64/crypto/aes-neonbs-glue.c:82:
+       rk =3D kmalloc(sizeof(*rk), GFP_KERNEL);

So the recommended workflow should have caught this.

Thanks for handling this.
 Manuel

> -Kees

