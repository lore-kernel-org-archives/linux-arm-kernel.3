Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8151CF9D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 14:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49AG2x6pEGoNnPJicOOKoScg9J+gRSWBSIBGOGB3T+I=; b=xYp4t0+YRoSndGMeSrfJJhjK3F
	Wf1duDMXfEFcMfjLj6pBzod9NaTqXpdczhusbpZCn1boTdhyDgyu65FkE6ZYHhNDwiQFHu2Gzn4Do
	++qWr80rYX/zsDAbvLlJni3jiOtSNZhPpwiPtFgAdQZIeNnj5As0My9W+0wzhWEyVYosr2iURedgr
	QjuoqvTq/p3nYPItqr6wYxsi02gvuPrJTkqXdkkuIillbX6Jl03lT9yxQ+Q+SXY5Ok+lD54YgeuAC
	PBgSTLvtJd2yGt4l4q1n7wTaHo1YgLJvqbxH6Ibo56oFHzbNXf8tQlk5Ys5XwtSpp5/sx4U7q4qdD
	8xLT6gsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCeJQ-0000000HPo3-01rf;
	Tue, 14 Apr 2026 14:00:20 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCeJN-0000000HPnb-2SAB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 14:00:18 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-46808125c65so1933874b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 07:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776175216; cv=none;
        d=google.com; s=arc-20240605;
        b=D2gQAECiihj2+4QKnrGjhYAlFDPAuNRxWwNxENGAcS9AXtlqkX/wwXbueBRwGTRMYR
         66ZE/847ycoMVYGonjXr49n+/py0C2N1gklaJJftZAjw4rCRsTLFfeSVDttCiiHGencA
         rK9XTlSCJryhobhpco52UFDSv3O+d57/ipqktpwDxcjsQ2NYL8IJCpRJoDMpQchuyTdO
         iLaZnlh1flh9qrJaTJtTDmJhDoJoyAOheOxIwzGZ6WZOeFUJyN+1057HUZwB8HPjl4Sb
         48cO/JhHo+LOwKr9xViSWs7oKzCzeUdinXalv8NzvX5tL4QlbagqKhOB6Yq2/cNrwT/Y
         IjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=49AG2x6pEGoNnPJicOOKoScg9J+gRSWBSIBGOGB3T+I=;
        fh=ANDGIpQ2eFk0nDSA4Bkj5ZxfsJ8UjAzbCGLMrjxR9nw=;
        b=IxXbWIgCBthNI7D+l5OrxLc8bxCcTiymoablISKIBjY07TbQdObPPJ8p850yK9ykHf
         L18DwFYnmxpYMPXpHAHqBWEg6sAMgF3OSUnQxK3prUqAscelbey4+bA7HG71Ky2o6HPy
         sTiPwb9++wAHNsDHCN7gJa5OHEw2W3KYTVtaP/51VxJ6DPfBvexVmeSVS9ySLMb3TylV
         NUQZVeiLKiEU4BV5J79oceH+CgGjI6nPtvRxG3VrB6vBGypX+O8511D2XwkdZgzgHmxu
         3r13W6i0vvOV0a3kbeUhw3DlOBOq3LatggCS0TogtI6SFQxSa4k0LzWK+fmyPrjjuaB8
         HTTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776175216; x=1776780016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49AG2x6pEGoNnPJicOOKoScg9J+gRSWBSIBGOGB3T+I=;
        b=D0W8PqeRg/MuDKk8qJLdExA35fbuK+t6E7f7/xcu9KulZyOnxdwkWHMFtN35uzVKqp
         nkFsmC9activR4JqvAdl0trP45y0LNwvXT4FdYwCGp8r+uMDulLNy2d65Z3zIkVqRu86
         vE1xzpphbfbzzK7H6SVLF+gth38rFayIVZUIscTv4/KrJH4n2lbGjgHfxu0e50NKfQ9L
         XRzoGy152dhyG6sHUu+6kJMMbN+uFUfNjxMDhI0fW7YTQEQuZlXzm59lRdD4mRLBy4nA
         3RjnyYa5+JeCFGDiD027h32aEQ/UT9rFujP6LcJnTkMTYXK7QRehvi4I0GrjzO9Uts5y
         ryUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776175216; x=1776780016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=49AG2x6pEGoNnPJicOOKoScg9J+gRSWBSIBGOGB3T+I=;
        b=YZ28OBjwfDli3Lmd+WiKuvVGqyTM1dcK0NNCWxUY00CZ+FsS8+6PIFGl05VR8vChtr
         ZkSa3R+jyxXoDy0a9d5Qki/EckDbJt9nyr4+d86TBUKeiBY/jcqzXbSKDjq9gkGxXO/s
         kBgfJPQcNq6bgqiE+XkH0F/jkGzF0E8TeNRBqiR+utkdndeexKV0OKpSAS2V9MKkrpsO
         JUaw031CknqPIexUVoFSpCXJlXLbYeknKyqYdtsumkzP8KdBUP8bpR4lsp4kH5GtsZWO
         2S4t+FJiwV6d83CFoCk/yTtq9qdNUr3BSLIZHNCDE38A+Wf1c1AcI2/8fxyvQCSTCeg9
         koyA==
X-Forwarded-Encrypted: i=1; AFNElJ8aagXqvhHUy29uq+OVPlVyn2IipzQ9TliMOsu+r1JBI+N0vRVty65uDzyub3vCr/uAV5foNSdjG+uWSjX8jnqp@lists.infradead.org
X-Gm-Message-State: AOJu0YwfmWSzL+LK8iuL1U1DIxdXEfvKCD4Z/3Rhmy5KnD8bpT83+ICQ
	n50BFTTcKU+dWpiqxk6GBK0he63A3efsaBDqhpNpVs4nzFgY8p5jn7x2HURTvQGjE5OYH1Qghpe
	Ez5Zk2Z4X6fZ4O201vNWJdI3W9Nf4XkY=
X-Gm-Gg: AeBDieu5MoFAPXz7aggsw9KYGtjNeXVn74YH0n3Hm8EUzzQ18n3bKfu2Js4fdWhZ4dc
	JdkcvNfqwTNFL6+f809q5At9M/uNLrKGhmiwE2TTaySTlldCxAvgwMSoenK2DEF/ZaEazIlERm1
	GntGYUeTIPX7csex9zPxyTopRJDxFAP+bAxL+roslC/gy/PY7vL2NPnjkcIGtja/m3LcwiKYoir
	Er6PbEXxhNRsOJC9GevkrdO0stv6SOQpl/IoZie7j4RYROHLZZDocWMBOXYYSv1zwzu4WbbGMLz
	97JvJqqidbmujQofylOJUrNfEQs9VAlvlnCelW+hu35ZxXeXCRZDb9AXnd8Dq72hz6gTbZxs5yV
	zo0+I
X-Received: by 2002:a4a:ee08:0:b0:692:9c90:8e9a with SMTP id
 006d021491bc7-6929c9093admr97107eaf.45.1776175215502; Tue, 14 Apr 2026
 07:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
In-Reply-To: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 14 Apr 2026 10:00:02 -0400
X-Gm-Features: AQROBzDtNMc0E_keXTqptniCR183NjGNZBRqq-7Qjon6jglhw36fYEjsseB1EhQ
Message-ID: <CABBYNZJAEqwfTuVqbFAnx97HBSjcwn3Hb+y+r4r2C=MMPxFoDg@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Add Broadcom channel priority commands
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_070017_644700_1077AEDA 
X-CRM114-Status: GOOD (  34.48  )
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

Hi Sasha,

On Tue, Apr 7, 2026 at 1:46=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Certain Broadcom bluetooth chips (bcm4377/bcm4378/bcm438) need ACL
> streams carrying audio to be set as "high priority" using a vendor
> specific command to prevent 10-ish second-long dropouts whenever
> something does a device scan. This patch sends the command when the
> socket priority is set to TC_PRIO_INTERACTIVE, as BlueZ does for audio.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v2:
> - new ioctl got nack-ed, so let's use sk_priority as the trigger
> - Link to v1: https://lore.kernel.org/r/20260407-brcm-prio-v1-1-f38b17376=
640@gmail.com
> ---
>  MAINTAINERS                       |  2 ++
>  drivers/bluetooth/hci_bcm4377.c   |  2 ++
>  include/net/bluetooth/bluetooth.h |  4 ++++
>  include/net/bluetooth/hci_core.h  | 11 +++++++++++
>  net/bluetooth/Kconfig             |  7 +++++++
>  net/bluetooth/Makefile            |  1 +
>  net/bluetooth/brcm.c              | 29 +++++++++++++++++++++++++++++
>  net/bluetooth/brcm.h              | 17 +++++++++++++++++
>  net/bluetooth/hci_conn.c          | 28 ++++++++++++++++++++++++++++
>  net/bluetooth/l2cap_sock.c        | 13 +++++++++++++
>  10 files changed, 114 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3fe46d7c4bc..81be021367ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2562,6 +2562,8 @@ F:        include/dt-bindings/pinctrl/apple.h
>  F:     include/linux/mfd/macsmc.h
>  F:     include/linux/soc/apple/*
>  F:     include/uapi/drm/asahi_drm.h
> +F:     net/bluetooth/brcm.c
> +F:     net/bluetooth/brcm.h
>
>  ARM/ARTPEC MACHINE SUPPORT
>  M:     Jesper Nilsson <jesper.nilsson@axis.com>
> diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4=
377.c
> index 925d0a635945..5f79920c0306 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -2397,6 +2397,8 @@ static int bcm4377_probe(struct pci_dev *pdev, cons=
t struct pci_device_id *id)
>         if (bcm4377->hw->broken_le_ext_adv_report_phy)
>                 hci_set_quirk(hdev, HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY=
);
>
> +       hci_set_brcm_capable(hdev);
> +
>         pci_set_drvdata(pdev, bcm4377);
>         hci_set_drvdata(hdev, bcm4377);
>         SET_HCIDEV_DEV(hdev, &pdev->dev);
> diff --git a/include/net/bluetooth/bluetooth.h b/include/net/bluetooth/bl=
uetooth.h
> index 69eed69f7f26..07a250673950 100644
> --- a/include/net/bluetooth/bluetooth.h
> +++ b/include/net/bluetooth/bluetooth.h
> @@ -457,6 +457,7 @@ struct l2cap_ctrl {
>  };
>
>  struct hci_dev;
> +struct hci_conn;
>
>  typedef void (*hci_req_complete_t)(struct hci_dev *hdev, u8 status, u16 =
opcode);
>  typedef void (*hci_req_complete_skb_t)(struct hci_dev *hdev, u8 status,
> @@ -469,6 +470,9 @@ void hci_req_cmd_complete(struct hci_dev *hdev, u16 o=
pcode, u8 status,
>  int hci_ethtool_ts_info(unsigned int index, int sk_proto,
>                         struct kernel_ethtool_ts_info *ts_info);
>
> +int hci_conn_setsockopt(struct hci_conn *conn, struct sock *sk, int leve=
l,
> +                       int optname, sockptr_t optval, unsigned int optle=
n);
> +
>  #define HCI_REQ_START  BIT(0)
>  #define HCI_REQ_SKB    BIT(1)
>
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci=
_core.h
> index a7bffb908c1e..947e7c2b08dd 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -642,6 +642,10 @@ struct hci_dev {
>         bool                    aosp_quality_report;
>  #endif
>
> +#if IS_ENABLED(CONFIG_BT_BRCMEXT)
> +       bool                    brcm_capable;
> +#endif
> +
>         int (*open)(struct hci_dev *hdev);
>         int (*close)(struct hci_dev *hdev);
>         int (*flush)(struct hci_dev *hdev);
> @@ -1791,6 +1795,13 @@ static inline void hci_set_aosp_capable(struct hci=
_dev *hdev)
>  #endif
>  }
>
> +static inline void hci_set_brcm_capable(struct hci_dev *hdev)
> +{
> +#if IS_ENABLED(CONFIG_BT_BRCMEXT)
> +       hdev->brcm_capable =3D true;
> +#endif
> +}
> +
>  static inline void hci_devcd_setup(struct hci_dev *hdev)
>  {
>  #ifdef CONFIG_DEV_COREDUMP
> diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
> index 6b2b65a66700..0f2a5fbcafc5 100644
> --- a/net/bluetooth/Kconfig
> +++ b/net/bluetooth/Kconfig
> @@ -110,6 +110,13 @@ config BT_AOSPEXT
>           This options enables support for the Android Open Source
>           Project defined HCI vendor extensions.
>
> +config BT_BRCMEXT
> +       bool "Enable Broadcom extensions"
> +       depends on BT
> +       help
> +         This option enables support for the Broadcom defined HCI
> +         vendor extensions.
> +
>  config BT_DEBUGFS
>         bool "Export Bluetooth internals in debugfs"
>         depends on BT && DEBUG_FS
> diff --git a/net/bluetooth/Makefile b/net/bluetooth/Makefile
> index a7eede7616d8..b4c9013a46ce 100644
> --- a/net/bluetooth/Makefile
> +++ b/net/bluetooth/Makefile
> @@ -24,5 +24,6 @@ bluetooth-$(CONFIG_BT_LE) +=3D iso.o
>  bluetooth-$(CONFIG_BT_LEDS) +=3D leds.o
>  bluetooth-$(CONFIG_BT_MSFTEXT) +=3D msft.o
>  bluetooth-$(CONFIG_BT_AOSPEXT) +=3D aosp.o
> +bluetooth-$(CONFIG_BT_BRCMEXT) +=3D brcm.o
>  bluetooth-$(CONFIG_BT_DEBUGFS) +=3D hci_debugfs.o
>  bluetooth-$(CONFIG_BT_SELFTEST) +=3D selftest.o
> diff --git a/net/bluetooth/brcm.c b/net/bluetooth/brcm.c
> new file mode 100644
> index 000000000000..9aa0a265ab3d
> --- /dev/null
> +++ b/net/bluetooth/brcm.c
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + */
> +
> +#include <net/bluetooth/bluetooth.h>
> +#include <net/bluetooth/hci_core.h>
> +
> +#include "brcm.h"
> +
> +int brcm_set_high_priority(struct hci_dev *hdev, u16 handle, bool enable=
)
> +{
> +       struct sk_buff *skb;
> +       u8 cmd[3];
> +
> +       if (!hdev->brcm_capable)
> +               return 0;
> +
> +       cmd[0] =3D handle;
> +       cmd[1] =3D handle >> 8;

Adding a packed struct and then using something like cpu_to_le16 is
probably preferable over above.

> +       cmd[2] =3D !!enable;
> +
> +       skb =3D hci_cmd_sync(hdev, 0xfc57, sizeof(cmd), cmd, HCI_CMD_TIME=
OUT);
> +       if (IS_ERR(skb))
> +               return PTR_ERR(skb);
> +
> +       kfree_skb(skb);
> +       return 0;
> +}
> diff --git a/net/bluetooth/brcm.h b/net/bluetooth/brcm.h
> new file mode 100644
> index 000000000000..fdaee63bd1d2
> --- /dev/null
> +++ b/net/bluetooth/brcm.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + */
> +
> +#if IS_ENABLED(CONFIG_BT_BRCMEXT)
> +
> +int brcm_set_high_priority(struct hci_dev *hdev, u16 handle, bool enable=
);
> +
> +#else
> +
> +static inline int brcm_set_high_priority(struct hci_dev *hdev, u16 handl=
e, bool enable)
> +{
> +       return 0;
> +}
> +
> +#endif
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index 11d3ad8d2551..096163840f62 100644
> --- a/net/bluetooth/hci_conn.c
> +++ b/net/bluetooth/hci_conn.c
> @@ -35,6 +35,7 @@
>  #include <net/bluetooth/iso.h>
>  #include <net/bluetooth/mgmt.h>
>
> +#include "brcm.h"
>  #include "smp.h"
>  #include "eir.h"
>
> @@ -3070,6 +3071,33 @@ int hci_conn_set_phy(struct hci_conn *conn, u32 ph=
ys)
>         }
>  }
>
> +int hci_conn_setsockopt(struct hci_conn *conn, struct sock *sk, int leve=
l,
> +                       int optname, sockptr_t optval, unsigned int optle=
n)
> +{
> +       int val;
> +       bool old_high, new_high, changed;
> +
> +       if (level !=3D SOL_SOCKET)
> +               return 0;
> +
> +       if (optname !=3D SO_PRIORITY)
> +               return 0;
> +
> +       if (optlen < sizeof(int))
> +               return -EINVAL;
> +
> +       if (copy_from_sockptr(&val, optval, sizeof(val)))
> +               return -EFAULT;
> +
> +       old_high =3D sk->sk_priority >=3D TC_PRIO_INTERACTIVE;
> +       new_high =3D val >=3D TC_PRIO_INTERACTIVE;
> +       changed =3D old_high !=3D new_high;
> +       if (!changed)
> +               return 0;
> +
> +       return brcm_set_high_priority(conn->hdev, conn->handle, new_high)=
;

The skb carries the priority (skb->priority), not sure why you need to
capture the sk_priority instead, doing so ignores the load balance
that hci_core performs to avoid starving connections.

> +}
> +
>  static int abort_conn_sync(struct hci_dev *hdev, void *data)
>  {
>         struct hci_conn *conn =3D data;
> diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
> index 71e8c1b45bce..d5eef87accc4 100644
> --- a/net/bluetooth/l2cap_sock.c
> +++ b/net/bluetooth/l2cap_sock.c
> @@ -891,6 +891,16 @@ static int l2cap_sock_setsockopt(struct socket *sock=
, int level, int optname,
>
>         BT_DBG("sk %p", sk);
>
> +       if (level =3D=3D SOL_SOCKET) {
> +               conn =3D chan->conn;
> +               if (conn)
> +                       err =3D hci_conn_setsockopt(conn->hcon, sock->sk,=
 level,
> +                                                 optname, optval, optlen=
);
> +               if (err)
> +                       return err;
> +               return sock_setsockopt(sock, level, optname, optval, optl=
en);
> +       }
> +
>         if (level =3D=3D SOL_L2CAP)
>                 return l2cap_sock_setsockopt_old(sock, optname, optval, o=
ptlen);
>
> @@ -1931,6 +1941,9 @@ static struct sock *l2cap_sock_alloc(struct net *ne=
t, struct socket *sock,
>
>         INIT_LIST_HEAD(&l2cap_pi(sk)->rx_busy);
>
> +       if (sock)
> +               set_bit(SOCK_CUSTOM_SOCKOPT, &sock->flags);

This is more complicated than it needs to be. I'd just add a new
callback, `hdev->set_priority(handle, skb->priority)`, so the driver
is called whenever it needs to elevate a connection's priority, that
said there could be cases where a connection needs its priority set
momentarily to transmit A2DP, followed by OBEX packets that are best
effort. Therefore, `hci_conn` will probably need to track the priority
so it can detect when it needs changing on a per skb basis.

>         chan =3D l2cap_chan_create();
>         if (!chan) {
>                 sk_free(sk);
>
> ---
> base-commit: bfe62a454542cfad3379f6ef5680b125f41e20f4
> change-id: 20260407-brcm-prio-b630e6cc3834
>
> Best regards,
> --
> Sasha Finkelstein <fnkl.kernel@gmail.com>
>
>


--=20
Luiz Augusto von Dentz

