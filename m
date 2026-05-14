Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C421CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eYXd8HA7NIedKDT16VEUKdG9K7xMUHUqGq+blCrAy2Q=; b=zfPXn0U08LV98i
	RVgJtn8Xb6bfQKJM/LBbjl7gNiqaFgbGivTbLs6MvMK8Zi5reHsvWO6b/JLbxFpTManez0Rck55TM
	22BnyU5Y/OhOGq+e2wSP8gCrbRXQb4HfU14nY9OdaXvxsQP64MRdp3ivvFbMttT/66Pz8T+1lbtvP
	65sbZyZSs55FeEaPy81nFNqVeuByGy4nKQKGqRK/JffWszOnIsgtkRBgpoSGNamy+XEmAdHIBvJO5
	wBrE7AISvf47SXnOJzDTh8J4F+Q11f06KLFZmxbUS+3JrsHRDfb6EMqjOA/tcn6aITXXv9FgFAOyA
	33Y/DXE+xPJQ8EWc4BbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXiG-00000005r6f-44GI;
	Thu, 14 May 2026 15:11:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXi1-00000005qpq-2Nuj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 15:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=eYXd8HA7NIedKDT16VEUKdG9K7xMUHUqGq+blCrAy2Q=; b=i/LPwm2WC6Guz6iC5XANYehWY0
	S6E79oZWACPNJ2ujoWufxLL+PjvZoxPl1/xbI1cNO8NMbnLqf3fyQsQId75W6njiKohHMFS0LMJiY
	9iZmlcniIoh/HsadO3VARxn4bgmE0OD+om3APY4UvtEi+0ZrthVYp1BL/mLLkZIidZYNsu7/btOPT
	boPWzjBQzyP/J45sMYjzQ8GppKCkrU13P4ZMJIltz7Ke+86+fZH2lq6t0ot+OmmexZUomkSej1XgO
	5A5RY2o+9kjeDbO1VBzCk2vOGPVzN1LtD8BbetNqqcO7xLlO0lCH34+UzmPNmZvpAnp8kiauYuEjm
	Hczgl76g==;
Received: from smtp1.tecnico.ulisboa.pt ([2001:690:2100:1::15])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXhy-00000003DwE-1TUs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:10:44 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 2A7F56000874;
	Thu, 14 May 2026 15:47:30 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id muTaDOIg6hAT; Thu, 14 May 2026 15:47:28 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 4DB63600086F;
	Thu, 14 May 2026 15:47:27 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1778770047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eYXd8HA7NIedKDT16VEUKdG9K7xMUHUqGq+blCrAy2Q=;
	b=D59NU0rvOt5xK4H8TdW4OWgxoGyZ/QHLPKe5y3ciaIviesFMLfoOFf6+JuFvit5g3LQH5T
	I6T/P5Lu9wCF0XkYYLSs2ApDh/3lUc3y4oAp5ZPmb8LdC34upXp2TynafKjoChSAYWluxN
	FnW0ZjiK5Vn/aT8qvxu0CHDGvpc5mFgvfSc68ZCzq9zrV9plNzzJetDCEkMGSKFM9MxGJL
	mnWVn/lhrIz5m7VzpvBV1O5O2PiLTmPpNuy9Y7htfaJiX3/widNU1ytHmQhenhRqIbNeU0
	xceE55r3AqAj+E+3CcAaf4ZOUFllXU6G1ifCm0bBwZgfRpp2sZxkkVKyNaQSUQ==
Received: from [192.168.1.94] (2a02-842a-00d7-bd01-2527-ff0d-f555-b6e4.rev.sfr.net [IPv6:2a02:842a:d7:bd01:2527:ff0d:f555:b6e4])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 9D94D360249;
	Thu, 14 May 2026 15:47:25 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH 0/4] power: sys-off: fix Pixel C shutdown via MAX77620
Date: Thu, 14 May 2026 16:47:18 +0200
Message-Id: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMzQqFIBBA4VeJWV9BJYV6lctdpI01QRnO7Qeid
 89q+S3OOYAxETLUxQEJV2KKU4b6FOD7ZupQUJsNWmorjSoFj83SiTlumGIIorLaemOkcs5Djua
 EgfZn+P295sUN6P/3Bc7zAuqVfTtyAAAA
X-Change-ID: 20260514-smaug-poweroff-9626c5501bbc
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778770045; l=2142;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=ZpsaXMnT8mGaJqAf4d/VAYCqi6dkod4gfaRjgq9A7Bw=;
 b=/P4GnGyDmcmpOljiLDZFxUjiKx9mtbf0Jo+QarzqIuAHLNZ+yx8kBKj4Cu8dyidx9Qkn3qAES
 vSqDg0koDmyAb37rWOnWoDs3v0hpZq1cm7MmrXt5dFMIx2s71uDXlzl
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_161042_772524_014F0232 
X-CRM114-Status: GOOD (  10.21  )
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

This series migrates PSCI and MAX77620 poweroff handling to the
sys-off framework and fixes shutdown on the Pixel C (Smaug).

The first two patches replace legacy pm_power_off usage in the PSCI
and MAX77620 drivers with sys-off handlers. Besides aligning both
drivers with the modern poweroff infrastructure, this removes the
global callback dependency and allows multiple handlers to coexist
with explicit priorities.

The remaining patches address shutdown on the Pixel C. Although the
platform exposes PSCI firmware, its SYSTEM_OFF implementation is not
functional:

    __dead2 void tegra_system_off(void)
    {
            ERROR("Tegra System Off: operation not handled.\n");
            panic();
    }

Downstream kernels instead rely on the MAX77620 PMIC to perform the
shutdown sequence. To mirror that behavior upstream, register the
MAX77620 handler with higher priority than PSCI on Smaug systems and
mark the PMIC as the system power controller in device tree.

Patch overview:
  1. firmware: psci: switch SYSTEM_OFF to sys-off handler API
  2. mfd: max77620: convert poweroff support to sys-off API
  3. mfd: max77620: override PSCI poweroff handler on Smaug
  4. arm64: dts: tegra: smaug: mark MAX77620 as system power controller

Tested on a Pixel C, where poweroff now completes successfully
instead of hanging in PSCI firmware.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Diogo Ivo (4):
      firmware: psci: switch SYSTEM_OFF to sys-off handler API
      mfd: max77620: convert poweroff support to sys-off API
      mfd: max77620: override PSCI poweroff handler on Pixel C
      arm64: tegra: smaug: mark MAX77620 as system power controller

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  2 ++
 drivers/firmware/psci/psci.c                  |  8 +++---
 drivers/mfd/max77620.c                        | 36 ++++++++++++++++++++-------
 3 files changed, 34 insertions(+), 12 deletions(-)
---
base-commit: f327c8ef8a6905ee97b62e42d808603c5b759418
change-id: 20260514-smaug-poweroff-9626c5501bbc

Best regards,
--  
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>


