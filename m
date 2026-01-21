Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5100EC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 23:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jO675eSvdWE41Js38dEStju+QJnP7I+5A1hWvORM2U=; b=x43vZlIEc7nwscnBtVJOVFpK/l
	jfuZ8qDXW0vCo8QqgMb1wGFdvrgU9OsbW458/CXDHJCPXVDD3WzjRv47U59cK4TAecGLTIikVFdlC
	Q6J7k0E6epiO593QtyvltEoDKqDdT6XIXu+/m5JCv7w/fF+MkJkoqlT92itwLzZrM83wciHDBla2X
	Jcm60TcW242ZqAzhIO1jMhdrSCBC6FOoDA2d/PzLuyEoMpxAppZdQ01EOj9juohFZBZwqXqUGH/5Q
	P/+ZN17yYyA0XnYwwgtJIKUKsZSdvlLMfLwZVPqx6QUEr4Jl3NV7YI+h51B2yx/xULzs29Nn++m/e
	wKuWdpMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihFI-000000068pS-47M0;
	Wed, 21 Jan 2026 23:04:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihFH-000000068pD-1N84;
	Wed, 21 Jan 2026 23:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3751B600C3;
	Wed, 21 Jan 2026 23:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4FEC4CEF1;
	Wed, 21 Jan 2026 23:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769036653;
	bh=bicMi5K8e0B0bp9gSrJTYl5RYIvmgDkMATFB4TZCQLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHfQJHddac0k4J6Tc/1P7oFnqeTw3s9eyMEiKLF6XhkkXbmW3Am0ReKC9DLA6UVwb
	 z/QZjN54GV79pn6NpBuVcSJRqUq6whka+8q9xpqyJeerFnATA6lA5PcrLhEZegM178
	 53+7d2yvbafoYE7uwLRwI/hKY+NH7aRYe5OvPHyO5d476sXqwdnBagVGa3v1ztCm4y
	 HAN5SBcNDpFac+VWxA7Rmkk04B8dqLxs2pzZWIfvRB1Y+y6dnwshyyFkPoPC899qkC
	 iDUSaK4MHkOhqsMacAdTfcNURN6kJiKS//ev5JXi4zNkFkLF8BCUNTr6bQAoxBZtiv
	 yWBzc8CgzpeAw==
Date: Wed, 21 Jan 2026 16:04:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: kernel test robot <lkp@intel.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH v9 15/17] media: rkvdec: Add H264 support for the VDPU383
 variant
Message-ID: <20260121230406.GA2625738@ax162>
References: <20260120222018.404741-16-detlev.casanova@collabora.com>
 <202601211924.rqKS2Ihm-lkp@intel.com>
 <69fda4f0136285e4d2f86e7e93d5bdd812c1d47a.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69fda4f0136285e4d2f86e7e93d5bdd812c1d47a.camel@collabora.com>
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

On Wed, Jan 21, 2026 at 09:46:48AM -0500, Nicolas Dufresne wrote:
> Le mercredi 21 janvier 2026 à 22:27 +0800, kernel test robot a écrit :
> > Hi Detlev,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on rockchip/for-next]
> > [also build test WARNING on linuxtv-media-pending/master media-tree/master linus/master v6.19-rc6 next-20260120]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/media-uapi-HEVC-Add-v4l2_ctrl_hevc_ext_sps_-ls-t_rps-controls/20260121-071026
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
> > patch link:    https://lore.kernel.org/r/20260120222018.404741-16-detlev.casanova%40collabora.com
> > patch subject: [PATCH v9 15/17] media: rkvdec: Add H264 support for the VDPU383 variant
> > config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260121/202601211924.rqKS2Ihm-lkp@intel.com/config)
> > compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> 
> Modification has been done to reduce the stack utilization on clang, though we
> believe we are hitting limitations/bugs on older clang. We went ahead with these
> patch by updating our CI to clang 21, which allocate a lot less stack with KASAN
> enabled and this code. Our general advise is to use a newer clang, or GCC for
> testing with KASAN.
> 
> The stack utilization is caused by the combination of loop unrolling, agressive
> inlining, and write operations to bitfield (which requires the compiler to
> generate more code for memory checks, since the writes are not aligned).

Yes, this is an area that has known pain points, even in current
versions (but it is certainly better in most cases):

https://github.com/llvm/llvm-project/issues/143908
https://github.com/llvm/llvm-project/issues/115862

Thank you for working around this.

Cheers,
Nathan

