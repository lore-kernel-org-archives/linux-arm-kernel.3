Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24ED6D79768
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eD9WXGl9MAihs90m27VDEN/Hi1L/QyuTIjpRXIpORU=; b=hTH9DrYgB3d4NU5tdXAGCXzJBE
	xX9+w/fLsbOBX21JYmSi5hWbCMr2RJy47RhGK/TGCAmJ5mp7T3yDlFcdNcLl6Apjg7Td7HhhoWG9r
	J5mMO2uaTFS+7vytqUpE32E0JRKclEMuqMWx9Nd6rM0PYzlIzaWAUM7diNyZeVP6i+fjZWx1dqZzj
	Gx6n7HPyGdt51Tjq1jXz3b9PKV7Uaidf1uT3VyeedVkuAQaut/I0sxKbVINfUl5wnNfy5wHg0CBaB
	dKMpXKmCnjs47OfBN+DP+PC74vHM2SiDpKO3xWd4FvTI0RhHgDfUGgEIqD5lfhrn8py1XjAmt4c27
	CltmuGjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8G1-00000002UtV-0TXC;
	Sat, 31 Jan 2026 10:31:13 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm8Fx-00000002UtD-3364
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 10:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769855470; x=1801391470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ItTHBVV6a1xUVuw79oxoj7YOc+pNqkuJFb6cv9Lch3Q=;
  b=eFwFQmC17IX9VL/B4QucAeiunzJmENmu6J4Ee9n2LpVCaAwL5/h/uyfq
   kM5XPyfw6ayXIrreu4x3lQGlaFt4Fa2gH3KIcnDeOnJM8yp4NXZDGbwDJ
   eQBHTpCE+P0OMSl07EoIQmPdos0s9sUekcW9TspO6FgXixiAlP6ii6TtO
   F24KNj6VqXs0vRaR5iW81+tT1ymOyeZeY5gK2+D+lL9g03pl87sqXBJiF
   +pt76R7jSTKzXGtm+vNOU5+UcU9hfhEzxj4urvpWN3GszcBNsxOlfh8XM
   ztqLT/igCR4Y8E7q7lvAZKwapOxVq9uULCixNCk4sY2nftuwzuWfLl2Ic
   A==;
X-CSE-ConnectionGUID: yaegIcNkSF67lSlYerfa2Q==
X-CSE-MsgGUID: kQcfZEodRvW+T2Fb3LCS8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="74715302"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="74715302"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:31:07 -0800
X-CSE-ConnectionGUID: F96DbFF7Tc+UOxybAuXsBQ==
X-CSE-MsgGUID: D1YrCgj/SBud2qJzUtP90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209420321"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.97])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 02:31:03 -0800
Date: Sat, 31 Jan 2026 12:31:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/6] i2c: xiic: switch to devres managed APIs
Message-ID: <aX3Z5iEZO8a0GYDs@smile.fi.intel.com>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
 <20260129-i2c-xiic-v7-2-727e434897ef@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129-i2c-xiic-v7-2-727e434897ef@nexthop.ai>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_023109_820026_3E717E71 
X-CRM114-Status: UNSURE (   6.72  )
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

On Thu, Jan 29, 2026 at 09:43:14PM +0000, Abdurrahman Hussain via B4 Relay wrote:

> Simplify the error code paths by switching to devres managed helper
> functions.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



