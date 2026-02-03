Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11255E87843
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c50s9DUpUC1AiGx+BQ0aYD9TZg9RlJpZx9T6ayM/brs=; b=fylLCNY0+z+x7rQ01zWkcjxW+z
	fz6+URveJi+0vHNnf6z1L+CFsCTA6gkV9Cqje5QfU2Ku1zBRsWhtcjPShu16Wen5loeDTwaFuuUtB
	A52jN72QN5g1fqNx1cekiZ3AuQXenis4mKwSOk5mZZVgycHYxvwQodUO0wVn4IXXiBVXHHG7TZlRW
	Es2eXFuilwYdsaJ0F78yaNRP7EeNZrl4HoDo50x6ndk/0pHfPT+Og5gYxY+rjlH/szP0E8xnA2Yi2
	ACg3KTRLqmZUSbl9StK4zuRpkKcjdXYPWVqkIYL0QKqBvUybquWFmv9JgNu1OWjY8JMPwd+we+N5q
	iuJIkO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIbo-00000006rWz-39LC;
	Tue, 03 Feb 2026 15:46:32 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnIbm-00000006rWV-1Ghi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 15:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770133590; x=1801669590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sJtV4BtXtNVfhwtflW/nj+oEb6SNz0EBbYiuSAWXftM=;
  b=Rmi52j3MYe7y1+sH4uQP87eK3l1Njjzbva0AEjmRhKGaCUfpm7gheHP1
   wJh+ot+H7+T9UATif16PaQDAztPfv7mOS+3TH6KiszLMQ1UmUBDb6PDLL
   QreVXbGTEcJgqqaBYKa7qW+zASdpVq4Pw62VP+Bwpc7g784RwBpI1/i4I
   6vinq6HWe1Y7Weomf63M+9t3DS6DMZpPohuI3ddsZbeu8RA/mtQAYVd7M
   BFi53NYZe/dWOV6iPVr873q3kMiMSJmSY0hT3XvwA+bslNqmOYr3bnMFQ
   4yGn0ipUGqtYmjg5i3jTGqDNk4TaFq7X52qqGXjJxjtQAaOGI57pUNCLW
   g==;
X-CSE-ConnectionGUID: 95xCB1VTSs+zNgkzPxC0ng==
X-CSE-MsgGUID: PtLhrWjWQGmmh+fTcS2fxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="81937507"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="81937507"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:46:29 -0800
X-CSE-ConnectionGUID: sA/LmoYVQdaN4RT975YG3w==
X-CSE-MsgGUID: J+HC6ftTRQOWJ7+bwRha4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209173225"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:46:26 -0800
Date: Tue, 3 Feb 2026 17:46:24 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 7/7] i2c: xiic: skip input clock setup on non-OF
 systems
Message-ID: <aYIYUNejGCVdekx7@smile.fi.intel.com>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-7-ce4695f5267d@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-i2c-xiic-v9-7-ce4695f5267d@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_074630_373547_FE8649F1 
X-CRM114-Status: GOOD (  11.38  )
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

On Mon, Feb 02, 2026 at 08:37:24PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Currently Linux does not implement ACPI ClockInput to describe clock

ClockInput() resource

> resources, unlike DT. However the xiic driver is happy if something
> magically enables the clock before the driver probes, and does not
> turn it off again. The clock should always be considered optional for
> ACPI.

...

> +	if (is_of_node(dev_fwnode(dev))) {
> +		i2c->clk = devm_clk_get_enabled(dev, NULL);
> +		if (IS_ERR(i2c->clk))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),

Haven't you seen my previous comments? Why 'pdev'?

> +					"failed to enable input clock.\n");
> +	}

-- 
With Best Regards,
Andy Shevchenko



