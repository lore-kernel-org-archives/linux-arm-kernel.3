Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0B8CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 12:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gN1SHadTytzDX2xnmPwJ+DG1JmBdmDMrYOUijkOrwgE=; b=zU2HF9wZjZc5XNiWrd0YdpMFfc
	4jNIfTIQB1Wfjh52qIiHov2+kSgeYZBYuj14y8aNTKzTm8Vv/OyabA3hjG2DReFuNiWYoDdpaek+j
	ZTcY/GP9VcaQU6HBDFIsM0936LmOwaS4CW0j+ucQVwMdUPh7X7uAcX4nQ6+JwytPeX7wmlHcW/dBa
	iS858Wm5c8+yt9ozIW1qSEwDDIVI/7T10BIonyCNcJAhsbJcQ6bJwmfdbQ1VkKSanx7jjrfXIQ06y
	Mne1CwYGUG43lZGrONCRE/Ti5u9WcTI/j0cQ+GDTnu4CDgHotKA1DEjr2IlamgdQwLI+/QmRMxiV9
	n+ErjKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uza9I-00000002oWF-07wy;
	Fri, 19 Sep 2025 12:23:36 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uza9E-00000002oUr-478v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 12:23:34 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45df7e734e0so23235035e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 05:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758284610; x=1758889410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gN1SHadTytzDX2xnmPwJ+DG1JmBdmDMrYOUijkOrwgE=;
        b=s0sOAtyd8nRaOulgj3j5778r7riQbSKNTDw7Bd9MFKLllZ1ZYRMWBxrmTyL1hpkCSb
         TKlaQYZ8mECOvf5Qo0ip9LuQ58U3r/IHUjAfHgPBYN3taC/FMad5yz3ja9C/Yw/68u4k
         LfKWO6eL/j23wj/D5gNZysczpfIyB6RxpZrKtc6Ed89tiUpj+majGcbN8xgScgjf+Bmo
         uzQkHPAVpzDKDg3vdyo3vPV8MDUruhuBG02DWfuMEswbeT7YWZl0REX9pqCpIVF545dM
         gYd7nvU/7SpGXnZYvXoEaHroRgPnZTIxWQmkNTvHbvkz8+sDyCcb6qY1RBRHCtrvrrlZ
         t03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758284610; x=1758889410;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN1SHadTytzDX2xnmPwJ+DG1JmBdmDMrYOUijkOrwgE=;
        b=CbdwgyFQUIbIKJ1VWLY9+8sWwLX35aaw0yoew19h0AG4SLYC3L8rtJltCbMJTbc3Xc
         bF6LwpeiFQ49OhSQrKuyBg3NGHHaPlcxPsSPljI9hlXhxSYeZ+P+TtBqJLjFYIEZJJO4
         LYu8h+uvZppqbaU3lPpDAGaRfIhnqcu3kVIY1O+ZFjkVAwzaEbNG/CfjF6O3yRo0Ywh3
         piwbT4RC/ewISnV48IbGOhrH+w5K5UgfRkwMlt+cvN5+jdA5opgnPOu9m444O9TbZYAB
         dEpCbAF8aTPqXs+YcpCeeqdQBPCdPQ6Lh9P8kYEzoHbhYajs7xQkGfaaI2aV9Yc2JqqT
         feSQ==
X-Gm-Message-State: AOJu0Ywox9l1jjlxMPLxSvAH/tIByJ/jiLqzX28DpAZAS0/XazS+60x2
	G7iSAF54NE0SwFs9YUOaAuXv3WPHpPCPfkCRmWoDd3D2DzDc8zO8ivTuu0ZklnTQIxlCknrkkHS
	dcqhzI/BaWsFJp76tw3hVH3U6tVPlzhnvYLbmT6M8yk3W9PifDmARo2NbGFheOdsF4Z4ct2bzZL
	eee0rGbslVStfODTM7oxYWlR0r0kCnHihtclFVwyw3BSn0Qn8kyrMgq2zS1nks
X-Google-Smtp-Source: AGHT+IEQ2BelZBee6Xq8HqG6PdmZYpVVhUtJSdBsldDA1DgWhRzBiM7FdRccvX4b8xCNlWRnu3NYYRZNVwo+
X-Received: from wmbay30.prod.google.com ([2002:a05:600c:1e1e:b0:45b:83ff:5274])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b05:b0:45f:2cd5:507c
 with SMTP id 5b1f17b1804b1-467ebda8e6emr25752215e9.36.1758284610250; Fri, 19
 Sep 2025 05:23:30 -0700 (PDT)
Date: Fri, 19 Sep 2025 12:23:19 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250919122321.946462-1-abarnas@google.com>
Subject: [PATCH 0/2] arm64: modules: Reject loading of malformed modules
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Dylan Hatch <dylanbhatch@google.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_052333_043338_D8595272 
X-CRM114-Status: GOOD (  12.23  )
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

Here are a couple of patches to reject the loading of malformed modules
on arm64 when the SCS patching is only partially applied or we detect
an alternative callback function used in the module text.

The SCS issue is largely theoretical. The code currently performs
a "dry-run" (which we remove), and leave module code as-is if failed.
However the latter issue was reported to crash the kernel at [1].

Patches based on v6.17-rc1.

Thanks,
Adrian

[1] https://lore.kernel.org/all/20250807072700.348514-1-fanqincui@163.com/

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Dylan Hatch <dylanbhatch@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>

Adrian Barna=C5=9B (2):
  arch: arm64: Fail module loading if dynamic SCS patching fails
  arch: arm64: Reject modules with internal alternative callbacks

 arch/arm64/include/asm/alternative.h |  4 ++--
 arch/arm64/include/asm/scs.h         |  2 +-
 arch/arm64/kernel/alternative.c      | 15 ++++++++++-----
 arch/arm64/kernel/module.c           | 14 ++++++++++----
 arch/arm64/kernel/pi/map_kernel.c    |  2 +-
 arch/arm64/kernel/pi/patch-scs.c     | 15 +++++++++++----
 arch/arm64/kernel/pi/pi.h            |  2 +-
 7 files changed, 36 insertions(+), 18 deletions(-)

--=20
2.51.0.534.gc79095c0ca-goog


