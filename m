Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0552FCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 12:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=samCYGqwi9pnzVf12goEC93sXVEkXkpJUcL0gXrpXZY=; b=oSQGPdEGF8+3sdg3TXZ82vRmxB
	H+HFxDxydwFlD5TjAFkrSJjoFXmRgUx/1NseVfdc5QLVfFSDsfuNVRB2zrq6i6cAkCSSPkNuhryex
	R6wXxN6yFZlmA7XI20n3GB97DYHpPAbWfWc/INFhmFB8RLO1SXRgVZCmXqETnHUOzN5fS4jHdj9BL
	LZ3YAgf4cJvBVqDcH62tmTLsreHitgIouDUCpY8iSaRr/2k1EvhmxGqyEDofH4QL3hYGEtNMCaQD2
	aIlenN0/an/RuIdiqAnePp8bg8wZs01hLFCwcXsG3W2oiMFpTsKaqSetqVCICbWUAl6mgT/9LjdDd
	kLODa63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fFX-0000000CIi5-2xth;
	Fri, 03 Oct 2025 12:51:03 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fFV-0000000CIgn-0CwV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 12:51:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1782045f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 05:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759495858; x=1760100658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=samCYGqwi9pnzVf12goEC93sXVEkXkpJUcL0gXrpXZY=;
        b=I62eBRbC+wTnskIOTuqUbjsEDQI+omP1RQjxfKjIVNAjnuDBEItEUMRfA5V7Kc4WG/
         2CUDS7s/CASQENSAg4O3KOFcy41gOM0uKxI+4lT8nLPIizohrYDQpp9gLpjgUN111c7u
         4pY9Z4wZewU0SFc5Zx/wE7fZSLwEHAJ9RJ8f4vg727kf+IPOCtRvEHToK6LNzsSaANvl
         OtPpoReps1X4QYnWItm7cjopMsAJ365po4UGcajqX+SxZJt9ldbv/yZlMROr6ktxmlXa
         4B7Koq2WFGwcOgH1REM++R4LwgVciBb2XOZ4DXdc0imyOKBexBPYtH1OSIFhz7LAJm4M
         SPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759495858; x=1760100658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=samCYGqwi9pnzVf12goEC93sXVEkXkpJUcL0gXrpXZY=;
        b=oEA5cZ7rOn7rbp1Fi9xxmLCBbriZx1+jaupAmrcMTENdpS1LWig9jklveoT9QFqcX5
         sfbJWQYNHQJubM9OGRK2fKccqnD+FIUIX+IC6itI45Vx3O4X4IJoQq+B5AhxO/bfhbFX
         Ny9WkRS1Nc2uM5BfDJaRBYRoLhDW6ZlamOYkClAQSrcebNZ5lD/DNj1QSFJKEnx2G2q3
         dOiiUfA3REif9i653rDn4OqvsWePf69TU3kSEElOb6tN628NQDK2/jdzQbJt+wQe63n+
         /M7hjgO04QN7fAQ1NeuFd/DdVcfeDO062oJZ/f5gdNP/coFcowlO8GUvtNRl7jKsY2pj
         HZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNZuZ0l5I4XzQsOBfU02olZHFBeWp5GVgy+RBzBZcb1EZ4uIfaZcgeVybAE6M0oj2UCvmi82AKp0siRFtkkAiA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5WPSG35QLJv6KQfvodR1kKzjUJuqzetUIMT49Rtt/bvPnguwX
	zgH0WgV8mm2m5XIxhdQEPaBLf1SObiUWKq9YWOpbbk/jtTeWcgyuRlkY
X-Gm-Gg: ASbGncsgMOELoepbBLH+pR+qE1We3Cdb3f7yyTNxWV8NyK5o3I1QdIsprEKZ1muV3yu
	IYtvh4rst3xc2kG5necwOTADv6josjEeCJ0TIkPLwP/PBNjycixPn3eF+NFtwDyUvHyGCeu2ZMt
	Gpltlny1PuZGBK0qAjEyMGW50dwalhjG3+p0/Q/64gpTQZrQ5HtHCR78GeFGrPn8FexKqfLbhIU
	TEgL4ISV9JJtGBeRB6F25ht6YZoZwC91eWsxpzXmUOaSc1BkN5aTgYhCb87mOf4cj3EEVJ2YWcC
	X3eHmY7I2O2OBUg/RJyzpMA4rwhwyhsHF2hIIqJ74YOEsru/utoXeBS/UwpXdT8tt2WIeeFet0T
	0G5Lj1IcItSM5dASTsfmoVzsqthOBiuridVw92OFX6fl8nrunA2zjWcJ9OMDnrrnXWuYiqjFtyc
	2rRdTw
X-Google-Smtp-Source: AGHT+IENzuZxbYIdrHD3oo9Oii97vCN3RXSUhQc4ZEVlPzK73ksVqzVkKPvFzgGiDGx4BnU+23owmw==
X-Received: by 2002:a05:6000:1a86:b0:3ec:dfe5:17e8 with SMTP id ffacd0b85a97d-4255d294d2emr4872007f8f.6.1759495858309;
        Fri, 03 Oct 2025 05:50:58 -0700 (PDT)
Received: from localhost.localdomain ([37.159.33.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c40983asm80598605e9.3.2025.10.03.05.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 05:50:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/3] arm64: dts: ti: Refactor and alignment of VAR-SOM-AM62P
Date: Fri,  3 Oct 2025 14:50:26 +0200
Message-ID: <20251003125031.30539-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_055101_093600_CF6DCCA3 
X-CRM114-Status: GOOD (  11.19  )
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

This patch series introduces updates to the VAR-SOM-AM62P device tree:

 - Patch 1 refactors the IPC configuration to align with upstream changes
   by including the new common k3-am62p-ti-ipc-firmware.dtsi.
 - Patch 2 adds support for the WM8904 audio codec, enabling audio
   playback and capture.
 - Patch 3 adds support for the ADS7846 touchscreen controller available
   on the SOM.

These changes have been tested on the VAR-SOM-AM62P platform with
Symphony Carrier Board.

Stefano Radaelli (3):
  arm64: dts: ti: var-som-am62p: Refactor IPC configuration into common
    dtsi
  arm64: dts: ti: var-som-am62p: Add support for WM8904 audio codec
  arm64: dts: ti: var-som-am62p: Add support for ADS7846 touchscreen

 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 148 ++++++++++++------
 1 file changed, 98 insertions(+), 50 deletions(-)


base-commit: 58809f614e0e3f4e12b489bddf680bfeb31c0a20
-- 
2.47.3


