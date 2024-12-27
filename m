Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153D8E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PyomLjC4gCAjT0BUc9AKZCFHN6mwrKW/btrs3iFwBNo=; b=JtTgFhMwxeikeAyxXoVCF1kE50
	mvVE1f25cPMTGLwCHr79pQoW43EMxxEc+tNkU7z014y3UdJqdXjtHiX7PsJDlC/7HFxyxtupkSNhH
	Rwm9DTgytVHmzOnYyqGWuY3xaYxfE1IqcO4eFfaYgAk9+cdLg+lUKduhT/9hdjuvzhW6d9lcdoqdW
	0tAktNn1YD8nQkjYRHiNrMEU38+eFnO78alWiYBzJ4wjpQTn1GMpicGd0ZGIk7OnY9EGHVgvSKM8D
	Oo1vxQ7G6SDBmXw/13oW99HAe4T5a9IyOsS8FuNdSLoRHLGfm5rdX6yM9Q4+sVgiALgygoulA4bVs
	bp5pp+Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9iZ-00000000C11-2G7i;
	Fri, 27 Dec 2024 12:45:27 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9hN-00000000Bvm-2ih0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 12:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1735303445; x=1735908245; i=wahrenst@gmx.net;
	bh=PyomLjC4gCAjT0BUc9AKZCFHN6mwrKW/btrs3iFwBNo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WKZXsYHc8CPOUSGZb1VPOspkj1tDQ3AsJwDkImwtim2unYPLCTgRO4xTPzT/8p8J
	 qeBg9JSYXtf2NDwIXO+9Xq6voiggCcdruA0H8R0mLP0De4cYgdiOhAY3EYDQzhMu0
	 HPvCUwaZsXdL1oZ71eB50S4f9PbBF6qLDlgwr7TIy0h/LrgSpDXtJ9DOJ0c17YjWT
	 1TbBOKhSLIrLueBJeM3tqjLoSyab2Pit5knDGjDxQUJBuLYxfMNNemPMTmp8jn2Za
	 VbcgaenTm+dX7RC5X7Fv3Xn94toSW6/f6ETw0f/zJdwJLQpi9Xx/JScx6QtPUTjRg
	 dD1bn3riMW8KwHQtTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.106] ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZTmY-1t3Z6g391i-00XJoC; Fri, 27
 Dec 2024 13:44:04 +0100
Message-ID: <ee21345c-6baa-45fb-8807-1c836ac36963@gmx.net>
Date: Fri, 27 Dec 2024 13:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jim Quinlan <jim2101024@gmail.com>,
 Jonathan Bell <jonathan@raspberrypi.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kernel-list@raspberrypi.com
From: Stefan Wahren <wahrenst@gmx.net>
Subject: pcie-brcmstb: failed to enter low-power link state (L23)
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v/LaoVZQ9BAqoBKQatNtkQ4H7/3XC85d3oYamDviLkstt6bg+LK
 Y+b7RpmxUm98vZFDiQbDDXQ2Ww022Neat9tqsvrETZux06phDPoklgf9+2ElK4HlsRGfqCr
 gr1GJ/qlDI72cCUmTXqAIa/PGqMIU/JyzUyHARig7+5G2l24B4S9RxGEpdGX807IJ7ePio1
 rXvhAOVi8flMWvdU8Iglw==
UI-OutboundReport: notjunk:1;M01:P0:AEBP9bjECZI=;c/UaXNOEsuBAbyNuot4GkNaqgOE
 qgdkVpc1ij0iB5tJ0TS+XpocWVMP4ojRd13Hbh5P+vgJt40RAHiCIShSnQJrCVbsU3ylbJFlG
 P06NdvOP0amKCMFpSIrFWqLCcBnIdGI4QmRap3d0PJVUxvB/vddIh/nzV2HHH/qNR2goyZ8ms
 Q/kil4ONyOf2OdCxyJSt6wLsfhmaoWCQkARrs++IB8lO8dXkmLBtqDR2CZ7ipw0Oe6u0Slahc
 Qlt6j+BQxxD7Qe2UX7uwxiLJI94rCJWSWlMZVZqMQKUMIGGyRx+ONL9YbdoQ0K1XFaUf1Wad/
 isYEFVzBpaDmBglD4exhN6XOnLEYSt8U3HYuMk6pHX+H19A4sH5cLpcTImf3D5Tl60iR3BtyC
 AynK142AO8C/d/AKWXeU+lclq/7n6QKS/BEmP+v8nAcRoP3vZ5H+z4rS7QmSyTfmucuZGLSdi
 LrU0sMVdtOJy3XE0PUHeTCsugR3XqYWxoQguqRji1VO+kFiYLKJs4312fVt9VHpNoVsyC5Nh4
 lzAJNXypAy/s/yeFZBEwB3b3Aiwt6pCWZbZP+8X0ficqO6YnrptF8oAzWjJhpbNV23fSwDGP5
 e9n3Erio4AXluiFGQwz47KTLMnYEV44EETHN07gyc48pqq/7u6dS/j1D6fpQKqnw7Z+FyNSUt
 3rBjsd7pdp1ttCllen/n6nj18y8zvbKFiWgNd1SfLhXS5hit94GUcmNzt8C0do8pd6ZIZcLR8
 HtG2bzrWAkQKXBkqNdjZfE3xuDgy1yHaym3+VIBPB1vmkJpHCw686+Vliv0QBl9s8Rc0bz3Ig
 SUk/NnF8+Uzg6Fbfd1F2/PMHhCIQ8Zb5i1BcMDiSjyqzxqp+PPqZJOXVVxvtb3YzaSva21dNR
 G9+KIgmGBE7R5e6V23SqBgXRsDw/wAZKkFhmYpnvAOtKJD8/jcRsgi851yrnFGRGb9Q1yaJ7N
 0+Jz/VJi8Nso96Suno1qUYHykmjgH0A5VqcUp8tQhY/+s4nmaI3zmDNcRhFhKv1fkDUQtaM1g
 8fZHCASoSrflA06JWIYpcPGUIYQwDh0iWRm392M1/8S/vavdeQJl0+/BgNYp2uRVqa6kHpjCg
 1raLv21iPznf15SMZf+9Tv+oK6I7dHm8lqa+468wycRD4SWM0XIvm+7KohlKOEantC3u+SZLA
 =
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_044414_067921_8DFB59E2 
X-CRM114-Status: UNSURE (   6.18  )
X-CRM114-Notice: Please train this message.
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
I did some experiments with s2idle on Raspberry Pi 4 (8 GB RAM,
arm64/defconfig) and noticed that pcie-brcmstb fails to enter L23 state
during suspend. I don't have any clue about PCI or this specific IP.

Here is my current working branch [1], because s2idle on BCM2711
currently requires some quirks.

In order to help, I just added a simple dump of possible relevant
registers at the begin of brcm_pcie_enter_l23():

[=C2=A0=C2=A0 46.822440] PM: suspend entry (s2idle)
[=C2=A0=C2=A0 47.050887] Filesystems sync: 0.228 seconds
[=C2=A0=C2=A0 47.152159] Freezing user space processes
[=C2=A0=C2=A0 47.154443] Freezing user space processes completed (elapsed =
0.002
seconds)
[=C2=A0=C2=A0 47.154472] OOM killer disabled.
[=C2=A0=C2=A0 47.154475] Freezing remaining freezable tasks
[=C2=A0=C2=A0 47.155742] Freezing remaining freezable tasks completed (ela=
psed
0.001 seconds)
[=C2=A0=C2=A0 48.797565] PM: suspend of devices complete after 1641.374 ms=
ecs
[=C2=A0=C2=A0 48.797580] PM: start suspend of devices complete after 1641.=
829 msecs
[=C2=A0=C2=A0 48.798059] PM: late suspend of devices complete after 0.473 =
msecs
[=C2=A0=C2=A0 48.810510] brcm-pcie fd500000.pcie:
PCIE_RC_CFG_PRIV1_LINK_CAPABILITY: 00315e12
[=C2=A0=C2=A0 48.810519] brcm-pcie fd500000.pcie: PCIE_RC_CFG_PRIV1_ROOT_C=
AP: 0000000f
[=C2=A0=C2=A0 48.810523] brcm-pcie fd500000.pcie: PCIE_MISC_HARD_PCIE_HARD=
_DEBUG:
00200000
[=C2=A0=C2=A0 48.810528] brcm-pcie fd500000.pcie: PCIE_MISC_MISC_CTRL: 880=
03480
[=C2=A0=C2=A0 48.810532] brcm-pcie fd500000.pcie: PCIE_MISC_PCIE_CTRL: 000=
00000
[=C2=A0=C2=A0 48.810535] brcm-pcie fd500000.pcie: PCIE_MISC_PCIE_STATUS: 0=
00000b0
[=C2=A0=C2=A0 48.846632] brcm-pcie fd500000.pcie: failed to enter low-powe=
r link state
[=C2=A0=C2=A0 48.846640] xhci_hcd 0000:01:00.0: Possible wake-up device;
regulators will not be disabled
[=C2=A0=C2=A0 48.846725] PM: noirq suspend of devices complete after 48.62=
8 msecs
[=C2=A0=C2=A0 48.846730] PM: suspend-to-idle
[=C2=A0=C2=A0 53.672017] PM: Triggering wakeup from IRQ 25
[=C2=A0=C2=A0 53.672032] PM: resume from suspend-to-idle

Does BCM2711 support L23 mode?

Best regards

[1] - https://github.com/lategoodbye/linux-dev/commits/v6.12-pm_v2/

