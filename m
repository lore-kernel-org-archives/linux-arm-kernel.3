Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23289C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pW3qjSxkCH92H2whhfbYLPJ+Rua7jGtrn3gaobu7xXU=; b=4zb1YRISW0CgTKeWrI/o5RfaoJ
	mAqc9jN8pQXMGynUQPPN6Q0evzSSRufB/OWbqw2MOvNeSFPchMd1YHiv0+39FbTQeTS+9wSqNk3gf
	21bIh9lIZPlL2fz/JDFC7bcTs+bS85xGWrCpraodC6x7ZEteYTVmdgyu1jX6XQw6gApDe8eoOe8Ep
	GOQVL2JPLawo+0nSPotyMtENKNToOc9sYO4aGZno4BCAmNOPOVXpRjgnjBz/lJxE3WpfXywNGyU+b
	CUDHjSASabK4kRLUfuQhOpI/yJ88MG7pw3qwKijeD9vjZqWxq/Vh9LVUL91xEwwiNVaivUgSxpHDP
	/DZsXoqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhCc-000000025Qo-2qcA;
	Sun, 16 Feb 2025 16:09:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhBB-000000025Fv-1raS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 16:07:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 133C75C5530;
	Sun, 16 Feb 2025 16:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BB6C4CEDD;
	Sun, 16 Feb 2025 16:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739722056;
	bh=43hB0V5xGtsW08Wu4x/+54J0/oLkkgqApWLJEGgtdtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LlM6MgGh//jb+HqFo2mNjO2abwlassCQW6QN1S0IhXrx9UWPKTL5lXIMRVICZOzHG
	 +aYnJH6ZYStPAMiRJq9BoaA6fzzHLdcCGBjnpM5huUWXgAncyX5dPH9jTWi91Cv77M
	 +3WB5YZYxAlEHNJp704sGJRxxnh02eUtAbNDOw2MfHkvNQ059CHOsRU99vDxYhKXt7
	 vit/P0fUJ3Q1Fdij3Rpolx/Bjd5n5gQEy+dOsP9hDJgFvZpHViTnJNBLuCntrxlzRm
	 45+oqW8LoqDcKA8k4nG/gqp6QP/yPQubFrpCeejequuS5/T2OBUF34Br4sw9waNrgt
	 jsqu0/NtZNKhw==
Date: Sun, 16 Feb 2025 16:07:29 +0000
From: Simon Horman <horms@kernel.org>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: Re: [PATCH 09/12] wifi: wilc1000: disable firmware power save if
 bluetooth is in use
Message-ID: <20250216160729.GG1615191@kernel.org>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
 <20250212-wilc3000_bt-v1-9-9609b784874e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212-wilc3000_bt-v1-9-9609b784874e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_080737_567419_B4EA559B 
X-CRM114-Status: GOOD (  27.52  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Eric Dumazet <edumazet@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Feb 12, 2025 at 04:46:28PM +0100, Alexis Lothoré wrote:
> If the wlan interface exposed by wilc driver has power save enabled
> (either explicitly with iw dev wlan set power_save on, or because
> kernel is built with CONFIG_CFG80211_DEFAULT_PS), it will send a power
> management command to the wlan firmware when corresponding interface is
> brought up. The bluetooth part, if used, is supposed to work
> independently from the WLAN CPU. Unfortunately, this power save
> management, if applied by the WLAN side, disrupts bluetooth operations
> (the bluetooth CPU does not answer any command anymore on the UART
> interface)
> 
> Make sure that the bluetooth part can work independently by disabling
> power save in wlan firmware when bluetooth is in use.
> 
> Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
> ---
>  drivers/net/wireless/microchip/wilc1000/bt.c       | 29 +++++++++++++++++++---
>  drivers/net/wireless/microchip/wilc1000/cfg80211.c |  5 +++-
>  drivers/net/wireless/microchip/wilc1000/netdev.h   |  3 +++
>  3 files changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/microchip/wilc1000/bt.c b/drivers/net/wireless/microchip/wilc1000/bt.c
> index b0f68a5479a5bd6f70e2390a35512037dc6c332b..f0eb5fb506eddf0f6f4f3f0b182eaa650c1c7a87 100644
> --- a/drivers/net/wireless/microchip/wilc1000/bt.c
> +++ b/drivers/net/wireless/microchip/wilc1000/bt.c
> @@ -7,6 +7,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <net/wilc.h>
> +#include "cfg80211.h"
>  #include "netdev.h"
>  #include "wlan_if.h"
>  #include "wlan.h"
> @@ -261,22 +262,36 @@ static int wilc_bt_start(struct wilc *wilc)
>  int wilc_bt_init(void *wilc_wl_priv)
>  {
>  	struct wilc *wilc = (struct wilc *)wilc_wl_priv;
> +	struct wilc_vif *vif;
>  	int ret;
>  
> +	wilc->bt_enabled = true;
> +
>  	if (!wilc->hif_func->hif_is_init(wilc)) {
>  		dev_info(wilc->dev, "Initializing bus before starting BT");
>  		acquire_bus(wilc, WILC_BUS_ACQUIRE_ONLY);
>  		ret = wilc->hif_func->hif_init(wilc, false);
>  		release_bus(wilc, WILC_BUS_RELEASE_ONLY);
> -		if (ret)
> +		if (ret) {
> +			wilc->bt_enabled = false;
>  			return ret;
> +		}
>  	}
>  
> +	/* Power save feature managed by WLAN firmware may disrupt
> +	 * operations from the bluetooth CPU, so disable it while bluetooth
> +	 * is in use (if enabled, it will be enabled back when bluetooth is
> +	 * not used anymore)
> +	 */
> +	vif = wilc_get_wl_to_vif(wilc);
> +	if (wilc->power_save_mode && wilc_set_power_mgmt(vif, false))
> +		goto hif_deinit;

Hi Alexis,

Jumping to hif_deinit will result in the function returning ret.
But ret may not not be initialised until a few lines below.

Flagged by Smatch.

> +
>  	mutex_lock(&wilc->radio_fw_start);
>  	ret = wilc_bt_power_up(wilc);
>  	if (ret) {
>  		dev_err(wilc->dev, "Error powering up bluetooth chip\n");
> -		goto hif_deinit;
> +		goto reenable_power_save;
>  	}
>  	ret = wilc_bt_firmware_download(wilc);
>  	if (ret) {
> @@ -293,10 +308,14 @@ int wilc_bt_init(void *wilc_wl_priv)
>  
>  power_down:
>  	wilc_bt_power_down(wilc);
> -hif_deinit:
> +reenable_power_save:
> +	if (wilc->power_save_mode_request)
> +		wilc_set_power_mgmt(vif, true);
>  	mutex_unlock(&wilc->radio_fw_start);
> +hif_deinit:
>  	if (!wilc->initialized)
>  		wilc->hif_func->hif_deinit(wilc);
> +	wilc->bt_enabled = false;
>  	return ret;
>  }
>  EXPORT_SYMBOL(wilc_bt_init);

...

