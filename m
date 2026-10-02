Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B254CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7fJmWqlsB1VWiOUorjcFzyAhsO6A5TIroXTxkz/uic0=; b=qJkpEX4xc2tjc38klKlxCm7IrU
	VoT/CLXHPbihbU7bGd9kxV8p9yeHxZNJCiSa1/+TeThBetj50Sv2A0GicPiXjvr0IAQSSs6k/YgGE
	iUrlkohmMQvaHGzpkoh6x2iRxRCSbmBV2hSR0EOLorGNtffV0OEVHnlT/+bWl3hyuAKKTFzw82LLz
	6XIx/bdJrV4cE4X5IJ9YpjAdSZwj0JYkz6R+N63/NLG7dkrbyxrzg6/4oQveTxEZIzeE1tpiH5a5E
	0FpjuB3Gzk3bHMKP6xXr9mw9SIc6+M5oJDX3EbsyrVpyLtWl7jdwS45z66qssxg/L3vdx9bccJetp
	JtjpeShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaP-0000000AoJr-2I5N;
	Fri, 02 Oct 2026 07:21:41 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaM-0000000AoH0-1yYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:21:39 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so1578216f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 00:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925695; x=1791530495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fJmWqlsB1VWiOUorjcFzyAhsO6A5TIroXTxkz/uic0=;
        b=l//pQyNjcvY30pQEAZR96dxUDuTUoBi2QJko+Ddq+DvyVl/S4q2EsS6tqZeog/GeER
         t3VMb/eJ86IgH3tAYCDBLCqUXfMMUla5RkqKSmTW3xhvYtjxgEIfW3fcNQaOm5mYi/5m
         0iJXBB40yqlYTuWapL5zxVSNBhrniuSVX8ksV0WzdAIpfg2uUk5LDfHw2WKTB2cM9MtE
         6p0L7D010fcDELo433xQyUEVsi0Xwj7LYGAXf8xkqHfxSd0R8lObvqa315OOK7Fa02QT
         Q6QxwWKFdBY8fovv6IrwM5lhhz88cZoo98FTXnWaBO0hK9ealpbNoj3mXM+47oiYqKiq
         2zgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925695; x=1791530495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fJmWqlsB1VWiOUorjcFzyAhsO6A5TIroXTxkz/uic0=;
        b=DhUBO94mYgFXCNPGIRYBjbxMjkDtGj+M/7tY3pz6TgwB8YtKOYIk38jvLKpIGublt0
         kGPjRZQ9PS7P2YXhp8gCc1bnc8pnHNGVHoklTYzu5WflDkfa8JzGhqLujnBYy2v/LBQh
         zDUVmX6W64eFuXTeQWF2/sP84CDyGqdCPJ0a3/szYFF3SJd2xUq48Khxfq3CZxhDY3tZ
         V2GsEcs852JYpBgKR9UZUPouahlZXFlzeb0NHnhI4tM9V7aYyfrHojpXArJIMQe5VkNk
         ub4zAZjynhdFoJPY/ZWksXQIRRCl1MMk37jkOCOdXXQC9W94V6Ge1g5Cy94jJJLXqOfY
         0/Eg==
X-Forwarded-Encrypted: i=1; AKwUvBwLrfwS+qtUc6/KxW4JbLdUpMmmEwuAKK0WzNbuBxGQKLJxQ4RPk5qM+XJhbrijjW/TF8/m//pI2wdqhwSNWpau@lists.infradead.org
X-Gm-Message-State: AFq9FYLlFtwyAd20ISA/wiMtyVz/OaZT1bbsO/CfIzfAW5PZun2Pcp/M
	Jr2jzSIyighmuSbSMXCWJPSmkJvexQ7Vk3pqqbXHbRacsBrs6TpGnBdf
X-Gm-Gg: AYBFou0bRCJFpLF2NqVeD1czKqbejOo3lZCysOLhqw9q8C/1km/elM2YYv3gTClFU6X
	9SheI6Ntf7sHsOVzMWOQ0cH02Yg+JYOUJlp7MFAiUonhCwDLJ+ktQVTNiyDr6HxwZ8z8un8udno
	aFYJM4IPy5oNl++XITU8GuyRq9yx5FZOQwAbcCSq/Haj+TW9wF3PA847pmyqOImkmCD1LjPJNU8
	10b/2/ZeCXx70wKV3mw2dyVMHDL2hseKrWDSO8s+GFDEciGrYjKyZIzWBG2AcGAev1l40TfhMH/
	OljJnmLLlz71MFQPM2ue6ZsOPBBJRLI2N7VyGaD9cGK45x6i0x7ZZ73k/3yNvsTQ14d0gTWDZvW
	uM9BDEoktKPFE2eHKTu+csnx74m7dczG7362fX/+tMEWcs4inao402G4pRkL2bKFTn9UtK9kgQa
	WRH76cAPdVFP3HB4YhYY2WmsvftUd7Fp7w8pmPswAasMriZDjo6j1ZsMGe9Mrxd+q0oA==
X-Received: by 2002:a5d:5f05:0:b0:48a:f592:fb63 with SMTP id ffacd0b85a97d-48b126f5423mr3564843f8f.1.1790925695200;
        Fri, 02 Oct 2026 00:21:35 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:34 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Convert MediaTek GPT timers to OF probing
Date: Fri,  2 Oct 2026 09:19:25 +0200
Message-ID: <20261002072115.169250-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_002138_528195_007BB91D 
X-CRM114-Status: GOOD (  22.30  )
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

While chasing a kernel freeze on the Lenovo Tab E7 TB-7104F (mt8167), I
stumbled on the MediaTek GPT timer driver. This driver is currently early
loaded via TIMER_OF_DECLARE. I noticed that on mt8167 (and I guess mt8516
too), this driver actually fails to probe because its device tree
declaration depends on two HW clocks, CLK_TOP_CLK26M_D2 (13 MHz) and
CLK_TOP_APXGPT (bus clock). However the driver providing those clocks is
loaded later in the boot process, leading TIMER_OF_DECLARE to fail with
-EDEFER.

Patch #2 converts this driver to OF probe, fixing this initial issue.

I noticed that other devices avoid this by connecting the timer to
fixed clocks instead of referring to an actual clock. This approach
may work on mt8167 too, but I think referring to the actual clock is
cleaner.

Once the driver probed successfully I noticed that even if it was enabled
by the boot loader, the kernel would quickly turn off its bus clock as
the driver wasn't actually requesting it.

Patch #3 enables it and attaches it to the timer device. I wondered how
other platforms made it actually work, and noticed that mt6735 declares it
as a critical clock. This approach might work for mt8167 too, but same
reasoning as before applies.

After those fixes the driver probes and works correctly, but I would
occasionally notice a crash at boot inside the timer interrupt handler.
It turned out to be a side effect of the bootloader enabling the GPT
timer at boot: an interrupt may arrive and be handled while the driver is
not completely initialized.

Patch #1 fixes it by requesting the IRQ but keeping it disabled and
enabling it after the clock source initialization completes. I sorted this
patch before the others because it's actually independent of the latter
two and may fix (rare) random crashes on other devices.

Please note that all the changes apply both to GPT timers and the SYST
timers, but I have no device to test the SYST ones.

The series was tested on the Sony PlayStation Classic Mini (mt8167).

Re: patch #1, credits for issue discovery and suggested fix go to
matemiller992 on postmarketOS forums. I am submitting it upstream with
permission. Not adding Reported-by or Suggested-by tags because it was
requested not to share real name.

Unfortunately, this series did not fix the tablet randomly freezing during
boot. Any idea on how to better troubleshoot this is more than welcome!

Luca Leonardo Scorcia (3):
  clocksource/drivers/timer-mediatek: Fix random crash at boot
  clocksource/drivers/timer-mediatek: Convert to OF probing
  clocksource/drivers/timer-mediatek: Request and enable the bus clock

 drivers/clocksource/timer-mediatek.c | 47 +++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 7 deletions(-)

-- 
2.43.0


