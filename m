Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DE4E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 23:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSmGDNX9CC2d3HL4afoZjaMZrOh6/NAEiJbAyqPRBEo=; b=hK2Uu9eHUvWmwq
	10bh7pqabOapGuU+YVCGy+Ihl0zRpS1zyLnfMAlP4s3LBh4MBLEAgR2S0zAAw4gFOWwv1IjIs0KOi
	vf3mE8q/4hqlmtvc6FQavsaXBKOXb9lR25uvQx0ytIvsGC8nkweRZxm2dG3QW5FQlKvhifdU5jNuZ
	25vmwE2X1O4hUcc2NL2l+C2cVsAyhq76g7ZZflJHM9KEyZgeT8igVdS6hpKClZ6z0qUfvAGQAnhxJ
	Xyl52vn7xqVMtiTGQFmCCMN0evYvVzoVSPEE5ebVxOdzx/fUuuWmrtgqvAvdMjoKscEdPWLZqO4oV
	o70e8cxnCUERJW0jN2Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWl5E-00000001h8H-16vk;
	Sat, 11 Jan 2025 23:40:00 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWl3y-00000001go6-1dZq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 23:38:44 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3a9cee9d741so22419485ab.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 15:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736638721; x=1737243521; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSmGDNX9CC2d3HL4afoZjaMZrOh6/NAEiJbAyqPRBEo=;
        b=Toeryw2WTCsYo1ddI4GOVDpcIjA5hvifRDndTCbEi6pwJVspaMiIE5XwkaEinXGPi5
         PTq8S9d7c0LmN2XyrwyRZFk8OhPDbwho2193II1pPHfIKPCPgmARxiN0PAAqUFWlK2Fp
         7keeku+9IPVXK46SJata4EJma3EwygnWMZ6SXZt3BwI7c7R5zpE+yefDvQQ7yVK1OQbh
         4bAN/1qP2pO2mIiJXUGa+YUOqjE2b7KGVn1k7siLKQsikwiWWP1vj0o0qE1vcRs/UAh6
         VLwMoNVJM3IieFs0hUkkEgdZCagOqQIPT3DGHXFMXE/gMYf8R8wbtW2zKtdst7/5JB4x
         tHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736638721; x=1737243521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSmGDNX9CC2d3HL4afoZjaMZrOh6/NAEiJbAyqPRBEo=;
        b=RmP3gUq80u3brx0G7OqXIlbBSVdhYWABm4CSh6l7HNIW56pctfbvf5iNeA9d/B6dd/
         VDZicmPeCnETqNnNQ54Y03K47sCRMltCORkB32rTdOksdP+gKHDiDdg/Trb0pHnXlHL3
         CcWL5gSTu4I7D0GOb5PxTH73m55LXNFaBYT8mrxgD7viJFok5yp2WA3NIojKEcVgQ1Hw
         eaaHrSkmV8B7eKuK4RMDy2p8wKl69+jDASmdH7NlxKZjr0RGUZvu/9xkmeFqnnkY5QGV
         GZElC1aEnydQ+Jwbw5I6TyJVVuENxHae3NVIvXgiM0NF/u3iajUMWSxkBOxPfG3vN+qP
         jO4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHhnQzhxiXmZ6y/RQQfQmOCwi+lSg0y2QRynU2mMHwQA4aL83ShQk54626H3/tAp7nLToG4c4XMFgqAs74/4j1@lists.infradead.org
X-Gm-Message-State: AOJu0YyuSuugjqMD8ZWTg4+z2+GGJT78uhQeQNjhTGQEvs7OUwDjWkV8
	xcLvf3q4n66rt7vfWj5iwEWsH7/8zl/n6PPmVOeAAOVItxVHkXdfO+xYVD81X0fQ/3d4lk1zx1F
	ftd234+X6roAnkWtV1CkDP3dtST0=
X-Gm-Gg: ASbGnct005xlfdjbTPzj94CsVy6x5bGKoQd9iwAl4GdadnnDRfB4QrAQzMKh4EfAE2c
	nC++WaThlEebAYWj10xQOFfxI3/EqSftJVcKh
X-Google-Smtp-Source: AGHT+IH6Z6JztDq8NnTac66FF1FRfOdf7YDCCFhupP4kXxxaC7X0XENWJ4B8Agrqh55Q23BphIsV5KAlzt5FAVergck=
X-Received: by 2002:a05:6e02:1607:b0:3cd:d08a:5c99 with SMTP id
 e9e14a558f8ab-3ce3a87a5d9mr120667135ab.8.1736638720742; Sat, 11 Jan 2025
 15:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20250109105600.41297-1-basharath@couthit.com> <20250110055906.65086-7-basharath@couthit.com>
In-Reply-To: <20250110055906.65086-7-basharath@couthit.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 12 Jan 2025 07:38:04 +0800
X-Gm-Features: AbW1kva3z-1aEzVTv2r3xLbpbKMOSjkZCC8BNOujNXCLZUG9WKMOdO0gPkmPI7o
Message-ID: <CAL+tcoD6WuJH6yXaEGvuz_s3sROPXtEMeZw1hBNQvb6wnKKr-w@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: ti: prueth: Adds HW timestamping support
 for PTP using PRU-ICSS IEP module
To: Basharath Hussain Khaja <basharath@couthit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_153842_433585_B458113B 
X-CRM114-Status: GOOD (  25.79  )
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
Cc: nm@ti.com, vigneshr@ti.com, tony@atomide.com, edumazet@google.com, krishna@couthit.com, pmohan@couthit.com, diogo.ivo@siemens.com, robh@kernel.org, javier.carrasco.cruz@gmail.com, praneeth@ti.com, m-karicheri2@ti.com, jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org, schnelle@linux.ibm.com, mohan@couthit.com, richardcochran@gmail.com, prajith@ti.com, rogerq@kernel.org, ssantosh@kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rogerq@ti.com, srk@ti.com, pratheesh@ti.com, m-malladi@ti.com, netdev@vger.kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, afd@ti.com, andrew+netdev@lunn.ch, parvathi@couthit.com, horms@kernel.org, krzk+dt@kernel.org, davem@davemloft.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jan 10, 2025 at 2:01=E2=80=AFPM Basharath Hussain Khaja
<basharath@couthit.com> wrote:
>
> From: Roger Quadros <rogerq@ti.com>
>
> PRU-ICSS IEP module, which is capable of timestamping RX and
> TX packets at HW level, is used for time synchronization by PTP4L.
>
> This change includes interaction between firmware and user space
> application (ptp4l) with required packet timestamps. The driver
> initializes the PRU firmware with appropriate mode and configuration
> flags. Firmware updates local registers with the flags set by driver
> and uses for further operation. RX SOF timestamp comes along with
> packet and firmware will rise interrupt with TX SOF timestamp after
> pushing the packet on to the wire.
>
> IEP driver is available in upstream and we are reusing for hardware
> configuration for ICSSM as well. On top of that we have extended it
> with the changes for AM57xx SoC.
>
> Extended ethtool for reading HW timestamping capability of the PRU
> interfaces.
>
> Currently ordinary clock (OC) configuration has been validated with
> Linux ptp4l.
>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> ---
>  drivers/net/ethernet/ti/icssg/icss_iep.c      |  42 ++
>  drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  26 +
>  drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 443 +++++++++++++++++-
>  drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  11 +
>  .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |  85 ++++
>  5 files changed, 605 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
>
> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ether=
net/ti/icssg/icss_iep.c
> index 768578c0d958..9a2ea13703d8 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
> @@ -937,11 +937,53 @@ static const struct icss_iep_plat_data am654_icss_i=
ep_plat_data =3D {
>         .config =3D &am654_icss_iep_regmap_config,
>  };
>
> +static const struct icss_iep_plat_data am57xx_icss_iep_plat_data =3D {
> +       .flags =3D ICSS_IEP_64BIT_COUNTER_SUPPORT |
> +                ICSS_IEP_SLOW_COMPEN_REG_SUPPORT,
> +       .reg_offs =3D {
> +               [ICSS_IEP_GLOBAL_CFG_REG] =3D 0x00,
> +               [ICSS_IEP_COMPEN_REG] =3D 0x08,
> +               [ICSS_IEP_SLOW_COMPEN_REG] =3D 0x0C,
> +               [ICSS_IEP_COUNT_REG0] =3D 0x10,
> +               [ICSS_IEP_COUNT_REG1] =3D 0x14,
> +               [ICSS_IEP_CAPTURE_CFG_REG] =3D 0x18,
> +               [ICSS_IEP_CAPTURE_STAT_REG] =3D 0x1c,
> +
> +               [ICSS_IEP_CAP6_RISE_REG0] =3D 0x50,
> +               [ICSS_IEP_CAP6_RISE_REG1] =3D 0x54,
> +
> +               [ICSS_IEP_CAP7_RISE_REG0] =3D 0x60,
> +               [ICSS_IEP_CAP7_RISE_REG1] =3D 0x64,
> +
> +               [ICSS_IEP_CMP_CFG_REG] =3D 0x70,
> +               [ICSS_IEP_CMP_STAT_REG] =3D 0x74,
> +               [ICSS_IEP_CMP0_REG0] =3D 0x78,
> +               [ICSS_IEP_CMP0_REG1] =3D 0x7c,
> +               [ICSS_IEP_CMP1_REG0] =3D 0x80,
> +               [ICSS_IEP_CMP1_REG1] =3D 0x84,
> +
> +               [ICSS_IEP_CMP8_REG0] =3D 0xc0,
> +               [ICSS_IEP_CMP8_REG1] =3D 0xc4,
> +               [ICSS_IEP_SYNC_CTRL_REG] =3D 0x180,
> +               [ICSS_IEP_SYNC0_STAT_REG] =3D 0x188,
> +               [ICSS_IEP_SYNC1_STAT_REG] =3D 0x18c,
> +               [ICSS_IEP_SYNC_PWIDTH_REG] =3D 0x190,
> +               [ICSS_IEP_SYNC0_PERIOD_REG] =3D 0x194,
> +               [ICSS_IEP_SYNC1_DELAY_REG] =3D 0x198,
> +               [ICSS_IEP_SYNC_START_REG] =3D 0x19c,
> +       },
> +       .config =3D &am654_icss_iep_regmap_config,
> +};
> +
>  static const struct of_device_id icss_iep_of_match[] =3D {
>         {
>                 .compatible =3D "ti,am654-icss-iep",
>                 .data =3D &am654_icss_iep_plat_data,
>         },
> +       {
> +               .compatible =3D "ti,am5728-icss-iep",
> +               .data =3D &am57xx_icss_iep_plat_data,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, icss_iep_of_match);
> diff --git a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c b/drivers/net/=
ethernet/ti/icssm/icssm_ethtool.c
> index cce3276d5565..86d62d64dc4d 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/if_bridge.h>
>  #include "icssm_prueth.h"
> +#include "../icssg/icss_iep.h"
>
>  #define PRUETH_MODULE_VERSION "0.2"
>  #define PRUETH_MODULE_DESCRIPTION "PRUSS Ethernet driver"
> @@ -189,12 +190,37 @@ static void icssm_emac_get_regs(struct net_device *=
ndev,
>         regs->version =3D PRUETH_REG_DUMP_GET_VER(prueth);
>  }
>
> +static int icssm_emac_get_ts_info(struct net_device *ndev,
> +                                 struct kernel_ethtool_ts_info *info)
> +{
> +       struct prueth_emac *emac =3D netdev_priv(ndev);
> +
> +       if ((PRUETH_IS_EMAC(emac->prueth) && !emac->emac_ptp_tx_irq))
> +               return ethtool_op_get_ts_info(ndev, info);
> +
> +       info->so_timestamping =3D
> +               SOF_TIMESTAMPING_TX_HARDWARE |
> +               SOF_TIMESTAMPING_TX_SOFTWARE |
> +               SOF_TIMESTAMPING_RX_HARDWARE |
> +               SOF_TIMESTAMPING_RX_SOFTWARE |
> +               SOF_TIMESTAMPING_SOFTWARE |
> +               SOF_TIMESTAMPING_RAW_HARDWARE;

In addtion to what Richard suggested, there is no need to re-mark the
following flags "SOF_TIMESTAMPING_RX_SOFTWARE" and
"SOF_TIMESTAMPING_SOFTWARE", please see __ethtool_get_ts_info().

Thanks,
Jason

