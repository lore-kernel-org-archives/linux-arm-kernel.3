Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D113C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 13:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Content-Transfer-Encoding:Mime-Version:To:From:Cc:Subject:Message-Id:Date:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyh+5zIYGxqp/78ZKPQYKhY1x7tgatZjFV3d8E4OiWk=; b=PLM9j7zywrZJSlzUzMQypWfrlT
	8fas+K5tf2czQe38HIEIgn/QiNz4SiCLhzZVq7WMXu80Ta+NI6cD2ZnROyF3vuFzZ7NvSnIx7L0tM
	fKb6ea5+zWbPwsKVlSNRZoj5+ABZnZyQnEEKkECBzaE8M7CrdEjVKEb0TQVdzqLUBm0DyNnwt+91g
	GL7ldyuuLteyfmryLlGBzkH8q97RkU3v8NBo+TngqEmun1ZYhXZmBb3Wk/I3fB0lH61Oz1Ncu9Hex
	jB0eD1FX1a8373IQoiyHToLTA3FQEgs4KE1OoCkKi55OzIzzek68CXFYaWpdSAeH1LNhqh08ImLRR
	ovSlI3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohhS-00000005Kcl-0CDD;
	Tue, 28 Jul 2026 13:18:26 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohhO-00000005Kau-1tww
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 13:18:24 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=dR9iiudjgExkdeow1Z6EoPkyeGEv5ki2UFYQ6JNfpjHbVS4LK4i2/HhO4o2ToS/Y25oTBtm8jOXp2hXsL15zNNjctUKebjMhp75ISz6dh7YEfy5XOcfbDm9ijIWgLY+pwHPv9aBDqBMWLw4WpFtnyh/o1A+ntiOqPvO2S/JbgLq3U/nAsiP5S1Pxgo377Xqibh1XsPBUYaJM/rPGz+5NCZbNltseSSSqexcpa1/xO5/WeR1IHM/IEHib7ylFWy4/kyWEU2UJ6o0uiQCAqJ/dp164dDnua9yCboD+vWp5Is8JGBfMTKTeV0/59gHhAAlnVvQ7kSAjlAntU2QE4nD/5A==; s=purelymail3; d=rcpassos.me; v=1; bh=k/0bgHTdGeiys2OlIJV0qG7DjpYC2Czq9ewKhCiKYM4=; h=Received:Date:Subject:From:To;
DKIM-Signature: a=rsa-sha256; b=ilj05tAFxt5IMxAIfuiA7RFAd0BEWl7iUxIgnodeOcbqdnqqfM+heIZg5NVsrCpN8kdBEj2SpYiXQ9GGMrvRKc3d5BEAqDXT+uOf8/JKo32yCoFztQ0eHLjqyyreYCwldNs7ZjImRil3SZeJMFDsxGfQKhglve45S2yV+EqcrYYoJRXYuMBYuQGgX5vqQ/Gd6PMZyjAtEoVSIs/FLt2muHn3l4JmyJvkklSLeYdcqODZkWMHRQcWEIYtJ4B3aVoBdblPBUbBvU+uylJOt3kQ2ZwPPLJIdLdLaJGsLDj31CtwU6MuEVgyiVmsz0NJTJMnBhJkTfOwyTHmhXZj6VPbRA==; s=purelymail3; d=purelymail.com; v=1; bh=k/0bgHTdGeiys2OlIJV0qG7DjpYC2Czq9ewKhCiKYM4=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1312514001;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 28 Jul 2026 13:17:52 +0000 (UTC)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 10:17:49 -0300
Message-Id: <DKA8F33O8HID.2UV2DWTLE6S48@rcpassos.me>
Subject: Re: [PATCH v2] Bluetooth: Properly disable remote wakeup for
 MT7922/MT7925 on Ryzen platform
Cc: "Luiz Augusto von Dentz" <luiz.von.dentz@intel.com>,
 =?utf-8?b?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
 =?utf-8?b?V2lsbC1DWSBMZWUgKOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
 =?utf-8?b?U1MgV3UgKOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
From: "Rafael Passos" <rafael@rcpassos.me>
To: "Rong Zhang" <i@rong.moe>, "Rafael Passos" <rafael@rcpassos.me>, "Marcel
 Holtmann" <marcel@holtmann.org>, "Luiz Augusto von Dentz"
 <luiz.dentz@gmail.com>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260701-btmtk-ryzen-remote-wakeup-v2-1-767ac7907472@rong.moe>
 <DJRKO72HWZOI.QJYJUAC45QOJ@rcpassos.me>
 <79D5F3E6-8F40-4422-BB2D-16691E377394@rong.moe>
 <DJRP3YO7Y0WK.20KNRZIMX1CYK@rcpassos.me>
 <F16A2A9A-A43F-45FE-8CC0-44A129360D47@rong.moe>
In-Reply-To: <F16A2A9A-A43F-45FE-8CC0-44A129360D47@rong.moe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_061822_580506_909FAA77 
X-CRM114-Status: GOOD (  13.89  )
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

Hi again,

On Mon Jul 6, 2026 at 4:39 PM -03, Rong Zhang wrote:
> Hi Rafael,
>
> Hmm, interesting. My speculation is that it doesn't matter which options =
are changed, but some changed options cause the BIOS to reinitialize someth=
ing. Does resetting the BIOS settings to default help?

I was unable to trigger the same issue again. It has been working fine
(even when running without your patch). I believe the reset with bios
config changes fixed it for good.


> Could you provide more details about your device's USB and PCI topology? =
Does the NIC's USB connect to one of the USB root hubs of the SoC (i.e., CP=
U) or the chipset?

I believe its a hub connected to the chipset.

/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/12p, 480=
M
    | ...
    |__ Port 008: Dev 004, If 0, Class=3DWireless, Driver=3Dbtusb, 480M

In the block diagram on the manual [1], Key "E" Wifi is tied
to the AMD PROM21 CHipset.


> And I guess your device runs into the issue without any precursor? Once b=
oot, try running the script below to capture more clues into dmesg, and wai=
t for the issue to appear.
>
>     #!/bin/sh
>
>     ddcmd()
>     {
>         echo "$*" | sudo tee /proc/dynamic_debug/control;
>     }
>
>     ddcmd file drivers/usb/core/hub.c +p
>     ddcmd file drivers/usb/core/driver.c +p
>     ddcmd func handle_tx_event +p

Thanks for the script! I'm learning a bit with it!

> I would do the below experiments if I had a buggy device like that. Some =
extra hardware is required though.
>
> Connect another NIC (w/ Bluetooth interface) to the same M.2 port after t=
riggering the enumeration failure, and see if the enumeration failure persi=
sts.

It is integrated (soldered) to my motherboard.

[1] page 10 https://download.asrock.com/Manual/B850M%20Steel%20Legend%20WiF=
i.pdf

Thanks,
Rafael Passos


