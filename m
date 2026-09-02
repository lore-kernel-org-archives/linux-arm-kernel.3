Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9E8C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98vBTa5TFPlYA8Qanmp2ATef89cxpxFZ4CcvkJ+rRuc=; b=CPS/rj6+kEkboenQ4lcD2K/j8G
	jB/VJhD1Q45x+p5vGSitwOHvBFxhbe5dANtdjDD94RBz5Agl+M+QMUAzFd9ERq095CVaV9hBjqnzW
	gbIuPMfgbl9ONhnBF2yO1rIMHVWjVKoxlMp19JXnF250+irsbjGqmGsXfvgqdA2gFX/3aE4Wm/fCB
	iq6cR13TRlunDpgmOB+bWSuF2DjgoGcorsDAahqsEmmOyOWV1mNyJskxKfPiUPFPfZ3p/1NtyCXja
	sotK0I65JiUOuMg9wCOI8IlnFD9exemIR4oN8lSFq+CD9jPvwKhCcNcWIPapllD8Uz60kTI/WvNzY
	agUU/X9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eO7-0000000Dr38-0sxd;
	Wed, 02 Sep 2026 06:23:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1eO4-0000000Dr2B-2xZp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 06:23:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso6158445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 23:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788330234; x=1788935034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98vBTa5TFPlYA8Qanmp2ATef89cxpxFZ4CcvkJ+rRuc=;
        b=IPcOCIxvuaPw6af1aPXB2IMWwURey9uXLKVTmOFEH9Ped/KGsVegfqjRpfoEJMA/nN
         7HdiGpVXSBpvayfhjFZftRRIsXzXiHRRylQmkQTaXERDvNxLggseKl5L7z9R6ZHc1w7W
         IAPKARZ6iKUEc9fOQ03p77M2lz4iGD4yw/sMSqhjPeeRq1ntppfsik7E7R4/HbdYNc7P
         7+88a1ClO+F7NclLMeZws4xjSlrZZLKWHjk+PDbwyL/1yqYbgCkwttYF8xktFV03JfPU
         6SP1xT777NayhBGZYVXk04JZofs4dh9zCBBJ9i0gAlUesM+7pWPCTpg/L8ICmQSotn0A
         8G1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788330234; x=1788935034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98vBTa5TFPlYA8Qanmp2ATef89cxpxFZ4CcvkJ+rRuc=;
        b=rMYy+8pVcM0g4MGIW3RVp+90vOaYVDsH1mv2w17ARRdBQ3lnncKZFkVLHlf1okZHay
         jWTMsZO+pm24C8RLiMCnBt/MqbfZeuqTfhIcqxSk06rOYvlA1TKawCgtgpomFZz/SJA3
         636E3/g3LMpWTGRm9eA3a4uGDh0HqBfpG4tzgl9iwAfjdBDg1FjarbvgyXKM15ZXyne2
         rPd2XXDL8Kt+rw1ulXuM6FqT7ets7QBTeJemhUHFth4+qMC13c2JAGuufEkb1Lg98/Dw
         oG62U7xf3ITTnSyd0FiA2GF6YTWo3qm7XxcmAgjZ4M2NaXcI5WqbnONULvw7tA36HiTR
         Oigg==
X-Forwarded-Encrypted: i=1; AHgh+RrYoBX1PWOnMVyAQ/RufQHeartkzFTUFKnNY3mKXycsPVvBDZH4vOIbx4DRPn0cBuZ1GDH6Ryj12t0zmkCOPIYV@lists.infradead.org
X-Gm-Message-State: AFuF++lzJKQQ8c2ZeZDdMbNdxEO+jjcsiZDrmQFZe4hycVtW9aocEEaW
	q251jfsFVQc9Yafi/LV0VMZIoPNtbpf56EruI6SjlqejirEsprbvwfR1
X-Gm-Gg: AR+sD137cJ8Ic0HMaZbE9BzEwZ+QGzRBxlrmVaLKWuG4gTTfc1gBrmxCy2oCqNF2lMO
	wAS/JVh7H9BTGqeazJFaCUahZiik3tKnfLCT3TOHzmEXgUHPgXo8DFyMCiHiF5CWjV4FjYI/HPU
	VbOPJgP8rOOAk93hDfiFWOOVWKbKoT6LKDzBvtnD6adU8s/mpkgVzqvWwzDYPMJ4e4oEmzhNphG
	RMldT9ExW91tSXcyqe3ywPanb+v1F1yNqQcMinC+riwZSMTret7Qil8Ve26C4d52LyXECooo2yB
	gqFcxEBXmVppyNJO+nleUPc9O8TIesFgZ5UdeIhGcz1KbeJ6g53SVm5fvSmB8ssbs0u3rWHQO7R
	JMBP4JVKrMEt8tKTXq/hRU+SL9kQsjohLOLEhKjyJI4vbiR75l2bTFyPLnjdgJfuQqPNtpeHEey
	2oK0OiEKPhA+VDidbfgCwdl4tRzKe4UiGf6sTLorHoP5BWfBoML1wj0LfSDKU06fo2soTlkfbpQ
	QQA
X-Received: by 2002:a05:600c:3485:b0:49b:4eb6:6ffd with SMTP id 5b1f17b1804b1-49ce7c26ecemr12186495e9.5.1788330234183;
        Tue, 01 Sep 2026 23:23:54 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4776131sm49735335e9.11.2026.09.01.23.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:23:53 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH 0/2] gpio: mmio: read the line direction from pinctrl on chips without direction registers
Date: Wed,  2 Sep 2026 08:23:50 +0200
Message-ID: <20260902062352.3600368-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_232356_825312_EC422AD8 
X-CRM114-Status: GOOD (  16.77  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Bartosz, Linus,

this is the series that replaces the gpiolib guard patch [1], along the
lines Bartosz suggested there: instead of teaching gpiod_get_direction()
to stay quiet when a chip has no get_direction(), give gpio-mmio one that
asks the pinctrl backend, and teach the pin controller to answer.

The user is the Vybrid GPIO block (gpio-vf610, a generic mmio chip with
GPIO_GENERIC_PINCTRL_BACKEND and no direction registers, the direction
lives in the iomuxc pad as the OBE bit). Today every
gpiod_get_direction() there trips the WARN in gpiolib, 21 backtraces per
boot on a Colibri VF61/VF50.

Patch 1 is the pinctrl-imx side. Bartosz asked whether the raw register
coming back from pin_config_get() is a bug in pinctrl-imx: it is, the
callback never looked at which parameter was requested. This patch makes
it parameter aware for PIN_CONFIG_OUTPUT_ENABLE and
PIN_CONFIG_INPUT_ENABLE on SoCs that say where those bits live (Vybrid:
OBE bit 1, IBE bit 0), and keeps the raw register as the fallback for
everything else, because the debugfs dump still relies on it. Converting
the driver fully to generic pinconf is a bigger job than this fix needs.

Patch 2 installs the get_direction() callback in gpio-mmio for the
"pinctrl backend, no direction registers" combination, mirroring how the
direction setters are already forwarded.

Tested on a Colibri VF61 (Iris carrier) on top of gpio/for-next: the 21
boot-time backtraces are gone, and /sys/kernel/debug/gpio now shows the
pad's real direction for every requested line (the hogs, the SD card
detect input, the USB VBUS regulator output). Pads with no pinctrl
configuration in the device tree cannot be queried and report -ENOTSUPP;
those pads cannot change direction through this chip either, as the
existing direction setters return -EINVAL for them, so nothing that
worked before is affected.

Patch 2 needs patch 1 to give correct answers: with the raw register
coming back, the direction would be read from the wrong bits. Taking
both through one tree, with an ack from the other side, avoids that
window.

[1] https://lore.kernel.org/linux-gpio/20260813193715.2346477-1-mehmet.fide@gmail.com/

Mehmet Fide (2):
  pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad
    register
  gpio: mmio: get the direction from pinctrl when there are no direction
    registers

 drivers/gpio/gpio-mmio.c                  | 27 ++++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.c   | 30 +++++++++++++++++++++++
 drivers/pinctrl/freescale/pinctrl-imx.h   |  4 +++
 drivers/pinctrl/freescale/pinctrl-vf610.c |  2 ++
 4 files changed, 63 insertions(+)

-- 
2.54.0


