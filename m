Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCE8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 06:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQ6aU2tj5J981532k8odhWVSalgYKqqrx/r3VTOhRd0=; b=qEXRrV7v9RyGjI1LuA1BekgqSG
	FgwQFRAtMcKhX9wyvsJLYHQXs4PrZZuwqPzenZN67EDDdYhAqr914cWzMT6oecXPYlGLrDFiVoiUE
	4YF4WMK66UdU4EWJyRsluRMqrpntZQrGMDjgAc6ttYasH8xIbmYmF3Op+EmL1Fzj7cYNjTGS3aR37
	sm8yBfC8v4nY0ZiGE4SIOj3HW9ldXNwJ4lDxLNfa47Z1UQlvqxPtaQ/j1qXIoB8/N7OYj96+laiVH
	e5klbBzd5b+qaasFxBGU0IgiadacZi19tn/lH5gohDxd9H8HroGbVPiY4TLl4yFXGm1Xfz/h8SjZ/
	jPXCYLyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEhG-0000000CLfq-3HUe;
	Wed, 10 Sep 2025 06:52:50 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEhE-0000000CLf3-2r5E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 06:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757487169; x=1789023169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xbxzbd9N/J4R8JD9GiiHN7QemzWWqNtVAcebecs6kMo=;
  b=BdNGbrz+D7konkVCSOtDMfR4rByKNPKGBO598f8ZaKVkyOsw/79y07hH
   NFe4btqTTRBMW1UYDIT8xebqRzmpTNLZhU2snpzHiVYf5M3ozmL/+QcIP
   nnhqx86G0PYYIoNpsn/CyVkU3jOC1dN99F2SexwGNEJKvQHEeYZ1vWEkz
   P9Lf3dCLvFKHIpeMph5I7GgHXGAXf2TZQKrmiVJYCZg5ueVhJ7F4tRpl5
   n8TYvgOFFZXvcULuOgOy6D1CGVnuU3psiTxwW6dYa+jKLC5FomN6JNYt9
   xfjF+2q1tBQfZuqWhQqLECTMQq47j5M0qSCxnEhYqrs3Qh/VXB+QIMISy
   w==;
X-CSE-ConnectionGUID: Bv81BGpwR4WgZlxfMI0n8w==
X-CSE-MsgGUID: UVYvdySnTuqErgcwYki9NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59009246"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="59009246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 23:52:46 -0700
X-CSE-ConnectionGUID: hrfBlALWRS+/KWf7YVGKMw==
X-CSE-MsgGUID: S5OAHpV4SDW3E4KxEva7sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="177579067"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.14])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 23:52:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 932A71201B4;
	Wed, 10 Sep 2025 09:52:38 +0300 (EEST)
Date: Wed, 10 Sep 2025 09:52:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <aMEgNtjcy1-NuBds@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
 <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_235248_735259_A7E17088 
X-CRM114-Status: GOOD (  13.78  )
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

Hi Cosmin,

On Thu, Sep 04, 2025 at 10:52:09AM +0300, Cosmin Tanislav wrote:
> Hi Sakari.
> 
> I recently left Analog Devices but I will continue to try upstreaming
> this driver. After the upstreaming is done we can switch the
> maintainer status to someone else.

Ack, thank you.

> 
> Here's the output for the commands you asked, provided by my
> ex-coworker. It's for MAX96716 + 2xMAX96717 + 2x IMX219.
> 
> Do we need to fix anything based on the compliance tests?

Looking at the errors, it looks like some fixing is needed, possibly also
on v4l2-compliance side.

Regarding GMSL, are the image width, height or mbus code used for anything
by the serialiser or deserialiser drivers?

-- 
Kind regards,

Sakari Ailus

