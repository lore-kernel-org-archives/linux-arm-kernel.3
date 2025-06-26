Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85A0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 00:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKP9uNgbOA7UG3M4PzocnFVU56S59A2JUS0TA3YuX7c=; b=SVtO/pE7XMB9KEhTr+LO4BQEFM
	1VN+/15iLeIlYCOWrKNItFN0zLegkGkSAQL5RjSKDrq8KMtSM+fhNWLGBmTNDK8uP3jm7s0SlGhPI
	eIwXobtl0h/1EDZr+cAOCUPUbFKe5zb3RgPb+YLWfGdLJE081bucyc4FYwN7w7Mmrv/Ft6qNBSsAg
	eDGr8PDLsswXEgwBqwJ8HZoPWP020ImOp78NT5rd2oghh0OZ0FCGy13DoQ4T4/U/KGXSjw8BjD64D
	hxz717lMsHaMQBmNUBnOTmLy2hMCVYO9F9TXkTTShyDRgt3/lujJw38YviZfMtFu+OkcnutMUeLnh
	sBodbB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUavv-0000000ANKA-40S3;
	Thu, 26 Jun 2025 00:57:43 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUatZ-0000000AN52-1xSM;
	Thu, 26 Jun 2025 00:55:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-748e81d37a7so370264b3a.1;
        Wed, 25 Jun 2025 17:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750899316; x=1751504116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKP9uNgbOA7UG3M4PzocnFVU56S59A2JUS0TA3YuX7c=;
        b=FQcmpY4+X5QWFmmoy+j0pu9uMGqmscgEIgiGtmcAeyJyJEgG3jtZPU6RGGSy1Zql9k
         QOkxJ3ryf3VNejpOJSp/bhmgTN6eqwDXSiMvz34sWXSrTtXc4TixzSndiY8emsC6gIhA
         z8cKjlPReEbTXR4hS2Zw38yTYulixkttU8IYAnhHE6JB2SKT6ZBLjYzQAQwdVsUI1RNJ
         iFMPY85O+qw+KmZRXSEnMGSzXKT6zoi3+J56nk9Kpw7RoGtSjaxs3azVV8ZPD9IVFJ+B
         V/l9hFVA/sHP47ilUvD0WCgmQB3CN4yb8/eOa2+9WsLEsN0gYuG1adQ4WqAm3r6we2Vi
         K6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750899316; x=1751504116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKP9uNgbOA7UG3M4PzocnFVU56S59A2JUS0TA3YuX7c=;
        b=dPllZzCH5MFLD+ahvv+cPUd5BAKx1FiCQJg2Uy+URgdM4bHjBpqB7pe9GR7oxHCuna
         ibVHOM2Xa/Wo6ivB0sTkNqlVfskB9VNVWv66Axz3P8a9JE9tmynfoq4WRglcuQFEU+0u
         PJmgNoc8Ro/eRTWJu/3q6pEtuwag/t/38PUNkrjgCUvMC6MXYyUsBIQ4ga5qBgqYEojP
         TtiHWNFwTY/ry9xp68u4ZoVC9u3Dwd71pxKwQjTUHp3TIkvJ+zoEaWkwY8M0iJP0NHPX
         RzJKgU1EEu09/lZW0hMwEBVMr0H4Zt2Z95ZPbEAlZl9DbD4RUH8nssd0kppcmp5UwWCt
         hwCg==
X-Forwarded-Encrypted: i=1; AJvYcCVKuRInttLWgSbHZrQEfcbtte6CauwuTwFE1XQl8bjcPKM/Hd7PPI0ZowN6h6cQeMZBvJHMieZpZBOFqso=@lists.infradead.org, AJvYcCXOVONUeROau4igb4dZ4ZCuDnqF+McEmQTWiw29abCXd7FUJ8F+RECmM13K19EHUDsIbXH8S4KzxXkg+EOG69xG@lists.infradead.org
X-Gm-Message-State: AOJu0YwmsKy9TsL675dQl5JM5ZyJPHCwnnCTEaBTp1pMUqY8OWQT4rTJ
	n2OJADl5Ohq8TB4uqxdRwFnVtHKQQt0AiBkFJV9Wmg0Ymb8F+QKpxCFF
X-Gm-Gg: ASbGncskvCnpaUsTFXgpTbeyM6Hu2pU2H5WNmwPTg17xSBPGAZ4zWq3AbSuxeAyt7rj
	/i29ZyAyxZ78lJiSH5ExyB3vfPiekEZHT6LMpEY2KAwCQ7iv18NWzEGtVGPwHKJ2L3whdZh20JD
	2WWxu5q4zJHl4KrVc3nPTaYKzwVwHYbylEcBrwf8VJcKBxEluye/K9GDT93i42jkhHHmr68KCVj
	NnQx0Q7Oc/RgdqbaZeF3DOX+WSlP/5g8or8Bh7ZEu30f4FPy0+hvfDDKZacOYix6gLPGFxH3TSf
	TU0PKT/p4L859/efIywkema7Oz33JNq5L9lxjQ3175e6m2aOqNTYti4EVDHQlQ==
X-Google-Smtp-Source: AGHT+IEQdAUYETW/gFl9/oAcelA7lj1OlgJJckAOnjGK9HyiGax3+ORLzbkl8qg66/CLNj/A5zHCVA==
X-Received: by 2002:a05:6a00:3e23:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-74ad4462133mr7446024b3a.2.1750899316199;
        Wed, 25 Jun 2025 17:55:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749c882cd8fsm5330612b3a.77.2025.06.25.17.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:55:15 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/6] arm64 support for Milk-V Duo Module 01 EVB
Date: Thu, 26 Jun 2025 08:55:03 +0800
Message-ID: <175089922824.136282.4248920975036123392.b4-ty@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_175517_509079_96BF6563 
X-CRM114-Status: GOOD (  11.84  )
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

On Thu, 12 Jun 2025 15:28:08 +0200, Alexander Sverdlin wrote:
> This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
> been chosen because the upstream toolchain can be utilized.
> 
> Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
> peripherals with an addition of ARM64 core. Therefore it would be
> beneficial not to copy-paste the peripherals' device-tree, but rather split
> the most suitable riscv DT into ARCH-specific and peripherals parts and
> just include the latter on the arm64 side.
> 
> [...]

Applied to for-next, thanks!

[1/6] dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add SG2000
      https://github.com/sophgo/linux/commit/f71cc64dde536e1e805e5b38855d8d3a01eec845
[2/6] arm64: dts: sophgo: Add initial SG2000 SoC device tree
      https://github.com/sophgo/linux/commit/7846621ce517375537ae2772e54f033a241fe382
[3/6] arm64: dts: sophgo: Add Duo Module 01
      https://github.com/sophgo/linux/commit/7a2f4a250a1129e9d92ed8c43c02f528181df679
[4/6] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
      https://github.com/sophgo/linux/commit/29f4eab1d97c89a0a72793823db287ea6649baf6
[5/6] arm64: Add SOPHGO SOC family Kconfig support
      https://github.com/sophgo/linux/commit/af00cebfbb31190dd0124c431d1baabae456c313
[6/6] arm64: defconfig: Enable rudimentary Sophgo SG2000 support
      https://github.com/sophgo/linux/commit/1793a187e20257c260f520d42611966d6d249f22

Thanks,
Inochi


