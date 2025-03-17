Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC889C36001
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 14:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWGtW43TgLnA9XLRjmVYZyHmW1immnR6brlslYhRp80=; b=pxTidUGi5FpIZ66yLgyIuYeBkO
	a5FYA5Re2iZYKRrAi1msbXOgoUQrtU8S4HgLzpM6nU698S1JJpurrXlVzx90cl9Y4+nY7NNC/XWTM
	v9qA3ezaBSPu4MIoaoPzpVOwe/9ZtoX4KZRs2YYrZSOoctXyPibTJkCsRrB92a/MoC+xR5CoLm4x5
	etBCzRQ0ysEhscpcS9dkKZNP3IKItLohVwF9hvXk8QRYk7Lo2EKXeOiyJKBnlbikKS0AswAZghYs7
	IofkdU0ORBmVaAazL4S47e+4OJVmV0MAzF6DWjxFJgROotbYIHFID808XqZVVSRkkQoySXDkNYKed
	s4L9qSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuB8k-00000002r49-3hoJ;
	Mon, 17 Mar 2025 14:08:26 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuArW-00000002nzF-1iqL;
	Mon, 17 Mar 2025 13:50:39 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742219427; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H1/BIELGrcSV2RkcjqcFWnyCJynKfr2bfz3LVadEFFE6GN52IQNRH5Rd1BfjwtSx8qhdqdo34FKMN8dOINWKOQvJXd85Sv8AbIjvr+KVWbscoKpFjM4sIiPjz0JX8jH/80h9zwn7OZSpkzB4jy6KGCCR0Tj6oRa4x83c2RYK7c0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742219427; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cWGtW43TgLnA9XLRjmVYZyHmW1immnR6brlslYhRp80=; 
	b=dA7bukRLyuHRswe7QSIqVsrLQbKeMxvuOKrrlI09gn8fBan6iFcBbbH00T3AwP5dGwneRyogt3ThcWStGTAohPyvit/BCOy3ajS1foceBszAQXuvds7l5fq6QhpP7RA/e8oVC3AyOSrb0bYcZKS5nwyf4s5JHlbpaDcucXAw71M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742219427;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=cWGtW43TgLnA9XLRjmVYZyHmW1immnR6brlslYhRp80=;
	b=UjzBxYjQ+WxkrbzyzgoOyUADq5vbSDAMRzCgcoCOVJeeD3cyFvh8UjgB25kqnHZe
	jzte+0ajnSg16286ZAsl4vZlYGOvAB3g7sQEYB5311r97ybRgUfSZvu3mccfM7Zfh4A
	5OlDNHkDmEFIVoQaTYHwgyhs+uF2EyyYL5C/stBo=
Received: by mx.zohomail.com with SMTPS id 1742219425926664.8954147028828;
	Mon, 17 Mar 2025 06:50:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 17 Mar 2025 14:49:27 +0100
Subject: [PATCH v4 2/7] dt-bindings: rockchip-thermal: Add RK3576
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-rk3576-tsadc-upstream-v4-2-c5029ce55d74@collabora.com>
References: <20250317-rk3576-tsadc-upstream-v4-0-c5029ce55d74@collabora.com>
In-Reply-To: <20250317-rk3576-tsadc-upstream-v4-0-c5029ce55d74@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_065038_501385_0A313359 
X-CRM114-Status: UNSURE (   7.53  )
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

Add a new compatible for the thermal sensor device on the RK3576 SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
index b717ea8261ca24ebaf709f410ec6372de1366b8a..49ceed68c92ce5a32ed8d4f39bd88fd052de0e80 100644
--- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
@@ -21,6 +21,7 @@ properties:
       - rockchip,rk3368-tsadc
       - rockchip,rk3399-tsadc
       - rockchip,rk3568-tsadc
+      - rockchip,rk3576-tsadc
       - rockchip,rk3588-tsadc
       - rockchip,rv1108-tsadc
 

-- 
2.48.1


