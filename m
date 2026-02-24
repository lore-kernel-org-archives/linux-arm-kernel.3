Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286A3F4BB93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pcvWKiqm2R1lSdEXlF00VSi11/PT+srxejSZf9A3ms=; b=qg6JTEy69lc1RtkK0PWGCvXXVP
	SjIFUdtqTJP0z3eudacUpHaYnPQPoNryjxM3uMRUtYubnkRGhKjkHAwl0db0F8RzUDrSbd6eDbFuQ
	T60SETwHHMcbXnySQPvYteEBBZe/W2Tr9ltBUVMvH64W8LRklxS3A3ETwOT0EdFL+2JAv3lBrF7NU
	tPHLY4WMEat04Uhk6JurkKIqad5cYZ0aeXu0kvTYhMLmuy43GGoS+ez6KUilo2dmgKEikeomhm9Zy
	ODdWatog7dXc0ZgJxzq+MhQH/6WDdY+MzOEsbso0HP9mZnN7Ol2SJXAM5vxffQcpfBPMNVQ9ocZNs
	lCnzp49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0Wl-00000002q1a-3JlT;
	Tue, 24 Feb 2026 22:05:11 +0000
Received: from shelob.surriel.com ([96.67.55.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0Wi-00000002q0V-3mcm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9pcvWKiqm2R1lSdEXlF00VSi11/PT+srxejSZf9A3ms=; b=OG7FLWFm13+E/xBP90cpFYkTiU
	xfm7k65ecZr0GAwsVpy+hGtOKngzR1laQKG2jSQWeK/DpGj13cR6+LbUNaFB6Wbg2DRGmnmSJJ9O5
	88EtIggsswe5Ji7XN3B4iWKrLnvNa8j66OzGUOL/hpytCmHqrJXE3fT4M5YsqO2uibyJI9OCnjZ+U
	PSMHs9Y8cmWO5nUO+koQvX+d8ecYNxAP9EnDc70GIgwx9GK7TypJuK4ulXnr9uoUt0tSsLUIODRb1
	zKhTbGZ0TVbDjH2+Tbcv+7a8ogDLdt3NV2uQ/iEuvDvAFjJ7XIRMdBUd9y9Kz7IbwYd20aR9l93E0
	SQwUsCPw==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1vv0VM-000000001sU-1Voz;
	Tue, 24 Feb 2026 17:03:45 -0500
Message-ID: <58e1883fe084d8284dac68dcd570f5a6c56c0abc.camel@surriel.com>
Subject: Re: [PATCH 3/5] mm: add a batched helper to clear the young flag
 for large folios
From: Rik van Riel <riel@surriel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
	david@kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, 	surenb@google.com, mhocko@suse.com, harry.yoo@oracle.com,
 jannh@google.com, 	willy@infradead.org, baohua@kernel.org,
 dev.jain@arm.com, axelrasmussen@google.com, 	yuanchu@google.com,
 weixugc@google.com, hannes@cmpxchg.org, 	zhengqi.arch@bytedance.com,
 shakeel.butt@linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Feb 2026 17:03:45 -0500
In-Reply-To: <bfbe28e381b02452b455498e7ea82662e83a3865.1771897150.git.baolin.wang@linux.alibaba.com>
References: <cover.1771897150.git.baolin.wang@linux.alibaba.com>
	 <bfbe28e381b02452b455498e7ea82662e83a3865.1771897150.git.baolin.wang@linux.alibaba.com>
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
X-CRM114-CacheID: sfid-20260224_140508_945202_673591F3 
X-CRM114-Status: UNSURE (   8.97  )
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

On Tue, 2026-02-24 at 09:56 +0800, Baolin Wang wrote:
>=20
> +static inline int test_and_clear_young_ptes(struct vm_area_struct
> *vma,
> +					=C2=A0=C2=A0=C2=A0 unsigned long addr,
> pte_t *ptep,
> +					=C2=A0=C2=A0=C2=A0 unsigned int nr)
> +{
> +	int young =3D 0;
> +
> +	for (;;) {
> +		young |=3D ptep_test_and_clear_young(vma, addr, ptep);
> +		if (--nr =3D=3D 0)
> +			break;
> +		ptep++;
> +		addr +=3D PAGE_SIZE;
> +	}

This may be a nitpick, but could the --nr thing be
stuck into the loop conditional?

Something that looks like an infinite loop just
seems wrong for something so bounded.

--=20
All Rights Reversed.

