Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBBED29FE5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BlRF7x3GPWhzaZswMOKLBWLPrgVCED+FleXataOYLuA=; b=HqmleulvZmw9gP
	bnSai1/ujOtDSaNvg4BWUWZgOD/VWdw7xE9zPwmj3C3PsEdelifmogrZLT/P2z3DOOJo3tDzEcyU3
	yy9dh8TifFxYvXQnv/8MZ85eG7CPoDNUsR3jjDasPDNixLT5GGiacztdxg6SyKhxrGzSFb2j890w6
	knsF9khTryT03fdfcGQhPUfeybAbBUjo0BRF2JDNHRSoryAgNxYcv0VCIa8DCmBTTzWMq6Q9i75+G
	AUfMsks7rzCR4mIl5QzkloWO+xGwWMJJUcazEPx7GzIPDQEkaGW7dPJBS/LGdS3c7T2yJgrq7ut6y
	oV6bXpkdKn+nnnUhSNEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLo-00000008qQw-0GTH;
	Wed, 14 Jan 2026 10:43:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLl-00000008qOw-0Fpp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:43:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so49019625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768387419; x=1768992219; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BlRF7x3GPWhzaZswMOKLBWLPrgVCED+FleXataOYLuA=;
        b=nhHeJr1TDp5XFhI00oxk2KUlXjixN8Tn4b4CqzuF+R0VYEDjtzv4yGyHM3LDB22zdS
         AvM/0I98mQTr4ZioZW/y0hhLpuT5fQtXb82182r8LvAjZbht3jDZH1AWCLJiF65yxBIN
         jJTiGeiinkjStDCjZsdvV9red+TL32AkdIIOGn0mLtFuu3ElTFWZh+hiihsP5n+Wc33c
         9wu38NTh5MnJiNUObnR00kzizvf11NWQDtQW8J5enDD+HC14njPIZo7fQTx+ryycEuga
         KE9oNLCtIyiBvvst93sjmAe+OgL0dXJqSMxYi6dypgbo9Gcb7iaZp3K6XBNR7WdVPykj
         ExYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387419; x=1768992219;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlRF7x3GPWhzaZswMOKLBWLPrgVCED+FleXataOYLuA=;
        b=n71ig9Z7QsXe6Ozmj6aNbcWi3LkxB1MDrTeFtd7H2SH+zcbWdPAWpG554zy9WqSXFf
         pmJFLhRL9Q6Q14ykyko8/oR4aXy+422KOXQVrJ4aj2V0VJ1vcU1gdfsW1lM5Sw0MTW4d
         1NALk9d9sMqOQw2qlXDMxRKTkRD77ZXMdEaHq3Y/dAavyNSrCFJ6+CZfI9tgUnsntycq
         Kz5APliuE0i1WTG1aIoyQxcWyLp+8Yewkm1tpXqEEumKhmmcIhzIFG5sHqqhQqsNRXJN
         35y6KQYsnUtSYr6hrcOG9AXucowcDsIIV5NPePOZr4iBWBWBKzHP/4cerwL0yTFenlNb
         re2A==
X-Forwarded-Encrypted: i=1; AJvYcCVLdbHeugIK41t0AJSDJqEl0G5BMHEJ9udatwJc2WWMGWr5OI3pDtridZqeHao01sQrj4/v2O4HUI7EeoluWsbk@lists.infradead.org
X-Gm-Message-State: AOJu0YxSENNZN/o2dkEcRAEnjLCLtAm/JXgWpgfg7OUI0nvH6/nv51Sc
	AYeTC7cnlgVQnEF0yf1cHrUW49SAfzIXVIW7p8gEyHIYFSb4BEj6TfwZeeMD1HcP+fw=
X-Gm-Gg: AY/fxX7Jts2iyg6BZqOOD9CuoqkIdYG81yjvVDb4D4SDUrzwBG8C60vhqDQWaMEbgFz
	xr0F46vJWScD756t+kSRMQOs2TPpcnExjHWnPVnRO7Uac6sgSplZk6noqeRhqvSvLz2yJIBdURm
	9SS2a5xoGoA5+QZFrK0bf2kVaTU9VEToS8uvRGab+G1GCf7/laUYQnZ2soQebujTGnMSYdVA6z3
	zhsbhJAmpUkpDbz87flnUSu6f71HDCxBmJpbdVMZfDkDjA47RNNDXByslgeLaREHHskhhzSsGyc
	deMmKPAA9y789to7SYgBDf0ac9+xM7J71cYdWQVtD5RfQVV/mYRLtvdYEJMprcpRS9ztie7yyPz
	nx81Lo/ht1XvYuSIGCg8i6/2El4JTGfjORZa8+wJrnWkZGWrWfCnpUeiZbC+Godv3jGwuZZ1ZMq
	rWxGa2NmUwmw==
X-Received: by 2002:a05:600c:548b:b0:477:b0b8:4dd0 with SMTP id 5b1f17b1804b1-47ee33948d1mr27636215e9.17.1768387419126;
        Wed, 14 Jan 2026 02:43:39 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f2cc:bd72:2de3:86cd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47ee27cf06bsm18320395e9.4.2026.01.14.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:43:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/2] arm64: dts: amlogic: s4: mmc clock fixups
Date: Wed, 14 Jan 2026 11:43:10 +0100
Message-Id: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5zZ2kC/4XNzQ6CMAzA8VchO1uzFeTDk+9hPGyjgyXgyKaLh
 PDuDk7GxHj8t+mvCwvkLQV2zhbmKdpg3T1FfsiY7uW9I7BtaoYcSy5EDnIcXGc1hALGUYOxr+c
 EDcq2Vg1XlSKWTidPabGz11vq3oaH8/P+JYpt+geMAjgIqYTRkhuF5qLkPFjl6ajdyDYz4qdT/
 HAwORU1Up2MQKzLL2dd1zeDp/ubAwEAAA==
X-Change-ID: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=1LKCtim2I2hT1s40Y3DrwuSpkWo5wr0ZX4RSBFzQkDY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ3NSZJZtIWJKLF9AEgh31t4Xmgs/V4YDd+dFa
 0XSd+pUp52JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdzUgAKCRDm/A8cN/La
 hZUjD/9xs+WWSkkahEPEw76BOMvXlY+wH1U4EcYR3okK0755L+Ix+DqOmP7l1pX1kw7lrDkLYLr
 zlkegkq8eEyv8Ia7LSGlR8Jmjq2+I8+sk9IUh+WMD7oKDVI5mZ6U559ORfS2g3vYXD+XZ5LJ8TC
 8Vu2FjUtF4+ovYxpiVdV6lJeIEOz/DNyaOFWdIlrRXp08FFl6czFmI3VQRF2yuHzEvvnbpcuSbX
 OhAEAPGyOqQ2x1XY8Oe61l8FYFJ3GTCN8UceZ3E9ys80BxAkBr32oaIN5tKILq8rzfB/rBP6KDs
 q3veyF23F3TRXrbAulemw7esd8lYg4/BGxWbyFebwZmp2eDXtTeduyhdxXUqbI3Sw+lKcYzUdIC
 gJUycJGUR2C6QFXp95eEwwA9QofkLVDMndVln7fDsCjOzyPWbD96plwtPgE31wkOEn2n9uSduLl
 FBNr9JtKnBiupNTh95URNfFsv1p7ENTP8No/mh/MWl5jjp4LKars5iBwvLvNWiYJzvql6CfgzBe
 dYMrTSwXoGzyRLyjPYLkm9ZQ5FzZjrhS6z8rOCD9Jp6YDvffFfQu2wmMS3kJY/hlXuXdKcPBmzM
 kGMZxoHi9FVTlGigcC8u5ALdVdRbuiOip+qTDhzFmNeHYli0nmhcQhVsrPh27odzMSvJpcTnMKc
 aKieeb0045kRqnA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_024341_119020_E1C748C4 
X-CRM114-Status: GOOD (  11.11  )
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

The patchset aims to address the issue raised here [1] for MMC B.

While checking this issue, I've found that MMC A and C also appear to be
improperly described in this platform's DT. The 2nd change fixes that.

To be on the safe side, the MMC clock should also be assigned on the other
SoCs. More changes will follow once things are sorted out for s4.

[1]: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/

Changes in v3:
- Dropped useless assigned-clock-parents
- Link to v2: https://lore.kernel.org/r/20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com

Changes in v2:
- Collect Tested-by from Nick
- Fix some typos in the commit description
- Link to v1: https://lore.kernel.org/r/20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      arm64: dts: amlogic: s4: fix mmc clock assignment

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be

Best regards,
-- 
Jerome


