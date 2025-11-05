Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D535CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UP9UKXcDpY1DnHkTHjii6Wv8OoUF0/SMSBiuAfg3MJQ=; b=FJY31sStlONvMdpcxof0SzptAn
	CBMDanf++mqbdT9RMgjOA3QGtWhJ0kJX9frHRcjMA2aE6SGcOI9+uj1xpDZxhuya/9atLuMxh4Rqb
	Ql0nJSN0EV8T5B41Kfph6UQuf9e/TIAgQ22rw3ozPc2DWVP1+/Wf6/Ir7Bau8fIlQiYTwNu0S+gSS
	ylt8F37xUrbrLWbigwuTFMt2jbnIr3WwFhBiglpBbVfV/ShRTenI81m81I0hEvJBhK8kuxx3oHqDt
	CqhtQU2GjEEWzZCRHA/zNs5QjriegLOFHLfeYWDhxAC7Lm8Jmqxm+IFhJG0m7ZkkWQl5/hInx/0on
	dEKC/PWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa6P-0000000DPgi-03Nk;
	Wed, 05 Nov 2025 09:46:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa6I-0000000DPZS-14aY;
	Wed, 05 Nov 2025 09:46:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EFE641AC7;
	Wed,  5 Nov 2025 09:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62E6BC116B1;
	Wed,  5 Nov 2025 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762336005;
	bh=sBbijhHOp7oCs6GEaRJPgWgOKT9wxzc+e84cgJVXGks=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Zxw4vUVqTBSt3FCa/oQKoFUJGDmq5sir/ipMJvHg/ijClKxT6uvSg6aI71KYkmWEb
	 2P1YA3dI6PVaovLr49SJRX87yU0HOb70hLnHEQ4UihQP6DP1SbSvShIktizmfBkqI1
	 U8c/e4UrpGgwCPjuxUydBhdu1eYNRJBxsKKDl5Cv2rjZx3DIn6tdk1CMPDgP0pxIxq
	 9JZTudEjoLkrVmqy2rkIEifc9kISLkyha5ikFflXLnU/bm6ft/JGOSE+VTuif7VVwp
	 3M/2gFWdWqXV/5oskRWVmRSRyWT5z9wG0el2P69Vtn+bA+kIS8gLCZWRfILByoR3V/
	 eq3AX7tUPmhWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5044BCCFA04;
	Wed,  5 Nov 2025 09:46:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/5] Add GPIO interrupt support for Amlogic S6 S7 and S7D
Date: Wed, 05 Nov 2025 17:45:31 +0800
Message-Id: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALscC2kC/x2MMQqAMAwAv1IyG7AFFf2KOGiMmqWtDYhQ+neLc
 MsNdxmUk7DCZDIkfkQl+Cq2MUDX6k9G2auDa11nbduhpJsuiXhGCag96lDZceTNEQ8HEfVQ45j
 4kPcfz0spH7UkiwFoAAAA
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762336003; l=1085;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=sBbijhHOp7oCs6GEaRJPgWgOKT9wxzc+e84cgJVXGks=;
 b=UuVuyQFMIsQ/oSHSwOOpFHXycXVt9jeIo5LDQY86D6wNsX39oK3t12F0Q/VZRCTt4n0bXV7N1
 3mKDqs1TIz1D9OIfcbbLOYnmPLW+O2PRBqPqz+vPmG5fj356OCEol4g
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_014646_342767_20A91714 
X-CRM114-Status: UNSURE (   7.69  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch adds GPIO interrupt support for Amlogic S6 S7 and S7D SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (5):
      dt-bindings: interrupt-controller: Add support for Amlogic S6 S7 and S7D SoCs
      irqchip: Add support for Amlogic S6 S7 and S7D SoCs
      arm64: dts: Add gpio_intc node for Amlogic S6 SoCs
      arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
      arm64: dts: Add gpio_intc node for Amlogic S7D SoCs

 .../interrupt-controller/amlogic,meson-gpio-intc.yaml         |  3 +++
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi                   | 10 ++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi                   | 10 ++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi                  | 10 ++++++++++
 drivers/irqchip/irq-meson-gpio.c                              | 11 +++++++++++
 5 files changed, 44 insertions(+)
---
base-commit: cb718411c4c05a4a424c2b73790a1648be97a4af
change-id: 20251105-irqchip-gpio-s6-s7-s7d-9eb2ce7fccc6

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



