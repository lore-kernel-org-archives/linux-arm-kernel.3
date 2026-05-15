Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73463CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8bFFpy7vAgyFoeBTkcLLUVME5xCxm2dioKs7bupTms=; b=ZrAh+HHy79u68IHc9FeEITI7sQ
	D59DiYALYwjXFxZLOOlinjDRZn6Wjvys5SfJcd5SyfE7zPGsytAc1SgdxIZlgz/6URTd7ysYD+Lrv
	dpiUiH3j8YC+aZljMgFaB5uYsWQ5v4ZMAp6F3vXJoqk41PQE6MK4wP05ofS4xsIBe2Srp+teOvTqt
	haVdUk7OgRxRXrUkW1kZ8374bo/1FcrHTYo1MDD99JzeSLmkFgUwe0ebRO4g1+0bdOrDoQ63DXA/C
	yHg0bL0v/3mU0GXpAYoCbKBa4SFuITPiYCwqbN3s4hWnBh1GbqjLRP2KeEo7YsTQj2Sa8WK1UCWab
	T6MBXWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNn6j-00000007dMv-36M5;
	Fri, 15 May 2026 07:37:17 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNn6h-00000007dMO-1lQA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 07:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778830636; x=1810366636;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=vNeDJZqrvT2j2rRlp/BEtuA+HNSXejvJ2vRYm+fgkOU=;
  b=NGnGBmP6QNFpf4Q2/1tqjCiQS26fdmJfMJLkkZ8MMVAxasFLJCPy3S3x
   1WcQryIe/9jCy7rOkN7rMCLcwLSZxugl1i78lQ+MeTojJDJDMXOsA0CKo
   XHqoxBhB9IVS26WK3SuvmZArFSHQ/Rq/HF482yw2fGh0AXKAdKO80TLeT
   atXwgDgZMLSZ2bisdlnFp1Ml1R1wfFgMOFKJHa0p9ThglZVkmbc/Sx6Lt
   yrLY0ae8uoe8ErIDSMrG0yACyUBNr41FunmsmkfdhP3cKYUpFUlsdsfpp
   GkP7ZW8GgMZlVp6fhcEvdLdrBPdKN6G67K3zlwmxQnpBjqS8v3WtWCpfF
   Q==;
X-CSE-ConnectionGUID: YbsEVQy9STiwhq7osMmCEg==
X-CSE-MsgGUID: EamuVIguQWaDuHvmS7LCIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97212649"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="97212649"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 00:37:13 -0700
X-CSE-ConnectionGUID: nFREjJbdTEKf9kDYhKUDQQ==
X-CSE-MsgGUID: ZIy/Yzj7Ta+BOv/Jd0QFew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="268965588"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.33])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 00:37:10 -0700
Date: Fri, 15 May 2026 10:37:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Steven King <sfking@fdwdc.com>, Arnd Bergmann <arnd@arndb.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 08/11] m68k: stmark2: add mcf5441x DAC platform devices
Message-ID: <agbNIye6ZfERYeHD@ashevche-desk.local>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
 <20260513-wip-stmark2-dac-v2-8-fcdae50cf51a@baylibre.com>
 <agTcEECgJvBydhe2@ashevche-desk.local>
 <y4zg2d5zghoz3miqevutiin5swfnx5y2zew2zlv4jklxsyly5g@sxeyvth2tkrk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <y4zg2d5zghoz3miqevutiin5swfnx5y2zew2zlv4jklxsyly5g@sxeyvth2tkrk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_003715_513272_EBF08EE3 
X-CRM114-Status: GOOD (  14.76  )
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

On Thu, May 14, 2026 at 09:15:09AM +0200, Angelo Dureghello wrote:
> On 13.05.2026 23:16, Andy Shevchenko wrote:
> > On Wed, May 13, 2026 at 11:14:32AM +0200, Angelo Dureghello wrote:

...

> > Same for the rest. But I haven't seen the followups and don't know if those
> > structures are going to be expanded. The commit message doesn't say anything
> > about that. So I assume my suggestion valid.
> 
> no. They are not going to be expanded, anyway, is there a real gain
> using an hardcoded 1 there ?

The 1 is a side-effect the whole point is to avoid array of 1 element.

> Would not reissue a v3 for this honestly.

Seems you will need to have a v3 based on other comments. Indeed, for its own
it's not needed to reissue a new version.

-- 
With Best Regards,
Andy Shevchenko



