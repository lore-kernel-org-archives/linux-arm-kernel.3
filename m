Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFE0EEA86E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 00:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vD9vC9efy6fVsWH0S9qJBTI9NRasscGx2oPuT8H5PF0=; b=BtN/0DGBBPeNR33+G6YfLNRMSs
	Hy0t+o5LLZF1SPLH0MPG2Ux3zZwEqq7VO+pZLDmB6sKYb+q1zUQy23wxFKwNB7CAPonSCxZYvo7UU
	a+LZuzP1ebH1qagICRd4ujztgjvtrA72CWXu3rOAPNTP6qAvDNPHflESWHw11x4Pso6GIEppySnyG
	nz+bfodEm1OA/yagl+KNsG4TQtWwaTYLFAdJ5QaOS5x/ySrHKFYA5c37JOh8kLJ1lS9DNMnYrtBLg
	h+IbcJflAjhqq+JcDT8o7EMWVMU7fNVewNDFfcr7n0ogCy/UWesDa+AfaUED8PjE9VC8dob/hT6yC
	yon5+j/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqD-00000002lZl-2llV;
	Fri, 13 Feb 2026 00:15:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqgqB-00000002lXF-2egU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 00:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5DE4446AF;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96067C19422;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770941722;
	bh=jRtEYRL116cS46+BRRnEAwVlx/TCGH4biEvlH/E3jhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R79jZ199R60NrZW/zFkZAmS7hgm1H/VaM9Uqy8kJVfgCVWeLjKDVUJjSgZUbCYqjE
	 BYl6jMcqQ3n00NWP3Ni8h2NIiHOi1iTRUfU5lKz79xfnd4UfscsHZTnYlDszY23pdQ
	 6+yHN/x+5OeQJSsTrhOETHYpz+chEnf9E7h4ak0fk3bM7wRcqGGHIH72BfIUPPzyqC
	 PrXQbQQTZT22gMM+c7C5bcB57c0GpuA8KnDDpgDTjMCHTGfo3aRT8XOisuXpzVFXUU
	 YjuISzPLa/If29oyOO9DPBmgW//YN1ear6bevVRVXJZyi4jNOiwQj7DiTfkD+Z9aQo
	 yJxs3rSnaYjeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABF1EEA853;
	Fri, 13 Feb 2026 00:15:22 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 13 Feb 2026 00:15:17 +0000
Subject: [PATCH v11 2/7] i2c: xiic: remove duplicate error message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-i2c-xiic-v11-2-5d18aea11bde@nexthop.ai>
References: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
In-Reply-To: <20260213-i2c-xiic-v11-0-5d18aea11bde@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, Andrew Lunn <andrew@lunn.ch>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770941721; l=1019;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=RRuL/bQeZiBpUR1djYETZjT+qDSOpjJwtLxb+GfrByQ=;
 b=tQZ8gIzWOuUdSWIA2TzaWKq9q69SdwtT0IEDY3cSzazRtZNGQE5W0tD8wE+gG42Jcc1okv+2z
 f9xApkRqye+BeZjV3kayfunZwOXR8d9hnDM1aZc+oWIOaKD36ktZbJ5
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_161523_700706_26C0A840 
X-CRM114-Status: UNSURE (   9.45  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

The devm_request_threaded_irq() already prints an error message. Remove
the duplicate.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 65aa280f6fd9..99286af2a0d7 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1491,11 +1491,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					xiic_process, IRQF_ONESHOT,
 					pdev->name, i2c);
-
-	if (ret < 0) {
-		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	i2c->singlemaster =
 		of_property_read_bool(pdev->dev.of_node, "single-master");

-- 
2.52.0



