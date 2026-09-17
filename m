Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D345C982D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DDcuQ9VeUxp2M+Co3neI32LPx9A6FG/PXs1DV+w7hSE=; b=E1KxVdOLEyb//0bGXgPFhbvNRQ
	OlqviVkpcWtpvNzG6NdcqgLC/hRZt4LCQP0Hcze/ORaMFSEfT5AnpfdUZ16cyYFDBmMISW5Tx87j/
	fiuUcyOlkspYs3RbS08Gd5sVJ5pUT4OJGnrPqwaj216StI3dq3UJSih0RyHI/u0PEP+wzDwlDQUkQ
	87Jq+dWIubSBlDURj/k525mLCtec9Ci3D2Z/jSzDCIB5yD9+wRem8WJU/AFUUhLwoQORnDC0LL55j
	V4coqTagZXxNRc4bFBDvSWHGFVWf+T8l7rE3V4mEBBYxFXrQklrmjVVsvDQg5JYKKDnG5/7eChjyB
	Fz4YWmtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BB3-0000000BHfl-0mrA;
	Thu, 17 Sep 2026 12:25:21 +0000
Received: from mail-wr2-x18.google.com ([2a00:1450:4864:30::18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7BAz-0000000BHdR-01C6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 12:25:19 +0000
Received: by mail-wr2-x18.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so267364f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647914; x=1790252714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDcuQ9VeUxp2M+Co3neI32LPx9A6FG/PXs1DV+w7hSE=;
        b=ajzLKvct9W/anjM7IKA383JPgxhb/Kv+XSy5VcYP4sZQyRLJHJouONC+nKGp9hUUnV
         MjzCis385t4XoiXl/Qe95ItY9tTpxLgQ7qSrEUgfiWrQ6d6N7mf/sQfeFcMQ2XoZ63U0
         pxVbxkjCzUupPsQvPife4Xm3za4/bSNsvNur+Wj5QlSwgUrtvrTRKWZb4KAjNuXirrfj
         SEnHF2Kv/Q7cYKyiEhGMwVFoJHt8E3ekqPLYzwfpnJPyp8yHEPhRE5OLQFM8xeNZ5Sab
         beWvg2HdtRWw+Nqq/EJCgj+erdmeSXo3HmwYSP57hPeXd4Q6lcxi92xJhgPmomj7lW65
         DiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647914; x=1790252714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDcuQ9VeUxp2M+Co3neI32LPx9A6FG/PXs1DV+w7hSE=;
        b=sWju7F+X/iK1esAyC9p+ygxJ8coMnQq9h91ls4Z8XwO3RG5o/tmYKgCzYUWcviUWvf
         JVLCCmPfj/BuBv5dCj+HAge81JzISbCyN4GjYj0Ju2DDcLG36RLZhdJUABY/CgoXD7b2
         p4kqTIGg+cghzpDDlah7iw1nl74FBqW2qDMkjQfQt1EMT69bxpVjaZuST8jZG/F+CzXr
         PPyrrXyPMhHC8lYZ8Geb2vrCzJKKX8KS2G9rzLMvSRCnIlqex/VXZpTEE5hLy3ZZ+Rl8
         useZNIn7dqVHJAWLQXbye1AUW6QA9zzHMrMhl2FDADpqJ3Q8yLdxSluqgjPDmpcen1Yq
         R4Sw==
X-Forwarded-Encrypted: i=1; AKwUvBz3dVCHBOTkLy4ndvBBnZY9xi+aH0etBjwerTzNXILEi3Dj1THUnQQz31akatVNqE8eq0Re+1oo9Sz3J/9w3Nt4@lists.infradead.org
X-Gm-Message-State: AFuF++lWRzx71EHdXsgEwGSLPoUI7NR+wm65XeNFYz6JR7xx7dnDlK46
	bm5OAH4j4Xxu3u8tmdikeVWlESgjjSA/bYak4/6wVAmPgXNlkghpAh60
X-Gm-Gg: AYBFou1M1B+992WtF3eWKienSdmQ0PaewBEXV6xERVddxtx/WJNMKyp194Va+ONpzMK
	eV02D/2T3he4SFQDNqYiP9j2rE4Rb7fm1GVafbsu+fEHfNDsH85l6tKD9TwYgCeJWuJ04sz+b2R
	KO/cDTLdLn8b9OBLM892KzIC9y7h96Gy/q45pm8ZZE0IwA5BVD1M9W2mW6gItGjbdniyT5KC8z8
	vkZk3Lc7KWEE4dK6aBrkslyDfjouT8ZNh9S2LWWMmHQe8O3hA+sk9q2aB8qY2YR4G1vn8SVEluX
	S2F0lUjhDC09llfBMP3q///0YArb+ik4jVJEa2M2DmDs25J9OsNqevL/j4La65w0BUp3005hRDB
	1P4PcZ6PMKiYwNEhVpU/kzccSJww3zV74mP0ASpqAfurBr8y2EhP/5GpIX/+MLxKhbiAP+yfiyp
	ZDH46kp4MgbejwMtb3O9HYNdmEAPZbV2Nvft1G0TR0Xh/PwsHYgRU7ORMJg607cAea6OhRhIGMt
	JaWJgZLmWR1T2EfDCW56X/uEB/07eDgwnli1HGZ2u2DjBY8ZePPvMAu
X-Received: by 2002:a05:6000:2502:b0:487:a87:24c9 with SMTP id ffacd0b85a97d-48713ae6895mr5484888f8f.3.1789647914291;
        Thu, 17 Sep 2026 05:25:14 -0700 (PDT)
Received: from zeus.localdomain (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27ce2sm15276567f8f.20.2026.09.17.05.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:13 -0700 (PDT)
From: Sander Speetjens <sander.speetjens@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sander.speetjens@gmail.com
Subject: [PATCH v2 0/2] Raspberry Pi 5 RTC driver
Date: Thu, 17 Sep 2026 14:21:42 +0200
Message-ID: <20260917122144.703221-1-sander.speetjens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_052517_057039_CE708222 
X-CRM114-Status: GOOD (  14.79  )
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

The Raspberry Pi 5 has a battery-backed RTC located on the DA9091 PMIC accessed via the I2C bus[1].
Access to the RTC is provided exclusively through the VideoCore firmware
mailbox interface (not via a direct I2C register interface).

As stated by jamesh on the Rasperry Pi forum [2], "There are no plans to release a public datasheet for the DA9091." So we are stuck with the firmware interface for now. PhilE also states that "The firmware needs full control of the DA9091, sometimes with extremely low latency, otherwise there's a risk the supply could just cut the power."

This series adds:
  - a DT property for the charging voltage of the RTC battery
  - the RTC driver that talks to the firmware

The driver and binding are based on (and largely taken from) the
downstream Raspberry Pi kernel. The main changes for upstream are
the addition of a dt binding property for setting the charging voltage and
binding the driver from the raspberrypi-firmware driver instead of from
the DT.

The driver supports time read/write, alarm, and optional trickle
charging voltage configuration via the device-tree.

Testing
-------
- Hardware: Raspberry Pi 5 Model B revC
- Kernel: v7.2
- dt_binding_check: passed
- Basic RTC operations (read/write time, alarm) verified

[1] https://www.raspberrypi.com/news/introducing-raspberry-pi-5/
[2] https://forums.raspberrypi.com/viewtopic.php?t=359073

Sander Speetjens (2):
  dt-bindings: rtc: Add property for Raspberry Pi 5 RTC
  rtc: Add Raspberry Pi 5 RTC driver

 .../arm/bcm/raspberrypi,bcm2835-firmware.yaml |   7 +
 drivers/firmware/raspberrypi.c                |  19 ++
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-raspberrypi.c                 | 277 ++++++++++++++++++
 5 files changed, 315 insertions(+)
 create mode 100644 drivers/rtc/rtc-raspberrypi.c


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0


