Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC0CC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wxIJbdtHu5EFzZttDmDXTiKHDXuSlZ7X22WCTLQoMi0=; b=M1IBR9u6k1zcrVKDVsMg6PrEVC
	4mBQwEKvCPAOSDty/huwTPAMcOdhD2sHkE8uPN5HF7TXgpxWxfUAvwxc4+vXtSoQeMjLekVSMq2Wu
	xnwUk2kVLpf9tkPLhiVGmwbXM9fT7zcihMMSIcwzRfyKtNHLQAr3UCd4+RcuGvNrLVA233qJ5vKB2
	TQU0d08K+u2rqTrF7IuLk/C1ewck9CiBT7/CAscXmlpj5DV/83k/DoseY2TZFuyDCmV4I3lB2VNm5
	9o6fvn6liBAhrXHV+0VuIwG+tCbGc33w2nn5sWBGGqNmvDoy+4RPEX6TbqdYpSsU2lwc+ho0GoerH
	VvyJflkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKzL-0000000CpiZ-3sEd;
	Fri, 21 Aug 2026 08:52:35 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxKzI-0000000Cpha-38Aw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 08:52:34 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso1527820a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787302350; x=1787907150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxIJbdtHu5EFzZttDmDXTiKHDXuSlZ7X22WCTLQoMi0=;
        b=lI8pO0xUdJaaNrVR6pts/EvbIufPOKS7Yj9vLMGtkl3SJZx+MzRG2VRIlIN5bWToOB
         6MOfeFV+ojnOA1meFDh18U3M6BuW41WC+n3YGE/C9C/b5b/nB4ziJzuFxUlJOhftu9X8
         JWl42NvRisxUx97BGnPw0lze9FLEg3CA98NyKpKLPbBG6Jc/x6lHJRZdDJI5VkHENAo7
         iol5HnXigsEBN6lWWHGyR3p57NUi6JNSZb3SUMhAWJCQ0YANxQUMfAHLQb7WAbmvoS0Z
         0bf8wQr4WdBphHfIXZIVU525Vee7FoH2R8F82P4WUDff4H7p5oIJrnoP/fPErXjUAmeg
         Jj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787302350; x=1787907150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxIJbdtHu5EFzZttDmDXTiKHDXuSlZ7X22WCTLQoMi0=;
        b=rXM5AKjBUZYkuF2pUo3w1JMsb+gnu4DwkG0uDk4AlRw7pwQ0SLA6u2GjRxumuGFU3k
         jCYDKtExnaqWCjfGm3el76IEO8PTZwEUCdalJedewslRewCsEuJKw4pvNqNPTNFpYqt5
         k9mbMUR+BU6fznDKMs2fuoV0XaCZ2tdjIm/oMWxF+DdB67PpxrQJgwDgvf3EarEGRt3R
         8aYIpBLEeJ9eYLpbZ4qKK3vIGQdbe7m8QbBMZ+eIOeboX2kapxfuwhSv7k3mgjwi2MfX
         kwjzwGqEuijopIa+uyGalN6QbnWhvQKSO/jj9MJxxDp9My2LBOue2E1HPQ2a7hnVh3ih
         dhAw==
X-Forwarded-Encrypted: i=1; AHgh+RrVWKBUXxDjW1enrFx5g6Dy7KywrqyWQh5SLqW8fhoYXDSgkNQz7vvMvI4yGdeqCt4x7HxXJNxI75Ag9/kt6vNZ@lists.infradead.org
X-Gm-Message-State: AFuF++kMQOMCX9LbHbjf/kjupNk2ccJFn7IaAa70ISOK2UwGJfzIkKN7
	XSholQV0UQfINn3Ni8MvQ/xZvI6CqThVxX7olqv5HhFejPkNwvZgvI6q
X-Gm-Gg: AR+sD10G3BukqsOq2Syo30gqJYKn5mcXPj0puNFFr8cSRMq3yXu67eEnNLkdpevl9Zx
	wo6IaMqRlGv/fq0/IV0u7stcr3ez2VKgd2Puk3y2J95SFLqWasLE3P2Y6QhRM6U7Rqh0vt5LaQV
	vkjvqOlq3sSre8WaXXpdrtI8wFUc5c7kerWvCCihWkgVLXt2CXw6yPcBVgT3NVAV7ZCmyo7NC02
	8FIw8esbkXWE17Gq0m05vyNYeLltZR0j9jPzVC+Us+9X3hH83XpjdkcBSsNbVdqlVsQs151ep00
	8oaRw9x+2R+7TewJ8Os7780318lNxeKVvcOYtkfXd2qPPOSQWEthCkNk2OIvJ2ZOPSHmU+1jKCO
	bWsJX1zAiFuqw+raVnJB7ao+eD+WYUxQa0Q4pez4DTLp1zXQrc7H/afQ5Mxwkb0wv7n2i1muJFa
	Gp5vUrTCAtiFsb4+1p+p6XjJCbhhwT+PNtW12TpFS7xfEDUsKvRGVPz00FBYbTKMZPszF8+uvFu
	3DkBA==
X-Received: by 2002:a17:907:94d2:b0:c19:473b:dc8f with SMTP id a640c23a62f3a-c246a2eb99amr471049166b.3.1787302349629;
        Fri, 21 Aug 2026 01:52:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain ([95.236.20.157])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2458b096d9sm422551466b.20.2026.08.21.01.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:52:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN kconfig
Date: Fri, 21 Aug 2026 10:52:15 +0200
Message-ID: <20260821085222.140633-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_015232_788847_220A760A 
X-CRM114-Status: GOOD (  12.40  )
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

The AIROHA_CPU_PM_DOMAIN config was wrongly guarded under the Mediatek PM
Domains menu and was unselectable.

Move it outside the menu so it's now visible and correctly selectable by
default on Airoha SoC.

Cc: stable@vger.kernel.org
Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pmdomain/mediatek/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
index 8923e6516441..a2eb704a773c 100644
--- a/drivers/pmdomain/mediatek/Kconfig
+++ b/drivers/pmdomain/mediatek/Kconfig
@@ -43,9 +43,12 @@ config MTK_MFG_PM_DOMAIN
 	  This driver is required for the Mali GPU to work at all on MT8196 and
 	  MT6991.
 
+endmenu
+
 config AIROHA_CPU_PM_DOMAIN
 	tristate "Airoha CPU power domain"
 	default ARCH_AIROHA
+	depends on ARCH_AIROHA || COMPILE_TEST
 	depends on HAVE_ARM_SMCCC
 	depends on PM
 	select PM_GENERIC_DOMAINS
@@ -54,5 +57,3 @@ config AIROHA_CPU_PM_DOMAIN
 
 	  CPU frequency and power is controlled by ATF with SMC command to
 	  set performance states.
-
-endmenu
-- 
2.53.0


