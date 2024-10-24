Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70EFCE8E8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zi1gsb8x91q5dzVutWx3laBXoEOBLem2sc+8AZKKJQ=; b=cIKOvHgZ79W8eYu/ZRWkyzotee
	RGKJvxzu/jQCHgzMudGPGxGtlxGwmiMtVFT2h0LeWkefmQhkT94OBzmYqm5nPrP5wriIKER4MA3CH
	QGWW25Xn4TEXncLUJdLTdaQZB1kQoEm0YqFlHo+jEHtGbA+7YfsbbI+8iKyx6q134diA1dx9grFG9
	8sbZtXeU0pwe5rY4BY14Eu7HDzRkccuAjzXAyuqihmUJGTnGKcfcHA0IaEidSfwvkhEdJAJasL0wo
	xK0OM83IFd6sLCKKKD9QzvXi/zyJQpLwp+BTqJwT4ic2I+6ZDHVkwslgEYWz3tPiHaugvjkwZRP52
	jqLA6u4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t405N-00000000zIW-3Saa;
	Thu, 24 Oct 2024 15:49:17 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zxq-00000000x5B-3czg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729784491; x=1761320491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pldgdaG5MLkDB2a4oyN8yKvYJku+F7JY2MI4zp+PqSM=;
  b=OSnoUc7Z5LnV2hd4MDQFR9Uq6N7y7Y4gACqn0AfDTvqcGvs8Cymm5+JB
   RvLMffvcQVsaz24jjl88Noclcu6s31C0aiIB1EfOrl1FnLYCvaM8ittDy
   JGxNh/uofO+qGr25pH3vEEa75g24nIbyNCuayjhrEZJtPcuh480RS5poT
   3JWce9RYBcZtVHyKwCmgkSUNazhU77LSv0PrkZoV5A68GES3hFDU6Tguy
   Xxf5TSEEILTjO/ESJIYj343Yi+oQrmMtF53dKvjirv1nnnulDSQUWIU29
   KAkefI/j67dxMXDeepyMcMsfp9jhoOY2PqDh0LnKK2MlfkQ39ruSGLjEJ
   w==;
X-CSE-ConnectionGUID: BXsbITE5THSBupb9F7kq6g==
X-CSE-MsgGUID: Q29wfDFuR8+c3gW0AQH/IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29641139"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="29641139"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:41:28 -0700
X-CSE-ConnectionGUID: 6VCIzl9NTYSCGVZmLeyxaQ==
X-CSE-MsgGUID: NAmPtL4bRVi0gWH+HPOjZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="85734765"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 24 Oct 2024 08:41:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0FD9B252; Thu, 24 Oct 2024 18:41:17 +0300 (EEST)
Date: Thu, 24 Oct 2024 18:41:17 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Ivan Epifanov <isage.dna@gmail.com>
Cc: torvalds@linux-foundation.org, aospan@netup.ru,
	conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org, dushistov@mail.ru,
	fancer.lancer@gmail.com, geert@linux-m68k.org,
	gregkh@linuxfoundation.org, hoan@os.amperecomputing.com,
	ink@jurassic.park.msu.ru, jeffbai@aosc.io, kexybiscuit@aosc.io,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru,
	ntb@lists.linux.dev, patches@lists.linux.dev,
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru,
	shc_work@mail.ru, torvic9@mailbox.org, tsbogend@alpha.franken.de,
	v.georgiev@metrotek.ru, wangyuli@uniontech.com,
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
Message-ID: <Zxpqnf1M8rPTB4DN@black.fi.intel.com>
References: <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <20241024095708.189649-1-isage.dna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024095708.189649-1-isage.dna@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_084130_946562_0BAF884C 
X-CRM114-Status: UNSURE (   9.81  )
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

On Thu, Oct 24, 2024 at 12:57:08PM +0300, Ivan Epifanov wrote:
> 
> > I'm Finnish. Did you think I'd be *supporting* Russian
> > aggression? Apparently it's not just lack of real news, it's lack of
> > history knowledge too.
> 
> As an avid history lover, you've seem to forgot, that Finland fought on Nazi side.
> So yeah, we're well aware you don't like Russians, unless they're in concentration camps.
> Which is exactly what you do now: segragate, based on nationality. Strip of credits and names.
> Once a nazi - always a nazi. So, fuck you.

$ git log --author="isage.dna@gmail.com"
(no results given)

Q.E.D.

-- 
With Best Regards,
Andy Shevchenko



