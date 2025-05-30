Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AB3C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 13:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7OxFbjgxAqQhG2qjcloe2Q0BLRuzZKIXA55VLRJ9NE=; b=VmlvuSWs50THO21AJcjysRsBQn
	Dqf6Ny1IThD6NO+69Wegf3M5C4UuWDdoH3Vgi9+/vfcyz3kBHk59dlX76VV0MLTWhC+sIVpKF2fav
	rJSshPJg1xPDaOfhakEPPNBwfZYEzjTVACrmbNTkbUsiK7DwL6tKb4k4rDf+fIqwDdeJwd7vcH/bG
	Yx+mdMcGoR3dHL4as8z6HWrcXzeGCHMrh+YpeRZVMXijkR0G60Wmu1IxvnYGTTRHWawHC3QkekEo9
	l3VU2yfYdCXSkvhPW9sAI/U7eQBNOwwxfws4X+OfLbPZXp6+XKQ9iMV5v/Qu9cS2btcjBo2b/PUuQ
	9KmFz8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzW7-00000000iae-3LsM;
	Fri, 30 May 2025 13:11:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzTx-00000000hjh-3tVI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 13:09:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4F0F1692;
	Fri, 30 May 2025 06:08:52 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 363A63F5A1;
	Fri, 30 May 2025 06:09:08 -0700 (PDT)
Date: Fri, 30 May 2025 14:09:05 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 2/7] firmware: arm_scmi: add is_gpio() function
Message-ID: <aDmt8biXL1HrKykw@pluto>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
 <de456bd70a3e092a6379f548ce35e38253ff97b1.1746443762.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de456bd70a3e092a6379f548ce35e38253ff97b1.1746443762.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_060910_058500_C060A190 
X-CRM114-Status: GOOD (  27.01  )
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

On Mon, May 05, 2025 at 02:37:36PM +0300, Dan Carpenter wrote:
> Parse the GPIO response in scmi_pinctrl_attributes(), set the gpio
> flag, and create an is_gpio() function pointer so that it can be queried.
> 

Hi,

> In SCMI only functions and pins have a GPIO flag so that's why groups are
> not handled here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/firmware/arm_scmi/pinctrl.c | 38 ++++++++++++++++++++++++++---
>  include/linux/scmi_protocol.h       |  2 ++
>  2 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
> index d18c2d248f04..f842bf7fe628 100644
> --- a/drivers/firmware/arm_scmi/pinctrl.c
> +++ b/drivers/firmware/arm_scmi/pinctrl.c
> @@ -28,6 +28,7 @@
>  
>  #define EXT_NAME_FLAG(x)	le32_get_bits((x), BIT(31))
>  #define NUM_ELEMS(x)		le32_get_bits((x), GENMASK(15, 0))
> +#define GPIO_FUNC(x)		le32_get_bits((x), BIT(17))
>  
>  #define REMAINING(x)		le32_get_bits((x), GENMASK(31, 16))
>  #define RETURNED(x)		le32_get_bits((x), GENMASK(11, 0))
> @@ -107,6 +108,7 @@ struct scmi_group_info {
>  struct scmi_function_info {
>  	char name[SCMI_MAX_STR_SIZE];
>  	bool present;
> +	bool gpio;
>  	u32 *groups;
>  	u32 nr_groups;
>  };
> @@ -114,6 +116,7 @@ struct scmi_function_info {
>  struct scmi_pin_info {
>  	char name[SCMI_MAX_STR_SIZE];
>  	bool present;
> +	bool gpio;
>  };
>  
>  struct scmi_pinctrl_info {
> @@ -189,7 +192,7 @@ static int scmi_pinctrl_validate_id(const struct scmi_protocol_handle *ph,
>  
>  static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
>  				   enum scmi_pinctrl_selector_type type,
> -				   u32 selector, char *name,
> +				   u32 selector, char *name, bool *gpio,
>  				   u32 *n_elems)
>  {
>  	int ret;
> @@ -217,6 +220,8 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
>  
>  	ret = ph->xops->do_xfer(ph, t);
>  	if (!ret) {
> +		if (gpio)
> +			*gpio = GPIO_FUNC(rx->attributes);
>  		if (n_elems)
>  			*n_elems = NUM_ELEMS(rx->attributes);
>  
> @@ -610,7 +615,7 @@ static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
>  		return 0;
>  
>  	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
> -				      &group->nr_pins);
> +				      NULL, &group->nr_pins);
>  	if (ret)
>  		return ret;
>  
> @@ -679,6 +684,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
>  {
>  	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
>  	struct scmi_function_info *func;
> +	bool gpio;

...can we just avoid this local var and just...

>  	int ret;
>  
>  	if (selector >= pi->nr_functions)
> @@ -689,7 +695,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
>  		return 0;
>  
>  	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
> -				      &func->nr_groups);
> +				      &gpio, &func->nr_groups);

				      &func->gpio, &func->nr_groups);

>  	if (ret)
>  		return ret;
>  
> @@ -698,6 +704,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
>  		return -ENODATA;
>  	}
>  
> +	func->gpio = gpio;

...and dropping this...

>  	func->groups = kmalloc_array(func->nr_groups, sizeof(*func->groups),
>  				     GFP_KERNEL);
>  	if (!func->groups)
> @@ -763,6 +770,7 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
>  {
>  	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
>  	struct scmi_pin_info *pin;
> +	bool gpio;

... same here...

>  	int ret;
>  
>  	if (selector >= pi->nr_pins)
> @@ -772,10 +780,12 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
>  	if (pin->present)
>  		return 0;
>  
> -	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
> +	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, &gpio,
> +				      NULL);

Ditto.

>  	if (ret)
>  		return ret;
>  
> +	pin->gpio = gpio;

Ditto.

>  	pin->present = true;
>  	return 0;
>  }
> @@ -815,9 +825,29 @@ static int scmi_pinctrl_name_get(const struct scmi_protocol_handle *ph,
>  	}
>  }
>  
> +static int scmi_pinctrl_is_gpio(const struct scmi_protocol_handle *ph,
> +				u32 selector,
> +				enum scmi_pinctrl_selector_type type)

being an is_something function could not make it return a bool ?

...but of course loosing the return error code in case of query is_gpio
on a group, and just maybe returning false in that case and a
dev_warn()... (but I have still not seen how this is used by your driver
as of this review...)

> +{
> +	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
> +	int ret;
> +
> +	ret = scmi_pinctrl_get_pin_info(ph, selector);
> +	if (ret)
> +		return ret;
> +
> +	if (type == PIN_TYPE)
> +		return pi->pins[selector].gpio;
> +	if (type == FUNCTION_TYPE)
> +		return pi->functions[selector].gpio;
> +
> +	return -EINVAL;
> +}
> +
>  static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
>  	.count_get = scmi_pinctrl_count_get,
>  	.name_get = scmi_pinctrl_name_get,
> +	.is_gpio = scmi_pinctrl_is_gpio,
>  	.group_pins_get = scmi_pinctrl_group_pins_get,
>  	.function_groups_get = scmi_pinctrl_function_groups_get,
>  	.mux_set = scmi_pinctrl_mux_set,
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 688466a0e816..b4ad32067fc4 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -792,6 +792,8 @@ struct scmi_pinctrl_proto_ops {
>  	int (*name_get)(const struct scmi_protocol_handle *ph, u32 selector,
>  			enum scmi_pinctrl_selector_type type,
>  			const char **name);
> +	int (*is_gpio)(const struct scmi_protocol_handle *ph, u32 selector,
> +		       enum scmi_pinctrl_selector_type type);o

Doxygen comment above too please...

>  	int (*group_pins_get)(const struct scmi_protocol_handle *ph,
>  			      u32 selector, const unsigned int **pins,
>  			      unsigned int *nr_pins);
> -- 
> 2.47.2
> 

Thanks,
Cristian


