Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE8CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ndgp99sk2+qm0AJX1iEOr9hIRvudwvRxmxME0Ub9m/4=; b=g4v+LPvOU26oni
	momJ3jtdpTGPQD35d5ThKCKpNh4fKSsTVTUAc2CVM2J7RYAYmRD4Ty+znWupSPmvrwsGd5UctSx1l
	Yh1FwfwMK2TCkb49PaMWdTDkdgz4SG6Az7GciZeVLXe/gdY7Th2PjJ3gI4BJ1gTSsNDSle11DCe15
	G/VDuXMGyH7+m4hbvetLPDB39CoLlHpXrjLICDaU6b7VIH6NK5/cE5INY5STwVN92zdS/zQQRgnKn
	jjEwuTB4HdLLx6sgjs6VhefEcczb37kJxeQAC1tjIIukScJ+vPGWYNNds5r6Hj8C6ZUEDi0wn1z8S
	7jEdxPv3CoudOhtdDd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTK8-0000000HT6a-1sE3;
	Mon, 10 Feb 2025 12:55:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTGe-0000000HSHf-3vw9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:52:06 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38dd93a4e8eso1118111f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739191923; x=1739796723; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ndgp99sk2+qm0AJX1iEOr9hIRvudwvRxmxME0Ub9m/4=;
        b=QcNXdWtK4d2sk8N9ovwPk52WLirhRK7gVt2t8CX6bV7+uGh/IyLaXVK2Vo6r6uGrSF
         CVwtv3k31BYf5CAjxHBokXJYEzSyqYLkRFOU/bSzohwDZWQg/bB1UAml1doYQXPRZLez
         SDJBgiEFHi9vuTCw9VCi7vgqsHdLq3/6WKTkR7wt1+999O/xRy6otY4jE0NnJsVZDfvO
         /RUYX3de/TLNx5SOOyp+awmdu827oUhRyaDyArkXyuyCaVwKcDm+SYKGBhyCBq+v4U3d
         pu1zWAcYN3An+EjTTCJrMHPAIkmDLTQhWB40PCy/v7yHMnqVI/W1NZbjTngFFR8xGFRs
         CIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191923; x=1739796723;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ndgp99sk2+qm0AJX1iEOr9hIRvudwvRxmxME0Ub9m/4=;
        b=PIjQmSE10kPyqpizcqRvSwSU2cOqc57FujfGgg4y7D1DygrVjr8OJkqQMki3SM+HJV
         Anwoq6JuBmSv6l4To3O5ra4vTDNRAL2YbB08+i8pitoCX9cY+CFiLnHh+LKb0i99HL+K
         Udab6vRnvDUhHVWhwzCLPPnWOqtdP1dr35bJK6MLA/Y6jwyX5lKbIWlBzyB/OwYWdZa5
         4wKsFIup8q+Lnadc1n4JJKgSh7hp9hS9xIKLZyl+KRHvnlmNfs4S+Qsp+HazGxF8vg8V
         1OFJbedPe474TqwsdsJk0Sj66UAFRd0G7slTk9pcH3BHzMSRbRizCCfhJEQHbk//yvW7
         Bk0A==
X-Forwarded-Encrypted: i=1; AJvYcCUpYF7xU+y73nN5wYPsvvW89jBKy0SYYP/kEJ1VF0JOLMFTYq4ORzhAyQ1SktN0C7I6MwkYUUSRzTsYxwInmglD@lists.infradead.org
X-Gm-Message-State: AOJu0YwerKGAYgQv1OUqu7GcjuSlp0wRQyaV9DI+4gcFipuPVMgLCuz7
	Xue6N803+fvZcX0cK5+T89XzYeUuHuVHbTPmzcWfYfXDgfZQMqa0SowDqG7qmuQ=
X-Gm-Gg: ASbGnctk0x2WFgQs7DXM7CeYeXD/C2legf4EDrxvcGuwW86eaQiJ42zCwtFVWy1JgqF
	NQX1VBHwWzL4YLYnbhPWpHiRmxOPtFYEBkG0M6SKmEt09VrN7qPAMtzMSyxOaqTQntjKPOMYIoH
	5nxTiu6hUSv9PdAE+8KGVPFrC17tB7WF5gufTda/qG0094jymSzGTYmexJSHnDcXF8zk82UWbfi
	2A9q4LQ+NT/pmtDAejEoWYMuxX4XdtaOmY+uQuRE2snWYnHmmxVpX825KPupa2JG54bOUonXnBH
	VQwPVXMFosmrtoJ4Bh2EWtAnZjDD5FNaIARvP/8VqH/VBCktHoYJ0IogIX6umdpTF3WZAAfZijc
	=
X-Google-Smtp-Source: AGHT+IGusahsybY44rc6nO4AWzY0imCi+cXnlxDgiDZzKI1dgfuiNW8fncCJWn89N3rzpgZLceWGBg==
X-Received: by 2002:a05:6000:1243:b0:38c:3f12:64be with SMTP id ffacd0b85a97d-38dc9135899mr9939327f8f.35.1739191922884;
        Mon, 10 Feb 2025 04:52:02 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ceae3a3bsm85819266b.129.2025.02.10.04.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:52:02 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/3] gs101 reboot updates (DT)
Date: Mon, 10 Feb 2025 12:52:01 +0000
Message-Id: <20250210-gs101-renppt-dts-v2-0-fb33fda6fc4b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHH2qWcC/32NQQqDMBBFryKz7pQkVqldeY/iwsSJDpREJhJax
 Ls39QBdvgf//R0SCVOCR7WDUObEMRQwlwrcMoaZkKfCYJRplFEtzkkrjUJhXTectoTO3kfbWt+
 a7gZltgp5fp/J51B44bRF+ZwPWf/sn1jWqNBNnrqu9rZ2Tf/iMEq8RplhOI7jC2o0bRuxAAAA
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_045204_983410_29FE4BEA 
X-CRM114-Status: UNSURE (   8.87  )
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

These patches update some of gs101's reboot / power off DT nodes to
bring them in line with downstream / bootloader / EL3 monitor
expectations.

In particular:
* an unnecessary property is removed from the DT
* the shutdown SMC call is aligned with downstream now
* we now implement the requested boot mode as a notification for the
  boot loader 

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- keep SYSTEM_CONFIGURATION register unchanged (Peter)
- collect tags
- Link to v1: https://lore.kernel.org/r/20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org

---
André Draszik (3):
      arm64: dts: exynos: gs101: drop explicit regmap from reboot nodes
      arm64: dts: exynos: gs101: align poweroff writes with downstream
      arm64: dts: exynos: gs101: add reboot-mode support (SYSIP_DAT0)

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250206-gs101-renppt-dts-cb8ab6bf6294

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


