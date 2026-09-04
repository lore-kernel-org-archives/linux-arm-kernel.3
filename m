Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B32C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 20:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjsyeeZIXvEmoWNXJQV4lGrquVa9d7oOm2nQ/duEaqk=; b=QTXZ7r6JjeUX9gRRsa4NAzFeFd
	T5EDaJW+xLmUWlsukIXISYLJbfsgLWF2aSHm9zjGhU7fuNxImV5meXwEEEAfdLLmwSnqp2cRmyWa7
	TrUwjRpFr8ZmTCIU8cuhgMbwR5PoRejHaoNIXYCD408htv0pBqfYDqMfhYbfYxjGg7EKf/zCcm/T7
	lFOpHJhopc3J76tNB3E1JXWMlh7OQN9CgBgkGGy1iOaRcixkd5d8byQE00vyHEL+nJ5dFFOVYx7dj
	h7v6/a3p9fTLcO7cSImsQA+RGz9W43Wb/OFoQliBc3iPY7qeV2CAz1SrqTONIqjKoVGvTukVJRKpl
	DZkM7i4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aQx-00000003FsV-3Ij7;
	Fri, 04 Sep 2026 20:22:47 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2aQv-00000003Frs-1Nub;
	Fri, 04 Sep 2026 20:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788553365; x=1820089365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bw2W1qZcmf7Blll3N+n4993Jy+r1dnnoyRkosVN9X3c=;
  b=Z32zrD31DVmdK6VQ5d2AQARVDvOAzQh3TQfcfQL8pDmLy5FZxY2JVodb
   25Duwnvv6Qi4FjdyZmb5utOSWiUywxGENveMJgLtxtxxfOy6KggBo74nM
   /QAEP2weXRBveaL2I+BlMpOx9cT25tpRTywdU65aE23/qSPM1dHgfT+US
   NSOim8eDcz0q3S3PlU5O/OIuYL60jwz995WM5BgV00Dl8iPYVD1qpfiV7
   h+cpa7DS/4+MfPf43MqLv4pRWZbZMd4Qlofb1NtiFHpaq9ARNbqzZO7tK
   0iVU29BpMddpMb3AW/WVTpkoiU+NhxnaZof6wMoOh0rp89iW4ILspkHRT
   A==;
X-CSE-ConnectionGUID: VJv5cql0QqmMUUzizyCD1g==
X-CSE-MsgGUID: wLT+dg/xTrGS7t95D3hx/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88825207"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88825207"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:22:44 -0700
X-CSE-ConnectionGUID: WwKLNACWRFaeMh5EWjuZfA==
X-CSE-MsgGUID: 1blCz6W6S2mCem8ip/60xw==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.86])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 13:22:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CBA3511F7F4;
	Fri, 04 Sep 2026 23:22:37 +0300 (EEST)
Date: Fri, 4 Sep 2026 23:22:37 +0300
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
Subject: Re: [PATCH v8 02/16] device property: Add
 fwnode_graph_get_next_port_endpoint()
Message-ID: <apsojRC47DnD-PZC@kekkonen.localdomain>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_132245_433583_C13EA587 
X-CRM114-Status: GOOD (  14.79  )
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

On Fri, Sep 04, 2026 at 04:41:41PM +0800, Chen-Yu Tsai wrote:
> Due to design constraints of the power sequencing API, the consumer
> must first be sure that the other side is actually a provider, or it
> will continually get -EPROBE_DEFER when requesting the power
> sequencing descriptor.
> 
> In the upcoming USB power sequencing integration, the USB hub driver
> first needs to check whether a graph connection exists, and whether
> the other side of the connection is a supported connector type. The
> USB port is tied to a "port" firmware node, and this new helper will
> be used to get the endpoint under the known "port" firmware node.
> 
> Sashiko points out that the |prev| reference put is not done if |port|
> is NULL. However it seems that the fwnode_*() and of_*() API design
> implicitly makes the functions no-ops if the passed in node is NULL.
> So this new addition follows the same pattern.

I'd put this last paragraph after the '---' line.

> 
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

