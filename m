Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854B7CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-ID:
	Content-Type:MIME-Version:Subject:Cc:To:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6xOn+OgWXQb76sNinZ8VoFwbnnrNk5YxBP2M1Z16Rw=; b=WGsYPTY4QAZsNkqgL7IzU5V7a0
	ju5XQIdpFd8Z7VlBeAzJtiICOtltAvBqEuybTlRc2L7lviZPMnWtopeyG+8v3YtHhlHXhFmXIzWKY
	Um9hhUydEctNJgP3ZOdvIk4XRfF0JOjv6hqd4UBwx63b5zP7Ev+0YPA4wgkWF0yr9t1O4CFRD3xwv
	Ut7DelfllmBFtp2K7yw/O+V4nKcKOtQL+ek00Ao/5MJlW/RbZpT9yNmBKVSkA5eTinacYC26BQfLN
	CDIFA/eO4Ds97hgxHQ7LGiJCdZxOeSjs02wLU5eFeFFjBonR7e6nC0EYOKNOKu2RVbgfCWcFbGAYL
	yH9zAb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnEt-0000000Csq4-1CMU;
	Mon, 20 Oct 2025 10:35:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnEq-0000000Csom-05Sa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 10:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760956539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6xOn+OgWXQb76sNinZ8VoFwbnnrNk5YxBP2M1Z16Rw=;
	b=XfFYU10eYFs8PvAtIXEVwf/pHUhDJqxdAQ0rSqfNlR0Nk8q/THTWAyYxrVU6+dOdS3WgTT
	z1E/WQjgvTf5siVwOUM0pqhpuFBJY+GfrNRd84RuRZf6nROPqPymew1/dHmyuEEsO6upTR
	6kwvfdV2VQKCzBIq90vDxLBjhcsODeo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-v350hqWrNxSXvlNLKw2vdQ-1; Mon,
 20 Oct 2025 06:35:35 -0400
X-MC-Unique: v350hqWrNxSXvlNLKw2vdQ-1
X-Mimecast-MFC-AGG-ID: v350hqWrNxSXvlNLKw2vdQ_1760956533
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C0B011800657;
	Mon, 20 Oct 2025 10:35:33 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.57])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC77A18003FC;
	Mon, 20 Oct 2025 10:35:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251020005038.661542-17-ebiggers@kernel.org>
References: <20251020005038.661542-17-ebiggers@kernel.org> <20251020005038.661542-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, linux-crypto@vger.kernel.org,
    Ard Biesheuvel <ardb@kernel.org>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
    linux-s390@vger.kernel.org
Subject: Re: [PATCH 16/17] crypto: jitterentropy - use default sha3 implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1062227.1760956530.1@warthog.procyon.org.uk>
Date: Mon, 20 Oct 2025 11:35:30 +0100
Message-ID: <1062228.1760956530@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_033540_192862_114CA6FF 
X-CRM114-Status: GOOD (  12.45  )
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

Why don't you take my approach and just call lib/crypto/sha3 directly rather
than using a crypto/ object as an intermediary if that crypto/ object is just
going to wrap lib/crypto?

David


