Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F794CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 12:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/98YHBiUvLfMPS6LITOOPMQcJ+H5TqK7sLdZGcIrM4=; b=K1UO2ZHiJuVM3Y/5J4Q2qYHKkZ
	ZKbtA6Anc4V4KqGgv+gSGG0xGX1q0XCnnYHIZ1E2fWioUFdU0aYhyDtyz0ZuEH4guGv//jjLfI+ZU
	hqhjvDvxGRHuib5rHRVki22Cy521byM2oqV0N5FJKrnzJr32g2PqnfS2Qt/lJPkiKnqIcGTYPwuaL
	07a2seDe1Hpzi3JeOEl+sc3eB9uheEOhzqSlsiESb7uUisqwr+x+BFNuvwH5hYWhsVP5MQeKabMhe
	BFYPeGoNxSaSuBPf3saCkfbOrc/si29WmavRs3+wZZeUQrPAZvtjTHMLTbRNeJXp2dLGL6+nl6Y/s
	qb7fEuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR89W-0000000Exg7-1oim;
	Sun, 24 May 2026 12:41:58 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR89U-0000000ExfY-00Mg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 12:41:57 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-39396f873adso131244111fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 05:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779626513; cv=none;
        d=google.com; s=arc-20240605;
        b=O3QnihAlqqrr3ukHnD8JbH40bypxsHSalnf0wbvPPNY9KjTYnIqWEf5z1UDdbnTGXc
         tPl2astANofbBF6uQK+WTx7eFS+5mR6WacEHozEX+Zp2nB0BjiTXzQ+jhYYACNwM0xEq
         HJbrXifmNxgMAvr/X3hf28r6xKXLu77Fr6dL5ZVQ9zWr1UFbJ82FY5Fw9/SWve/F6/kN
         7FyRMkFtj2N2EvDe27hzILfn9WQkh/pumj4TarxTvn6qnHj1pCaOXSUDG+tHxan1x2VT
         BF3NrXpBdIg5SOLLjuQTmg+IOfrRRoWoMHj0YwXAw8mDsrVcu7STlpEwiBNaiidnokQR
         LvzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=4/98YHBiUvLfMPS6LITOOPMQcJ+H5TqK7sLdZGcIrM4=;
        fh=4MSTu370vmz4WeHJ9jLEfb9WZLEZ9fuPeW++adMtpK8=;
        b=Tux0IKLlTnGLikQaDWItqqJm++xqNGfM+2VEDM2ywPz/meYB/XvaaBRXA9lR3SfV3X
         vAoHCRwt9py5yYqe8gVLRIA448EY/WgCtfO3Xg6ywNiDhtBeviMTb1Frw3YcA4g2T4iA
         FSJjWdWsL4sOkJFrwHntVAse8NFcQosliQo+ThuSmWzWo796+C9Vnv0SKL2xiUZhfGRL
         YNWStZ9EB/uybfL09yJeR7muqT6tl7WrjmkvEeaPqimEfFulyYQ/kwozlIoxO7kzEdxH
         byKJYFuIGm9HWV3VRBhj/mtoBCwkUhlVBoKLjXueyw4+AQN7Wy/NEuOYkyBb4/Tgvm5S
         +hrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779626513; x=1780231313; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4/98YHBiUvLfMPS6LITOOPMQcJ+H5TqK7sLdZGcIrM4=;
        b=rfVaearS065R8xOL0xlptYQK0ARXH4EbP5FKcHhpyPhSmOvOkGbmuun8qzYyynZd3h
         ZOpnNx7MzjZyOuI7m2F5VYJbt77P1QUX4mw06POW6lQwQ1a6xOxOSlw1Kz1fknqn/ux6
         MnbFMVP8Zna0iayXUvDW+DvvFBsElXfENj41dzhdQsjNEZtjUAbtokxXhKs1LH7BAYE2
         F1YOVtvB6pFsCGlYugpknhQpvjwi/KcOt2ZdBrgadr7Uvw85aKlqtZ1QramRI/blzY2F
         luPrgYhELf3hpV+0OVy6Yah9x9GtJ1ANFuc/ZTMQsDQp9lYF3zTqP2P1SIQgdFWvDq8F
         VTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779626513; x=1780231313;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4/98YHBiUvLfMPS6LITOOPMQcJ+H5TqK7sLdZGcIrM4=;
        b=nN7I91kbG/kaOL5S8+aI+pmS4dvR0veHLxg6a94CCJWwmEug/V+rbyu/UowgiT33uX
         kRIHYK8J/bzb1AK/1truqQ5A4EyBiOirUpjNJaHta+kpbH5NNsV0wyGfQcr3F9VJf8B+
         W9hg6ob9yLvJX8VKM4iLwUQB9i38/kt0FDsEn7+d7vRbAo6Rd96eMOzeMr3iU+AkEYFX
         6owtIiefsbgsTdo0WOIyZshhbUnf8gwl6UgXxy4jfy1HO8BS+lBm8wNSxZQ9eTMgroq0
         eahAnToe6ycwuKhkDOzYMM6ffRlg6sSwZjcD8t0dwtgqvIcfRixIaxt+aYY9WqfXfeCs
         SwsQ==
X-Gm-Message-State: AOJu0YxkeoQkkEWkfCNhKSGCGXPmR6PcZIbbnd+7dfnsPhKoyBVAd+D/
	HMVlxazjvXBjjCwA4csKVWS6NFmHw7Ou0UQ+GqDkR12JeH72hSPbN+EOUJFztDisv7AEUXv8dur
	7hluICPSnF2hZ3ydAMJhSRB/qJy56094=
X-Gm-Gg: Acq92OG62vmRvqs6xiJhxyVpn+8+Y7yCkkNAliIXLRN99RsgN0Wq5jHXo7pCtMjNMRJ
	VvdEw2h1okVlVnWFwOrXPeO0gsiyaaDRbnrsVAq61HtsrUYXTymrO2HxcIg52rPihirJU4gQ27p
	j1Ig/W67A9nkyiY0LyE8YkAPpJArQHS+/MMfhldvG+632C+BQxH6Q5EnH73+l3Y2U6+NzGL6uRK
	63nNqZlBVdD5/FpcT0eftoDZRtyvZyWQEkv4fhrq/dI8chm/U2AeDYa9gHCoADinfntYFkgQPsK
	u/3RSKj13pcana2BjUi+CpM+zyMp3fjKLBXAkREviuA116Sn8+f3hfapMRSO51GCSYLWSUdbuew
	GkFDGnXM=
X-Received: by 2002:a2e:a405:0:b0:394:7f1:511a with SMTP id
 38308e7fff4ca-395d8d4d60dmr28080731fa.28.1779626512722; Sun, 24 May 2026
 05:41:52 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 24 May 2026 09:41:41 -0300
X-Gm-Features: AVHnY4KLbYRixLzEMmqDuxQ1pHKPDhIZVJe7LuADkhGnCjemCJcPUjosdec64FA
Message-ID: <CAOMZO5AHK2FF1_wws3wQsJs5ofvjn2JpQmk3of+p1+ExL8h+ew@mail.gmail.com>
Subject: sunxi: Watchdog reboot fails on Allwinner R40 after Linux boot
To: Guenter Roeck <linux@roeck-us.net>, wens@kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev, 
	linux-watchdog@vger.kernel.org, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_054156_062438_C9BFD8FD 
X-CRM114-Status: GOOD (  11.32  )
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

I am seeing a reboot failure on an Allwinner R40-based board
(Boardcon EMA40i) running mainline Linux v6.18 or also 7.1.0-rc4-next-20260522.
This board hasn't been upstreamed yet, but I plan to do so soon.

The board reboots correctly from U-Boot 2026.04 using the sunxi watchdog,
but Linux fails to reboot even when programming the watchdog
registers with the exact same values used by U-Boot.

The board hangs with:

[ 10.736509] reboot: Restarting system

The watchdog node is:

    wdt: watchdog@1c20c90 {
            compatible = "allwinner,sun4i-a10-wdt";
            reg = <0x01c20c90 0x10>;
            interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
            clocks = <&osc24M>;
    };

The hardware watchdog appears correctly:

[ 0.178494] sunxi-wdt 1c20c90.watchdog: Watchdog enabled (timeout=16
sec, nowayout=0)

I instrumented U-Boot and confirmed reboot goes through
drivers/watchdog/sunxi_wdt.c().

The final register state before a successful reboot in U-Boot is:

ctrl = 0x00000001
cfg = 0x00000003
mode = 0x00000003

and the board immediately resets.

However, under Linux, even direct MMIO writes do not reboot
the board:

devmem 0x01c20c94 32 0x00000003
devmem 0x01c20c90 32 0x00000001

No reset occurs.

I also tested:

- clk_ignore_unused
- removing the watchdog DT node entirely
- nosmp
- maxcpus=1
- psci=off

No change.

I compared:

- Watchdog registers
- CCU registers
- PRCM/RTC regions
- AXP22x PMIC registers

between U-Boot and Linux, and did not find an obvious difference that
explains the failure.

The board hardware connects the R40 RESET/AP-RESET signal to
the AXP22x PWROK input.

The PMIC power-off register works correctly from Linux:

i2cset -f -y 0 0x34 0x32 0x80

but this powers off the board instead of rebooting it.

Has anyone seen similar reboot failures on R40/sun8i platforms,
or is there any known erratum/workaround related to the watchdog
reset propagation after Linux runtime initialization?

Thanks,

Fabio Estevam

