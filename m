Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66648C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYt6V9Jnqt8R/CJJl+keIMNvwfnVSgPAem6i+B/iGB0=; b=KofNtgT+RrgHR/I0fJPwU/RPHC
	oKRzAPYg2dlFTvjc38kz6JIfY5uTg8uGUHHtYOgVBOEVM7LdximakTQQxHykM8Yw5hGuN2hYrTp/z
	RjafZKnPa7qeqMF06IltIPjW23tR7O3UhWFx1FZU/kmdPM/BGfbUxZ2b6eJ1Ff6iYzsldn6Q99P87
	Els5FDJxcaiIklc9jGyLRB+d2Oa8JCzbeeiIRd4PgiSAiVk6QjOjjYuhs9snyzKTwLgFPEHP+619J
	K8PY/qctrnZsjrxqXWf9l0h36O4g+y6Y5pPPre8RlBdfhmY9tA8tWUc0inW5CIxnTzcIt098GhNf4
	GrRaoUOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcdf-00000006taG-0IAk;
	Fri, 03 Jul 2026 12:04:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcdd-00000006tZN-1kAE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:04:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8CE54349C
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 12:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FED1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783080296;
	bh=lYt6V9Jnqt8R/CJJl+keIMNvwfnVSgPAem6i+B/iGB0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=R43BrsCkCyKD/cc1XKL6zqzw3XTY2TUpQl7n0q5JuLJdVZNi18xkae1IcOWb2pmP2
	 illl8oyL+0cRX0a1cWPr+392XOPXDshG8txXXgvS94Pp4A+9wQYLOQOlDuarGUYpNa
	 JJfDmLgE6juRr8ofDcXTnOfq2Z9ENufPlYGG+yOG/Imcaimd0ivaN3esJXMdFhYPFQ
	 Bexmo1mq6eIpDnf3bjJSY/SnYCDQOQxQEIeP3Qte3g+4Mh/Byg7UCDdPPnWPgQA3wM
	 A4JVLQ0D5sW6yI4X5kTy2RCb8QmLJC/zsYvs7mMibj9jUM++lMCCkhqezmnfaIVnt/
	 F5x0ONb5FeqHA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b349ae174so4307461fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 05:04:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr2DMX8UxXlVD9Ud3BrJDu83iM+Xg17ukvHnULfpn8wUtja8ihpsO4wBtjciCfZNyybSAkutdfRcpu38+yrCQ68@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjym3qw5CmTJO/vop2R4Tz2g9DK0+3AGKbICmUgdzZfhBZVTS6
	ZEMZ+EoaC5zIiKrb1DkI4R0k5GBd9SGLa0IbBeZ8/96j+fx+ZSfSyqMa+wuOP5+wrcjZPNmFlrc
	v2nuDhWkaCj5s1udXN95cuh/Nfx9yhUBeUcEFJRjhKg==
X-Received: by 2002:a2e:beaa:0:b0:39b:32b3:b31f with SMTP id
 38308e7fff4ca-39b36dbe62amr23176871fa.5.1783080295099; Fri, 03 Jul 2026
 05:04:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:04:53 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:04:53 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703110317.1283411-3-wenst@chromium.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-3-wenst@chromium.org>
Date: Fri, 3 Jul 2026 07:04:53 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mc7TzwLS1Kbyd9OwXPJcHk-39kxgfagxxCCbKYK8QG0Vg@mail.gmail.com>
X-Gm-Features: AVVi8CfmsSUQO2IQlOpABcTwLAPK-fQZLHJJwpMHDg07kXLzC1jeLanLhSp6ZO4
Message-ID: <CAMRc=Mc7TzwLS1Kbyd9OwXPJcHk-39kxgfagxxCCbKYK8QG0Vg@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] device property: Add fwnode_graph_get_next_port_endpoint()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 3 Jul 2026 13:03:03 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
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
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Dropped unused |ep| variable
> - Rewrote as do {} while()
> - Dropped WARN() use
> ---
>  drivers/base/property.c  | 25 +++++++++++++++++++++++++
>  include/linux/property.h |  2 ++
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 3e3e19ef66a9..7e7ad3635806 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
>  }
>  EXPORT_SYMBOL(fwnode_irq_get_byname);
>
> +/**
> + * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node in port
> + * @port: Pointer to the target port firmware node
> + * @prev: Previous endpoint node or %NULL to get the first
> + *
> + * The caller is responsible for calling fwnode_handle_put() on the returned
> + * fwnode pointer. Note that this function also puts a reference to @prev
> + * unconditionally.
> + *
> + * Return: an endpoint firmware node pointer or %NULL if no more endpoints

I think the correct keyword is Returns: followed by a newline.

> + * are available.
> + */
> +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
> +							  struct fwnode_handle *prev)
> +{
> +	do {
> +		prev = fwnode_get_next_child_node(port, prev);
> +		if (fwnode_name_eq(prev, "endpoint"))
> +			break;
> +	} while (prev);
> +
> +	return prev;
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
> +
>  /**
>   * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
>   * @fwnode: Pointer to the parent firmware node
> diff --git a/include/linux/property.h b/include/linux/property.h
> index e04901c0bd8f..931e703393cb 100644
> --- a/include/linux/property.h
> +++ b/include/linux/property.h
> @@ -506,6 +506,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
>  void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
>
>  struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
> +struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
> +	const struct fwnode_handle *port, struct fwnode_handle *prev);
>  struct fwnode_handle *fwnode_graph_get_next_endpoint(
>  	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
>  struct fwnode_handle *
> --
> 2.55.0.rc0.799.gd6f94ed593-goog
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

