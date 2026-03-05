Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0525AF47CDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPF/Q7ncQZcbDUXuzcqWPm9P90x5P/esUaASP+y1v2o=; b=mLCCNGw8IVX/9VI7/b4z+5kWiX
	Z9DRT0RjDh+/AsxbPuC7vZzrvCxITKIgLihw9QiD01vXNHRT0Vdznn6eW5v2EYx0UZbTp+0l3VZTw
	8ImCJPXZbdvXRQRlXcMeCOVSScv8rB/GLU/VsbJqKwaH4oLqPK2ItcnKa8urOmS8jmGrGjwb3Nd5m
	PXDEW0xdfiH1h5R2xLA6S9CD267N58rBJKAHeXNAplYcV2LqpFECDMa6qO1478VAlo+ogfRlYiNL/
	Xe3gj8kdUdjMi46DLglYZO8fF9OaY0tCBnbhreE5OgYWDSCgL3BqSZt4tPgzU9WoEgm5zPG4ckDoZ
	HRYgQ5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGCQ-00000002aMD-3k5Q;
	Thu, 05 Mar 2026 21:25:38 +0000
Received: from mail-106119.protonmail.ch ([79.135.106.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGCO-00000002aLt-0LiY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772745931; x=1773005131;
	bh=TPF/Q7ncQZcbDUXuzcqWPm9P90x5P/esUaASP+y1v2o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=D/mneLLFVs6r0IvF+iCRfj60Ah/EZZuLEfnUlva1LdL5DC82Vz9Qw/VqefhhANJWp
	 WDyIrKxz8tdw1gjxkMNCbBDQaV2m8g70kPhDvDgqzjq10LWdXthhW3sqaOhboAVimN
	 fx+5VJ1BndeTf8PTDE7XZ5c1QF09c544w9woMA5NGpZE1sAIC1ejlnCTGEAy+GkzoO
	 Np3S48Ku9tVqsimRsmAltXy1/WyBD31pdq4wHYtO5HTpRIAD/yUzeNKjaEYjiGM7A1
	 xRIXcWjq7VefAOsjRln3WzSuL5V/BJC8LgLU2T1zJl/RE4F5LnsI4Q9CZOfSXLfeSb
	 guSupu87mt2BA==
Date: Thu, 05 Mar 2026 21:25:26 +0000
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Samuel Holland <samuel.holland@sifive.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
Message-ID: <aan0qbP0iV48bih-@wieczorr-mobl1.localdomain>
In-Reply-To: <CAPAsAGyiukChPLYO_tQci-7Bvmnnxh+w=bO6eUYLrO3RVuUThw@mail.gmail.com>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me> <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com> <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain> <CAPAsAGyiukChPLYO_tQci-7Bvmnnxh+w=bO6eUYLrO3RVuUThw@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 2a85cbea50d69490acd671149ee415089f8f199e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_132536_305260_611490DD 
X-CRM114-Status: UNSURE (   4.64  )
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

On 2026-03-06 at 06:22:32 +0900, Andrey Ryabinin wrote:
>Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:
>
>> Thanks, that looks really neat! I should've thought of that instead of m=
aking
>> separate arch versions :)
>>
>> Do you want me to attach the code you posted here to this patchset or do=
 you
>> intend to post it yourself?
>
>I think you can just squash my diff into the subject patch.

Cool, thanks, will do!

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman


