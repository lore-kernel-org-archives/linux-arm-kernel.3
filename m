Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE8CCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ihP/wnPXyZhWgHPlteto2ft6qT692i4bL35PGC7Kwgs=; b=kOEJVN4vZWLPKnpoRyta6rse/A
	sUeCtwOHo9jKsabBb4HRviDnW+mqb9d2cmKdX8rGgxaoeem8GRQl0PRWbDd570O0D1CCArmjuXEfO
	EhCX7ON8O2KOB1V96BHvgn2mXL705BKlJpCVoBj01fBZmAyBePb5979xA0N8IRoz5x7aAiLRy4qZu
	ANlT5CbfZn3wKCRa3ST7s2w51HYYpNb2yxSPt/cdOtp3YQE2akUMFd7WOrBUAgtpqWZOVGRxJcKM3
	DN4j3yWaTZPqXHw2cu93aYrg3WIA+aQgGddbDRavTIwt0k9oisLklT0cTdg2NaIGesmHgfCeXCYqy
	pQNQQZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulWdd-00000008b5T-0BbW;
	Mon, 11 Aug 2025 17:48:49 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUHl-00000008APH-3Og6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 15:18:07 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-af96d097df5so815683066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754925484; x=1755530284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihP/wnPXyZhWgHPlteto2ft6qT692i4bL35PGC7Kwgs=;
        b=a6Re2YkF20hwM03xVw9j6ySEVAOy8YPDTohY+9c+pPkTQCI5RZE6DMTPoU94S0DuHw
         8DHQrQMrwV4uuOar0UdPuSZvnmkm98b263Id28lPCfKfRMYkYS6gIaprCrmi3aUOxhTp
         h1cWj8Rxj1lxS6expbIn1k4kH6RBuW5/a3ZT/z30CdMjBMiYVJ4UQNeZ6qSmnEdon2uq
         Xhz33JDMSw79XSFNay560qogxO9sIf7G3UC6D+wv+jOAB5YtKcfocseIj8XmMgpFhFtF
         u8N6p/nDtt3WXIDtXsafCIgwLk56Y9MPW0I66sXw1jIzP4rAhX3EDtGTeP4oUz5+2prM
         NWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925484; x=1755530284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihP/wnPXyZhWgHPlteto2ft6qT692i4bL35PGC7Kwgs=;
        b=rMx87/u8fA2Ry5M52W9iVNSGboF18Aos3aRP3Ejqvb6QjhQjtQyj+DkZUX+n7Bu3kY
         8xAc/bAKoJJ2H7IRYVOVNY3pidIYENrzpT8wOqKXQzmlcAa7+Er72lpoWZF+xbtgYC/8
         BQEYHBXmcPCKmDAzm0SxzoWBGPJJPn/UManC6G7IcfHhMM6q9+jDeBEj7LMKqmf/6NiU
         yu+HC0MxMheLGxqUCE1dC7BV11dHSWAY1zbP8rvqYtKGesBU1+pJiNat5l/WbBKJUROg
         +QOPAI5Tz2ZfAX+/kaTRAhqeY8C7OGyMwU/EdEc3dBJJEt3awEWZLnHkVYAQqfB5zh2e
         g9XA==
X-Forwarded-Encrypted: i=1; AJvYcCX+jLrjXiEgAPTRk0YmJBxDLdxSwR45+Qb/ZbgBpgaaSw+FaGUHchyOf4txGJCY04eXEX6WqcRQ2WTLttJE9JKo@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ6KsCXZtM5CiMxQ5vadIuXUsMo4nRNgSc/0ZJG05yH52p+KBF
	Cvq8qOGkCNwmyHr0VdQaA+9P+VAa6WFPHJRIFyCLLqrJpD36+hZviW7/65KmG6YiWD4=
X-Gm-Gg: ASbGncsmQdMlUhNpmGcqL30HyStXqcN/ipnpL8SgJ16rasnPlKNUOgwSYwObN1HDPZc
	PjLTX7/dq0BnIEMkjuDdHAUL573nmYOWt3oHX5M+dtQ6UMIqaErisqul9o4PdnL5T5onRtVgpZB
	9IBFck/frZ/krKEeIOVjHw66oQUgEWmT1rmLI0VHQyeY9FLMOlU3j61K8xFdhOWgiEIJB5ftYe+
	TVxMyewf90yFmxe8gRzsYTH3KJCP7rSztRTAbDy5HV6TkLa6DAiJsiSOoPGrt/Vx7VBZ5FGCsv4
	xyMpAJopwzVi7pDE5kjsh0aM8wU7/VN9fGdsulGwE4KGAWcVX6uXYbOOvCYAbByCrKaA6vYDJoo
	ea0VghL36V+SceaNYvEvvLI81KXbuoCgfJJlR87dIMzwh7gK0LHR5wwVYqxMUaDq0aQ==
X-Google-Smtp-Source: AGHT+IGvJ3ayAmkrGkViVLnbNoPZ1sMap6TBv2tr1d6iu6pDDVV5j4fRLfmHXE5vLfntRBsHIUMHNQ==
X-Received: by 2002:a17:907:608b:b0:af9:5b1f:b87a with SMTP id a640c23a62f3a-af9c64791a2mr1210151866b.20.1754925484035;
        Mon, 11 Aug 2025 08:18:04 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c081sm2014946666b.97.2025.08.11.08.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:18:03 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	linux-mmc@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 0/6] Add peripheral nodes to RaspberryPi 5 DT
Date: Mon, 11 Aug 2025 17:19:44 +0200
Message-ID: <cover.1754924348.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_081805_848691_4C0495AE 
X-CRM114-Status: GOOD (  13.65  )
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

The following patches add a few peripheral DT nodes and related pin/gpio
nodes for Raspberry Pi 5.

This brand new patchset (hence it's a V1) is the second part of the split-up
of the patchset [1]. It tooks patches 3 to 6 from there and adds a couple
of new patches that amend the DT bindings.
As a result, patchset [2] is a prerequisite for this patchset.

- Patch 1 and 2: Amend the bindings to avoid DT compiler warnings.

- Patch 3: Adds core pinctrl nodes and defines SD pins as a first appliance
  for the pinctrl.  

- Patch 4: Wires the gpio-key for power button and related gpio controller.

- Patch 5: Adds DT node for WiFi.

- Patch 6: Adds Bluetooth DT node.

All comments and suggestions are welcome!

Happy hacking!
Ivan and Andrea

Links:
[1] - https://lore.kernel.org/all/cover.1752584387.git.andrea.porta@suse.com/
[2] - https://lore.kernel.org/all/cover.1754922935.git.andrea.porta@suse.com/


CHANGES since [1]:

--- PATCHES ---

- Add two new patches (1 and 2) that amend the DT bindings.


--- DTS ---

- bcm2712.dtsi: Added 'interrupt-names' and dropped 'reg-shift' and
  'reg-io-width' properties in uarta DT node. The latter two are
  just overridden by driver code so setting them in DT is useless.

- bcm2712-rpi-5-b-ovl-rp1.dts: dropped 'auto-flow-control' property
  since it's not parsed in driver code.


--- DT BINDINGS ---

- brcm,sdhci-brcmstb.yaml: added SDHCI capabilities by including
  sdhci-common.yaml.

- serial/brcm,bcm7271-uart.yaml: let clock-frequency be an alternative way
  to specify the clock speed instead of clocks/clock-names.


Andrea della Porta (2):
  dt-bindings: mmc: Add support for capabilities to Broadcom SDHCI
    controller
  dt-bindings: serial: Add clock-frequency property as an alternative to
    clocks

Ivan T. Ivanov (4):
  arm64: dts: broadcom: bcm2712: Add pin controller nodes
  arm64: dts: broadcom: bcm2712: Add one more GPIO node
  arm64: dts: broadcom: bcm2712: Add second SDHCI controller node
  arm64: dts: broadcom: bcm2712: Add UARTA controller node

 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +-
 .../bindings/serial/brcm,bcm7271-uart.yaml    |  19 ++-
 .../dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts  | 133 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  47 +++++++
 4 files changed, 198 insertions(+), 3 deletions(-)

-- 
2.35.3


