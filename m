Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE07C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9GpmWG9z4KmYMArWkU9Qkj4gXpmwS/Ki8W3YEn+1MQ=; b=OpIes2ZKSU1NRJtZm3gr9Cl4Pd
	DpM95tdmWm169v403nCUFAWZ3qME9Y2QXyKVpORaA0roIAbGkTXiN/nzrs9jwfj+lw8fj6UBtqH2m
	+6VNSoFWdGlzAOziyg0L+1FuxA7N7TOCb6YXXn5Jg7K1fASbPK53t1EtK7UP/dIXkxHRx6s7skIg5
	0afpcqmj4vedJrnOwnuRa3phoBwqWXsdJ0D2ltCKg3r1QWkKVMibYWDh6wRpuMrZMpar1sbT1AIsC
	fqF1JDJw7v7glksBB7pkEd3FY1bSV+cNvJ1yare4XenHqFsF8JCrZnGvRv6P8eTtHkKb5uManhB3e
	ArAFBPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Qi-0000000DQuk-3PDz;
	Fri, 11 Jul 2025 01:20:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua03M-0000000DC87-48ZX;
	Thu, 10 Jul 2025 22:47:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91BD945B78;
	Thu, 10 Jul 2025 22:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B54C4CEE3;
	Thu, 10 Jul 2025 22:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752187662;
	bh=4o95IkNEz5qpXJwUn+JNDIWRtNDnZj8MA7Si8Zwy1S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KP+sVKUDFDP9NafAD/jq4V4vwbBR9xx9KDdzk/xN015ABez2x6loPMO18npmrWcQJ
	 kfZBpXkdQ078YNC6gA/UabJEBdtDYAgsHAzHYjSUxy2/zjRGYyZ7xIVZxxHcN4j7U5
	 JVPAOAu/7uMLrPR2SFSPlPNBTbWgb8/ZTUrw62PROOVUMFpc3GK9oj16D47lbNQAJ7
	 JjsUmLGSqQgz2LhdN2IF6/FSjFt1AncRUXBvNZjzL45KHCwrf0WNf1RqfQUtO+L3a4
	 jA8x2i1SRVmSSNmjTi/SdJaS8+HJzJUu0Q4AdbMRuJXthu4J3Q7nMx+NLHXQ4qHZho
	 RWHPOFGlqqaiA==
Date: Thu, 10 Jul 2025 17:47:40 -0500
From: Rob Herring <robh@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Elliot Berman <elliotb317@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Andre Draszik <andre.draszik@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
	linux-rockchip@lists.infradead.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v10 02/10] dt-bindings: power: reset: Document
 reboot-mode cookie
Message-ID: <20250710224740.GA15385-robh@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-2-b2d3b882be85@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-2-b2d3b882be85@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_154745_062490_07B3C18A 
X-CRM114-Status: GOOD (  22.03  )
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

On Thu, Jul 10, 2025 at 02:45:44PM +0530, Shivendra Pratap wrote:
> Update the reboot-mode binding to support an optional cookie
> value in mode-<cmd> properties. The cookie is used to supply
> additional data for reboot modes that accept two arguments.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/power/reset/reboot-mode.yaml         | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
> index 3ddac06cec7277789b066d8426ea77d293298fac..a4d2fe1db51e0c1f34ebefddaad82b8cc0b1b34a 100644
> --- a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
> @@ -10,14 +10,15 @@ maintainers:
>    - Andy Yan <andy.yan@rock-chips.com>
>  
>  description: |
> -  This driver get reboot mode arguments and call the write
> -  interface to store the magic value in special register
> -  or ram. Then the bootloader can read it and take different
> -  action according to the argument stored.
> +  This driver gets reboot mode arguments and calls the write
> +  interface to store the magic and an optional cookie value
> +  in special register or ram. Then the bootloader can read it
> +  and take different action according to the argument stored.
>  
>    All mode properties are vendor specific, it is a indication to tell
>    the bootloader what to do when the system reboots, and should be named
> -  as mode-xxx = <magic> (xxx is mode name, magic should be a non-zero value).
> +  as mode-xxx = <magic cookie> (xxx is mode name, magic should be a
> +  non-zero value, cookie is optional).

I don't understand the distinction between magic and cookie... Isn't all 
just magic values and some platform needs more than 32-bits of it?

>  
>    For example, modes common Android platform are:
>      - normal: Normal reboot mode, system reboot with command "reboot".
> @@ -45,5 +46,6 @@ examples:
>        mode-recovery = <1>;
>        mode-bootloader = <2>;
>        mode-loader = <3>;
> +      mode-edl = <1 2>;
>      };
>  ...
> 
> -- 
> 2.34.1
> 

