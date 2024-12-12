Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE94E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SIv08M5NuYFMrbLnuplDgqYvTP/RY0BpL7xzh6gruXQ=; b=onal+8s8JqATrB2bfYDRmq55mX
	KV11VHU3FBc37eW2PAxi/G3TtsZM8oVnof7/TaGnTrg87+kGr5YxsgDCvSK+c/IuSX7YEnPXeCNrg
	SWjGu9yBa3TQGY3dgIud2eanPrn4T7hq+x7Fa6ZFpWBBqQAqRv7YIuhXJy6vHfWLdwoqfomaMqlfO
	3W/TVmAlQ2yR6PlWH5uk8drALVFBJx/35tNjs5Ghvm+7b9WIHoAbtwlqhaDE/2zxac5O6uVxZXOCG
	KHhCKujD8BLdKz4xVHdPGDLVO6NCfdkFHTJorvJ5plJafj7eqYN+RWL2txdXe0nfMS3ZBXl7ZC0sD
	uHSAPebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdGd-0000000H6iR-0deU;
	Thu, 12 Dec 2024 07:05:47 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdFY-0000000H6Rp-26pC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 07:04:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-728e3826211so212858b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 23:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987079; x=1734591879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIv08M5NuYFMrbLnuplDgqYvTP/RY0BpL7xzh6gruXQ=;
        b=nfVpS3F8V8jxZu1X9HHf0LrG8yBaODZzaA2dPXclbCpQWMINqmyrorw59R71T1g9f6
         plFEicJlWve4LfJ0UZPvPHTaGXwYd5aGnPguCdCgPFw7ivZxEec3PGpBRN49nSAzWWm4
         WMDUjp0gwf7yhcgbHHqISQYA3S0MBAueQlyFOrbltwNRXKjT7aLjS4oIvpT9Ynzp2AwK
         nDYKoWmWzd7lzmNT6dfyXYMt4MnB0AkLxiSMjOx/z08kxWuw6hPTrcpt0jAIQAve9Byq
         Lz8pUZHHJiWxTZoposj+qhlRCNYI0Ka+rGuK6XYN2GKQR1GzWgEIDqPNwri22AH7Iupc
         SByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987079; x=1734591879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIv08M5NuYFMrbLnuplDgqYvTP/RY0BpL7xzh6gruXQ=;
        b=lqEL9j05Fks2VUYjdNphWujsQg2xn+BHBqw09BdXySIIQQIhU7omBoMgx9rOxf89Qf
         QzsjwUBGU7/71D5sjtwAi8JOuJqIjGjF4SNG8NxeGnDNM5KFjz3QSQgFzs4rd+TIWGn3
         5+ZhXXtfnSdP3SVuuVQbLbGR97qP6BrBB/mDvA6Wf0RiUSjAuowrFBXH38l8I9G+/U0P
         Y7G/XeYWtk5InQ+ab5VTjGNEQaLplHsXc0PbwYoKYC4bqRkAyZ3rcQ28KOJ4p/l0h8fc
         7AbqscGIc4+VHJR+bDsaXIvLXmFqB7qG2g2yeLCjWg7M4WV1jxZ7IO0gwITRPXJg7ICj
         jVaA==
X-Forwarded-Encrypted: i=1; AJvYcCUeCtH2pezKVnRFtNs54eSE5HRazvIsZDXqUoeTJu1C8Yic58+Hb7EvClLfEsGoFMNL69uhiGHxP3SxNKQGacqk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr5dV9IbzLMqh6zY0LEc/Mvtc6AS2SClTh0QagSCwM3AxS28kV
	QhV4u2aIRCirKyqH1BQyuaesCees/QLhQhP1CU2MiPPibJZGObFx
X-Gm-Gg: ASbGnctdZ70NWSk5WAF9gq27D0/aG6TMhS5uW4zZ3DZ8b1sqxOR2Pu4fINm4OvZDm4G
	UVspeObf3vwDRFv9R8G+alYgbenaOMImb7C7+LaUecUD8+HRtteY5uTv0LhsMx83/cYckjmfU48
	zo2O5JV9tXRG/uq+MGbkudV0t6XgH3LZpgibsmVzIJ9omctcFS5GIZ9HvZYq4eSDGmj5m/Ah596
	8bGnZ6DbYf//JgQKFZYFFJeRgYcMrB57UBlpCadllyoTdJ0yGq0F6JPMHI1qetRu+24cAV0
X-Google-Smtp-Source: AGHT+IE2taDr2+F/QNnwkBgUaYbLlW++dErTzZng9ixbTcmDK5lHBmPiyyr/YT2Yg8/ifsjbQynqqA==
X-Received: by 2002:a05:6a20:7347:b0:1e0:d32f:24e2 with SMTP id adf61e73a8af0-1e1cebdfe8bmr3622509637.38.1733987079385;
        Wed, 11 Dec 2024 23:04:39 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:38 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 0/7] Apple A7-A11, T2 SoC cpufreq support
Date: Thu, 12 Dec 2024 15:02:59 +0800
Message-ID: <20241212070344.3858-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_230440_539333_F4F83104 
X-CRM114-Status: UNSURE (   8.92  )
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

This series add driver support for cpufreq Apple A7-A11, T2 SoCs.
Device Tree nodes will be included in another series.

Changes since v1:
- transition_latency is in ns, APPLE_DVFS_TRANSITION_TIMEOUT in us.
Multiply APPLE_DVFS_TRANSITION_TIMEOUT by 1000 before setting it as
transition_latency.

v1: https://lore.kernel.org/asahi/20241211112244.18393-1-towinchenmi@gmail.com/T

Nick Chan
---
Hector Martin (1):
  cpufreq: apple-soc: Drop setting the PS2 field on M2+

Nick Chan (6):
  dt-bindings: cpufreq: apple,cluster-cpufreq: Add A7-A11, T2
    compatibles
  cpufreq: apple-soc: Allow per-SoC configuration of APPLE_DVFS_CMD_PS1
  cpufreq: apple-soc: Use 32-bit read for status register
  cpufreq: apple-soc: Increase cluster switch timeout to 400us
  cpufreq: apple-soc: Set fallback transition latency to
    APPLE_DVFS_TRANSITION_TIMEOUT
  cpufreq: apple-soc: Add Apple A7-A8X SoC cpufreq support

 .../cpufreq/apple,cluster-cpufreq.yaml        | 10 +++-
 drivers/cpufreq/apple-soc-cpufreq.c           | 56 +++++++++++++++----
 2 files changed, 54 insertions(+), 12 deletions(-)


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.47.1


