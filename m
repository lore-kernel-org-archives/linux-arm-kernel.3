Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5988CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YSwv5JuXuXyqhsYe8FeccLuDilzKVXkpn0YsKK5l/YY=; b=Q6apX9fIpTTkcK
	pWZAo9MiOXeQOsMCaJ2N5loH3fn1mj/EkzHa4QCVevyaYx7/TsjBh9tlyXb7eEIHXY5yQfW0Bwpzn
	DpB8Upc8MAwktJ2ZHoYm2FKK0YqpAqdQXLkf4IE0r9TYR3O7Fd16odIsDsMaGkL46Pzkpa2n4AQEn
	yrJbeAvMp9b9UTLrJ0FZ9TUtfbcL5O7hJsF+x43uXbVR/Go7DYb13UzPftAK9b/UHDXwupUK8SCkO
	YIhZEeTQnTvwBH5Dhk97uE8Z8mDouTv9M3zGd3iMclh5qQrIXRNVww9ZMxQ+ZRWpzLrFBMllujvDM
	FLcGguTW1et7a81v3C9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoE-00000003pwU-415G;
	Thu, 30 Oct 2025 09:19:06 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOoB-00000003pvT-28mq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:19:05 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ece1102998so545846f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761815941; x=1762420741; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YSwv5JuXuXyqhsYe8FeccLuDilzKVXkpn0YsKK5l/YY=;
        b=r4pC1zDzqbOFoUZx/t2qjwgtYeqmBtphHLbyirxWxhQccm5QhF37ssO5QOaOkpU/Yq
         tzddOWSC6QypERpoAuuj2FLciieGbvUQfF7cyll0lQZjRKwC4PCRG2ZGIIqEgZOYblj5
         4uVhfnrMs8Ngw3KVP5EdFFL9g+4cbvBLXrOk6oZqu/uwVzOjeGFJXFbsQueQOcWXdCPo
         7eQbHHVraTtcGwt0PYDeHCbRLMFSol/Lzft40LhZ4Iou7u9NJ8iyt6RPQutnERl14gpt
         Qx0WhCiGztmHjaXcR7SDDTj2AdTqKvPu5ulj/S4tluYDRYYaKcCRQNDwW7bKUqVeXEl9
         GNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761815941; x=1762420741;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSwv5JuXuXyqhsYe8FeccLuDilzKVXkpn0YsKK5l/YY=;
        b=IF8/0I9v54NaKShoEE7upQhV/E36uzmmPH1Egz6zPHdMgih6u6/uP36azstO2YrzYS
         t3kVds+p3qsRCxqtSAEgoCYR/+s4AggoDIsgkBolUNHMDZNdZhyhhkWrc67T5sfTLMLR
         EDqxYo6tUvUT8lKqoJchSZI2I2GiStq7h1vcN2BhWswsfjTst6yNOSkmmsM+t1scThHi
         VKyw72lddyegLlAwmC55nRV0qLPyVwsxbw9fk495ZSdYD7CPr+407crhE7PJQ3nTA7Ea
         2cF5h+dWYZdtDCi7Nml7aQdPPJP3Fq1D4RqZ2Og/nCVGayPaL2I5I4+Xm5YkPBauCA4U
         kgew==
X-Gm-Message-State: AOJu0Yx8YCm318V2cH/Nlqo5PK6/C1ZsLqIbAwLDAfu6QJuYH7y4EuF+
	mw3AyHiLyY4+cBCy39q3Mc43G3TBqC+U592dYo+rLjYGqOH+jbi8Y31w/qsn8M+sw1c=
X-Gm-Gg: ASbGncv47EkLPS/wCjqa8FCNw0/nucQjBNvLSN0+5FY1qIY8Kzud0Xg9obZB4f5Ee+J
	uyj3IAyjo+sE3GYVi+yOLl7OvXEEledqeaRjhVY/5Q7vYbwz6e5g8dLxFOGHCe8qzxASe3z8wDB
	XHSxq93jD5LGseGlWb5sfp5150mPXN/o+a43d/YPQ/KxwPqydNEdGcEg1Y+QI/OC+LgwQ3vuOdp
	pXHXr2VMDBuoep8UIxgiGSyUJ+46Jaj0Gx5X3PRWzTv81tPqCms8llKdcOc9lBo+oXHG0QZQRqD
	KRNgfXbxscyzvk/H8F5xN+dTgTnuEqr8ZmdomSzOFrh6FnasPLu9fUCqinhfBHeNpVNEjqzpzaY
	VkqaZOHrjeGLJDA+Jm9S/FkBYPbzFugwRdzNsDcmej8+U2Q3fkrQZJhNxvI5eHoiOfBARWLx/Xw
	==
X-Google-Smtp-Source: AGHT+IFBJraJgSepwNLraPb2/w3Ksa7ALKvRzY+k0hU5XwnAcd25WvkxjzsX4QfROikuqsVWVU8mTg==
X-Received: by 2002:a5d:5d06:0:b0:428:4354:aa36 with SMTP id ffacd0b85a97d-429aefcd05fmr5037872f8f.58.1761815941338;
        Thu, 30 Oct 2025 02:19:01 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952de971sm30459906f8f.39.2025.10.30.02.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:19:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Subject: [PATCH v4 0/6] arm64: dts: ti: k3-am62: Add wakeup-sources for low
 power modes
Date: Thu, 30 Oct 2025 10:17:22 +0100
Message-Id: <20251030-topic-am62-dt-partialio-v6-15-v4-0-6b520dfa8591@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACItA2kC/4XOTWrDMBAF4KsYrTtFGvmnyar3KFmMpXEzEFuur
 JqE4LtHsaGFUvDyScz33l1NHIUndSzuKvIsk4Qhh/KlUO5MwyeD+JwVaqx0aSpIYRQH1NcIPsF
 IMQldJMBcQ/612Hhvus40nlQ2xsidXFf/47TlyF/fuSZtj6qlicGFvpd0LAa+JnhWGY0H9Tw4y
 5RCvK37ZrNebFPQ7EyZDWioHXuriTrv2/eWbhdpI7/muhWf8Rd8M7gHYgaxshXauiRN7h/Q/oB
 G692FNoONPlQdY23Z8R9wWZYH+kraK6ABAAA=
X-Change-ID: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4652; i=msp@baylibre.com;
 h=from:subject:message-id; bh=zqYIIl4nQJ86jOsDALK6PFe87lmlujk5rxiqWGuMMag=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxmXafTwYycM18bb1f8P+Ve37Y/899pCUuKf1g2/eeb3
 oMFgS9jO0pZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiC2QZ/kprWF1c+eC2VNbH
 o8+r3+2W91NcH98o/OJ2jtPnKeWrPL8zMuywmx8WtfXiV3c2i6P9/sE71jtJuBvE/Plv5iz2PqQ
 2jw0A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_021903_604387_919AA4A8 
X-CRM114-Status: GOOD (  14.43  )
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

This series adds devicetree changes needed for Partial-IO support on TI
am62, am62a, and am62p SoCs. It defines system states for various low
power modes and configures the wakeup-sources for devices in the CANUART
group. Depending on the SoC and board details, some low power modes may
not be available, so the wakeup-sources are described in the board
files. The series also adds the necessary pinctrl settings required for
proper wakeup functionality.

Partial-IO Overview
------------------
Partial-IO is a low power system state in which nearly everything is
turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the
system on pin activity. Note that this does not resume the system as the
DDR is off as well. So this state can be considered a power-off state
with wakeup capabilities.

A documentation can also be found in section 6.2.4 in the TRM:
  https://www.ti.com/lit/pdf/spruiv7

Implementation Details
----------------------
The complete Partial-IO feature requires three coordinated series, each
handling a different aspect of the implementation:

1. [MERGED] m_can driver series: Implements device-specific wakeup
   functionality for m_can devices, allowing them to be set as wakeup
   sources. This is available in linux-next now.
    https://lore.kernel.org/r/20251001-topic-mcan-wakeup-source-v6-12-v10-0-4ab508ac5d1e@baylibre.com

2. This series (devicetree): Defines system states and wakeup sources in
   the devicetree for am62, am62a and am62p.

3. TI-SCI firmware series: Implements the firmware interface to enter
   Partial-IO mode when appropriate wakeup sources are enabled.
    https://gitlab.baylibre.com/msp8/linux/-/tree/topic/tisci-partialio/v6.18?ref_type=heads

Testing
-------
A test branch is available here that includes all patches required to
test Partial-IO:

https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/v6.18?ref_type=heads

After enabling Wake-on-LAN the system can be powered off and will enter
the Partial-IO state in which it can be woken up by activity on the
specific pins:
    ethtool -s can0 wol p
    ethtool -s can1 wol p
    poweroff

I tested these patches on am62-lp-sk.

Best,
Markus

Previous versions
-----------------
 - Link to v3: https://lore.kernel.org/r/20251001-topic-am62-dt-partialio-v6-15-v3-0-7095fe263ece@baylibre.com
 - Link to v2: https://lore.kernel.org/r/20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com
 - Link to v1: https://lore.kernel.org/r/20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com
 - As part of the series "firmware: ti_sci: Partial-IO support"
   https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com

Changes in v4:
 - Rebase to next-20251029

Changes in v3:
 - Drop patch to add WKUP_EN and rebase to linux-next to base on the
   patch that accepted which adds PIN_WKUP_EN instead
   https://lore.kernel.org/all/20250909044108.2541534-1-a-kaur@ti.com/
 - Fix small typos in the commit messages
 - Use AM62AX_MCU_IOPAD for am62a and AM62PX_MCU_IOPAD for am62p

Changes in v2:
 - Combine k3-am62a7-sk.dts devicetree nodes with existing ones
 - Combine k3-am62p5-sk.dts devicetree nodes with existing ones
 - Update the idle-state-name properties to the new names from the
   dt-schema
 - Rebase to 6.17-rc1

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
Markus Schneider-Pargmann (TI.com) (6):
      arm64: dts: ti: k3-am62: Define possible system states
      arm64: dts: ti: k3-am62a: Define possible system states
      arm64: dts: ti: k3-am62p: Define possible system states
      arm64: dts: ti: k3-am62-lp-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62a7-sk: Set wakeup-source system-states
      arm64: dts: ti: k3-am62p5-sk: Set wakeup-source system-states

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts | 60 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62.dtsi      | 22 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62a.dtsi     | 27 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts  | 71 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi     | 27 ++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts  | 71 ++++++++++++++++++++++++++++++++
 6 files changed, 278 insertions(+)
---
base-commit: c9a389ffad27e7847c69f4d2b67ba56b77190209
change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da

Best regards,
-- 
Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>


