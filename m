Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76B7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 00:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrJOuxJutwKayDAiU7200Ih6LBL1oWuqiTNfvlEeLSg=; b=jOtFMexIHspQTWWR1L4mhhgnms
	Xnvw3QO3KXm/vyurhsSTOo7MqZ1bbSYzQNT5OlEfYAOVB3csteW4tTt+q20JJCd4/S2CeA7VxzHgY
	Eobsc4+4T7uEtBVLEFWSbGhFNGm+lZZjjQ42DeSww/O5pjRHt5yqnnkdp0KWVvmXMRPDDtqCLXWHQ
	8vTZGvBnjEwt4sc1WUHJfSKTI4jjw2dfYEMK/NuVjD2wQGk3sxJoPNRaqwrdU5NuaB7I3XybWYSW6
	OvlK2DWHiRa07AQkpRUSyATObKBMutZ8qoRAm69xcfuRplBpxeYOFToIXHYLnq6feKbFJuEBX8YNM
	HUx80MyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuKsY-00000004Gse-1WLw;
	Tue, 18 Mar 2025 00:32:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuKqr-00000004GgZ-1bCT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 00:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1742257827;
	bh=qrJOuxJutwKayDAiU7200Ih6LBL1oWuqiTNfvlEeLSg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hiwJHTyIEKAeof16Bs2vj34PRfatLyOQG/jqDqNY5IoqgH4o7JRAgU4RVKn9R9lkq
	 uzsMqS0GQjqPAHjj81SjHn6QGVre4DQY9WH0mWU8cK2uvurZwecbYObQNbhWTHxRVq
	 Z5HtIZ/pV5uD5ImuWEayi+CnXqofCABoRR9/iBqbuvfcobTRiw6xYmZCMer7GQhP05
	 7Cu6wSrfZ4Kz83e5bnljLZRcOwL1oN0ePXUaiVPLBfExbYgEuj8Db864ZnSUVeGK3j
	 q5U01uGiB0r8wYGjpz10hlsbkXRN9LqHlJJ6TREpRy6BUwbM1uAH1ot2DVvKDvZBBy
	 30nZnWwU5mZzg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0F7D977BB4;
	Tue, 18 Mar 2025 08:30:21 +0800 (AWST)
Message-ID: <3c16b98f113fa8918c879a16580811556b0c35c1.camel@codeconstruct.com.au>
Subject: Re: [PATCH] watchdog: aspeed: fix 64-bit division
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Arnd Bergmann <arnd@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>,  Guenter Roeck <linux@roeck-us.net>, Joel Stanley
 <joel@jms.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 18 Mar 2025 11:00:21 +1030
In-Reply-To: <20250314160248.502324-1-arnd@kernel.org>
References: <20250314160248.502324-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_173037_620217_B6A071AE 
X-CRM114-Status: UNSURE (   6.14  )
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

On Fri, 2025-03-14 at 17:02 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> On 32-bit architectures, the new calculation causes a build failure:
>=20
> ld.lld-21: error: undefined symbol: __aeabi_uldivmod
>=20
> Since neither value is ever larger than a register, cast both
> sides into a uintptr_t.
>=20
> Fixes: 5c03f9f4d362 ("watchdog: aspeed: Update bootstatus handling")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

Thanks,

Andrew


