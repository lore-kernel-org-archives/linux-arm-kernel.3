Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91A0D2E9C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IJ8DZ559nDo5G/ZkZVyMN4vfR4RJ1OGVlWo9rNzGIfU=; b=vTR04nC2OtRtKgC+n6q9zr+9AJ
	kfnEJr5fEWalirfVwcJxc+E0QvbgwQE2ILzNxAyaZl29WWOIeiNTFOx5owCAXI6QIPDPLDJKLh0OA
	mKs1CJ/hcBRcdzeutdOcmjeC2A+/9G3ZiN5+CYqaP2BFMGuCF9D70uaUJxrUqTLR1HJpVCATb5uFQ
	W4XPSsVP1YloDLclnjCp+lzaCh59eerUk7EFqqO4G7fuDFXj2Bvhi7vKP9WK48/zC9U8lKLTdC/5O
	RKr4shPKbUVOItsAHhoAgaP3uXBMm4Sle59Zq+Dv2cxhBs+HRk6KI4vFnLmVpcYTbeK+gLjVA7iot
	8hwhjSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAR45-0000000HB6X-3nrX;
	Mon, 11 Nov 2024 09:50:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQzb-0000000HA4c-1J76
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 09:45:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20c9978a221so48641935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 01:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731318354; x=1731923154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ8DZ559nDo5G/ZkZVyMN4vfR4RJ1OGVlWo9rNzGIfU=;
        b=fDG4nKpzyFpcnx0tH7TEzLBhNdSXEbJXoz1CB2vUajQ4LtXpChWDMc1/uW6PQnX2zy
         Llnz+QLFaI6jWx85d54hgFRa4Kd31yaofIwvRiE5IvMMVjEi7+kzOX/pkoIiDYdWZYPz
         4N9rwtVQ6EeuhhM6bkSJOshMJVaNvCpHDgLre5yKtkga7vun5T+Ev+ytnEeAUjYB0faK
         zsPL0MFuLym0Vhax28XfuKQs7GfCu9uuGjnWePhD30Tq5VRjyub0mJiZ9MeQ0fFo+Qtx
         Sx7mLRjJQFFzujEcCsfkcQ7y16ONJrMA5L14xVVoa/E6xnUZ7gVAnr8C5P7t/I6SApNo
         0kzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318354; x=1731923154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ8DZ559nDo5G/ZkZVyMN4vfR4RJ1OGVlWo9rNzGIfU=;
        b=W+1YDJvXxOjLC141HitE78jRObCThVy7emtx3Xdx2+hQm1vmrLNsxsG37hTQ6w2r4h
         1Qqkg4WijuH4TxMkBovSdr+PzKt1AcMNpKQHIUGJfWF/r2cMiIfrqomPb6OEqJ6+63OD
         JR5UYulI8Thyq0IuBvRa83mt3tmkeaMWI9F663KBrT1zKluSU0ksgPqUbClaPWsOdi/L
         H0hVYsfoTZJIEIvzf5z0tzk66mm5QBU22Am8apBi3ATws7pXMSH22QmLnn200qUsQUfh
         EEcg3BqMC3r4CM3dB7F+JOh2Dl1UIVSi4x698wYULrtZJunccUhJCy7l4LwSGh4k/NcM
         Tuvw==
X-Forwarded-Encrypted: i=1; AJvYcCVbDxzHIYKND2FUp1iTGsmHMSVZMnrCUryasdtmAfQOWbvdSubEwbzu3SkpJGlHQwfWe7aDmpMrN6aoZgJYxk9Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyX8DeH7/HIvOGeFZCDnBvp3BLKvskQ9e3TA3wkgaMzjc9zqQG/
	nK0LKh+/pjiBLu/O0ZGTzFxBBRskApbNQ5Xiza7IHECkma0z0lTq
X-Google-Smtp-Source: AGHT+IGUDV2eKB878pIBUT5cLr6EWiWN+Kf478uOtpN1L7KICE2CM0Gjp1DENkevdsD/kTAUP4K0dw==
X-Received: by 2002:a17:903:1c7:b0:20c:be0e:d47e with SMTP id d9443c01a7336-21183dc7f8dmr128840415ad.56.1731318353680;
        Mon, 11 Nov 2024 01:45:53 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc826fsm72248725ad.11.2024.11.11.01.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:45:53 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Mon, 11 Nov 2024 17:43:44 +0800
Message-Id: <20241111094349.2894060-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_014555_375917_4A7EE957 
X-CRM114-Status: UNSURE (   7.09  )
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

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Base on:
https://github.com/openbmc/linux/blob/dev-6.6/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts

Base on:
https://lore.kernel.org/all/14e1a0f581417d4228aea8c2569598d42b4bd334.camel@codeconstruct.com.au/

v1
  - Patch 0001 - Harma: Revise node name
  - Patch 0002 - Harma: Add retimer device
  - Patch 0003 - Harma: Revise GPIO line name
  - Patch 0004 - Harma: add e1s power monitor
  - Patch 0005 - Harma: fan board io-expander

Peter Yin (5):
  ARM: dts: aspeed: Harma: Revise node name
  ARM: dts: aspeed: Harma: Add retimer device
  ARM: dts: aspeed: Harma: Revise GPIO line name
  ARM: dts: aspeed: Harma: add e1s power monitor
  ARM: dts: aspeed: Harma: fan board io-expander

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 121 ++++++++++++++----
 1 file changed, 97 insertions(+), 24 deletions(-)

-- 
2.25.1


