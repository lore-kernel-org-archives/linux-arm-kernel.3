Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683A7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKXVaY4pvzXF0DTi5PsRgZDNYnOewnDAIVksiSk+weg=; b=QXQv+kQon8gqVu27F15uAc/EMm
	06x0s3GvAQTqb2d08Vt7yudMWMD7GJ5Z5SvxwA7JzMPtIMWHdGahqixrECMkXRsZcJ1GkOFYpL5F7
	YSxB/ClxygpgciRhtzOK79dRRV/GCAz1uLP8rwmwEKy2sr9OOG3gvalTI5PjGoQIa262amelTaJYB
	EAHGML36zugyEQ/aV5tEg5ckUWVQC9vbbtcUxSJhIRHNuIf7PuB+/qxv2XgkmYybFG12dPb8fxVBO
	XjZoECivy1EqFSAIwIhTwoIUK5YFxo2K9ROqdaQDvAEtU/R4xJxRUq7j7do8nbvtEqoqpWqd+DsVl
	q4NCng8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiA2E-00000004tY1-3GY9;
	Fri, 10 Jul 2026 12:08:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiA2E-00000004tXo-0TGX;
	Fri, 10 Jul 2026 12:08:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EEAC260051;
	Fri, 10 Jul 2026 12:08:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B5D1F000E9;
	Fri, 10 Jul 2026 12:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783685327;
	bh=hKXVaY4pvzXF0DTi5PsRgZDNYnOewnDAIVksiSk+weg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vo0O6UI6tlXkw70wVEdUQEWW//hMh6zTJywnktib0C5FMEMvvxkfZFTr73frfzKvp
	 al80t2ZNngkuBry7bMS9zNzmmXYC969dWSUdj5McEqcglWY4l689gjtJk07VlzhQIz
	 VGXg9askrhybgI4+MBAARgkRyuYG7LEPZRVzTY3s=
Date: Fri, 10 Jul 2026 14:08:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v4 05/14] usb: hub: Associate port@ fwnode with USB port
 device
Message-ID: <2026071025-diffused-jersey-0d94@gregkh>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709095726.704448-6-wenst@chromium.org>
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

On Thu, Jul 09, 2026 at 05:57:10PM +0800, Chen-Yu Tsai wrote:
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
> 
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
> 
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v3:
> - Added missing fwnode_handle_put()
> 
> Changes since v2:
> - Skip assignment if hub firmware node is ACPI node
> ---
>  drivers/usb/core/port.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b1364f0c384c..e8fb2acd77be 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,6 +7,7 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
> @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *dev)
>  {
>  	struct usb_port *port_dev = to_usb_port(dev);
>  
> +	/*
> +	 * At this point ACPI nodes and swnodes have been removed by
> +	 * device_platform_notify_remove() in device_del().
> +	 */
> +	fwnode_handle_put(dev_fwnode(dev));
>  	kfree(port_dev->req);
>  	kfree(port_dev);
>  }
> @@ -780,6 +786,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>  	port_dev->dev.driver = &usb_port_driver;
>  	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
>  			port1);
> +	/*
> +	 * ACPI FW nodes are associated later when device_register() happens.
> +	 * Skip assigning one here to avoid potential conflicts.
> +	 */
> +	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
> +		device_set_node(&port_dev->dev,
> +				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
>  	mutex_init(&port_dev->status_lock);
>  	retval = device_register(&port_dev->dev);
>  	if (retval) {
> @@ -852,6 +865,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>  
>  void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
>  {
> +	struct usb_device *hdev = hub->hdev;
>  	struct usb_port *port_dev = hub->ports[port1 - 1];
>  	struct usb_port *peer;

Is this last variable addition not needed here?  It's not used.

thanks,

greg k-h

