Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BB6C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Veo/EkQfpGxbM3XVCxagCpuTTV1oNK7Wv3ZngYE5NJo=; b=M9b3YS/hyXE9g6dpQCC2SM4esY
	KuUQcFpKwDMkWh619O5cY0TWqnIwj5tE3pDn2arVk5jVBwadJOXZSoB1LZr/bKqZbUFqmuz0HR8bj
	bEMyPcFHrzMXZXks58ScFmi5lvupQ3hrE9GOgkw5uQDMyxZImYIyE6teJmYCcz9SQmh9Z26R2Gkkq
	FEOpX4A2LAbhi/ie1904KeYPw4tBPPXiYWrJ6MEJtU1keOrbVT3+PZBid7P/eVfE9WmkTx2WCrfcI
	NNC8axxqq9fOdJmNbWgTSIgXxtHNa9cikNGD92QKaqosub10vCVrTquU3q5CCPftmlm2lAqoTq+nv
	C6szMzJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUrp-00000009ZNt-19H1;
	Wed, 25 Jun 2025 18:29:05 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUR62-00000008xzg-2uNB;
	Wed, 25 Jun 2025 14:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750861651; x=1782397651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aiCBfShnv6jIIgQ4bpuIfMp5r40wbfensHpHCEm3pBM=;
  b=j4MyHNuwMag55iNOJZnf2Z7ZgtaqS5Nl0CvILkeSE+DjmdvFi7CPEaw0
   55tlA6E25QR3k1zENwgXXO0OsthRt8Lbz2pOiC07po0rAu/xyc7UJl1dx
   kYCBfAnGCvmjAsKaPAzsGOfk4sFahoZgfX16ODtFyNV8RoKK1QeE0fMan
   4m/cFGycO3FopN0Oyfch/IR+sKy02crEmf6IonursNEtntk3syes6/wgU
   JCy/dqaEIBj6fUAURKI9KHpUtIfBWFTxXQA+l2Pjasl60mMtUaSN3+Un1
   g33p/WiwBneuqjsRHhLngY8EqU2ZA70dKoIMLZQbWO41ZoikE/Sw63gBB
   g==;
X-CSE-ConnectionGUID: Gsju0hZZTxmRW5mROlK/qg==
X-CSE-MsgGUID: kTH6YPhXQD6RsHPVPvj6ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56920077"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56920077"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 07:27:25 -0700
X-CSE-ConnectionGUID: NYVNjaqgRd2C28PhusN2oA==
X-CSE-MsgGUID: Vm3m4nwNToS9MwdDCSPhkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="175877583"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 07:27:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uUR5q-00000009nnt-1JQk;
	Wed, 25 Jun 2025 17:27:18 +0300
Date: Wed, 25 Jun 2025 17:27:18 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 4/5] iio: adc: mt6359: Add support for MediaTek MT6363
 PMIC AUXADC
Message-ID: <aFwHRigf95hPKTE7@smile.fi.intel.com>
References: <20250623120028.108809-1-angelogioacchino.delregno@collabora.com>
 <20250623120028.108809-5-angelogioacchino.delregno@collabora.com>
 <aFlk-l5LhgO8dnXK@smile.fi.intel.com>
 <1b173e16-f681-4256-8dd2-92db2e90ca73@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b173e16-f681-4256-8dd2-92db2e90ca73@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_072730_769308_3E01F8EF 
X-CRM114-Status: GOOD (  16.67  )
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

On Wed, Jun 25, 2025 at 03:29:47PM +0200, AngeloGioacchino Del Regno wrote:
> Il 23/06/25 16:30, Andy Shevchenko ha scritto:
> > On Mon, Jun 23, 2025 at 02:00:27PM +0200, AngeloGioacchino Del Regno wrote:

...

> > > +	if (MTK_AUXADC_HAS_FLAG(cinfo, IS_SPMI)) {
> > > +		/* If the previous read succeeded, this can't fail */
> > > +		regmap_read(regmap, reg - 1, &lval);
> > 
> > No error check? lval may contain garbage here, right?
> 
> No, because if the previous read succeeded, this can't fail, and also cannot ever
> possibly contain garbage (and if it does, - but again, that can't happen - there is
> no way to validate that because valid values are [0x00..0xff] anyway).

Never say never. Any regmap_*() call that performs I/O might fail. You can't
predict with 100% guarantee the HW behaviour in all possible scenarios.

> > > +		val = (val << 8) | lval;
> > 
> > Is it guaranteed that lval is always less than 256 (if unsigned)?
> 
> Yes, with SPMI that is guaranteed.
> 
> > > +	}

...

> > > +		regmap_update_bits(regmap, cinfo->regs[desc->ext_sel_idx],
> > > +				   MT6363_EXT_PURES_MASK, ext_sel);
> > 
> > No  error check?
> 
> No, because if the previous reads and/or writes succeeded, it is impossible for
> this to fail :-)

Ditto.

I.o.w. the failed regmap_*() call can be a signal that something on the
communication channel with the HW went wrong, Depending on the severity of this
call the device driver may decide what to do next.

-- 
With Best Regards,
Andy Shevchenko



