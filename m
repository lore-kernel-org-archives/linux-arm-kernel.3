Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5ACC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIbCfk8y2IjbAZapjwVey8Uxih3ud+qKuX3hj6DNsxU=; b=dub/LXfy1vct/tdxXMlaZN/m7i
	zXDpe9N2mN4EmUZ1ryarnvJRVtfvABKCJW6tm6SoJ9dVA8qdURs5g9aTQL18QVX4/kTyUj/9b52Ke
	fk/X5CGvBqkpMaXFUyTaSdHA00UOaRUtZtOHVhHGTllZ19xitPTvFf2h+HMlX1py2Hn7Xz+KSYTVv
	Hwc5zRdtj0e8KXPwtqnQj9Q26rCpI9rUU5hHWodlgN21/faiRelPZKMaVXuggnDieVrfqSWxt09FT
	rC0Ye678Q0kEvRyf382/q+021ftDNya+a/ncR6cELcYDrzRLwIQSxrMTTzRWL/D7FmdwYqvDtbJ4/
	/xwlS/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wng2N-00000000Zz7-1C7G;
	Sat, 25 Jul 2026 17:19:47 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wng2J-00000000Zye-12NM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 17:19:46 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id DCEDCEC00BA;
	Sat, 25 Jul 2026 13:19:39 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-03.internal (MEProxy); Sat, 25 Jul 2026 13:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gruenbichler.email; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784999979; x=1785086379; bh=BIbCfk8y2I
	jbAZapjwVey8Uxih3ud+qKuX3hj6DNsxU=; b=dR0LsHgxMcJ9sDVHlkUpnJqz+c
	qoKUJ/0bmz5UGHke9OHkrEhBelEdQ/pEQyoFx7z1wkmlbpBRiPoOYwwcuJvAbXWJ
	aInLfuXF8wCyLUE3jEwdDfEt62xe1TwkvCHAUTBDHkeWIPQAwxUtEwy61F3j8nls
	CbRUmtTLcwUCJyka8hzVGyXpsYj/KJlQfel1LTtbwzW31Mqv9Qpru0ChiF6kyvWW
	+HRQmYg9LZWA9tK5qkFd2odWXIUWTw3C5c/eRvEs5LIUmVa+9ytIFHzNZTTHqKqT
	ucBBjZPaz6vsXt8EnEcc7q5QTtIXF1/PpU2YHJwqW8PoTTklAJyV4LD39RUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784999979; x=
	1785086379; bh=BIbCfk8y2IjbAZapjwVey8Uxih3ud+qKuX3hj6DNsxU=; b=k
	kzJD+wO83hZFJJH1Mw4yX/toKIWWlRDCEVvd4rVLV32XVJny7n4TUxVraJEdYbJs
	4la1UOwLWB8l1Ek4RL92z8PBPlAYFA7cK4+Lux9yEsW2V6jcC9Qbdb+YAKEBIgqg
	+Z/UkQ5dZ1n5my2GGfox5hfNfBXLeLtNXEc5BwbUtjiKa9J+X6vsLDXGkiiQuWml
	tkPGSN9+v9G2dYmPzfEGggTH/SMPUWFRtMeWgM8CEMUDMdoAjHftYqLrSAzUgB/h
	0yaiLKJpUd+FKDJ7WqBm4Ak4XQobh6RzujlcwkrFYgVaxprCRM7ylYMlNH5XRvgT
	LGNx31kHw/W515SrzxGcw==
X-ME-Sender: <xms:K_BkateFVty2xQJwTnWSIggiMZBoCyRHUAgu1q_HP-LN4MAuabZ4gQ>
    <xme:K_BkamD62Dwj003M3qLE2Q3U0OE-cMXPx-kIiykhcgk6nlF3jfRl5Qbxgytm9Xe1_
    F_mjAyXQDNxfKaqkTOx5FuzmMrgNcvVBtgbERHLF7OpnVZbcih0qEE>
X-ME-Proxy-Cause: dmFkZTGAtxvyazyv6rGowEs3U3z62csVYtGXRZKNblWa03nS3js855jT8l/6QH9uv+T1+i
    4ruddSY+OmUgtSKp+jweMKfnFM5AaeTaVuJsB6AGbM6+zwURViaRLNyIFCX9+hhhGo1QES
    iAhYiHkUzZvgeBi4y5M/mp5KRXXxGoeqJ4H9qLXUNM5vCg1K6JFXryB3dEwVJG0ePZcWe+
    LOxZkMl3HpI4glS5JEk95kb59XjpRg+mI8uM3BOjyYj8gg782K98nFUULbMOKGLE5n/THM
    4N1opd3+ahYt/h0tr9os8NnHtVlFiSEkCzCSOfynl0Iqvsyx3/o3HlwqRv839TJ6JJKSIL
    m7jub/gwioEz2wpLNdPjk4x7OOdc0BMT54RU66kmLjDogVVBVydv/9EIFAYJun8K2/IT7Q
    7iWcOYW6ZMoAXAfllyhk5q9fH7b7+rFd+pO36xX7O6goH/KJluAZgqNbs3Um19oykHAthW
    5sBNZE/pzdAYh49XVUo2UYuws+DBS4lb2mMspTFhM6c/WFQrATPwkPn0Z5SWguR9T/THUC
    gUq36D3W+esrvvgn6iqwqMD4JVUAmLYTdk4yOi/ZJKfdB8ZwrC9fOWXp3VpEbpqOJzh5lE
    cCPUMbCNCZeEqv4PSAW3OJlpp42jVUmBf81Si9I0XeYT4Juup2r21hRHytJQ
X-ME-Proxy: <xmx:K_Bkao_Yc_L8IjHMHs2tKQWBSp_KQavdiweuvnaLQvY7Cg-QRBE56g>
    <xmx:K_BkajywLCaAqhbbwanF2AIl0zVY8ToXoITKyfcHXPBaAaDmNgCQww>
    <xmx:K_BkaorJykIK81PQzc_f3f-yj0oy1WlKxSXj3yYAD0MmMvfXPeh33Q>
    <xmx:K_BkakpDpPE_47eru9Jn74yJN2grvADmE0MvM1rs-d70Rppb-U_dKA>
    <xmx:K_BkasWiuHZRi2yi16tJoISW9ahepGRm7HmQ4XyNhmwVc527S9gd3KOS>
Feedback-ID: i1739464b:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 915661820082; Sat, 25 Jul 2026 13:19:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AJ9MI3eEke2w
Date: Sat, 25 Jul 2026 19:19:19 +0200
From: =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,
 "Christian Schrrefl" <chrisi.schrefl@gmail.com>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Rudraksha Gupta" <guptarud@gmail.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <18cf2372-0558-4a90-8faa-bdb2ca1cef61@app.fastmail.com>
In-Reply-To: <CANiq72nFZT0ZZS1R82qVjPg4A=FEU675-3yx+tv3XVA=twnUWQ@mail.gmail.com>
References: <20260331190053.482607-1-ojeda@kernel.org>
 <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
 <CANiq72nFZT0ZZS1R82qVjPg4A=FEU675-3yx+tv3XVA=twnUWQ@mail.gmail.com>
Subject: Re: arm `rustdoc` Rust 1.85.0-only build error
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_101943_856093_8AC7D8F4 
X-CRM114-Status: GOOD (  14.99  )
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

On Fri, Apr 3, 2026, at 12:19 PM, Miguel Ojeda wrote:
> On Fri, Apr 3, 2026 at 10:12=E2=80=AFAM Fabian Gr=C3=BCnbichler
> <debian@fabian.gruenbichler.email> wrote:
>>
>> I will check how the full diff for 1.85.1 looks like compared to just=
 picking
>> the rustdoc fix referenced above, and then file a stable update reque=
st. AFAIU
>> either option works for you?
>
> Thanks for the reply and the details! Yeah, the timing was unfortunate=
 :)
>
> Either works for us, in the sense that it is not a critical issue
> (i.e. it is just for generating the docs and just for arm32).
>
> Having said that, having the actual .1 release there is nicer in that
> we could consider raising the minimum version to that one (or perhaps
> at least print a warning if using .0).
>
> It also means we may get more focused testing and one less version
> around (e.g. currently I found this because I test our minimum, but
> generally I test the latest point versions).

Happy to report (with some delay ;)) that the next stable release of
Debian Trixie (13.7, planned for 12.09.2026) should contain an update
of rustc to 1.85.1, which got accepted into the proposed updates
suite today:

https://tracker.debian.org/news/1778462/accepted-rustc-1851dfsg1-1deb13u=
1-source-into-proposed-updates/

