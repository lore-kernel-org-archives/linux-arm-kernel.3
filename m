Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145FDFEE4E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 11:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0adQ1LTfoozkI2DnSyuFq7NmwmEQzUHNOLdqAVK2Ak=; b=Qp03doQKK6XuvsgBY/j/XYlEGX
	dqgozQdba8+NXb5uUweqtetu1B3Dqanid1K3QUJDUCkQ8L6nvVYxOK0Tsx3orglJ3vKFH256+W+/D
	m4HG2NlABziWMov8UzgW4bpMyteaJw/gvjy64dlA8YbToJBmAZLjTgLE4dGnqWasuTXlkc5sVBTUR
	US2v4hQp6zjMMNzI/qsY2y8bdnaR+hKmszxTgKXS2iBNsBA/aktYvxRjDI0SBqcMj4SGOwXId0E3u
	iOCgyGSau911dFMhcAXsDjGjs5D7xlp2mpFC0wf7vO5v8U4o7+Ugh4Kp8ciViu0gxxVu/XH+g1m4O
	dY+JP06Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIFI-00000009lqV-1fu5;
	Sat, 28 Feb 2026 11:12:28 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwIFF-00000009lq7-3hAh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 11:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772277146; x=1803813146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mUtDowZDqA0oBKwdrOYblxuFtFXR8pMwiMk2ClUuiDk=;
  b=kblwvmNGJXfuReAwVMk4NfIyUUNl6JrXNqKnUBen1IS8vQNlB9mAMgHF
   MdT+5O1juWtybVN26pr/KVZxjG9anJLUIaAiZKD5OxJu5VoUhiXqnpiij
   US/ASR6qulTD70PJDFcBJET/XC3qc1/pKdZWA6HLPHaJbuzBrxaT/wSjC
   RmH9JO3AeUd6XaqYk4Mnl8VJmaBuws1BciCguaSlhcpS5B364zYHJ0r+9
   9oXgMbWIYoxXHbvtQMV4ynsBbg+ZJAMIH6noGTO4/rqvsTA1bpT969p3Y
   yAPY1SGt5yfN94Y+uvJ6yCLbArkZv97Zr5bt1kS2YFmS8JOEF0fLzx2Tj
   w==;
X-CSE-ConnectionGUID: KQH0izIgT2Os0yCfe7OucA==
X-CSE-MsgGUID: 5lW6SQW2S1G1K70mh+0n8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="77218265"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="77218265"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 03:12:25 -0800
X-CSE-ConnectionGUID: 9lU5LI+nSCCFS1IJ6rJy2w==
X-CSE-MsgGUID: EImgYVglRc209T40J9PKaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="221651691"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.224])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 03:12:23 -0800
Date: Sat, 28 Feb 2026 13:12:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ASoC: pxa2xx-ac97: Use devm_gpiod_get_optional()
Message-ID: <aaLNlJKommN4cDX-@ashevche-desk.local>
References: <20260129133340.302446-1-andriy.shevchenko@linux.intel.com>
 <PAXPR04MB845926A386618396ED8F0405889AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB845926A386618396ED8F0405889AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_031225_953843_C23AE088 
X-CRM114-Status: GOOD (  10.18  )
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

On Mon, Feb 02, 2026 at 05:16:11AM +0000, Peng Fan wrote:
> > Subject: [PATCH v1 1/1] ASoC: pxa2xx-ac97: Use
> > devm_gpiod_get_optional()
> > 
> > No need to open code the devm_gpiod_get_optional() wrapper.
> > Instead of checking for a certain error code, check for NULL.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Thanks!

Mark, did this slip through cracks?

-- 
With Best Regards,
Andy Shevchenko



