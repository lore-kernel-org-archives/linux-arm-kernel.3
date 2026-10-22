Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B3B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F1CbMERJ;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=lhJJsOrJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Woe6xHcsEP+dAFnzYb9P6peVQw4vpnrcC8v3BR/2jnE=; b=F1CbMERJehJDU4sEXZpcHJpRi1
	0cfM5bC0JFRL9BfDnpMSgbF7fMJnX2wBBfONKtVXMEaMDZ93fSnIrtu7LTDKOJfBT5F3d77OWimpu
	rfvjITAOzdZBeaVcDlutSaAEG24x5lj++gv0v3L5dpGFqZl+0wpdJtmdmTNvwOllq7KhhaqGLvP7b
	nVKVAfuNjEAt5dp37K0bNVIHil1HR+IbaEcFK0mQk4krAu4T5pS4MKr8+HKCiX4bNmLXQ7/6tIIpz
	5aOl5t2mybIwHnqSRT0l1KUCPWARY+RyPsiCN72wojqnvi/c3Ov/9jT/BslBLejOXQlCIbxx1JRYE
	DcCe+NTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0ac-0000000F1DD-2Qz0;
	Thu, 22 Oct 2026 21:44:46 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0aZ-0000000F1Cm-3DMY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 21:44:45 +0000
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D63E8408F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792705481; bh=Woe6xHcsEP+dAFnzYb9P6peVQw4vpnrcC8v3BR/2jnE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lhJJsOrJHzLb6hn6bv7VHV2+mYFyaQtqk92z4rf3sxZo/TyHcTlvOfRjkRsCZIrF0
	 Nip8jdgWVfzcS5qQI+OMAL+VtSulUBFCWcXY7gA8o/jOsJQsrstXMFjBdxeJfnxw9u
	 5wJdFCNdvqkzNXjHfSnYt93QL8pkpmOBk6cOJ0/N/5f3M6MHxTIjb7KxIyxwiL3gqZ
	 eG8q9GbK58WGOoVPrjX3IaLo2gcnl9GFu9fn8NRI2Ejut7IYXkXkh45XCpYhNNTgiz
	 h8WveE+lhUaTo/m2YMOszMhQ417gK5tNzbqnqVBrp7v1kgVKLoOtQV+68J6yOnW5dH
	 /1Q9GqWTslmNg==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D63E8408F6;
	Thu, 22 Oct 2026 21:44:40 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>, linux@armlinux.org.uk
Cc: Bart Van Assche <bvanassche@acm.org>,
 James.Bottomley@HansenPartnership.com, mkp@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Breno Rodrigues Alves
 <breno3011alves@gmail.com>
Subject: Re: [PATCH v4] scsi: arm: Convert acornscsi-io.S to C
In-Reply-To: <20261022210252.80844-1-breno3011alves@gmail.com>
References: <20261022183658.58090-1-breno3011alves@gmail.com>
 <20261022210252.80844-1-breno3011alves@gmail.com>
Date: Thu, 22 Oct 2026 15:44:40 -0600
Message-ID: <871p9h1kc7.fsf@trenco.lwn.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_144443_852371_BC84F575 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

> The Acorn SCSI expansion card presents each 16-bit SCSI data halfword
> on the low half of a 32-bit card access.  The hand-written assembly
> in acornscsi-io.S implements the two directions of the data path:
>
>   - __acornscsi_in()  : packs pairs of 16-bit card reads into 32-bit
>                         memory words
>   - __acornscsi_out() : expands 16-bit memory halfwords into 32-bit
>                         card writes (duplicating the halfword in both
>                         halves for the bulk of the transfer)
>
> Both routines are simple pointer walks that a modern compiler handles
> just as well as hand-written assembly, so replace the .S file with an
> equivalent C implementation.

How have you tested this change?

jon

