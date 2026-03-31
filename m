Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC314109B489
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4NXVOYIByLH0dw7F6K+jnkUFHgQldz1RlrfDEcu4sE=; b=y9MMhGuunmXMtl/ZDi9zw+dtIb
	zzvTYJ8I7R0KsN5HsnNsPzsr4SVRkQTTPEobZna1LHVoqfn5jxUfZNOjHoyFqQZ2cpe4hIXX1593V
	gKAJfWhSEf+8c9K85ZQhJTQt8v3xgCH52qPH8XqscbyEZV0J8+a2fCuCxf0R+92OcqvDiHADXm5bM
	NSiW9+wXf5APzh5wXQ0JrrwKKQzBPePf0Dn7XWemSQT20QsljRlg3KBdI+wANAFijp/ZaiiNIwqXm
	1YZAhow53iimkIfinF9wvKubkwITk5kQNn80RDoxlvAzAaNx2I8eIcdG9d4GuWuuxeNODhNkexlJV
	HXCnWNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7b13-0000000DBGe-018G;
	Tue, 31 Mar 2026 15:28:29 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7b11-0000000DBGD-01Th
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:28:28 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id A1B1E68BFE; Tue, 31 Mar 2026 17:28:22 +0200 (CEST)
Date: Tue, 31 Mar 2026 17:28:22 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Ard Biesheuvel <ardb+git@google.com>,
	linux-raid@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 0/5] xor/arm: Replace vectorized version with
 intrinsics
Message-ID: <20260331152822.GA8238@lst.de>
References: <20260331074940.55502-7-ardb+git@google.com> <20260331151653.GA8011@lst.de> <2176aab5-2167-4cdf-9090-0f8e0a6fb5a0@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2176aab5-2167-4cdf-9090-0f8e0a6fb5a0@app.fastmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_082827_184920_C993EAA3 
X-CRM114-Status: GOOD (  10.06  )
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

On Tue, Mar 31, 2026 at 05:26:33PM +0200, Ard Biesheuvel wrote:
> The RAID pieces are going through akpm's tree, right?

Yes.

