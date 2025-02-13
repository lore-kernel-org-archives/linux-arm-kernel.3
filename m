Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD69C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qE3TRKzeZ9dLYkH79e6j9u9ZuroqYcyzkedWz3lIELQ=; b=YEM7vBOD5YczVwErNIlJ6mYgZb
	I4SYB0iq2vgL9/+fGC4cDC+v0OUf23xOBMM7ikU+FIe5xgzxB1QNoafacAXGoBokLP+5jLuBfxTCu
	3+uHX7rsP03M/ozNQtsXpLsSjQRYgBVneHLvBHPvZ8fwVCQElb13p4sxluMrkT6vuOdcltjfTxlGY
	31roxUGQJjUq7oeujfDFfZNzCqaycjhMDx4xGC4K4tjGMFciYXg5eOhqF5Hh5jDEghm+EU1BTwgbH
	sx04rb3uvWEdQ8+Wp4NIEX1jJKgHicCNm83mXWs1pqaCYlUJ4FWHfmRiFurXYsgv+o1kLb2akV3Ze
	atvWN/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidat-0000000C8ry-062J;
	Thu, 13 Feb 2025 18:05:47 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticDA-0000000BnUj-3pXh;
	Thu, 13 Feb 2025 16:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739464633; x=1771000633;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=sbbmkWE/R2bCCyJ/6gUWFB9ZcoZuMGcfquTsn87Iqp0=;
  b=Agth9NSMSgnJV9LzR+07qQRdioOv3JbTjXdlSXyUiAl2yqOJnGi1ZUI0
   q6w9UTGX80BKiEZ0IKki20kqvFuEXVehq15hYAgflcHR8NdFlzSKftNBd
   QpsbpvDEpuM4FV8CfAgc771pTFRyDkHflxxzJ/csOUsrH/29Thuz1uezv
   A4yphVBLD7hP1zbHuHJyfrIXxa+VcHeZLOMZWTS9PWAhHm5vgI2v8TUwR
   /gVNPdcUgjTD+dXficKQ4vYwwlN/Exqrafghc2dQZ21TimwMqCWdwIdui
   9/kTmLDhESZXAj87MR0SG/IshTiN0HYHHWWQZZLwk89Dy0IE3UqCze6Mu
   g==;
X-CSE-ConnectionGUID: krrpECtHQWm/Nk5fmxwNzA==
X-CSE-MsgGUID: BFZ+Qo0WQRK/FEld2Y57yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51577443"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="51577443"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:37:11 -0800
X-CSE-ConnectionGUID: W3VNhbcRSYeFkWd3XmfLAQ==
X-CSE-MsgGUID: sEuhhK7cQdiQB1cBIOxlyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="113720797"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 08:37:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ticD0-0000000BDu9-3wkb;
	Thu, 13 Feb 2025 18:37:02 +0200
Date: Thu, 13 Feb 2025 18:37:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
Subject: Re: [PATCH v2 06/10] i2c: kempld: Use i2c_10bit_addr_*_from_msg()
 helpers
Message-ID: <Z64frt9vbdLVYbrB@smile.fi.intel.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <20250213141045.2716943-7-andriy.shevchenko@linux.intel.com>
 <Z64ajR7CSIDNmIKz@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z64ajR7CSIDNmIKz@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_083712_994021_BFC6F981 
X-CRM114-Status: GOOD (  12.97  )
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

On Thu, Feb 13, 2025 at 05:15:09PM +0100, Wolfram Sang wrote:

...

> >  	/* Second part of 10 bit addressing */
> >  	if (i2c->state == STATE_ADDR10) {
> > -		kempld_write8(pld, KEMPLD_I2C_DATA, i2c->msg->addr & 0xff);
> > +		addr = i2c_10bit_addr_lo_from_msg(msg);
> > +		i2c->state = STATE_START;
> 
> Any reason you moved this?

Yes, I would like to be in sync in the above state machine case, just upper in
the code which is not visible in this patch.

> > +		kempld_write8(pld, KEMPLD_I2C_DATA, addr);
> 
> Maybe we could skip using 'addr' here?

Same reason as above.

> >  		kempld_write8(pld, KEMPLD_I2C_CMD, I2C_CMD_WRITE);
> >  
> > -		i2c->state = STATE_START;
> >  		return 0;
> >  	}

-- 
With Best Regards,
Andy Shevchenko



