Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7469C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOd/wQclXu4wS6VTQ3uZHgoG3iZXR/9baSy6qU4XdB0=; b=RehDRcSHLqQ/fcNUTwc/l6dM0m
	6z9EX8NSBy8DgC/nzNVjqA2ymvxLqDUq/F9prr8p34du8vBUOsboEy8tgAMVQRQUxegR8237I0YIe
	29LadZOSmwdVASC63lUX2ubMp5Mk4FS6Tkr9S7F36M0H17BHfo9iTvJzy2Dr1wuvi6H20grkwxViG
	S0w4RYpIKa27qM4pGu1joBReCd8xZxmMfjSHURyKCe3bpQ21ZcBaM2OWOOYplibx+VEcN9ARnv+2g
	Crlb4MX/NeYNd5E54tDGC1WpTyxKX95/OCGRsdeq9OgsueItJTLR5r58vYVay6oatp62voW+0I7xw
	jr4ecc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taxs2-0000000CZcR-00Sm;
	Thu, 23 Jan 2025 14:07:46 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taxqj-0000000CZVc-0xRM;
	Thu, 23 Jan 2025 14:06:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1737641165; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pezeV67NOa+Ck54l4xdGEkvA+MHAlJVPr3imSuDz8T/3Qiio26PCszv8kp30eLejQf
    5sNr26qOZMb3KZ3nJacN4H3ybOebEyd94/X5tjczpKUJZ5dVBYMBrlKfpBQ/vobQHpZN
    NxNQ3+qAgpR37d8/ZsalWr0XBtus/syQeT5UdTUYJ2EK2Li/cdhFLMSFgLm1r2PjGpjw
    JcF5wCxYylDMLGpV9TDoGs0K2KLB2Hvg5SBfTGczA2+1ynaamTWIRUQ3AtKRqvcMt8Z6
    oaegj0XBcso/G4NGEpxwJFD66W8BEOAKBcYVFSowlW2Ek2ls/r/yL+L527JhA/0w6ppF
    ca4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1737641165;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qOd/wQclXu4wS6VTQ3uZHgoG3iZXR/9baSy6qU4XdB0=;
    b=QA+pUGvdHmMAXj8O6DpShJ2E5fuaYAAt3yg4LGfFKHabLCDhXnE1Tl/LnavudffB62
    NjEVeAK4MCMr2KKqJzsFxynDLbFAlw3DXBrXjBOXZEF//lE8TygyDg7VOvKbbPzGqp4f
    RQp8eLSjbNZpxD2QDHvWe0Z6D0wA2fgsRj4SKpzR0OCYGlGnmT6bFnEPIICEV7K6JGcq
    OocepOZwCEWgkvdep87ife1c4xONig6Hv58q/LyMTByevQLaI0wI6tvd0GQxRKgU94aW
    S8M6xxMneL2NkvyTvjM1XY+U7jLGPfAQhYsyrwmeEa/Grgfa02oRYDoqe83+zxJkSuLg
    H9oA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1737641165;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qOd/wQclXu4wS6VTQ3uZHgoG3iZXR/9baSy6qU4XdB0=;
    b=FUxSx0a3fR8UcEMZ8MIpTqTmZxDIUsz9ihtWkb3TXrF/D+koYIdl2pdRltxA4eVogC
    aG2sI3q1ULsomrRZ16U7zuYbzh0jeGnk0tieWJmMAHE7JSmX5L0B9i/fzdkT2cxBFvzF
    XPtWHtJXeSztAklfxWnmKk4PvOmVY3NiTu0rmJ6qo9yhz39ik3Mci9zs4jQhhm7hyKY0
    JA4rjHNLvnkOzuQZp66umHXrrN4L7txDIfL9JJn3++UrVx4aUdMZrMmWZ4OpEsDEiJkY
    1hmqLcuNGIT02tkiKRFHLdQ16UQd14uonSAUHaYNRA7+NkG/cjEruHMptrEVqyW7o6sE
    Fwcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1737641165;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=qOd/wQclXu4wS6VTQ3uZHgoG3iZXR/9baSy6qU4XdB0=;
    b=HhTmBpAFmaZglcpbu8bA+TdnnwzTbi+y7OU/VLuGu/TnI2MjUHHmjKxkCZFWNYVyQi
    S1DZsGz6e2AxkuL446AA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeToZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.21 DYNA|AUTH)
    with ESMTPSA id Qeb5b110NE649yj
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 23 Jan 2025 15:06:04 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH v2] Revert v6.2-rc1 and later "ARM: dts: bcm2835-rpi: Use
 firmware clocks for display"
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <5221f64e-fda4-4daa-add7-1d0b26765113@broadcom.com>
Date: Thu, 23 Jan 2025 15:05:53 +0100
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D6C59720-57A3-4EE0-A78C-F259F8906C0D@goldelico.com>
References: <cb9e10dfb4f50207e33ddac16794ee6b806744da.1737217627.git.hns@goldelico.com>
 <808a325f-81bc-4f5d-8c07-fa255ef2d25a@gmx.net>
 <8F33BB1D-2210-421B-A788-8484C23DF4C6@goldelico.com>
 <5221f64e-fda4-4daa-add7-1d0b26765113@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>
X-Mailer: Apple Mail (2.3776.700.51.11.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_060625_534662_BAD7FF31 
X-CRM114-Status: GOOD (  14.71  )
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

> Am 20.01.2025 um 17:34 schrieb Florian Fainelli =
<florian.fainelli@broadcom.com>:
>=20
>=20
>=20
> On 1/19/2025 7:04 AM, 'H. Nikolaus Schaller' via =
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
>> Hi Stefan,
>>> Am 19.01.2025 um 01:36 schrieb Stefan Wahren <wahrenst@gmx.net>:
>>>=20
>>> Hi,
>>>=20
>>> Am 18.01.25 um 17:27 schrieb H. Nikolaus Schaller:
>>>> This reverts commit 27ab05e1b7e5c5ec9b4f658e1b2464c0908298a6.
>>>>=20
>>>> I tried to upgrade a RasPi 3B+ with Waveshare 7inch HDMI LCD
>>>> from 6.1.y to 6.6.y but found that the display is broken with
>>>> this log message:
>>>>=20
>>>> [   17.776315] vc4-drm soc:gpu: bound 3f400000.hvs (ops =
vc4_drm_unregister [vc4])
>>>> [   17.784034] platform 3f806000.vec: deferred probe pending
>>>>=20
>>>> Some tests revealed that while 6.1.y works, 6.2-rc1 is already =
broken but all
>>>> newer kernels as well. And a bisect did lead me to this patch.
>>> I successfully tested every Kernel release until Linux 6.13-rc with =
the
>>> Raspberry Pi 3B+, so i prefer to step back and analyze this issue =
further.
>> Yes, I would be happy with any solution.
>>> What kernel config do you use ?
>> a private one which enables application specific drivers.
>>> What is the value of CONFIG_CLK_RASPBERRYPI ?
>> CONFIG_CLK_RASPBERRYPI is not set
>> I checked where this is defined and it is in bcm2835_defconfig and
>> multi_v7_defconfig by
>> 4c6f5d4038af2c ("ARM: defconfig: enable cpufreq driver for RPi")
>> which hides this requirement quite well and got therefore =
unnoticed...
>> Setting CONFIG_CLK_RASPBERRYPI=3Dy makes HDMI work without my =
proposed revert.
>> Tested with v6.2.16, v6.6.72, v6.12.10 and v6.13-rc7.
>=20
> I have been burned before by something similar and came up with this =
patch series that I should resubmit after addressing Conor's comment:
>=20
> =
https://lore.kernel.org/all/20240513235234.1474619-1-florian.fainelli@broa=
dcom.com/
>=20
> Essentially, it removes the guess work, all you have to do is enable =
CONFIG_ARCH_BCM2835 and it just works, which is how it should be IMHO.

Sounds like a good idea!

Supported-by: H. Nikolaus Schaller <hns@goldelico.com>

BR,
Nikoalus


