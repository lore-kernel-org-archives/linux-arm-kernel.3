Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7053ED13C1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PPsLX92PCfd/XueLMieiIA3P5jwGW68NTqSAWxCK/o=; b=qrXiY0hcy+t35rmsDD0Fl3zXDA
	dRZfn+YyPrA/SjlRMHcSHHkTW+oo+cO99083C1Q+p4iualuTpeVWzgOx6gEEMfPApfZFmldFtmYLp
	j2yW6s+Ym5Z/vt18u2LZf/8FRt1h4lRwvdojMp0kTO9CSb5Y6BBza9p5jFtM/8Nf7+1J7d+0GRSjC
	N0oXJ/0sN4u/okaSl/yJ7/NGmiQb1g3NKiLLlfZWd0VRYpwP3thT4HcmrF/P6kE5wqQP4pgzpHc1/
	4H7BkptjTBRO5HzXVxbgdQME0bbQK9GWK+DlDIPXuCfgJQ4rGSqKpzQ2nUNu/kokaNC01Fr/GnbD6
	r8t4q7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfVl-0000000DxGk-3zNJ;
	Tue, 27 Jan 2026 09:37:30 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfVk-0000000DxGN-0j7w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769506644; x=1801042644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9Ksoto5cWtFdF2r5Bda7ISytlQRnnzHsKeVdlVqlfms=;
  b=mI8PJQwWso4YXmkY4Vz54siqin5VfoRM1wGkigLnpIBMz4O0zITq0woH
   F5nwNdV7gJ1MfVSQQCu9JceNP0hkPfXtwBIIaOJxM46L6rquTNiHEJoHA
   z63Jl30wWa8YcVA6TRxmdUCxVjITw8XvtB78Dn9/j5kLiVS64QCXBmwxr
   xKzBvDhY+hyo6SRgmrn+De7jckOEeeCpZOXRV/XH46/zxaYsX0w/4iDpc
   q8zUWokTKeAd8NXWhJ+l3m5ay8XBo5rVbVudj+PpsVPtiEACj02XtTSkR
   YdI57jnYFLb82+igNxmZApI0c01+1naxHvkc+kZIqArQeSm0xby1WwMla
   g==;
X-CSE-ConnectionGUID: stlcMFZEQU+5cN86+VAvpw==
X-CSE-MsgGUID: XOZcTHXmTZuQCJf9Jk7Q2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="73282584"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="73282584"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:37:24 -0800
X-CSE-ConnectionGUID: Lgz6eiX/QoCCbXCKPeVOlA==
X-CSE-MsgGUID: WFZxxpuFTmuGup6Qu4/e7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207165698"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:37:21 -0800
Date: Tue, 27 Jan 2026 11:37:18 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/6] i2c: xiic: remove duplicate error message
Message-ID: <aXiHTnqBi2A964k3@smile.fi.intel.com>
References: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
 <20260126-i2c-xiic-v5-4-88a16a28721c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-i2c-xiic-v5-4-88a16a28721c@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_013724_223709_AA48508D 
X-CRM114-Status: UNSURE (   7.02  )
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

On Mon, Jan 26, 2026 at 05:08:19PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> The devm_request_threaded_irq() already prints an error message. Remove
> the duplicate.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



