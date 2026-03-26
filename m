Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91131106F2F4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oI7ncm47EFLHRAd6LbtDz8JRD0+IusIPO58qA+zSWN8=; b=B56wA3+s8ZKL6cMLWwFeJnB9DQ
	67h8CE/kanhltYA8UZHBz6We8v5AB0VW972CKbRpXILhImtxH4lckgsjVovh5J59cGjAIo5N9006V
	MmdPC3jTtShUg1YtAt4qxezJQgbyeE57+sBaJigZeMKv4pYNV+SQCpswsCSYoTb7a3hx1jwPVxR3A
	H3AS2QIvccOEHmo1G0Q22STFeBonDme4OrQztChEM0RKeD6f5zLsX8Cq9NQ3rKaDZna7ERByWBPJJ
	iKVFfcrcGzvVnPQvAFszABCxoMP7H5HC/uKjW78+C49QaxWBrOxi6585bo9QeSt17tonmQJ7AgTdy
	JlJXvvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5foC-00000004zW8-2sSs;
	Thu, 26 Mar 2026 08:11:16 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fo9-00000004zUR-14y2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 08:11:15 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35c1107d4b7so596253a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774512672; x=1775117472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oI7ncm47EFLHRAd6LbtDz8JRD0+IusIPO58qA+zSWN8=;
        b=C2IcFzdAxnI9vVc4Gku9xBZbLgdWAM9vItxY5FqZz6C3LgKEyU7F066vkTTYjLdDXb
         j/0ClXZtOK5ickvzpL0n0b0DBGTlRHT2miUvkkl9otA4JB4uveF9tULgwhY90JQEj2w0
         BNmnlXRT7D1w6/ktMq62UyujK1//JlNS2k4kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512672; x=1775117472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI7ncm47EFLHRAd6LbtDz8JRD0+IusIPO58qA+zSWN8=;
        b=CEewhWuMcMyjv4LFKenQeKcjSacYnOzODo5TvKHiLvC23EV11Q+Tf0Qj9Qw2CNn8xA
         m78HdYrdAdHAnOdsJxIdY8e97iicAJvdWEpVMJDIIARASFNFFigfaqeXa9eQcALYocFc
         9nZtWzA5MmMfPeQ5Idp05kxGJP12qu/rJcLs8rQvBFvOL9sM6EolLbSLgUiMOYeQLy53
         /TnsKFbl4csYpMFrswqgNpi5jLsIWg/t3JPrpRaWj6+rtf/es5N+7SVcEQZnwyVm6Tyq
         ckhwpJc6OBKYnCJXjNWNKO9s4e3lCYeaVBPZF7lsjl3fkirNfFWlW4meeGnOUbXU7wr6
         2j2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvzg6m1SmDDQ3A6k3pq0igetTd5ePBXLJ6fqy+VJ4NQ2SGpG8F4l//4V11Ybqv41vUSMUxd6vRXMREstgfw1qy@lists.infradead.org
X-Gm-Message-State: AOJu0YxH0muT8o7nXzXEs/DA1K5f+cMl252rBgzXFGemASmvflXI7Ox3
	jFp8yDhCK9WvVhnTrXBRInXpQKEHg1mlw/bmzdNmoLm2Et5rZK3NB/eAkF6hBwsqs44+NBAIlot
	AEzQ=
X-Gm-Gg: ATEYQzww4rlsnIfD0oRuvDnBGIQR8XOhtRjR22ESgY6GduAfyDAX2L0097yKBa8ZtXx
	0b1rcVSfoIm2lpvTEpdV1EKtYNiGgFuDJXp/QCAbce0TwhYR2tHZm4j2rtyH+nhK/MW6swAJagQ
	WUKm9weHGqqQUdE5Dvjlvrj8Eg0TnCIOwv62cGmEt4Un92+9UV/lstTG9mYe48V4ONUESk23X0K
	RKBAXMkyJK+w+WS6A7k/NJyNldqGsz0tbk3ksnTgtfJZM5YpwByFx0ryyzTynlG/gaEZI6qhBt9
	RfeuJpL+5T3AHZfIzROGO6pEjbDb7JNy6Q1Mcx2cL/56YgOEEJAjCxO7yqFdY9Li7iSNePHhCXQ
	9JN8TG3prGbkitTku38f/mwwVCr/vATePLbvJpperdm+x5VgKDXZmoQWmYIoemPlWZGjguWHu8F
	78MHhS+oq/aaXTeB5PLfO1B2sHr0QAQ8M9os6TNn4gkeeX5XsKQrD//4DXdNdUZYfUGXO9lfo3v
	x0ZHM2WHcWYMtAgGmA=
X-Received: by 2002:a17:90b:37c8:b0:359:fe72:3559 with SMTP id 98e67ed59e1d1-35c0ddad8e2mr6144191a91.21.1774512672187;
        Thu, 26 Mar 2026 01:11:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09573sm823452a91.16.2026.03.26.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:11:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] regulator: mt6315: add regulator supplies
Date: Thu, 26 Mar 2026 16:10:47 +0800
Message-ID: <20260326081050.1115201-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011113_332258_81AB69A9 
X-CRM114-Status: GOOD (  13.82  )
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

This is v2 of the "Add MT6315 regulator supplies" series.

Changes since v1:
- Link to v1: https://lore.kernel.org/all/20260324053030.4077453-1-wenst@chromium.org/
- Move supplies to top level node, at the same level as the compatible

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6315 PMIC.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 adds the supply names from the DT binding change in patch 1
to the regulator descriptions in the driver. This patch has a
checkpatch.pl warnings, but I wonder if it's because the context size
for checking complex macros is not large enough.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (2):
  regulator: dt-bindings: mt6315: Add regulator supplies
  regulator: mt6315: Add regulator supplies

 .../bindings/regulator/mt6315-regulator.yaml         | 12 ++++++++++++
 drivers/regulator/mt6315-regulator.c                 | 11 ++++++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog


