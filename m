Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48EBC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mduAQQnr6XFJuL+iv4byNZV6KWiQaZZ5C5/zUL5szzQ=; b=0l3biafQ9XkBS4ZmHU5fwPVGgT
	aMjbsEzs2TUuL1BQkCyHHKUq/0sFMyvRQfOyEzPYX35kuBUAw5yGylTTkJgqW+5rIuwOJXknqso7P
	Qo+W4vSSQu4I9XHcW2ItyJWQujyK/dyTvxAlAvsKkE3CgrNCTe6aQkViZbvsTz0Bh+m/nKbfkDsoS
	UfWDsoVpFEuVAacecMigGb7PSuaPAXnELSQ5svcYCaqeBeHtvcVClJVTW4iuDPaMDMHA+lU1QloTd
	cZSxu2dBl+f18D+hxtCNfAx7XiJSPnOqcTTc+Ih3qA60Dw1EOyBvel935o+4cfOnRsabMGi1q7TUZ
	0/zMrZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg85K-00000007Qw6-21nu;
	Thu, 06 Feb 2025 20:02:50 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg83V-00000007QZw-456f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 20:00:59 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6e42ba364f1so14317746d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 12:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738872056; x=1739476856; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mduAQQnr6XFJuL+iv4byNZV6KWiQaZZ5C5/zUL5szzQ=;
        b=aiYR6ONAoYI3D13p0e4QOi4KQC403MpndfubFDs4xdre7gNpqiNgVfIalCPt0dEs5q
         IOJCc479IFQcmyJz/BVQs/BaIm/XW9LAXm86+XYV0oAcTqSudsnrQhBv9D4H4MiYUD8J
         8mx5kQs1fh9dnExiLvRGqAPfOx2KYHkRzVf4JhcFdCqpnE3o+2d+F0My99f6JWJxmzL3
         M3s5au7qtaDDgBy038L7RFcN9U7VfZhcfMu4xCvQDwJkQnbyf36GjwWBm2jrBUw8EyyU
         Ldu9oxPb1bvbLu7RX+iR4cw/5uaUrhhsr40nQZ+n+xe5bo1QPSeUf+XnEye0CKnmee4x
         pHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738872056; x=1739476856;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mduAQQnr6XFJuL+iv4byNZV6KWiQaZZ5C5/zUL5szzQ=;
        b=J5TQgS1SeDSBYAZX5V/Xyq64z7K5AmtKhtqeLkHpCYvr4WczIw4c7XK8J6iuwIflaH
         GKmuTvqMqyghzIJmki/7VYbKutnjv7+KA/95VzNYkaqrJj94dujQkKlFfRQDkShxKQ9T
         3cjoctgV/vt8zbsU95RqE834OLQ9rI20thb/LX58cIwqAvuJPrCalPQK865S/8xv6IHa
         27swIhR1ihcN99zR5rhEj24Mo+TdUjrkMXcdpT8TUu+67lhAUdgNre6/BlIBBUwTAYQU
         AkeYDVlLK+LIAygUtoxYpSouYLDFSA8fjfsOUq+5aexnMPr9oTN1biSpn9bmUE6osQ9m
         vRLw==
X-Forwarded-Encrypted: i=1; AJvYcCVY56uu+zvG4HsR+aCEppniua0h0E8U1J2t1X+dL82o76HOyUwhRWUcYtbF3QcHDYL5YrQ3FpyfiXIoT4qEWW47@lists.infradead.org
X-Gm-Message-State: AOJu0YzybbO85KqGj0siwbw+JJFICz83Hp1EI6jpCvvTChm5CXrENN86
	J60IWKhpDfp6dbRZrUZFtcZ+rVqPY1/JDH8hzkzodQsjYjhYPX63i4zme2Tz9M0=
X-Gm-Gg: ASbGnctln5kc3RwGAsd5Lfx6Pi1TWLeI35bx3ZO2iAmZ2naJmGCfP6rpr3s26t5QB8Q
	Xbu9CtfvqySF/k+QOHdaUPDxpMHZomhKu29grN2g5ybLEGasDl+M87qEw+Z6NMURtPLjs/4WRsw
	AGXJ45gy9cx37yUP+3lDYbWZfA7K22wFDLkEdIJUBT10oZh1O5Hw7CadNUU4RVMhX3jJKA4DZSn
	Pu7e6KwEAn+hm1Zpdt8jQaET8O5VtAXQMUaPKpsxfLI+YcXmnC2CvexLDfyNNyW4kLcsUeA1rj/
	MEE1foX105w5KwWr
X-Google-Smtp-Source: AGHT+IFAY2D8Rrohfjwwx4CO/Pw1UOKB8giV4JveEN3pJe9VdclFqqoHdlaE7Lpi/6z/72iQKhBLZQ==
X-Received: by 2002:a05:6214:c6e:b0:6e4:269f:60fd with SMTP id 6a1803df08f44-6e445681b9dmr4452146d6.23.1738872054565;
        Thu, 06 Feb 2025 12:00:54 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e443254399sm2524866d6.49.2025.02.06.12.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 12:00:53 -0800 (PST)
Message-ID: <4ea3574ffb1bad87de3593d468371afc7203f110.camel@ndufresne.ca>
Subject: Re: [PATCH] media: allegro-dvt: Moving the current driver to
 subdirectory
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Tretter	
 <m.tretter@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Michal Simek <michal.simek@amd.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Andrzej Pietrasiewicz	 <andrzejtp2010@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,  Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Gaosheng Cui <cuigaosheng1@huawei.com>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	 <u.kleine-koenig@baylibre.com>,
 Ricardo Ribalda <ribalda@chromium.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MEDIA INPUT INFRASTRUCTURE
 (V4L/DVB)"	 <linux-media@vger.kernel.org>, "moderated list:ARM/ZYNQ
 ARCHITECTURE"	 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 06 Feb 2025 15:00:52 -0500
In-Reply-To: <20241202102654.40472-1-yassine.ouaissa@allegrodvt.com>
References: <20241202102654.40472-1-yassine.ouaissa@allegrodvt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_120058_269331_5F87F661 
X-CRM114-Status: GOOD (  23.22  )
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

Hi Yassine,

sorry for the long delay, note that this set could not have been accepted, =
the
move should be submitted with the new driver.


Le lundi 02 d=C3=A9cembre 2024 =C3=A0 11:26 +0100, Yassine Ouaissa a =C3=A9=
crit=C2=A0:
> In preparation for the upcoming driver update, we need to realocate the
> current driver that is not maintained by us ( allegro-dvt ).
> This will help ensure a clean transition and avoid any potential
> conflicts with the new driver.
>=20
> This patch is crucial for keeping our directory organized and
> facilitating a smooth integration of the new driver
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
>  MAINTAINERS                                               | 2 +-
>  drivers/media/platform/allegro-dvt/Kconfig                | 4 ++--
>  drivers/media/platform/allegro-dvt/Makefile               | 8 ++------
>  drivers/media/platform/allegro-dvt/zynqmp/Makefile        | 6 ++++++
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.c    | 0
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.h    | 0
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.c    | 0
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.h    | 0
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.c    | 0
>  .../media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.h    | 0
>  .../{allegro-core.c =3D> zynqmp/zynqmp-allegro-core.c}      | 2 +-
>  .../{allegro-mail.c =3D> zynqmp/zynqmp-allegro-mail.c}      | 2 +-
>  .../{allegro-mail.h =3D> zynqmp/zynqmp-allegro-mail.h}      | 0
>  13 files changed, 13 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.c (100=
%)
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-h264.h (100=
%)
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.c (100=
%)
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-hevc.h (100=
%)
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.c (100=
%)
>  rename drivers/media/platform/allegro-dvt/{ =3D> zynqmp}/nal-rbsp.h (100=
%)
>  rename drivers/media/platform/allegro-dvt/{allegro-core.c =3D> zynqmp/zy=
nqmp-allegro-core.c} (99%)
>  rename drivers/media/platform/allegro-dvt/{allegro-mail.c =3D> zynqmp/zy=
nqmp-allegro-mail.c} (99%)
>  rename drivers/media/platform/allegro-dvt/{allegro-mail.h =3D> zynqmp/zy=
nqmp-allegro-mail.h} (100%)

There is no reason to rename these 3 files, moving them in a subdirectory s=
hould
be enough. As I understood, there is no plan to share anything between the =
new
and the old driver.

regards,
Nicolas

>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7292e4a1ddb8..d79efe6f8992 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -795,7 +795,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
> -F:	drivers/media/platform/allegro-dvt/
> +F:	drivers/media/platform/allegro-dvt/zynqmp
> =20
>  ALLIED VISION ALVIUM CAMERA DRIVER
>  M:	Tommaso Merciai <tomm.merciai@gmail.com>
> diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/p=
latform/allegro-dvt/Kconfig
> index 2182e1277568..9bc7e99788b8 100644
> --- a/drivers/media/platform/allegro-dvt/Kconfig
> +++ b/drivers/media/platform/allegro-dvt/Kconfig
> @@ -2,8 +2,8 @@
> =20
>  comment "Allegro DVT media platform drivers"
> =20
> -config VIDEO_ALLEGRO_DVT
> -	tristate "Allegro DVT Video IP Core"
> +config VIDEO_ZYNQMP_ALLEGRO_DVT
> +	tristate "Allegro DVT Video IP Core for ZynqMP"
>  	depends on V4L_MEM2MEM_DRIVERS
>  	depends on VIDEO_DEV
>  	depends on ARCH_ZYNQMP || COMPILE_TEST
> diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/=
platform/allegro-dvt/Makefile
> index 66108a303774..04727c5f7ef4 100644
> --- a/drivers/media/platform/allegro-dvt/Makefile
> +++ b/drivers/media/platform/allegro-dvt/Makefile
> @@ -1,6 +1,2 @@
> -# SPDX-License-Identifier: GPL-2.0
> -
> -allegro-objs :=3D allegro-core.o allegro-mail.o
> -allegro-objs +=3D nal-rbsp.o nal-h264.o nal-hevc.o
> -
> -obj-$(CONFIG_VIDEO_ALLEGRO_DVT) +=3D allegro.o
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-y +=3D zynqmp/
> diff --git a/drivers/media/platform/allegro-dvt/zynqmp/Makefile b/drivers=
/media/platform/allegro-dvt/zynqmp/Makefile
> new file mode 100644
> index 000000000000..a8ddb9cf93a8
> --- /dev/null
> +++ b/drivers/media/platform/allegro-dvt/zynqmp/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +zynqmp-allegro-objs :=3D zynqmp-allegro-core.o zynqmp-allegro-mail.o
> +zynqmp-allegro-objs +=3D nal-rbsp.o nal-h264.o nal-hevc.o
> +
> +obj-$(CONFIG_VIDEO_ZYNQMP_ALLEGRO_DVT) +=3D zynqmp-allegro.o
> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-h264.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-h264.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.c
> diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-h264.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-h264.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-h264.h
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-hevc.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-hevc.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.c
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-hevc.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-hevc.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-hevc.h
> diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.c b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-rbsp.c
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-rbsp.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.c
> diff --git a/drivers/media/platform/allegro-dvt/nal-rbsp.h b/drivers/medi=
a/platform/allegro-dvt/zynqmp/nal-rbsp.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/nal-rbsp.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/nal-rbsp.h
> diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/=
media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
> similarity index 99%
> rename from drivers/media/platform/allegro-dvt/allegro-core.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
> index e491399afcc9..8895d7755987 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-core.c
> +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-core.c
> @@ -31,7 +31,7 @@
>  #include <media/videobuf2-dma-contig.h>
>  #include <media/videobuf2-v4l2.h>
> =20
> -#include "allegro-mail.h"
> +#include "zynqmp-allegro-mail.h"
>  #include "nal-h264.h"
>  #include "nal-hevc.h"
> =20
> diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/=
media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
> similarity index 99%
> rename from drivers/media/platform/allegro-dvt/allegro-mail.c
> rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
> index aadc947a77ae..88a98f9e5d00 100644
> --- a/drivers/media/platform/allegro-dvt/allegro-mail.c
> +++ b/drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.c
> @@ -12,7 +12,7 @@
>  #include <linux/string.h>
>  #include <linux/videodev2.h>
> =20
> -#include "allegro-mail.h"
> +#include "zynqmp-allegro-mail.h"
> =20
>  const char *msg_type_name(enum mcu_msg_type type)
>  {
> diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/=
media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h
> similarity index 100%
> rename from drivers/media/platform/allegro-dvt/allegro-mail.h
> rename to drivers/media/platform/allegro-dvt/zynqmp/zynqmp-allegro-mail.h


