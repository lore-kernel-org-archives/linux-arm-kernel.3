Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF691C02187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 15:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ki3UxbLnk4PHDC41vZYF1ruM9tY2wjl13iVYeUH1NHY=; b=NkW69b1cA6omQw6M7QDNXf6A0j
	UbqtcihxH7V+1mJa111HwqBW03f+eSfBLFQpMrLG1rVDutv71nbPNUE55uJoP7p4pqbfeOCzShgfq
	znHvrqvmtur5ncmLnA2GwxOcgQH37bOjgDKc14mOg5hu+7+Xh5FuuCRRxxo9vQzGZITJ3gAHDRDKm
	Jay/yUjft9tXGXkQ2+uQG5+HO9ZAPMprugMCUZbZbvTzftnv4fNv0RfHiRg6tgAEfAfH9yvI08mF6
	U15li4LwgFwzpXDlKV6LsT2T8LnSilvcBcABI0N/5FTP11jJXaUWpHwLcHroqLLteEwjJZvzHRSNp
	9uMiPa0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZWsy-000000041ak-0JKG;
	Sun, 19 Jan 2025 15:06:48 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZWrf-000000041Ui-43pb;
	Sun, 19 Jan 2025 15:05:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1737299110; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bSXmu4WOTHRfKsrej9J3zsXOR6/Kbt1eyMB2N/o6py7VqQhue1UztLJrR8CvLzaqmf
    NANZ/G5dJhsFf+GKkwEo01Lv7oNbs0oNe+vpX+T29B7V3DSoKi9ox47NN8BNq8yhsfQo
    0p1StBHr7sBWW501cAokO0+CzQEYk7PZ4FZrAv6Mn3gdjHUUcSFmGJi+IW24qUDws09f
    3jRiSvtOzQOE4nMq0vqNYAwH5/AkLPeUzxv28zUIaVFao/SQI9nfk6h8PXgPoLRWkpMl
    OlneP9C53OCfUyGuJqcPFdf75j0Aos6Ob7ZehlN7alEjck3DtUqW5eJuKt69NCIM24DF
    n+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1737299110;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ki3UxbLnk4PHDC41vZYF1ruM9tY2wjl13iVYeUH1NHY=;
    b=i5rjdMAv3GZ8RydOUedYM+BfjUisUNGEcVZHwCxbmnhUpqPdRYF4xrzcvJfS1n3elS
    D2sfwUsyifAmG31mefUGycQCYFdXqu/sqAaiX64JyJ5NxCbCjaH/4ZM5p1fJiM5RHHRg
    qf/P9LcyOuYm6c4s1ZPeznc2qcDWPIJ+UhbFQTNjLB14IQKJHPazzKGx16z7++hBZGVM
    iVGK6lrYE9AsZcba2lPhSrIshtTtephmiRFcUlr0X+7AvAYboSFaOF+V//n/smm/ia9f
    zSMJMc5g04SPJ/Vz37xvtIICh2jj42+lI2moNPeMVEXedRb9ILqMF0zD2H/+mFaSrpBm
    cXVA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1737299110;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ki3UxbLnk4PHDC41vZYF1ruM9tY2wjl13iVYeUH1NHY=;
    b=f59fuqJOhq80fXEmX0sFflckjIM1m5tZKvKPmzZsUKqGWdRUqjLInek8CHFmXzBHvu
    xWcwfYh8TsY4NnYg5LWpENoDgXQIpbKN0CRMFCTW8yJD6vadgGT9Vw9dM3EtSucdnCQR
    tK/kM8t832OFa6g8ELbq5EHQeuGD9kYdgzizCNFqKYxVXvoQ5hcv1ysLo9VsBAZO/36b
    Rh/SUwvMG/1/YcynQnX5T/JwxOqNas9P3wp2qMXSZ3SvEXDrOCoKgmqn+5TguuuVqsRm
    EKAhbPl51yeTs9OmPEBdgl6x9NhGHDJFen9Le18p4WUeR/MoV2z5LuoZGNBj7PuziPeX
    78ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1737299110;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=ki3UxbLnk4PHDC41vZYF1ruM9tY2wjl13iVYeUH1NHY=;
    b=UrtWtyC7bYw4S06ht8+lbB7RjWsxMQF7HjdSiZiJUXAqfQKlVduNARsBtBqR+G+xOl
    kn5ODwTgxbva8sKAMxAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD4Z"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.21 DYNA|AUTH)
    with ESMTPSA id Qeb5b110JF5AjqT
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sun, 19 Jan 2025 16:05:10 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH v2] Revert v6.2-rc1 and later "ARM: dts: bcm2835-rpi: Use
 firmware clocks for display"
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <808a325f-81bc-4f5d-8c07-fa255ef2d25a@gmx.net>
Date: Sun, 19 Jan 2025 16:04:59 +0100
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
Message-Id: <8F33BB1D-2210-421B-A788-8484C23DF4C6@goldelico.com>
References: <cb9e10dfb4f50207e33ddac16794ee6b806744da.1737217627.git.hns@goldelico.com>
 <808a325f-81bc-4f5d-8c07-fa255ef2d25a@gmx.net>
To: wahrenst@gmx.net
X-Mailer: Apple Mail (2.3776.700.51.11.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_070528_508109_388B6592 
X-CRM114-Status: GOOD (  12.71  )
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

> Am 19.01.2025 um 01:36 schrieb Stefan Wahren <wahrenst@gmx.net>:
>=20
> Hi,
>=20
> Am 18.01.25 um 17:27 schrieb H. Nikolaus Schaller:
>> This reverts commit 27ab05e1b7e5c5ec9b4f658e1b2464c0908298a6.
>>=20
>> I tried to upgrade a RasPi 3B+ with Waveshare 7inch HDMI LCD
>> from 6.1.y to 6.6.y but found that the display is broken with
>> this log message:
>>=20
>> [   17.776315] vc4-drm soc:gpu: bound 3f400000.hvs (ops =
vc4_drm_unregister [vc4])
>> [   17.784034] platform 3f806000.vec: deferred probe pending
>>=20
>> Some tests revealed that while 6.1.y works, 6.2-rc1 is already broken =
but all
>> newer kernels as well. And a bisect did lead me to this patch.
> I successfully tested every Kernel release until Linux 6.13-rc with =
the
> Raspberry Pi 3B+, so i prefer to step back and analyze this issue =
further.

Yes, I would be happy with any solution.

> What kernel config do you use ?

a private one which enables application specific drivers.

> What is the value of CONFIG_CLK_RASPBERRYPI ?

CONFIG_CLK_RASPBERRYPI is not set

I checked where this is defined and it is in bcm2835_defconfig and
multi_v7_defconfig by

4c6f5d4038af2c ("ARM: defconfig: enable cpufreq driver for RPi")

which hides this requirement quite well and got therefore unnoticed...

Setting CONFIG_CLK_RASPBERRYPI=3Dy makes HDMI work without my proposed =
revert.
Tested with v6.2.16, v6.6.72, v6.12.10 and v6.13-rc7.

BR and thanks,
Nikolaus=

