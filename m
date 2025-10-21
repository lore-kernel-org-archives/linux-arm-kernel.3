Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E55CCD1B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfSnV9t1F/SDBYI2zrfencQ/tnUy59bzGcgByOeP5HQ=; b=zXPWm7JXDg0S6/M4DwXfpF5s7f
	IlWylKkc6hu25faQ+2L1PJL1S7aE/sFdXjxkR3c9IxCNOQo6lHGM/e2i5O4BVC1pX/au55KPzvmnI
	2IBUc2LwYp/wOtLKP4rr9pmutoEBhPoLrXlvcqu8urZGceQCzzO5dA0uZ7UL7KKK6N4FRuyld3IDy
	x260aw4KXphAz/b6oTOeRxyD/9/+V3g7stPvLPIe0/8Bs7szVvhahp5GxZ26llJlfrTEZZu+xRn/g
	pEnzQVV8kSZVfBIZng2Rqa6WV4WnQ4ddFGF3vm3mMO1DQvw1LKZzqBbNU34Q1buvTMMVilkjs4EXV
	Gh5bkTyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBUs-0000000GyXr-1saX;
	Tue, 21 Oct 2025 12:29:50 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBUp-0000000GyV5-3Bd2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:29:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-427015003eeso864469f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761049786; x=1761654586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfSnV9t1F/SDBYI2zrfencQ/tnUy59bzGcgByOeP5HQ=;
        b=M2nGLDCzMa++hC58L1x6XB4m6E+23y9ZGmdy37YHpWsTJqskCwT4jQ05cq1dYkNcuG
         pXpZ+I6oLYkqwxCAjw4Z0Jqh/eIkub5QBjQBiG2TWqREAvHHCoqK3sM1IcDsjry0u5/8
         2qiyGXhlK8joEbXza7tySTDnr4BHq+96L112Dmy6Wf1U+hVgtqSJwPgw7A2phXzwRkqz
         OjIPTZNLtYJV2209r6U+zZK6m2NaZMX9p7/ruRvoYNIFS3+HQLAQX7wvcld3kXE07y1S
         wotYzOAd3A/eUp47hQ9DNjcpVI2o77p5YD+ZnXG5wibV7vvy8miRB98U2MmL1Gert5Zx
         ogaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049786; x=1761654586;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfSnV9t1F/SDBYI2zrfencQ/tnUy59bzGcgByOeP5HQ=;
        b=w3VuNsNU+Xzt5n6GFt96VSqv7FDskoNuUo6VfOuyVUnZiXwlHouzB0tD/k85+hDG/+
         YJxoOeDUje94G+99pvgjlWt1qjScePGBtCphqLbnbc4s1kmXPvVEXMl2Evo2cjNkiJPD
         ZdIvsyvvByOpTGueNN/kEVMMYOmp9ljda8CMpe2HHv9/f87pdLP3+uU7xwp4j/L51WhN
         GZJPxHLUl5ATgxiRXlF6q6yTuYExgkzMgTcM4I9MF9E/jbScfzQGftj5pVKLcMH4YyhJ
         j8rc6ol83calArK+nypipslZjs9VzhL3woIR8vBmDGNUINH4gVm5gaDCtdGaQQkA+kdx
         H8BA==
X-Gm-Message-State: AOJu0YzP5YQtaIUXwDpDf2JJv+EMbqQh3DxhdoP/sc3LWPDSKZMKyUlN
	2QBNc31tDniK4EJnbGi5jl5FQK4gTS7dZdImCwn6b9MTIDcM0YiD8x0I+QXmIQSih0L0OYl1JGG
	B/u7x
X-Gm-Gg: ASbGncuayeadShq7sUzu5QCWCO99/1mmfSNCSuf+vBM4P3FTDkiPbp+OiPtUq8LwkUN
	AtlDypkO0qm7ZMlX9755D+dm32eBFbGDn5mClb0TKM/IzKpm7Hs+rSdboEJeIbRvnCxsArISNse
	yHeZswrpYVGlcBAVhPmW9OQbAEY9FKrwgpPyLhbkE+cQla2fGnzzVPcHYFqsQgaiVKQgRcXCoce
	hlCfG0JsKLy7HGQcGrjQTzkEZCFnlgS+Wjs6hOwZUP+7SsjMSL4zk3yf6nL45ixp+ixr9wsgJ8E
	2+bdDS8N5Jq3HCTaRcLJiEkn3NWeKbdXCWZfhI3Xcmd2mx+mDl1CLo/JEO46mJPGCIw5HfOT5Y/
	aff6N68E1TCcj1PIS6OkwkNsP/r1u7wu3it1uCfhiHV4RiSLLZd/oBVVzcPn7/HmReQ0eGaBKMq
	akcegU5Cuoc9PyKd7d+5afUMN/NVMlnws=
X-Google-Smtp-Source: AGHT+IEpSASoRALREWuHJtczt+cRiPjUi8QW3wo+6igdJHTvMSXLltYmWA/nv4zRiVtwUcuiVTG1NQ==
X-Received: by 2002:a05:6000:4382:b0:427:a6a:fd44 with SMTP id ffacd0b85a97d-4270a6b0aa2mr10341671f8f.61.1761049785881;
        Tue, 21 Oct 2025 05:29:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3c34sm20057043f8f.17.2025.10.21.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 05:29:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keke Li <keke.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250918-b4-c3isp-v1-1-5f48db6516c9@amlogic.com>
References: <20250918-b4-c3isp-v1-1-5f48db6516c9@amlogic.com>
Subject: Re: [PATCH RESEND] dts: arm64: amlogic: Add ISP related nodes for
 C3
Message-Id: <176104978523.3075289.16180550527361572624.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 14:29:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_052947_821268_EE7D6F20 
X-CRM114-Status: GOOD (  11.56  )
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

On Thu, 18 Sep 2025 16:35:09 +0800, Keke Li wrote:
> Add the IMX290 sensor node description to the device tree file,
> which will be controlled via I2C bus with image data transmission
> through MIPI CSI-2 interface.
> 
> Add CSI-2, adapter and ISP nodes for C3 family.
> 
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[1/1] dts: arm64: amlogic: Add ISP related nodes for C3
      https://git.kernel.org/amlogic/c/63aa70a1f84f5dfabbac28d60e12949705876648

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


