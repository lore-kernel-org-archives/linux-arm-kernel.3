Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F5ED111BA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 08:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmjx6zA4K8y+qr1LBwquRLGW8I8RIiLSEH4MjF5V3eU=; b=eDmbF5nUZp9e/NW5L8uEHHmxWW
	9JHOwJ4daRxIOzn0qv5dljlTKizzX+SeTzaZm/V3/35jArf0KVrIYAgQROXTUQRiSHP+MHe5dH7Ww
	ywV+qXd7zY3Sfqblw//ePaUP8oy4hUgJ0lmIiFZ8Tp3qo47oa5ZY+ex17azTuTbPllJbxuvfI7k3e
	sQpeKAHPpvqjLXAwtowd3NhSZ3/SyQN/U9dA3+MxsO6O8uBICrDLjoABnzdVfcKk04jSf8IYp7TMj
	3v69D1yjXzJRheQrHQQqD5GjT3czA5utYLN7+aBf5UxGLySWhiw7tFcr+z5iGL1C3bb7I6G310JnH
	gpantwZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7s84-0000000Cvf8-3dbo;
	Mon, 04 Nov 2024 08:08:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7s5H-0000000CvCv-0Cod
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 08:05:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so2372155f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 00:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730707509; x=1731312309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmjx6zA4K8y+qr1LBwquRLGW8I8RIiLSEH4MjF5V3eU=;
        b=iqkE2H0/qIv1xDA3ueJRsiTEB8MQphy8VaXU/LSe4hZC7I3LNQ1Oxak+6iGX5WwNHo
         Ujko9GRmf8ulOY0TC8hWQ6J+Tap0fHgEbJHmWeUt01uIejgiTlPh2Gvgs8h4l2tRaucx
         A9RlY/gxG7lQc923rTVzeD5JszesvdtxeCqWGKd5obOf6LPw/iOXQeblxbUXihlhK6QJ
         qlVYeoUuQqE00CG2pIJr12B+o9sOLe1zKJExKRkURM+zArCCquJbjc8NqjhJe6eeF3mv
         kdlIct62/jo/Ckn8725qvSlvS1NAO5gxGgS7XLDt0OZNH8HF3G7V0dYef+SXYri1WKki
         TU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730707509; x=1731312309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmjx6zA4K8y+qr1LBwquRLGW8I8RIiLSEH4MjF5V3eU=;
        b=jYkGcQz/qfFwBP4tWNay1HYBxMRV8dm4cKbV4tzTQlEP2A5S2bY84CFG5fYcT5Gyx/
         G1O5Ud6de5a39g148vo3U0MBoD0gRW3xSbuoMjd9tBQ8kyfu9EIAifA0MdBDOHGvW6/c
         tVQXHzSkOswQ64CerJ/sh//JF/5Qdj3St2G7Phw5VwQwwE9kOYhF7R+QWFylinsawSeV
         VkdOd4WiSXTA5aw/mHMlOVyFQguAo2nmokpTZPZlu/fU09XuvD6mqFHp+xk84DpCbieG
         JRd/M+++gGgrfbraQaXWPYk3Ovm4gD9ZHlQ3YfVKbb8D2j2iQROMgQkQsCFxoPsjXyox
         XL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0kaInc/bexD/4u7tFb6LYv/T+2fVAGS3iw4mOI2dSRgSXC98RqFSE2sxNK0qWNdSeQEZ3PmQpaBOZdHT6QQTk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywte62bJv/WK754V3pmBq4Ybx7MkVhqF7srJMl3WqSypDIst0J/
	X4z7ERcHTdneBxBla7pMZjBe4hq0LPk0eEGQfcVJltosePWTFisM
X-Google-Smtp-Source: AGHT+IGJZ1N0iKEAhj3LObQcIfZjoje2HIVVrTvS8omAzjtiJyXmwbcvyD/6ltNJYT44sT96drjLmQ==
X-Received: by 2002:a5d:4d48:0:b0:37d:49d1:1e89 with SMTP id ffacd0b85a97d-3806115ab56mr23099545f8f.27.1730707508506;
        Mon, 04 Nov 2024 00:05:08 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:58c3:98c7:13bb:aad2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d414csm12396504f8f.26.2024.11.04.00.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:05:07 -0800 (PST)
Date: Mon, 4 Nov 2024 09:05:06 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Shawn Guo <shawnguo2@yeah.net>, linux@armlinux.org.uk,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, elinor.montmasson@savoirfairelinux.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Message-ID: <ZyiAMpjmXuVMi5FX@eichest-laptop>
References: <20241030122128.115000-1-eichest@gmail.com>
 <ZyXTFhEm9UCBii2c@dragon>
 <ZyY41nJY9ghwe-Y4@eichest-laptop>
 <065268d6-84eb-4247-b834-40a9ff32c1f4@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <065268d6-84eb-4247-b834-40a9ff32c1f4@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_000511_121583_F4776442 
X-CRM114-Status: GOOD (  34.88  )
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

Hi Stefan,

On Sat, Nov 02, 2024 at 04:35:19PM +0100, Stefan Wahren wrote:
> Hi Stefan,
> 
> Am 02.11.24 um 15:36 schrieb Stefan Eichenberger:
> > Hi Shawn,
> > 
> > On Sat, Nov 02, 2024 at 03:21:58PM +0800, Shawn Guo wrote:
> > > On Wed, Oct 30, 2024 at 01:21:12PM +0100, Stefan Eichenberger wrote:
> > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > > 
> > > > Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. This
> > > > change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sound
> > > > card node properties") which moves away from the old "spdif-controller"
> > > > property to the new "audio-codec" property.
> > > > 
> > > > Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node properties")
> > > It doesn't look a fix to me.
> > I agree somehow, it was just that before the referenced commit our test
> > succeeds with the imx_v6_v7_defconfig and after that we get the
> > following error:
> > [   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-card: snd_soc_register_card failed
> this error should have been in the commit message including the
> information which platform/board is affected.

Okay, I will add this information to the next version. We see this error
on an Apalis iMX6 which has in my variant an NXP i.MX6Q SoC.

> > So maybe it is not a fix in the sense of a bug, but it fixes the error
> > message. However, I'm also fine with removing the Fixes tag.
> But this patch doesn't look like the real approach.
> 
> Could you please clarify the impact of the regression?

So the problem is that before commit d469b771afe1 ("ARM: dts: imx6:
update spdif sound card node properties") the audio driver was
using an implementation of linux,spdif-dit and linux,spdif-dir which was
directly inside the fsl,imx-audio-spdif compatible driver. Now with the
referenced commit the idea is to use the more generic linux,spdif-dir
and linux,spdif-dit compatible drivers. That's why this driver must be
enabled in the kernel configuration.

> Is it just this error message and audio works fine or is audio also broken?

It is not just the error message, audio is not working because the
driver deferes and because it is not enabled it will never succeed to
load. I don't know if this is called a regression, because the driver is
there it is just not enabled in the imx6_v7_defconfig. I thought because
a lot of the i.MX6 based board use the generic driver, it makes sense to
enable it in the imx_v6_v7_defconfig.

Here the output of git stat to show which boards are most likely showing
the same behavior as the Apalis iMX6 with the current
imx_v6_v7_defconfig:
git show d469b771afe1 --stat
....
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts          | 15 ++++++++++++---
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts          | 15 ++++++++++++---
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts         |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi       | 15 ++++++++++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi      |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi      | 15 ++++++++++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi      |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi    |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi    |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts      |  9 +++++++--
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi           |  9 +++++++--

Regards,
Stefan

