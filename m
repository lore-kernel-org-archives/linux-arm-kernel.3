Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D2BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 22:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hjn6OQfKcnQqzXpH9VPAPsfgl9EOnFCHDZpoojninHo=; b=I9jQXS/WJmx3nxDhmSSoYZfvhA
	SW0rhdLBgI+H576vlZKtkW8Zo6X9j01ij+DuhEkae2iLWmkQu/ZfxG4K8jR+TbBgkmmYTsE474VWC
	DF/A9DW2hRcj2y7WJS39Fn/iATi6Wo8ta8oaQo2wgMDRyBLbIvExyvtsGycc4w0t3TOO9rtPFg7R+
	r2Cqlr+0rgreL/Z5kRuOMXtYkvFU+ObgSwDh1yWMaSVVFsKeMph5pSib8emtXyJ1xzu//thO+GBva
	YPFO9JWMMOU3hYb7cf5+axsLQPB3KoDuzD1983lP9HO7nDPYJNRhUG3D0mK8Zn2cW2E7dCC/duogo
	IKMQK3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyIbF-0000000EQyA-47SE;
	Fri, 28 Mar 2025 22:54:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyIZV-0000000EQlb-1DnC;
	Fri, 28 Mar 2025 22:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C37B9A43040;
	Fri, 28 Mar 2025 22:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353EEC4CEE4;
	Fri, 28 Mar 2025 22:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743202383;
	bh=uMHCMkIp1JpzwK/KslzBXCnJB3B/qFWTnmOMAK1in40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ILMyTjyBso7K5+o4nbs26Pn5cHVWQm2GLLUBUU6L6Xi+fwqx2KCM3V3LBajgA8puB
	 KnrvP/bQN8GP5OomQ+aEM6tjBdfck+qoFXs8ztHAbcsuc/oeySEGgq4ad2PiOAdMnP
	 tYCiaYsel0JulQkbsLDNglaz+OTqx9udrazM6AgY=
Date: Fri, 28 Mar 2025 15:53:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, Rae Moar
 <rmoar@google.com>, Maxime Ripard <mripard@kernel.org>, Kees Cook
 <kees@kernel.org>, Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Daniel Diaz
 <daniel.diaz@linaro.org>, Arthur Grillo <arthurgrillo@riseup.net>, Naresh
 Kamboju <naresh.kamboju@linaro.org>, Maarten Lankhorst
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
Message-Id: <20250328155301.ab5514e2ab8043512a8527bd@linux-foundation.org>
In-Reply-To: <a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
References: <20250313114329.284104-1-acarmina@redhat.com>
	<202503131016.5DCEAEC945@keescook>
	<20250313-abiding-vivid-robin-159dfa@houat>
	<c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
	<20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
	<a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_155305_482253_1092F695 
X-CRM114-Status: GOOD (  17.96  )
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

On Fri, 28 Mar 2025 16:14:55 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:

> On 3/13/25 16:05, Andrew Morton wrote:
> > On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> >> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> >>>>
> >>>> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> >>>> very noisy tests much easier to deal with.
> >>>
> >>> And for the record, we're also affected by this in DRM and would very
> >>> much like to get it merged in one shape or another.
> >>>
> >>
> >> I was unable to get maintainers of major architectures interested enough
> >> to provide feedback, and did not see a path forward. Maybe Alessandro
> >> has more success than me.
> > 
> > I'll put them into mm.git, to advance things a bit.
> 
> I haven't heard from kunit maintainers yet. This thread got lost
> in inbox due to travel.
> 
> David/Brendan/Rae, Okay to take this series?
> 
>
> Andrew, Okay to take this through your tree - this needs merging.


The review for 07/14 made me expect an update - perhaps tweak the asm
constraints and add a comment.  This can be addressed later, as long as
we don't forget.

However
https://lkml.kernel.org/r/20250324104702.12139E73-hca@linux.ibm.com
needs to be addressed before a merge.  The series in mm.git breaks the
s390 build.



