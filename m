Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF05C5DF84
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2tZznEbKx8DBNMZ+YlnbcHB1GTBpbrPBdUdNMsG1Cg=; b=dwtRG1ScaTAxyUmDhq4PjuqQGy
	8vmvNEA6i9rwtj/lawp1L8aG8upxA0P+4ZrZvmWiLDMjP3jxK6Xuz+y/u1khwuJwl3JiF7t+YYMry
	pqQxGgm/6pWOcJO2HOD9pageUtCx1MmNcZF/OQY7avAJmA6ef4z2rmtxCfEFYX8V7u93z2HWq2i/M
	lSywGf9j4WSPp3jWfslUR4V1i/TlKlBPFAHAKhmuCGQJOGV5RiOHoDzxzdHeFYYKS/ZprIDKlSulh
	4jMfTLdIMJU659WjWEeEl8TV87zC+rvtT1plPU2JP8FoM7ebWDy06oyuzOS53H9WjDOzO0S66d2az
	P/yOR8Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKXI-000000086Ts-15An;
	Tue, 18 Aug 2026 14:11:28 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKXF-000000086Su-2ugT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787062285; x=1818598285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WPuMZj2OAQE9HDFZOAAcnqeB5GxLS7XAo+0fZhNpzmU=;
  b=l8SyjFoDqtsuVsBbrZwcvxJTQNtKSQXBCAcYExC5elQZSalOB7ddBHEt
   qOauC2Mf/DnlMbEYpXwYO09lHZMKxx58IXDwA/E+FNDVyO0ayHg9MY44V
   p4fovBwN4gqFnJD00WC7h1dtLiEyI1+dCp7+a5WeXCk8aYzjPtJ0t4JnW
   R2pFdoL6FqQsKcOTy54jS5xqqNFc2I0xue63jtg52LsUWZp+3YA8u9pAn
   hx3KQ2QcYSPWT/SnoTb1U5sbntgUqAKWnWhyZ0LVeLsFUezLu4XFJry0h
   lVlFnVfBWUCD3UiUyk6KtHEyQbbgt+kzuuAdcImEv4lVvPOjLiIj2AUrn
   A==;
X-CSE-ConnectionGUID: oE0QNoXtRByAOCcBoKlBSA==
X-CSE-MsgGUID: REfpq2adQqe2skWXMvBnzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="75084882"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="75084882"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:11:24 -0700
X-CSE-ConnectionGUID: zdq+TYqBQmyZpF9Eko9Gkw==
X-CSE-MsgGUID: 5nZDuB5zQVyBEKQ6mP3nNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261488781"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.209])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 07:11:19 -0700
Date: Tue, 18 Aug 2026 17:11:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, Long Zhao <zl020895@163.com>
Subject: Re: [PATCH v5 08/12] gpio: pl061: add Ambarella CV75 register layout
 variant
Message-ID: <aoRoBYE_Ns0lu75-@ashevche-desk.local>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-8-7bbb12f0360f@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-cv75-v5-v5-8-7bbb12f0360f@ambarella.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071125_917924_0DE70170 
X-CRM114-Status: GOOD (  10.91  )
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

On Tue, Aug 18, 2026 at 06:31:22PM +0800, Long Zhao via B4 Relay wrote:

> Extend gpio-pl061 with a per-variant register layout so the Ambarella
> CV75 GPIO banks can reuse the PL061 driver instead of a duplicate.

This is reinvention of gpio-mmio.c (as a library). It has necessary facilities.
Also gpio-regmap may be considered. So, switch this driver to use one of the
above and the patch for the new device will be much simpler and elegant.

-- 
With Best Regards,
Andy Shevchenko



