Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA8CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 18:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrrsP9OG2U9lID1ZHHoUeFSJyWq6cn3Ni7Hbvjxkttw=; b=gCr+rSclyllujkJ46dwEhUoiSW
	++VVAKM6WYFCJvx9N4khaT6yFoAHdOKKYCPF1kfI5ywtwz9EJK71GN85ncWjz46/+I3ZvtoFqZb48
	mrhOpcBTYe4DoRsxLTaFrIUJiHSpetSVdO1MkcZdouzYxtnnjzMfwutPQnSdt+70/i27FGoMQv42Q
	YKeCWNt/ek6Meb4R+JHJlV6D9aL8rFTObomL9qppFg6sPcREpfkf9rD1hyL0iR1lY1nZwtpyI40/U
	B8pzmstPHEbldPQFPLCXMmpX+e+08M591mBAWvUGdIRee3Kvon5BXS1RFr5DeWqes6otX3JUk/py1
	stA+iz/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecy2-000000001z8-1eN1;
	Tue, 30 Jun 2026 18:13:54 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecy0-000000001yL-0wBX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 18:13:53 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-495ecb0de70so1033868b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 11:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782843231; cv=none;
        d=google.com; s=arc-20260327;
        b=WN5r27SsGSvtZ4uiWDTZ3BQhrzCXnayGxcX3NV1hErzgJ+jeeG2rAy522/yLB+ZLjx
         mUr/Avxfzi2I75iSvBzxlwGs81LMcS2ILIdzqd5UoPjxt6Vv1jo96ULJNH/IUKkoBsSl
         Rz+3kgZsKSBx2Y38LToKpo3teLXyAO3wrzZT3uD8KBd/d5QdvYB51GiLwhNLapdtyUFr
         +3gTKfzoaKG0XIEEDfRkJ7bnp+mOIih0S/XoI/nlQVwN06mfOMT4DGtv/B4GHlIE0yZm
         bRDIiXCtbqJMERIXuh/mFF6OrhGSNJ7qaEZuam406MUVSOwyq0q3tW4WVH9+LwyIRwO/
         VCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OrrsP9OG2U9lID1ZHHoUeFSJyWq6cn3Ni7Hbvjxkttw=;
        fh=jMkGYsG/dChuh8G+DpYx+KOJsCHnT+bt02/FaG4cPa4=;
        b=gaXqUyvNAHforx1wn7SEb/5WO3VZfVkZICMYYFS4Iksn7hgcXGZOrjbgEQiNC6+A/S
         fER8Jk3uCJdCJgeNasWs8/TYOmuLILlusPMNjv4nNnPO0zY7WefBDN5xP8SC8LVIDCWY
         31Z6lyYH7DCc5NqnysA/Ahy+EwhK5zCL/b8TBJIGQXjPgdMo/PFMYvvF2S3gyU5aqvWp
         AAruZJkO9syEGnVMFZyUsz7bkSgGayJrHoWYvlYCkvliLXYN+TfBMc6zU2jCJdcEos89
         oz0ZMKVPAn8yYiT4a6KlVf4SDwYP860yMj9T2e+AaMvMy4d18J0iijaDRH7p66bf3O+h
         RIWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782843231; x=1783448031; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrrsP9OG2U9lID1ZHHoUeFSJyWq6cn3Ni7Hbvjxkttw=;
        b=UspCb5fgGcaC8AHUXecWAGs3d/tuhQ94bI6Z+hraBUtVAbGWPP3WlbhajqaM6htORz
         4I3Va+g0IktANgzGeamXB99MkvsaupihQLIn2/REWPzddGF84cg0e3y4hVscJdF9JPp0
         ONoXugi40gYd2h2RV/1hcHJqye1vep+h/EOHxVKmRC2jAaI/t72mW8r1Gd5/MXWl0dqb
         BaZ80AZO2pnUpkDGpIHk7GW1Z+vD/uhd3FRM6YER+HeshVEKXfOIKx1XUQOD8gimqjdL
         UPR6lE0zuGquea1CRICNTpOFYUjLIsnoT/B7YJKw1h1z6bWxRaEEfRvDSctiHP7XwFaN
         KkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782843231; x=1783448031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OrrsP9OG2U9lID1ZHHoUeFSJyWq6cn3Ni7Hbvjxkttw=;
        b=IrpjjKahIWluWXbHJA9XQbKMHT6l6iipYeOiok35hrrpIFHCyXZzmkrEyzX6qUI5pr
         8MH06RlA4u+oD7oPKpfq4kTR0avSTz7OiB8brTAZehq19TlhEtc2oiiEeT0G1pTFyiSC
         3kT9IpYJs4kvhOiqXVDtlKMEfwYwnE0LE/+6B4YuGIV8Vn8VOp4RI9RHnRcjXVqBFVff
         zcFA3mruRm/GtOHqFo0O0A7YgoIyCUVbI2VkHpTKaBb+GhHDaXMbMS5qYYImHA4tAu0O
         voBeAkZoBEn5ouTQsPGFN3tg8ArKWI6wh7Dvd9HOryxHtiB5E+Z2jNccvHyJzQxAaZXS
         BI/w==
X-Forwarded-Encrypted: i=1; AFNElJ/Ff8Gq63l+0dOeu0Lvqduyod/IDzKndqRRh+ZQFhPUu659OPiINrNuuaeS/V+baEIjcEF4BEcrnNtBHapdcpiM@lists.infradead.org
X-Gm-Message-State: AOJu0YwsSaSO8S4JoC3KNrdFDHAf0vd0TztIcX+Ql/UgDK233IioqZI4
	ltlZBEIlMX5grKnVq3RBytJTUYdFiZlGPNd3qcjZH4puL97VJvF/r8NYy8ZDzO+r6D4nYgqy0YV
	xZZTInESuhrP2b1pDSPc0c69CjUQhdGLQx5NfnVY=
X-Gm-Gg: AfdE7clLAwby5i1BZ65/vaQXwokDTKibugXOvHYA3gayrAmLnYBZMr/FxixWy8erfZC
	abMX3FUXCGktY1wPWIx6jVdtLYL/eoZbaP6PxwufCCDlrJPC6oilyTHnY89T/0ZKWBa7cnmxsxJ
	cVV0LdzuClAaUkyCwKlvrW5KjQDWmMTeqPQE1sHpNEC/pH543Qbb6ZkGcfcXkI+dvkm93XJ/0Wb
	jg4Z3KGZlYAy9pXZ3Bb6lky8iCRWWQh4plHme+NXZXv5Mi1RVBQi7Lvd0Yqp3u9P4Lx6FOGZOJf
	SF4i1+yonEOMDvuxj6ty0p5JJ/Q7/4Bz6i/GlidubHbdSuQIZwqTp7gNk63+yS1SmpE=
X-Received: by 2002:a05:6808:1308:b0:48b:626c:77b0 with SMTP id
 5614622812f47-495eaef2c2emr3952635b6e.26.1782843230620; Tue, 30 Jun 2026
 11:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-btmtk-ryzen-remote-wakeup-v1-1-1d2f1cee6d22@rong.moe>
In-Reply-To: <20260629-btmtk-ryzen-remote-wakeup-v1-1-1d2f1cee6d22@rong.moe>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 30 Jun 2026 14:13:39 -0400
X-Gm-Features: AVVi8Cf_dKRwkrq_lWyyBPSPON224TZvf1AOfBhLImbCwdJjDU6urnQUGZKhu3Y
Message-ID: <CABBYNZLhqQF-V8sJORwMW2C_4FxFY+pkAK=cSDg4aeWJYfiJrA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
To: Rong Zhang <i@rong.moe>
Cc: Marcel Holtmann <marcel@holtmann.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>, 
	=?UTF-8?B?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>, 
	=?UTF-8?B?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_111352_280994_847F225C 
X-CRM114-Status: GOOD (  41.04  )
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

Hi Rong,

On Mon, Jun 29, 2026 at 11:28=E2=80=AFAM Rong Zhang <i@rong.moe> wrote:
>
> It is reported that a remote wakeup could cause MT7922/MT7925's btusb
> interface completely unresponsive. Resetting the xHCI root hub doesn't
> help at all, and recovering from such a state needs a power cycle.
>
> All reports seen to be relevant to Ryzen-based laptops. These NICs are
> usually used as OEM components thanks to some sort of reference designs.
>
> Their popularity on other platforms is unclear. While there is still a
> chance that the quirk may exist on other platforms, be cautious and only
> apply the quirk on AMD platforms for the time being.
>
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
>
> Specifically, the interface may still take the advantage of remote
> wakeup in order to wake up the system from sleep if userspace has
> enabled it as a wakeup source.
>
> Fixes: e31d761628ad ("Bluetooth: btmtk: Disable remote wakeup for MT7922/=
MT7925")
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/bluetooth/btmtk.c | 10 ---------
>  drivers/bluetooth/btusb.c | 57 +++++++++++++++++++++++++++++++++++++++++=
++----
>  2 files changed, 53 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 02a96342e964..4614434dd57b 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1381,16 +1381,6 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>                 break;
>         case 0x7922:
>         case 0x7925:
> -               /*
> -                * A remote wakeup could cause the device completely unre=
sponsive, and
> -                * recovering from such a state needs a power cycle.
> -                *
> -                * Since the remote wakeup capability is super broken, ju=
st disable it
> -                * to get rid of the troubles. The device can still be au=
tosuspended
> -                * when the bluetooth interface is closed.
> -                */
> -               device_set_wakeup_capable(&btmtk_data->udev->dev, false);
> -               fallthrough;
>         case 0x7961:
>         case 0x7902:
>         case 0x6639:
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 08c0a99a62c5..023ae782f41a 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -6,6 +6,7 @@
>   *  Copyright (C) 2005-2008  Marcel Holtmann <marcel@holtmann.org>
>   */
>
> +#include <linux/cpufeature.h>
>  #include <linux/dmi.h>
>  #include <linux/module.h>
>  #include <linux/usb.h>
> @@ -957,6 +958,7 @@ struct qca_dump_info {
>  #define BTUSB_USE_ALT3_FOR_WBS 15
>  #define BTUSB_ALT6_CONTINUOUS_TX       16
>  #define BTUSB_HW_SSR_ACTIVE    17
> +#define BTUSB_WAKEUP_BROKEN    18
>
>  struct btusb_data {
>         struct hci_dev       *hdev;
> @@ -2936,10 +2938,20 @@ static int btusb_send_frame_mtk(struct hci_dev *h=
dev, struct sk_buff *skb)
>         }
>  }
>
> +static inline bool platform_is_ryzen(void)
> +{
> +#ifdef CONFIG_X86
> +       return boot_cpu_has(X86_FEATURE_ZEN);
> +#else
> +       return false;
> +#endif
> +}
> +
>  static int btusb_mtk_setup(struct hci_dev *hdev)
>  {
>         struct btusb_data *data =3D hci_get_drvdata(hdev);
>         struct btmtk_data *btmtk_data =3D hci_get_priv(hdev);
> +       int err;
>
>         /* MediaTek WMT vendor cmd requiring below USB resources to
>          * complete the handshake.
> @@ -2956,7 +2968,29 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
>                 btusb_mtk_claim_iso_intf(data);
>         }
>
> -       return btmtk_usb_setup(hdev);
> +       err =3D btmtk_usb_setup(hdev);
> +       if (err)
> +               return err;
> +
> +       switch (btmtk_data->dev_id) {
> +       case 0x7922:
> +       case 0x7925:
> +               /*
> +                * All reports seen to be relevant to Ryzen-based laptops=
. These
> +                * NICs are usually used as OEM components thanks to some=
 sort
> +                * of reference designs.
> +                *
> +                * Their popularity on other platforms is unclear. While =
there
> +                * is still a chance that the quirk may exist on other
> +                * platforms, be cautious and only apply the quirk on AMD
> +                * platforms for the time being.
> +                */

Is this going to be a reliable way to detect if wakeup is broken or
not? Since USB is a bus capable of hotplug, this check would block not
only internal/built-in controllers with the above IDs but also those
plugged via external ports if the CPU happens to be of the ZEN
familly.

> +               if (platform_is_ryzen())
> +                       set_bit(BTUSB_WAKEUP_BROKEN, &data->flags);
> +               break;
> +       }
> +
> +       return 0;
>  }
>
>  static int btusb_mtk_shutdown(struct hci_dev *hdev)
> @@ -4532,11 +4566,26 @@ static int btusb_suspend(struct usb_interface *in=
tf, pm_message_t message)
>
>         BT_DBG("intf %p", intf);
>
> -       /* Don't auto-suspend if there are connections or discovery in
> -        * progress; external suspend calls shall never fail.
> +       /*
> +        * It is reported that remote wakeup events could sometimes cause=
 some
> +        * adapters completely unresponsive. Resetting the xHCI root hub =
doesn't
> +        * help at all, and recovering from such a state needs a power cy=
cle.
> +        * Since disabling remote wakeup simply causes the USB core to ga=
te
> +        * runtime autosuspend as well due to needs_remote_wakeup =3D=3D =
1, let's do
> +        * this ourselves to make our life easier. The interface can be s=
afely
> +        * autosuspended as long as remote wakeup is disabled, i.e., afte=
r
> +        * closing the HCI device.
> +        *
> +        * Don't auto-suspend if there are connections or discovery in pr=
ogress.
> +        *
> +        * External suspend calls shall never fail. Specifically, a devic=
e with
> +        * broken remote wakeup may still take the advantage of remote wa=
keup in
> +        * order to wake up the system from sleep if userspace has enable=
d it as
> +        * a wakeup source.
>          */
>         if (PMSG_IS_AUTO(message) &&
> -           (hci_conn_count(data->hdev) || hci_discovery_active(data->hde=
v)))
> +           ((test_bit(BTUSB_WAKEUP_BROKEN, &data->flags) && data->intf->=
needs_remote_wakeup) ||
> +            hci_conn_count(data->hdev) || hci_discovery_active(data->hde=
v)))
>                 return -EBUSY;
>
>         if (data->suspend_count++)
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 230ba8c9-btmtk-ryzen-remote-wakeup-055a407682ef
>
> Thanks,
> Rong
>


--=20
Luiz Augusto von Dentz

