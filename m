Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620D6C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0ThRgCkb2CvqeWusoxmgVEmTWKcE4SQ/2tb3yLJFfIQ=; b=cls7w3aobYsiUqWepj9ErSV+lx
	ct+N7CSD0CG94BLk6kNLpj+nIL/ppR3xhSvRNDJJUGrx9zQSk5VM5ZOpTXse/IDzx4X1m0iAOTy89
	ArywO2U0F7Q5VwkcitBci2wIDw5B9Xnmp6e8jdGDlUrKeKBtD8VGbpwjjSlswiWbp9WJIkFX1o4F1
	kZQtBWscQfb1l9/9n5azZE7/qemqm3ac5yHia/157MdBIy33GsOQsmpnqZuWPFp1Qae8fTkvvfinC
	JPU0QJ9JyRdwlGWslIhSbnGlnIzNxrRH+lP5H3hq3KX67Nq7D48GVtG4jE2/QOnSmei3j0e84+5rY
	0GVGm75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Ee-000000067yv-45wL;
	Thu, 06 Aug 2026 15:42:20 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws0Ec-000000067yA-3hRj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 15:42:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso555731f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1786030937; x=1786635737; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ThRgCkb2CvqeWusoxmgVEmTWKcE4SQ/2tb3yLJFfIQ=;
        b=C8MKHZpfQXRdi3kDBLCa+3KpdQUvA2JTZLVw+79oynXRRXOlVo+n41yR75nCpkJWD/
         GOS9Df5MGg9uyPznL+pZ6XrD1bwSh/DmqdumHuK84N5nvj9tMw5u/n0jud9qU7LIey9v
         tuit/baqaLDSmjUNgGDe9Hm7gPwZtmbiBjp7iVYZSDkQewGI2zYkKc+ctML/k/Nin8Gr
         ONC04j8B45f1/cqfLNdB2froDiVNqceC8VZRa2zmYPgVsIG8e7cQE/q6Bq2eoNKnv2fx
         vKIRN9sJiKVczHwOCrXuYF1H0ms7R0F8YyE0oO6EdLItd4TgnvHlsa3BWIZ0Qirsx7EZ
         ePxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030937; x=1786635737;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ThRgCkb2CvqeWusoxmgVEmTWKcE4SQ/2tb3yLJFfIQ=;
        b=W6ZLJDAqVy7ibwnI+0kL2P+t3b9RXAd1/wn/OvblJio1BnNGvkWwqZ7fTkHy5Bcz3V
         bUGtsj9Zkg2efG/Az3+13H+cqTqaaPWnlK2BmM9TRqfofKR5A3bXDi8wL5JfGnOtFtQI
         KFgEJRHveHcD8BRJGIoZz4GHFAIL5fqgLEXNve9VRnuEocvfTzIcJRnlxNSrSj87nScZ
         HI5pCScq0pcTDRs+3SHvrIjWbM2ERksMkbCR26XqMj4rk0aNBlAvczvSAAU2LZkJYXzM
         /3/3dptlD08kVVOoOnVeSaTK4hbuCB0xj3IpCmLSkRYrxGw5szLET1Balw1NXE9Jkp5z
         10ww==
X-Forwarded-Encrypted: i=1; AHgh+Rp9oNStxX4bUH1EtSbfL5RUhHjPrm4LoVxboLWkM7YROiRrV7O3iMmZmp3parSeePZNkZ/l7NPWNM8nzNc4JD11@lists.infradead.org
X-Gm-Message-State: AOJu0YzqS3bXhdDMMD/aMBBG3WO1Io7r5Spmn4S634kLjEE8uM6lsVdM
	M+8AQDo2bLd176JYyAkQ29LAR++wm70x6YxZhIiSOpYtvaXUMGX/t8LpKbwq7i7Yuog=
X-Gm-Gg: AR+sD1116gXgs0bf3DkotrWFfbZSps0F1oRiJ6X/und7DhkKHe1iYqCvF5kmOCuyRV6
	8TX4c2cgkFbexIx05wm5muT9QOu6GJTWtOl/W6bJJqbLYawglVguMZ8c1FJL4xcpLno2dCtnsZF
	Ixf7Ykv0EBls4ZIBGRFZiB7mwdiEXTLh245cRZXjnEjla147DRJO+OVp2Exa92t5p4ItsQgk1T0
	i//2Q+QloqlZnlEDL+yHeCT9Aih3ifuwMCKHot0+yPdHyoFDEqp4w3rSJJKgaqZqlLK8d+dNPN6
	NOclw6uoD5W0QPo4/bKs40VDCbQnRRZoKiiTPPyfiiQQ/IHeuj1PysVgXQvMSQCBAZEAVHRxAJM
	DmcBgObM9yaiflewTMvB5WiVk2DwPnBmNFoj7jcc8TnZThNCJt6OMmeCuiGJE5+qLP9wfEBmVO2
	h21d+YMW53A0seIRGeZ3o/QJ2uWTp/RRFNdQQNbOp/Z0Yh9aJ/RKSs8qj62ZDpSKcCFcoKGyxPM
	aCEsw+PTIBHHs0XVS25n+lePmmrJZzrFsju9q/21PcNCBiZeIBrL7ZYc1yyDDe66GsH0R9b7Zh3
	ug==
X-Received: by 2002:a05:6000:2988:20b0:47f:eb80:ff42 with SMTP id ffacd0b85a97d-47fec4e2975mr22971101f8f.4.1786030936542;
        Thu, 06 Aug 2026 08:42:16 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b25c01sm6605380f8f.29.2026.08.06.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 08:42:15 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
	phil@raspberrypi.com,
	stefan@agner.ch,
	bcm-kernel-feedback-list@broadcom.com,
	linux-serial@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] Implement BCM2835 AUX RTS/CTS auto flow control
Date: Thu,  6 Aug 2026 17:42:03 +0200
Message-ID: <cover.1786030659.git.sairon@sairon.cz>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_084218_959359_6793A44D 
X-CRM114-Status: GOOD (  19.58  )
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

Hi everyone,

this is my attempt at adding hardware flow control to the BCM2835 AUX UART
driver. The hardware supports it and the driver source has always noted
that, but it was never implemented.

The driving factor for this contribution was that this peripheral is used
on Raspberry Pi as the alternative muxable UART for the BCM43455 Bluetooth
chip, should the user decide to use the "full" PL011 UART on the pin
header. But this always led to some compromises, as the mini UART wasn't as
robust as PL011, mainly because of the missing flow control. We use it for
Home Assistant Yellow, which is essentially a carrier board for CM4/CM5,
and with the recent update of the (downstream) Linux kernel to 6.18, the
Bluetooth started to be significantly flaky and failing to initialize on
boot [1]. Diagnostics showed that these failures are caused by RX buffer
overruns during the initialization, which were probably always present, but
some other changes apparently added up to greater instability of the
driver, leading to overrun errors in approximately 40% of boots when using
the mini UART for the Bluetooth link at 230400 baud.

I've originally tested this patch applied in the downstream rpi-6.18.y
branch, using the mini UART for Bluetooth, which improved stability of the
Bluetooth initialization greatly and allowed clean initialization even when
bumping the baud rate to 1.5M. Then I applied this patch to latest mainline
and did a couple of simulations forcing the UART to throttle by filling the
LDISC buffer, with an FTDI adapter connected on the other side of the line.

Note that for this to come into effect, the uart-has-rtscts property needs
to be present in the DTS. No in-tree device tree sets it on uart1 - the
property only appears on the PL011 nodes (uart0 on bcm2711, uarta on
bcm2712) used for the Bluetooth link. Raspberry Pi has the CTS and RTS
lines hooked up and muxable though, so it can be easily enabled when
wanted.

At this point, the implementation seems to be fully working in my tests,
but there may be some subtle issues I don't see, as I'm not fully familiar
with the subsystem. I used an LLM extensively during the implementation (as
I properly disclose with the Assisted-by tag) though at this point I hope
the patch is far from a one-shot vibe-coded mess, but please review
carefully.

Regards,
Jan

[1] https://github.com/home-assistant/operating-system/issues/4898

Jan Čermák (1):
  serial: 8250_bcm2835aux: Add support for RTS/CTS auto flow control

 drivers/tty/serial/8250/8250_bcm2835aux.c | 160 +++++++++++++++++++++-
 1 file changed, 156 insertions(+), 4 deletions(-)


base-commit: 0d839570765118029aa8bf4a95444c6a11aacf85
-- 
2.55.0


