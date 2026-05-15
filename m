Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D64CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vat830XxEIb6nbNDu27nBjMOJEfurilB5NC72HXohd8=; b=DNDVPrmuC6B39m
	u3PiHcqxe4Y4dkDRsaFZUw48lC/+Qyn7WEbEKOsbIYANgde4uW1QpkkHS3ovbWh8PLmYriV9F10iI
	jCC4Pd68BlvLnUJtFhQdI5Libke50zleKp/oWNnrS26MINRaqTPhDPSGf4ei9vItywvANeCTl/xTQ
	DlH5Bx/i0tWSr+mX56ONprOSCWG2uzegqYgAGidReQpAO7rTzkBkEADSDKG6kcblc9ha0YU0NpPtA
	n3r3eYc5omXcl+DlWVmEiymyd47pXmkgSDLhyN+lfdz1JKj2EUI5jerlHWG9AYjU3gvHBd72UovgT
	v5+z23qRIVGK1GVY4LNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouI-00000007tnm-0EdN;
	Fri, 15 May 2026 09:32:34 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouF-00000007tmJ-2Plx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:32:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5a8721851e2so9910632e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837549; x=1779442349; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vat830XxEIb6nbNDu27nBjMOJEfurilB5NC72HXohd8=;
        b=cgABWJxFKzKUypR9DUS/wWs+DXcoDWTKqdzR4Wwk7y4QxBhRVpmFg1iTnQbrn/ojhe
         vxvTTPfwv3gz0CL5lsih3q3v+tUWqaCEfhV/Biw2mtMoEVy8QOLMGqvCGERVlFEkjHvk
         RSsuxj7+G5y7lACaWXc1S/HDhSkEJ/9PkRbr3q+pc70QK4O9hgY6Azx/D17Qiwoqxljl
         4XNgKh3XHOO33rfj/QqFSQIJ3e0Y8KRIRxkfrtb/7GkyCJWwiRWw625382d/7tClCCL1
         6CSMWTqSOi0uFYX07QWFeN+/a7ZUgNdCLlly4mxwARfHCMXy7yiHScJ0OU+1CUY/Jd23
         PFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837549; x=1779442349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vat830XxEIb6nbNDu27nBjMOJEfurilB5NC72HXohd8=;
        b=E+1zNwPaT8vJ+HqmpJ4mg8csVAJVHoXpFcQKGMXv36myQ9iXo0WR9Z8SAolD7ZZb/O
         A0uWbqVNphCUf8UTx31HC+j2oPzaLxSQSVDYviVDDlLsakXfjod5/1FT/CDbhVd0kWUb
         94kjZPK8gSEDqRuELeVFYODWV4SwaasXwOars8y8aSEOIqpfbbgp+kdCHsS7GbOZq2EJ
         7RjOS4UoFHOtYLVf1qU7b7jWKE+HYvjpNLDF5orGwTW9egHB9+7vMMxVZtzlTM0rEMn6
         wRQVOGS8v/5plzIhRN81wPTIm20ZazsPsCjrhTLgASTrS0bt0ckz+Tte6H2eiffhLqy6
         ZzsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NDXUBkEESRdTNC4sHcdl7UbYtcn96CUDauLiNWVCMXU63DJaFCWeYzw5bPqrxSxnFntmOuSj+BYwOHf0GAo3z@lists.infradead.org
X-Gm-Message-State: AOJu0YwhGakcJe5vQ2qF5k323ZCUfwf8Lg///rWT182kVkgSAi2Q1/Vw
	2J+rMh+5s6e6oUUSdcYzw8AnIY80Rya12aDf96gTbgKmRFKRSMUogzdyND719njIFqk=
X-Gm-Gg: Acq92OHNdKJCBYTahUXAO8zNDLKfb5v0UVIQjAivXAuObj5b1ftRt+fMOCV00fAHpAw
	yZVs0asj5wyyffETN4UPEg6xgTCs/UdeoQjWzCX6WshFt2DjHJEUWkF3yGRdZhNiiBU3gif79Wq
	LEkdWTJPl4kn650VzrdJRHv9y5BHgDkoKIRtOmDTCgVXeORPwX96cKcyUWsgmDvJ1d4EwRsd0Z+
	FBT1PWoz6kGrXJLKj0PxE4kBAD3qoBSY5i3C+p5EnOQkUzIlqQ5LVSqHcaGCq0xhrhRJPGH2S8J
	LZ+i1V9M4hCnbkYreeXUY1dqxgeLhANuqeJ+oPOWKju7HBjcq62myfHoakKtQPj+FgaFbFmu4IH
	c0nMmC4Z/Wi+je5SVqBtZBadl5qJfVxxSAIgYg3JgPmOS8Y2RffWB4HxLyAWUNoN7eXxuQpFEMw
	M/rEOsrAnKYZCbOgEijp4Vj7RBERHMtThsGYZKJ23tHJ1GbtK0ta1Hd3RFEQuXOkgduS522Zbvw
	MpL9VjR
X-Received: by 2002:a05:6512:308c:b0:5a8:efe8:cd9 with SMTP id 2adb3069b0e04-5aa0e5e9c10mr934778e87.0.1778837549046;
        Fri, 15 May 2026 02:32:29 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:28 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and cleanups
Date: Fri, 15 May 2026 09:32:24 +0000
Message-Id: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjoBmoC/2WPQW6DMBBFr4K87kS2kyGUVe9RZeGYIYwaMB07V
 quIu9dApS66/CP99/48VSRhiqqtnkooc+QwlWBfKuUHN90IuCtZWW1rjRrB+XmEND5goPtMEuH
 k0fWabK/PXpXaLNTz14Z8v+xZ6PNRyGk//oGLZ8We7HHHbj2ILg78EUBoDpIiOLLNtaYOsTFtx
 tVxdZHAh3Hk1Fb5fDAg3qjVNnBMQb63f7LZdL/T6//TswEN7tV32Lm+OSK+3XlyEg5BbuqyLMs
 Pu3xZ2R8BAAA=
X-Change-ID: 20260505-acpm-tmu-helpers-4c5af0e2f07c
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=3775;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=+HsrIB4HqtNDz/N0huuhjVUr/0qz3ZIpfdPp18ITqeg=;
 b=JXB1K7dwaCis2Kn/x69HsjDl/PoJmKxghyoaD8LQdV2AwWHQR3qmkOpgjseSm20mx1QmOgw41
 aX24nnlBZ2JBQgioiJHvgWfP+X+8J/2U8zavoKfuI0yrOC8FuFDHbOs
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_023231_662943_DF83DE39 
X-CRM114-Status: GOOD (  15.12  )
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

Hi all,

This series introduces protocol support for the Exynos
Thermal Management Unit (TMU) to the ACPM driver, alongside several
cleanups.

Dependencies
============
Krzysztof, these patches together with the acpm fixes from your `fixes`
branch will be needed by the thermal maintainers. I'm going to send the
ACPM TMU (thermal) driver for review. In case they'll take it for the
next release, we'll need an immutable tag with the acpm fixes, cleanup
and thermal helpers. Thanks!

Other notes
===========
The MFD and clk maintainers are included because of the cleanup patches
(3 and 4). ACPM updated some structures that the mfd and clk client
drivers are using, so these patches shall naturally go via the Samsung
SoC tree.

Note that when compiling with W=1 one will see the following kdoc
false-positive warning:
  CC [M]  drivers/firmware/samsung/exynos-acpm.o
Warning: drivers/firmware/samsung/exynos-acpm.c:118 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'
Warning: linux/drivers/firmware/samsung/exynos-acpm.c:118 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'

I proposed the following patch to fix it:
Link: https://lore.kernel.org/all/20260506-kdoc-__counted_by_ptr-v1-1-70763486871f@linaro.org/

Cheers,
ta

---
Changes in v2:
- collect tags
- resend as sashiko couldn't apply previous version. We want
  sashiko's review feedback
- Link to v1: https://lore.kernel.org/r/20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org

Changes since 20260113-acpm-tmu-27e21f0e2c3b:v4:
- reword commit message of first patch emphasizing there's no
  functional change (Krzysztof)
- remove static keyword from `static void acpm_set_xfer`
- replace for loop with memcpy in acpm_tmu_set_threshold()
- update kernel doc on devm_acpm_get_by_phandle()

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
Tudor Ambarus (6):
      firmware: samsung: acpm: Consolidate transfer initialization helper
      firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
      firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      firmware: samsung: acpm: Make acpm_ops const and access via pointer
      firmware: samsung: acpm: Add TMU protocol support
      firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper

 drivers/clk/samsung/clk-acpm.c                     |   8 +-
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
 drivers/firmware/samsung/exynos-acpm.c             | 113 +++++++---
 drivers/firmware/samsung/exynos-acpm.h             |   2 +
 drivers/mfd/sec-acpm.c                             |   6 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  32 ++-
 10 files changed, 397 insertions(+), 72 deletions(-)
---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260505-acpm-tmu-helpers-4c5af0e2f07c
prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:v5
prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
prerequisite-patch-id: e877f865862ee94f5750b877b5fad863d8acd7c8
prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa
prerequisite-patch-id: df5b1d9df4c8894afaff645c9eb84aa4e3daeeee
prerequisite-patch-id: be74a55583acb36dedca3e118f49633172979617
prerequisite-patch-id: 31ebc7bd806d4d466c256049f32e3270e2caeeb6
prerequisite-patch-id: 7ea0832fcf76e4f40e18b74083904e7e37e1addf

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


