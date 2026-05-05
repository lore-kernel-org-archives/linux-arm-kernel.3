Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0273FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yyj8hxZorQAJe3rqPwj7z8EV0mK+FCC6FOCepmcHAXU=; b=bzYApub2xoF8Vt80Dy7nOfynu3
	EwxppkXoMIa1Rv9+5CbaQokFyY8tJ3vWU/ZJfSAhN683bExKS2etO4QFWFVbaY9+CdxbXimBV+uPd
	lE/ZZxYrZyphDY+sdhjDpUmjqH9dZ7T1//G9trDtkqzRaOkKwQpeN7kaWY8kXAbHEFBGYlWx1iNgR
	v4scidVISWghhgkUAcFZPU3714R9bF4wmas82T3RG3ExiTK9pHTRgKIZiwHTgn58kY6pkXLAgF7ig
	BGoB+x7CfPKFNr3taLbaOclqxbnMV29Do6wYe5NWQXILU0AcohQYeKJ7+H8VSf/ug9YNl2qOovBWI
	1Wr5UVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBCr-0000000FXQ5-1cG0;
	Tue, 05 May 2026 08:32:41 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBCp-0000000FXPe-2fQr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 08:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777969959; x=1809505959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lPBVBaJ1RuXmNHoSGWo5sczbzS6rH0e5GCDlSBKixvQ=;
  b=dquUDED/B95YGGi++i3Ee6wRcTbpx0oJK+JEUyVHEB33GlVW3aBUQUPn
   sEXtvCmkjHHRiLmXCIebY5kJ6ijVHasutuE9zRoPxKck2qSWJzNdfTZdq
   THmW0AEuXP4HwuEHVC1OIlEsURBqrSSYbsE6n5jeV9gKWqfWx5jpThYjk
   JvxkxwGXF2Oi3NZE1oJoTBCESTFyts/R0dW9vcFBNyVAA/alXwAsVFGB4
   z4caP5rCTYSQqp9pNQ7CdqTb77ALMJMgMiDzDt/InN7sOeIAVPGIXYqHO
   z4jT8PE7I/Br23Qbq+/AWYaTu/McXamvXMGmwnWmGraD2AwIX5P/k4uj5
   Q==;
X-CSE-ConnectionGUID: 7tsrRFw4QuyeI7JPXU/IUw==
X-CSE-MsgGUID: pZbRuzhjSUCHJy5VwNC5BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66363003"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="66363003"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:32:38 -0700
X-CSE-ConnectionGUID: DeJWMtcvSsOE7r+U9VuFsw==
X-CSE-MsgGUID: D5txDQIUSHOL8ZPb5COYyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="232613705"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.5])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:32:34 -0700
Date: Tue, 5 May 2026 11:32:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>,
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
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	Angelo Dureghello <adureghello@baylibre.com>
Subject: Re: [PATCH 09/10] m68k: stmark2: enable DACs outputs
Message-ID: <afmrIFscjnn9yaxN@ashevche-desk.local>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-9-874c36a4910d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-wip-stmark2-dac-v1-9-874c36a4910d@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_013239_679872_3E78B6B9 
X-CRM114-Status: UNSURE (   6.70  )
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

On Mon, May 04, 2026 at 07:16:47PM +0200, Angelo Dureghello wrote:

> Enabled DAC0 and DAC1 outpus disabling shared ADC inputs on ADC3 and ADC7.

...

> +	uint16_t val;

Why not proper kernel type?

-- 
With Best Regards,
Andy Shevchenko



