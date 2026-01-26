Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D96D19508
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HWoXO4DFMiJC1qX1pYWYEkKbDgGjoCzea1jzdb4+Xs=; b=BOtb98w1Xz7Z/mcEGLeu+/Ys34
	ucgR6Iy8h5ngsg9wgUl3bAZeSEQznHtNmFPFqraqCssuCKk2Y7f5GZ1WQkpMeJkt/RMt9IwfgBmZc
	8PE2t3belCSspWRRri7ZphBC1BArmbfOqpvGVCvS9/c2xmVpQemhhzGt8urecvNwIFnElDmwqjL05
	swpmf1xINTAv+D6lAsNqGKxmxUbOnmB45W4kg5y4dBC1/xEmz1eYag16pKRh+HBJKTLiPForZFZkN
	2IfRitBlzInbNqvHpu47FUyuOC0p9nzOQXKjXZyQq/FPNilN1Zy+ONIMaxYjFMRPwEgfGDzAfdWqk
	omxrf0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ4d-0000000CvFv-1Wkt;
	Mon, 26 Jan 2026 17:08:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ4c-0000000CvEo-0YJL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:08:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 940126013D;
	Mon, 26 Jan 2026 17:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 320F3C116C6;
	Mon, 26 Jan 2026 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769447301;
	bh=2f258ZKMGjMDX6rVeyYTKnl8hXsCenCR77UWDe3H8b8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CAXvlt5nIri4w61xbzMTvJtIsULNx3SiGa06J6N4nlnUzCwNYdbcSBbatcd5vrgD1
	 RAdGSlWOY3EPc2sI1bTAw+UnC20h6U8S+vaSiGTjDaUnIY6AIkAMgtXl+uxEi6scEY
	 ztArCqDe+qQrxeoJHGSzVH1QSyULZ8s98NyfYRoQx9JXnaHepNbFDxi0tfZDM0rFDl
	 0yFZUnfwj/NjTzVv4eNsoAWUrwAXBlqyOGzeY4OQj/ZC0BSowHgqcCx7waKDQfxE7n
	 kqEbJIBCPtdTWcwYVIVU5SeKNVxAi8RJKhaYTJlWeHkk7fMJXA8osE7FHdMCC5bvQS
	 +c5dH5uJmhESA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20368D19503;
	Mon, 26 Jan 2026 17:08:21 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 26 Jan 2026 17:08:16 +0000
Subject: [PATCH v5 1/6] dt-bindings: i2c: xiic: make clocks optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-i2c-xiic-v5-1-88a16a28721c@nexthop.ai>
References: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
In-Reply-To: <20260126-i2c-xiic-v5-0-88a16a28721c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, info@mocean-labs.com
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769447300; l=759;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=Jp8L32rGkddXyWP1kCRtOWV6Txgpa0+B9TbjL9V4o78=;
 b=u6lMnREI4xoLQT48ikHXfh1CX+SaIP94RfXSOXgGbgcPNt2mLRPhh8b4Swa6nuKYUYgIQcLhI
 spVSC5M2KWRBYyWHhxwbnmMEd81osgmhVWla1QhhLaVWKApEQpujUva
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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

The xiic driver is designed to operate without explicit clock configuration
when clocks are not specified in the firmware.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
index 658ae92fa86d..cc500130f41f 100644
--- a/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
+++ b/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml
@@ -43,7 +43,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - clocks
 
 unevaluatedProperties: false
 

-- 
2.52.0



