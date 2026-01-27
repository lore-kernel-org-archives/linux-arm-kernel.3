Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8ACD2594B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 07:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ecu5YJerF7ppjEFjoeyqLO82/b5nn1WtdkAH1BLTIA0=; b=re7QyDkENg8UD8PuNG7dwB9eBm
	muROoWy82xP9Coa8GQ6wMt/ld4dBlo58b+JOheP4y77gytbS9sWM/i16XFmsDWpQ9++ogvV6GouXB
	PDhSWdftMWl52esKbK0KKqaFvHS7bdDraJdncNCYg9LTOcD/ILCoB9kYvelXTbXbmeQD8uUs+wzq+
	D9vtrYv7HUjzXfjUEvDG8NTIFyTqarRXc3g6eG6CXEFe4xcuwUShEtmkrJnvuHjyaZ/fTkGSxk86Q
	hsbXEyo9p+2W2FaWZNIZSZWGYn1xhTdSvlo00Yw6hvLr+Ts4oyEJFF0vpi4NJk51AKaDGcoVZpuv6
	bSw9NHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdJ8-0000000Dl6c-0pfC;
	Tue, 27 Jan 2026 07:16:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdJ5-0000000Dl5w-2MLi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 07:16:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso38669895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 23:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498171; x=1770102971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecu5YJerF7ppjEFjoeyqLO82/b5nn1WtdkAH1BLTIA0=;
        b=im9CDbDCprLLDsYSFbpLWszIejfwJ1mNSDo1xbRXj8ieOKhoRBRANQPq+gZxhsVyBz
         7XzDm7J/tOKxGMmUD0FKn6Xkk9BBaEEL8J7j7h+OfAkF5XW0Tsz+BBfj+TTfznHisqHQ
         T22jD/15rUNWIb88B4pEG0+7QRg2d/kCDK4kwjgqicMALNLkzOhMYtLBqEAZXjuv+KeO
         FXpJmVQRZUlLddUGcyeJtj3/pN1p3AtgVOAV/lNwNScXERrLCX9SSvzAQ+7XjpkpQ3iq
         gca8MRxVH1JhgK3JG/SX4dzolg+RON4m4MN/4f+9jvqwJlIXwIKFPRtfRnE0PSTXH4Lg
         7Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498171; x=1770102971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecu5YJerF7ppjEFjoeyqLO82/b5nn1WtdkAH1BLTIA0=;
        b=KPhKcxrw/jRnQK17TK9524VlZ0SmPWPt9qLbbBi6bktB1jhpjQYUPiA/z1PANxtScX
         W3SWhSfVVfesxttDMFdGbczto2fiRsA0z24N1EmPP30RxGxobGjRjKMcvGQMktaWJrOx
         bfqAMEcfdTj9DkwxTZoQv/eIorVYc13L+m9YMnTSlZWJL1fsoF0d9QnUwadxV4IWRE5a
         fa/ASBEHbyb6spkt1FclnxM5XZ4EaTUgm0BM3gSwVLJ/0xguw1ASZPdoHowYt5olpjuW
         L0zekipZOvlWgUaYXd7JoEYxJ9ioPhtIhF9enLJoZ1dveTAD3vAegpGXjTH0g/Rtb2UT
         s9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsjLewkWJYXk9Vg3aJBk8sUkTh9igYBju34xatjiUsPh25DeL6zPmBzIRAO+FXfQ1AqOEtMvsVjnitph++QBDA@lists.infradead.org
X-Gm-Message-State: AOJu0YwohrMa0NdJzbzZMd3XQx2EBJgPWsyuda6q8W4R/j9THkyjnTYw
	tlHM+IFtpzigTxxRnqyP4r6FJbO3Alxo7yhyaWx9baAoCAMLUYhxSm3R
X-Gm-Gg: AZuq6aK3rn5RoBRnVVVbVxc/j9Cm8JfGKqsv+hS1bsrcl76tyiC1hVi5Y09vVZJ9Aba
	ow4tDpHfcUONxgYZHqm6eiViK73SqAP9BqwVzOjua0O5++qSsYnJ7EWm886GrT2l23vImM2dPOL
	zwE8UoZHexcCYVlJAgPrwt4HusDKshjKqxlnfvUIs+NUQNNGSW9ptkdLJTcLOZC+jQCxuvjVyJD
	sklBwFmkEQAJ2oK+jCPl/oJOlOgSeapRIaBhM7zjBFoIB/yg0J9ZUkl01fEOwpBBtknV/PBZHXu
	CNM4M7FX2UrwD8Oeks5XjRp9FJnfxPVGdmTR2phNnA21esSw0oEz+KUOvE0LyXumdqMx5W+SHR6
	7DsnMqdNxZLF22tu4smnc7TafmrYz3w5FRvvwLlNEla4zfiCOxtWzDjUS9lSTWx/5EqS05+Bl+e
	RD3DYN/3NBCu8uq9MRnn0DD8Rb4EsU/YakTec2j0+nkXP6d/1b
X-Received: by 2002:a17:903:3545:b0:297:c048:fb60 with SMTP id d9443c01a7336-2a870d5d5e3mr7523855ad.25.1769498170464;
        Mon, 26 Jan 2026 23:16:10 -0800 (PST)
Received: from cn1dhc-k02 (125-227-180-151.hinet-ip.hinet.net. [125.227.180.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fb063esm106160505ad.85.2026.01.26.23.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:16:10 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	james.tai@realtek.com,
	soc@lists.linux.dev
Cc: afaerber@suse.de,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cy.huang@realtek.com,
	stanley_chang@realtek.com,
	eleanor.lin@realtek.com
Subject: [PATCH RESEND v3 0/2] arm64: dts: Add support for Kent SoC family
Date: Tue, 27 Jan 2026 15:13:59 +0800
Message-ID: <20260127071530.25426-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_231611_632435_ACA1D21A 
X-CRM114-Status: GOOD (  11.72  )
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

From: Yu-Chun Lin <eleanor.lin@realtek.com>

Hello,

This patch series adds initial Device Tree support for Realtek's Kent SoC
family, including the RTD1501S, RTD1861B, and RTD1920S variants with their
respective evaluation boards.

The series includes:

1. Adds compatible strings for the Kent family.
2. Add Device Tree files for the Kent SoC, TD1501S Phantom EVB (8GB),
RTD1861B Krypton EVB (8GB), and RTD1920S Smallville EVB (4GB).

The patches have been validated with 'make dtbs_check' and
'dt_binding_check' to ensure compliance with DT schema and successful
compilation.

Cheers,
Yu-Chun
---
Because I haven't received a response from Andreas Färber for over two months,
as suggested by Arnd, I am bypassing the currently listed maintainer and
sending to soc@lists.linux.dev.

Yu-Chun Lin (2):
  dt-bindings: arm: realtek: Add Kent Soc family compatibles
  arm64: dts: realtek: Add Kent SoC and EVB device trees

 .../devicetree/bindings/arm/realtek.yaml      |  42 +++--
 arch/arm64/boot/dts/realtek/Makefile          |   7 +-
 arch/arm64/boot/dts/realtek/kent.dtsi         | 166 ++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1501.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1501s-phantom-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1501s-phantom.dtsi    | 118 +++++++++++++
 arch/arm64/boot/dts/realtek/rtd1861.dtsi      |  12 ++
 .../boot/dts/realtek/rtd1861b-krypton-8gb.dts |  25 +++
 .../boot/dts/realtek/rtd1861b-krypton.dtsi    |  72 ++++++++
 arch/arm64/boot/dts/realtek/rtd1920.dtsi      |  12 ++
 .../dts/realtek/rtd1920s-smallville-4gb.dts   |  23 +++
 .../boot/dts/realtek/rtd1920s-smallville.dtsi | 128 ++++++++++++++
 12 files changed, 626 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/realtek/kent.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi

-- 
2.34.1


