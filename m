Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F25E9A04E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xp6NT0DBPlQZavb5HOX3AnM891/YuQXLWauhDrKKecs=; b=4vhAL3zQKvWHsQtk13PfOywMU/
	/LdOHWRaK7r1xc8gzx74pl1KI4aEPd4B2/ElSDsCkzj9YAW1ZNfIYSxNQRBX3StxgTc5JKf0vQ8sa
	0Lvg4SIz8C8W+NS3uLVgm1IIYCIiHdGXz/oKimn5nox3W0Z+GIMjcE5qXsdLakFQHSoIE0Ka9hxqq
	Khf+Q8w1ecYnNa3INi1Ph04f3OjAor9BL8TQWrwbLKQ1SOYHcuSwQPHD29m5/lDoQjJx3rYBEGUki
	q6yiWRTDDOz4ia+RO4z+HZNrRHIAO1yWJMZQaxpR8blMGvrO8onphtfKHbvDpXUUGKG8SA7OuA7lc
	r1+/Jbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshWr-00000009r1g-0qtL;
	Wed, 18 Feb 2026 13:23:45 +0000
Received: from mx-relay154-hz1.antispameurope.com ([94.100.133.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshWm-00000009qzm-0Y7q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:23:44 +0000
ARC-Authentication-Results: i=1; mx-gate154-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Xp6NT0DBPlQZavb5HOX3AnM891/YuQXLWauhDrKKecs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771421008;
 b=R5Gn6H86//q/CT+VXvUF9zW5oQmn9b1D88t+iUFFNc5J9GY3ltP/BnKnok0hN7QXLLtKu80x
 IEyyT5obJ5RBBsT0OmFY3kJRl8xNi0HcYXvPJVfKsH2KvppII3hpxTYVSiutXSQ6MSPVlXX/bZ/
 jFoW+XVK70+pEL5BkEfguTNpaaHRxunrWirG/qxOWFO4SX0eVBG4cPgoqcJSe4MbzMIGuMb23zi
 BFpdaDKt6acmSjNApZb8fh6vFJ3LvCZHxObFwwp5tLvq77qjgK2o9UJ9RkPxpoIQZLTdk7LYhXL
 0fwVgFqOlHBBlGMPSX9jTDrOXRiYMwVeYTrErEvxPuJPw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771421008;
 b=GMjSKTaIn9QqitzsT+q5bJPYF1fmi/MHj6FwOs5zW5K2hwupQq2SYq8twveSadkSvKLRYTnP
 YIHm+42I7wt3EGB+sri4+T5LxWstRcvhy2r2HICIKQl9FDQ9A2UaT4jXF4bfXI1xZGSA0RBO9zD
 fR7oTen6vcQhxjgyiZggYndbct6Izi5/Mz4HWXaB99yHUjMR6eA1jlhl/BpDw3RixJXaPsJqkY4
 ljafFIJFhdcHCDJ1KPf/pOa4gm4jkQ9V78e4MdcsGYnY7JaCgObK3QRjm/C7EsJUjwl3oFyWBmK
 jfKheVk67WgDvPO5X/I8XyIjAsEQQCiaBDJcj99HXyuTg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay154-hz1.antispameurope.com;
 Wed, 18 Feb 2026 14:23:27 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1A25FCC0CB7;
	Wed, 18 Feb 2026 14:23:11 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ARM: dts: TQMa6: modify for use in bootloaders
Date: Wed, 18 Feb 2026 14:22:21 +0100
Message-ID: <20260218132228.32056-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay154-hz1.antispameurope.com with 4fGHJH68KVz3K5Dn
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: c9bad0062c84e180e2c681c5257030e8
X-cloud-security: scantime:2.185
DKIM-Signature: a=rsa-sha256;
 bh=Xp6NT0DBPlQZavb5HOX3AnM891/YuQXLWauhDrKKecs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771421007; v=1;
 b=Qs2vIzZT4KWh7APxoAb8paeSDd2/AF7TsdUiV/RRLjW1WkBcLbO7gu+yGlJLFkflfzPVPYwv
 DEZquIIO1D/czCmRGGPs4mas6z4pL71cAFVmK0ONYgn4Idyu/iKbOI7F7LWkESqe3ucGtlDlnVZ
 VnJf2CZSdjpM2vv5vM55eZOyLCqwWBSVw9AYofbkyR3eP9MMg91dzMWojD9QlTnlUvsBGkDaMVf
 2XmyC0vqp/NxBsMJ/bTUTtWGIRRebr9T5cx6OGaYDGwgzuiQ5Itcu3Cxq0fIxEa/ikFHFj7+9YY
 UbSltXeXzcBRq1FyQQ4N3afvw00EnhM82IvTQud/atyKQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_052340_425943_42F3B361 
X-CRM114-Status: UNSURE (   9.69  )
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

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.

Max Merchel (4):
  ARM: dts: imx6qdl-tqma6: add missing labels
  ARM: dts: imx6qdl: add boot phase properties
  ARM: dts: imx6qdl-tqma6: add boot phase properties
  ARM: dts: imx6qdl-mba6: add boot phase properties

 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi   | 12 ++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 11 +++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  5 +++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  6 ++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        |  6 ++++++
 5 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.43.0


