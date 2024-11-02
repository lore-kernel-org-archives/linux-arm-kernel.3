Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE53BE677F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYa+7XoJuDdb76oEmaiyHNPbnto6CbOy5cbqLih549g=; b=0RXyWhXRzb6DdvVLiQ98aNnoS+
	EFzdYf+61rLto7r/0xVElCJLxCn6Bd1Mvc6Hi+RXD7/LQkMBr1Uqp0eBLlilrVRfJjIZi5rDKvUGb
	laogrXA2nj18d7CyerHWSCW8qznUYIdynXiRZSbaabpSNbbSd1dB2PhnqDih4txzjfcvZafQeIf1b
	bkaGk4R96a58xum8Yfpg0VJSaTWauW4vWxIRsSmVxVJ/4yzFc+UKm93ni0cHJfaRNez7zvYwAALeU
	Lv9JnXHYacs/0ui0PsuDEv/mYsJX8wTCC2WEe+5JcDyrAZp7Wr3CdctrGEA9TtkSwkvYzk5xPQWnj
	ykZCXs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7BGH-00000009UFu-04Ih;
	Sat, 02 Nov 2024 10:21:41 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7BEb-00000009U5z-0wyz;
	Sat, 02 Nov 2024 10:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=yYa+7XoJuDdb76oEmaiyHNPbnto6CbOy5cbqLih549g=; b=IxqSkCyyTRJ8QPfyWdRdr2qHrJ
	tpnjvWqxXTt+J7vxVmfkjrXd/rdKT+0RFdwGzbsRsMR9EdmzQEnFrsAgTnaI9+pdPBY3Pn9re79Nj
	57c2proTZGddCmA7w8N1JXHF1QdjpqJ+rO1URQev5azBEyB5hCBbYGnbLrSwTrfwTX1ksXWj0DUCf
	yuXLmD7dk6/d8YNZezbMYQ6VdXKIYeLQYq1Pq312XFyr1DfhbY4I3pSC7QOr5wrJ+HBrserJJF9gW
	0q+8FZncsHy0y1xio+hERsUI6SlHqDVBhozBkFMWrc3INF748cH6QiBntZMGgC5ZBSYXHEMi51PKW
	hRrho1rQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t7BEX-00Dy0V-01;
	Sat, 02 Nov 2024 18:19:54 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 02 Nov 2024 18:19:52 +0800
Date: Sat, 2 Nov 2024 18:19:52 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
Message-ID: <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_031957_288091_16133DE4 
X-CRM114-Status: UNSURE (   6.54  )
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

On Sat, Nov 02, 2024 at 10:58:53AM +0100, Ard Biesheuvel wrote:
>
> At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
> sha) via the shash API.

OK, given that btrfs is still doing this, I think we should still
register crc32c-arch conditionally.  Having it point to crc32c-generic
is just confusing (at least if you use btrfs).

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

