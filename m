Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEFCC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 11:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Z1LLqzUpAeu2t6beTWtDt9GlFaIn8mlKLU11UjpdUQ=; b=nfRO/EZ0zkWd+zktiL2PTdYIw5
	U4+LnB1wvVjpDCCtyTNioSe5zqXGOU7miKAaxN/XQDMy5u8/Bhg79R4pKcr74H61SQgZDauqPQc69
	Yd5PwpEUR5oUvhwjaj7EiDEx4JrMBTzyJxHxgtl/8YM5tN975hhBSmSerZcILPlTP3OWo76uUpoYf
	EiIZQE0Gv1SMDYMZwCmnXDvI7S0UtEIA+NYudVqkthFd8g6g881KroJu0hvOdUDHy/SFjRP/3Ce+p
	cip7ZS72XChsmIURcRcR33oWLecOFxU3ppRGqIEGFQDybbuIwkuZlPilQStkdpRfhEm6e5OwQ9WF2
	Z7Bf70Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWviR-0000000893T-2nt2;
	Wed, 02 Jul 2025 11:33:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv0L-00000007zpq-0Sgp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 10:47:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65A4A5C578A;
	Wed,  2 Jul 2025 10:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5CDC4CEED;
	Wed,  2 Jul 2025 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453272;
	bh=dkrctSKnjdlsw2PLtAn4EpKUFuAA7kypA3Hrt9pRSVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=odj+E+jZWQjYS9aRqRuwMJeYI88ylhf5Ci4buASLTti0if+pATjRwHaPhVXvSEP6Q
	 ra2sJkuj2jGFwOiO9EpuoknxOD8gJHfN3Yj5Ta7MHd8EyJ4ejCc9NJNHwTUujrmwXY
	 7k/4Deuh4JXl7yUr777QCZh5sJWgeoH6Dv3hwbbBnRtb/SVIqwHrR1Bs29CkxBpU/t
	 FKQ9ToXgeATVt9+jalL9fYwzlL1bwFK3gfdeQFQoLispw70IC7NnfSosOnr67iHp+E
	 DlvMSL22ZfKaVqdITqkEdbnXMrPlXXerxOu+HZm0EDFDmbFIABXj3MConV4Qjh0BW0
	 PQLM8P1+TybkQ==
Message-ID: <2559f035-787e-4c80-8889-d1826a27171b@kernel.org>
Date: Wed, 2 Jul 2025 12:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] mmc: sdhci: add Black Sesame Technologies BST
 C1200 controller driver
To: Albert Yang <yangzh0906@thundersoft.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, gordon.ge@bst.ai,
 catalin.marinas@arm.com, geert.uytterhoeven@gmail.com, will@kernel.org,
 ulf.hansson@linaro.org, adrian.hunter@intel.com, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, soc@lists.linux.dev,
 bst-upstream@bstai.top, neil.armstrong@linaro.org,
 jonathan.cameron@huawei.com, bigfoot@classfun.cn, kever.yang@rock-chips.com,
 mani@kernel.org, geert+renesas@glider.be, andersson@kernel.org, nm@ti.com,
 nfraprado@collabora.com, quic_tdas@quicinc.com, ebiggers@google.com,
 victor.shih@genesyslogic.com.tw, shanchun1218@gmail.com,
 ben.chuang@genesyslogic.com.tw
References: <20250528085403.481055-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-6-yangzh0906@thundersoft.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
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
In-Reply-To: <20250702094444.3523973-6-yangzh0906@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_034753_251012_C0D8DACC 
X-CRM114-Status: GOOD (  18.71  )
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

On 02/07/2025 11:44, Albert Yang wrote:
> Add a driver for the DesignWare Mobile Storage Host Controller (DWCMSHC)
> SDHCI controller found in Black Sesame Technologies C1200 SoCs.
> 
> The driver provides specialized clock configuration, tuning, voltage
> switching, and power management for the BST DWCMSHC controller. It also
> includes support for eMMC boot and memory-mapped I/O for CRM registers.
> 

Missing SoB.

...

> +
> +static int bst_sdhci_reallocate_bounce_buffer(struct sdhci_host *host)
> +{
> +	struct mmc_host *mmc = host->mmc;
> +	unsigned int max_blocks;
> +	unsigned int bounce_size;
> +	int ret;
> +
> +	/*
> +	 * Cap the bounce buffer at 64KB. Using a bigger bounce buffer
> +	 * has diminishing returns, this is probably because SD/MMC
> +	 * cards are usually optimized to handle this size of requests.
> +	 */
> +	bounce_size = SZ_32K;
> +	/*
> +	 * Adjust downwards to maximum request size if this is less
> +	 * than our segment size, else hammer down the maximum
> +	 * request size to the maximum buffer size.
> +	 */
> +	if (mmc->max_req_size < bounce_size)
> +		bounce_size = mmc->max_req_size;
> +	max_blocks = bounce_size / 512;
> +
> +	ret = of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(mmc)->of_node, 0);
> +	if (ret) {
> +		dev_err(mmc_dev(mmc), "Failed to initialize reserved memory\n");
> +		return ret;
> +	}
> +
> +	host->bounce_buffer = dma_alloc_coherent(mmc_dev(mmc), bounce_size,
> +						 &host->bounce_addr, GFP_KERNEL);
> +	if (!host->bounce_buffer)
> +		return -ENOMEM;
> +
> +	host->bounce_buffer_size = bounce_size;
> +
> +	/* Lie about this since we're bouncing */
> +	mmc->max_segs = max_blocks;
> +	mmc->max_seg_size = bounce_size;
> +	mmc->max_req_size = bounce_size;
> +
> +	dev_info(mmc_dev(mmc), "BST reallocate %s bounce up to %u segments into one, max segment size %u bytes\n",
> +		 mmc_hostname(mmc), max_blocks, bounce_size);

Devices are supposed to be silent on success.

> +


...

> +/**
> + * dwcmshc_remove - Platform driver remove
> + * @pdev: Platform device
> + *
> + * Removes the SDHCI host controller.
> + *
> + * Return: 0 on success
> + */
Drop all such fake comments, not helpful. We all now what is the purpose
of the function and saying that platform driver remove callback is
"platform driver remove" which "Removes the SDHCI host controller." is
not only redundant, but actually harming because later you have:
"Return: 0 on success"
which is impossible.

Such redundant comments are not kernel coding style. Provide USEFUL
comments, useful kerneldoc, not something to satisfy line-counters.


Best regards,
Krzysztof

