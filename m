Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE58CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrGrHEHB/cKOoPoRmSFTzjODhHD/P6Lz+mzHwb0t7QM=; b=uptxmewlg7T0ScHnpYUnA7UUCJ
	wUoCetvxYXrNyzjr8Tj5OoczDGEhlbTHQD9AmuofBPz7SENxFxXGByVjSyaDtox77CKOa4/zh6v44
	MlCYHAppv/A7LNMH+H3Kr2rYrrSvLSqpi0svXTpjEx3oCTEnb6ddOHcNGyTuBxM6iDaHpbeRWuU5R
	5MEQKXyAeF1iS3alc8oaoJylTq7CSReiK/9rvpP+xGIG4F+VXtp5i2xtCmHf8K5J8YcHqwK6nJlwX
	3Tlk6O/4lH0bvzkSO/FU7RfaFNqgXzY5hS229eR14DdgAMDiDcOF+G14q4nqMwKOIRtodZJaO2zn6
	RvVUdSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJnW-00000007rMl-3FiP;
	Wed, 10 Jun 2026 14:20:50 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJnT-00000007rME-3RcB;
	Wed, 10 Jun 2026 14:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781101247; x=1812637247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SSfdvGJ95M79HPR7Rt+qyNUmSfnZ+9rC3nohuvkXv/U=;
  b=mFBlZdnPuaxg5Nz3LucM29TVsBxRc3lQtrsFw9LOg5ZEWkzzuAbb9QyH
   QVp0Q/q/wPgdsptp5riyF9XMfn3qAWIPB+dQFNlbS377bJXHXp1mVTmGK
   1f1/56lQuYJtwsikp+X7JdH+dGFPlWJCIiCOzUWJGwotfh5fdBGukMIVQ
   ISjsE8366DRTE+WngCJoIbeLrauwiLPMUQALe1a56qaTvhPs7qe3d+qgP
   SZJ+l+JirczLRalcW2LzvdjLSs6dPCUOhf504LwMfhwC/zsfIWeBo8nR9
   Hz7aj2hvltJSo5tRT3siumDxK4WuJ+rrCd1kkmPyrLrRbrPiXgtsZiM0C
   w==;
X-CSE-ConnectionGUID: LTw4WY2WTzqxIT4I8af5Fg==
X-CSE-MsgGUID: 50SuLdfcSLusKpIqd074Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="82004239"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="82004239"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:20:46 -0700
X-CSE-ConnectionGUID: DIH6p4zGTWGAJtG8z8Ek8Q==
X-CSE-MsgGUID: RvpnyJBWQpKGe5LiDKyd+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="251095296"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:20:41 -0700
Date: Wed, 10 Jun 2026 17:20:38 +0300
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
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v2 04/16] usb: hub: Return actual error from
 hub_configure() in hub_probe()
Message-ID: <ailytpKQcvYTUH7j@ashevche-desk.local>
References: <20260610084053.2059858-1-wenst@chromium.org>
 <20260610084053.2059858-5-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610084053.2059858-5-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_072047_908853_2FC1CA8D 
X-CRM114-Status: GOOD (  14.84  )
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

On Wed, Jun 10, 2026 at 04:40:38PM +0800, Chen-Yu Tsai wrote:
> The addition of power sequencing descriptor handling in the USB hub code
> requires dealing with deferred probing from pwrseq_get(). The power
> sequencing provider may not yet be available when the USB hub probes.
> 
> Return the actual error code from hub_configure() when it fails, so that
> the driver core can notice the deferred probe request.

Makes sense to me.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

One nit-pick, though.

...

> -	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
> +	ret = hub_configure(hub, &desc->endpoint[0].desc);
> +	if (ret >= 0) {
>  		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
>  
>  		return 0;
>  	}
>  
>  	hub_disconnect(intf);
> -	return -ENODEV;
> +	return ret;

Can we convert to regular pattern, id est checking for errors first?

	ret = hub_configure(hub, &desc->endpoint[0].desc);
	if (ret < 0) {
		hub_disconnect(intf);
		return ret;
	}

	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);

	return 0;

-- 
With Best Regards,
Andy Shevchenko



