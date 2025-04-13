Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B931C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 08:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcWshjfTC1lMC6YXHeeUL4bjuPWPxBzwpr8Rq5Zmfnw=; b=RLXIO3dV/f7zBzzGV6cpFzkqJZ
	zF2d7SfEe/oZ+oTAT2fMmOH63DQJlFMzf1VQJGJgCvILkHF4fb8MWu7F8TkcqKYnwF8GbhM0vWAmW
	oOFo8zMcaTEjSFdFBupkYHlNCTXW+BT31jIncH/9VCO+mTVQJLQhJcCgp9d42Fr1kw0fkFPnoUhu+
	m3O9nJXegVplIG9YTTXINhEkGYDc5Vz2Dd8ip2ZmDCGRjWGN+BhyapkK1F5Vu1VmNEDVFwiy/Ge19
	t9CeCCVobHoXczXUVbHQdTFuibPTsG5ppS9X+/5I+bR9Pcgc18boEWQ0nUeU9YjTVDwhL/v0KupKo
	m+tsDEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3scW-0000000GwcN-0KWY;
	Sun, 13 Apr 2025 08:23:16 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3sah-0000000GwTC-0PyK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 08:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744532439; x=1745137239; i=markus.elfring@web.de;
	bh=DcWshjfTC1lMC6YXHeeUL4bjuPWPxBzwpr8Rq5Zmfnw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=exzryWU/R0uk0fdqTP5OPLHzIJm4fdYAX0IolxCopzBwWYsoo+5Pnz8Z07oaUtlO
	 ZJOMwHt+XJzDA9rUjSkKjdWp1TBEEEjiEowI6o4EyVwQ1PDtuBXNzZ0MhhgCothyh
	 HGKRBTPDSfiFfUR9lz6ZZxoSasgRd8V7ZCg1YT7xPabWYQL9YmHt69s4enkwUROtS
	 G9VH4cYchnpEYydNLz5jwMCBeDgGbtb6EuC7Wki1sBL3FtjO1UxaCfmYKh+gtpL8j
	 FX/jverm+icguogZ+pAqDu8HbICHVonIi4ox9qgbzWioLxgLQVKlQf9dtfaIILEhJ
	 QgC1KztyMwYYC31jlg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.67]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPrPT-1tgxyG33UR-00SVpJ; Sun, 13
 Apr 2025 10:20:39 +0200
Message-ID: <18573488-ca37-48b8-adae-1728712aec0e@web.de>
Date: Sun, 13 Apr 2025 10:20:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: crypto: sun8i-ce-hash - Refine exception handling in
 sun8i_ce_hash_run()
To: Julian Calaby <julian.calaby@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Ovidiu Panait <ovidiu.panait.oss@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe.montjoie@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, LKML <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>
References: <3727de04-7993-4b81-80c0-adb40b847307@web.de>
 <20250409133610.59d42bec@donnerap.manchester.arm.com>
 <e10ecbe1-d8c3-444d-92cb-647a1c54675f@web.de>
 <CAGRGNgUV6Dq6ZR9bcgomzj1PMQj4vLq9qJCy0dxVd0vQoPWYXA@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAGRGNgUV6Dq6ZR9bcgomzj1PMQj4vLq9qJCy0dxVd0vQoPWYXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:oVb/K4rokwXrOqYsrdIDmqG4XKpI3nnVM8seiRqbzdcw0cNOV+a
 tYO6eLyzCj6OLXXbZMczd3yXVNlYRA6sf6kr5LSDhn3BPJbQiAD2KlXT78QnSyXWnKwwYeU
 gSQ5jAeoUy3PMT/+dp7P3eR+URUZfBNidvEQAQo0PQHhv1Lje+ktvIdd+qFJogodywkwrkA
 8u1H/eG5FM+Yk1KnkhQzA==
UI-OutboundReport: notjunk:1;M01:P0:DWeY799sZOI=;JbD2Tgww7jyD7iXyT4Kkb+3BuGr
 Os8Bfuzy0I/sbD/raQrPtbMnrxgEsx0ZtqHe7sdNeeEVxxiI4gWeJJMXvE/Zpn2Hw3KjXRACa
 YyIad+snIp9m4yq66JLptCd4Hapi/K0vJcrHIEmYaZHpMDq1kYfGy6vDHtfPqJomNvyZ4H1Ky
 8NCb+nklxF62ydIvesPtZR7wsdsIUcaKJcwUHikcXC4RCR7qmN9Pf2mbBGy/mjvsX/A0t6FCz
 mTlDHeoFonNKEH4BMFkNtB7lY/kpt21dglyRP/8c5onwQv/dx0o/ge4f3JG9Tzay04BQfHA7V
 FVS5pnvdbBGFRW7sx2IADGOdzL6Bzvoc4NSRaWYJSfLbNJcFNV3OqJOHRKV7N9Wt7SnP7KN2p
 3elYK+78v1KjT0474hKuX9iec2S6AILBYtBj6ZWo9uUpAJtYm7fbGqwN/ORc2KAUm/Hb3YbYN
 E9E29MI2sqS/daBcubIyEWyeN+AmZQ4AGgCvSq4/M3TuCmzYkvUCqI4oWnKdxvf8cyH/R4bpc
 xrqRthH9RPVJtIsCdG2aR5hvnC9UfVexc50tl/azRzGJOjcX6PkFMHkZWL6NyHp6dreMHoXpv
 iRVLPDHHpQ2cFce9o5lZ+8eNn1sX2RqS91khwtOEC9pmcoVpEQZeu9jIAK9/qvCqR+0kBkV+d
 rAbqXkiwmuvejYV5Zyp99IHa743UVWwLLcbvo15soJddp5CveU74m8caymlB7jK2ECyqHR46d
 ogcB6efDvvUN32HzjeIrIzvV5RNJ5tu6JsJHJISrNcf3KskYqrYwEnyPtHLFYaHnn0ljCw3kT
 KpT/w8QCYyV2o5PjLQx2NFKvJxaGIxM9Yi/yK7JI+UMkCeLxuGn0DfPzdnnBMaWuXBasyIJCo
 oEVBeGxWj3PXExnJsESjt1tlXh5uIvAbxjuJBoTdZIwod7nwTcw9w4Y5JU29AAjSQ/BbAxShT
 FuK2YyYCDkBu7xi+5C6iI2V+o0CpGLuT8MyHkRkgZ9Jq7BMWroUCSra3f/4jg5kVCXxvEGHyd
 sT5jvKLRyn5z9PaS73Q9I+TCQWuKvoHtMZ0dWzll0YVbM3hS0hrDc81ir0Eigt//neSSmwkx7
 MnZSJ14QReP/QfxJAQjvuNR09i63GFYi9cvNgtZKgCkkapts4srR/6yezSZJoiWvrSzIgW69P
 F3DyRXSu6nL47uI+muhUy7oPhhjv+TtlMzrT472hIDbAYQcgS74r3dJRowDN3ekiCt+AB7ais
 lrJQA6OzBUB3hnsw+x9m7hKACHpINg9d2KUiC+ETJ9k9o7DBSbD6a5WOfi7L4/jHEO5vuI9Uj
 77DIvPwnPMkEdGpkryg/JohEQIZvJ2b9tqmEEYK1xtYSX7Qbu5Fccgb1GpKrnTiCzZx54WBnZ
 kuNGrvpifM3pm2yGcxe5m5BY0FdBsd/vPHhI0RZSw7MprH640e0W0shALykpy+wV9TOaBO0GI
 vO3b+TUAEEmOut5RW8UJOiz+TnklbF17EUGmZo/qR7RJBrux0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_012123_426222_D9D187AD 
X-CRM114-Status: UNSURE (   6.13  )
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

> I note that you said you did this using the Coccinelle software. Is
> the semantic patch something you're trying to get upstream at part of
> coccicheck?

Not yet.

It might become more interesting to achieve wider applications of similar
source code analyses and transformations.

Several SmPL script variants were published which are also still waiting
on constructive review for coccicheck extensions.

Regards,
Markus

