Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85703C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 22:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpuJBfj4YfOINR+VXZBhnhFTAoBd4mouqbTBAFoVBos=; b=r7YFYVJTknmDuckg3XQOnoTIBE
	6ndReUc5aZA/B1IZFaXnlxRq9aFKIxlN+fdsjyaswhZnVXzOuI4hPQ6meFX36xhYkCULbosVxMSxh
	miZrz4O+auk3IUTuKl+xFQuG1qFkQIpDfW+Nnos7+JmML32WwzhVXBS4Si6Tp/N7y9t8hEkOa72hr
	S+xCsLcvN1u3pEH8zJnCmCZWl0gZfXWkptHNWgMBpgWuxrpcnGvWtdj2hVzDi91e+IgllbJnp0UOR
	UbcnD5lN6p6ZgUB/NL/7zmT4cap2zp0YuXFEmpX/+6mcwTUwbbOIdTeCeXZKoFr8yPDAqye2YHBNo
	wpg3euEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqiw-0000000Cad4-3O8I;
	Thu, 13 Mar 2025 22:08:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsqft-0000000CaAb-1pzv;
	Thu, 13 Mar 2025 22:05:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BE875C5F70;
	Thu, 13 Mar 2025 22:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6615C4CEE5;
	Thu, 13 Mar 2025 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741903506;
	bh=GxNzFgXlCVEFcpDf3VLptEglWoUTczleCr4VuzyQIr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vNslcPvdVPNB7E9fplso2uwQWydxF0LuafyC8Ekj6LJ17WeoKPzAu1lWUeLyq4wyx
	 YSG2VtnirdV4PAoDW58QNKBURHFBXAkymAmOjx0cdlO9qH75IKZQbVpmmhcAjZ7EP7
	 0n/ABlCGS0sNpOunuAQvLiC/vVhLZ4IVMsVmABVs=
Date: Thu, 13 Mar 2025 15:05:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Maxime Ripard <mripard@kernel.org>, Kees Cook <kees@kernel.org>,
 Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Daniel Diaz
 <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, Arthur Grillo
 <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Alessandro Carminati
 <alessandro.carminati@gmail.com>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-Id: <20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
In-Reply-To: <c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
	<202503131016.5DCEAEC945@keescook>
	<20250313-abiding-vivid-robin-159dfa@houat>
	<c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_150509_544998_8EF718FE 
X-CRM114-Status: GOOD (  15.85  )
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

On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:

> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> > > 
> > > Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> > > very noisy tests much easier to deal with.
> > 
> > And for the record, we're also affected by this in DRM and would very
> > much like to get it merged in one shape or another.
> > 
> 
> I was unable to get maintainers of major architectures interested enough
> to provide feedback, and did not see a path forward. Maybe Alessandro
> has more success than me.

I'll put them into mm.git, to advance things a bit.

If someone wants to merge via a different tree, please speak up.

Hopefully the various arch maintainers will review at least their parts
of the series.


