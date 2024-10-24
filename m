Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093DACE8E8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUliCQeZHJmI27F9phVoL4kkK8fl06AmTRCpIfcM1O4=; b=4GkYsLAkASmhjESObMib6bFU13
	IhAOiIYUhoOGt+ymFAHnWrLwTjTMkW9nWFKYKQgAjMiq5QTik6Su4V5E8JzJW7pBGjz0qYW9WyRI2
	uYfEDZqF6JTWOpn9nB9SFfmUqkt5kT8ldiXE/VBDAlZqVFyIMjDRQSOJabM7nGwy1LLSda8J34AJH
	0Qce6mor2MNndxSwlKnrkEztu2Eg2Qa7kwG9HyXql68knJ1jqLkAsKRVsmkUo9MP/nsWI01+vtUtR
	3N3e8jvFDzPlAOO/xs1Um9myeiV1q4i0mLqCbgl/jegq2petblvr4DCNHOxLhuO/2dihPxU90HezX
	ZiZeJkqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4091-00000000ziL-3eQD;
	Thu, 24 Oct 2024 15:53:03 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zrA-00000000vmF-1Nwt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729784076; x=1761320076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r86jBE+8OoJgKUMUpwbaAODQYFEMIqxXdzxjdpA4+K8=;
  b=A8aZgSuO4SU6h3TsZQgdL4eHKRG1BJSQioRNrtC6eCrb63v+E6F+FLgS
   OOWE3JPn7CfF+QKoxiNQQ0py5SXyqqPkHBDTwN+bHwyq8mkN6Ttn41J5t
   InTEtt0yttp5FuQMyTdRK7u4FnEf59s/BuHkwPFXGzX4efuQJB8kC30BV
   c/88J6SFoYar1yA+20eDlvW8HzxRe9+yRmYLDU65WrDoMnwo+J6qWK5kG
   WT4EdZ8t+0sl+84AgA6c03hlnYBn3K9sf5KSYc6LMafwyo9RxFZ+j0xj1
   zINRVckD9P/soO30Bxx5TwiiBausYJ87noHga17ciHz9zAKv6Y0FtRfCF
   g==;
X-CSE-ConnectionGUID: lwFR4L78Ss+4xly1i/v6eg==
X-CSE-MsgGUID: I6syrp77Q329J/SZvj/XqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29322816"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="29322816"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:34:07 -0700
X-CSE-ConnectionGUID: bDqK43xcSWaBDgv74YyBNg==
X-CSE-MsgGUID: /8c3sObzRfmInXX3ETIyBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80916460"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 08:33:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 95E83252; Thu, 24 Oct 2024 18:33:57 +0300 (EEST)
Date: Thu, 24 Oct 2024 18:33:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io,
	gregkh@linuxfoundation.org, wangyuli@uniontech.com,
	torvalds@linux-foundation.org, aospan@netup.ru,
	conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org, dushistov@mail.ru,
	fancer.lancer@gmail.com, geert@linux-m68k.org,
	hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru,
	ntb@lists.linux.dev, patches@lists.linux.dev,
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru,
	shc_work@mail.ru, tsbogend@alpha.franken.de, v.georgiev@metrotek.ru,
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
Message-ID: <Zxpo5VMY56iMOTWi@black.fi.intel.com>
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io>
 <20241023080935.2945-2-kexybiscuit@aosc.io>
 <64ef261c-82d0-4fad-ba8a-562f247340fb@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64ef261c-82d0-4fad-ba8a-562f247340fb@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_083436_403817_AF1058C0 
X-CRM114-Status: GOOD (  12.06  )
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

On Thu, Oct 24, 2024 at 05:05:13PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 23.10.24 10:09, Kexy Biscuit wrote:

...

> I grew up in the GDR, which was factually Russian/Soviet-occupied for 40
> years. I grew up behind the iron curtain. And part of my family coming
> from near Mariuopol.

Interesting. Let's have a beer at some point and may be talk about this
(I'm from Donetsk, Ukraine).

> They also suffered from that horrible war (and many
> of the wider family fled to Germany).

...

> or maybe just having an .ru mail address

It's not about .ru if you read the original patch.

...

> Who's the only nation who used nuclear bombs against civilians ?
> The US.

Since you haven't defined _how_ it was used, you are mistaken.
In the 70-x Soviets did a lot of experiments with nuclear and
you may find an information about, e.g., the underground nuke
in the Donetsk (Donbass if speaking of coal mines) region in order
to see if it improves the efficiency of the coal mining. It didn't,
and as a consequences it becomes exactly the use against civilians.

-- 
With Best Regards,
Andy Shevchenko



