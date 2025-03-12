Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F0FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpIEAogTxkzLpfUfozeqm0pCsw4RE6yWXZ5KmK2i4rQ=; b=4u+On+da6YBfEKfW27gfSCg6cz
	XmQELBx3NamTmt1j8z9ESFCsA8zZ7OCBK25SdELh4k71b896hjrbC8HHDQmnK9Su1eslQQdEQos1w
	2xVskcmAapapSizohJfPnvbiCJsPGg8pvxVHW/BawN2BBOFE2tNPgGw/I0AKtR8yMtpyafPDEMGBd
	ZolhBIc5h8HGORGIvQYIY/WVQ1XWX32kUC8nXClC+oQPLuXZw0hxqHLF8sQm6/dRUILrXdZAnMwSI
	adL2OtSH43LJpenlT5/cai7470M5SBjc+1av3T4C/unu64dNoE11A+oAf78siFcqrHcfM3kc/A6eu
	lb6Qur5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIct-0000000810M-2LNx;
	Wed, 12 Mar 2025 09:43:47 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsITG-00000007zCI-1f1P;
	Wed, 12 Mar 2025 09:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741772030; x=1773308030;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qJVq2tQ/uqY4XgxZm+blhtdxS7KyEDaz44nIhBoEgwc=;
  b=aNYEos6bPTxk4wOpNw/OcGYhhzWGtDLLeDU7Xp9WC/EQq58dvlp8d924
   0U/1OJBEEI7ZO6kBgUKxzwClIx3kSb6B3aHtCDDHRkdWB6NSdg0u8BvxR
   p2twdeeNEV0Msx7BO33ZSJeDmZv+dstpSUCunSl8pFUbmhftBaOC4zq3F
   7KEbmwJDtqjJxTwJJ9x7eoyzeDSM7ZrovQY9ksLv2ifvxyA8WVGptHFG9
   irZWPfK7GcxihUcAnoF1Tx5jufh9f2GOsHW9lZPOlDxiTkrQoAyeV9mNy
   ul0knmsIRhdb09xl6YvkDUqZq9vdmRLRAB6JTimtdnoWEO3bOLpTXAltH
   A==;
X-CSE-ConnectionGUID: YWMirI3NQzCCHX5gxCrkyw==
X-CSE-MsgGUID: 5bLkoJ7CQaiVm16PYmbNaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="68201245"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="68201245"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 02:33:17 -0700
X-CSE-ConnectionGUID: hykDrp8ETOaBdw7dlJJbsg==
X-CSE-MsgGUID: IHLO9H3oTJWrBK/Y6SLyeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120611799"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 02:32:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsIS1-00000001oYn-14Yf;
	Wed, 12 Mar 2025 11:32:33 +0200
Date: Wed, 12 Mar 2025 11:32:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 00/10] i2c: busses: Introduce and use
 i2c_10bit_addr_*_from_msg()
Message-ID: <Z9FUsLC0TcglJZN_@smile.fi.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <c6xszdhx5ztexlqlmhvdn4dyz5ilzxsm7c62cvkmnwy2y3gaqc@owk2ani2emys>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6xszdhx5ztexlqlmhvdn4dyz5ilzxsm7c62cvkmnwy2y3gaqc@owk2ani2emys>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_023350_468948_0B03B166 
X-CRM114-Status: UNSURE (   8.82  )
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

On Tue, Mar 11, 2025 at 02:12:03AM +0100, Andi Shyti wrote:
> Hi Andy,
> 
> > Andy Shevchenko (10):
> >   i2c: Introduce i2c_10bit_addr_*_from_msg() helpers
> >   i2c: axxia: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: bcm-kona: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: brcmstb: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: eg20t: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: kempld: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: mt7621: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: rzv2m: Use i2c_10bit_addr_*_from_msg() helpers
> >   i2c: ibm_iic: Use i2c_*bit_addr*_from_msg() helpers
> >   i2c: mv64xxx: Use i2c_*bit_addr*_from_msg() helpers
> 
> merged to i2c/i2c-host.

Thank you!

-- 
With Best Regards,
Andy Shevchenko



