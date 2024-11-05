Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7648D2B932
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 14:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SBKGTrlLTDQIGERPKwoCpnmjiyE6/uKRwA3Oxcr3bRg=; b=fkFVky/8RCJrA8yZ31WTSDLBbT
	XtUPntIibvAaIVQtmxOUJW+XTJ+vgwqEzk0xfN9YL3+4uYktXtJ0OhFjB6FVpgrl4dL6OaIC81UWk
	1S2w+C0Amjw2b9fuBnvNY/g75QsS1O/CYSQHKB39AJOeE35eyIJkv4GCkxYrxWZkjlhsN2Q9ZPGn3
	CGBXcHmLpPPu5uR1n4W5R0/pJTuKfrIyeETX6m5FuZYGBpZGn+6BusOJtdYElWzTLnFdcDAFYk0hy
	FjjD6U4Tw7OIcFkz4NzIpBhE3v1Ss4/3Pnq0SbOv5m6phBG095RaM5fUQGeyfIjbz1pQ7RRrMH/ad
	steSiNgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KbI-0000000HH8C-2RHb;
	Tue, 05 Nov 2024 14:32:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8K4p-0000000HBwD-2ATB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 Nov 2024 13:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SBKGTrlLTDQIGERPKwoCpnmjiyE6/uKRwA3Oxcr3bRg=; b=ZcWNKrbn8h5z7Q1m1wfanGgPMt
	QrakaBV5faEOnnTNN5PZsp/eTPL/4jzSf44b/ifwjcCTtA3wid0qq1T1UGaSq9NNvnpCa4uk48W5E
	6qJ0qzg46cbXRbUzajkbnXXPDLhX2LuwP+R9p31kQyX8IAPVbSE6DRYDh4unITXeqVQO+ACpjcXhC
	6L2QYjeA9G8Qs8twWDXCMl2knC6Ybq2lz5OGzssOZo+ZxFQnU4pM1eTVXYG6CwW+Ag6+x5dNuXv5y
	0d2FMlKMukwy2nenmUKLp5gSQoJUr+nMavGZS4839d88Ka0Ofd9SVxMBTOpMrZGwcvqnJUhmsiAOw
	nIn4rybA==;
Received: from mail.savoirfairelinux.com ([208.88.110.44])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8K4m-0000000BlHB-1CcA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:58:34 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 74F009C5794;
	Tue,  5 Nov 2024 08:58:19 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id VBzwaD1mWAko; Tue,  5 Nov 2024 08:58:18 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AF3679C63E4;
	Tue,  5 Nov 2024 08:58:18 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com AF3679C63E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1730815098; bh=SBKGTrlLTDQIGERPKwoCpnmjiyE6/uKRwA3Oxcr3bRg=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=vvEjIjNZBE+9/GzVkprdX13JfbvyhVjnJCzZZHS3fU3uJQu1pU0KybGYrg2m6z6co
	 uMwJY9KT7NrXacgCmFv1V6myU7JtG4Y/TMiNRX6bB7wobei8Cvy88/0nCGTg3qhiZC
	 sR2j3RsfVHtUwlkM5Qi+GPyvHez+nIllMlBgM3BlLcv1Gnot+M8G2jSmZJZ2+Nr5gw
	 cgbRtOyqTUJ3CT6Xq8waGPGWX5MOCz6UwOrP1KekXYe2YTsY9a4mmeQEQOORUcoqmH
	 qptzEcWOlWAqpYzeMJ9+mFcPYryr/HqZaF/ADF783b2T5GUJ6lkxNsWliGA6RX6Rwe
	 JS/0pT5GRBwfA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id xvHjvFmXB96q; Tue,  5 Nov 2024 08:58:18 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 762169C5794;
	Tue,  5 Nov 2024 08:58:18 -0500 (EST)
Date: Tue, 5 Nov 2024 08:58:18 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Shawn Guo <shawnguo2@yeah.net>, 
	Russell King <linux@armlinux.org.uk>, 
	Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	imx <imx@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Message-ID: <1044800423.57572.1730815098440.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <Zyj0VsTJ2qDHiss2@eichest-laptop>
References: <20241030122128.115000-1-eichest@gmail.com> <ZyXTFhEm9UCBii2c@dragon> <ZyY41nJY9ghwe-Y4@eichest-laptop> <065268d6-84eb-4247-b834-40a9ff32c1f4@gmx.net> <ZyiAMpjmXuVMi5FX@eichest-laptop> <787b45a1-9f8d-493d-8930-e1c8d396c818@gmx.net> <Zyj0VsTJ2qDHiss2@eichest-laptop>
Subject: Re: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112 (Linux)/8.8.15_GA_4581)
Thread-Topic: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Thread-Index: du0Xtk0rWav2/sd22e8hfQbQ+0Eh0A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_135832_667891_EF2889EC 
X-CRM114-Status: GOOD (  45.46  )
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

On Monday, 4 November, 2024 17:20:38, Stefan Eichenberger wrote:
> Hi Stefan,
> 
> On Mon, Nov 04, 2024 at 12:39:40PM +0100, Stefan Wahren wrote:
>> Hi Stefan,
>> 
>> Am 04.11.24 um 09:05 schrieb Stefan Eichenberger:
>> > Hi Stefan,
>> > 
>> > On Sat, Nov 02, 2024 at 04:35:19PM +0100, Stefan Wahren wrote:
>> > > Hi Stefan,
>> > > 
>> > > Am 02.11.24 um 15:36 schrieb Stefan Eichenberger:
>> > > > Hi Shawn,
>> > > > 
>> > > > On Sat, Nov 02, 2024 at 03:21:58PM +0800, Shawn Guo wrote:
>> > > > > On Wed, Oct 30, 2024 at 01:21:12PM +0100, Stefan Eichenberger wrote:
>> > > > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>> > > > > > 
>> > > > > > Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. This
>> > > > > > change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sound
>> > > > > > card node properties") which moves away from the old "spdif-controller"
>> > > > > > property to the new "audio-codec" property.
>> > > > > > 
>> > > > > > Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node properties")
>> > > > > It doesn't look a fix to me.
>> > > > I agree somehow, it was just that before the referenced commit our test
>> > > > succeeds with the imx_v6_v7_defconfig and after that we get the
>> > > > following error:
>> > > > [   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-card:
>> > > > snd_soc_register_card failed
>> > > this error should have been in the commit message including the
>> > > information which platform/board is affected.
>> > Okay, I will add this information to the next version. We see this error
>> > on an Apalis iMX6 which has in my variant an NXP i.MX6Q SoC.
>> > 
>> > > > So maybe it is not a fix in the sense of a bug, but it fixes the error
>> > > > message. However, I'm also fine with removing the Fixes tag.
>> > > But this patch doesn't look like the real approach.
>> > > 
>> > > Could you please clarify the impact of the regression?
>> > So the problem is that before commit d469b771afe1 ("ARM: dts: imx6:
>> > update spdif sound card node properties") the audio driver was
>> > using an implementation of linux,spdif-dit and linux,spdif-dir which was
>> > directly inside the fsl,imx-audio-spdif compatible driver. Now with the
>> > referenced commit the idea is to use the more generic linux,spdif-dir
>> > and linux,spdif-dit compatible drivers. That's why this driver must be
>> > enabled in the kernel configuration.
>> > 
>> > > Is it just this error message and audio works fine or is audio also broken?
>> > It is not just the error message, audio is not working because the
>> > driver deferes and because it is not enabled it will never succeed to
>> > load. I don't know if this is called a regression, because the driver is
>> > there it is just not enabled in the imx6_v7_defconfig. I thought because
>> > a lot of the i.MX6 based board use the generic driver, it makes sense to
>> > enable it in the imx_v6_v7_defconfig.
>> okay, thanks for the clarification. From my understanding
>> imx6_v7_defconfig is just an example config for testing. All possible
>> users of these boards might have their own configs and stumble across
>> the same issue. So I thought it would be better to add the dependency in
>> the Kconfig of the FSL audio driver.
>> 
>> I'm not that audio driver expert and don't know how the dependency
>> handling between the FSL audio driver and the required codecs like
>> SND_SOC_SPDIF. So it's possible that I'm completely wrong here and your
>> approach is the best we can do.
> 
> That might be a good point. I don't know how this is usually handled.
> @Shawn and @Elinor, do you think this could be an approach to make
> SND_SOC_FSL_ASOC_CARD select SND_SOC_SPDIF? It already seems to do this
> for SND_SOC_WM8994 and SND_SOC_FSL_SPDIF.

SND_SOC_FSL_ASOC_CARD will compile the machine driver fsl-asoc-card,
SND_SOC_FSL_SPDIF the CPU DAI driver fsl_spdif for the SPDIF
and SND_SOC_SPDIF the codec drivers spdif-rx and spdif-tx.

In my commit series I made SND_SOC_FSL_ASOC_CARD select SND_SOC_FSL_SPDIF
because the old machine driver previously compiled with SND_SOC_IMX_SPDIF
selected SND_SOC_FSL_SPDIF.
But because fsl-asoc-card is a generic driver, it could be used on a system
that doesn't have an SPDIF device, and therefore should not require
SND_SOC_SPDIF nor SND_SOC_FSL_SPDIF.
So maybe it is not a good idea to automatically select SND_SOC_FSL_SPDIF or SND_SOC_SPDIF.

On the other hand, if every imx6 or imx7 boards have an SPDIF device, then
I suppose SND_SOC_SPDIF can be put in imx_v6_v7_defconfig.

Regards,
Elinor

