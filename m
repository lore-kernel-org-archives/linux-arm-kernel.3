Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EE9C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=; b=bh9OA/LiO8t4t3N2SeQk3O93IN
	OvLWykF63G3Luod5gqF0dP4z3Oj4WSZ8dWOrn/6Ix0M/vJ3G6ek3bgMix1DfhvZ+XJpwR76TRX96o
	ilr26Y0r5xhsdkn8+uxlazwtEufZ2aWeNIMla+8fnVq2Ir4EH0coTSGtpaUy/UIPI2DuV6LggpJXy
	+CooVKsoy//YO51Vs7tDaZVXOF/7W5+Wn4+nUmtLb8LZWv6YlEAPGTEWjNdssLH6vtUu8gHYoVrGd
	tA2okCzIcYW8k+lky003od3NCii7BoqGWXMAs9xsxZpg/3wLtSOQF6hZCqkuebpOuzom6gTAvt7LF
	OpFebU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz06-0000000ExAF-2EIS;
	Thu, 23 Jul 2026 19:22:34 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz04-0000000Ex9l-3kS6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 19:22:34 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-51c01c79467so52431cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 12:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784834550; cv=none;
        d=google.com; s=arc-20260327;
        b=p+kioR4vhlI6IPYzRjQCYHPFR+R+f629oDtwvp1M7p2dGxJEC3ubX2z/OyBelzW6lv
         +uO3en95OBgcPMRCMbHxMKPLXXFc8r7ho1Ve8R93DCGr9NaUZzMEqstIf7RY4CYVPys/
         ++dZzwVvb+wUKT3u4yJUG8W5mXUkdG/hLRtuIwvGobt18/gJOrn9F9aXWRGwWGJSkF+/
         mlCgBDAsNiii4K6gYLPL9TMnI90ux6FbLNRHCg+sKxvT50BJfdptR7I7bddqOuoqep9D
         0FPzQic/73c4prwX8IJpfFY1TdCvVIHxKwKJ9CeGXg2fO9U5kIHX3bh5vbWDOpR/kpaD
         /x9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
        fh=lMgXtWKGtNCnjE6/65ukN+twtARApIct+Kzk030tnw8=;
        b=CyupOL8VYm2rU6CJs9rFNCEHL9Ge8PgWbnKVMZaNKo8Ce5dReDXAVkB2N86Gg6wM/W
         Ktk18ly5kdPTUAu88NEAWIIGWcPMSUwNoE2mr9Ul9QyEekscNJt1MPjbnA66PfDsjUi2
         4b4mRHZ4ueof3Q0+T1R/r2iyq+/0Rpm2pUlopqJO5Te2yvtluxKBi+d4DTOnS+b/7zr2
         yKsrODJdsfWgbiBtoVbdTkyv9PKEtopG6K6tXyBpiG1VGLx1+5LsdUyfDQMFq7cpIqYJ
         hhr0HmEoTgJBDLE3Hum/ftqq0bcnJ2dNiit2o7lmX+IzHjomAsp2xr5SeXghQyKxS8wm
         fWfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784834550; x=1785439350; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
        b=fbCY+j51gcJUUGW8h7Bm3CjCUZZA0CJuzb2BExC5zJrXj/Y3nxvFfc7gQjOddDYNua
         1kkgeVaqCMqP7D8rpa005MdRp5Ljae7vugpFTgkCDSsj5d55VGeo4ne4+dP4t5ZzT0RB
         twvFrg6DAg2w6OUQjRPij0tcaGEtNr91FUJFikhsKS7q+JyzsMztmBAtIf0LeW1RVF/4
         6nDrR+fp0sdYUnqyxqDPelm9lAjh0q0Jh8yNDOYbVYZnYyGeWXQOdg5VkKETVwP+7e2Q
         OnZdpSRnoxpRHQJgYQgwCn9Q2l6s8l726GB+hoaYdyRicnfNi6cgHolTTedfoSh7jC8U
         WAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784834550; x=1785439350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQzDk6eLJ3OVzLdnUWi9gbK+31evwXTddGNItHuRUwQ=;
        b=fCvXMEjOnmkS7WxzTUgLNAtSbnnvw6bB4DoYZAd+kUkV3nOOD0a4u3cnx5MzBKPH+9
         8G+FK0B3sqC1BgHi64r7ObLL/ie3za5eSv2XZdQcJ0X0sR9o04XdkaUrF1nIEueyRkKm
         +XhnbQafJOcqZB2L1Q0rJyZ9UGLhxxwlTnm1Y6bqTP+TfMoZGpcaIe95oWY7kOLYCax+
         8TchnjxZIY7HX1LquRqzBduH1bXPd0lSBQciTLzWKEodXrqzlR5bCaocJKzhwM24B75n
         GsKxAciqgi07HPoQz4TnRYrQJpSJG7u8e78MTUXwvX6hCt/KG3p/je5JB7t7DE2D8KxR
         kCXg==
X-Forwarded-Encrypted: i=1; AHgh+RqwW3L6CRpiCEFPTLShz38F8xHEWLSlsmkHjyIosDznePX12o6smxDJI53HPG9+VTRc9AIdQECgzZD6ILdNzCJj@lists.infradead.org
X-Gm-Message-State: AOJu0YyOnPKSpkqdFGTdEBS3jN6K1kSLleIg5ROYxeHo7aXNAhKI8OiI
	rrYh3k2ncVIS9JcL+CDbupG1c6D9OXPgp8l/jWVitkL+P8GMeiOdH4zBQagiXd3VaqiDZCTIpCn
	V0HmnXrukiB5olw5s2zPcXUQKwVoTseBfxe7433QZ
X-Gm-Gg: AR+sD12ubnYRi0Auu5t9jb2vwgwl2w1I+Rgilwd/Sj3oc6OTQ4Kr5KSu2Ie7vWMgXq5
	V0k0JzR9N5YMDhU8zlrpkpcFZDxvEeLvJELWZtzFj1zUOfOmJ0nUBig5tRpdzW9fukpYhBsuHAh
	ZB+W24arftXNAPIuWM8+cS/drKON68X05c6HjzNFX5VAm9RSFz5mc3GrSDMGB6HsX7DsHJX7YBu
	h4+Et+ozGZuMYpcDTMtjGxg5CV5nPQWJxQr4czR2Uzue/snL7V8S6x5+tNsvkx0zSX5gg==
X-Received: by 2002:a05:622a:5790:b0:51c:ad5:93be with SMTP id
 d75a77b69052e-5284a9ed117mr1848021cf.8.1784834549852; Thu, 23 Jul 2026
 12:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com> <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
 <7f273a08-b29c-4e15-b340-898b251efe57@yoavmoshe.com> <CABCJKud+GsBVv+XMTsi_4QAaTHo7jXD2Hyvi9wqKd7x3i2xyAg@mail.gmail.com>
 <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com>
In-Reply-To: <415ffa24-a30b-43b2-aa6a-a1cde3bd4ef0@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 23 Jul 2026 12:21:52 -0700
X-Gm-Features: AUfX_mwIn057sYLi7onMumtMkCOBiIb6bjljRVwkdb130ocIXYLLv9gbv_H9dWo
Message-ID: <CABCJKud9B8vB-J8f0HLHw6EgEKVWzy+Q1PrNxpO_6yCGtEyi8A@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_122232_941949_5B72E87B 
X-CRM114-Status: GOOD (  14.91  )
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

On Thu, Jul 23, 2026 at 6:30=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> On 2026-07-22 8:03 PM, Sami Tolvanen wrote:
> > As long as the C prototype for the assembly function matches the
> > function pointer type, the hashes should also match. Can you dump the
> > hash prefix from the OCRAM and compare it to the disassembly of the
> > call site?
> Here is what I saw when checking the disassembly in vmlinux:
>
> 1. Call site expected hash in pm-imx6.c: 0xA488EBFC
> 2. SYM_TYPED_FUNC_START hash prefix in suspend-imx6.S: 0xd4d4d4d4

What's the value for the __kcfi_typeid_imx6_suspend symbol in
vmlinux.o? I would expect the hash value to look a bit more random.

> It looks like because suspend-imx6.S is an assembly file, Clang emits
> the default assembly type ID (0xd4d4d4d4) for it, which doesn't match
> the C call site expectation (0xA488EBFC).

Clang doesn't actually emit type hashes for assembly functions.
SYM_TYPED_FUNC_START just adds a reference to the
__kcfi_typeid_<functionname> symbol that contains a hash calculated
for the C prototype.

Sami

