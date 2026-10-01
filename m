Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D563ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gAxlKmIA6K1VhObkwtDYhb08ccS4/II8Y1SYR8k3+s=; b=1u8mmKR99A7cE5hsytGJwDSJTu
	lZC8KURZxTXeGGjS8JQ2quJrAZYwCudTnBpAB2w35iA8f93lgRr83DMFfR6VG/FhZUaPwLl1xCDA/
	3ssDPv23fk3mSjiS5DkUR/D1vYq8jEsJ9Q2ez95t/oIdKEgFZTa+rxFB3DO5QYnxf5OXajrU+ockV
	VJrowXLv9ql5LqnxKd3rQkRDiKIVVjiq/TI1xUnMVjRsFS7hHJCQ8EUOwCOa+24v5bdRJ7uku4Tsh
	8Zcpyk4S2mBuzB349+hD346drZF1igfGsiJxcENYSnRsyvpcFT6xCaz0uv8exFxZARF783MdgQqAj
	tyaGjf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8Ax-00000007iH4-1ioV;
	Thu, 01 Oct 2026 04:13:43 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8AN-00000007i1e-3uti
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790827988; x=1822363988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0gAxlKmIA6K1VhObkwtDYhb08ccS4/II8Y1SYR8k3+s=;
  b=Upt1JmplN6wkit6iZvoQFxvJQMsVHcHRsIewR7QhL1ZE+lNb07X+hLmr
   joVSoCYc8KjonLnssBrR6oV6G5f+OfaPHR0wzMEcccjAgH4GjU9r5PIo9
   ok3f8FK6FP5VVDa1EWxDcH7sqPYeokZD8RKmM5gK8LWJ6kSEW8RnxVI0Q
   RrDR4nkl9yVrQsiLgCTPx1aL+yIuxg4vuyB7EoH7ZxmWsAwRZAr12n+2o
   XLZWBYBankVkUZh9gumiumdym98Nv3f2aOTGguCLPOCIxt1rlSnWhqSY4
   EPwSq+nikv57mUpMYFGzxsnaNePrmD1vTfJKFPp6gb4ZEL6/CYo7duwTH
   g==;
X-CSE-ConnectionGUID: mK2BLaSfSnWcybrwKwlNOw==
X-CSE-MsgGUID: a7dXkNV0SMCaN5HpM71dTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90436455"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="90436455"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 21:13:05 -0700
X-CSE-ConnectionGUID: 75Xo4f+JTciNDNdQJjJe1Q==
X-CSE-MsgGUID: tzhl8O0RTK+E2xq0gYHgsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="280629052"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 30 Sep 2026 21:13:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3C1A299; Thu, 01 Oct 2026 06:13:01 +0200 (CEST)
Date: Thu, 1 Oct 2026 06:13:01 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 5/6] spi: pxa2xx-pci: restore LPSS private register
 state across S3 resume
Message-ID: <20261001041301.GC176164@black.igk.intel.com>
References: <20260930160629.1822-1-fourdollars@debian.org>
 <20260930160629.1822-6-fourdollars@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930160629.1822-6-fourdollars@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_211308_017638_87FC91D3 
X-CRM114-Status: GOOD (  12.19  )
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

Hi,

On Thu, Oct 01, 2026 at 12:06:28AM +0800, Shih-Yuan Lee wrote:
> On platforms where Intel LPSS SPI is enumerated as a bare PCI device
> (such as the Apple MacBook8,1 on Lynxpoint-LP), the LPSS power island
> loses power during system sleep and powers up with the controller held
> in reset. Because the device lacks ACPI companion objects or MFD
> binding, neither drivers/acpi/x86/lpss.c nor drivers/mfd/intel-lpss.c
> restore the private register context across S3 resume.

Hmm, how is that possible? The LPSS is a single PCI device that only the
the LPSS MFD driver binds to. I don't think it is any different in Apple
platforms than any other regular PC platforms in that sense. What does
lspci -vv show on this system?

