Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C6CC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 10:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=677sZq+YzwT8s/SpNUo/0Bnrhf0tAcbKEaGsUFnux/g=; b=I0QMwA6mIBHKvF
	0RF5KFOW8CM1h0TMXuS+CkcXGfn6x5CxvKp9LD98cUigtaVMjhVQ8+99IjbqQH4aBNKjN/XeU9VPb
	D4iPFhbX2FkEThoxGaG6+ylRbFxQ36aDlcEVEP4x5hsiqJGInh4VGasUWZKRdUGDL+p5kwa70jntu
	zU+5t/2bOk69YVJFxKdcVizBlGqlQ4zs/uCijiMnQHxBqsyor8Dsk5qxXeg0xAvuIBc8G4WmnHuXq
	eG99BHCslQG8SucqJY5hbZfUTBrr4VZujkOFpHWznMUZYsbF8F0GGV1NgS8P9glEA71vHfb3Ifnrb
	xsXl2HwwBVL2RQkbidnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzviX-00000005qSW-37gH;
	Wed, 02 Apr 2025 10:53:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvgm-00000005qHo-0Nz6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 10:51:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39c14016868so3004506f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743591078; x=1744195878; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=677sZq+YzwT8s/SpNUo/0Bnrhf0tAcbKEaGsUFnux/g=;
        b=qiaE77PPL+WNtMyAMCqNSVf2SuILP85GOu0mIswBd2o6Z9Ol0nW9JD7JiRzwwF0NpG
         lAs4fubu1RJMc7cYWW3abe1EpyDO/xr4s02fPtEY+sOHLrCUXAR0V1ehZllZgMd3Avtu
         bKs5CmjxaBfNgYpQ8pDv2Yjh3vpwB67xnypN2n5wi0HgTBFXVHaHYX0C1R73gQWuDlGU
         TfUa7g6V3qr6fK3I/s7DRbdqxG6ujP0cHIcOobMsd9qU9dNWeTVqWQF4ttF/MqeC5KyO
         JZoZRVg/qs/ezzcIWLvQDN/+dE0GraXBjAFiawpy2nCy6aBkKkxAtkiFfr4Z2Iykw/op
         Te9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591078; x=1744195878;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=677sZq+YzwT8s/SpNUo/0Bnrhf0tAcbKEaGsUFnux/g=;
        b=HJ1DX7ghD5P7km0TIUC3fHgQRpigyNkgpDCvTtATb+g+1n7/g7x3kbxIFDCDrPAmaq
         HmzMpSdovU/lLxKXlCOMHyymKD9wb5aJvGci/aa/5AMdcAO4nu6xDvnrmoliJnkThSYB
         o3mBTaiNjED5FB4w2Rl5A+A5PkYlGneOLaFOmhEwVB9ntMGemNcZeraWbNB5prnvK6vC
         OfoH+039QLEYumnWGW/6z/OgxjgdI2XSk/hBjQ7RtZs6YGFgVOMi4ZKmxkJimtzK/xVo
         Zm2AnA1GT3f00NwwLuYemOEfW1uUqap79KxAdMWZ2JoQgqhud55fbGrtaNFRsIw3hqmo
         4m5A==
X-Gm-Message-State: AOJu0Yzn9+1hL6d3XT/4/Ly9A13/2DbpL/tlJrCblZa9aiiYfPOH0ci6
	R3lEr0NDBZLcQQb4ElhRBah5gr14cSjO1xA3pkOmTYAlsmSrRK11H9tdG+D2MaE=
X-Gm-Gg: ASbGnctanGvSUmWAUIJQ2PCdR7kbPz9kSLR2XcWFZ49zm/Cx0EJ0BFCnZC9xlJdm8wx
	irkJY/utvOrHich6p/51t5iyeIboW9CL2EGFdrfxNTzS5Dq3Dc2aUE8hVzShFCX5xMKdf9ADJnJ
	pjmOpju0/Scn7wdOTsdGt3I1uvR1NktbecbrYgShHenfqGVxCsF57q3Mg4T6ucJ95v0+yaDQHC8
	y/ez+k12FxCWoA49Sjrpyqh1GIeNS5IJvRnbgKb+aFUpCZcY+k97H4Uiuft/388l4wWnppsAxeX
	0r7ncKU+6yr2ZKf6x1RX3GJGdG991PAUZkc5b0kIO59hVfro
X-Google-Smtp-Source: AGHT+IGOlgNM+I1PktLz32eEZ57ov0e6FZNAEgQYjGQgjAQrXNcZq0X+7ErG6RVw6HyRscnCkvIR6Q==
X-Received: by 2002:a05:6000:184e:b0:39c:12ce:6a0 with SMTP id ffacd0b85a97d-39c12ce0a88mr13388501f8f.21.1743591077978;
        Wed, 02 Apr 2025 03:51:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:b96e:56b4:f317:73c1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4239sm16849484f8f.94.2025.04.02.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:51:17 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 0/2] Enable RTC for the MT6357
Date: Wed, 02 Apr 2025 12:50:58 +0200
Message-Id: <20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJIW7WcC/22NQQqDMBBFryJZdySJjdiueo/iIhMnNWBjmUioi
 HdvdN3l+5/H20QiDpTEvdoEUw4pzLGAvlTCjTa+CMJQWGipjVTyBhQtTgS8OEDt/bUx1uvBiCK
 gTQTINrrxUHJbqwbYtcf3YfLhe4aefeExpGXm9exmdax/E1mBBOq0btAbg9g90K5TQKbazW/R7
 /v+A5F3sHvDAAAA
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=3X7KZmMhwl0HYqgJFICiGwUGVJ3nQ9dIw3MwJDlXC/M=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn7RakYtp0bKzyxV1J5GL9+6QybnWsdh66v7+9FXi9
 1PPTL+aJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ+0WpAAKCRArRkmdfjHURd+REA
 C2QEnGgy8gpfrAzo2s533rgbgWhRdULalx9DKETDrArGImRiZxcFC6osFt8LdSuXKwXLZfCDHG4e2Y
 6M6JUV6tEbtN0DLRCSit79skUJQIkzaGy1nJ5mTfOUGsp258FrHY3R3ibu418gpvTG/b/eIfCFCGsm
 GiK7OHe968BUyrTszBFYlcB2MMzPAdkdBA7aLVSrSRokmHEgkkSQ/WZWncGRxh89tQl+kS53SMILP1
 EW0Pz43njuoxedzUzJvo4z8P5rgwprm6B7J+j0WWyOaN22x3hwYhlrIukrUznx+WNbG7zMfL9Wx4eU
 5kE9vjk2HRTrp03cHG1Zdr0G0VTqEAf6jUKFJDleuD4bKqlWEhdmpF0D/0czWCIhdutujsZt5Qx/ib
 wEZC0cKa8mK5hb/u7k3rxvpBzAMlEsK6pHxrVRCJxHKDtkrApFWZj8mcWnYTRubSO9PKZa7tthj7wN
 iBz7vNrKEFyY0yB4TxSZ99vwF52AL8F1m4Q4YBeft/Zs9PC4Eedaq991NlOLd+ULv7XSDeeLVP9bhl
 wj22KJcGlGy7eVDFjL8B/2aM0RHZx8mq0WpCn3A2yrJpB8oPlSPpm+y6M2u19tzxTkTRACXVTZ3RF4
 eAp5BQn5HyGv7PKTJHzLDM+b+ukvh01zEuUIKc9f2lSPX+Goa+/Io4kaKuog==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_035120_408023_B6654BB4 
X-CRM114-Status: GOOD (  11.91  )
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

MT6357 PMIC's RTC use can use the MT6397 drivers with the MT6358 data.
Also, since kernel 6.6, a regression has been observed on the hwclock
command. More detail on the commit messages.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v2:
- Split the patch to have:
  - Add MT6357 support
  - Fix hwclock issue
- Handle the year offset in another way, but the V1 way still viable.
- Link to v1: https://lore.kernel.org/r/20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com

---
Alexandre Mergnat (2):
      rtc: mt6359: add mt6357 support
      rtc: mt6397: Fix mt6357 RTC year offset handling for hwclock commands

 drivers/rtc/rtc-mt6397.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)
---
base-commit: 97274527e8dc709bbb4c7cb44279a12d085da9ef
change-id: 20250109-enable-rtc-b2ff435af2d5

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


