Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBCCE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 23:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uofQeVCfnQS/5OITtdlzxLujIg8zrMXJkUnTf7oWBc=; b=mfbhEgLISUhMXraDAcXtNcuow4
	DPKDc0gDSfRAQ1foYJtqp7BLrKm5rfvgu2qc6FjVFjmlEI/LFygrlXqskLanw3BKwYyhgQqIhUvPg
	pe3YD9cmvljQSHtZokPOENEOLMj6WYY9D4gbgEDDyJbtNLkPWSGFXOxjTw0nWxfVQ6TbF5YtQECIV
	QqarNuQ/9+GUUVrX7/DJgZKz0wo+oG7Cd9683vx5V5XDM1kjgIB3uZTHxm5kajJtPNaZLxJIHFjPN
	B+X+aAMY8icH5pOdVUi6+QVP9ieo5iRVvNJCYstZeMZfWmaKsOV7zT/+QVcKPols+0Jjqg0xz+mvQ
	YAJm2IGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK4cB-00000004a0Z-1n5G;
	Sat, 07 Dec 2024 23:53:35 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK4b8-00000004Zvg-1q6C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 23:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gwdg.de;
	s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4uofQeVCfnQS/5OITtdlzxLujIg8zrMXJkUnTf7oWBc=; b=CmNrZE4P0jxONYJaat4jzQewi8
	uviBe33yEVa7I0YkPQYqPfFDMhdBnEgOmcsT+oObSFspautqyD9K7+NUXXtVxu1XeVIXl6JC7KGl6
	H6dwOxhRXZGe6XnBirdKdXQD6LIY0tRuUo/UcGk0PrdzKMabz+9Bry1vxR9krdGuWviTpxm90c2oU
	C1U77A1oqRpy5DDRDHlLzzYJEL8XxhcDuZKTw7y5Rs/jkPhje8H0m5nayd+t7j6X7VkwPld3tqoO0
	aTyetAYnzQh1W2IYsEdIGGWhQ/okasKlcP4uRfPZkhMo2XKkY+q3YVydoDqjEBe21wZoD4GGOsKNd
	5YC4gkig==;
Received: from xmailer.gwdg.de ([134.76.10.29]:41255)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tK4an-004RbV-2s;
	Sun, 08 Dec 2024 00:52:09 +0100
Received: from mbx19-fmz-06.um.gwdg.de ([10.108.142.65] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tK4an-000QaK-2S;
	Sun, 08 Dec 2024 00:52:09 +0100
Received: from [192.168.0.221] (10.250.9.200) by MBX19-FMZ-06.um.gwdg.de
 (10.108.142.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Sun, 8 Dec
 2024 00:52:08 +0100
Message-ID: <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
From: Martin Uecker <muecker@gwdg.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: David Laight <David.Laight@aculab.com>, Vincent Mailhol
	<mailhol.vincent@wanadoo.fr>, Luc Van Oostenryck
	<luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula
	<jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rikard Falkeborn
	<rikard.falkeborn@gmail.com>, "linux-sparse@vger.kernel.org"
	<linux-sparse@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Date: Sun, 8 Dec 2024 00:52:07 +0100
In-Reply-To: <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
	 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
	 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
	 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
	 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
	 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
	 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
	 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
	 <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
	 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
	 <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
	 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
	 <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-SUB-07.um.gwdg.de (10.108.142.72) To
 MBX19-FMZ-06.um.gwdg.de (10.108.142.65)
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:5, sv:1733599764, ts:1733615529
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_155230_468960_8EC46C10 
X-CRM114-Status: GOOD (  25.75  )
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

Am Samstag, dem 07.12.2024 um 12:28 -0800 schrieb Linus Torvalds:
> On Sat, 7 Dec 2024 at 11:19, Martin Uecker <muecker@gwdg.de> wrote:
> >=20
> > But that all seem solvable issues on the compiler side.
>=20
[... Itanium, value range analysis, no assertions in kernel...]


> Now, would we want to have proper value *static* range analysis in the
> kernel for other reasons? Oh yes. It would often be very nice to have
> the ability to state "this value is trusted and is in this range", and
> have it percolate all the way down, both for optimization purposes but
> also for various sanity check purposes.

__bos should give you some access to it, but it seems not as
good as it could be (relative to what the optimizer knows)
and then the information is also not available in the front-end.=20

>=20
> But it's simply not sanely available in the generic case.

I was not talking about future still-to-be-invented compiler
technology, but about things that work today.

While the compiler can not automatically prove every use
of VLA bounded, it can reliably diagnose the cases where it
can=C2=A0*not* see that it is bounded. Consider this example:

void oob(int n, char p[n]);
void f(unsigned int n)
{
    char buf[MIN(n, 100)]; // bounded
    oob(n + 10, buf); // warning
}

void h(unsigned int n)
{
    char buf[100];  // static with worst case size
    oob(n + 10, buf); // no warning
}

void i(unsigned int n)
{
    char buf[n]; // warning!
    oob(n + 10, buf);
}

void test_f() { f(50); }
void test_h() { h(50); }
void test_i() { i(50); }

https://godbolt.org/z/b15ajTPda

For both 'f' and 'h' stack is bounded and generally smaller in 'f'.
Also any worst-case stack size analysis that applies to 'h' also
applies to 'f' (and could potentially be improved).

In 'f' one gets a warning because 'oob' will try to do an OOB
access.  This is only possibly because the compiler sees the true
size of the array.  (One can also get precise information
about the size with __bdos.)

In 'h' the error can not be detected. The information is lost.
One can get a warning only when the static worst-case size is
exceeded, but otherwise the error remains hidden.

In 'i' one gets the warning about the OOB access and with=C2=A0
-Wvla-larget-than=3D100  one gets a warning that the VLA size may
be unbounded.  These case should then not be allowed of course.

Note that this works today in GCC and seems to have better
information than __bos available (not sure why though).

>=20
> > a) this is not guaranteed in a specific situation (-Wvla-larher-than)
>=20
> We'd either get horrendous numbers of false positives that we then
> have to manually add special code for, or
>

> > b) transform the array automatically to fixed size array
> > of size X *or* something smaller when it can show this.
>=20
> we'd just do this by hand *once* and for all, and say "VLA's didn't work =
out".
>=20
> So yeah. We did (b) by hand.
>=20
> We used to have VLA's in the kernel. It was a disaster. We got rid of
> them, because the (big) pain wasn't worth the (few) places it was
> actually useful.

Can you point me to some horror stories?=20


> So we have been VLA-free for the last five years, and it's been good.
> Simplify.

These macro discussions I get CC-ed on sometimes leave a different=20
impression ;-)


Martin



