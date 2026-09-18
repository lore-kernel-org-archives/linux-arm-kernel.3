Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0858C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPb0WbImBjfAIklYwHIG1VTsh0GGmgNxiNUBUCQCCYk=; b=VPNlp8D/RdZzuU8O+NfF+gFwpJ
	TFkjDkBXOlkck10Mg30Tp4YEAPnUEKwjzkl/VLxbUHouYegHCV/lx/FNhtwonco7W65PFCKpEhyOD
	5iqnQy9C+AMO59cvwqChZ5exgs1cl0g+K7CqHksqK139w5UfpHOT+i29hNVqnUqcRgKHNN7xDHs9E
	qFk77L1BkjxrZs6GvoaX8E46lcUyVz+5jd3lLq92SsCXDs3tPUSejepPIUXsOznInkWKlwolqML9Q
	bYoJ/JxoE+rZnWFcldlAsbj8keWgsQKr2zGPD0z0gFGunQJx0LtERRYPsx6RZuQnJiiEVi1cQLh3L
	jryM4UQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7V6S-0000000Dymo-3xeD;
	Fri, 18 Sep 2026 09:41:57 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7V6G-0000000DyjB-1zIy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789724504; x=1821260504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NdtJRaDGbY7hMtqbi401f0ZdRPXIAcaHSgKiwXmJr98=;
  b=bGgV2TG+lj9M5Xbqdki6bUngfZYz0X2ciGreKQl/ja44gnf3hhkRk+j6
   AZt9EPkxe6Zu0Run5rn3HBM3X90/E3N1V6N0kOmN36epQuaZGOBfbN/O8
   OzanaZM2ULijjHSkIxvh+Ry9/Etrf88ItzHEh93eFDRbBaN4LDifd0XlI
   yC66bqFppNinNdlaVXezQeCTZN/rhJjYGsnw0RYv1dJYdQuHQSK49mbKX
   WpB/gI7gGSnE0McCBWiAn/0AdEfnGkuquYwRNs5IGwkDaqZAI3cfqiDcO
   MUC/nPynxiQKNpD8qS137/PqkBYV5xgjPfqoSGDpuindoFx/FJNSTtMjF
   A==;
X-CSE-ConnectionGUID: lE4wnHZmRHWRAnYmBZX0uQ==
X-CSE-MsgGUID: LLYbB4OMT3qy/pVVkvaWeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90349580"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90349580"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 02:41:44 -0700
X-CSE-ConnectionGUID: Bj1UG52SQ/mpwKd7nSV5rQ==
X-CSE-MsgGUID: BbzNYCtOQk+Y4TZjJOckRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2508382"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 02:41:42 -0700
Date: Fri, 18 Sep 2026 12:41:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Malathi A <malathi.a2000@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] serial: 8250_uniphier: Use dev_err_probe() in probe
 error paths
Message-ID: <aq0HU0ydof9GLp4_@ashevche-desk.local>
References: <20260918074546.245342-1-malathi.a2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918074546.245342-1-malathi.a2000@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_024144_735977_DA88DFAF 
X-CRM114-Status: GOOD (  12.73  )
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

On Fri, Sep 18, 2026 at 07:45:46AM +0000, Malathi A wrote:
> devm_clk_get_enabled() returns -EPROBE_DEFER while the clock provider is
> not registered yet, and uniphier_uart_probe() reports that with
> dev_err(). Every retry of an intermittently deferred probe therefore
> prints "failed to get and enable clock" at error level, which is only
> dmesg noise.
> 
> Use dev_err_probe() instead: it demotes -EPROBE_DEFER to dev_dbg() and
> records the reason for /sys/kernel/debug/devices_deferred. Convert the
> other two error messages in probe as well, so the whole function follows
> the "return dev_err_probe()" pattern already used by other 8250 drivers
> such as 8250_em.c. Those two codes are never -EPROBE_DEFER, so there the
> conversion is a readability change only.
> 
> Errors other than a deferral are still logged at error level, now with
> the error code added by the helper. No functional change otherwise.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



