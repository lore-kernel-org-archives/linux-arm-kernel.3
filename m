Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310D4F8FA76
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZpOX5RXqNUjplHgJxW+vYUkumMwwbJe5HfVnVND0CgQ=; b=Mty6Aq+ir1htmQQabamMCfigwu
	tdeoP7lB0ecSk6l/eLkThyKUmky2x1NCTnBAcULmFOPv7NAAeDXfqZTc9WCxO6em47QvnmXE/vkVW
	TacjYDu/D/Cw/jpQpMcm4WPG3zSevjAs1WlKaObyUn324GhawxRXO4V6Jlgbv7NnI5a+LXrATnGCf
	T5r0q3jnawqlVrArLmQ8r4MPKoFR+PHGpOTzvheZosSk5gjNOl/cQU6KchkAvbw7+MJGw4gfmN1wZ
	ulrMHsVTM33BT6GA+tei9ZBplA+8ZU5Xve4FXn04I64nhyPSL6czfxRjxFUSCzUhqE8uLGdLje7ti
	4GKk65bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAlb-00000008cw4-3XA0;
	Tue, 21 Apr 2026 13:03:51 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFAlZ-00000008cvZ-0uxr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 13:03:50 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c76c067bc51so1571211a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 06:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776776628; x=1777381428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpOX5RXqNUjplHgJxW+vYUkumMwwbJe5HfVnVND0CgQ=;
        b=X3ZYKqOBGVeVVymg+BUw3aXBUrJoz7rUIWb7VHwKnQQ7DQuCQjlBruKeSlDvKzHKjl
         AuhVRW8AaVjytcjjHRggjylxbZV49HXAttgkzARzN7V0haPR9SLlbQFAKDG1ZHaBkixy
         IdEzqmxZoMoEdAenLprJW3kZUlqm5e46Lv7SWLNYaISsXLOp7f/Zw0vmiyRwW9lpL+Nh
         kFq78ezRTkZ74zat+wilBzlHnvjfYfvEzmDXYPTynQu4w2An25O/OoNHrUCV1siG3/mP
         DNN6lh5twpV2mypT2d4adtg0/wYNy+aQhpbo/S/KRG8bDO9ITEuyMhVUC7TSMJdB9aXw
         a7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776776628; x=1777381428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpOX5RXqNUjplHgJxW+vYUkumMwwbJe5HfVnVND0CgQ=;
        b=KaU3ZQ4gMjZaSx9czfi0a4hgac/dubP895Bg5yS9u5YM0lfVhSZFJVVegeBXx8Zm0Y
         3DWMtdZIaU2OthBBS0d50k3UWxxSkG3jLzEv6r8tsmFgusQxrHRIeiSmKBljdPoSu0c5
         uFkTqaPHed2qaLaEK1ueAu6tm8IKG4nWEd8UE9QZ006XOxdk4l0rGDNEMjoLqrkP8xML
         DuCyZtMgT6bFOZWgIbh0/x5ShbVvfA6neWsDP9fkEh9rEYTrOjTl7FZX9rD58gzLFvvn
         rA/gjTYu3V2d+bUz1J3zT2ri4L8XS0vV7zaZOdd+Ez74MRlq/jmOO/B7F3Dc4f08KWr1
         eFjA==
X-Forwarded-Encrypted: i=1; AFNElJ8gIwIKoZsHiBioLlijXDqH7JDSCkaY6dnBrBeWPIKEAuJMtqPX1oCaJWj28emT5iv3Wr0/qLdBVSpzgPF3JojT@lists.infradead.org
X-Gm-Message-State: AOJu0YypoMt1+qfo0kGmXrQbaa0P3bNY4CsINwMIBeQaY5b+k70mVFoA
	XoPgwfJAe2KyG/B48moWh1ghptoJrbLCLhS7BjKcvSG+ozVkLEwywzpD
X-Gm-Gg: AeBDiesXYOzqE1QmmzGNDqz+ZivLfseKHkUWVdNyd1pQSQa2Vp3SYVhwqwrVsE6iVQ7
	TWqpEqAcplmPOwzrSXbFl8C8eyztsZptydui5xccBFmCFllKSn1vkXg9IIzbpUFSUKpb14JpmJP
	VqmycVIo19IrlaDFHSWODygWXKLSDloSaBVm50ZhgIn0+muvGz4yxxX7CvKxVHnIJS/q330zTkC
	Ufqnjg4dIaY0kz0EFOlAG9j8BtI/6H2x7opzE1dWDVCpKs/yu7FcAFXWS8qOQ0Iw9vz8KSBFuVI
	te2a5RoaPlEGtyXgA6a0U0Mgurf9hUZA3WB/pDQ0fLSSms/dmPcVziTDAGyXaQYDhm31VUoZ8a1
	GJNcoJW8SzTX1+qVqK7SHJj258FbwisvjrT0jUbtTdoux/fobLQRmf+hP+/b0KdOlCC94rcAJ2u
	s4pAyTjHPIT4aXN38uVUCf5Obr1ULL0KdR2aW2DRJXd6dgwN3DNL77wwhSL43xxIH6gYO1R9iTV
	yAufAxjx3jPFAbUSMKOImM=
X-Received: by 2002:a05:6a20:3c90:b0:39f:acae:f12e with SMTP id adf61e73a8af0-3a08d748ad4mr19977605637.22.1776776627679;
        Tue, 21 Apr 2026 06:03:47 -0700 (PDT)
Received: from fred-System-Product-Name (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm14456484b3a.3.2026.04.21.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:03:46 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1]  ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs
Date: Tue, 21 Apr 2026 21:03:40 +0800
Message-ID: <20260421130344.2751662-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_060349_262603_31799C80 
X-CRM114-Status: UNSURE (   8.94  )
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

Update Santabarbara Device Tree to include several GPIO expanders for
NIC, Switch, and system monitoring.

Changes in v2:
- Add system power fault alert and E1S GPIO expander interrupt
- Add switch board SKU IDs and power good monitoring
- Add NIC1-4 power good monitoring, reset control, and fault detection
- Update the commit message
- Link to v1: https://lore.kernel.org/all/20260129073749.3155383-1-fredchen.openbmc@gmail.com/

Fred Chen (1):
  ARM: dts: aspeed: santabarbara: Add system monitoring GPIOs

 .../aspeed-bmc-facebook-santabarbara.dts      | 125 +++++++++++++++++-
 1 file changed, 124 insertions(+), 1 deletion(-)

-- 
2.52.0


