Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEB2C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 19:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xYdK0AjjM8abFU3f5Mtgtyti4QxGUG4c/Abfg2GNbps=; b=SHO3Ohly+DgFz7
	w2kgi2YMOfIDKY0YRJZVdpjdBk5pQyc/R+IzFW+ohhn4jW5Rq6g+MrKHbOHqB4BMzERNfgtLzFlo9
	384RRO8/opVbYQ4ohAtluxeo3xoGy2qVo5BIK6OHP64Z2fFBhGIVXWsAofrrb1Z4CI+rnXht1ELRY
	xIk36xOsu9rf2kdjDgVLt0yce+LSYxjGVYDFxTw6KyEpG4i0ELfnb19NP0io+J6EQn/8azjooIFth
	tfmDVnITt7/++u+5Svm2+t8hIhPhSIEsq2KhcLAvyNm0c4aVJQH18MJoD4VgnHaowADcWYtavvsL8
	/dfz+EjYLbTqQ/VZX/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeSg-00000001hmE-1oKs;
	Thu, 15 May 2025 19:41:46 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeQe-00000001hOX-3RJz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:39:41 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54acc0cd458so1615807e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337979; x=1747942779; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYdK0AjjM8abFU3f5Mtgtyti4QxGUG4c/Abfg2GNbps=;
        b=BNIt2P/IeEhUTJadcaskqWG8JbwMpkK+eMVpieTT3h9mIs0q/nrqCzit8fAXWpyLWQ
         opM9FWoyqc+noROkrA2C9BJNRyHRIOQZecXBuPQEU1FBMMSX0Hr1ELlaO7/hJItVYTxS
         90j0j7NZdHkcbi611aEbTCaM0v9g35j17uy/ImP1o4MHxvgcx06RiZ0r2lEp6LgOFEE6
         wOgrrqxoSAV921xoCv3VWYo0PRX8wXCD1HD/k2lERK4CbnSiiHlgopzaK5D4pi1xBOnG
         ABrPvtvWXTSwa4Z/Yf0mlfFKT67LpLpJhFnu5Vu/HO/DYPflGmkAc/zEfoHwTdKEVDGd
         MQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337979; x=1747942779;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYdK0AjjM8abFU3f5Mtgtyti4QxGUG4c/Abfg2GNbps=;
        b=F7DbRS50Rell+1Jtfs7jPzEmDuw31WxjXABACnknwAFKN5/+BsXRlJxUVtUABTW07f
         vERuN4PLipXjOj6tfyQ1ufpl1qOcWSKAwn4u/2Qa9SDN542cQu2K6vRVfwkxa0pAmQt+
         E7GOs7gvUoNVyQhsnSNn8PjtEsrsfY0JEuUc5UtsMHBl/D7+Bx0QvxiHznYF9FZVxZtm
         +KAaEQHOmXMVJeOWOFUdx+U6Xr/dMin5jSmvTQkq7Ac41YvYEpYPmJT6iyjrNd38a9KY
         +yUy4cqdoUw93FSPVg+JxamEkgWMBSeKFSUby97WhXIT6X58LwDbYzoX3hc26M08IVBS
         cHCg==
X-Gm-Message-State: AOJu0Yyn4jatKkkMw924D/FSPm0S3DGfP6WXrYrGAcGtgcdty8fEMHBn
	vvpmVW55Ka9hye8JO79L2oLxbc3JTlDumj3/2WH7nWY0zjJCmGkghXzPqjcH9uHtujWGYw==
X-Gm-Gg: ASbGncsx+viwwLNOTzLV6yjUF0rOVwthUgAGuQt2btYrNb/TfuTszZAUFYsHqFUdMWW
	WBxyuQ0Z7cjRqUyOj/gHrnqrcm/boOJ5fgbBo96HF/7vkUHvnLA+pGRBFBgENKvPegkLRbWoanC
	pnX/syBC0sh4v3mbhqTnYnJ/lq/TNGjWen3AbK7NzxMUV+ww5+DFy4aJljZ8AF2ITo99gB5vVJ0
	OEMrxHAiPbWBJhZKIWEV8V47dbsTDxgQkogkni7z3gjmk0g0mAuabSgQJQdvHSbZP8OSZhSPQDy
	H1+odMp/NP2u6/EaGZMZb+Sn1NL5QZaST9NWdWepRZ1Ezv/zSO7Du+Arr4a09Drf
X-Google-Smtp-Source: AGHT+IH/gLZPS6thv7VSu44IX1TYpg37+y/EOQu60KdwyFFDlYjwnS6lL+6BuLrT3ET+GI8eL5IkQQ==
X-Received: by 2002:a05:6512:159f:b0:549:86c8:113a with SMTP id 2adb3069b0e04-550e71ae97dmr251422e87.15.1747337978880;
        Thu, 15 May 2025 12:39:38 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:38 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/5] ARM: dts: vt8500: Minor fixups and L2 cache on
 WM8850
Date: Thu, 15 May 2025 22:38:39 +0300
Message-Id: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL9CJmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNT3fLcEt2UkmLd0oKUxJLUYt1UE1NzC0Pj5NTktCQloK6CotS0zAq
 widGxtbUA0us+U2EAAAA=
X-Change-ID: 20250425-wmt-dts-updates-e457813cecfb
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=1469;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dUTd7LB5oUuONCrkadkRxW1f2+OtwiJIXKvDoamBiE4=;
 b=2KnNXyiKPzyzbnrSmHY3lL4nMlTC4ZNnCs4kvkFJ1EYRIN3Z4+/BSR67ERLqWRl2CNgGXQufz
 yv8piK/0/llDmcTQosyI9Oh2N0VLmKw55AVBSoVGx79249BePVQZOZB
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_123940_861889_B63A22E9 
X-CRM114-Status: UNSURE (   9.39  )
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

Small fixups for VT8500 related device trees to improve correctness in
light of current guidelines.

While at that, also include a DT node for the PL310 cache controller
present in WM8850/WM8950.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Alexey Charkov (5):
      ARM: dts: vt8500: Add node address and reg in CPU nodes
      ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
      ARM: dts: vt8500: Use generic node name for the SD/MMC controller
      ARM: dts: vt8500: Fix the unit address of the VT8500 LCD controller
      ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950

 arch/arm/boot/dts/vt8500/vt8500-bv07.dts    |  5 +++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8505-ref.dts     |  5 +++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8650-mid.dts     |  5 +++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts |  5 +++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi        | 12 ++++--------
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts   |  5 +++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi        | 21 +++++++++++++++------
 10 files changed, 56 insertions(+), 38 deletions(-)
---
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250425-wmt-dts-updates-e457813cecfb

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


