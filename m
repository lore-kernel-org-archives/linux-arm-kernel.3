Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBF0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 19:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BcRVxWXJ6avUo9fIfWR1yAa2joVsWG/5Yew2PRe4zA=; b=JdFcgW3ctrJ5MoHDCItpvpV+hW
	tRYRSC2bV1eClvA6hHE3sO/c+rpT77gORIbfo3kWnGq7ieDG+w7rY2WK0SKDi+EnwYOBmgPzR5eEk
	VPcJpijrRe5kXrd7Q6YrAGHNumvZdzJoEk5nU7S42UbeuQ4JP2GKW0raaNL092O8b4HFfc19AwF7g
	1fv5sFPZ5ruPeo6klBjiuLwcge9J7Mb+BpVLEB9lOd3yIGgot9/MLZ6UuKiPVl4/ekGvxBUg47t39
	ijVDWSgr+kt3UWFx3FytMkq4L6VniCJMUoirsA+By1GUf9mMhDtCucvcTmAQOm1d41zUCsjEyI9kH
	Nm/8ZeBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKUd-0000000BLWP-2tuC;
	Sat, 16 May 2026 19:16:11 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOKUc-0000000BLVP-0eto
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 19:16:11 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso392255b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 12:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958969; x=1779563769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BcRVxWXJ6avUo9fIfWR1yAa2joVsWG/5Yew2PRe4zA=;
        b=PrtWQe6pWkYWVEBVDTFnAtao5b+tmkvvKZQvF7nfZhg3jRNaq/er74pDLheJNHjpkq
         q3YAzTuZrA8KRW4XPyXPoGW+4R0XZ7nsz0W9nXqD4U6zAjMSV1y4h5sAo1mEbjGZ+9/I
         Igxftgbl/t0B/cBBWzFwvhe1zTle89ebibwqRRK7NVJTB+ddXzJoHfpRs2dt0PD3sQ49
         v+qtRqtJjuc/kTqsYzTe2Y5iGkudxFPnqYKofRWjVn8UdOGu6TJPY3TLqRxZRdfyaVk3
         PRiUN8om5UCKBgzTiI0yG5Av/NsIizuxnMjBbqqrOiRCDupI9DOzx3MFlisPNHCok1Y4
         ZCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958969; x=1779563769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1BcRVxWXJ6avUo9fIfWR1yAa2joVsWG/5Yew2PRe4zA=;
        b=dPbos38gKLHH2ZHlzgCWEpu1gY+9idT4cqt4WwaKCeUI4qvzyC4Y+HLpos5JIkg7hA
         0VtC785KvVSF0fUV98PUoYeauHJmUGbUKADPHCfsvUqPBHPsVEAf7GIj1Khus+Ik/eHY
         NYixUyMV/f9a5TbWUorPEZbLh3lrTTMxShBLFiM5vNuAA9FOdrRRCzV/Fy2LvmLUzaxj
         sWovjDjIAZf5K/1/iYeNNMYJxRBIgidMgY7CPTZ9MLVdVAbMVpn1icetiNwuaZfqIXLo
         7fXXsROdt3vuCkHnjwsLEGAazudKQ914GOUn8ZpIDQQo0qsaxfREhwF6OJblh3Cix7AK
         AnCA==
X-Forwarded-Encrypted: i=1; AFNElJ+DcbB2KK5NWaSuewrGzraMj8DtpAsbU9lSWiDHO9slnMd/U7FSbLVmZkKQEi45MzGHLPxLKcG2pfVJF872f8D3@lists.infradead.org
X-Gm-Message-State: AOJu0YwuzHuuqwy966KwpKwm255BtKGE/gQEXFLVJwK5hjK5lZtVQvZf
	m4boQi01bEuFTMqG/JxP+evEkuKFvo8LZEljFnSbcmaHkp1WWE3ULLQD
X-Gm-Gg: Acq92OHV0/n3h/jKwkUi0UKP0elXSOwb3lBKqU+5M3FzKGD+zS7YX6xYAlknXvtbxZx
	thv0aenAxfhFykeXaJyk67wHkzGHr6I4nOr2cs3HQwg+LqOqangCEuWUCune5sHPvPe5Z3hnXWY
	ox+PnMkzO6aGXVWhkovg6qU8zwkmtJTBJSZqWMmyO0aGPUxgizMwCWMoBPvL5ta5QRqMxx6B1Qd
	BUP7i2FYwGX1qQIs5lOJioS0Mc97n+yoQOq4H3Hl6E5Vcfl8t9mioWgJ7r/EvF3cepdm7aFT63v
	aVuOsFeOL54QM9euFRGUM9avLUqth10xxbCrjQlzhCsrENagNy2gNUOQvaNkVVnIIqeRGpexPbp
	lZv2hVltoc4obtRk9M7DQE5Y0EFqX/W44xNwjqyFjcKruiT23T6VNW1f4A0UkWANffP5SxBPPJN
	WQzttBzSKBmrVeudYAaJpgLamfy53aIZRDU/lWAdFqyO9QfF+jSJud1J4Eb8se5sRxogC8
X-Received: by 2002:a05:6a00:2394:b0:82c:7420:82bf with SMTP id d2e1a72fcca58-83f33c8a27amr7135767b3a.19.1778958969274;
        Sat, 16 May 2026 12:16:09 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:40e5:100a:b5ee:87c:e578:2b2e:422b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19661261sm12297625b3a.3.2026.05.16.12.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 12:16:08 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2 0/2] raspberrypi: firmware and hwmon voltage support
Date: Sun, 17 May 2026 00:45:53 +0530
Message-ID: <20260516191555.17978-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_121610_196889_EBDC34C4 
X-CRM114-Status: UNSURE (   8.86  )
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

Changes in v2:
- Patch 1/2: no changes
- Patch 2/2:
  - hide unsupported voltage sensors using .is_visible()
  - replace the label switch with a string array
  - update raspberrypi-hwmon documentation


Shubham Chakraborty (2):
  soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
  hwmon: raspberrypi: Add voltage input support

 Documentation/hwmon/raspberrypi-hwmon.rst  |  15 ++-
 drivers/hwmon/raspberrypi-hwmon.c          | 134 ++++++++++++++++++++-
 include/soc/bcm2835/raspberrypi-firmware.h |   8 ++
 3 files changed, 152 insertions(+), 5 deletions(-)

-- 
2.54.0

