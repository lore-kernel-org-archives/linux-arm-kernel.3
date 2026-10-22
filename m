Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE10606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 22:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D+WuDl7S;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=flz7XVfN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GaqApdBeK2bE88fSvpTgjY0Z/Eym1AprnFUqjIUjxc8=; b=D+WuDl7SyHMzOTAPC+btpLZdx3
	3pEsNsMgjKV4Ib0Fhv2dQ9jlDbFqMUBQMkPurTTSQQ7k/h6psHx/PymagNy/pLV6heA08t7BTMpgM
	DXnpcIuTzZ+tJ0QzMvTJL6NvkxAjH1OuC5t5oBV+ZLU4i0hF4/6mNfRpjCesUpbLNw6w0TAte4ZVS
	B+3VlPaUmgsspONAjWhgW4FE2rQc0wc9n9POypuGQD+cCa8dtmdo2t3f4AK0YkeMEPplqvMMUD0Dd
	65tSofajtTAiKQy2BCBL/IBAr5RxLhFDONr3Us3mqOAk5mNrKxchf892RFZNiYlJVeCojmNYiywTA
	CLJV5ouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK14u-0000000F4Nb-29Sj;
	Thu, 22 Oct 2026 22:16:04 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK14r-0000000F4NE-3Lfz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 22:16:03 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C71A6408F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792707358; bh=GaqApdBeK2bE88fSvpTgjY0Z/Eym1AprnFUqjIUjxc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=flz7XVfNw5NQaqyuD4jhGyElDhAsO+p/hsA/PBKhe7yH+WBE6BEN7w/y+xJNjKJiX
	 uyDXQxeSHVbbv6vmQ3WOcNw+2r7sKeaFT5Ucj61nD6TQYS6CwgNlR9lUvcipTGK8hB
	 bdUbGkqitGYRUn0yynkd5BIEzpZtR+O5u/OjPp+EKJ2mclek1PKlB6IJhaioshkyte
	 rq9X2OgyzlhgbPMokG/WYMkc1nEQ9dVTpQhCxCBPM8v67BPJqvbFcPRBRQyWPsM1BX
	 B7UcQKSVqOc/J02VGn76H1s5+8/URo1pcYHXnC1ugjMsGhss96+txy6gWVWMq4TlQo
	 qbec06S2z/jVw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C71A6408F6;
	Thu, 22 Oct 2026 22:15:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: linux@armlinux.org.uk, Bart Van Assche <bvanassche@acm.org>,
 James.Bottomley@HansenPartnership.com, mkp@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Breno Rodrigues Alves
 <breno3011alves@gmail.com>
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
In-Reply-To: <20261022214815.86306-1-breno3011alves@gmail.com>
References: <20261022183658.58090-1-breno3011alves@gmail.com>
 <20261022185224.60700-1-breno3011alves@gmail.com>
 <20261022185224.60700-2-breno3011alves@gmail.com>
 <871p9h1kc7.fsf@trenco.lwn.net>
 <20261022214815.86306-1-breno3011alves@gmail.com>
Date: Thu, 22 Oct 2026 16:15:57 -0600
Message-ID: <87wlr9z8iq.fsf@trenco.lwn.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_151602_167149_25B9DF17 
X-CRM114-Status: GOOD (  15.58  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Breno Rodrigues Alves <breno3011alves@gmail.com> writes:

> What I did NOT test:
>
>  - Real hardware.  I do not have an Acorn RiscPC or the SCSI expansion
>    card.  The unit test proves equivalence with the original assembly
>    semantics, but it cannot prove that the semantics match the actual
>    hardware - only that the C version does the same thing the assembly
>    did.
>
>  - Odd transfer lengths through acornscsi.c.  All current callers pass
>    even lengths, so the trailing-byte path is only exercised by the
>    unit test, not by the driver end-to-end.
>
>  - Interrupt handling under load.  This is unchanged by the patch (the
>    IRQ path is untouched), so I did not add specific coverage.
>
> If there is a specific test or configuration you would like me to run,
> please let me know.

I guess what I *really* want to know is why you are messing with a
driver for hardware you don't have - for a computer which was
discontinued in 1998 - and translating a file that has not seen a
significant change in the entire Git era?  What benefit does this bring
to anybody?

You seem to be on a real mission to do these translations, but they are
not valuable for their own sake.  The kernel does not lack for churn as
it is.

jon

