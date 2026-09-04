Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A356C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 20:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHzO1vK007onq7ZRRCVcxMaeaee0HBq8s8LCu+NpiCs=; b=R4yyLQW2l0aZM+F0gWPeIMGL/G
	m39h5Qq9fTrh96coXja+ZgWyzOyDnVtK+F7sUqWzcWTkx0/+n7Pcuzds+wHN1dD2/LqZK7g9bhJcL
	KGIv5grljWEv9ycsml01RoactY4lfBda37tHPV6W41PtodmCOR53LECvLAoPcYwz+7NqVD4EB6vjB
	LIq+FNtzCVRIwNYtF9zMTWJtqkdFXa4fbM0OOB846td5C1psy8nT/klDtcNzpWU3wI8VmTRL/sofl
	kqM+qWHDUvRDxwB5NAwiDNLNvRov6cLy87CUPDNQF7lxCn1FWOU5lGOLNIxUTMk+w4gCiT/47Q4Jc
	S0FUbnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aMh-00000003Fe2-19rw;
	Fri, 04 Sep 2026 20:18:23 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aMf-00000003FdA-1Gif;
	Fri, 04 Sep 2026 20:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788553100; x=1820089100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z5rgzC2ZXtEFFsyI/mhG8YgT7oVtGQudZOzxj795Sog=;
  b=N5SzOXnmwvWUqKv7G27CwXfG6CIAnVtv8tROpMnw6O8YgHWbqupLB5/P
   CkrIjBgUpWmsQrzwJdz7kgncDuJyq9AFa6a4CL/q67vptYO7mEk2f1j/u
   W/Af1UbhgTYkGOY21SyS7rl6/cG4tzlHHhvz+RadSM0X0ueILJbZYvD7h
   sCKpiloL5VgMEddmM43MDbFqwrKrkPuJfmeedsmEd11jdPDS+k2Tv9/14
   BcbEU7oWhFsAT7aZ+dULIXODbQ8r41H4Ej88HRWb5T9QkqoSiL9eWKSwt
   MsybLQYKOrmKLvkRSEqQBawVuo+RTVkvXW05cq56AF3+Y6Or+Dl3IcJ11
   w==;
X-CSE-ConnectionGUID: nDhIAkm1Tju+VmfeThF+cQ==
X-CSE-MsgGUID: zJqtKgECTjGKNa3PcmGnVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89093871"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="89093871"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:18:19 -0700
X-CSE-ConnectionGUID: UK+p2y7PRwKlW144I7lA6A==
X-CSE-MsgGUID: nfqpePWmQhiaLID+A3JNeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="295011246"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.86])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:18:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EAC3911F7F4;
	Fri, 04 Sep 2026 23:18:13 +0300 (EEST)
Date: Fri, 4 Sep 2026 23:18:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 01/16] device property: Add
 fwnode_graph_get_port_by_id()
Message-ID: <apsnhbsN1ENl31JX@kekkonen.localdomain>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_131821_378148_D6850C03 
X-CRM114-Status: GOOD (  10.92  )
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

On Fri, Sep 04, 2026 at 04:41:40PM +0800, Chen-Yu Tsai wrote:
> In some cases the driver needs a reference to the port firmware node.
> Once such case is the upcoming USB power sequencing integration. The
> USB hub port is tied to the corresponding port firmware node if it
> exists.
> 
> Provide a helper for this.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

