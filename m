Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0672AC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/2uz3Z9LXt81xrmADWBDtSalvtqiayfNTtdYsjQ0ro=; b=TTvGC/YyoEj1MGIeY6Mcc96VZK
	P+2oG3i0Xfp3ErIb5A7NGpYWlZVBVjxZRrXVXI7KvonXcs2gMJziBrgKQs0FoDCc0aJHZ7/eOkwtt
	fJcbFcASvxJmS7rsINEwYDHmjt7jKPCIXpo4Lt5+PijgIomZ91PglNbvikFsPjR/6jv5VU53MKYAn
	bDfvM2Lg5k4w+uhYo81E01fK8qKW2tSnBVhx8JAG1DibiU0fNaiyYn8twugf5VxIiz75ui+nRGC6g
	gYFKIgJRcJwnFt+Y3QstPGqHHOr26QLhz+AW92bvFadbeZFr1pGW1P81QPUNY6Kx08eSaRyZa2Abo
	K8QVIY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLKw-0000000BHfO-2VQa;
	Mon, 10 Aug 2026 08:26:22 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLKu-0000000BHeN-1ZDz;
	Mon, 10 Aug 2026 08:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786350380; x=1817886380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=++vktebTJ+rMB1mZxjsv9rXUywIuN/HM5q3NZWWkCDk=;
  b=Ez6yytasg1AGi6nW8IOpDIobHQqFqeYz2M4Jua+UKg1qMXe4B0Pbgq5B
   IjHFfRn7NTaaQglfzekc6nj8ejqpTvOaGQFLgsSuUP3O3srAuatQoykY/
   oXQjl9aYaluy0bKStq82ggZwaZfs6K/frBYHcJ7Pp0GMxF786N1/0P0lW
   p2psXlQQ3Ipr4wIAfrbCbl98gUHuyq1IrFRbICSBftSQFpJv1am/oD9xU
   vbzL/anGYaedMZGLAWNi8XRbKHn1bhSqzVNPIoVc1KhA/DlAPHcH50kil
   1xNLQ+6Q0Vii4AY773GIDxgkxE0+yJiEgot9pqjWT3BNyK2ZvKbypOscQ
   A==;
X-CSE-ConnectionGUID: komk6A8aSfi11S6Hf6mzEQ==
X-CSE-MsgGUID: VFphwRQARaC87TaJ2Dd72w==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="85976394"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="85976394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:26:16 -0700
X-CSE-ConnectionGUID: qsY+KBHKTJaaQy+CCw/B+w==
X-CSE-MsgGUID: UzhpxU54SZmz8vkYlnfovg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="264960575"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.104])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 01:26:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 137AA121197;
	Mon, 10 Aug 2026 11:26:09 +0300 (EEST)
Date: Mon, 10 Aug 2026 11:26:09 +0300
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
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v7 01/16] device property: Add
 fwnode_graph_get_port_by_id()
Message-ID: <anmLIT--JrEvOaSs@kekkonen.localdomain>
References: <20260724084328.3943997-1-wenst@chromium.org>
 <20260724084328.3943997-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724084328.3943997-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_012620_425214_223E749B 
X-CRM114-Status: GOOD (  25.76  )
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

Hi Chen-Yu,

On Fri, Jul 24, 2026 at 04:43:10PM +0800, Chen-Yu Tsai wrote:
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
> ---
> Changes since v5:
> - Dropped left-over declaration in header (Sashiko)
> 
> Changes since v4:
> - Added flags parameter so users can specify whether incomplete ports
>   are returned or not (Sashiko)
> 
> Changes since v2:
> - Moved "Return:" kernel-doc section to the end. (Andy)
> 
> Changes since v1:
> - New patch
> ---
>  drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
>  include/linux/property.h |  2 ++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 9387bb83eb54..950defc0c55a 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -1346,6 +1346,35 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
>  }
>  EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
>  
> +/**
> + * fwnode_graph_get_port_by_id - get the port matching a given id
> + * @fwnode: parent fwnode_handle containing the graph
> + * @id: id of the port
> + * @flags: fwnode lookup flags
> + *
> + * The caller is responsible for calling fwnode_handle_put() on the returned
> + * fwnode pointer.
> + *
> + * Does not return ports that belong to disabled devices or endpoints that
> + * are unconnected, unless FWNODE_GRAPH_DEVICE_DISABLED is passed in @flags.

The function also does not return ports that have no endpoints. I don't
think it'd be very useful to do that either, instead this should be still
documented.

> + *
> + * Return: A 'port' firmware node pointer with refcount incremented.
> + */
> +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode,
> +						  u32 id,
> +						  unsigned long flags)
> +{
> +	struct fwnode_handle *ep;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0,
> +					     flags | FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return NULL;
> +
> +	return fwnode_get_next_parent(ep);
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);
> +
>  const void *device_get_match_data(const struct device *dev)
>  {
>  	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
> diff --git a/include/linux/property.h b/include/linux/property.h
> index 14c304db4664..01ea010cb2f9 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -505,6 +505,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
>  
>  void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
>  
> +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
> +						  unsigned long flags);
>  struct fwnode_handle *fwnode_graph_get_next_endpoint(
>  	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
>  struct fwnode_handle *

-- 
Kind regards,

Sakari Ailus

