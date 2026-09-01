Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96AAC624D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iuish5hluWdY71WX+l22NL4cSYu/RU1lYznBGbg7EhU=; b=Rj5YQ8f6u3PIGdtT7rsK/HyM88
	+W2V8WpxO9DWXQ1spsWYGnGG/hEXzHRzvU6mW/jHIsnnZmhE7tuKS+0hEeJa4YWQv6wK9Hm8SRxbP
	hWe8qtoAG7z5hjEVWuUwOnNygzaZq8Mmi9mFfhUeLjHoz3TKhduW1tD1GdgcclASNAScQ8Ve6Jmbv
	uXhsU+5S4uUUfnLAnpuyJq7iIgkNtBsckFEomgmG7x7xx/GJxMaiiABXCB0heK/slsXji0Xyu5REb
	TLLrbcCJ7Jhccmh2Y4kwT2cf17D9ozOxYTEThbJy6Hfskemhqz5ow/TJeuYhqo511V/fCnNgPrk43
	AZN+NJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RZP-0000000ChDL-32iO;
	Tue, 01 Sep 2026 16:42:47 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RZM-0000000ChCX-3U7j;
	Tue, 01 Sep 2026 16:42:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788280957; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XDWm3uwvnZHLBvsndM4gHUkLPU6ZiY9hjH5bB1WF0FWMUaqLsICxnjMqgMOE691P9+RmL3wFioHiyfOKRMehftq0zeV1mu+yYuNcqm8RTjJ7LUUomczRxet3FxKutYr+sDXZKIrx99bTBdiG3qthYKNBaeWghCF+RhoIxu3SOLU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788280957; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iuish5hluWdY71WX+l22NL4cSYu/RU1lYznBGbg7EhU=; 
	b=Ab2lSfDdVhxEObA8hbG+3eETu3FpRC5vRVCMfrkvxWtqlKwc313Vc7MAcNntOTba6F/qPViM4vN4oRawmo1nWxi4KpDBOmlkd0MFoeUFH5XpJJYq+xORIyuuxuigK8T1oY1vpfIpzTGXN+Fk1lHcLQk1VQZDztjB+5mf/K3+OF4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788280957;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=iuish5hluWdY71WX+l22NL4cSYu/RU1lYznBGbg7EhU=;
	b=cWWhXRp3TIwhIyBIrh/SfLhTPj1DRrPZXLqFZbE6Hsr2SrccUSpuIkTkaZ9hWkif
	JImILrx0Qkce1JrJxNtq7AlcqA904ov5x7R74ZsmDWR9moabEKW+dJumPv5nF2gtiMC
	nOl8NxAlPqOVqXiQu2YWpN0GoWYfisNWKhjHHA4plX358hG1cijWN0ZlmiU3yPm54oJ
	VHdPGC15OeOGQaZMefFzTwueLzxM7qPRj3b/hJEPV86JApEwvidm/aT7J/6JrlPQSEi
	BS5Nic6MSlgaNHdnuo3BbGEZhQ7mWW7IObxGL2hE0eXbDb7zfUHg6myGYuce4V5DZR5
	ZiJEtifaog==
Received: by mx.zohomail.com with SMTPS id 1788280954716290.2395123693982;
	Tue, 1 Sep 2026 09:42:34 -0700 (PDT)
Message-ID: <8783d4c77f112c55c9f9678b5a8e0a88d49c1141.camel@rong.moe>
Subject: Re: [PATCH v2] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
From: Rong Zhang <i@rong.moe>
To: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz
	 <luiz.dentz@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Chris Lu
 =?Big5?Q?=28=B3=B0=B8X=AAl=29?=
	 <Chris.Lu@mediatek.com>, Will-CY Lee =?Big5?Q?=28=A7=F5=ACF=BFo=29?=
	 <Will-CY.Lee@mediatek.com>, SS Wu =?Big5?Q?=28=A7=C5=BE=CB=AAY=29?=
	 <ss.wu@mediatek.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
In-Reply-To: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe>
References: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 00:37:25 +0800
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_094244_927950_70F86ED3 
X-CRM114-Status: GOOD (  46.09  )
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

Hi Luiz,

Gentle ping.

On Wed, 2026-07-01 at 23:43 +0800, Rong Zhang wrote:
> It is reported that a remote wakeup could cause MT7922/MT7925's btusb
> interface completely unresponsive. Resetting the xHCI root hub doesn't
> help at all, and recovering from such a state needs a power cycle.
>=20
> All reports seen to be relevant to Ryzen-based laptops. These NICs are
> usually used as OEM components thanks to some sort of reference designs.
> Their popularity on other platforms is unclear. While there is still a
> chance that the quirk may exist on other platforms, be cautious and only
> apply the quirk to direct children of Ryzen platforms's root hubs for
> the time being. In most cases the root hub is on the SoC or PCH, which
> needs the quirk. Unfortunately, this can't distinguish root hubs on PCIe
> add-in cards. Such roughness should be acceptable, as PCIe USB
> controller add-in cards are less commonly used nowadays. On the other
> hand, applying the quirk doesn't hurt any functionalities either, as the
> device can still be used as a wakeup source if desired. Theoretically,
> we could retrieve the root hub's PCI vendor ID with some hierarchy
> magic, but that's too intrusive...
>=20
> Meanwhile, though device_set_wakeup_capable(false) is the correct fix
> for other NICs with fake remote wakeup capabilities, doing so for
> MT7922/MT7925 effectively prevents it from being used as wakeup
> sources as per userspace requests. Hence, return -EBUSY on runtime
> suspend to prevent the interface from being autosuspended while it's
> still opened, which has the same effect as
> device_set_wakeup_capable(false), since disabling remote wakeup simply
> causes the USB core to gate runtime autosuspend as well due to
> needs_remote_wakeup =3D=3D 1. The interface can be safely autosuspended a=
s
> long as remote wakeup is disabled, i.e., after closing the HCI device.
>=20
> Specifically, the interface may still take the advantage of remote
> wakeup in order to wake up the system from sleep if userspace has
> enabled it as a wakeup source.
>=20
> Fixes: e31d761628ad ("Bluetooth: btmtk: Disable remote wakeup for MT7922/=
MT7925")
> Signed-off-by: Rong Zhang <i@rong.moe>

Could you kindly take a look at the patch?

Chris Lu from MediaTek has relied with a "LGTM" to the patch, and there
is already a Tested-by from Rafael Passos. Additionally, based on
Rafael's debugging observations, the issue does exist on AMD PCHs, so
matching X86_FEATURE_ZEN is appropriate.

Thanks,
Rong

> ---
> Changes in v2:
> - Only apply the quirk to to direct children of Ryzen platforms's root
>   hubs
>   - Theoretically, we could retrieve the root hub's PCI vendor ID with
>     some hierarchy magic to further limit the range down to only root
>     hubs on the SoC or PCH, but that's too intrusive -- the hierarchy
>     magic really made me nervous once I saw what I have wrote, so I gave
>     it up
> - Link to v1: https://patch.msgid.link/20260629-btmtk-ryzen-remote-wakeup=
-v1-1-1d2f1cee6d22@rong.moe
> ---
>  drivers/bluetooth/btmtk.c | 10 -------
>  drivers/bluetooth/btusb.c | 73 +++++++++++++++++++++++++++++++++++++++++=
+++---
>  2 files changed, 69 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 02a96342e964..4614434dd57b 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1381,16 +1381,6 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>  		break;
>  	case 0x7922:
>  	case 0x7925:
> -		/*
> -		 * A remote wakeup could cause the device completely unresponsive, and
> -		 * recovering from such a state needs a power cycle.
> -		 *
> -		 * Since the remote wakeup capability is super broken, just disable it
> -		 * to get rid of the troubles. The device can still be autosuspended
> -		 * when the bluetooth interface is closed.
> -		 */
> -		device_set_wakeup_capable(&btmtk_data->udev->dev, false);
> -		fallthrough;
>  	case 0x7961:
>  	case 0x7902:
>  	case 0x6639:
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 08c0a99a62c5..eef6e3b43bf9 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -6,6 +6,7 @@
>   *  Copyright (C) 2005-2008  Marcel Holtmann <marcel@holtmann.org>
>   */
> =20
> +#include <linux/cpufeature.h>
>  #include <linux/dmi.h>
>  #include <linux/module.h>
>  #include <linux/usb.h>
> @@ -957,6 +958,7 @@ struct qca_dump_info {
>  #define BTUSB_USE_ALT3_FOR_WBS	15
>  #define BTUSB_ALT6_CONTINUOUS_TX	16
>  #define BTUSB_HW_SSR_ACTIVE	17
> +#define BTUSB_WAKEUP_BROKEN	18
> =20
>  struct btusb_data {
>  	struct hci_dev       *hdev;
> @@ -2936,10 +2938,25 @@ static int btusb_send_frame_mtk(struct hci_dev *h=
dev, struct sk_buff *skb)
>  	}
>  }
> =20
> +static inline bool platform_is_ryzen(void)
> +{
> +#ifdef CONFIG_X86
> +	return boot_cpu_has(X86_FEATURE_ZEN);
> +#else
> +	return false;
> +#endif
> +}
> +
> +static inline bool is_direct_child_of_root_hub(struct usb_device *udev)
> +{
> +	return udev->parent =3D=3D udev->bus->root_hub;
> +}
> +
>  static int btusb_mtk_setup(struct hci_dev *hdev)
>  {
>  	struct btusb_data *data =3D hci_get_drvdata(hdev);
>  	struct btmtk_data *btmtk_data =3D hci_get_priv(hdev);
> +	int err;
> =20
>  	/* MediaTek WMT vendor cmd requiring below USB resources to
>  	 * complete the handshake.
> @@ -2956,7 +2973,40 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
>  		btusb_mtk_claim_iso_intf(data);
>  	}
> =20
> -	return btmtk_usb_setup(hdev);
> +	err =3D btmtk_usb_setup(hdev);
> +	if (err)
> +		return err;
> +
> +	switch (btmtk_data->dev_id) {
> +	case 0x7922:
> +	case 0x7925:
> +		/*
> +		 * All reports seen to be relevant to Ryzen-based laptops. These
> +		 * NICs are usually used as OEM components thanks to some sort
> +		 * of reference designs.
> +		 *
> +		 * Their popularity on other platforms is unclear. While there
> +		 * is still a chance that the quirk may exist on other
> +		 * platforms, be cautious and only apply the quirk to direct
> +		 * children of Ryzen platforms's root hubs for the time being.
> +		 *
> +		 * In most cases the root hub is on the SoC or PCH, which needs
> +		 * the quirk. Unfortunately, this can't distinguish root hubs on
> +		 * PCIe add-in cards. Such roughness should be acceptable, as
> +		 * PCIe USB controller add-in cards are less commonly used
> +		 * nowadays. On the other hand, applying the quirk doesn't hurt
> +		 * any functionalities either, as the device can still be used
> +		 * as a wakeup source if desired.
> +		 *
> +		 * Theoretically, we could retrieve the root hub's PCI vendor ID
> +		 * with some hierarchy magic, but that's too intrusive...
> +		 */
> +		if (platform_is_ryzen() && is_direct_child_of_root_hub(data->udev))
> +			set_bit(BTUSB_WAKEUP_BROKEN, &data->flags);
> +		break;
> +	}
> +
> +	return 0;
>  }
> =20
>  static int btusb_mtk_shutdown(struct hci_dev *hdev)
> @@ -4532,11 +4582,26 @@ static int btusb_suspend(struct usb_interface *in=
tf, pm_message_t message)
> =20
>  	BT_DBG("intf %p", intf);
> =20
> -	/* Don't auto-suspend if there are connections or discovery in
> -	 * progress; external suspend calls shall never fail.
> +	/*
> +	 * It is reported that remote wakeup events could sometimes cause some
> +	 * adapters completely unresponsive. Resetting the xHCI root hub doesn'=
t
> +	 * help at all, and recovering from such a state needs a power cycle.
> +	 * Since disabling remote wakeup simply causes the USB core to gate
> +	 * runtime autosuspend as well due to needs_remote_wakeup =3D=3D 1, let=
's do
> +	 * this ourselves to make our life easier. The interface can be safely
> +	 * autosuspended as long as remote wakeup is disabled, i.e., after
> +	 * closing the HCI device.
> +	 *
> +	 * Don't auto-suspend if there are connections or discovery in progress=
.
> +	 *
> +	 * External suspend calls shall never fail. Specifically, a device with
> +	 * broken remote wakeup may still take the advantage of remote wakeup i=
n
> +	 * order to wake up the system from sleep if userspace has enabled it a=
s
> +	 * a wakeup source.
>  	 */
>  	if (PMSG_IS_AUTO(message) &&
> -	    (hci_conn_count(data->hdev) || hci_discovery_active(data->hdev)))
> +	    ((test_bit(BTUSB_WAKEUP_BROKEN, &data->flags) && data->intf->needs_=
remote_wakeup) ||
> +	     hci_conn_count(data->hdev) || hci_discovery_active(data->hdev)))
>  		return -EBUSY;
> =20
>  	if (data->suspend_count++)
>=20
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 230ba8c9-btmtk-ryzen-remote-wakeup-055a407682ef
>=20
> Thanks,
> Rong

