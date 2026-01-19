Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB6DCA5FF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 11:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InzMZ2sKPU+dBiXuXrFvQIinli9OSxMqyO9gWD6Sl84=; b=v+V5/zVC8ev9JNunKEKbFSs0ts
	1xQU9YpyGPfePBJe2gPyx2SPNq6ZsM89We7jUp9vhA8liOftFUEWfk/11Q1FlS+R/zkW6ua9sE1jD
	YCfhB22T8MMOEXouCqA44wZwwDVnQARNyH8DxKTAAjpBXTb01dpZPrYK+5lVWuY3ohOxIK790hBgs
	XU3+iIA+XMm/LS43yNQHntf7Jkgc0TPI8/hIVzvn6mMQjjkWtvDHY095fr0q25o41qi61dx8ThmJ/
	KX1Us996n3cSnVRt5TwwfTC2yjsAH7x42rWEM28JUcv+OVk2SjDHxkyoMw5DFpoxfoZgeqrPX/sgm
	Y2kkNNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn66-00000001qoG-12hG;
	Mon, 19 Jan 2026 11:07:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhn63-00000001qnO-3K6t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 11:07:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12BBD41A4E;
	Mon, 19 Jan 2026 11:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BEC8C116C6;
	Mon, 19 Jan 2026 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820818;
	bh=FSHtm5y+0kZFCu8h7MAlOolnmcLEJiXQsqC8mgqCK0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M/3rPe+VeDwVPcMY41CgntHHzX52DrZ0Q9LntDEdhFwNDiNZ+STK82e5P8+fTyKDM
	 DyPXKjY5ovs4CJIuPMfV4bFzgLkuVtS9YVZxtJVrjT3KTCx6Lt50yKGHNFtwjJiioZ
	 nRo+/iFAN2Yo41CvjEQUqCEYz+oCH0IdS9UATPlAo/IjYIH20q8aTsdTpeQSk7f+Qz
	 8eou2/M7Ip9TXxzlIaBsgTffX6DujbxZky1fjiNwbe1DQLng6YsJKWQD40SP/jF/2q
	 1OLSx6lcmdOrWzcG4u/cDPaN57epDjYD//Wwa+BRG53He0SLZsLR2jz5ALHlw9R7Rn
	 813vdS2ZEk1iA==
Message-ID: <ff8db3d9-cb27-4ea3-8953-a7786eb54a01@kernel.org>
Date: Mon, 19 Jan 2026 12:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] of: provide of_machine_get_compatible()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_030659_873762_F4A5E3DD 
X-CRM114-Status: GOOD (  14.62  )
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



Le 19/01/2026 à 11:40, Bartosz Golaszewski a écrit :
> Provide a helper function allowing users to read the compatible string
> of the machine, hiding the access to the root node.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   drivers/of/base.c  | 13 +++++++++++++
>   include/linux/of.h |  2 ++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 0b65039ece53aa90f30da2420a893a02ab4c6dd8..a7e27d5355929abd6d156b80c52f8f8b08fe6da1 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
>   }
>   EXPORT_SYMBOL(of_machine_compatible_match);
>   
> +/**
> + * of_machine_get_compatible - Get the compatible string of this machine
> + * @compatible: address at which the compatible string will be stored
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int of_machine_get_compatible(const char **compatible)
> +{
> +	return of_property_read_string(of_root, "compatible", compatible);
> +}
> +EXPORT_SYMBOL_GPL(of_machine_get_compatible);
> +
>   /**
>    * of_machine_device_match - Test root of device tree against a of_device_id array
>    * @matches:	NULL terminated array of of_device_id match structures to search in
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 9bbdcf25a2b448ba4ec5ddee8b35a105ca4aab8b..75423fb556ee4c108ce25144a0bdc252a89f7d1d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
>   	return of_machine_compatible_match(compats);
>   }
>   
> +int of_machine_get_compatible(const char **compatible);
> +
>   extern int of_add_property(struct device_node *np, struct property *prop);
>   extern int of_remove_property(struct device_node *np, struct property *prop);
>   extern int of_update_property(struct device_node *np, struct property *newprop);
> 


