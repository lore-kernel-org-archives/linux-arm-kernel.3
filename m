Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5F1CCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y6H4fhzWNfAOw3fABnsgj+mVJVVC5fU8/bSjCOymm/4=; b=c31Nl73uQ1BiRa
	KDlShpR1dD/crzYFmnvN/LI/SB5cQ8X5j6jX5FIzwOMibSye76jyiCSxM4hFGZkNRRK8ZKkN7zO/S
	V6hkuznjsHbM1FmkWxuxTW11pwSK6UdEdmyj4VBkXX9vuSR6xsygGIreximdUt7rAO5aWwHjwkVGB
	OzKD1G6p/P2Jc2KHlJCV0WqfnFWBzm/u+V9VAxL6462dnOW2GLE1W+pg0Is/l3wOe391q6EIpQbJG
	Ka4KxtrID24/jBla3uc44ZnmBSgqBevjlYb39KrpKJ13GugBtpuX/bKvk+ilvxNCnHPFgwucmShGF
	LiBs0Js/1IlfHVk7WFWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6EA-00000008LHN-3TEq;
	Wed, 12 Nov 2025 08:29:18 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6E8-00000008LGB-2dAk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:29:18 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b31507ed8so407181f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762936154; x=1763540954; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y6H4fhzWNfAOw3fABnsgj+mVJVVC5fU8/bSjCOymm/4=;
        b=yWQv4hqTRGTwJIasSzMnwfSikMOHiuHgYyPosSNPt5ZSE1hantgTTtMEm0j6RTtiFq
         8QhOS9wqbJUZEQsI7q5CLpT8CMi0S/SwHbB/SWVNTV9RnnqI31qSPeHh7FgH0IB7FoXV
         JnLzPdZSL21BOPhN+q1IwqXsNlL2L4uCGsJeusxqd3gFFvnTVytZvbNpX8JNFINRiGye
         Np2uEGraatINYr9+N718MRF8i+Vz4fx5ss3/Rx0EhlugxPfB5L25ud2c1jVsIWvl4YuX
         PwXKnB2G09JXatY1B3CbOtyEeEMTs1uA+3xCrp4xGrX5snMQW4TnfYTouNnYE53Hv+Gz
         +LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936154; x=1763540954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6H4fhzWNfAOw3fABnsgj+mVJVVC5fU8/bSjCOymm/4=;
        b=QebEFwMjy2bhrajuIjZ5zE8Xi9jOuaBgNd4sXbZI0MmqBex5aegZh9zZ5UdZ1o8ljd
         KnM6ciNNEHFraGbTh/ootOqzzuwa6bU+G1G2uR14++bqWI4Vz8ccQ6PTFUC/kmRTBnRs
         7m1vliB1x/k5v/WTObvHmOaj+F3cdrvYOLleTr2JmR+HZJLuI2rkqLMJKrjt/qrTJ0yG
         x5Byz/MngsMU5EX09Ix8O03TXxQyQzGC+4GAe7keskisqQN+3KSnaMAtpBAUSIC5gdQb
         cyGhy4M6iDekhZ2BPYnlSmZpQHFgcnFCQvnIr6DPvpznfNIR5D2TvDsTv7kfPHOnkbwJ
         hzXA==
X-Forwarded-Encrypted: i=1; AJvYcCXssljWLK3fRR+WycWEtRrlgix8TP4MROsgO7I++v5ithRcJW4UVc6fcQh5UZaB10N2z4hwxPZSXWfQ9KjL0UZH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfbw498P0XR5eUXJet7eLW719Mzz7fly5/KFkAyq1Az7dN8dfL
	s2VFGnkWQeOdHRu3pejA+wmhKB5V7Oq3bAYA4aihpwdLuKxyuUZ+WAk3eC+pUEAhCK0=
X-Gm-Gg: ASbGncuuW66WfwrcEkwGL9sptO9zzbF+9Uwv1l1VYP1T9AINRuQz862a/AAVW1mg9ia
	uTYnSM1kOTnbqmIdTOY5Bmr3VS5kw1Lx4pGCv2GZwpY8gg4NXgnFDENs/m8kC2PttuYEsODdZnf
	tTLY70f3H7gtK+ZxeTJLA9K6/phuRZ52rQq+BaStt0IZV+u3ys/j1DEBhwi2knCReDQB52h5htP
	rnJJDHBtlDoZD9iUgg0AQXQNGBJVuaaYgc3NDU5Z84yKZqRI4aXGOUJJWt9qWm/OBmzPqSA1XnJ
	PD0c2KCEexO915PQSkSziyKCIMBLWxUbyfBTxSgU+5I2lhyA7CL0a5GBX96bHPSY3PzxLfey4a4
	EX4/OZEFg8/53LunhDuPt02GNI+QnfG0pkbJKNd5p6ZATDp3+feD3wx2U8pLx/su7KV0EFkcka6
	Nm78ZMr+e+yWJo5PBAfUy17VmUSy8jRShnlZPRcXIdKtzocPPOjbFc2osi1VQU+l4iVcg=
X-Google-Smtp-Source: AGHT+IFyADtGKTaC4hHQ7wRzm9vozoNXIQX3r0eJ6FRrtFXk82uJWL1huXSvsvBDb2sySH4eSjmtqw==
X-Received: by 2002:a05:6000:2010:b0:42b:30f9:79c9 with SMTP id ffacd0b85a97d-42b4bdaed56mr1411001f8f.37.1762936154240;
        Wed, 12 Nov 2025 00:29:14 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm31571428f8f.35.2025.11.12.00.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:29:13 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/5] nvmem: add Samsung Exynos OTP support
Date: Wed, 12 Nov 2025 08:29:04 +0000
Message-Id: <20251112-gs101-otp-v2-0-bff2eb020c95@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFBFFGkC/23MSwrCMBSF4a2UOzaSVx925D6kg6TepBekKUkJS
 snejR07/A+H74CEkTDB2BwQMVOisNaQlwbmxaweGT1rg+SyFVwJ5pPggoV9Y9KpAQerbX9TUP9
 bREfv03pMtRdKe4ifk87it/5TsmCcSdNq180ae9vdX7SaGK4hephKKV8ZD8GdowAAAA==
X-Change-ID: 20251031-gs101-otp-2f38e8b4b793
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936153; l=2360;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=op3wShXUu6uL2mvqV81fg417E/SMxbfH5zAglzBCAiM=;
 b=/v1HWFyFoDLMFLrxpFMsj5XvuEdMXTb7Bt0vA9rXW3tVkGbR6OsfxxFh71dqUk9ijNk/Jh5ju
 al1QkneDVcwDXa7k8uFqOIndACFX0Cn5p7qAkf1BFlUE5DacK2eX6Qi
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_002916_702192_FA616674 
X-CRM114-Status: GOOD (  14.88  )
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

Dependency
==========
Typical dependency of the DT patch depending on the bindings patch,
thus the bindings patch could go via the Samsung SoC tree with
Srinivas's ack.

Description
===========
Add initial support for the Samsung Exynos OTP controller. Read the
product and chip IDs from the OTP controller registers space and
register the SoC info to the SoC interface.

The driver can be extended to empower the controller become nvmem
provider. This is not in the scope of this patch because it seems the
OTP memory space is not yet used by any consumer, even downstream.

Testing
=======
root@google-gs:~# cat /sys/devices/soc0/family
Samsung Exynos
root@google-gs:~# cat /sys/devices/soc0/machine
Oriole
root@google-gs:~# cat /sys/devices/soc0/revision
11
root@google-gs:~# cat /sys/devices/soc0/soc_id
GS101

Cheers,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
- bindings:
  - drop dependency on nvmem-deprecated-cells.yaml
  - drop clock-names, otp label, child nodes
  - add interrupts prop, make it required and add it in the example
- driver:
  - no longer a nvmem provider, register just to the soc interface
  - update comment about the module name in Kconfig
- dts: add interrupts, drop child nodes, drop otp label
- Link to v1: https://lore.kernel.org/r/20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org

---
Tudor Ambarus (5):
      dt-bindings: nvmem: add google,gs101-otp
      nvmem: add Samsung Exynos OTP support
      arm64: dts: exynos: gs101: add OTP node
      arm64: defconfig: enable Samsung Exynos OTP controller
      MAINTAINERS: add entry for the Samsung Exynos OTP controller driver

 .../bindings/nvmem/google,gs101-otp.yaml           |  56 ++++++++
 MAINTAINERS                                        |   8 ++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |   7 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/nvmem/Kconfig                              |  10 ++
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/exynos-otp.c                         | 160 +++++++++++++++++++++
 7 files changed, 244 insertions(+)
---
base-commit: 4b67e4c65c1e0740ac12bd0d790eb5a9d0091aaa
change-id: 20251031-gs101-otp-2f38e8b4b793

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


