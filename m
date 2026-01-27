Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BADD2D8D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgQLBYdaBLsV7XdMtsuWrxbTkhZ5fbzB2RW3PJGiHIM=; b=ya24OwJ6gzxXn69yo2uN/QmVMN
	IvU3RdOwndLCJenQlxdXqsq4wIH6OWj4fLc+NHgg4hYGUVJRt6ovJRLSMX+0xuN88XACXhekPSlEO
	juA14VayMxTLOL6/pooavueLly4vqwAeeEkikC2CJ6CIp3YdSoUx6DZuOeFFqs1w7Cy76S9Z+uZWo
	dL3is4DyVc1Umb90P1v3oUQ5kRG09KiMa4OcnMDq30q7crjvD1cXWu86/pTGLwUBpA099qxZxOTsJ
	DOtFSXQlS6fV/avl9HXqQ4nblz3Sja1vohM6efYjjFUn+gikGWMfGlGM6RbheKNtZVEBBcfodhe5f
	HPibjorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfdj-0000000DzG1-18ZQ;
	Tue, 27 Jan 2026 09:45:39 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfde-0000000DzF2-1sqo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769507134; x=1801043134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eG5ZRYyzkE/oygVVdcqghq8ygosS9UgM1FrIOdTY1RE=;
  b=SlNmJfu9MzTmQOXnDDiCY5Z+fuqpRGlDo0tcke4OOSOZ2KpIg5/KGm1V
   1t1Oqfc5hP7U0/RQ/up4gSitEcW/9LaHoY+1bHhjtzijjKntnT66c1lz/
   OQz8Xh+CqkD9sqRIULwN5FT3UPXCRjDxU7tastq0nlPxJXnrbuYauI1aO
   BsR1mki4ETRIxFS6UJ/3SaepIAo5bGwm4XN4jFDNUtKfMbXY6mCcHM+Xg
   pKcXzb89OijCme7+78+5ymdg25kZqLZOql3ZI29uT5K10V10HRXx+wscw
   bV93ceKwmwDgDN5CiRiYTZVzY5vdNERvOWTTL21A/q/LUnTc/vK/0BW/I
   w==;
X-CSE-ConnectionGUID: UD0DV6P1Q0aqkgWMjH7ROg==
X-CSE-MsgGUID: J/0LVIsNQnekWo+yPfzMjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81331362"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81331362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:45:34 -0800
X-CSE-ConnectionGUID: +rUZ+MEEQNONIbN5/OPhag==
X-CSE-MsgGUID: 7J5wmYIuQdqhPUw5ch/tPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="212909430"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.248])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 01:45:31 -0800
Date: Tue, 27 Jan 2026 11:45:28 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/6] i2c: xiic: use generic device property accessors
Message-ID: <aXiJOBaN12bo_BR-@smile.fi.intel.com>
References: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014534_694412_F9E26D8B 
X-CRM114-Status: GOOD (  10.73  )
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

On Mon, Jan 26, 2026 at 05:08:15PM +0000, Abdurrahman Hussain via B4 Relay wrote:
> Switch to generic device property accessors.
> 
> Switch to managed devm_ functions to simplify error handling.
> 
> Make the clock optional since the driver is designed to operate without
> explicit configuration in firmware thus making it useful on platforms
> where clock is not or cannot be provided.

Overall looks good, needs some nit-picks to be addressed.
I hope v6 will manage to go in soon.

-- 
With Best Regards,
Andy Shevchenko



