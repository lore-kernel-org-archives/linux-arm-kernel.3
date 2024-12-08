Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28377E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 09:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwaQAzddSYnu9vcLie6k6ok9qNzm4PTtfMoMlLyy2fg=; b=pdW62QNuzI/Y7gnNjZwc+aC/3k
	hAfRD8htxZh9Bdn+0Y+TOPKT1Js0aJBUxFDZNf9GHPnBbGpMoiBGeLtyIFEdvmu332t41ka5NPuJk
	irA/9IAWe+IjNKRKWLaMLPc0bh7KH9MLtihKNMfivXo7cSBRx9usuZZsCbD1nvneWU4BrS+JHONNj
	GOSeuhRPm6vSeEQV5dDmmKfXFsm3JZT3d/lnDXpO8vlyShCTKsbRUDuXKl0j7UjF4K2Ox3Q/lMWvU
	2gKGCvgkRoovHAmea0wHcXmIbt0eXJdPChmp7oKSdjOiXEg1nqeYZyqfa87qG7hNW9WO/hBhSBny+
	/mBf/v9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKDSW-000000054aJ-2xwK;
	Sun, 08 Dec 2024 09:20:12 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKDRU-000000054S2-46WJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 09:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gwdg.de;
	s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KwaQAzddSYnu9vcLie6k6ok9qNzm4PTtfMoMlLyy2fg=; b=NV4r6sre7Ok3wo0w1M1IjH9x5v
	ilQNDn/XPZdX75phM23l8dDuOB1VNLxPMKKvbXXgd2p5V1uHMsRuNlgUvf3AeH+1FHymLdhoiVhYb
	Ysg5PIEKxMJsc40fxHSui5EdG6IyQ779QS2vQL/KCo23F0ru06QpS7EqMxsnFyRsGJUOxjFPdQrFF
	dMiLRhK4dzQ+XzC7th2Qi5Cn/nbNKPbxR8YQrAOeUvar7hboo1TVeI0RknC5cICOBS4weA5dqdt5G
	klU9eXU4tnOo08f48hmQEaTj/tdZySI5WFrnz0HUUZJt7JKdf1ztGZMduj6rbs6dzv6RXPuDvBedP
	Kjj2AMww==;
Received: from xmailer.gwdg.de ([134.76.10.29]:43999)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tKDR4-004WKp-2q;
	Sun, 08 Dec 2024 10:18:42 +0100
Received: from mbx19-fmz-06.um.gwdg.de ([10.108.142.65] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tKDR4-000HH6-2Q;
	Sun, 08 Dec 2024 10:18:42 +0100
Received: from [192.168.0.221] (10.250.9.200) by MBX19-FMZ-06.um.gwdg.de
 (10.108.142.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Sun, 8 Dec
 2024 10:18:41 +0100
Message-ID: <aeb1c27d320800dcd8375771022e11e8c27b0d1a.camel@gwdg.de>
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
Date: Sun, 8 Dec 2024 10:18:40 +0100
In-Reply-To: <CAHk-=wgVGmj+nAju2XuWWD_FZHdeytRW2XX5D-L3MqDuRRciVg@mail.gmail.com>
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
	 <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
	 <CAHk-=wgVGmj+nAju2XuWWD_FZHdeytRW2XX5D-L3MqDuRRciVg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: mbx19-gwd-02.um.gwdg.de (10.108.142.51) To
 MBX19-FMZ-06.um.gwdg.de (10.108.142.65)
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:5, sv:1733619932, ts:1733649522
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_011909_009636_B6996E3E 
X-CRM114-Status: GOOD (  19.53  )
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

Am Samstag, dem 07.12.2024 um 17:58 -0800 schrieb Linus Torvalds:
> On Sat, 7 Dec 2024 at 15:52, Martin Uecker <muecker@gwdg.de> wrote:
> >=20
> > Can you point me to some horror stories?
>=20
> So the main issues tended to be about various static verification tools.
>=20
> Ranging from things like the stackleak plugin for gcc, where handling
> VLA's and alloca() (which are pretty much the same thing with
> different syntax) was just very much added complexity, to perhaps
> overly simplistic tools that literally just check the stack usage by
> parsing "objdump --disassemble" output and then building up
> approximate "this is the combined deepest stack" call chain
> approximations.
>=20
> And even in the *basic* infrastructure like gcc itself, VLA's simply
> made -Wframe-larger-than=3D just simply not work.
>=20
> I also have this memory of bad code generation (again, this is 5=3D
> years ago, so take this with a pinch of salt: dim memories), where gcc
> wouldn't end up re-using VLA stack slots, so VLA's made the frame
> bigger for that reason or something like that.
>=20
> We explicitly use "-fconserve-stack" to get gcc to reuse spill slots,
> because gcc has been known to sometimes makes insanely piggish stack
> frames when it just creates a spill slot for *everything*, even if the
> spills aren't live at the same time (think big functions with lots of
> case statements).
>=20
> We also had several cases of the VLA's just being silly, when a simple
> constant-sized allocation just worked fine and didn't generate
> pointless extra code.
>=20
> Pretty much none of the code core actually ever wanted VLA's, so the
> end result was that we had these bad patterns mainly in random drivers
> etc. Don't do that.

Thanks. This confirms that the tooling around VLAs is rather poor.


Martin







