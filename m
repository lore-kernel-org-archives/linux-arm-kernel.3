Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17A7CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 06:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:
	Content-Type:MIME-Version:Subject:Cc:To:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ie+W55aaySDpp/ujiBmo1lpU2QKHOUUyDBu+hkl9G/c=; b=3c3PYwytuDOQ13G6ruu2yXZT1a
	9c6vc6NYcdMVjZMJRRFJR1qDZTUK9h4YFOvyPmCCVNEEhoKDTrdyUBXzEd7iTfmmLFcxTTmx/ZZN2
	XdEwvOAg8fXuWQSrbxnKnNoBF5jML/1tjYyUDVWS+xKWZGOC4BDVIh/b8L2KHpwXYvuq7GV4J0c5w
	YY+fv/SwuG76MJqHNNuHkLH98aofCAZeD/5TGx0ih9el/f8YYnq8UjlzxuOVWvUo5YuU9FWFaUx8R
	UP3q7pnFwIbjQCpgwAMhaQ2YI6QCvAyGjVHc+dmBTgiv2RBP9VNePiFC49lFIymA5eQc/r7vVrVKo
	3vTXgT4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6FT-0000000Fyhq-3ZOF;
	Tue, 21 Oct 2025 06:53:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6FP-0000000Fydr-1snC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 06:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761029610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ie+W55aaySDpp/ujiBmo1lpU2QKHOUUyDBu+hkl9G/c=;
	b=SyQ4ZT8h/rKAPkKJsu852YuFdOJO1POiALEbBllEmfYxXGpwGxphbh2+SYiKfkO2nOsKBH
	5ZirHTlagH3kE+LH9Z82fmpdX/7+4c3TO7jHVQRJAN4ACYeRULMM6fmmSpBtkxf5SQk/1Y
	eqjenpWNId085nlQqgctzpmoIrMARqU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-206-y8__IppnOXib6TI3-h_FDA-1; Tue,
 21 Oct 2025 02:53:28 -0400
X-MC-Unique: y8__IppnOXib6TI3-h_FDA-1
X-Mimecast-MFC-AGG-ID: y8__IppnOXib6TI3-h_FDA_1761029606
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 63B5D1956067;
	Tue, 21 Oct 2025 06:53:19 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.57])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF088300022D;
	Tue, 21 Oct 2025 06:53:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251020005038.661542-18-ebiggers@kernel.org>
References: <20251020005038.661542-18-ebiggers@kernel.org> <20251020005038.661542-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, linux-crypto@vger.kernel.org,
    Ard Biesheuvel <ardb@kernel.org>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
    linux-s390@vger.kernel.org
Subject: Re: [PATCH 17/17] crypto: sha3 - Reimplement using library API
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1431989.1761029594.1@warthog.procyon.org.uk>
Date: Tue, 21 Oct 2025 07:53:14 +0100
Message-ID: <1431990.1761029594@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_235331_584499_756B91C6 
X-CRM114-Status: GOOD (  12.01  )
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

This needs to modify Kconfig too.

 config CRYPTO_SHA3
 	tristate "SHA-3"
 	select CRYPTO_HASH
+	select CRYPTO_LIB_SHA3
 	help
 	  SHA-3 secure hash algorithms (FIPS 202, ISO/IEC 10118-3)

David


