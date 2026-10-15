Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A65CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 21:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmU7byQJ7V4GqxfEroCMT0quvOeWGZm1zt5/8tVd594=; b=rNiiA9nbOps9PtEy9Gful4ITz5
	Jnx9zoQe3I1eDHOKAc4u/ub1HYn0umju6HId7k8QkJTGe5aj1EloYL69Wmyi6uCTbIBUA+GdYW5Bb
	eKbDX4URhcnKXF/QzOPdSGiLUG3E5jrA3fA7OFwg/CsLlZTdvlPXspcKVKxJ8lIxeadrQ2GqNhdgK
	8D530tl95OW6xzD065xwxxRA2oQYUeJgstJeALbK78ucj7yat6i5ASCtXitWtaSrEJKD4iYD/qI4y
	WobUtg+TGgqL3wyOXQd1xAloB0Aj2oxwWES9Ta8k+lcezHV3H+YZfHHKiIma97OcuNvnPh0qeFSPm
	VI0gtfDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSxU-00000001Qr0-1Btl;
	Thu, 15 Oct 2026 21:25:52 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHSxR-00000001QqW-24Tr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 21:25:51 +0000
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-5d866bac1caso179601e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 14:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792099548; x=1792704348; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hmU7byQJ7V4GqxfEroCMT0quvOeWGZm1zt5/8tVd594=;
        b=P5ulBU6QXHYIHV1UQXf9kmsIlKAonb6mq5QbHL2Gq6Jw2y5keMLN87Ppqc+NGttVsf
         l/4T8uxV2KWt96wa1q66KSiBmiozsDg/hBwuYFUaCT51rwK7i4stRVlrm4H7bv46JjW+
         wGyFeRf9jscX84qCszvBRGe7pKTBk7zdUkPhYOTynlQpweQFYtsO9Os1qT9HFAUZ/uQp
         I1D+QirvRdo9z7AOz+ycuOV1tEJaeZoPE8lcrZF/U/LP4lTVK1SQib3QLq/z4z5ctClY
         zBl0RHBo1jm+2zvR9V+Dj1qiOUxfLUEOmKM4YigqQWnGzacSWSkUVPOOnk1fO7lYeFc5
         +SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792099548; x=1792704348;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmU7byQJ7V4GqxfEroCMT0quvOeWGZm1zt5/8tVd594=;
        b=jqQfcNCx8XKThjhFxZR8u/+SB94ARldz5yN6gpoMJ13OZO2SR6W3Qwj9OQy4hS3+Vc
         7wozejQhqVIWYu0oTbKJusPlr0rvPDlWw8kn2D+MfAz/UTxoLADDrraCz7PCSuPWAWop
         7csYrA4zl1mlcWGguq+RiECdYYsS+vk9050zlhCwOTwHTePn6HLnyaKGMDflw+gnk4rk
         9BL8CbbaMcv9osi93cafZ2bhaqBtDATzwQMTz+z1K9sJNruL4yISKpUoAJqOJbEbQ3Ld
         65gblA9mIyCts7k8iBQ6ICpjjqLF/QjZT0ewHvsnSuFKrTIm69jGieRWEthCP3FX/imK
         sJ8g==
X-Forwarded-Encrypted: i=1; AKwUvByjopex7zfUY1xmamYFjbRZm6VNNZf4rpsYAG3BJbVoP+LW4C3xjs4Ytme2A4HB163aQt/v0di41QRW1PdZuuQH@lists.infradead.org
X-Gm-Message-State: AFq9FYKCcZn245oaIx5tj+rPAkHZdObHIc9Xp2qhYRH8y2Jk/XjQctbI
	GrvUv1isGpNR3aB2D+NRwsb3YcXhXlxzFxLRygCIeT1rPOpI4N1hcAmP
X-Gm-Gg: AYBFou1saPhysM5OOoz8Te2ZCqZ7HeCpMJmDq0NEWykdNrpKFyPurN63dZmbscfRKzB
	TRKjRhxgQ0ZW2cNC3LIeA9IhjINR/S4wff9u9syQQ1pT2Rx2KSffNJBi8MGjzNHeGNqO8Kv49eh
	+EhWWGPfbgPPdZJy7vwop3t6sCFz8RkdVzuN4HCFbdOvQzegzWToqNc+lmiBL5GvzixGGZH32T8
	ST0pxrTgECnjwRRi4lj7XpEnMe9+rt0gMJPem38iSS85bCEuQlT4BsQVGHJXUV5uE7cAxqpCxFF
	Edei+N/SsUz+kp4eFdaAyJiezvGSVweCLaW4G+qndB3u0GVd4aplY8DJ4McB0MoLT2WZZabrAzN
	nMR8eP8Tqj8kB3dYmNk43leZH2fFE6hV64asI30CABzE2Ci0U+ALvSoVVxckX3Io+G3VhZHx6qI
	jxFwDG8HhRIiVgk27afIbHuy15oFZSmCoC9ipL80lub+qAC7a7lVlPucbIFZWwLBPLOw==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr3032400e0c.4.1792099547922;
        Thu, 15 Oct 2026 14:25:47 -0700 (PDT)
Received: from localhost ([2802:8012:9f:dd00:c85b:fc61:635f:8eeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b53cfdfsm190902e0c.15.2026.10.15.14.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 14:25:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 18:25:40 -0300
Message-Id: <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
Cc: "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
From: "Gaston Gonzalez" <gascoar@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>, "Florian Fainelli"
 <florian.fainelli@broadcom.com>
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu>
In-Reply-To: <20261013131435.1454019-1-martin@wetterwald.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_142549_541820_818B560C 
X-CRM114-Status: GOOD (  21.72  )
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

On Tue Oct 13, 2026 at 10:14 AM -03, Martin Wetterwald wrote:
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first:
>
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
>
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
>
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
>
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Link: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R=
272j6Bs4tg@mail.gmail.com/
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio=
5R272j6Bs4tg@mail.gmail.com/
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>
> ---
>  drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/d=
rivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> index e78641703252..d35f5ac5c2e2 100644
> --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> @@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
> =20
>  	return ret;
>  }
> -module_init(vchiq_driver_init);
> +subsys_initcall(vchiq_driver_init);
> =20
>  static void __exit vchiq_driver_exit(void)
>  {

Hi,

For Raspberry Pi Zero v1.3:

Tested-by: Gaston Gonzalez <gascoar@gmail.com>

Test setup:

- Branch: patch manually applied in staging-next over commit ec1ecf4f23c5
- Setup: RPi Zero v1.3 connected to a HDMI monitor
- OS: standard raspbian with the desktop environment enabled
- Driver built both as a module and built-in.
- The following command was run to test the sound: 'speaker-test -t wav -c =
2'
- Result: Both HDMI audio channels worked correctly

I=E2=80=99d be happy to run any additional tests if needed.

Regards,

Gaston

