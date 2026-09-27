Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B01C98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 06:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+Gwm6lcN44yKfThqb/22M+e0KWtFbEL5S8O3GkejOo=; b=UW4iO07MX4IbOv6D1GZQ2B19wU
	8wp1Px8f4AbWKeOJSjn/RhPfvrzu/CzeM/ZfmeB9GMK6pWzVaUGSGfmDhpW4y6JjEhThMIN1CtUfU
	zEjJpJcCAquRZqaMtn5S0PvQekNZ8oFHlNXdhlV34q5SyWl1jAmfmdf5reWryz8KIx1nyhuAagGn/
	USfSKZMNlOZtJoK2SXpEtCTFO2ABYlx2V2+1+7nYlZUFcwkIWblOjMHelkcE1aMrQYAGOQcGPTIfY
	s//pkGVcDkhLTHpaJ8coXnxpUXNQMnjZB6TvXHGbSGmQJuF/uvE5hrEG80NSc5VI6dc+F+NGttEKd
	No0JhVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAhvf-0000000G2ru-3V7x;
	Sun, 27 Sep 2026 06:00:03 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAhvd-0000000G2rT-1fCg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 06:00:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790488801; x=1822024801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dFrMRTaM50w6MUSwIBo5810D1BGxuc88L4LqmAIJ6L4=;
  b=PF50zWSTGBe/JHtBBMi9jKjGVpnK2QsmzzafC7GSXncoQJFtYqGvrgjH
   Odt5A4O0w8oRA1uTYywnpnKa9P9JlwoFdYDhNzRfMZcOZF21bovJZpb76
   /OAOw0wVb5OWHwO77p0BH4OgV/YsUTT9RjGy8v4n3efbJVw3B5uD5V3pW
   fJjKaUWqudwCh4QrDTZhVNQK1pvLlIgiS6eY1yXAI709ldZPnPwQDlpsE
   rqp3L4R8FG+JNJ1nO94exRiPmk32qvt/YKxNxPL8cTJITHPszKztB1wGf
   9tAqJmkw6h95w4KnS53zS33jRSOKJ1NOM54hbLC6Q/Qba/7W4CrgnCSfi
   Q==;
X-CSE-ConnectionGUID: M8oP+lGQQxKGYkFzcxOnfA==
X-CSE-MsgGUID: uWbfkMYET4SmKbsQsj3yrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="91318917"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="91318917"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 22:59:58 -0700
X-CSE-ConnectionGUID: +dPMM4q4Tty31MYDW9Lmvw==
X-CSE-MsgGUID: 2EWn7My+TXKhut47WgceXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="274796968"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.231])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 22:59:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CA832121182;
	Sun, 27 Sep 2026 08:59:55 +0300 (EEST)
Date: Sun, 27 Sep 2026 08:59:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, mripard@kernel.org,
	jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH 2/8] media: v4l: Add 10-bit RGBIr formats
Message-ID: <ariw2_Eepxeu73Hc@kekkonen.localdomain>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-3-r-donadkar@ti.com>
 <arfW_sncBRNsyP4L@kekkonen.localdomain>
 <81dbeb60-2531-4a1e-ba04-2add8e819e0a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81dbeb60-2531-4a1e-ba04-2add8e819e0a@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_230001_558658_632C29BC 
X-CRM114-Status: UNSURE (   9.49  )
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

On Sun, Sep 27, 2026 at 10:38:06AM +0530, Rishikesh Donadkar wrote:
> > Can the sensor output Bayer pattern as well?
> 
> No, the sensor give only gives out RGB+Ir where the CFA is a 4x4 repetition
> of B,G,R and Ir.

There are some other Omnivision sensors that can't, AFAIR ov5678 is one of
those as well. These two will still need to wait until we have the common
raw sensor model patches in (they're in the set). See
<URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=metadata&id=a6ea06f3d920f93bece27053e1193a483bcaf4af>.

-- 
Sakari Ailus

