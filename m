Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9BAE6FE28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3MC/DJyxuqUqO+aA+Wb0Xz81EzDT3zbLRjYsUOml1Q=; b=ZVRu7PUqD6T0jUkKprkwuqgiW6
	nLV4UHpwXRf9Wuo0Iq0YVKNjvVRcr9nrj+tui9yWvljEJ7M8R10nZ4fTu5UpH2CTia/AWOJSYwQ8F
	WCskFdfteR1/oQeNNAfwf6ZMULhGk53TzZKwjFY5gmZT+k6fMqjSlXDr5j3/46/wcI3CCP8oCMBeg
	r7vmHCS84m5peInfj4WfZ8TTDVyhar0x3D+R6xEILsUwmLCilNH2cFHq3rBHP2WI82g2U4CvJ2LFq
	2hAFaMRWt/bbyoOFQHkXXjp/Uc0kbKAlPsCZzxOKZxrLOjolaxzTD7DwqqLXi/K526EZxMu8kvjjD
	muEqeofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY86s-0000000FzGb-302w;
	Tue, 23 Dec 2025 19:31:54 +0000
Received: from shelob.surriel.com ([96.67.55.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY86q-0000000FzGF-2piA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 19:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=S3MC/DJyxuqUqO+aA+Wb0Xz81EzDT3zbLRjYsUOml1Q=; b=XvcgwatDvNRIqTVzxBEvAtRgmD
	rFkbSYKJopSiemzHlULOFVByZwO+jcvsno7jG50qWziVJDNvgANFEgF8fuV2pTK4Qn+VDodpXvBGu
	uA+v25gq4eFGrsNCpmLhrxihh8vRM/jzbkO1mAgmLsFu4KZ86dP7BLXo4Kdgw9ehJm3I8ZrUTLker
	O0HChL0WBF7Sf0W63PKlHiwi4Zmwe3M+EgkvkfP7govGfwvWOr6/9WiMO8QpzdjrWzjsJWwblORCK
	abajXy7BIwQj79KS7+9KyEr4LrcuDjTPVtH+oN67oPZCW2aZ4y6mhCCP2yhNMQk7TA6Mt9RWiRB7h
	p83Fiypw==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1vY86V-000000005Xj-0BE2;
	Tue, 23 Dec 2025 14:31:32 -0500
Message-ID: <4d867df02dcc3cc8f519903282f6e63b2974a461.camel@surriel.com>
Subject: Re: [PATCH 2/2] kthread: Warn if mm_struct lacks user_ns in
 kthread_use_mm()
From: Rik van Riel <riel@surriel.com>
To: Breno Leitao <leitao@debian.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, puranjay@kernel.org, 
	usamaarif642@gmail.com, kernel-team@meta.com
Date: Tue, 23 Dec 2025 14:31:32 -0500
In-Reply-To: <20251223-efi_fix_619-v1-2-e0146b8b9d73@debian.org>
References: <20251223-efi_fix_619-v1-0-e0146b8b9d73@debian.org>
	 <20251223-efi_fix_619-v1-2-e0146b8b9d73@debian.org>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_113152_716013_8C546A1B 
X-CRM114-Status: UNSURE (   8.23  )
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

On Tue, 2025-12-23 at 02:55 -0800, Breno Leitao wrote:
> Add a WARN_ON_ONCE() check to detect mm_struct instances that are
> missing user_ns initialization when passed to kthread_use_mm().
>=20
> When a kthread adopts an mm via kthread_use_mm(), LSM hooks and
> capability checks may access current->mm->user_ns for credential
> validation. If user_ns is NULL, this leads to a NULL pointer
> dereference crash.
>=20
> This was observed with efi_mm on arm64, where commit a5baf582f4c0
> ("arm64/efi: Call EFI runtime services without disabling preemption")
> introduced kthread_use_mm(&efi_mm), but efi_mm lacked user_ns
> initialization, causing crashes during /proc access.
>=20
> Adding this warning helps catch similar bugs early during development
> rather than waiting for hard-to-debug NULL pointer crashes in
> production.
>=20
> Signed-off-by: Breno Leitao <leitao@debian.org>

Acked-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.

