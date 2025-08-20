Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B884CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 17:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+gWtZEHKoGP7mw0rgmfais8XlelkoGry/mMQ7iZX7hc=; b=S2gz4A2WRkuzKg
	vj97za0ei4dqYYLdCIe9Acr7Npznda/RYuSAU+bac8rn5TP0mdZHhOW81fm3EYd1/+JrDzXQyRhKh
	Gfb3/pRq5yb2W2LmoV0+dA2jp/S1YvyRonoMnA2AVCb2wspdHgTSKDjZYJJNBW6kkSt/GQdA1MOw9
	nHnKVVL3HCC1mKB2EbNOrZG+brQFkGuQuwhQq7AiOXPKyL2CA/c5yninm1giQN/7+ljhaVmmKNyDZ
	p4+6g5O+pxGnRoYM0otFlhseKG3BsKUXRKeJ9uNGm3xlVRmfN7Y7Eb2xpUw+W1nFWDdi9q78GEMu6
	7Iw+OebLRnoCe35ei0Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uomYP-0000000EXCU-3DGH;
	Wed, 20 Aug 2025 17:24:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokHX-0000000EAYo-0U66
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 Aug 2025 14:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=+gWtZEHKoGP7mw0rgmfais8XlelkoGry/mMQ7iZX7hc=; b=BX/ezW/qvMT1s7swsn03ElxkyQ
	PkeEEkizpzZyhRNOr8iQM3qkWqXtx/PSQloLGFU2SFTmV3Rc3wxgaJdEzIbOlaoVdBcMqJji2de7V
	aoy9FqQAwbjfIZNLKrJgYSHyDgeXJeX77c9+4HAAN064CIUr1/MfAfdfOcTQtILegcf7TzY77uZKV
	yzdNnz590TjCPZ+e6NSrYovFCeiIK3l73D8SIu6KQlN0Z1a2+R2uGzgf/FhtuD5nKODbrWDbXqxm1
	m5vtqugayPdPFjPQNI85Va4NUb1sFpGNFTMcBUeII6FeNqnowV+XLi6Ls2oyyXFgBFtL7QlEzVvsN
	WQPP/6MA==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokHT-00000000Lo9-3XtT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:59:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-245f5213679so4966775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755701953; x=1756306753; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+gWtZEHKoGP7mw0rgmfais8XlelkoGry/mMQ7iZX7hc=;
        b=ZQucbfZBLJvTjwfYXXfSm3moJum6QOwA+sh5b8Xx3fIyvAtNCCmoyfSaKpLpTHr0E3
         bFxoN+tEfHkovXMtmeL22L/k/51ILk1U1A4rMTiWo7Z8Q/7QE+IboHTZrUzkrY+WyYOe
         knTPaizCcE9nYReJ5+BNnG081ioceXx27idYdvbH6MsO8AgzwdKIH/a02aL5JcVnOtJi
         BtplhnNf5ox9KkBesf6GBbY62aq9Ap7l4xHCQX7LETuE4xkNYOxkrP5eUf8QfZUf7GbX
         SQ2Tgx846SPWcealJsJlTp/pTIwONQmpuUMxicJ5Z1w6UHzsHRC30x/F/juagu9CDdom
         dWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701953; x=1756306753;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gWtZEHKoGP7mw0rgmfais8XlelkoGry/mMQ7iZX7hc=;
        b=N2oS0wpD6SgEg/52j1dYM1rA2Tk8kMu3lPFHREGOYrZXP9COqTl6lgyrkeghlrtZLl
         pO/NvLmB5YLhcfoDcAMXQcu+JLUXpXH9e3Vd56sUQmdHsnGUx+wcJGa36c+/b/egOgpD
         8orLkPvA7rCm2T9pIc/iUFzaHHgpT2g0aC2LfEPG+nx6L2TmGScVeyzSIEXKZ89O0Za2
         pJ3rB5YOabTsk98p+pq5r4rG0r8yChsLcVhadXq6EVEwZBUbkvZBbUDb5YeiC7nRYdOL
         xpIicf2GjgRe5y1Lb2U9WnKRmvNxxIj1fRTIs+1JLe78NCHQOeNhfCmlFsOYC3JuKXqD
         8ilA==
X-Forwarded-Encrypted: i=1; AJvYcCUpfxD1yaj4pxHXRyleLzab7betYBjLyG5hi2jzXq0tP3Te+RPaRqngw1mW3hJFtq5iMiIx7jB2eokSbCuB/8Uj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfv9XQyaxOX4kwEouno3x6KErbC6GwXxqsIYS4rjUsghiMNUvx
	DBVunZv2N/O+uhADIerXr4Yiuz6JhR0u9oLt3OZFWqDpusPcjkvArN/S
X-Gm-Gg: ASbGncsf0Y72PF7UzhdxDyMsV2AnIcnw/TRzt74PX5WfYK+q2Pl42TYc9pAW8VyUdeO
	jsd1fCzaRUcAv/BPlDnGuBrKToiAfKWmn1zOqzXw/OMnTHEoqKWTxAYul4kfnqgoKSLuOrIJ7WG
	GKAf7WHwIXos4R8S6p5/YWF0qf9EIc+w9YYFQvZ36IRtLV+3UQjLfyd9sw+3AVLiITPpUYQMcjF
	2HOQ4qSGDkzqagDZSTov4K7Hz8gHWl7FGbTIOb1ESnz9c6b09lOU+giPAT1cT2Qc7xcGQg6hkhl
	nXTYZ50an6XEcEB5GU97+u7yu81DG7dm6miV5zfwXOc9CdniAgs0NjZL2nrKb792Zc5nWU+e5dI
	QBT5IGoqX7F2idoKErxw9+otXbJlySStgY8H6btW2CwL282E=
X-Google-Smtp-Source: AGHT+IFuZGLvyxMcilBbJyU+WX5ieFDHPZ5qcPgTlkAoOpIPQGjsZxxRLuTraJW+LFjnoMiyYGMkLw==
X-Received: by 2002:a17:903:32c8:b0:234:d292:be95 with SMTP id d9443c01a7336-245ef237f3bmr39664895ad.42.1755701953108;
        Wed, 20 Aug 2025 07:59:13 -0700 (PDT)
Received: from [127.0.0.1] (aulavirtual.utp.edu.pe. [190.12.77.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e257809esm2606455a91.24.2025.08.20.07.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:59:12 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/3] clk: samsung: exynos990: CMU_TOP fixes (mux regs,
 widths, factors)
Date: Wed, 20 Aug 2025 09:57:21 -0500
Message-Id: <20250820-2-v2-0-bd45e196d4c4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFLipWgC/02Myw6DIBBFf8XMujRAtGBX/Y/GBY9RJ6nSQEM0h
 n8vddXlubnnHJAwEia4NwdEzJQorBXkpQE3m3VCRr4ySC47rkXPJDP25rT1I1deQf29I460nY3
 nUHmm9AlxP5NZ/NZ/OwvGGerWtsrqrnf4mBZDr6sLCwyllC83XA3XkgAAAA==
X-Change-ID: 20250819-2-ab6c8bdf07d7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755701948; l=1078;
 i=wachiturroxd150@gmail.com; s=20250819; h=from:subject:message-id;
 bh=W68k0m74FKq6rT8PIZd3IxIAE0Dive0UITAv+zCe5+g=;
 b=u9TvdLut9T/l2pJ/hsZbjYfVLj1dhqtUVvMITE8G9SK/eUYZGzp7h0OtJjP51LUJjTi8syUTb
 /JlJJyTwBsfCogQd8FAkonDyS60JQ0a7+mCVss5qZP2pgSvtW4nVz5E
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qNvcL0Ehm3chrW9jFA2JaPVgubN5mHH//uriMxR/DlI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_155916_033047_D5AC523D 
X-CRM114-Status: UNSURE (   9.07  )
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

Hi,

Two small fixes for Exynos990 CMU_TOP:

Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
CMUREF mux/div, and update clock IDs.
Fix mux/div bit widths and replace a few bogus divs with fixed-factor
clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.

Changes in v2:

- In the first commit the divratio of 
  PLL_SHARED0_DIV3 should not be changed.

Please review.

Denzeel Oliva

---
Denzeel Oliva (3):
      clk: samsung: exynos990: Fix CMU TOP mux/div widths and add fixed-factors
      dt-bindings: clock: exynos990: Reorder IDs clocks and extend
      clk: samsung: exynos990: Fix PLL mux regs, add DPU/CMUREF

 drivers/clk/samsung/clk-exynos990.c           | 154 +++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h | 402 ++++++++++++++++++++++++++++++++--------------------------------
 2 files changed, 297 insertions(+), 259 deletions(-)
---
base-commit: 886e5e7b0432360842303d587bb4a65d10741ae8
change-id: 20250819-2-ab6c8bdf07d7

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>


