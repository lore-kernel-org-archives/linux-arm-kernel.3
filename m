Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E48C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5BwCvTiZ3qrlhVBFg5q2tte+PfUCaSlYpVNs8m646o=; b=TkC5xsSYJC7KKaEgPpgooFJu/M
	rO+2URg6J0GE+o8RseekwUCSoNlTWzbiqDyHrfWsi4q0AfMKSjX25NGogtCv5gi/9bhux89i6TNyl
	vqz05byNWO4Qaiisk5kY3ElGITwEWp02BiCU3O7+E7Y56cct2LLF8mFkkumXg4OrWMoz70OReLXT+
	9eebHvVRISd8tO9OTBlRv5zLXpx23Tn3bl1t/pQ5PHj9EPTrgXtlzz0uMzPnM6nZdq6nW4Sijxztd
	u44Ct0ChvqJxp/Oxkoh8T+eH4/QTcm7h5EMFvvj6FriwrJyEKrbpNJpGuWktHUkFiVgCFrPk0sqfh
	DftaEUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuio-00000004nxb-2Va6;
	Tue, 11 Feb 2025 18:10:58 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thtDb-00000004XIi-0eS2;
	Tue, 11 Feb 2025 16:34:41 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C575625401A7;
	Tue, 11 Feb 2025 11:34:36 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 11 Feb 2025 11:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739291676;
	 x=1739378076; bh=d5BwCvTiZ3qrlhVBFg5q2tte+PfUCaSlYpVNs8m646o=; b=
	2PNp0TpuncwFONiMcbpBK4M/zx0SSDekA/9pIC+cjylGukqoFIvRToiF7G+9hSeO
	Lrxtcb86BxSUbi5oxHvNGr4iFRiDSdSjGtmYOH7yPcbh+MSfREawz3FHqeJACFeH
	DOuBzwlIdP9e02fs2fikxkTU7+Tn21U9jmW3uG3VOlOCaK0+kC4uk7DADQLeqyXK
	Q7yw7nTgDYcXC8kGRSenmRfJ2MMKKKaEo5Zpd6KyTQ4nkVsfL9IObL20RumozGqu
	G2reGtG+5sHI/ldhJX+1bwKKBtOTrNPxha7IX0l3TqZCcxy9OKKYCbJOvK19G08k
	lGRRPWeLHjl1sNT+Ep4BJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739291676; x=
	1739378076; bh=d5BwCvTiZ3qrlhVBFg5q2tte+PfUCaSlYpVNs8m646o=; b=V
	Ozk7pPVP0h+2AgFpeLiu+lol0wO2ZOwZbLVqtS4KGk4Sv3t85E1mudIpDOEbXfQL
	kksCP0l0S7lLL12pN0nc08TxkUTAySh0HNLuXoaM/UMgiP5+1SjVWJ6zxcso6xgB
	DXx1A/PvuTqX0pHNffJwi/lYiwtgsvho07LVmJP0hGlnr8Pdg7om3k7lSU9KMbuQ
	JvHx3r1SIE6xCTyKz5ryBzOALXnitWKk9i72BizUxDkREmwuaT74owWu8j/1K9/2
	n/4maTuzyGNFP7eNX23yp21uiE2+6b9EhXmLH993y4ogPLwJ7mcqid0u5CPdydya
	kuSBAth4Bxik9i6KGDWig==
X-ME-Sender: <xms:G3yrZ0_1Q0FaY3Ee8S-xqosqwKaUdnqIkyLkedkcu-bNFNAb450W4Q>
    <xme:G3yrZ8uIHsfjJoL1mqa3ii6htsHiHG3Axxyp7vKd-WjvSr8OeI2pKDxvAJK8qv5QG
    umammks5eod-_0DqTY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeef
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinh
    grshesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdr
    tghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtth
    hopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohephhhofigr
    rhgutghhuhelheesghhmrghilhdrtghomhdprhgtphhtthhopehirhhoghgvrhhssehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopegrughrihgrnhdrhhhunhhtvghrsehinhhtvghlrdgtohhmpdhrtg
    hpthhtoheprggtmhgvsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:G3yrZ6D4alMOE8a4n5nNd47ja1Afft99h3C7U7t0sfArp3SwKp8zTQ>
    <xmx:G3yrZ0cIT9itAmmwv_nJYSaHkR9KXCJ7zp3EYddpHtGBzpLB3Uaj8Q>
    <xmx:G3yrZ5MUzop_mWBRb-SdG5t8q4ll4twTv6rZSd5xaHfEvJ5mHsow_A>
    <xmx:G3yrZ-lwpTINmJhziLmwbMkAZW-tz6V43rSWnjoB0CzV9r-nE8xyMA>
    <xmx:HHyrZxaR4B9VF91_YcucqNeu4wHHckuYASiugAG400-WBcAbej798u8y>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3A14C2220072; Tue, 11 Feb 2025 11:34:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 17:34:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>
Cc: "Peter Zijlstra" <peterz@infradead.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Jiri Olsa" <jolsa@kernel.org>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Kan Liang" <kan.liang@linux.intel.com>,
 "John Garry" <john.g.garry@oracle.com>, "Will Deacon" <will@kernel.org>,
 "James Clark" <james.clark@linaro.org>,
 "Mike Leach" <mike.leach@linaro.org>, "Leo Yan" <leo.yan@linux.dev>,
 guoren <guoren@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Charlie Jenkins" <charlie@rivosinc.com>,
 "Bibo Mao" <maobibo@loongson.cn>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Howard Chu" <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Message-Id: <8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com>
In-Reply-To: <CAP-5=fV0AVEp1uEtKjAqOmwqKSRuUzTwrXnBiqc=Lopfj4hBSA@mail.gmail.com>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-4-irogers@google.com>
 <07c5c3ad-5a6d-4eda-95f2-ed16e7504d4c@app.fastmail.com>
 <CAP-5=fV0AVEp1uEtKjAqOmwqKSRuUzTwrXnBiqc=Lopfj4hBSA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] perf syscalltbl: Remove struct syscalltbl
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_083439_696984_B46474AF 
X-CRM114-Status: GOOD (  13.94  )
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

On Tue, Feb 11, 2025, at 17:18, Ian Rogers wrote:
> On Mon, Feb 10, 2025 at 11:48=E2=80=AFPM Arnd Bergmann <arnd@arndb.de>=
 wrote:

>> The syscall numbers on mips (and previously on ia64) are offset by
>> a large number depending on the ABI (o32/n32/n64). I assume what
>> we want here is to have the small numbers without the offset in
>> syscall_num_to_name[], but that requires adding the offset during
>> the lookup. Can you check if this is handled correctly?
>
> Thanks Arnd! I agree the tables are large and can be sparse, they'll
> also be full of relocations. MIPS doesn't look like an outlier to me
> here:

Sorry, I should have been clearer what I meant, see
arch/mips/include/uapi/asm/unistd.h:

#if _MIPS_SIM =3D=3D _MIPS_SIM_NABI32
#define __NR_Linux      6000
#include <asm/unistd_n32.h>
#endif

and
arch/mips/include/generated/uapi/asm/unistd_n32.h

#define __NR_read (__NR_Linux + 0)
#define __NR_write (__NR_Linux + 1)
#define __NR_open (__NR_Linux + 2)

These offsets are 4000/5000/6000 respectively.

> ```
> #if defined(ALL_SYSCALLTBL) || defined(__mips__)
> static const char *const syscall_num_to_name_EM_MIPS[] =3D {
>        [0] =3D "read",
>        [1] =3D "write",
>        [2] =3D "open",
> ...
>         [465] =3D "listxattrat",
>         [466] =3D "removexattrat",
> };

This means the array is not sparse, but the numbers
here do not match the syscall number argument register.

The question is whether tracing on mips adds the same
per-ABI offset again, or if it tries and fails to look
up index 6002 for 'open'.

       Arnd

