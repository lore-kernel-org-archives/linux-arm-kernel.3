Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A040FCD0CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNR0IFxrmO5JLjdAL9oWrBwcQNLTGyQXiJ/dq8QixMY=; b=RZTjgZ4nQ8AC2x
	z17xhEtXunE5YNJowxXACJUgdws+Uydu2yumhpBKUIGGCRjOAEwpVtSUEuLyXBdGSv9BCQ1LXzlUb
	WM3Jib/+k3J0KwYY0Vox1L2hrJuOSaL5tDGt5MPRmjZ1Glk5xrsHyew49OFfup6nIuPwiv9Mm1BPk
	hg/QeqmKYjgTGl/J/CjXafkhF5LnlkirpO/blf05P6KGNFtKZkXafKEoAg6voSB6FG2mQGm6H2rot
	eddBCnVtV902CF0O/FpslWXQY5HrV84l4B9RZoJs4yzSj7/EL0L3SoSD5PfxgTSjRK6ZYc84iYYj+
	UW9l8IsaXQVcP1/Dg0qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2m17-0000000817i-24DV;
	Wed, 18 Mar 2026 08:12:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2m16-0000000817U-1FD3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:12:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 827AB60130;
	Wed, 18 Mar 2026 08:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C6FC19421;
	Wed, 18 Mar 2026 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773821555;
	bh=W1CjCpjO5V3l04HiQPLXc4y4ilM4koh72sJL6FzLrLQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=EGelKz/EVImNowrO0fKLmlYhkQrRTVQDQI0vuw8fWMxAxTr9xlcCyzDg5kArn9UeJ
	 Zp3LwctDoyk+k49PLN+nLj8bDpCASZCCKXBW3a+UZgSdsZk5UlsAf9BWDB9m0FkZU8
	 obTcTAqCYkxvCYITAuW6faFTCqajiiV42FhCOcnpRf2L3ewKH595qhPzl/6eOlIK/L
	 yyUCNxPl7h7Q7xdrR+bKW8tQ+zlffnc9YpPWTJBkX5j6rDKqLGAmEtunCoCsvbxWY3
	 qgFCbNkOtDlGdJgJvcfHV8SPUEHAXpZqDlpqiRJLF13I2amJ+xxWTfLwUBpVjTpeqy
	 HuSA6kr7X3U5Q==
Message-ID: <bad30062-3f61-41cb-af78-21f13b77ed4d@kernel.org>
Date: Wed, 18 Mar 2026 09:12:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] firmware: smccc: Add support for Live Firmware
 Activation (LFA)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
 <20260317103336.1273582-3-andre.przywara@arm.com>
 <20260318-wealthy-quartz-iguana-9a836e@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <20260318-wealthy-quartz-iguana-9a836e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 18/03/2026 09:09, Krzysztof Kozlowski wrote:
> On Tue, Mar 17, 2026 at 11:33:28AM +0100, Andre Przywara wrote:
>> +
>> +/* A list of known GUIDs, to be shown in the "name" sysfs file. */
>> +static const struct fw_image_uuid {
>> +	const char *name;
>> +	const char *uuid;
>> +} fw_images_uuids[] = {
>> +	{
>> +		.name = "TF-A BL31 runtime",
>> +		.uuid = "47d4086d-4cfe-9846-9b95-2950cbbd5a00",
>> +	},
>> +	{
>> +		.name = "BL33 non-secure payload",
>> +		.uuid = "d6d0eea7-fcea-d54b-9782-9934f234b6e4",
>> +	},
>> +	{
>> +		.name = "TF-RMM",
>> +		.uuid = "6c0762a6-12f2-4b56-92cb-ba8f633606d9",
>> +	},
>> +};
>> +
>> +static struct kset *lfa_kset;
>> +static struct workqueue_struct *fw_images_update_wq;
>> +static struct work_struct fw_images_update_work;
>> +static struct attribute *image_default_attrs[LFA_ATTR_NR_IMAGES + 1];
> 
> Bunch of singletons here because (see later)...
> 
>> +
>> +static const struct attribute_group image_attr_group = {
>> +	.attrs = image_default_attrs,
>> +};
>> +
>> +static const struct attribute_group *image_default_groups[] = {
>> +	&image_attr_group,
>> +	NULL
>> +};
>> +
>> +static int __init lfa_init(void)
>> +{
>> +	struct arm_smccc_1_2_regs reg = { 0 };
>> +	int err;
>> +
>> +	reg.a0 = LFA_1_0_FN_GET_VERSION;
>> +	arm_smccc_1_2_invoke(&reg, &reg);
>> +	if (reg.a0 == -LFA_NOT_SUPPORTED) {
>> +		pr_info("Live Firmware activation: no firmware agent found\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	pr_info("Live Firmware Activation: detected v%ld.%ld\n",
>> +		reg.a0 >> 16, reg.a0 & 0xffff);
>> +
>> +	fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
>> +					      WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
>> +	if (!fw_images_update_wq) {
>> +		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
>> +
>> +		return -ENOMEM;
>> +	}
>> +	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
>> +
>> +	init_image_default_attrs();
>> +	lfa_kset = kset_create_and_add("lfa", NULL, firmware_kobj);
>> +	if (!lfa_kset)
>> +		return -ENOMEM;
>> +
>> +	err = update_fw_images_tree();
>> +	if (err != 0) {
>> +		kset_unregister(lfa_kset);
>> +		destroy_workqueue(fw_images_update_wq);
>> +	}
>> +
>> +	return err;
>> +}
>> +module_init(lfa_init);
> 
> You do not use driver model, but 199x style of modprobing and performing
> actions.
> 
> I do not understand why module load is already doign anything. This
> looks like misinterpretation/misuse of Linux driver model - in a way,
> you don't use it all and this is like back to 199x where modprobe was
> already meaning you bind drivers...

Although now going through further patches I found you implementing some
parts of driver model, so probably this split is just needing fix.

Modprobe must not do "arm_smccc_1_2_invoke" or any other device related
things. You only initialize your bus, just like every other bus driver
would do, but honestly this should not be a bus-like code.

Best regards,
Krzysztof

