Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C591D49C6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oieK3l8IF6JRtYEigMvXLtMbPyL5df1jv1S8R3nBwz0=; b=oF8TxVNhvzwoJrczicIoKVzebX
	JM7CjNV6HeS+JhvEx7bCD8mwt7dGtp/xxK3KrBstVMhQIX31lstVSULMfuhdDif8loNSyPQw5z1FC
	XrT6pnUALXsTs+o81IiEepziqWJ/LmDTttizVlwDPJhks4BcEdo6Xb5GUzKHcb5W+8hN39KukY2w0
	+rbRwDtypgu6XwM9KKkof/0uFB0++tEkfMg77hf82Ngrd+FxN7lv1JhsQH44BZ3qtoobjq84KVEvN
	7wKOdGlEwWrunDSYWf4frlODwWHIiXVnu6mulCamDFRB25G4V57/blXh1loV1h8729vOmnNy2kqOA
	e5av//RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljjs-00000001COx-2LQ9;
	Fri, 30 Jan 2026 08:20:24 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljjn-00000001CMk-0qfy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:20:20 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-81df6a302b1so1828972b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761218; x=1770366018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oieK3l8IF6JRtYEigMvXLtMbPyL5df1jv1S8R3nBwz0=;
        b=IRMmxSXvB69pq5beolc10w8/xPRFynsTh/vdlssyizAA1Qz1q4PUrva89k1/mkbXxM
         tKjIe7HZYT+lwo56mqFJbb6MSxMB4aGQmeYKAGGTPxgOhwexgdRwSCqtAiDcQAfGV3aD
         XWffGIJ7PYx0MgYtwDWdJ/vFcOJnyTj3mAphJ2ahEcrUlFQmMrOpAAEXUbxGBOWb86aF
         iXkC+szHeW8P/tjLjGfmVEunrAicov5mJWRlCdw5Pm3Gn2hNCBWeMFjEv8ROIDh2mXqD
         Q0zCM1AhKE/2VJRlEB7Dhl3KwNt/uxtyeZ71nAVOV8Py7W/+ZfgM5+nKGeCTkyCDdY47
         rvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761218; x=1770366018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oieK3l8IF6JRtYEigMvXLtMbPyL5df1jv1S8R3nBwz0=;
        b=dtkT9un9rH0J/ZKZQX2214OQ4ntHbLxM4fpLNfqtiJ5yBTz4nTp0TJ4XIhq3K+icye
         U0lNHvdDekbzloqE6bVW8TRR+gffihS57xNTXxrveEfRs4Kf3aceANuU3BuASF2M2mEy
         E00uCHvkgIduKTZxOUkpUvwSiWfys9rjhqFHHfjFIaxqcPRygE1I4MXOJuZ3UNB4usJR
         Pcw9y3VedAzZw5ISv0ziiJ6kg9mPXsAKcKyO1RLXUjUGL/WLocDU0JeBMJ4nmnyCvwEZ
         /BA7H0Q7AIHx8PKI+jq5svchRurfjjp9yxNWviSdT6vwjuuDMhDAdcC5Zupup7I0VfLV
         0WtA==
X-Forwarded-Encrypted: i=1; AJvYcCXrdQsKwp9PlFve5MwH46PAaiXQB8Mhj0AAZI0kj6HaC92kPrfojntUdDSwYop7tLV8GdjRfKnphAn5O0MD4YRa@lists.infradead.org
X-Gm-Message-State: AOJu0YwXAW5odDcQLY2ib+X2P9Pg3BMKrGtWGBKTgReaEvTSC+sisU51
	UepXcCIqj33CNm3xUxBO6LHYSRbnt3kR5rQ4m9CFg0+ea0XSRLnMBIz8
X-Gm-Gg: AZuq6aI2c7BlFxkaaX2Ix1RVVngdz/9T3dQVmdf/fJqG7UOewpJFq1Ts1YU3gPhpJm2
	lZiu8MlCG66USFN7N/h3RkMyfrM4dlyuftcbN8Ms7ywPgutF2FppXEjFj+ZVWwqY2yhpaKz11T4
	/bbJeNn61nK3uEGVriRBdmmcFw4Dw/qNwVSoZ3GeCnpDnbEqEBBLAneZ3G8a3EP/0lp1F102GCv
	7esGdgSzN/1MdcyelKVmgTv6c6/kDImocPU3gA5UOmhWhZiSf8R//XoyZBazsIP2tByraDFH7xa
	m4UZ9NiSuWEJ6sWaLFh4xljr2nfUI4DwDuVE0Gkyi7Q8TExJuHN2gZQOz1aYjSEtnq3jwOKdIGY
	BfuWmiUJ26YjtuRITAejnX9XVLDY9HMckWP8BN5H5U1R8jmviIiyc2Odt1H1D9VsJEUJjvkEI/s
	4KNhMCb7aJApAarWxcJTkEINLRoXNIPdbS4aFZtGe8RUyl2lUDujRTSFoAjcjBlp54XyGg6UVjG
	Q1CeUQy4KgngKNY3BNSRCqFquOJuTg6iam++5Wevyi7AxnuziJWw7L7hz0uDvAtFJIcWt4LqU5e
	Q3m0VCioUlC4
X-Received: by 2002:a05:6a00:2288:b0:81f:2140:136d with SMTP id d2e1a72fcca58-823ab65a295mr2190012b3a.23.1769761218223;
        Fri, 30 Jan 2026 00:20:18 -0800 (PST)
Received: from 2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net (2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net. [2001:b400:e3e0:2a58:5bcf:a65d:c80e:2087])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm7866018b3a.40.2026.01.30.00.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:20:17 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:20:09 +0800
Subject: [PATCH v4 1/7] ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12
 bus speed to 400 kHz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-yv5_revise_dts-v4-1-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
In-Reply-To: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769761212; l=1020;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=hdlRtRi9TLU18op7sSDjRmIwRirYAAfHoP1MDNioDPo=;
 b=fZnmMsrIsXktT/r/q2+TsbkJWf6xIrrJ17bze8j46nQ6BUBYHD2F7fsRHq+ze/StaE71TqDCy
 oa6BXmcCqmADPUb2cmft+rFczUbHRKCwFZ2DBi/fAeMujioTcYr4bQq
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_002019_258176_E813825B 
X-CRM114-Status: GOOD (  10.47  )
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

Configure i2c4 and i2c12 to operate at 400 kHz instead of 100 kHz.
This update aligns the bus settings with the hardware capabilities
and improves MCTP communication performance.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 2486981f3d6bd36f3fe780b21e834b85242f8aa9..7991e9360847532cff9aad4ad4ed57d4c30668a0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -231,6 +231,7 @@ sbtsi@4c {
 &i2c4 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {
@@ -782,6 +783,7 @@ adc@4b {
 &i2c12 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {

-- 
2.52.0


