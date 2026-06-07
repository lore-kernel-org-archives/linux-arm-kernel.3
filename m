Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EECCD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 03:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deuPBE4BaetM6ojGtefV9ckRbsUamk7OEDI2zXYc7Gs=; b=a+nwszdX4y0vlyKXjIegN8BcAE
	BQS2XrGiV54poLkwCeFS0OYKsHDK1uEeQNzIM7pTNSeOux9EHKjNUGII2yJZU8lrHQUOxflXL0P4o
	HRJzz+i276Kh3jq7b9R2GDhiKZdvMQpgKqVNmrHIS0Uxa9BNza54Xg1a/qJMyULbLBkXHEda7Mw3W
	e30tCnSALnxcN6ExEVZHwNw9bo7D5Q9vxF1Yr1GntBGszg6HTEtXu9ta3jQvyYH8cKwYZ90ZQ3IAE
	COAGHvqVJHLLP7mZPbBSiJKw28/9XGZSveKO8ZR88VrqiebTEq152ZWNFzYtiwsx9Yht8HIrYRza3
	vXMtExTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW4O8-000000020VZ-3L5L;
	Sun, 07 Jun 2026 03:41:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW4O5-000000020V3-1OTL;
	Sun, 07 Jun 2026 03:41:27 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F54D497;
	Sun,  7 Jun 2026 05:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780803653;
	bh=QyCPnRf3F8ke+P9wWuP2lHv+Rfb9GviPoqyvg1WWKtg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=n8ea4Y7QIV1KCBpiZFCJ5VLUYuMlJo5yIQkbLL+NABeBGoLQ0T+wPXTwezklx5DZY
	 qH/ooGzRFbDgo0+IpQiA/gdnB5b9QgafRSCqvq0wU465AACEoz4QnAUGacpNcjibq5
	 E7ft/QoCQMqWrRhsKL8avdbn0lKYWHyPOPo2wTyA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ahyh0ZlwlZqr7VNa@kekkonen.localdomain>
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org> <1ddf8baa-47db-4b9d-9df6-a6075bc94593@yoseli.org> <5b63761b-07dd-4786-bc98-d8a1c48a2ef4@kernel.org> <ahyh0ZlwlZqr7VNa@kekkonen.localdomain>
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Hans Verkuil <hverkuil@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Eugen Hristev <ehristev@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sun, 07 Jun 2026 09:11:14 +0530
Message-ID: <178080367434.9570.8101421417305606672@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_204125_521644_68EF0816 
X-CRM114-Status: GOOD (  37.44  )
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

Hi Sakari, Eugen,

Quoting Sakari Ailus (2026-06-01 02:32:09)
> Hi Eugen, others,
>=20
> On Fri, May 29, 2026 at 06:06:42PM +0300, Eugen Hristev wrote:
> > On 5/29/26 08:12, Jean-Michel Hautbois wrote:
> > > Hi Eugen,
> > >=20
> > > Le 22/05/2026 =C3=A0 17:28, Eugen Hristev a =C3=A9crit=C2=A0:
> > >> When requesting log status, the block might be powered off, but regi=
sters
> > >> are being read.
> > >> Avoid reading the registers if the device is not resumed, thus also =
avoid
> > >> powering up the device just for log status.
> > >>
> > >> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CS=
I2 camera interface")
> > >> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> > >> ---
> > >> Changes in v2:
> > >> - changed to use pm_runtime_get_if_active()
> > >> - add corresponding put()
> > >> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d=
88045@kernel.org
> > >>
> > >> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> > >> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> > >> To: Florian Fainelli <florian.fainelli@broadcom.com>
> > >> To: Ray Jui <rjui@broadcom.com>
> > >> To: Scott Branden <sbranden@broadcom.com>
> > >> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@b=
roadcom.com>
> > >> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > >> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >> To: Hans Verkuil <hverkuil@kernel.org>
> > >> To: Naushir Patuck <naush@raspberrypi.com>
> > >> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >> Cc: linux-media@vger.kernel.org
> > >> Cc: linux-rpi-kernel@lists.infradead.org
> > >> Cc: linux-arm-kernel@lists.infradead.org
> > >> Cc: linux-kernel@vger.kernel.org
> > >> ---
> > >>   drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
> > >>   1 file changed, 9 insertions(+)
> > >>
> > >> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/driv=
ers/media/platform/broadcom/bcm2835-unicam.c
> > >> index 8d28ba0b59a3..93815b8ab930 100644
> > >> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > >> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > >> @@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *fil=
e, void *fh)
> > >>             node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
> > >>    dev_info(unicam->dev, "V4L2 format:         %08x\n",
> > >>             node->fmt.fmt.pix.pixelformat);
> > >> +
> > >> +  if (!pm_runtime_get_if_active(unicam->dev)) {
> > >=20
> > > Well, if I am picky I would say that pm_runtime_get_if_active() can=20
> > > return -EINVAL if runtime PM is disabled for the device. It should th=
en=20
> > > be tested against '<=3D 0' ?
> > >=20
> > > I suppose this should not happen really often, as very few drivers=20
> > > actually test this case...
> >=20
> > I saw that. Some do. This driver enables runtime pm in probe though. So
> > I guess it cannot happen, unless runtime pm would not selected in kernel
> > config, but the driver depends on PM.
>=20
> Runtime PM can be disabled for a device via sysfs.
>=20

I tried this on my board, and you can only do:

echo on > /sys/class/<...>/control

Which leads to RPM count to always stay 1 regardless of get/put.

So if the driver enables RPM and never disables it unless it's removed,
there's no way from userspace to make this function return -EINVAL.

> >=20
> > Ultimately I guess it's up to Sakari or Hans to decide whether it's
> > worth checking for error code, but I picked the simpler path (and
> > considering <depends on PM> in Kconfig) .
>=20
> pm_runtime_put() musn't be called if there was an error as it decrements
> usage_count unconditionally.
>=20
> The vast majority of sensor drivers test for non-zero only and no-one has
> complained. They should be fixed though...
>=20

This driver has an explicit "depends on PM", but even for other sensor
drivers, the only case pm_runtime_get_if_active can return -EINVAL is when
CONFIG_PM=3Dn, where pm_runtime_put is also stubbed out to return -ENOSYS..

So there is nothing to fix in sesnor drivers which do:

    if (!pm_runtime_get_if_active(&client->dev))
            return 0;

    /* write registers */

    /* unconditional put */
    pm_runtime_put(&client->dev)

Thanks,
    Jai

> > >=20
> > > With or without this small change:
> > > Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> > >=20
> > > Thanks,
> > > JM
> > >=20
> > >> +          dev_info(unicam->dev,
> > >> +                   "Live data N/A due to device inactive\n");
> > >> +          return 0;
> > >> +  }
> > >> +
> > >>    reg =3D unicam_reg_read(unicam, UNICAM_IPIPE);
> > >>    dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
> > >>             unicam_get_field(reg, UNICAM_PUM_MASK),
> > >> @@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file=
, void *fh)
> > >>    dev_info(unicam->dev, "Write pointer:       %08x\n",
> > >>             unicam_reg_read(unicam, UNICAM_IBWP));
> > >>  =20
> > >> +  pm_runtime_put(unicam->dev);
> > >> +
> > >>    return 0;
> > >>   }
> > >>  =20
> > >>
> > >> ---
> > >> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> > >> change-id: 20260521-bcmpipm-6c578e73239c
> > >>
> > >> Best regards,
>=20
> --=20
> Regards,
>=20
> Sakari Ailus
>

