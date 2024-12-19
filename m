Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A53EE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 20:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G1sjRJK5Ayx/85behtxrr4o80clOLqkokZkxXbtN8qY=; b=dxW7g3TXzlvdG4
	3urlYQTNOT9jLIkc2g6LE2L0yaity/mGtj55V1TRZ9Funb2daE4YpGwid1BJNGVKtziITBDnBn295
	iDV9tdsV214esbBbHe6h9JPuWeYzRXjLirHWJUqoxWNEFtJIbkg5hm+Z0gu5s8ejCtOGfOmGZfepZ
	jZ1OMtnUtcARm69K3EUw/lXawhlPskHXTFgKwUjn/HH6X2LLj5V0Fp8ZFcMqstbJdhgTsXq1zEV/s
	AbTYXdn9SwZSuokBW2p2ZTDIu6JeXLQZMGmGNH73nsxy/tb7URdl9pz3nPLgFaD7SmMnjQN58CSSg
	y0fdEDuxLTpG1ajG2wIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMrP-00000002yx5-0Vh2;
	Thu, 19 Dec 2024 20:11:03 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMkL-00000002xZD-3Nto
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 20:03:47 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so1853119a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 12:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734638624; x=1735243424; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G1sjRJK5Ayx/85behtxrr4o80clOLqkokZkxXbtN8qY=;
        b=KctDB9IhqVSwqiTj4I04wZnaYr+JrMFAgMFAre44OqYGgfNr34tfFOdgh1gG29p5e7
         VIpVx5LldVx1g6VMpplMxLWQwF81N4hU/G7u0HHIqg0uIgzYUUKVdMrMuPKSEJAwXTWH
         Lrpl+pZsHuCxdGnz8e7ONBuFbDDaj/8kTqLGRU2wPU2O9dWhrBNWkK8UwKLurk7puhiv
         fEMQDNdPjwvUAYTQsmzYKtOh9S4Yh/llUutkKqNqFs8rJN49TmnATTft5bHyu+c5Zi3m
         CSYcqLeGdiVrKRwqE+O1UMWWmgNRjhBf7dnDB3Jvb7faCIbX8K/305+tT59GH7WG+Hxf
         yoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734638624; x=1735243424;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1sjRJK5Ayx/85behtxrr4o80clOLqkokZkxXbtN8qY=;
        b=fU3sBAvt23xa753Pbq43Fvd8XrtcdGoZERu9g1Ip4MtioE28b550H/Or9b19pNmELN
         7cmUsDtjkrdLGHrC/qcW/ml94Q9tID3WgImzlXiHx3M7mj5nz9FQ2AWtE9sB2U/t2XRr
         rhzstY4Ci3vsCjUTNSdUkTbCvvFj7qzpIvwx7Fmz2w3LHsRe7uF8dojEV66X9Dk6mlyJ
         N68D/32DxQZbmKK6WQJjsqC36eVW8Ikj39+b/inDMa1pDcZStHw0LdXGVlRNxHUnMyPf
         khsP96pIwSuai0g4sZyb8OL946WdoAnXJaaqFz2qo3aUGRigVb6axDbDZ4MS82691vgv
         nfVw==
X-Gm-Message-State: AOJu0YwbytBryZoTx10MAicc7FpPxcsGAwH6GF/C56bnEKwtnXcnumho
	j8hZy9L6v5JK+4EvJTBOJvXnvsWK3PE71TfCBHbYnRZxKcMaUkNG42wZx2bF5yc=
X-Gm-Gg: ASbGncu7DJPsWZlrlN1e+EigZBgkGGVih8vc3iuvI7ckEkpgB65d4Y7QdC3q3E5NsxN
	t+LdhGGCXAh/N1tibrm+GY+7EddDf7HtJUMnhDx05n8EeZzhz0/Fq2tVo7prsAQL6gQ1x5ltp8H
	QanFm6YPkx9pBYmS2nw0mcH14x62/jp59HTpcsa850L8Sv0iQEyZOI76Gb7VK+WN1ap7mj3beJW
	1sMkng32HxUN+IoM8DEwrBUMRwiOA3t816Gba2xjw9nL7LW0g==
X-Google-Smtp-Source: AGHT+IGAvsK3XVcMr9kgAG1Mj7JSOsgRJhOBlTEpjnBuXG1glmCBkvGYiUfZlpLkR+ktWVwR3nSskQ==
X-Received: by 2002:a05:6402:214f:b0:5d0:cfb9:4132 with SMTP id 4fb4d7f45d1cf-5d81dd9953amr159640a12.18.1734638623778;
        Thu, 19 Dec 2024 12:03:43 -0800 (PST)
Received: from localhost ([2001:4090:a244:82f5:6854:cb:184:5d19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80678c8cfsm946417a12.39.2024.12.19.12.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 12:03:42 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 0/4] firmware: ti_sci: Partial-IO support
Date: Thu, 19 Dec 2024 21:02:11 +0100
Message-Id: <20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMN7ZGcC/32Py26DMBBFfwXNuhPhh8xjlf+osrCNaUYNmNqGJ
 Ir49zrAoqsu72h0zr0viC6Qi9AWLwhuoUh+zEF+FGCvevxySF3OwEsuWVnWmPxEFvWgOE46JNI
 38rgoZByNRMsr0RttpZQVZMYUXE+Pjf952XNwP3PWpP0IRkeH1g8DpbZY1IkJDJbBX39bHPbms
 A9Wj3jX326eMPo5WHc0qC3rVNMIZrq6VfA2XikmH57bwEVsyp2W3//fsggssa+seo9qVM3ORj9
 vZII75b5wWdf1F2xzaAA/AQAA
X-Change-ID: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4882; i=msp@baylibre.com;
 h=from:subject:message-id; bh=hs73sMLvLoilyKT1Gf8Ph0pXYZa/0ATd3gxDe4Fc9Ro=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJTathNztueFNv0++oVS/V5lqxHEhh4Tix0e6ew/vvNq
 kkJKk4nOkpZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJTGlhZDhQ6B+fJc5ov2Tz
 ygtK5h/2+KwNjTqYdL3g2bX/rR2pcUGMDO9Yzwe/LdrqJCPtrpF5IPZdXtgSWUEPxkcZ3Q5dS80
 5+AE=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_120345_852977_BA4695B2 
X-CRM114-Status: GOOD (  20.74  )
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

Series
------
Partial-IO is a poweroff SoC state with a few pingroups active for
wakeup. This state can be entered by sending a TI_SCI PREPARE_SLEEP
message.

The message is sent on poweroff if one of the potential wakeup sources
for this power state are wakeup enabled. The potential wakeup sources
are found by looking for devices that list "poweroff" in the
wakeup-source property in the devicetree. The wakeup sources can be
individually enabled/disabled by the user in the running system.

The series is based on v6.13-rc1.

Partial-IO
----------
This series is part of a bigger topic to support Partial-IO on am62,
am62a and am62p. Partial-IO is a poweroff state in which some pins are
able to wakeup the SoC. In detail MCU m_can and two serial port pins can
trigger the wakeup.
A documentation can also be found in section 6.2.4 in the TRM:
  https://www.ti.com/lit/pdf/spruiv7

This other series is relevant for the support of Partial-IO:

 - can: m_can: Add am62 wakeup support
   https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com
   https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-source/v6.13?ref_type=heads

Testing
-------

A test branch is available here that includes all patches required to
test Partial-IO:

https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/v6.13?ref_type=heads

After enabling Wake-on-LAN the system can be powered off and will enter
the Partial-IO state in which it can be woken up by activity on the
specific pins:
    ethtool -s can0 wol p
    ethtool -s can1 wol p
    poweroff

I tested these patches on am62-lp-sk.

Best,
Markus

Previous versions:
 v1: https://lore.kernel.org/lkml/20240523080225.1288617-1-msp@baylibre.com/
 v2: https://lore.kernel.org/lkml/20240729080101.3859701-1-msp@baylibre.com/
 v3: https://lore.kernel.org/r/20241012-topic-am62-partialio-v6-13-b4-v3-0-f7c6c2739681@baylibre.com

Changes in v4:
 - Rebased to v6.13-rc1
 - Removed all regulator related structures from patches and implemented
   the wakeup-source property use instead.

Changes in v3:
 - Remove other modes declared for PREPARE_SLEEP as they probably won't
   ever be used in upstream.
 - Replace the wait loop after sending PREPARE_SLEEP with msleep and do
   an emergency_restart if it exits
 - Remove uarts from DT wakeup sources
 - Split no response handling in ti_sci_do_xfer() into a separate patch
   and use goto instead of if ()
 - Remove DT binding parital-io-wakeup-sources. Instead I am modeling
   the devices that are in the relevant group that are powered during
   Partial-IO with the power supplies that are externally provided to
   the SoC. In this case they are provided through 'vddshv_canuart'. All
   devices using this regulator can be considered a potential wakeup
   source if they are wakeup capable and wakeup enabled.
 - Added devicetree patches adding vcc_3v3_sys regulator and
   vddshv_canuart for am62-lp-sk
 - Add pinctrl entries for am62-lp-sk to add WKUP_EN for mcu_mcan0 and
   mcu_mcan1

Changes in v2:
 - Rebase to v6.11-rc1
 - dt-binding:
    - Update commit message
    - Add more verbose description of the new binding for a better
      explanation.
 - ti_sci driver:
    - Combine ti_sci_do_send() into ti_sci_do_xfer and only wait on a
      response if a flag is set.
    - On failure to enter Partial-IO, do emergency_restart()
    - Add comments
    - Fix small things

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Markus Schneider-Pargmann (4):
      firmware: ti_sci: Support transfers without response
      firmware: ti_sci: Partial-IO support
      arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
      arm64: dts: ti: am62-lp-sk: Add wakeup mcu_mcan0/1 pinctrl

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts |  52 +++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h      |   3 +
 drivers/firmware/ti_sci.c                | 122 ++++++++++++++++++++++++++++++-
 drivers/firmware/ti_sci.h                |   5 ++
 4 files changed, 181 insertions(+), 1 deletion(-)
---
base-commit: cbc4912199deab59fdbd830b115d81941d0add46
change-id: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8:6
prerequisite-patch-id: eba4f2096c69d9c734a4a4491e062bd8b01d26fd
prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
prerequisite-patch-id: 56fd0aae20e82eb2dfb48f1b7088d62311a11f05
prerequisite-patch-id: 41f55b96c0428240d74d488e3c788c09842a1753
prerequisite-patch-id: 4ab7269193dbcfd449349ccd41b23914bbbdaa6b
prerequisite-patch-id: 24a735db927cbe2b1e0c6c5f3985b6676ce5528c
prerequisite-patch-id: 52dbbf390d3f7e4a3859e60e4f660bfe39b92cd9

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>


