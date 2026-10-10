Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973A5CA6017
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 14:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9v+bgPkySBzc0aLhhX4V+5q7OxZcccocW4BaJrDdLNA=; b=AWJAYktn+U1xXqulw0s0YslVmU
	PdP150+JW9Cyfup2B15qJRo/nUBVCF7kl8Mn6M1eck/xnFOWJubQ8Z06yU1Vm2HcmBrqKFWU8Cp6l
	wS+7QxJfUcsF0qHkVOyCx+Tmtmc0cz0B2ocG5DRFG1V/O3592B6YhZIo2bqCqoopFG56R57EUmF4A
	XRKlEQg9PMJOmSAqDnX0xwuY6WjRGnxRaWotG4uASd7JxV5o8zaN0NIfVmASYCCmgyrluPUd/O2Hr
	JhTMCM3JDT5sGYFzhKgdVY54FwNVKaN2FrMxdfX7REk7BqeEuvloe2bFIxkDlUiXwsWPK2+DYDK78
	2PbLKQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFY4M-00000008ASC-2Omq;
	Sat, 10 Oct 2026 14:29:02 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFY4I-00000008ARc-1TVY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 14:29:00 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5FAA77A0095
	for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 10:28:57 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 10 Oct 2026 10:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791642533;
	 x=1791728933; bh=9v+bgPkySBzc0aLhhX4V+5q7OxZcccocW4BaJrDdLNA=; b=
	jFWomILQ5a23kATKxV5opHvM6kxextElXZNIoC5bV5Kd9IuRR/QlKjpx0lZ+Dzmq
	sCB+9MDrSkClNP2VC5yF1n8F9TSfBkLlys7Wu8bDS71XK648H5QuH/+Pxnz+SYVU
	DZ1dEdS4+I7AagBW24ENQ0T1AnkyKVXm+aqvitC8m1KVNbpTZXgXNzTc7zHrfhQp
	W1I6v0HDPp8V58qJBef2shx9cQvbo0RC6hEMtPLz5pJGSzgVY8hnmEHMuG9TAfYD
	xrdhYw9t6gELVazbbwdvOnPcf/xKiMyvnUpEU86nD4CmTLwN163L5kZOZ3y3jjbp
	fwPxFcLthyJlq8TspW5Nhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791642533; x=
	1791728933; bh=9v+bgPkySBzc0aLhhX4V+5q7OxZcccocW4BaJrDdLNA=; b=s
	PU0NwE17zIyVoH4vRdF06XvdJJ9o4RoMUHru7INjE0f87mtHAeO/MBk2c0XvNZWh
	R2Hn3pzkxaNMUHcBrPbq7+JU/9IBTKkwB9VyJZ2SScLzQxMmKG/oRwBcPQn9SHtC
	fuOUr0vKI5MH2/oXdGEgARDat+FefA9aYWO05ZnEdr5HDv2bpngpsbBtVlBLggRs
	8MlmeMlcor70aes4jtGOkhILxg5wSG52Pdw+ko3nOAxHH14lxWv0VMYJaRx9bNAb
	9IW4jlbCn+8R/Hv75Bme8ht9T9VT6YCEIgLZl7Z2nC7wkMEuMQLBbrcr5Ti3fd8i
	lVzrLz6GYNGWQS8dSTuFQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791642533; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:AJHkmFdKVa0tJmFmszqdfXiBFJFvc/+5PN9NJJ+y9SpBqJi
	dUT/niadiDrKecGmFQ8vFMVB7njf6VC21XC2KGfJqGYNz8Dn+p683+2/S1Sp489H
	u9q0ebDqcjpQtbGmw3cNdmJwjvIsFREXxL2tQgjb65Pl08K9vfwlcxfvrouwlJLw
	+bQXg43fV/Wr/5UEjWeFQOABXF5Ur5i07nTLYoX6Zc3WyfH5oK+1NG+FZQ0YGXcV
	jFr1X3/4QKoAIwy0UWDMR/D7vhzxrYAelwM/OJGbme9HjrlWTkAWX1faAZjDuJ/T
	EsVtCeVSux7589ZIHRdBpUHI+H4bvuzbo0oB9Pw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aV/xq7C55QCQ+urKH1wwNiqvUZ1gUoGK8FiRVFhcd4E=:9yZoRXmQQtglkDC69zeTXeUUkPPxdHTFbXEWw2qChQk=;
X-ME-Sender: <xms:okvKaqyg97e7-Vw-xxh6O5sQLLuZB4t0F58vf7v30ctQpSC9YXEI8A>
    <xme:okvKahHF6PAwhJ6geqQ6v-psLzO7fKZDuOkpJQSC2zK60HJuDpu82-rTJNklTxLSd
    5DkpOCERy4NknhHJRwIWM_b20K_lpxuQ-nbuqqWYUn3mh46o7DLvds8>
X-ME-Proxy-Cause: dmFkZTFLAfDTpiHknNrFYZyTXrnw2i7hwBBvDA63p8pgRb0WqT4uwmaQRp4EGcR7ukfzJZ
    f5CIWh9gOF/Amyiux4ODBvMo61U3Jc3UVC5GH6RgDDma1/7U3/zzszVYlVvovFRGCIWGfw
    eR0FSHRyq4KfzGqSx38fm4/+TW33xsPGI0rRkMb8YT6JNiQiB0og8o6tMyILtVOpdB9RB0
    zL63lotg/Pa36txTSqrKwJsHfmQOBBnEV+R4n5wWq6ZzX4w2ZfLeDfVp9XMY/u31sGf8Gs
    Whd8/WU38AX11634PqkCCV1/inETB5YkcD7XCwm1ixzjvsWeZGHscx93x8ujbNSijxNinv
    u75MzmtoXKTjx0uYl2UonLYOjm9KuibX5/QW+3j1SPnStE6injzas1NPUy5IjKbmSuJQFA
    tp0f+a353JAcAO1vvtgeNXIZgxzNy0oFndBlHzwws0BdrSJUtVsMAo+PDsMaa6+6ixeUnS
    KP+USiRioKp1FxX+T30cSsenqYrbTyrooIyngSwlyzxVoP2KQGwhfqmOnaAbsaahHBbZ3l
    5/Fqrxg5RMkmgsFuUSN1yduGzA7KAlLpo3lQb0Y/onn2Gf4Vd2KNcGNdlJ3IcpAti2qnzN
    9PlzKsKehkw9K2vPJ2iJrAV/ELh0VNLY+3xIpl7IBCMt6kDO44LlSaAc2biA
X-ME-Proxy: <xmx:o0vKaibRRskxJAQolID_pv514I4fc59uswnhRmocoHEZo9tOxMDGCQ>
    <xmx:o0vKagBhl5ewb5h9G_jLpYArwRvG0s9MIZQbqkcH_xDn4B5mtk7MGQ>
    <xmx:o0vKai8DPArrHyVOkViLOl_Zu33fWakIveqcbGms-vm8Je2d3d-FRw>
    <xmx:o0vKakSRxMCigSa3AnPIAEwGBUB_Aq0wvTzrPGKdqSbhySj0DUUr6A>
    <xmx:pUvKarbo-f_iLqF0lL3-SNQiSPItyOwqkVjEuDIN5GeCsZVBW_CaHrQ9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4017232A008E; Sat, 10 Oct 2026 10:28:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A-dXEK1mihoo
Date: Sat, 10 Oct 2026 16:28:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <5e78f63b-9479-49d9-8474-fa408135f325@app.fastmail.com>
In-Reply-To: <20261010130024.177503-3-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-3-ghahramani.navid@gmail.com>
Subject: Re: [PATCH 02/24] ARM: l2c: Serialize device reads with cache maintenance when
 requested
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_072858_448362_E4C233CF 
X-CRM114-Status: GOOD (  11.33  )
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

On Sat, Oct 10, 2026, at 14:59, Navid Ghahremani wrote:
> Provide the optional lock used by the tested ZX279128S workaround. Lock-
> off experiments hung the board; the proposed API remains subject to
> maintainer review.
>
> Assisted-by: LLM
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>

Hi Navid,

This seems like a very invasive change and at the same time does not
look generic enough as it requires changes to each driver behind the
PCIe bus.

Please describe how you ended up with this version, did you copy
the from the vendor BSP (where?) or did you arrive here by
trial-and-error?

This looks related to the CONFIG_OUTER_CACHE_SYNC workaround,
though I can't tell whether that means it should be connected to
that, or if the actual symptom you see may be caused by that
workaround. Do you have any more information here? Does the
problem appear both with arm,outer-sync-disable enabled and
disabled?

      Arnd

