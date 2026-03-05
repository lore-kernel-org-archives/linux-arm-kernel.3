Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E65AEFCE43
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lRmZpXw1Na1Jt0sZYZ3Dk4vuOehC4OWy1CGhTN9jzyk=; b=WgjqW9/Bu78ACB
	1E72Vb4Hh7wbPwlAmQOpfMB+qToXr8w77ePk0w7TeImLNwRGcZg9b7xSMXP0oaUHOPkkwWsg9rD4f
	/TM3noXEMZBxSPyFW35+JBXT4/E1aVQyP3Ij/BKKTnM5so0AA0JIB9U+S+5jOx3bN3fzkupx+sqsH
	hRlyfUNdE7tpLAjoCwsOmeUPOEvqLSEMUepfdaDT71w4tIg/kZvHt3k9UP5OXzmmQxbTiidfYYcnx
	f/+xxVEPu8buZxDY77ChFiVm+1EsBCmz6DG9yIv/dKq/yXaT6Lzm9s0ccRA5At94SXv7WRdiYt182
	bHCqKWBPHxoN8kKUKZ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzTc-00000000r5Q-0O4R;
	Thu, 05 Mar 2026 03:34:16 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzTZ-00000000r4T-0TP5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:34:14 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-899fbf92bdbso56641076d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 19:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772681651; x=1773286451; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRmZpXw1Na1Jt0sZYZ3Dk4vuOehC4OWy1CGhTN9jzyk=;
        b=lZ7pmEk6Bf9k2yvigsX97xQI/FEP8DF4DeIC1TeN3UcaPnrH9EPKYNwXBivsywykN9
         Sjvkl/hOVslButbMG9Q5u3SRGdGjJwxdrlDz5frjZQjsq+p43rgjS1lNjgszkIPhIgdG
         FwPnnOy2PSg5tw3uOWScWHrkgnimiJjJ3P0JkLM9Qw8882k7RPmWbyfcFVjU/vStbGhs
         ZoLZbmb6Iyv7sFY7uoy+C0IKkLRtGpozUrEzuyQwbZyuguSZdAUTkqPa1GYeO1zQi7JZ
         uZnjHyiscBc0mlwAjWRY26KNlGDNMKoh68l2i6B86P3Vo9TCeVM6m7M/bvnor2EKpHCE
         tiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772681651; x=1773286451;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRmZpXw1Na1Jt0sZYZ3Dk4vuOehC4OWy1CGhTN9jzyk=;
        b=AJVvjTGtMNvr8ItjZciUOvXAB7iKhJtQ0IKhzhzAJM6XQqKfs2O1Vovv5LoGIRDuXp
         rb0S8T6lPAMVrQkoTOFTfCp93eTaLm/fDUmAfxaf6E5QWaAkTikSvGz5Ws8Q3NACTxBj
         5NYTTSEFlfBt1g2oqiKBjZLexsChwPwxHxhZ75k8TliIW3q6ZbtKTq6KV6lUbOUMxau3
         iVkl/879awCF+V2QGMdVt2aSW5KbGaxVQLuHL7Fus3KD1l5RuOfODrJV+FV6h8S7WxSe
         YEs0FXGd0tLohFwEuNAK/W8utKGianqzEQvARL0N0IDD8Qz1j0IG1JZix6m+3wvRQlMI
         uOYg==
X-Forwarded-Encrypted: i=1; AJvYcCUkkr1fETEcvbMeHrGo73xwW9TP/a96fuCDfz6PqYzMIlC++hqp7ZVi9D66mYb9fPljvBYzVB1hQhXYvwc5u78P@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Mh2WzHUygt2+lyiuee5VaqXnO3Kdl/m3RUzutQ6GTjLgIPND
	2axWm5wOHi3b7p4NQPIH9zCO9E9O9AyDLqQ+i8MkZFwF0O1Bd3fOlsFh
X-Gm-Gg: ATEYQzz4CsXzRAyQzTUQC3lad4w+WrCLjaSlH9H/b/zv95ZA9AHx/F/XVYmY4JkOlsi
	wVqU4vbuNRM4PGbNmvKVnmxYse7Ncvw8GLYtUgbefDLhkWCulHIWqMgMNYM9+zbobrW6agEB9Iu
	z2WWEYk98Z9GsygsTqEIkjU1GG0YGMJWFdfx3WUA/YrT3bp+k0WE3D3JRzhwcBPcAlATALKpEOI
	19lcEAO/7mxJNSOekxa7i3e+nKvqfKt/TBYTuHAUgoe0u/1w8Y1Ui1QKMrTG3fEcbTCuh5NktyM
	Oj/rfMqZnE8yLlamFm6mE9FK5Q6O+lstaIvjlG6jqRQvDp4b56t0vvKY32Ip/c8jE+wEHBHxMEP
	wa2i/lynlydbvuNYUR7Ofmv/zSfdmsJkDfi2Ah41rLns7RerhluMRrrXr9X8oOsXRU12vDWz1Ig
	V/3BY5llhUp3sWDG0Uzm2X0WAQyncQWsmUDBVbqQ==
X-Received: by 2002:ac8:5f11:0:b0:4f1:dfc8:50b with SMTP id d75a77b69052e-508db3fe6f9mr57487911cf.76.1772681651474;
        Wed, 04 Mar 2026 19:34:11 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630b6sm190667601cf.7.2026.03.04.19.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:34:11 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v2 0/2] allwinner: a733: Add A733 PCK600 Power Domain
 Controller Support
Date: Thu, 05 Mar 2026 03:34:06 +0000
Message-Id: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/5qGkC/3XMyw6CMBCF4Vchs3bMUCoXV76HYVHKFCYKJa0hG
 sK7W9m7/E9yvg0iB+EI12yDwKtE8XMKdcrAjmYeGKVPDYpUSQVp7DQu9lESoamKAvOqISbWda8
 bSKclsJP3Ad7b1KPElw+fw1/z3/qXWnMkVO6i2fVdba26DZOR59n6Cdp937++DMi5rAAAAA==
X-Change-ID: 20260304-b4-pck600-a733-1790e0e48d49
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193413_195389_F9DD55BA 
X-CRM114-Status: GOOD (  10.35  )
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

Hi everyone,

This series is to introduce Allwinner A733 PCK600 Power Domain
Controller.

Allwinner A733 has this one power domain controller, PCK600, which
shares the same BSP drivers according to the package provided by
Radxa[1]. Unlike A523, A733 does not require the resets, and it also has
different delay values. Apart from these, driver wise, everything else
is the same. 

Add support for A733 power domain controller by making resets optional
on sun55i-pck600 driver, adding A733 sunxi_pck600_desc and dt-bindings 
definitions.
Tested on Radxa Cubie A7Z.

[1] https://github.com/radxa/allwinner-bsp

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v2:
- Fit the pd_names into two lines
- Link to v1: https://lore.kernel.org/r/20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com

---
Yuanshen Cao (2):
      dt-bindings: power: Add Support for Allwinner A733 PCK600 Power Domain Controller
      pmdomain: sunxi: Add support for A733 to Allwinner PCK600 driver

 .../bindings/power/allwinner,sun20i-d1-ppu.yaml    | 17 ++++++++++-
 drivers/pmdomain/sunxi/sun55i-pck600.c             | 35 +++++++++++++++++++---
 .../power/allwinner,sun60i-a733-pck-600.h          | 18 +++++++++++
 3 files changed, 65 insertions(+), 5 deletions(-)
---
base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
change-id: 20260304-b4-pck600-a733-1790e0e48d49

Best regards,
-- 
Yuanshen Cao <alex.caoys@gmail.com>


