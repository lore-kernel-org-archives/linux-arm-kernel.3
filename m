Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22A2E63F12
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/cusOaB1RRkk5o1Oqtx1KMkhaZ63LZzGMA+5vMDafw=; b=mIKcsegRGyXCanyWUKVAG/6Z1s
	477403bc0/XVgXJzQ1BdSEgLrhJOXWA9mOMOuscW1H6sDR8P5iDeI3UKjhCYhLQJAfMU31I3ACab/
	rCA4K2l2O1leGUZDAsMegw/i1OVkO26bPiNB/ox46IuS35KEpeguPxZc+ck43xAsilXeZX7K/vwSp
	4nAkWcEtLcmfr3vIi7cOBaIUUDxpT5ZotiZKumG6YtGopj6UZ//vzpw72JFlzY68Jk1KyzTW7RpyO
	FAPpt5o+HOCzYpZfgmSSLLBO23MdMTcGWC38RAKbVsMsrvZlOqdczRsazWH5OY0fb/FBn7Yf/UDZ8
	zDI+65ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrjNR-00000005fEh-46hM;
	Sun, 15 Feb 2026 21:10:01 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrjNP-00000005fE3-23Th
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 21:10:00 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-649d589ab0fso277735d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 13:09:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771189798; cv=none;
        d=google.com; s=arc-20240605;
        b=gPRYTHefOCrpJewMGicUglCp/UUxl3HHM6nsCtjt0TbSxsVTLfzP83O5JNV4EGKjMs
         Fr83dgkmOp+HQkhcJcrc0XBBkQanO89Ih+sRinpQ2gZa1rGwIDy1SYsjTzudAVH+8LoR
         suKO+WfhriyviE5iu5HBiZ/pu2HVdlropokUvbKz5XpaaP9p1XBMrrsg54h3m1Z2shuo
         4VkI+Z6+LPqYRxoP9KkP0Du58bSN8k2dQjVJclJ+RBPPdqKaxNB9qys17DYWW9+ypcWJ
         ztYPJ6geKIWpU2e7muUUCKeNMD3iipp8nnr1RDt2ki/MJSr3iT3XRcypO9/RINFEibvl
         hDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8/cusOaB1RRkk5o1Oqtx1KMkhaZ63LZzGMA+5vMDafw=;
        fh=0EdIManzcwQNxVaJJTDVtYLxZb2ZdhOUK24JGvDS0Kw=;
        b=QCjhyEbYka6Q16ldZU+iCQTUByD4zV1EfaWJCN4J3bDuxapb7/0loMETKSVeiiL/0k
         auIkci/w1zftQ8FngW3/45tA5YalBxcJ2TE60zsgYmqSqDX3BpxBZjpvSMrlFVNAd36u
         0634NR4DFlRdI8Xi53AQUN2757MQzwSYKZ94qFIfjzqx4X0I/LQVUGwXX++Gu4gQ4ITt
         dP0Ablo7XFh625pdTCV916++2QhKGMoYjh8jRMxeju6pBvIUpGD50d2CXjApkkoXgYn+
         tGTQ6cMD+Oi1m8rlQQlExfpBTxwF5T3hBZfnJsD1IBPEX1LtNu/wKMn8uzLhTZRPo8mu
         CwCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771189798; x=1771794598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/cusOaB1RRkk5o1Oqtx1KMkhaZ63LZzGMA+5vMDafw=;
        b=BdlJAKSMcd21EG/ocnDodySmOdgQEzhJ19hY569jqO5yfuoAJlP9mJsto+20gnvgWF
         wpWzuPvm2p6U3t7/D2fwQYpZGqzZ5x/0jwZNHqdaiFza5UGBmEYWyn/pb/2ZtpyuOuPW
         30a1zmURObbOcorrGrTKGlbmZ8VvF2kUbCAy4PbxUd853OOaqGUS5RgAunsOqMjJRrA/
         xa5XJfre/d15wi6SXoyyakipoJvLlUyfyAeWS5XcEVBiug7zEZMd1ER2YurilKet3VGU
         K1wuSJyYCWo5LzWy4IrM+LfZ83rrzwAhNB5MJZ+NT7wDPPJSoC2wQFr9MKxWEGPmXt89
         P2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771189798; x=1771794598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8/cusOaB1RRkk5o1Oqtx1KMkhaZ63LZzGMA+5vMDafw=;
        b=cqO05/JbW/vk+LjY4cg9UDG1FB9I2/8AHhMmtbmKWRZ1BQx6LjdwGAbl/G5Me7IP5H
         Fwh/mP0IFMWGU5DsUe5J41D5v80/6Bz8RViTBtMI95EGFohMNMIy+FhZf6yfyjPTZiLn
         3x2InrAk2OGsZRcsIPgkA5Jn7vV5gzRoMM1d6wJunZW11vNHOKmzKfu7nGs/bkPxov8Z
         55nk7kGecwXh8TC6BEGrPYxW3VH3opQrR6Fq+8bd4ZSvrbaj0ULO7QmeiD+0rttcN9zk
         BXjYRY2T1zQ2J3HFgjEz61mgPaRLKxMZdYVGhDK3dxGcY96FP4rE9Uo9vTHVnw/Ptjbn
         PsOg==
X-Forwarded-Encrypted: i=1; AJvYcCWwostAGj4JPAPIVK6f/Cml4a+D0Mt1VTd11D+eyCEsIL7zc6oTyyYDasJH1e/hUVBoDZLXATFe1yjOl0qK2S4q@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx/+L7oopjY4B15DULI5l5epZ23CfWJmNYrlMMyAXDMZovfrrs
	P0uwRo8ao10+rOiJ+qq8xPRxh9CDesLuy5SJkvlCGiwxz4w+2NNCmIaX65tzoExY5+gqdwS5NOh
	X5DbZqHni8jNdKKsh4f9U+xa1QmZ6GD4=
X-Gm-Gg: AZuq6aLV7gTbSyJI6RIAS7Wwag3+OfC8UbxxLWPEhtk2OlKX8R+6FEHDLPn8wpAGJjM
	Yu9mcVZG5nBy96QuWxCyYdhk37GXWjj6ZIdIc+hlMGQU0Bo7viKXCyJug7fLn5VML+2LI44XHIv
	oZFHMMX15SeezTMcGENTlcHYRMyFUJCyWuX32ZfjmNKBTiFgIA/AOaZEc8BVBuY26gZ2+cDc6Pu
	I+NbVAZFgVk1IhlrMMImGDlXx5NWOcQoC8hTAAYTxs6186+g6DOx7DKE1s1EOf445JwyWzeQBA9
	P97BhZPizps6ZVw=
X-Received: by 2002:a05:690e:130b:b0:64a:e582:1df4 with SMTP id
 956f58d0204a3-64c14a7fd18mr6521389d50.2.1771189797555; Sun, 15 Feb 2026
 13:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20260215124125.465162-2-thorsten.blum@linux.dev>
In-Reply-To: <20260215124125.465162-2-thorsten.blum@linux.dev>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Sun, 15 Feb 2026 22:09:21 +0100
X-Gm-Features: AZwV_QhxXP3Z3j7FNL3hjVM3mHfb2bVg8Ao95qmXJAI_nCBLpkmUpk6NpESx19A
Message-ID: <CAFXKEHbCrp57ruvCF2TXXcnoJF93Z5bdUd7Nt5WtM9_abtc66w@mail.gmail.com>
Subject: Re: [PATCH] crypto: atmel-sha204a - Fix OTP sysfs read and error handling
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	stable@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_130959_555838_D9949B58 
X-CRM114-Status: GOOD (  28.45  )
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

Hi Thorsten!

I tried to verify your patch on hardware today, unfortunately it did
not work for me.

My setup works with current atsha204a module in the below described way. Wh=
en
trying to dump the OTP zone on exactly the same hardware with a patched mod=
ule,
it only prints '0' and nothing more, see below.

Pls, let me know, if I'm doing something wrong; if my usage is wrong or
if my approach is somehow flaky. Otherwise, could you please have a second
look at it? Note, my patch at the time emerged from a particular
use-case at work, it's
likely that it's not covering all OTP. So, if incomplete, I'd really
appreciate having it fixed.

In the following I provide some details on what I did today.

8<-------------------------------------------------------------->8
My lab DUT hardware:
- RPi 3b+ with an ATSHA204A shield via i2c, 3.3V
- ATSHA204a with a locked config; initialized OTP zone with some values
- Just enough to be readable i.e. verify OTP content

My kernel source base, since on a RPi v6.19 branch, built w/ aarch64.
Note, I'm building the module then out-of-source with a separate .dtsi
(I'm not showing all the boiler-plate stuff here).
$ git remote -v
  origin  https://github.com/raspberrypi/linux (fetch)
  origin  https://github.com/raspberrypi/linux (push)
$ git log --oneline -3
  e150a7a6d683 (HEAD -> rpi-6.19.y, origin/rpi-6.19.y) configs: enable
Si5351 i2c common clock driver
  3c957f9e74de pcie-brcmstb: move the unilateral disable of CLKREQ#
before link-up
  994331c6ea59 drivers: media: pispbe: Add V4L2_PIX_FMT_NV12MT_COL128
format support

From the bootlog
  ...
  [    0.000000][    T0] Kernel command line: coherent_pool=3D1M
8250.nr_uarts=3D1 snd_bcm2835.enable_headphones=3D0 cgroup_disable=3Dmemory
   bcm2708_fb.fbwidth=3D720 bcm2708_fb.fbheight=3D480 bcm2708_fb.fbswap=3D1
vc_mem.mem_base=3D0x3ec00000 vc_mem.mem_size=3D0x40000000  dwc_otg
  .lpm_enable=3D0 console=3DttyAMA0,115200 console=3Dtty1
root=3D/dev/mmcblk0p2 rootfstype=3Dext4 elevator=3Ddeadline fsck.repair=3Dy=
es
rootwait
  [    0.000000][    T0] cgroup: Disabling memory control group subsystem
  [    0.000000][    T0] Kernel parameter elevator=3D does not have any
effect anymore.
  [    0.000000][    T0] Please use sysfs to set IO scheduler for
individual devices.
  [    0.000000][    T0] printk: log buffer data + meta data: 131072 +
458752 =3D 589824 bytes
  ...

...current atmel-sha204a:
root@dut02:~/atsha204a-orig# insmod atmel-i2c.ko
root@dut02:~/atsha204a-orig# insmod atmel-sha204a.ko
root@dut02:~/atsha204a-orig# cat /sys/bus/i2c/devices/1-0064/atsha204a/otp
0001ED86032D0002154C033750FFFFFF20B0F703DB0CFFFFFFFFFFFFFFFFFFFF

reboot...

...atmel-sha204a with patch applied:
root@dut02:~/atsha204a# modprobe i2c-dev
root@dut02:~/atsha204a# insmod ./atmel-i2c.ko
root@dut02:~/atsha204a# insmod ./atmel-sha204a.ko
root@dut02:~/atsha204a# cat /sys/bus/i2c/devices/1-0064/atsha204a/otp
0root@dut02:~/atsha204a#
root@dut02:~/atsha204a# xxd /sys/bus/i2c/devices/1-0064/atsha204a/otp
00000000: 30                                       0
8<-------------------------------------------------------------->8

Best,
L

On Sun, Feb 15, 2026 at 1:42=E2=80=AFPM Thorsten Blum <thorsten.blum@linux.=
dev> wrote:
>
> Fix otp_show() to read and print all 64 bytes of the OTP zone.
> Previously, the loop only printed half of the OTP (32 bytes), and
> partial output was returned on read errors.
>
> Propagate the actual error from atmel_sha204a_otp_read() instead of
> producing partial output.
>
> Replace sprintf() with sysfs_emit_at(), which is preferred for
> formatting sysfs output because it provides safer bounds checking.
>
> Cc: stable@vger.kernel.org
> Fixes: 13909a0c8897 ("crypto: atmel-sha204a - provide the otp content")
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Compile-tested only.
> ---
>  drivers/crypto/atmel-sha204a.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204=
a.c
> index 0fcf4a39de27..793c8d739a0a 100644
> --- a/drivers/crypto/atmel-sha204a.c
> +++ b/drivers/crypto/atmel-sha204a.c
> @@ -15,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
> +#include <linux/sysfs.h>
>  #include <linux/workqueue.h>
>  #include "atmel-i2c.h"
>
> @@ -119,21 +120,21 @@ static ssize_t otp_show(struct device *dev,
>  {
>         u16 addr;
>         u8 otp[OTP_ZONE_SIZE];
> -       char *str =3D buf;
>         struct i2c_client *client =3D to_i2c_client(dev);
> -       int i;
> +       ssize_t len =3D 0;
> +       int i, ret;
>
> -       for (addr =3D 0; addr < OTP_ZONE_SIZE/4; addr++) {
> -               if (atmel_sha204a_otp_read(client, addr, otp + addr * 4) =
< 0) {
> +       for (addr =3D 0; addr < OTP_ZONE_SIZE / 4; addr++) {
> +               ret =3D atmel_sha204a_otp_read(client, addr, otp + addr *=
 4);
> +               if (ret < 0) {
>                         dev_err(dev, "failed to read otp zone\n");
> -                       break;
> +                       return ret;
>                 }
>         }
>
> -       for (i =3D 0; i < addr*2; i++)
> -               str +=3D sprintf(str, "%02X", otp[i]);
> -       str +=3D sprintf(str, "\n");
> -       return str - buf;
> +       for (i =3D 0; i < OTP_ZONE_SIZE; i++)
> +               len +=3D sysfs_emit_at(buf, len, "%02X", otp[i]);
> +       return sysfs_emit_at(buf, len, "\n");
>  }
>  static DEVICE_ATTR_RO(otp);
>
> --
> Thorsten Blum <thorsten.blum@linux.dev>
> GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4
>

