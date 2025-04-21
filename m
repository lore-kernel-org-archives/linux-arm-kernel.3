Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3486C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmUy8K7lHHVbUfFIPuRMd++i3wEKd+SOUMQ/CPC0TvQ=; b=yEbVGhpXFOmZ7EyFQIoHR2HVvG
	Y45YYQ+pZshLNegZPHuZOlYQrZ1e00MImxDav5EYR55qXsdMX6lC0L8SgUuuWHxXCgRFFitXGGy2j
	LdFr3iR2f1haZO4w8+FjA8FlbD3RM78sbirT+gzFReT0Pr6CLHQSFyYs/n7ToUiiAGSF34JL/xWjP
	s9v76lRGntDXs9TYzMsiEvuxn334lOr7qvPSsJECqRcecTBrm6J/UMwTCQGS9zhq3Im2PtuJ34Zpk
	0LFmf2To27yZ7wuCTJeWJFSR7OM6c7RJBPmOfVc8W4vDNWmBhbM3gNd4tQTi8UN4e+yEeIrCaYTmg
	FvYk6oNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6viB-00000004tpP-1aL5;
	Mon, 21 Apr 2025 18:17:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6veU-00000004tH5-0MaW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 18:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 889B1A4BD6E;
	Mon, 21 Apr 2025 18:08:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4898FC4CEEB;
	Mon, 21 Apr 2025 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745259232;
	bh=qLNiRYeO1WrYRKo8XFM+0fZQHMTw04xZoCDiG8GmDBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sXZN4It5CoVbu+OFug+hdtrBYsJ3ABLNezPEEECPrirns47aHT24loReSHa+2qYrH
	 2wYs5ydRVKPrfJFumbGF6xY69LWwSx9iUWQPm58NtUJspZENj62juJd+dNjonpm763
	 OSTloKFD0dzg+y+EnsfcV1CESgcW4/JmuNBex+5Zz+IQzNUTh8a5VuqbLmq+c+y+T7
	 E//xOICSGvlO4FqZhVuVD2F6IRxYsqh77QA8BcWcfU25cW1/2daJTXDvSXzbsSZbkk
	 kvCfCoCchtTrVjk0RB4uZRKYVotFgS9rhxOjPDM21UJR2l+vYA2sUMhxCVD5hY429z
	 F0iJlc0i4zdow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BECDC369D3;
	Mon, 21 Apr 2025 18:13:52 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Mon, 21 Apr 2025 20:13:32 +0200
Subject: [PATCH v3 1/5] power: supply: correct capacity computation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250421-b4-gs101_max77759_fg-v3-1-50cd8caf9017@uclouvain.be>
References: <20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be>
In-Reply-To: <20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be>
To: Rob Herring <robh@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745259219; l=1114;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=f0NuHuCRsvILdEaz0eCkw58+qM2h+TcqXwhJ2/+YcfI=;
 b=2QR0PUOyqJGIF5HEIdjTYZyFYYeQnngQYuyDt+nv/btdJkhzALfgAMD1J0icELmwKr0JiNUky
 0R5GJtFjQUqBeNnjC0fKbxcnRbsF0CXgPli970QT//VV9COBsfu71j7
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_111354_192568_800EF8E1 
X-CRM114-Status: GOOD (  12.09  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

From the datasheet of the MAX17201/17205, the LSB should be
"5.0μVh/RSENSE". The current computation sets it at 0.5mAh=5.0μVh/10mOhm
which does not take into account the value of rsense which can be
different from 10mOhm.

Change the computation to fit the specs.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 drivers/power/supply/max1720x_battery.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/max1720x_battery.c b/drivers/power/supply/max1720x_battery.c
index ea3912fd1de8bfd0d029c16f276316d06e1b105c..cca5f8b5071fb731f9b60420239ea03d46cb1bf3 100644
--- a/drivers/power/supply/max1720x_battery.c
+++ b/drivers/power/supply/max1720x_battery.c
@@ -288,9 +288,10 @@ static int max172xx_voltage_to_ps(unsigned int reg)
 	return reg * 1250;	/* in uV */
 }
 
-static int max172xx_capacity_to_ps(unsigned int reg)
+static int max172xx_capacity_to_ps(unsigned int reg,
+				   struct max1720x_device_info *info)
 {
-	return reg * 500;	/* in uAh */
+	return reg * (500000 / info->rsense);	/* in uAh */
 }
 
 /*

-- 
2.49.0



