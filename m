Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36051E64A88
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KidvB40Fo4maqTRIu0iP08tZ2RUHssOz5eIQKLC5Snw=; b=mqHSzsChq9cMjj
	4U7b2kfTXUue4KKWs0ZBzkI1SDJiVPcoIZDzWwzKj6Cuk7CxKv9Lk2KvtGmLbkGxPz+OFJsLIZVnC
	nC2qUVe6dx2H8MfQl/FqP2FLG7ohmRbpORqDedWNZIJQ0+xDYHiQkaPkyd37bcAkohEpItnqEZLSG
	D0HHYUqCtlbpPwCdx5plkX+mMt9Qz7jXTlI/wRWCCBOJ8b4/+0UxiqBLzbj1/jSmQN3+ATTnV8xwz
	A32hq39bmw/wIJv9Rzc8FeQ90NXnGzjZUoIfTm/M7R3/VBJLIb/RfQkmKhBnS5nSjgelhl2DvzPg5
	YQYgTo508ekPH6ZfaZbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISDZ-00000009SWh-0TRf;
	Tue, 03 Dec 2024 12:41:29 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISCZ-00000009SII-0AwG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:40:28 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so6450738a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 04:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733229625; x=1733834425; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KidvB40Fo4maqTRIu0iP08tZ2RUHssOz5eIQKLC5Snw=;
        b=Okk7vT7REpfVqzqUuHSxWV6z7/blJ5+s4mWDSEiHTf7uRrOqe3RVwc6P7OJ2mxX3cP
         PF0ZyVzBWhhJm+0HGAQz+3qA6JovP3cqyEfbz9B9BpDpMOkgRKXWjN8dPUpWbEdn8lgb
         u7P6s1KZi33MGdjA1wTGTM2ELY2eE1lmm59WRrxMWfRIgxGOxDvOq/Z7ZkPL0MiYfhzl
         QxXw71X80olAcJ/nRRKfcygNAI77nvPT7L4KVZc4qQwo08fVnXXwaeDxR1NImSInrxsg
         Vw8wWKje2fU51iv1WeLnp58B9sxG6cR+LPkeSZIAe6MzqbpINBVGz0dNOEtKugV0KE4o
         HMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733229625; x=1733834425;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KidvB40Fo4maqTRIu0iP08tZ2RUHssOz5eIQKLC5Snw=;
        b=P80V61S0j5yrLBTufArwibw9oAXxvfWqpF0dXN76lRXo4y87X/1RaOVySX7a+4bui7
         pFgjn0e+epxgPUihRPBPzW+uYzs8Zz17xfR+i0GI7iix5kZI6jbazd4C2lQzJjxld8K0
         ACHV9vBhwgQaWBys2Higiu91jL/uPBeK0QUPrMWZV5e91rsDZQW5UL0abxRbed2ZDdsm
         7Ulz3XIoHIop/E4nnFSPwRpOqP4prIv77qObSG0ftpeLBcHLU2WwDk0VMfecgO7sX0L8
         v5gjzITILzZaFeF3xWCjKZGJhcrmfpDDBea2yDH6ZmueQCjrOeSCsUQ8J6uZg02tSxrs
         4grw==
X-Forwarded-Encrypted: i=1; AJvYcCVnQr0GZrqZNpMfFDYnZ3RpU4WO3UP40kpzf3paipr3OJOTeJd+0VFklWgAGb9CvSSOJYtElGW1t9fETbdJ1UEv@lists.infradead.org
X-Gm-Message-State: AOJu0YynVS/04YSxuGcTeeSE9MRGJ1in2VYNKzym26fcZl5uMSE6bCYo
	qNmcTBUPsAwMOQyrNyX2idAI9n6yDHluI1vFH1+bpbeYW1KLv/2DxV0coVjmfeo=
X-Gm-Gg: ASbGncsp/ah6gtDWB55ShpobF49ok0Vh4G0c6dvdPdy+EKaoJVwV00fdIs0GH8iDDMw
	9xuqZKgqaI2rA65BnDzUGNl6djSN8P28UM5eGA36cp4aoGmK6kHDL6we49EShFwrBsTSEWC5yVF
	FaqqIg1iBMxsvBST2tc+kFzlHKQFkkblijkD8OhAJxreXAiEgP1QQV8L+BytjmFJSYHFNnmRvw6
	M1JSaMIakVs/kLJpke8nf03wIFu5HFw/qXMcR+cdN5ePaFRx3dslIr6ZcL05fkHnZ3Ohf9bcKEk
	1XBYGsTRAG8b1rZKRQtM9ajhWjWmhBbEVw==
X-Google-Smtp-Source: AGHT+IGhLdCxi2DbU4tBTCS3xMoJ+eN/NSNXdGYE86xU3cbMqxxR5/XeFJzbPPRvBrj5K6P11uTb2w==
X-Received: by 2002:a17:906:30c2:b0:aa4:fc7c:ea78 with SMTP id a640c23a62f3a-aa5f7d390bcmr168580266b.23.1733229625507;
        Tue, 03 Dec 2024 04:40:25 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a4csm616809466b.106.2024.12.03.04.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 04:40:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/5] Google Pixel 6 (oriole): TCPCI enablement & USB
 updates
Date: Tue, 03 Dec 2024 12:40:23 +0000
Message-Id: <20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADf8TmcC/42NQQqDMBBFryKz7pRkULRd9R7FRRqnOiCJZIJUx
 Ls39QRdvg//vR2Uk7DCvdoh8SoqMRSgSwV+cmFklKEwkKHaWmpxVGssLtOGswusGMs9ZJfLD4e
 seHOe29qRp8ZDsSyJ3/I5C8++8CSaY9rO4Gp/6//u1aLBhoiGrjHdq7WPWYJL8RrTCP1xHF8bp
 zQ6zwAAAA==
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044027_091329_BD11AA69 
X-CRM114-Status: GOOD (  12.06  )
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

This series adds and enables the Maxim MAX77759 TCPCI for Google Pixel
6 (Oriole).

It relies on the bindings updates proposed as part of
https://lore.kernel.org/all/20241203-dtbinding-max77759-v3-1-e1a1d86aca8e@linaro.org/
and
https://lore.kernel.org/all/20241203-gs101-phy-lanes-orientation-phy-v2-2-40dcf1b7670d@linaro.org/

With these patches, we allow the usb phy to detect usb cable
orientation, and we make it possible for the USB DWC3 core to enter
runtime suspend upon cable disconnect.

To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>   
Cc: Roy Luo <royluo@google.com>
Cc: kernel-team@android.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>

Changes in v2:
- more appropriate dwc3 quirks to achieve reliable Vbus state detection (patch 3)
- drop patch 'dt-bindings: usb: max33359: add max77759 flavor' from
  this series as it should go via linux-usb (Krzysztof)
- max77759 tcpci compatible has changed
- Link to v1: https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-dts-v1-0-5222d8508b71@linaro.org

---
André Draszik (5):
      arm64: defconfig: enable Maxim TCPCI driver
      arm64: dts: exynos: gs101: phy region for exynos5-usbdrd is larger
      arm64: dts: exynos: gs101: allow stable USB phy Vbus detection
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 TCPCi
      arm64: dts: exynos: gs101-oriole: add pd-disable and typec-power-opmode

 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 104 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   5 +-
 arch/arm64/configs/defconfig                       |   1 +
 3 files changed, 109 insertions(+), 1 deletion(-)
---
base-commit: ed9a4ad6e5bd3a443e81446476718abebee47e82
change-id: 20241127-gs101-phy-lanes-orientation-dts-9ace74a2c25c

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


