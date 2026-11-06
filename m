Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC88606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 05:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EWL8T26S;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KbVDF/ZZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rc1B5L9x4KU9XV5a9KjL0IyzS9SFrFYxX5fwdEU8zEU=; b=EWL8T26SZCpAayY2iTpIIwNOzR
	aV6ox1IkLsNb+te0+x1ho6wElAbP4LZp+YZT2wVVkWiibmHCUU6otj0wCMtBlo82xu/SMQJqKjVcv
	zrCzdGQ8IFomaNvNw+MYYRFP2WWhKn36aNybTMZHA+5KF7OQuDt+L509S5+xabXy00AOcbV0PQbLM
	JJYU40ZcTiPFCZglmrYEjw0d65tmma2isOPp12GOVEatR3c3KnAZ+ly9oJkEHpXPyYEFMtH/mHcC/
	3k5QlqYv6HzZF5BiOP0w/p6kRY5ATs6ahxGez28c4Ldxgep9O1KvlKWk8fwdbVpalIdwmHvnGY//e
	7Z5n/J4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCRn-0000000BGng-0bV3;
	Fri, 06 Nov 2026 05:25:07 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPCRk-0000000BGmz-3HXn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 05:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793942702;
	bh=rc1B5L9x4KU9XV5a9KjL0IyzS9SFrFYxX5fwdEU8zEU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=KbVDF/ZZlKW+8X1Vp2xhdZH2JdZ3LdHuFkg7F0ExZz3B9V4shzzGT9MBmcdhE15A0
	 rwHSBsy2yR3p+qiDcq2LPyXE2wvePRvsmBh6ty6wjvi5jNHIiQ4umHU8eOjB/k7TWe
	 6JZhmgwkXkl+4HNSvAuqhn/fK3Q6cqxx6ti/kb1TsfBBj4SnWQr5h8jjPv+axoLuKr
	 UtSvFIikSTMKKGzLeOQFjUkG8UBZhABXcMrtcWTsYTijokWRofu2bP5aeKZR79XU2p
	 TgfhhjDipdr5JOrq2deYgHexwEDM8p9PyYj4dVOzUvx380bjRberr47UdzK6+kOeU3
	 /RfaOavucwNag==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0978A64952;
	Fri,  6 Nov 2026 13:25:02 +0800 (AWST)
Message-ID: <69a28877e3ed57f9f248d31d1972b62446a4d230.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 0/2] Aspeed GPIOP handover with managed controller
 lifetime
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, 
	linusw@kernel.org
Cc: joel@jms.id.au, ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, 
	brgl@kernel.org, tan.siewert@9elements.com, linux-aspeed@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 06 Nov 2026 15:55:01 +1030
In-Reply-To: <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
References: <20261105152348.8567-1-prasanth.padarthi10@gmail.com>
	 <20261106022907.10735-1-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_212505_025363_F2BE1F42 
X-CRM114-Status: UNSURE (   8.37  )
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

On Fri, 2026-11-06 at 07:59 +0530, Prasanth Kumar Padarthi wrote:
> This series continues the AST2600 global-to-local GPIOP passthrough
> handover work, rebased on v7.4-rc1. It adds a shared pinctrl lifetime
> fix before the G6 handover change.
>=20
> The registration lifetime issue was identified by automated review:
> the G6 callback data is devm-allocated, while the shared helper used
> unmanaged pinctrl registration. Patch 1 switches registration to
> devm_pinctrl_register(), ensuring unregister runs before earlier
> devres allocations are freed. Patch 2 retains the v3 handover logic.
>=20
> Changes since v3:
> - Add managed registration as a separate prerequisite patch.
> - Keep the handover implementation unchanged.
> - Add KASAN lifecycle testing in QEMU and on B650D4U hardware.
> - Update validation statements to distinguish lifecycle and power tests.

Can you please re-send v4 so it's not threaded under v3?

Also, I received the v4 cover letter twice. Something seems wrong with
your mail setup.

Andrew

