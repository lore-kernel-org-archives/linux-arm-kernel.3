Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521ACCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nb4XXr6KkizPUPhjsN743zIm3TzJmUxq1zKhFwFcpIA=; b=4ynSzyABvmTFxKb45L/lTl9vFE
	huVB5Rrc4UD5jIpV1BXfi1e8BPdKnQPwHHtAcygt/YKrVYLt/zIaGXjcxyylXqGPOjkP6G3llwERC
	nompxJ4vHyz75LsFL4bwRH3yYkA3+ZA1a2dSXsG0WjyhsgkUKkMEazsAKHBgJTVtS7KRqHkfVEVTI
	SsVN7P5GueIf7bomhwQYpIiSiNuRUg0gaZw6eXQX+XRBFTv62FatVBmV/Nib1+W9ZPj08aHljdZH0
	p/UC/R33c2bfIvbTjMVdzKvy8isxwU6Zr1J3hoFqsyNS5ymqIFecspracT60p7B1C/qY1oWg7NYJn
	n81/2kYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJU2H-0000000AEmd-1Lbe;
	Thu, 13 Nov 2025 09:54:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJU2F-0000000AEmC-0Quh;
	Thu, 13 Nov 2025 09:54:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B891A12FC;
	Thu, 13 Nov 2025 01:54:25 -0800 (PST)
Received: from [10.57.40.163] (unknown [10.57.40.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 266A73F5A1;
	Thu, 13 Nov 2025 01:54:28 -0800 (PST)
Message-ID: <d0238361-8953-4f08-8c04-bacaf0465366@arm.com>
Date: Thu, 13 Nov 2025 09:55:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] of: Add wrappers to match root node with OF
 device ID tables
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Hans de Goede
 <hansg@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Andersson
 <andersson@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
 <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_015435_595013_6268D282 
X-CRM114-Status: GOOD (  23.82  )
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

Hi Krzysztof,

On 11/12/25 10:28, Krzysztof Kozlowski wrote:
> Several drivers duplicate same code for getting reference to the root
> node, matching it against 'struct of_device_id' table and getting out
> the match data from the table entry.
> 
> There is a of_machine_compatible_match() wrapper but it takes array of
> strings, which is not suitable for many drivers since they want the
> driver data associated with each compatible.
> 
> Add two wrappers, similar to existing of_device_get_match_data():
> 1. of_machine_device_match() doing only matching against 'struct
>     of_device_id' and returning bool.
> 2. of_machine_get_match_data() doing the matching and returning
>     associated driver data for found compatible.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> All further patches depend on this.
> ---
>   drivers/of/base.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>   include/linux/of.h | 13 +++++++++++++
>   2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 7043acd971a0..0b65039ece53 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,53 @@ bool of_machine_compatible_match(const char *const *compats)
>   }
>   EXPORT_SYMBOL(of_machine_compatible_match);
>   
> +/**
> + * of_machine_device_match - Test root of device tree against a of_device_id array
> + * @matches:	NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns true if the root node has any of the given compatible values in its
> + * compatible property.
> + */
> +bool of_machine_device_match(const struct of_device_id *matches)
> +{
> +	struct device_node *root;
> +	const struct of_device_id *match = NULL;
> +
> +	root = of_find_node_by_path("/");
> +	if (root) {
> +		match = of_match_node(matches, root);
> +		of_node_put(root);
> +	}
> +
> +	return match != NULL;
> +}
> +EXPORT_SYMBOL(of_machine_device_match);
> +
> +/**
> + * of_machine_get_match_data - Tell if root of device tree has a matching of_match structure
> + * @matches:	NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns data associated with matched entry or NULL
> + */
> +const void *of_machine_get_match_data(const struct of_device_id *matches)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *root;
> +
> +	root = of_find_node_by_path("/");
> +	if (!root)
> +		return NULL;
> +
> +	match = of_match_node(matches, root);
> +	of_node_put(root);
> +
> +	if (!match)
> +		return NULL;
> +
> +	return match->data;
> +}
> +EXPORT_SYMBOL(of_machine_get_match_data);
> +
>   static bool __of_device_is_status(const struct device_node *device,
>   				  const char * const*strings)
>   {
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 121a288ca92d..01bb3affcd49 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -407,6 +407,8 @@ extern int of_alias_get_id(const struct device_node *np, const char *stem);
>   extern int of_alias_get_highest_id(const char *stem);
>   
>   bool of_machine_compatible_match(const char *const *compats);
> +bool of_machine_device_match(const struct of_device_id *matches);
> +const void *of_machine_get_match_data(const struct of_device_id *matches);
>   
>   /**
>    * of_machine_is_compatible - Test root of device tree for a given compatible value
> @@ -855,6 +857,17 @@ static inline bool of_machine_compatible_match(const char *const *compats)
>   	return false;
>   }
>   
> +static inline bool of_machine_device_match(const struct of_device_id *matches)
> +{
> +	return false;
> +}
> +
> +static inline const void *
> +of_machine_get_match_data(const struct of_device_id *matches)
> +{
> +	return NULL;
> +}
> +
>   static inline bool of_console_check(const struct device_node *dn, const char *name, int index)
>   {
>   	return false;
> 

Makes sense based on the clean-up in dtpm.c (since I've been there
I looked here as well).

LGTM

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

Regards,
Lukasz

