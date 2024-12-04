Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9136BE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 00:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61SmXPB1pqUq0dTHUQbrnyBHYgFk//AhCJ0oubFb88k=; b=ZkWEstixq8zrxjJdWbH+FIqLjJ
	L4FB/C3QHb/56/uOjixpw6yl2SVK4/k5+8AptI1mF3AgbzpLNdaD3u33N+VK5JJlS9QpwF+v96Yha
	pVnyyJMyO3iVv9ajK3XgShhdF9OrFkZeWMrdsGy1DFaBnlJNlk7EOp/HQa7WSDsa/uFY9ldHQnTOX
	XIlBWGHUgwxfU9Pf/cUV8DkSzTP2cel71fyFc0S/sCol67lWvjpKQ+hY6JjCFh/V8gURaXzbLAvdr
	TSQ0gYCzU9S5p7zgi/1GT+z/SRaUSqPVNAkO4gJPfTO5FhdnW/t81KqFAolSaSf6b3shbBiBPhFLy
	R8Pd6U6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzHb-0000000EGe1-2RrI;
	Wed, 04 Dec 2024 23:59:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIzGa-0000000EGUp-36MI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 23:58:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E17925C6E03;
	Wed,  4 Dec 2024 23:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB77C4CECD;
	Wed,  4 Dec 2024 23:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733356727;
	bh=SfP6s4VIWMTbvk2G5z6Y+FMQluZGJn5y1iWBpbzQLUc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=PuwxZRtU1iEBR/hrQMvR1LQ1CsjdX/f/kpaeCbz5fjMfNxC+GosCTzHqeudqViaOp
	 2ByBbMc0Xx7W6RQa45NHVJrOc08iwMl4EMELNSi73UKzocDCFK/cXH+k06ZX7fy+AZ
	 Uos7beTN5nbUG3fLgt+9mc5/mrID4QO6b40hz6xhx+/bMQMX2uUsS4/iLjMC3Am76c
	 +4Hi2+CPbMm0bju/NxMSwHWGmn6nF9BQ3EWk/NBi519OE+V43OAyoZ3LrofjbipWHf
	 UGGDPVG5ToCDAMjPrZujCikcuAgIft5iQMchwh4MM5duEzj+UnwtisVNrEFEcPDjTI
	 B7Ajhpsb+SmqA==
Date: Thu, 05 Dec 2024 09:58:44 +1000
From: Kees Cook <kees@kernel.org>
To: mailhol.vincent@wanadoo.fr,
 Vincent Mailhol via B4 Relay <devnull+mailhol.vincent.wanadoo.fr@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Laight <David.Laight@aculab.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
CC: linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_00/10=5D_compiler=2Eh=3A_refactor_=5F=5Fis?=
 =?US-ASCII?Q?=5Fconstexpr=28=29_into_is=5F?=
 =?US-ASCII?Q?const=7B=2C=5Ftrue=2C=5Ffalse=7D=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
Message-ID: <FBEB24FF-5885-4938-8D1C-9B7BA9071FB9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_155848_866377_6E0E2FDF 
X-CRM114-Status: GOOD (  13.18  )
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



On December 3, 2024 3:33:22 AM GMT+10:00, Vincent Mailhol via B4 Relay <de=
vnull+mailhol=2Evincent=2Ewanadoo=2Efr@kernel=2Eorg> wrote:
>This series is the spiritual successor of [1] which introduced
>const_true()=2E In [1], following a comment from David Laight, Linus
>came with a suggestion to simplify __is_constexpr() and its derived
>macros using a _Generic() selection=2E Because of the total change of
>scope, I am starting a new series=2E
>
>The goal is to introduce a set of three macros:
>
>  - is_const(): a one to one replacement of __is_constexpr() in term
>    of features but written in a less hacky way thanks to _Generic()=2E
>
>  - is_const_true(): tells whether or not the argument is a true
>    integer constant expression=2E
>
>  - is_const_false(): tells whether or not the argument is a false
>    integer constant expression=2E

But why make this change? Is something broken? Does it make builds faster?

> 7 files changed, 97 insertions(+), 84 deletions(-)

It makes the code larger too=2E I don't see what the benefit is, and given=
 how much time has been spent making sure the existing stuff works correctl=
y, I feel like we should have a clear benefit to replacing it all=2E

-Kees

--=20
Kees Cook

