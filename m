Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB1EFEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cD8P2tgu0apAWqjJEf8nXuFb43/7yGEaH3yQ4zcVZs=; b=pl49aAIKwyeG08jQPTR/tlgxzZ
	3bXZiSSlC5c5CyQ6peO5TBpXBJfAlxpUtzLprfBQf/0Lqf/pd0o26FLTQ8g5yMILzZ/Lf4/nHUpi4
	ViGcbQ4na5//zLrJBAtRD+tYBBlsOTkbKcYdkBYhZeC1a+mojX5904Ki3eRJdKSAub21lWa10QMsE
	inyb7P2cUS4RLD9e9yN8dsY8AQOKAp1nnM3WBQUHcgknwb2t4LuK3h1C43dpJGHCxYlghZEEBNFaP
	HNm91hnzWSAH4d0pi5LOLDhD4iCU5rbtADNLEDdVKt8iE8CTWeq+wumc8AR3RLssglmYzYEqsOlKQ
	7j1mgbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw26H-00000008sH8-19mn;
	Fri, 27 Feb 2026 17:58:05 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw26F-00000008sDD-0tzI;
	Fri, 27 Feb 2026 17:58:03 +0000
Message-ID: <4186c887-fec4-4677-a7b0-e48c52ac5dea@infradead.org>
Date: Fri, 27 Feb 2026 09:58:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] usb: dwc3: add needs_full_reinit flag
To: Xu Yang <xu.yang_2@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-2-08c10b08ebb6@nxp.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-2-08c10b08ebb6@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi--

On 2/12/26 12:35 AM, Xu Yang wrote:
> The current design assumes that the controller remains powered when wakeup
> is enabled. However, some SoCs provide wakeup capability even when the
> controller itself is powered down, using separate dedicated wakeup logic.
> This allows additional power savings, but requires the controller to be
> fully re‑initialized after system resume.
> 
> To support these SoCs, introduce a flag needs_full_reinit for the purpose.
> And the glue layer needs to indicate if the controller needs this behavior
> by setting a same flag needs_full_reinit in dwc3_properties.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
> Changes in v4:
>  - also rename core_may_lose_power to needs_full_reinit
>  - add R-b tag
> Changes in v3:
>  - no changes
> Changes in v2:
>  - put core_may_lose_power into dwc3_properties and check it in
>    dwc3_get_software_properties()
>  - rename may_lose_power to needs_full_reinit
> ---
>  drivers/usb/dwc3/core.c | 9 +++++++--
>  drivers/usb/dwc3/core.h | 3 +++
>  drivers/usb/dwc3/glue.h | 3 +++
>  3 files changed, 13 insertions(+), 2 deletions(-)
> 

> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index a35b3db1f9f3..67bcc8dccc89 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1119,6 +1119,8 @@ struct dwc3_glue_ops {
>   * @usb3_lpm_capable: set if hadrware supports Link Power Management
>   * @usb2_lpm_disable: set to disable usb2 lpm for host
>   * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
> + * @needs_full_reinit: set to indicate the core may lose power and need full
> +			initialization during system pm

The line above should begin with
 *

Please correct it so that kernel-doc doesn't complain:

WARNING: drivers/usb/dwc3/core.h:1122 bad line:                         initialization during system pm

Thanks.

>   * @disable_scramble_quirk: set if we enable the disable scramble quirk
>   * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
>   * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk



