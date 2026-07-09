Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12B6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cMek7e/6OVdU46LZnlf8qTyLjh7R4XSz82LsjtOyPVM=; b=NzBdcOG45bPR6b9b/EUcK/ZIoj
	B+G8NNcHDOUbiZKd3Tw9JybuAexnxd5ErurXoYrQaGzoOhjjDymThSVk6uI7NlKc7e/og0Usd/yMc
	P3Pcz+Q5tlv7lastR5zwXgRENBIgE/P/GJHZegPTxdiUEv0irZ2++EbviOfWOLUfIZCRBZSnoKH84
	LCz3LzSfUGG2I6u0U1tQq6m+MncrrFk7xIH3R6zPYdu0GNH2vOEzINqupRo5SiTGWA8XXExudMJwd
	FZLxysRvmxPI/dzqivar4r1XszhSqJY2TfFd2JLhNvtMuRZwcMLgBuujnDmZpj21LUE5bN5A/DhtS
	oqr16eRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmPk-0000000234y-44gs;
	Thu, 09 Jul 2026 10:55:32 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmPg-00000002349-2wsL;
	Thu, 09 Jul 2026 10:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783594529; x=1815130529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xFcQQhmhINQD3s4rCXCWmru3qkNnkEH19O9zKAO6j1I=;
  b=WqEOdHr2JEjRWCK8g8PlzB2JvLE03QYi0/zbn7nIHKLSxoUgTWlp0Rss
   q3Znnb88Ej0HA7SC/a2hGHWL0I1gf/EAI3XEBaOex28J720YIF547Ok2e
   1u5pmnW+q/k9QXhl4lg1RbBV1O5W5jSN1rEwCDc3on/jNDmaGvyWxzLN3
   5GVyPykHMeWCU+bBIgfz93c80EQCR2Sho20XWyYWrrsX/THCVl2T/HgeQ
   tDenyRlpB6wSfph+qbYesK27o2TDmqPjwdF/YWDXWRk66IFKtj+sSefXM
   fixCZpxCBJiE3hHnh/buyRBfHMfBHfqmb+vnD8pQLsBIqJkz6A8obBjGX
   A==;
X-CSE-ConnectionGUID: Z+mPjy3lRJGkF+n6zlQyVQ==
X-CSE-MsgGUID: 3/vyVwNLQNa/p3QXOdNHnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95425814"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95425814"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:55:28 -0700
X-CSE-ConnectionGUID: AR6qK3CCSDC7cPGAveNTzQ==
X-CSE-MsgGUID: 7/7aeqFzRVWBEcBauFhSaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255214900"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:55:22 -0700
Date: Thu, 9 Jul 2026 13:55:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4 11/14] power: sequencing: pcie-m2: support matching on
 remote "port" node
Message-ID: <ak9-FxumFw-NtQt2@ashevche-desk.local>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-12-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709095726.704448-12-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_035528_781158_7BA9BD43 
X-CRM114-Status: GOOD (  15.51  )
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

On Thu, Jul 09, 2026 at 05:57:16PM +0800, Chen-Yu Tsai wrote:
> A USB hub can have multiple ports, and this driver needs to
> differentiate which port is being matched to. The USB hub driver now
> associates the "port" node with the usb_port device, so here we can
> use the remote "port" node to check for a match. Then fall back to
> the remote device node for the other connection types.
> 
> Also rewrite the existing "remote == dev_of_node(dev)" with
> device_match_of_node() for consistency.

...

> +		/* USB port devices are tied to the port nodes. */
> +		struct device_node *remote_port __free(device_node) =
> +				of_graph_get_remote_port(endpoint);

> +

No blank line here as this one is coupled with the check.

> +		if (device_match_of_node(dev, remote_port))
> +			return PWRSEQ_MATCH_OK;
> +
> +		/* Try the remote port parent for other types. */
>  		struct device_node *remote __free(device_node) =
>  				of_graph_get_remote_port_parent(endpoint);
> -		if (remote && (remote == dev_of_node(dev)))

> +

Ditto.

> +		if (device_match_of_node(dev, remote))
>  			return PWRSEQ_MATCH_OK;
>  	}

-- 
With Best Regards,
Andy Shevchenko



