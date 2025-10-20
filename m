Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71118CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:
	Content-Transfer-Encoding:Content-ID:Content-Type:MIME-Version:Subject:Cc:To:
	References:In-Reply-To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o06m2Hf5UOiIyCqy5/tbbq/q4Q+Pk/aECUU71C46ncU=; b=mYYMEybPg4Aur2BkwzKEsyRLGh
	yOJSl74Si2U5+/Fg2VX6yXK3tObMsrdJ6QZ4dqrfPFazeepjjAYiC/8zw76mKGAGHa8Ohi7Db+ymT
	drQcIBEFRKj0u5EFg5xA/zzNP/X6oBiru7EsCz3nyWLVlnwwMtAoFau51fnNyjxmnS/xeqpc9HcC4
	G1ST3dogxfuZELL1excVZHAA90i8gojaiNBvUoahEMYMYtRRoK1fIWoJF68MeKOzKXbMkzh9ifRbM
	Pxqq4tXi1t+7hcptZphursZ74n+wehmSAqv9aEDr4weQLVnJxAMU7tzGnuLRkmNjj5MWFU2aiMMtJ
	b81T3ulA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnIg-0000000Ctgs-3ggf;
	Mon, 20 Oct 2025 10:39:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnId-0000000Ctez-1OL9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760956774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o06m2Hf5UOiIyCqy5/tbbq/q4Q+Pk/aECUU71C46ncU=;
	b=X0APQoRqG4r8SHjUT6z6for62AO1S3ksB4p6aImUj4Ov/vquGJhIBLQG+MpBaxwtc6cYKq
	/jE8qGqiToJmATb+bcHUqw3dMjaNKFxh3XnTP3XiCF7bOWwpDQG1RmRCH7vKXm4fCSbzmt
	QIKh2NUAkVw/dFHFmajeLJynFHc5pxk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-547-e6ZhlrVvPHugF73JmB980A-1; Mon,
 20 Oct 2025 06:39:31 -0400
X-MC-Unique: e6ZhlrVvPHugF73JmB980A-1
X-Mimecast-MFC-AGG-ID: e6ZhlrVvPHugF73JmB980A_1760956770
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5900B195609D;
	Mon, 20 Oct 2025 10:39:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.57])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 458EB19560A2;
	Mon, 20 Oct 2025 10:39:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aPXfzd0KBNg-MjXi@archie.me>
References: <aPXfzd0KBNg-MjXi@archie.me> <20251020005038.661542-1-ebiggers@kernel.org> <20251020005038.661542-4-ebiggers@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
    linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
    linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
    Stephan Mueller <smueller@chronox.de>
Subject: Re: [PATCH 03/17] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA3-512, SHAKE128, SHAKE256
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1062375.1760956765.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Oct 2025 11:39:25 +0100
Message-ID: <1062376.1760956765@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_033935_461905_5A7F6A87 
X-CRM114-Status: GOOD (  14.61  )
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

Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> > +If selectable algorithms are required then the crypto_hash API may be=
 used
> > +instead as this binds each algorithm to a specific C type.
> =

> What is crypto_hash API then? I can't find any of its documentation besi=
de
> being mentioned here.

crypto_shash, then.

David


