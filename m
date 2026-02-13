Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4377CEDF141
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/RwBSQ0dlvkl3hZQ0yBrAJZ1KLJvePgMkTC0jK7iKc=; b=ahai7V9Upr3QRQZLuCUN9V0Tvx
	9IXTEMRiYtBYI5sNCdB3VP0ZfdJeqy/xEOOVH6uw3DuFdgXzZN94LXgir8i5vkCTo0KB2Uy1V2Rbh
	O9fRpWMDq8mr8xmtOFQ5jZzmGtRJwqjFfkg/VHweESH/x4SusPDPNYwTySHb9u7L1AL/nGChFu23E
	qq8OcNP0FidMSXrbtPx13gn8uXdlphkkP9R8/kAmJmrW6hy5GdeKIkqVF23/qqBoLsqsqT1bThm03
	s+wiC1ONZ1YBiu6QfAf7PR3TYp6AiWt4s9EzEHnvKzm+ig6cR8CQ2QcJe+wPJoqVIWJpHKrf44IKQ
	v8db5raw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpxm-00000003HQC-3Eih;
	Fri, 13 Feb 2026 09:59:50 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqpxk-00000003HPs-0n6y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 09:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770976788; x=1802512788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g4Px+rF4j2zO6sLf5t/WktofEyLTwzxfotiEC9NhgjA=;
  b=mPb2bzmvdmP4Y5/joPRFjlLbGRITg55tyx5GGc7LCpx8cLUuFvKVR07x
   0BSJSLl/IKIDe9na9jGFSKn7MH2YoM1GXXM5w8UMcU+KkKdsmqxGoHJmC
   brzXUliYlnPDYKNKBvEJpod1zuRxaHPjv+bxfxnm3RYVlE8hWrvjdxwQN
   K+xK2cLAihZU/eQ22IPLYWt3TGFPwu5a7IA3OcARAVXmNU5iLGQYL95i8
   VXUIJoA2m0nV9njCgwiG/RFTSEfhkLu9U7vmc5u4EYx6iDnLMuheu/1TX
   CNG+Pv9Asc9gA5d7out26cEXlLpm5luFYQ7CGjr+JSqA1vb+115j3yLQT
   Q==;
X-CSE-ConnectionGUID: KzvcxvpFRYyXsJXugFXTLQ==
X-CSE-MsgGUID: 3d8pAiLJTcS0n3hIHHDGxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="89571126"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="89571126"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:59:47 -0800
X-CSE-ConnectionGUID: s7Aj24DqSn6NXPib4aGpNQ==
X-CSE-MsgGUID: UuvcFjcfS5+WPe/RF/REOQ==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.242])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 01:59:45 -0800
Date: Fri, 13 Feb 2026 11:59:42 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: abdurrahman@nexthop.ai, Michal Simek <michal.simek@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 3/7] i2c: xiic: switch to generic device property
 accessors
Message-ID: <aY72DtP9qwGxhMLd@smile.fi.intel.com>
References: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
 <20260213-i2c-xiic-v11-3-5d18aea11bde@nexthop.ai>
 <738dbc7c-9915-4308-8e0b-388d6b73b067@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <738dbc7c-9915-4308-8e0b-388d6b73b067@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_015948_297122_837BA882 
X-CRM114-Status: UNSURE (   7.60  )
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

On Fri, Feb 13, 2026 at 10:53:40AM +0100, Krzysztof Kozlowski wrote:
> On 13/02/2026 01:15, Abdurrahman Hussain via B4 Relay wrote:

> > Use generic device property accessors.
> 
> You should explain here the impact, e.g. making them work for ACPI
> platforms.

Good suggestion!

This all probably warrants a v12, but please, wait a few days. In any case
we are in the middle of a merge window, not much activity is usually happening
regarding to patch acceptance.

-- 
With Best Regards,
Andy Shevchenko



