Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC1CCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UnDtFKdEvW/DP/U/HdjN3QuQRr7tgJb5Z32jZ2PKP1A=; b=bvTvfz9JH4UXgC
	W2ss7img3bAnxoF0by7Nz2RHvDWoN2nnX2UNCiVrekF0Ep3aHkaQPljDrrCnGM4E7N+qryChrKdd5
	PtLZdBwFtkR5zLMJ+gZEQ6wmnHbBRIOjNgOg4OQQNUAtQwDcKkUkTO/p2fSB1KNU2jdbLaUat5oM1
	8KYCm0MU/30sDK5so5q9/U9yBx3jMEHzNCXghozCX7VfDGYH5sOQuFOSYjXweUvpsdQf28ONimBWJ
	UF5hmuXWk9khp/ITLmpjTu/bqfwGai9YCbFA4RLLYwc/C76AsAaSGzdfXkHD6yPbwcrOX5gTI+Y6v
	l6O0KlsLwI0BiEmPNvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXN7M-00000008Cwj-3uuq;
	Wed, 10 Jun 2026 17:53:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXN7K-00000008Cvj-2xOG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 17:53:32 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490b613a17bso69531725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114008; x=1781718808; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UnDtFKdEvW/DP/U/HdjN3QuQRr7tgJb5Z32jZ2PKP1A=;
        b=PZSRes9I4WH6Vdrgg3zVrvRtxchZAbl0P0PAoETgzD3SAWaDuYZepCgqjQ1NcpxljF
         /1VVK9nTezkw0Fl1OyZ4CXwCDGDAcLASV08I8E+dxjWng9K6SRcCy2mW12eNGEOYuuXG
         liBSQthOVo9vSwOHR4OZh/AGrlY2H2Z4R1u6mscZuhb/fyuYiL/OiSr0mvTiRbjfnUaO
         SAU4vmYUSn53F0vgAT/05UjXj3yBL6o9Ra/lCz81c/iWk/ulK25UXpcFTNR7T4Sv6cJv
         I5dDzJrRhn/jYt20jwyUlU3ay6/e+6WNNqcIxEawoX0jeXjYPiZIorxUMPEQydv26HvK
         W8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114008; x=1781718808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnDtFKdEvW/DP/U/HdjN3QuQRr7tgJb5Z32jZ2PKP1A=;
        b=qkDq4irs+fe5q/9ov6gCVA3evWelTmxfe7V95H2EdhE7wk5Nn3pHISPbUsLUrHSMjE
         wamQXS4XVnbCcu0MJ75IDYhOonYJNwnrx7Rg3ch9FXvln9zvC4TyPuOdgQvOGt0nrRMx
         +8Tjgmc1u+Rkxes7QV6ZFNlPYdRXQeW0jpmkcmWbF2np668FIpctjx40kGcq15MhD6h3
         vipgrUcaWhuoke5uPSGF+YPg4UtZ7l032uSu6VciLV+2RQ/pqRJ22xE5FIr2eJvaOQnS
         Opog12s4MmxG7fgGeJS9TUM1EtuLD4/18vliezdxox7FUW8iAeI9IkXy1iW4HzZt6PEO
         gAcw==
X-Gm-Message-State: AOJu0YwDLGXs7g0KaX7Le7ECNFWt0taEerfKzPBcAA/2Ov/wlyXLvSys
	x2F2kLqPsBigYP1QkUfRcddSpKuYog5BPCBVC7QsidtRy+0oVUQM4WZS+T5ubpt7jUc8RPU81wk
	L8d89gBA=
X-Gm-Gg: Acq92OFi3ksos6FEhB9ieRjxUvJPCg8rgYsq2RcMNOaXR8KhkK9aZ7fbN1XAWEpPaGV
	6BIM6zmr1Kh7FFkkljThKG0vkpSpDUe6r7cdlv/ygt8g/sSKlqzh9KfbbbmZu5fHrzBqiPHcpAn
	AxDga8jNdyxAaHzBElwc2ugRtekp5xCavkjVEgwrg9b4mxmTAZo2m5+LzZ+1x+3svpdeAtIvFdY
	JvBFNu+zHGleq1ljDpf7k7unGhg36IVYRxk0UCqbkuo/7pnxrZOPUD7RDjMxMAzpZ6ws2rhOvYU
	oAfWiBsm8Zl0PlYzZGrVewMJJ5xtTH88HgBHJT1D3dKDxgViqKaO3oYwW5JAvNVoGHP6GGSeEey
	ELK0ujytbyI74ppyBwpF6B4syzpyLw+1uQ5VKlXds1R2kexTZiyeSj8+SDPDt0lRn37t5cJsQc8
	iyaXm7hQmvbjW1pEYm6WzUaRhCv3FLLMxM0HQWQ3WSUP6zEQ==
X-Received: by 2002:a05:600c:a51:b0:490:b189:212d with SMTP id 5b1f17b1804b1-490d724314cmr106934435e9.33.1781114008509;
        Wed, 10 Jun 2026 10:53:28 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm73553248f8f.9.2026.06.10.10.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:53:28 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/2] clocksource/drivers/arm_arch_timer_mmio: Restore
 support for early init
Date: Wed, 10 Jun 2026 19:53:09 +0200
Message-Id: <20260610-arm-arch-timer-mmio-early-v1-0-ac17218ec8b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWkKWoC/yXMwQ6CMBCE4Vche3aTAoLWVzEcahlljQWzBaIhv
 DtFD3P4DvMvFKGCSJdsIcUsUYY+IT9k5DvXP8DSJlNhitrUxrLTkOY7HiVAOQQZGE5fX25hT3l
 V2fKMI6X/W3GXz699bf6O0+0JP+5BWtcN5Er7EX0AAAA=
X-Change-ID: 20260609-arm-arch-timer-mmio-early-de97155938e4
To: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Jack Matthews <jack@jackmatthe.ws>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_105330_776405_035B49C4 
X-CRM114-Status: GOOD (  14.26  )
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

Jack reported a regression for some single-core Qualcomm platforms (e.g.
MDM9625, MDM9607) that no longer boot because no timers can be found during
early boot [1]. These platforms rely on an obscure timer setup where the
global Arm MMIO timer (arm,armv7-timer-mem) is used as the only available
timer for the CPU. This setup used to work fine until commit 0f67b56d84b4
("clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone
driver") when the early timer initialization using TIMER_OF_DECLARE() was
removed when moving to the standalone MMIO driver.

There doesn't seem to be any other usable CPU timer on those platforms, so
this series restores the early timer support using TIMER_OF_DECLARE()
inside the new standalone arm_arch_timer_mmio driver. This is pretty ugly,
but I could not think of a better solution so far. I tried to keep the
ugliness for the two probe paths as limited as possible. :-)

If someone has a better idea how to solve this, I would be happy to try it.

[1]: https://lore.kernel.org/r/46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws/

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (2):
      clocksource/drivers/arm_arch_timer_mmio: Refactor for early init
      clocksource/drivers/arm_arch_timer_mmio: Restore support for early init

 drivers/clocksource/arm_arch_timer_mmio.c | 180 ++++++++++++++++++++----------
 1 file changed, 123 insertions(+), 57 deletions(-)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260609-arm-arch-timer-mmio-early-de97155938e4

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


