Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFC8D31A28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6uGCquBWH6uiGdYe5lVZ12ucv1OD63hx3BorOh4YcA=; b=AWsvY+kEULCEv/HOV/0ZeQcKoo
	Nj4y9oqp3KDg0lh/L9ht4nIIfxJ4/97OXnuFjxwIcEgAH3Y4gYvaSvURQgSCXIwAnVJW3rzgE+ofh
	rpDLG6oCwPhVmvBuazLuTcrjS8kA/I/KJK1Nh9fd1TXnU93Rh6Z0zrC3klVAkm3qcmVCRXbiyMbz2
	NhJVuCplEVwLjDCwYUXZLNOMrCh96+j/bhkXoJdxOZ5qguzSQXybWD4XhJIJvQCDGy76+Bdftood5
	oL3Yd+oBA2hEjBbJTh1yyKjsL6Ec30pdLBsOEnW4Z6lVuXP6zHJidSnCW9lQaEOvnK6so6rgiiI6O
	dpUsaaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwAc-00000008K97-2C1o;
	Wed, 14 Jan 2026 08:24:02 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwAZ-00000008K8F-2zTP;
	Wed, 14 Jan 2026 08:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768379040; x=1799915040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TpSIK25RbvWDNg7QiWIOtxQKPzkkGQzeiPPfyvIi0gk=;
  b=g+LDosqMgXqI7uaIaZhjqLhXC4FdDirifXXYbS2+8Y4qxZ9duevkPIdt
   e0VZXly5X2MAul2toIDmhIimwd9EGyqV0GTG58UiIkBL6umOzNvIA0BYZ
   j8qU6X73nvHRYqnyLJZQC4v8KIzzzONHuisMB4CaexiTnH4XWu/AvghY+
   M7tyV1Kip3u49sH4AHwyZ31se1lEXYh+9iMA3L5tdwUMOrkRKWAOmwCcH
   3IiWfc/3ughwMJsGfZoO5A9AxZAS/efh7ZLLs97RVBpgtBxjz4kKmIPkH
   8Rx5nod5a3pqO+xFenUwzb8oNCnl6H5Uqiba5D9Fqnp9po+RvWaHKRcQH
   A==;
X-CSE-ConnectionGUID: KseNro3xRF6l64WxT55mbA==
X-CSE-MsgGUID: N++AtQT/Sm2/Zmu2FvyhaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73309097"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="73309097"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:23:58 -0800
X-CSE-ConnectionGUID: g2NXVMXRT7+6Jm3R7rO9aA==
X-CSE-MsgGUID: pmU4TLcgSYmvaqOcW2kQ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="235333811"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:23:54 -0800
Date: Wed, 14 Jan 2026 10:23:51 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Andi Shyti <andi@smida.it>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v1 0/7] i2c: busses: Introduce and use HZ_PER_GHZ
Message-ID: <aWdSlzLuU_psG_EV@smile.fi.intel.com>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
 <aWdHRszwPfcniL1q@zenone.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWdHRszwPfcniL1q@zenone.zhora.eu>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_002359_853131_3E565E63 
X-CRM114-Status: UNSURE (   8.22  )
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

On Wed, Jan 14, 2026 at 08:36:09AM +0100, Andi Shyti wrote:
> > Andy Shevchenko (7):
> >   units: Add HZ_PER_GHZ
> >   i2c: mlxbf: Use HZ_PER_GHZ constant instead of custom one
> >   i2c: mt65xx: Use HZ_PER_GHZ constant instead of plain number
> >   i2c: nomadik: Use HZ_PER_GHZ constant instead of plain number
> >   i2c: rk3x: Use HZ_PER_GHZ constant instead of plain number
> >   i2c: st: Use HZ_PER_GHZ constant instead of plain number
> >   i2c: synquacer: Use HZ_PER_GHZ constant instead of plain number
> 
> merged to i2c/i2c-host.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



