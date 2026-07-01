Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D00C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqEEA6N5CwGJ6IA3lZOQ+4Ik7bEoUp9hnbB4/W/Zwik=; b=tS1mhPtmXenE3MJYOkfmNglqTg
	Opp+0JqRPDcDjWJepVp6BlhhurpRCOmnD2k6d67Q0mr6/GOEjFZJLqs3GNgX42h9Kd4fFfZrBqU9P
	AuUG0NcYDg2WXnwihTKdRBmNns5csh8moNiZsyKJzed6/OaqtBk5ZKtk3VQJTUXgMko3hjkmR8qva
	7IHJGOU20WXpvVj5q0IcxtIiOxKqGKX8dDrMHRdUyEDle5fYTBsMuGSiqI3qFzVW167/L2Blr7LgL
	QG9DkbtjXTlLioI8s65aXLnRS9JAGYaxjC82U8jWmAl0T12MZUV4IcX7cndOgFp+MfwnOKyO36KYs
	SsHut0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weukF-000000029Yp-1kQ9;
	Wed, 01 Jul 2026 13:12:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weukD-000000029Xj-3387
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 13:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XqEEA6N5CwGJ6IA3lZOQ+4Ik7bEoUp9hnbB4/W/Zwik=; b=OkzCQlHVdrbmUw81/+eN4MCDmw
	jLWSNjX5l2G4B2naR2LnSOe9ikWjE5IPD6RQXv7TPTg89QOZK42VeP1oPDMBoUJloopt9aUi2hY7N
	bqWVCctfw8xvsVrUyJR6nbVlqopbdezqSf82Uf/WRSUdiG1W9kv+QGeixwC/OCkhIFckPU/abbkte
	kEQhIuOLS1S2xuv8j1sPw4s2O5U3RV7mjqU+sw96nHK8GuAlkEfbmYrGih/OXNXcyeH5Jix0z/N6U
	mERIThrphAumz4qN/2AX0gA8LH5o364DS6Xvoc+JU7Lb5fo6IwZ6qVjwfT7eGbpBL3oH5zKVMIGm2
	kGOTP/ig==;
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuk9-00000002oYd-1470
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 13:12:48 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4658D7A009D;
	Wed,  1 Jul 2026 09:12:39 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 01 Jul 2026 09:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782911559;
	 x=1782997959; bh=XqEEA6N5CwGJ6IA3lZOQ+4Ik7bEoUp9hnbB4/W/Zwik=; b=
	sQSfLOueyGINlkU+m6V2rhx9l6c7DSh4peFKT2GDZON3Z0C4LcbV4ctXku49JLkN
	g+HFYP+lati0duVqQNupgWCUMLIDFQb3u5OhrYunrii8zZnVegxb4bXG1TicAdTZ
	1J6fEVDY8WkbUy5NVTaQZHbsMQqul3Z67raQ5Nzixux9IEaGnMSqdnlolXzBfyzT
	1kpbhhyClY1m74WD8UisTPPxiNBiHUK1gsKQyOz/Cllu1TQyh5Cgyl797knGzYpL
	s7dHJXo95drQLrIeVLutdn2sJJ7bSvCI+vVMLkubPKL1jYBySDDrpEnCUKSb1FpA
	H1/6b8NJRdzlwIK1yB4dwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782911559; x=
	1782997959; bh=XqEEA6N5CwGJ6IA3lZOQ+4Ik7bEoUp9hnbB4/W/Zwik=; b=O
	8HXW5UO+aYHUGl4LikMybwFP5BR8Y0BseQRJoQ7MMtQtRJUW7dx0z8kecrkKp6vE
	f8gRSqm+yzPUDG4VjaFkAv1+JLHl6ByRd2Nf8FazoyogYQkRl1dvBfFjZTfQSKk8
	VyfIiwjLPmwpzhOpCtWlTevYqBX8eA9E4N4h3nnP5TwUxyn6oD0Ms4mAgBntjB+r
	wSTbF3lQ5DcPe5gBp/7W0cOrfSMl8r/ZhRyWoVzntnmXr6AlgZ8B9Ylr2+j0d2d+
	HKycxjwa4Nz/b+UGNnW2aCoD4/MAS5C6pCPkk0ZH4p5+k2Pd89IwyHTMevvk/7Ze
	tUOd+Xhn/Bgdmdpcb/8fw==
X-ME-Sender: <xms:RRJFajJNuY7Ea447a624_w6t7wruejv0IM83V3g7A6KL8oggeAQA2A>
    <xme:RRJFah-e56FYyd82CwMxPWeJjpQRTsQnlwKSbLFSNlao1NsAE5Wp-CdM4hyLbkXQE
    _DlzPAfMzoE-whGqeOAnblKj8Oai3gyJlPqRfIoY39qPxdSMlnPpfI>
X-ME-Proxy-Cause: dmFkZTGla2qQNlSZKlIqara0zN5koG4KqHg1bkjXpggyAWCLJNg2kfVgLI8lLCbuU2lk8S
    kRgH252hH9LXdkXzSDSjqALczLdLPKlEPR5SaACUkXhDXWZtx+GoScADM9yWf1unDYqP8Q
    2WSsB+yxUTjScO4bMrLoRiVJEsOVtHKynDYkTDSNlV/FlVOr++ZZbwgmEhkG986gVx8K+K
    aifgVAxvA4y5ZVbSgxsda+zcFEbK/18X5WWflJ/ywdGPJlyZMoKT8cNBLhbRk76vDXjwpw
    QLo2apXc7MtJeiGpsVVyKxyOA/SHS/M5eq8vxnr8WZeLKtuTYlVXwaw/JxEnplkTQrl3Pd
    B7NJkf2pxDtojfaBQtKKBZV/obBu6aw/ly8+Aq5oikyGZRbLPSYuUz30ITeiZegu7GL1IY
    BH+bpbU2FYzgYNvuW0kYqCdaBa94ExMmldk/xGt6dBhZaPieoYjNF9biNBBc3rgUbgmFbj
    62LsHEdx24hoFQqVnJ9a9mVEjsfGg3qOJ5+MN46JlrX9eUQauDWHHEy0Awb0Lne6WNgaUO
    4yVurEkxq/P/EbUXu4DrDTid9azOO9+oXTmhGP+PV4UklaisM4awcqFWxNagTgrY4T7xHu
    8B7GWHRFLuVtfbbi9R9DHc8ER2iJp174rEfUAKSD/WUZBfVxKq+AH24iHCTA
X-ME-Proxy: <xmx:RRJFalJN2aoA8kDFMua_h-i5Chn-r0wU-KwqgCI_zyQFyJxETPlNhw>
    <xmx:RRJFajzXivGAASdZ72Is3bie1NpvnftEdIUPxmclVvZbBh4i5pzhmg>
    <xmx:RRJFatM652J4WnFqkRON4WLzi44_c61ZybTn0ej-5qq9fbWYJQjNfA>
    <xmx:RRJFanuRV787OOoAY7DQlxvI-5sNjEiRW1y01nGxGmEYB1CpRRmLyA>
    <xmx:RxJFavp-QxIqJqyh2AhOILa9hNEeIKNUBd7uz-YJn9OT8avMOzD2XKsB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 537641820082; Wed,  1 Jul 2026 09:12:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AE-5y0c3-Pto
Date: Wed, 01 Jul 2026 15:11:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "John Stultz" <jstultz@google.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-api@vger.kernel.org,
 sparclinux@vger.kernel.org
Message-Id: <a512dc5f-0734-4bd0-838c-61c8820e5f6d@app.fastmail.com>
In-Reply-To: <20260701102912-ea8f3291-7bba-407b-9a7d-7c367a4c9398@linutronix.de>
References: <20260630-vdso-compat_32bit_time-v2-0-520d194640dd@linutronix.de>
 <20260630-vdso-compat_32bit_time-v2-1-520d194640dd@linutronix.de>
 <0cda7366-2eb9-4ecb-b76a-b3b68ee10043@app.fastmail.com>
 <20260701102912-ea8f3291-7bba-407b-9a7d-7c367a4c9398@linutronix.de>
Subject: Re: [PATCH v2 1/9] time: Respect COMPAT_32BIT_TIME for old time type functions
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_141245_550274_F578949C 
X-CRM114-Status: GOOD (  24.83  )
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

On Wed, Jul 1, 2026, at 10:40, Thomas Wei=C3=9Fschuh wrote:
> On Tue, Jun 30, 2026 at 03:00:37PM +0200, Arnd Bergmann wrote:
>> On Tue, Jun 30, 2026, at 09:38, Thomas Wei=C3=9Fschuh wrote:
>> > The "old" time types use 32-bit seconds which are not y2038-safe.
>> > Respect COMPAT_32BIT_TIME for functions using those types.
>> > time(), stime() and gettimeofday() are disabled completely.
>>=20
>> Looks good, yes
>
> Sashiko found an issue [0], which I think is valid. I'll change that f=
or v3.

Ok

>> > settimeofday() is kept as it is required to do the initial timewarp=
ing
>> > after boot. However the 'tv' argument will be rejected.
>>=20
>> Not sure about this part, did we already discuss this last time?
>
> This is my interpretation of [1].

Indeed, we did.

>> I can see how keeping the timewarping functionality is the easy way
>> out, but completely disabling the settimeofday syscall the same
>> way we do on new architectures seems so much more consistent.
>
> Shouldn't we then do this completely? Irrespective of COMPAT_32BIT_TIM=
E?
> And then remove all of the timewarping and kernel timezone bits.

I don't think we can simply kill the timewarping code since that
likely has users on architectures including on x86-64.

COMPAT_32BIT_TIME=3Dn is somewhat special because this is an
intentional (and optional) ABI break already and requires
updated userspace that avoids the time32 syscalls. Having the
timewarp still in settimeofday() or dropping it entirely is not
that different for userspace.

I was slightly worried about whether returning -EINVAL or -ENOSYS
is the better option here, but I think your choice is the correct
one after seeing that this is what glibc does other invalid
cases, and that in all of codesearch.debian.net, I could not
find a single caller that would care about the difference.

> It would be nice however if this series, and my other ones blocked beh=
ind it,
> are not blocked on that larger rework.

Sure.

I think you can go ahead with this version. I would prefer
to not have any settimeofday() for the COMPAT_32BIT_TIME=3Dn
case, but if nobody else has a strong opinion on the matter,
let's do it your way.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

