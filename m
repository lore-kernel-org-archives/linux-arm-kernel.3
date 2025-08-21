Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAF7CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sMyUEbLcanRX5H+fT/hbCuFWtgzsfYsMYARRkrN4bEM=; b=uPhQxSK/0WIuA2OatzgqeOV+8c
	RKEgORmOEIP5D+JyVkwbE6ZgoNGi3qKjUpJ5RGWZbeunp4ILV2CgQyUhTz8JMyBr1UOv13363fZ4k
	KL/UpEcMPaz5VnEP62zhEBuW116bvlBGWX4YTO40334wtwwugz8KzF6LK0HgCbbIc5PU0Vb0IEOC+
	iy3ytpZfkXzit/fAKmanOvlFIgqHh03xwtts6XRXkvweKK9aQXnz304BScuXTGVC9+J7AqJC4Uvlq
	TSFJSmMBbBZBGvlRD7eAEoU8Doa9tX2RywQYNH90LFGzF7567nV/q40PEa6p+OQejVHDCnqPjfgLb
	oiXfDuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5NJ-0000000H3bk-0Mtp;
	Thu, 21 Aug 2025 13:30:41 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2yL-0000000GfyG-3g0F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:56:47 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afcb72d51dcso110672266b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 03:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773804; x=1756378604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sMyUEbLcanRX5H+fT/hbCuFWtgzsfYsMYARRkrN4bEM=;
        b=Vqe2D1Hy8JyYAHtiic4g9xxyHzomPO3bbbCrEpMqSNjQtUns1WkWJz6E8IFs77tsgP
         l+D59nXydwjt53TmROviOhVxiz8Hbe4Ii6MO37S+FYlYscEvpwkMajXhzzj7BHQOf+F3
         iQyutYUpbLKvWderSLvjQ+t6XpsZaMKhh6f4HDYsJm9tt6TVGDMSuqXzyIFU4B/50CO9
         N/ny8NxhHP/a68vb2z2TV8FIyMcWC5a5VmuxLVqStHLBuqZtuRzjA+nW1sWUNdzWTVhB
         55Hh4FAFX0lSMPg3KhzeQdU8xcx0xHAMmey3wIWCUR8IHW7CtAndTREUViHIODGGSb8O
         cIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773804; x=1756378604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMyUEbLcanRX5H+fT/hbCuFWtgzsfYsMYARRkrN4bEM=;
        b=k6HKwyv82l20/2tM+F0LP7SEQ3+Czdrtiba3KD/EybFshUTQCqVQ1cscfmF6yCj+vX
         ZoYEDJ3BuxRKd+ISc+gPpTf/TU9lZfJ9ZPpotQg5Qy5Xnnv5t+R0wcqfjQuPd7ll+fOL
         vj9Dy0+2Z9QN+9YHMuQcw4apdzL5kGj03RqTovDFGdeX/1aji8zazjCwGEeWENaCKIkC
         QOn5yoGC5X3BKlnKGLZ2Am+HpMfHYiHPB42XzL8TY1mRKwJIzpAApbX7pL7d8V1qGWbT
         9NmvLvB78bPkSjybgd5DC2DXiSEmThEl4BQK+uj89PKMMX18ZCM5fJFDBsrYwefwzf/B
         q1uA==
X-Forwarded-Encrypted: i=1; AJvYcCULa17PSOPoN96pROh2ophQg1gepAsfeF9zsC/tYzoQYc14SaG9K9z/qpyU2UJXqH/1PpHZ0toR5iLhs+Yu0mkw@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt6yIW1x6rgluhg5vYdljgSQHaCVpr2Fj3zrzDc9nBVWk9shfq
	QXtY0iRjD5gdUAihyxbFSKKZ0W+9ksp4bX8phN54fVDtihyamIrX/iwo
X-Gm-Gg: ASbGnctmNv7ghwehRn214t5QeXYOgPHJmwLrMCQKKyoLQ1AP4PFOwZ4NGVjIZUQnlXf
	mqcGTwu/HmbRgpwazNDCNQnjlqxTCI2JLs8WTK54pvUQCWFVKVh/01oyPPzQtFozgf2Knn++E9C
	4UpGwKYH0k7CJZnk/VhZcDyyQogTV/KR9I0dTyjQGBniiAWsZ1sB2WNoK4+UrPBt88GJbcRhr+Z
	CK+dPc9TS4pMZ3+HJoKmtbq+24HofkkqsJntOhIzisD5ZIFTIb8LtQwMXAzuqbG2j2mzhCUVR/m
	Htw+sAhwMmx7KvGDEwTUSbVPoGf4niMgPjTmDzzJ7K2WxE19IPTW+zTtSOt6CQyFh6jFe0vee5Y
	HgnwrhQZpD96rs/wCvqtvPiVNEcMT6VVI537HEPQG/MkVtpNo6Mia
X-Google-Smtp-Source: AGHT+IHms9vlv4FD5+T1jUisxyplhUFRbxyMMUf0tERN5qe6K/kx17X13rQpCE7FAsb5xSQZMirW1g==
X-Received: by 2002:a17:906:f583:b0:ae0:d9f3:9131 with SMTP id a640c23a62f3a-afe0781c6c1mr151935066b.6.1755773803670;
        Thu, 21 Aug 2025 03:56:43 -0700 (PDT)
Received: from DESKTOP-TTOGB9M.localdomain ([92.120.5.3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4790bbsm373602866b.56.2025.08.21.03.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:56:43 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Switch to using AIPSTZ5 on i.MX8MP
Date: Thu, 21 Aug 2025 13:56:30 +0300
Message-ID: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_035645_919696_35DC7641 
X-CRM114-Status: GOOD (  12.26  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series is a combination of the previously dropped patches from [1]
and the config-related patch from [2]. This enables the usage of AIPSTZ5
on i.MX8MP-based platforms.

[1]: https://lore.kernel.org/lkml/20250610160152.1113930-1-laurentiumihalcea111@gmail.com/
[2]: https://lore.kernel.org/lkml/20250707234628.164151-1-laurentiumihalcea111@gmail.com/

Laurentiu Mihalcea (4):
  arm64: defconfig: enable i.MX AIPSTZ driver
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz-related definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h | 33 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     | 16 ++++++---
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h

-- 
2.34.1


