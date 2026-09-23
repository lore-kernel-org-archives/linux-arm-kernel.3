Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8DAC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 07:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PpX3gg6N0BsF0r0MQcVDqY/CQ/Lp5hjUE/d4NLqMQpk=; b=j2ssSuki4ikHSOkSUrW7pZ5FqG
	Tpi/B/XNF1KsXcz/y7XkWCqgGdkAwsB7IZnrd+x5yIjBv95W2VvedOXbk4CtrCDoLB7T3iKHDdL2C
	/9+RpZktOQXYaWxhuoBxOgsQo6pcI0IKo4YF6uy/S16c653BNO5qsjQcfNrRy0bt2wLdC8OeI6I05
	gO8OZh1lHgUfZD0k2l222OoVpPz8tRAlfdeJ3qz791XwG/+VY2cN6u7i+FRTn9v0b1vXAcvhJJUCx
	B0daZQ+Wcwt+4UIZ73QYWfMoQcVDBdF0rgw5vNopM5JasRYvCh/CUKHzY2ilqgqB6/Db/67WKY4Hy
	4OVgo54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HKn-00000007Oh1-1Pva;
	Wed, 23 Sep 2026 07:24:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HKl-00000007Og2-3LtA;
	Wed, 23 Sep 2026 07:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E3C2F600AA;
	Wed, 23 Sep 2026 07:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D6A4C2BCF5;
	Wed, 23 Sep 2026 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790148242;
	bh=UaqCiK5kR6zZ6YSdOk5LLGKaESwbOwE2p1co/yqpIaE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=vOxOWS4Op4dP16N4DFqIb8Evw5IBqQI4ghR/VezbaCftw1yeYZ5j9MI+ruhTAUvGg
	 9xWYZC4tSCAAjtW+cpS+m8OpRLT6p8w+TxGyjAawUwFPoxQC8dFsVHWjNE1GxpWFrs
	 fASoCXMwdmeQ7b/wxLvuSGthZw6OeB1zrf3HEhh1xIFFQXfiwpOiZPJWoKXGnKSMRy
	 h7Svh8JqT6QYwbzS1Ulo2zyEI/LXP8yCDyj+fAUIBHQFi4fTUTzovv1eFyCTFR4SP3
	 VHNXJhqri9Vvb9LG+qZfVtKWSAT4+QDP21C32j/O4n+jlwhvkp3CcqwNTBBsCtmqYu
	 Jx1DzekchIBuw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651D2C98302;
	Wed, 23 Sep 2026 07:24:02 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Subject: [PATCH 0/3] cpufreq: mediatek: add mt6572 support
Date: Wed, 23 Sep 2026 10:23:33 +0300
Message-Id: <20260923-6572-cpufreq-v1-0-41f7af6d6d1a@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw5AMBRA0a3IG2vSltZnK2JAvfIMfFpEIvauG
 J7BvRd4dIQeyugChwd5mqcAEUdghmbqkVEXDJJLzQuZMK0yycyyW4crU0KnSuQCdZJCSBaHls5
 vV9W//d6OaLb3Aff9AMBW/VNwAAAA
X-Change-ID: 20260923-6572-cpufreq-51645181e634
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790148240; l=937;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=UaqCiK5kR6zZ6YSdOk5LLGKaESwbOwE2p1co/yqpIaE=;
 b=Y9b3/MY3HkYmoYQloksip6ASc6JC/N8OjZn4qOGxEpd4xxnuaWshSYvG/SkvwRLC5uT+mWD+Z
 y5eumooGZ3FB7/lzch7c5LOl70VYE8jcnxejl0/AHVGdMaA46Vdc7Nh
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds support for mt6572 SoC frequency scaling.

Since there are (at least) 3 variants of this SoC, first patch adds
support for CPU speedbin. This is also useful for mt67xx family, which
has a lot of SoCs where the only difference is CPU/GPU clock.

Tested on both mt6572m (1 GHz limit) and mt6572w (1.4 GHz).

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
Roman Vivchar (3):
      cpufreq: mediatek: add support for CPU speedbin
      cpufreq: mediatek: add mt6572 support
      cpufreq: dt-platdev: block the driver from probing on MediaTek mt6572

 drivers/cpufreq/cpufreq-dt-platdev.c |  1 +
 drivers/cpufreq/mediatek-cpufreq.c   | 59 ++++++++++++++++++++++++++++++++++--
 2 files changed, 58 insertions(+), 2 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260923-6572-cpufreq-51645181e634

Best regards,
--  
Roman Vivchar <rva333@protonmail.com>



