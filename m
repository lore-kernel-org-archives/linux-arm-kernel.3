Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CA8FEEF46
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6+qhHS9U2NR5KN/+3DgIjEjwrsUhOTdOACQA1DQXNk=; b=eqz4XPwXXkiMwcc67wmY+dPEWm
	ZYu0Akdo1UZY31fmuN4336ZR/JteYCraFWhGntRWGfYAmZ/ZNM4pEptipDfBwteXWFPjd/YC25E8b
	F3w+lDuH/J9VQS/s4GLcffpVS2zTLGPVCjSRM0fP/p6xTgwbcRfodeAuHkSOQPtdXLrJtTY3a6n0i
	Se5LY9AiqLOswDIAdCp1mi46R3piE8wtZKiIzQg7YrU5Ig3c1E7C82oRrb5P6EhdNUqxL6H/fSX0x
	v7FNm00xXGKs3fn28kSrzHxlIygev6kCMQx808UmRUD5kow+TYrhNzzs1GEgfNwGY2grgeR42+X6r
	1k/MUL2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6g6-00000006X5D-1HWY;
	Tue, 07 Apr 2026 13:41:14 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6g4-00000006X4L-0nXv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:41:13 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6501d242e2fso4713489d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 06:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775569271; cv=none;
        d=google.com; s=arc-20240605;
        b=g3cF+xWG/DXmsG/K2D/9RNlT5BhmorepJQfDX13XwzUxpOwNzmrGqKrGvvBfVwGbP+
         z2oiLLrAjKPVd5Gu2e29Ye1fpLMWcgKAeL2j/XeQdTrmnKFiMBlWs8IRjAFMypb/wZKo
         WqgJ8bb7DYAnKbx1IiZZ5oPgBhzxA1enOxGfC1rbGoJpfDTfiaxai87+S4cYZ/sWzGvS
         4ozEPhdTZFHSuYMKQS0uJZhYDVECyigkjNdq5M/7KlLvDT5kWpL6Tkq9MxK0uFW3Qwxc
         MYu8euYth7d8NlkKV5hxKMV1rhdN8yaGPTAef6sqzH9Egw7V3OwTLR1sdDm87GQ9pN9z
         5WWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K6+qhHS9U2NR5KN/+3DgIjEjwrsUhOTdOACQA1DQXNk=;
        fh=3cN9hrhrMStxIYat8sfpcMqNHEV0ORtNFqCVVgT2VWI=;
        b=gApSszgYsmnwhDdd8BvKEp/3dSmmj0DgRh4QQQyTzABXHk3RMJYqEv6vY4thoLqv1Z
         N+Z4ZXe1wdXAnGF7MGBjWC6XFkt/GYF/5Cpt2x9PNvuaX3Qz/e2khVqsqOUekRfIWRGm
         9BrTx33lF1Yrr46UaedIau0ln9QnPGXTo7GVLa0IOQ0ISVPWcS4ZxYEYMUucjJNhoW34
         ubpu3XJqgIFIVbXJ6HewEsHoVrRW5pvzypWLvSMfOEKfJCLBgd0F9hU4yuIBGRy9oZRl
         CMyvOScDXQZDUK9JJcAX4u7JCoBLCMWqeygDRzVXIb4cyv91Qqey71q8g3yHhFv/IK3I
         i78Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775569271; x=1776174071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6+qhHS9U2NR5KN/+3DgIjEjwrsUhOTdOACQA1DQXNk=;
        b=BJ5VjFUBXK546oZZJ7zsY7sPo0aNVQiRgoQNiyuJNC9NCyFSQ2QqbmB+qVgl9SKHfL
         Lo8hoRH4Kow7U06tD+lx5KitpXQsAjW0T00MvGhryZvmHXJassqi6jAuz9t8XbHkuy7Y
         ykKwERoryBdNEREXWwr9WwGPyyOt7pkc0KFIlSLbSD9Z/Ovpdo2Dt2qZCsNeM2jxxcAz
         /FA5DZSxHZ8K2Wy3X6wTs0jLIZ6WLKsa1HUAzekUeq0xqz2WComng9usLcnLUKGqVDlT
         NZLhv4o8AgrKJJlAAbwqem4uEWQ7iw5CBZygPE2cXnD5EePgiskjP6oEm0u22FA3l6ok
         KRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569271; x=1776174071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6+qhHS9U2NR5KN/+3DgIjEjwrsUhOTdOACQA1DQXNk=;
        b=JS9JGkXr0oEyiqStdRYuCGO6sRrIEC71MWONbhBBWH7eOSajuYnfS0HmFvaQs3mmt2
         7sB8R7OfxcSJ3TIk+EzZoo7HNUv0AXnjC//joM4ND4QV9o39ydC/QEzPqyLs7dmwZW0y
         8JR9vu3PQoYsRMtmQhlj3OnDCGi3u3bg18u3kUWDaC9m2wBiwc2yLad7t8puTbVepKGU
         UGRWYY0ngm4SRnAvEDfNJ5eSgn3EWXl7MMWhXsSQ4sMWInR9W+Zptjt4pR2hgj5j4Uba
         Aw9PUXH7IEUwYuUYlEjv/vLKB0v9IJO8d0V4BEtuqHk8Djlwe9M3vht0w3iVNep0X/dw
         XUlw==
X-Forwarded-Encrypted: i=1; AJvYcCUk7HLROB4IGLitTNZgwea8c2H8/jRaIOCC3EocB0TjLBP8q2CuDqVdsl429BMTKYwUYIIpwdaYl3MBhsTYMYSn@lists.infradead.org
X-Gm-Message-State: AOJu0YyFA328wOhiZ4pETN251LtEKeD7XqhxOu0yAc1EYr/sz3TRRduC
	lg/7glk5tM4WgIVo5S0HWF09dLVOVAuuEGlpD7QSi3jogRmKxzh92vPUZiyAU2CxbkZ8+PRJC0G
	CV6KGMIwxNiDX2FfXRzNJ0rBUzOZUTBVl9Flq
X-Gm-Gg: AeBDietXGwM0FwPz68q7DVrUIAQU8YqMZVV2fNuAr4wPalIGjHvLamcKmDqlU5jdAiS
	8Yy4T3OUX2DqSNmBboR1sAL+Gtqo401c94izj+8oj5n5qdZ5bf1+U/LP6ZuOVJERxjpCo6HOsUs
	rMm8fp2NkkSmPnfRQBZVIR3FOa7OAynBqTFZFlI5cgJXfaYoFu0kCEykifJL1rWM0edGWsLPu5H
	0VciVHPsZmy7laCeVfrz3mYBch1iDINdLd+MAnnyWgHOmvDnaEFFlkOyBK6V/eJKzMu7mHs1v2+
	vgstIbo5O/hj+oJPq5g06Bhb06nX6XIT0q2IaAwKq+Tqc6Z7Zv5c9UF8QPIZ2wixeuXZNQ==
X-Received: by 2002:a05:690e:4397:b0:64c:b81d:2cb7 with SMTP id
 956f58d0204a3-6504881bc03mr10964580d50.39.1775569270543; Tue, 07 Apr 2026
 06:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260407-brcm-prio-v1-1-f38b17376640@gmail.com>
In-Reply-To: <20260407-brcm-prio-v1-1-f38b17376640@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 7 Apr 2026 09:40:58 -0400
X-Gm-Features: AQROBzAa16hYCox9YuiofHUqjsYpvs_frFTh54dv3AlFBuE-XJcb0jeBhhoCcSI
Message-ID: <CABBYNZ+OrkJWcbVKkyrpX3HHJr7vGgC92Y=wkf6PPwR9Zr+mOQ@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: Add Broadcom channel priority commands
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
X-CRM114-CacheID: sfid-20260407_064112_277289_1C56FD16 
X-CRM114-Status: GOOD (  31.58  )
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

Hi,

On Tue, Apr 7, 2026 at 8:09=E2=80=AFAM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Certain Broadcom bluetooth chips (bcm4377/bcm4378/bcm438) need ACL
> streams carrying audio to be set as "high priority" using a vendor
> specific command to prevent 10-ish second-long dropouts whenever
> something does a device scan. This series adds an ioctl to control
> the priorities and hooks it up for the relevant chips.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS                      |  2 ++
>  drivers/bluetooth/hci_bcm4377.c  |  2 ++
>  include/net/bluetooth/hci_core.h | 12 ++++++++++++
>  include/net/bluetooth/hci_sock.h |  7 +++++++
>  net/bluetooth/Kconfig            |  7 +++++++
>  net/bluetooth/Makefile           |  1 +
>  net/bluetooth/brcm.c             | 29 +++++++++++++++++++++++++++++
>  net/bluetooth/brcm.h             | 17 +++++++++++++++++
>  net/bluetooth/hci_conn.c         | 11 +++++++++++
>  net/bluetooth/hci_sock.c         |  4 ++++
>  10 files changed, 92 insertions(+)
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
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci=
_core.h
> index a7bffb908c1e..ef3b5433203c 100644
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
> @@ -1812,6 +1823,7 @@ int hci_get_conn_list(void __user *arg);
>  int hci_get_conn_info(struct hci_dev *hdev, void __user *arg);
>  int hci_get_auth_info(struct hci_dev *hdev, void __user *arg);
>  int hci_inquiry(void __user *arg);
> +int hci_set_acl_prio(struct hci_dev *hdev, void __user *arg);
>
>  struct bdaddr_list *hci_bdaddr_list_lookup(struct list_head *list,
>                                            bdaddr_t *bdaddr, u8 type);
> diff --git a/include/net/bluetooth/hci_sock.h b/include/net/bluetooth/hci=
_sock.h
> index 13e8cd4414a1..95d156ac4cae 100644
> --- a/include/net/bluetooth/hci_sock.h
> +++ b/include/net/bluetooth/hci_sock.h
> @@ -91,6 +91,8 @@ struct hci_ufilter {
>
>  #define HCIINQUIRY     _IOR('H', 240, int)
>
> +#define HCISETACLPRIO  _IOW('H', 250, int)

Nack, not going to introduce an ioctl command for this.

>  /* Ioctl requests structures */
>  struct hci_dev_stats {
>         __u32 err_rx;
> @@ -171,6 +173,11 @@ struct hci_inquiry_req {
>         __u8  length;
>         __u8  num_rsp;
>  };
> +
> +struct hci_acl_prio_req {
> +       __u16 handle;
> +       __u8  high_prio;
> +};
>  #define IREQ_CACHE_FLUSH 0x0001
>
>  #endif /* __HCI_SOCK_H */
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
> index 000000000000..d03d2af5dc7e
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
> +               return -EOPNOTSUPP;
> +
> +       cmd[0] =3D handle;
> +       cmd[1] =3D handle >> 8;
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
> index 000000000000..a501f2988a96
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
> +       return -EOPNOTSUPP;
> +}
> +
> +#endif
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index 11d3ad8d2551..b2c7414a9c5b 100644
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
> @@ -2775,6 +2776,16 @@ int hci_get_auth_info(struct hci_dev *hdev, void _=
_user *arg)
>         return copy_to_user(arg, &req, sizeof(req)) ? -EFAULT : 0;
>  }
>
> +int hci_set_acl_prio(struct hci_dev *hdev, void __user *arg)
> +{
> +       struct hci_acl_prio_req req;
> +
> +       if (copy_from_user(&req, arg, sizeof(req)))
> +               return -EFAULT;
> +
> +       return brcm_set_high_priority(hdev, req.handle, req.high_prio);
> +}
> +
>  struct hci_chan *hci_chan_create(struct hci_conn *conn)
>  {
>         struct hci_dev *hdev =3D conn->hdev;
> diff --git a/net/bluetooth/hci_sock.c b/net/bluetooth/hci_sock.c
> index 0290dea081f6..4be6aeeb6bad 100644
> --- a/net/bluetooth/hci_sock.c
> +++ b/net/bluetooth/hci_sock.c
> @@ -1035,6 +1035,9 @@ static int hci_sock_bound_ioctl(struct sock *sk, un=
signed int cmd,
>                 if (!capable(CAP_NET_ADMIN))
>                         return -EPERM;
>                 return hci_sock_reject_list_del(hdev, (void __user *)arg)=
;
> +
> +       case HCISETACLPRIO:
> +               return hci_set_acl_prio(hdev, (void __user *)arg);
>         }
>
>         return -ENOIOCTLCMD;
> @@ -1072,6 +1075,7 @@ static int hci_sock_ioctl(struct socket *sock, unsi=
gned int cmd,
>         case HCIGETAUTHINFO:
>         case HCIBLOCKADDR:
>         case HCIUNBLOCKADDR:
> +       case HCISETACLPRIO:
>                 break;
>         default:
>                 return -ENOIOCTLCMD;
>
> ---
> base-commit: bfe62a454542cfad3379f6ef5680b125f41e20f4
> change-id: 20260407-brcm-prio-b630e6cc3834
>
> Best regards,
> --
> Sasha Finkelstein <fnkl.kernel@gmail.com>

The simple solution would be for the driver to set all ACL connections
with high priority since in most cases we do want connections having
higher priority than scanning. That said, we may need to identify
which connections are performing audio versus those that are not. For
the audio connections, perhaps we could use skb->priority to set their
priority (provided userspace sets it for audio).

--=20
Luiz Augusto von Dentz

