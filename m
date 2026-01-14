Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB03ED31A2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e1dp7x1TdxmlhWgtnOwQPYR6NPaurAoP493Ro32X3eg=; b=jU7i20luOzjCA3
	tRHOzmKsNLujDuT9Zrxaqtjr+M4Yuxxwjabv1U+htMJpF0E/Qjn8ACCNNlB/Pe80ZYpEAlirubJ6U
	OWkxSFHSBiyAAGVd7PkoqPNXf2AxvoP5XgXP86cpZpy0PoQZFgEFxkqueVUdlDxvgb8/OlCBvUyNA
	fEKvfV6WPfjT0DkuJQno6Zmt/gwnBg9fRR8O0XBFpO6jFI6iiVCYTIfsk+btJ1hwZKDC3LyVm/JgC
	Z4fDaDBsQz1oI1fFCx61ITZnjmlEdkI+T9AWRbYPqLdF444vkjQ/cl+I1lYPqDeYV4SQ35cOStEMa
	GdSSr1LbbAjHZDCLOCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwgx-00000008QZZ-1u40;
	Wed, 14 Jan 2026 08:57:27 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwgt-00000008QXb-3iLw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:57:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so7111418f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 00:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768381042; x=1768985842; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1dp7x1TdxmlhWgtnOwQPYR6NPaurAoP493Ro32X3eg=;
        b=PcIhVUpCkcv8RZStqlyz+lApQ+/acsbRVDu45jXAUdGcypEC7cEXPaucFjNIn02XJg
         jq5PoUHmvjC9CLzhRJVhRVHCSTVa+uSGdGWjiEZEFoLun9fPOLXnEa+iQI65890YbEDO
         DWela8kaxUyZbOWK9tjUc2TNem0BmfGlkIfSa/5YSdmDMCF0NVKnwBBq9UbA427Gr93E
         EBT6z1Q7tRMUedINxMSh4ut1y0tUzXX6NZKcnM8BzokyRUMeCZDIRbPyJ2ql2L3723Tv
         viZTux+vlvEFuIkaUBJoBVDgKA+1c6dvJf43l2s+zOscqIjsZH3J77xAFzKRyz+c6e87
         FyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381042; x=1768985842;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1dp7x1TdxmlhWgtnOwQPYR6NPaurAoP493Ro32X3eg=;
        b=OfaSv6yShgJ+4eFk34SVgkMjdhYBzgAqGV3DfnEAhQkWhTMP0vJ4Y9boW3XSCXj9KO
         EL0/OoZ5ljgsV3wuqVudutPrKD8mDxzuoHD4CwFvb+GSL7u/LVxZrtp+EJ6aYoK9JCHN
         3RlVRyjHwAsOO0cih8U6cTGpbjmb7JRkcg48K5JRb6PhqLvf+UGhyxe4qlEVVTVXmTrZ
         exaftSfvo0EL1g1gb8q+TfVuDNDwuCYlCksGTFYCWddqKLkeBDABy+Pff9W4dUFsOeOk
         KNyUMtzvbmcEVoQQtL6nba1qpoChnq95NAVnmTg6gAqIhN8pgr8sWm4/PcMWCgyZVMna
         p5gA==
X-Forwarded-Encrypted: i=1; AJvYcCUn1ySrwNAqs92XIYQ6eRJ+WvJ0b9VzZmeeL3r23VHmdl7NopWntSdqooc3PkHWu2m7Fx45JcIzMG25sQmPsKds@lists.infradead.org
X-Gm-Message-State: AOJu0YxnigHweGoWlL12MMnOQQFTYQ4GL0PIDOaptpdrz4AzVh+/AeMt
	0hb2MKjjM5B6kiQSOCXRB09t5DMhHcoIcQsEAgj0JzBluyN2hpQNp7WaVMuogifsnMRXJUQTKU9
	0R3sF
X-Gm-Gg: AY/fxX75rpIotgStFoCAf1ZqOaNBNPQezCtdirRAk/Sz+5KZcBde/UBiQuwJkQ09TYE
	857Yygw1Qz5Pm8Z32DFKuwrUs/l4o7gPISzXMG0VkK2YcswVuVp8argvUMY/4WqzxP33yBw8flX
	o8xz9g4zYhttBg6aMlFooqsjiWCHeyhMNx0F69rHNcoo4pvHnjQJoHHQozQy9G6lKIifRJTWc5I
	GDs+xQjna5fhp84yP7obwLZiFUsj/Ya/blnd/Suh/wBLrEs4qVsoKhzZYUyIgMwORI9p8MhWMK+
	nhd32fur2Et1zCC+dHA4tf5G3gNWUagx5ovOZXZek1EiBfVlCvHBkPQ/q9ukN24lgVnSfHqGJri
	Wt5i4dFt3y3PZATTo2qO18+K1W7xnHxesY+ODnDL/oouGZQppAaa35eoxNu4vQcNNcfkfMsby/n
	dZo3uFTUlpjQ==
X-Received: by 2002:a05:6000:2907:b0:431:771:a51f with SMTP id ffacd0b85a97d-4342d5cecc0mr1509239f8f.49.1768381042003;
        Wed, 14 Jan 2026 00:57:22 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:db84:c9f1:21bc:dca1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432dfa6dc4esm26892352f8f.23.2026.01.14.00.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:57:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/2] arm64: dts: amlogic: s4: mmc clock fixups
Date: Wed, 14 Jan 2026 09:56:52 +0100
Message-Id: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFRaZ2kC/4WNQQ6CMBBFr0Jm7Zi2GhVX3sOw6JQpTEIpaZVIC
 He3cgGX7//891fInIQz3KsVEs+SJY4FzKEC19uxY5S2MBhlLkrrE9owxE4c5jOG4NDL5z1hbWx
 7o1rRlRjKdEpcil37bAr3kl8xLfvLrH/pH+GsUaG2pL2zypPxD7LLIJT46GKAZtu2L5dF8ty7A
 AAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=F8VqL2mrsfl/1p9zR/dSxMnGMq0rUfHJkw5M2BNwhJw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ1pmEX0dBKj+m2U9h/ETeSvjMWpinjG1JERXz
 WiLvhC/IEmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdaZgAKCRDm/A8cN/La
 hc0NEACGH2Oq4613xYHjGjiC/GeGt4ZdZIP8dBjR2lHAQvsuH7HUjJg3g93u09Ivod/i1UIoatA
 3Vyl19e9Ar8oBbCGmDvSL3R8K3aEeKO4mIyd8KAHjsF39T/WqUdMQWBnXkmK2UiywJtWaXSenXs
 yHtn1Ih8mskutxU76gqDqCOgLMhq/q2XSzu73qstZKAr2sGKbvJdELSypSGvU5ysTcE1jkebb3T
 EeYahLaWlwDCI1H2jM0FB3XMnp/QuztGkjrUOWQ8CR6CU3iV6kUPdFAcufE/n58nevJuVhnaUQo
 Fgdd/Tz5Gw3iJcUqvZSLgUrZbb1Cw545R3eYNMO3+Z/z5yDiQ5WgrWQkDzp7Iovu+4Bv4fwcDLJ
 a7oC1c3vHo7/YWYkhni1YBvwixoG+RSere788SxBfRqyOM9QV28QIBw8bSVonHehe+GiqoGWGu4
 EdXsEfZ1z01QRqDe6SaGtJQXzAGYko1MyTxh1450T4+q2az4WjnfAGhRjCh6Gwn1AFI0vBylZ6W
 2mPGdcKfvm13Xh4yVijhT0aF9637jTJZEcYkXYF0tSs2G1PV3PPNpAnIlHnSep1h3u0X2ws1qgx
 bIG1BY0R0z1PEbTGISPK6trLpFeVpfsvPrY/RkWcXai8EfhiqC6qExWmvUZR9qyHRJRoWj+SIuS
 yvZjavYxn5UQtvw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_005724_190662_2AE603C7 
X-CRM114-Status: GOOD (  10.41  )
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

Changes in v2:
- Collect Tested-by from Nick
- Fix some typos in the commit description
- Link to v1: https://lore.kernel.org/r/20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      arm64: dts: amlogic: s4: fix mmc clock assignment

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be

Best regards,
-- 
Jerome


