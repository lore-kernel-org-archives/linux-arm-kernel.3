Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0346D42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 19:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6/xfqtm3x7QWKepSmfwDgHi7bBcwjVkW2hTBncGzpNI=; b=fuAMpaJeYpRBE8yFCCMMc+WUdk
	clci7KlzyFgdsC2i5DaesW3FCGm3w1XKzsad4zQuLi6GoyV30HgpXmKKppDa567yKnv/g2/4BWpyA
	TjkT7upj/V0o4ON54TVBVn9AnR5zXyx4AhZXDl0bqn3vdBbsXpblwyoG3wj5phC5FpuEbAYqa1POS
	9kwLNlP2IGXZgeL/y47or9+7LI/M8OwBjFx/WewaEW/cMLVFZPBVtSM4p7Lw4w1HNpIyM8ELlObv4
	gApiN46a+0BvBMsf8WmjX1RGh5a3JawifbxHDeXKHLiUcVFz9mBQ74s4iCyMSVCfAo3mf9vysUcDO
	ephXAddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwgC-00000004jZy-3hLB;
	Tue, 12 Nov 2024 19:36:00 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwcd-00000004isF-3y4W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 19:32:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e2bb1efe78so61166a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 11:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731439939; x=1732044739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6/xfqtm3x7QWKepSmfwDgHi7bBcwjVkW2hTBncGzpNI=;
        b=So4Hgya7kPUQ4n1ksBgVbJ1jGLOfiP+egpMtlAkkBRWyH78gWK4CqIaiSxYGiJTqB3
         0CDMvUMCf24FeKOSsvzsrASdf2IRoIMpze9sNB2u5bcCGIyMWkDtqNcC0q7Wux0KAyHY
         pnchvIBUOMJwG4mfi9SxI14HKZPB1/AjF78u9lWv36vmNqFaTZu8VombXTtwT0+dTOim
         FFqSulQNU3hyE9i8i/SoZQBNdzCenScoSuXi2e90RaS2HHXsjZP13+kAwSHHRyuiNLTu
         lSu1LDgz/3P9pP7ZE1FD/HwP097V4uC0z2JJapYaEB2cD+zyAWW2Hic00AmTKTjGxkdt
         UTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731439939; x=1732044739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/xfqtm3x7QWKepSmfwDgHi7bBcwjVkW2hTBncGzpNI=;
        b=WvuNwlN9vPKnaVU7fB7hwCRIYnq29uty6O0m2xjyWF2B5c1qlmrkUm9HvswRO1gfdW
         52WlVoC6JXdw0myfaTf27uxP3S0SDPntjIJJRpEorwB+3HwdXk9jnEDJv/g2pjFf2oH+
         nlcxN1EeLS6axWDjMCBGw6hGPnQiRNrrO+V3WLmzDdxIRu+T+VF0K++WynWBYy3h2d1Y
         YJZjiHrVlUTLMD0Hnac0vLEJYRrUXhJw15ACX8qynraYGdwDDdJ+AKkBUQ3wYhP39JgK
         cd+pf4h4OzzZkJC23wIfAse3Gz1Q+QZZNZ2litkT4iHwilDYfmornX2l9L/4AdLZRzb2
         582g==
X-Gm-Message-State: AOJu0Yxkio7i/tEZAUPIJOPB5nQFd1enNs/1tooQR40ocXc69JkV00Vt
	0WTVGJ9A/jfi4S9uSaUAHoxePpDx4bsa6vw5K9J1/Mr+8VjVvOZd
X-Google-Smtp-Source: AGHT+IGrqEyJ1d4NsV9KxFv5AMzPEJx8k6S+eQ2baPGh52LTBwbe4AJ9JiDd7LT5bb2AsJe5Y/M1/w==
X-Received: by 2002:a17:90b:2647:b0:2e2:b719:d582 with SMTP id 98e67ed59e1d1-2e9b1f64ebbmr26275292a91.14.1731439938703;
        Tue, 12 Nov 2024 11:32:18 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd17d8sm10988958a91.41.2024.11.12.11.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 11:32:18 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for Samsung Galaxy S20 FE (SM-G780F/r8s) [SoC Exynos990]
Date: Tue, 12 Nov 2024 19:31:47 +0000
Message-Id: <20241112193149.1262-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_113220_003516_BC284B6E 
X-CRM114-Status: GOOD (  13.30  )
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

Hello :),

I'm a newbie and I started getting interested 1 year ago.
Well, that's the beginning,
until I learn more about kernels and the C language,
which is important in that.

Well, bluntly, here it is:

That Samsung Galaxy S20 FE device is part of the Exynos990 SoC family,
I saw that Igor supported that processor,
I took advantage of it.

It has the same functions of:

* CPU
* pintrl
* gpio-keys
* simple-framebuffer

Just enough to reach a shell in an initramfs.

The preferred way to boot the upstream kernel is by using a
shim bootloader, called uniLoader.
Changes: - Simply add dts from S20 FE device

Special thanks to Igor for helping me with that :)

Changes in v2:
- Change author name

Denzeel Oliva (2):
  dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S20 FE
    (SM-G780F)
  arm64: dts: Add initial support for Samsung Galaxy S20 FE (r8s)

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 arch/arm64/boot/dts/exynos/exynos990-r8s.dts  | 115 ++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos990-r8s.dts

-- 
2.34.1


