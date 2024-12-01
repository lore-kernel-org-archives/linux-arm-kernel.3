Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B277BD49779
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8fmmWFuj2QXwlMa+xJCOftPfiVKkyTzOSJowte4eFEQ=; b=CcRQR7g4NDDD5STXDRMgviO4t6
	yJVjhYE4+vj1ulrTN6STKVNeBKSWmH+LTeS5pj0YONWR8CUF+5WbkLQeDBBtfEDjYW6LXLCYkRua2
	IdmlPNhLrPGL8jVw7dPJnJa0hC/25V3yUORSmHQebNoMO4VkuKdCOvWlN1l9SPQxfqHuG8ePYMhXc
	s1LZ1/3I61CBb9PFeWtX9Uo8W2wbrdNj10sRWFqN2UEqL62WlT+HqmH1kAMmjzaLT7ExE2rbdQXb2
	sRLd8tyf6iiqx95hTbR6v40hr9Q8aPAAIRLPUrYPaqPh3ZYxCrp00De6rpbj8tlFkJycmKcTbH0QN
	3j2U3Qjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmgx-000000043Ag-07bh;
	Sun, 01 Dec 2024 16:21:03 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmfx-000000042wj-3I4d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 16:20:03 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ee6dd1dd5eso1341465a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 08:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733070001; x=1733674801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8fmmWFuj2QXwlMa+xJCOftPfiVKkyTzOSJowte4eFEQ=;
        b=XqNTwLH2knrt2fcy6QeSJFkUDiL3h+Yx6xNBd5hefwGpWzFMckx1YhMLHTrT2gnWOZ
         /7Lyk6Hwag0QuUkKXyK21kYUEHrCbIqD9bZuN0NZKRUoAe84s8ZScKdqsvJUUeveJlrh
         MalNYdy+SwFkvzxgxXjyewKdFItcZERL+iBft5QzHM40xUHkrf7ZH/r4Vhfio+ZQJawq
         WlK1GhOM/CGkvBjBkvazOFHAzW7dff7fAt/zUahfUI9DTYYxOLJYth/XnjyalQGdAFfV
         m4Yis9BMR6j58BlnYTNsP7rA5TtGZ/OlaN06tQC4OaP5/Gz+2qD7ui/HSX2AxEwezLEN
         wb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733070001; x=1733674801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fmmWFuj2QXwlMa+xJCOftPfiVKkyTzOSJowte4eFEQ=;
        b=RIwOfLoKa8iekLaBB4mKuZIzq6n1IfuacOoc1VLjLRUMbvVHNe3QdCk8BA1temiidk
         lxglsbFSmN9+6mGZIZGvAB8pZRpX0PY0jKYVF63ozG9mSJgkufYDRPRPfVGL+bgIcfXd
         Q2y2Pu3l+HwpfNSZcSw4bFT9DAFzdt9+NwGhxw9OwcoVqeos7q0DJeBfRy07axxWU6lZ
         6p/n1YMyyts9bzd5tPpmjbTQjE91Wbq+666XKZF6eSaDEXUGomzpIkOqm11m4rwZ5/n8
         oS1yP6DHBE/mk1MqMD7tyc447coukodlieSp+pdLoujYCVUd5V7Gog2egkiPP8NtbR8t
         OX2w==
X-Forwarded-Encrypted: i=1; AJvYcCVmoRjTBrD72MJva66JExXTX2lykHyzZmU0xRRpZCWAqsUreZcz8tTvc54crjyvcfhaqzjO7ir5mixAu2l/ucqf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/S6rwL0AYn8yuLUhkFpajJ13MZBfb4ZByU1UyUntq4r4Aqx1u
	/V5HbeD/0gdLSY7+qvJVgIcWdmDLlRWR5VywO5NAite/NQYrOBg+
X-Gm-Gg: ASbGncvuPRCx79jNe9YZsGQQBrv9IvVFOd00xpuCbyseCapu9ow2DkojBDrUyRsTPfN
	LTTqilIIG7k4ghGhrWCtPtI3AEy0Qn7nBCX1Q3SFPX21Zv27inxvtrnDGwMny2RQHUL9ghpTUae
	eyZHYeoJw5zZl2j5FUyHkw4AZUut//NFu1XzozhOOwOAKP2twxZguwgiQMD/T00wraG+lgg89Gn
	Mc2YiQQLfhZvzBvMjMmsWRwr4obrqNxz3FxKmEmZ5HxGsydlFU65gTtJBNsHbga+A==
X-Google-Smtp-Source: AGHT+IET+u5LDNMyzPy/22Zfz08qiTYsCD7kHsmPaZYvpfT40p0BJktpcCR4QS21645GpQRzwE7Yww==
X-Received: by 2002:a17:90b:384e:b0:2ee:3fa7:ef4d with SMTP id 98e67ed59e1d1-2ee3fa7f57fmr17772287a91.24.1733070001043;
        Sun, 01 Dec 2024 08:20:01 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee78834450sm3007392a91.6.2024.12.01.08.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:20:00 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 0/3] Device Tree for Apple T2 (T8012) SoC devices
Date: Mon,  2 Dec 2024 00:18:40 +0800
Message-ID: <20241201161942.36027-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_082001_824257_9FE07E3C 
X-CRM114-Status: UNSURE (   9.84  )
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

This series adds device trees for the Apple T2 Security Chip found on
some Intel Macs released after 2017. This SoC is based on Apple A10
(T8010) SoC and, for many hardware blocks, can share the A10 compatibles.

This series requires the PMGR power domains series for A7-A11[1] for
the "apple,t8010-pmgr-pwrstate" and "apple,t8010-pmgr" compaibles,
but otherwise can be applied cleanly.

[1]: https://lore.kernel.org/asahi/20241201155820.29259-1-towinchenmi@gmail.com/T

Nick Chan
---

Nick Chan (3):
  dt-bindings: arm: apple: Add T2 devices
  arm64: dts: apple: Add T2 devices
  arm64: dts: apple: t8012: Add PMGR nodes

 .../devicetree/bindings/arm/apple.yaml        |  41 +
 arch/arm64/boot/dts/apple/Makefile            |  16 +
 arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 +
 arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 +
 arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 +
 arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 +
 arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 +
 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +
 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  20 +
 arch/arm64/boot/dts/apple/t8012.dtsi          | 198 +++++
 22 files changed, 1387 insertions(+)
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi


base-commit: fb4ec083bbf366f092f9064b18531be92756745b
-- 
2.47.1


