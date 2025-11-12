Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ACBCD484C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RZJdhn1bhOKDxWDWTYIA7jJWtzp2FszzhJrftJY1t94=; b=DhX4BgnHdY10Pto4Oss2UWfbbm
	vvmIR3hYhAklMmiRO7XLgvLefC51g15PSPYKkBrkX34j0gU/FTwgnCDm75Eu07SleaHL7sVHvEDDr
	GbI5GKbK0ij+yTwbKnheZ8LFgTWFyZj4i4ljJXQUGGcAjCYwE10k6zzZKb7jNncZ31A4p3Ppiw85r
	5QQ8PWIuh5xZfo7+riHXSOA7Fzo5faXUIWoACh3CDRNwnBAWK1l/u/4gEUbfZcXPRj+8GtY7WjaCm
	YCTZxhvZ8m8eOurkEhP93A3ZqVKpgHJ+GQp3kvrmjhD5COxKFJ9fXE60w0/KCvi+onk/kGz+UdWGF
	ZebPmhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJI9A-00000009WMJ-2W1u;
	Wed, 12 Nov 2025 21:12:56 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJI98-00000009WLt-0UBv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 21:12:55 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2984dfae043so816585ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 13:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762981973; x=1763586773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZJdhn1bhOKDxWDWTYIA7jJWtzp2FszzhJrftJY1t94=;
        b=PK9rT87WyYFu3XtTqQOBREQqmSaOmXaeR1bVcyn8hlD4C8wWUuqhSyv8wPY0AwimLC
         R+2WFwtCC1HnWUWZ/loNmjEcIrjJ17LBRlpV1jiSQKGWGnt3CHUiqecCVVbSIwhautVs
         aqc6C0z+u801JCBlP59iK8tWwp7UEEBYBBykWTxRBLKol7G0BakPB63yaT+bdtItAg3K
         s3HaSGU+p5sCKG1LnQB9cuubCuqUyzfFNy07T2d/+m595QJKcHdsDnCnf7YkUU8Ag8sr
         TOs/gxXlZYOCpi4OZb6lczunsJ1jltIqUihjhFomISXfru475+yhgGV8NBXKxjD3A4T7
         o0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762981973; x=1763586773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZJdhn1bhOKDxWDWTYIA7jJWtzp2FszzhJrftJY1t94=;
        b=VqDzuzN4GWpOKV2TqSiHmH3ghzt7q6RXIXsQALlY0eCfNG2G1kgbLWOzMkSFxuaDMf
         hHqRISeBSRmtGBktRdgXZZY83/uu9RiAvhOndEJlDP8Yb6on/sHaZEmE2PBMq6ULlw0q
         492cR9/CRpARcWblhS1inMAXx879T/SdGNU9H2+onaFkZVRz8R/YYfI3aPlrl0LLJnIc
         KFPEFyCila43N2tI/YU+aF4LTtCEViTfRspyRN7uP/DMDDwL+T1xvbajF0DQgw7Wk6PE
         /s7UaECshR1bbUWIpgUZjB3tRcWvvdX6LCmybqc4sp4q4s4UZwQaJbrYngVYccO9Hcb+
         Mwpw==
X-Forwarded-Encrypted: i=1; AJvYcCXqe8jeFlrRrEbjOzW4xKhnjnGjrnZIm556ymAipFiQmXayiHTpkVhlJXb+nyBhywzw/xWkhj0T6IY7q480xdO6@lists.infradead.org
X-Gm-Message-State: AOJu0YylkDEJ14KQfOb8Bc1Q4xxOdU8zPHfQJe+EULR4U7uiySwen6U9
	syeVRyXsI+qh3qbOFCM0POCX4b5Cd59knxwMOx9eIsIfuPTczAvMoY08
X-Gm-Gg: ASbGncs8Z+ELfPulded1R+MAuPYsy4dlSIY0inQePpXDC0epFaWvFF+IInr7zH4CtAl
	8hQDssqy3BI7Y/nFc3ptb+zxfYEvkmMJ4aNqkkm74TRF4jTryKhVpXvglYH4s9tLmnjvIobC7NK
	dRX7Kw2m+m9DQYYc+eNAoM9rb32VPzJ6fVxKvACPNJcHTP9sS2QTAWQLlyPosr9FqNCngftxQrw
	9zBqKKLIvEnjNxXtmATUJnbvOKg9YYXD0mB7D1e8J57Ist5P29ofu2bkVZkBbrePw0Pd22XZu5U
	9j+e+YlU9pm149/DooIkYECg4tnaEU/tR19UXupAHm7ExAcg9eq6j7cvdWSNsxiQMHKnzAPpxNl
	kxZFKzEdXw9XzNTy6mMLDMhSQB3AGAKSDZHlIQ8LAHRimWEEOQtXmRSb7MfP76tcZStE=
X-Google-Smtp-Source: AGHT+IFeIihBkU77ETtw+XHaa6KFXIJgpjHeG0dAkdR6b1vkSG3JvHMNOQ74vp6k+nYvvBf1xBPKlg==
X-Received: by 2002:a17:903:2f88:b0:295:557e:746a with SMTP id d9443c01a7336-2984ed34126mr48888625ad.13.1762981972686;
        Wed, 12 Nov 2025 13:12:52 -0800 (PST)
Received: from gmail.com ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245ecdsm1011525ad.32.2025.11.12.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 13:12:51 -0800 (PST)
From: Peter Shen <sjg168@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	peter.shen@amd.com
Subject: [PATCH v6 0/2] ARM: dts: aspeed: Add Device Tree for Facebook Anacapa BMC
Date: Thu, 13 Nov 2025 05:12:46 +0800
Message-Id: <20251112211248.3711889-1-sjg168@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_131254_181609_1F22D7FB 
X-CRM114-Status: GOOD (  10.23  )
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

This patch series adds the device tree binding and the initial device tree
source file for the Facebook Anacapa BMC, which utilizes the Aspeed AST2600
SoC.

The patches configure the necessary platform peripherals and aliases for
OpenBMC usage.

---
Changes in v6:
- Rebased onto the latest upstream kernel (v6.18-rc5+) to minimize potential merge conflicts.
- Restarted the patch series submission as a **NEW THREAD** to fix the incorrect threading/In-Reply-To usage in v5, as advised by the maintainer.
- The email sender address (From:) is now corrected to fully match the Signed-off-by: and Author: address (sjg168@gmail.com), fixing the DCO mismatch issue reported against v3/v4.
- Corrected all previous style issues: fixed block comment styles, line length issues, and removed un-documented/unused device tree nodes (amd,helios_cpld and eeprom@53).

