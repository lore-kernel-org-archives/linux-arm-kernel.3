Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C67ACA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZrIrBxCNNXXECOP7DQAWlSRM76fCEDYQdJAhh/qYf8=; b=xt0hM0lUKpwsF3Z4arnDjtHe4m
	LVgpzm7RYJ7euhyuECmpD/FaYHBar6UfBXKg0zY2SujA7n8wVv5IK8rLaBe8hj+GkwK699OH7vsXk
	JYrrqhEgcB6JfgZbmfnz6gCDdBQSUVusFgIziRz0Lxp5uKVtlc0ryyc+8QAM5IwahnleXm1eQ9tzH
	01uggTIzQ8Ow60xq+xw61WiAQhGsY5iRWoT9DRCJa8Gb6udPkDvt9u2QGs8U4O8moXFzfIWQm7A0a
	4sHbihPOKi7i5+u06vN/1N7Yvyk4TghqotBSVIlX+nC1x56u2UK8zFeFWr5yV3sxhfYvDXyW2fInR
	HlIXiiAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUtS-000000035uF-07np;
	Tue, 29 Sep 2026 10:17:02 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUtJ-000000035rR-438f;
	Tue, 29 Sep 2026 10:16:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790677014; x=1822213014;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=e//TCcit/ISzMYO0YeFaG6Hi1WgM+P6dvupJ+mrGO14=;
  b=JdFwo8URVpX8maWAea0yJYA6nrIXVkYQ/IBFPRahbb4eBhaos+w4YKxu
   7G2ht/pEhgcIAdrqCH+K568yilbDkU8vrHZ/iPlmy3ua16AAubiyRaqfH
   ratWoBoM5l8nfvjg6Kl01DQV5WpuuHB8XkjIH4zAaHwTYg6z8oqTxbGDM
   YlVssa/ofM10EnPzfrGwGa2XXuTEzqDM/w6QYf6zn6nmii41RbJcX8WuP
   yLpJshS+Ewh10O4yu0Y2MIzTEZ4ijYQOdwmawGzWeDJ8XAheEtm0pbQNJ
   gLEsldz60QRsNYeiwEn963bCZM962KIEYHb89KoVKvHwzBoznG3HYJ+q2
   A==;
X-CSE-ConnectionGUID: 7/8mlqj4R4azuO/M7XPP3Q==
X-CSE-MsgGUID: trwPFWaRRPeB7Rj+TZYfTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101558572"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="101558572"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:16:53 -0700
X-CSE-ConnectionGUID: mcFPh+TaRTGZ537dHTcCpQ==
X-CSE-MsgGUID: xQ/qpcy8QsmvUL+LJw7xhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="271815009"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.233])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:16:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Javier Martinez Canillas
 <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <aruD5kwOEsvFhW2e@beelink>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
 <aruD5kwOEsvFhW2e@beelink>
Date: Tue, 29 Sep 2026 13:16:41 +0300
Message-ID: <42cfa3fb2246c66d69e45d7d9b8d6aaadc0da4c4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_031654_053199_207C3285 
X-CRM114-Status: GOOD (  18.11  )
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

On Tue, 29 Sep 2026, Benjamin Tissoires <bentiss@kernel.org> wrote:
> Ouch. This immediately raises the "let's implement a parser in the
> kernel" flag, or "let's create a new langage".

Fair.

> You'd still need a dedicated driver for your new blob parser, with far
> fewer people who had had a look at it than BPF who has been working on
> for several years.

Fair.

> The integration of BPF and the kernel is honestly transparent nowaday:
> calling a struct_ops BPF function is just a function call away, and from
> the bpf calling anything in the kernel is also just a call away.

I don't know if I'm just being overly conservative here, but it seems to
me BPF provides too much flexibility for the use case. But maybe the
point is completely moot, and you should just ignore me. ;)

> See Maxime's answers: yes, falling back to dedicated driver is still
> encouraged.

[Moved the above to go with below.]

> Isn't that what Maxime wants to have? One driver for a plethora of DSI
> panels, with the same ability the BIOS has to also do function calls to
> set things up?

I suppose this is something that could use some clarification. Is the
idea that most (simple) dedicated panel drivers eventually get converted
to BPF? Or is the idea that BPF is easy for prototyping and development
using stable kernels and short time to market, and most of them would
eventually get converted to dedicated panel drivers?

The story wrt display before userspace is up and running also needs
clarification.


BR,
Jani.


-- 
Jani Nikula, Intel

