Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09525E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hspGsLToU+Uxnl8VmeGRxJGohMt1dZP4uSVNRC8jvdo=; b=qG77q6cYoemK9N
	7vLK2jWZMsVrNMu8yOa+sJVz1NhMBwiK74iHEhw961KOhaIjwjolvOE6iffJWezNXwh4XNbU4NLgU
	B/rG/r5fwvAGuDan3j5FJvlXQRRaVOnsxL8sPa8UZLy/zIugnpvxZ6nsopC+jaKYf8piHFiOv0Gl0
	kr/PKsgIV1BZU4tboenNmg9WTjZs8JXFPfojLV+2HQ8WdAsUShBDo8OjEUk4pHnfLHVZApPWDhc66
	YMb90OlaDGm4wz+O3s8reX3Y28F6hh7JJgULWrpeVsb2E76pDiMFIcwRMR3Mx2qru+FdYqidoXsbW
	36mGYQjK31qqbJlO+ChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Nr-0000000CktW-3aBT;
	Tue, 10 Dec 2024 21:03:07 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7KZ-0000000Ck8J-2OYt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 20:59:44 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BAKxWG52725724
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Dec 2024 14:59:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733864372;
	bh=hspGsLToU+Uxnl8VmeGRxJGohMt1dZP4uSVNRC8jvdo=;
	h=From:Subject:Date:To:CC;
	b=glNcMj6USt0Uvzd5esm+Q9ttuqOakcFhgUHZVyLi7orJACym7wQYBYzpZxzOoQe3m
	 cziUIH0wHuy8IhOs0tS37QOCy08MEL9f8D+zweBB+lT/7ynvC5ui+GYpHWDVXZHUQR
	 JVDozdDlKuAzuAfVI6lCapnOlTV8AK2YH4hslOyM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BAKxWjB050702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Dec 2024 14:59:32 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Dec 2024 14:59:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Dec 2024 14:59:31 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BAKxVA9042176;
	Tue, 10 Dec 2024 14:59:31 -0600
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH 0/2] arm64: dts: ti: remove extra GIC redistributor ranges
Date: Tue, 10 Dec 2024 14:59:23 -0600
Message-ID: <20241210-am62-gic-fixup-v1-0-758b4d5b4a0a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKurWGcC/x2MQQqAMAzAvjJ6tuCqDvQr4kFn1R6cY0MRxL9bP
 IaQPJA5CWfozAOJL8lyBAVbGPDbGFZGmZWBSqotlQ7H3RGu4nGR+4xY8cS2JXJEDWgUE6v4h/3
 wvh8qbRX9YAAAAA==
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        Bryan Brattlof
	<bb@ti.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=730; i=bb@ti.com;
 h=from:subject:message-id; bh=EoUmufUTsV1oFLTehCr54a1tAbPnahD3EjcB8ZDVLXQ=;
 b=owNCWmg5MUFZJlNZcz+9lQAAZP///nb75uU+/Q//Ddttc4d70/3/c/2tyfvffZrP//b5tv+wA
 RsbRD1PUAAANAaANDQMmjIaNAADIA0DQYI0AAYg0MQaA0MQD1HqaA09Qfqm2qHQGgMRoAxGgBia
 DQyMIBptEyABoAaNGmhk0HqGh6QA3pQ0BtTQaAZDQA0DoMjyRpkGgaDIxAyaaBoGmmQGCADCAA9
 QBoAGhpoMmgyYRoaMgA2o9INGgsXrg1YO7Bjr7vVgEJghigexkbKgFAmmiOD5Qo+KFGukUXpICU
 tItYCiKhXdiHm97xX2hRuY2r0ZOigSnCtMiHwmDgPVGZudyndKd/mS9ItKa0E7A3rCqcRo+jsG8
 SpCuK/9SxjyGbN2aReuZjxPQxE879It5RbVssR3ZNQIOLw3EqItHvjRqLL3JlwnP4RBHBw418uP
 9gAc7Nw6TKzAWMK7ACw220Ky+NOdb7xL6GNqnnuZeEmFE0ngMGxYXtG4dxjP1fA1WEbyMAbAaE1
 u+AY8hZn5+zRY1FX2TBwbiUZO2IZOyTF/Ddhy3hBJ47yX8Y020faB61kBFlRgapTZzP0PzezQkK
 9PPjZqiLv1CrIRCFIwCGxKfYPnF+u7Nrm4hPQpDdkr7ysDjwNImH6RYaCZBnOcmovk2rIiDw7bO
 CQj8gg/xdyRThQkHM/vZUA=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_125943_759827_2056339D 
X-CRM114-Status: UNSURE (   7.11  )
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

Hello Everyone!

While debugging an unrelated issue Bin noticed we've accidentally 
defined the redistributor range for the GIC-500 two times on the AM62x 
and AM62Ax. 

This simple series removes the extra copy :)

Happy Hacking
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (2):
      arm64: dts: ti: k3-am62: remove duplicate GICR reg
      arm64: dts: ti: k3-am62a: remove duplicate GICR reg

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi  | 1 -
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 1 -
 2 files changed, 2 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241206-am62-gic-fixup-3ebe19226225

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


