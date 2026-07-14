Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA4FC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGEBxSja9QK9v749iu4BHEOzirdhrkQ+xdtjQ0ijsW8=; b=iK48s3bxBaObSvbzVxVh3pE+l/
	QD5kq3ETxsNiTj/a6/7E6IlEU+H+QXTwRjZMeo7c365h991m+5YB7Ggzacg2k2XvJS30gZGP7i2X1
	OtnD8mrCrfwvR5zxxTiWpNne1f5U0gEhVxQiq1+TB5qmBugustah6hzdez37u9X6+90aCm/RuDF1+
	en8+MYXoNnWfIiJASgWv6aCv5GGrEkA92V/tq+wKZ94q6uFSMEQ/gLzdpo9tpmKtHcKjz3Gq/YKss
	c+U1u5/yi4XZnC4W7FORZzlBshv0cedIku6AcoGfNAbPbCdBOQ+0JVq8HOJ9BzibQzsB2cUeDwvr1
	/X2UduEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiak-0000000D0oq-0efF;
	Tue, 14 Jul 2026 19:14:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiai-0000000D0lD-09cK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 19:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kGEBxSja9QK9v749iu4BHEOzirdhrkQ+xdtjQ0ijsW8=; b=HuAxFwhNsCsVLWueqnB4MtUHTn
	HxhM8N4XaVt75VNSPVj8Q1mAttjWqT1XUxt7v/VH3FLxelGr3y8y5Izeh4d+Qr6KNk90gzTUiRWdF
	JYjLrQIaQJLIbTTUolfp2MpE+zn+oNMekJtf/6ph6tHpZTj8qtrJBSit47B45YJCwrV3qeavrUrwQ
	EBitj/+TimxQ2HmZqs+SkLzlXNNfKqq0fqmRbHJmvkSRFGQqwJkhA9LjBwVnwBAEYkFfw6awGnRRU
	dv+6U3j2uIhxy8MSaIhC3SQo0/b4OMBvLawrTISZZMQvaPEJryLeYWhrgnlHofFhGFNR74/k8g8gR
	Dah9a3gQ==;
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjiac-0000000CnfN-43zg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:14:50 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2cb3f5bb19aso3971745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784056485; x=1784661285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGEBxSja9QK9v749iu4BHEOzirdhrkQ+xdtjQ0ijsW8=;
        b=k95Ax1h/DMv71Izi/3v4xWsHJetNRSY7QPvPlwo/MKMUSmbbzZYNgzC1XVMJ4/61Va
         FJuFg85cLxZfahfQ/WNU+Ym3gU79hLI4+jh/rc4F2X20ooXTxyZzMe7Gvx8pV33Aj7oA
         G2yoDNh9NI1TVhL8TIEpW29swC8mzhBj01M9u6kYIjmfq538vCT18JGR6x69ZFmAzgAJ
         VTtJBiWZibfCR12ISXL99YyVmI/VBuPGY+Zvd51mMfQS/LZHlSSehOKipUl5XLfa0e0P
         SkSB+RrWba399lSpsQ4A2lB+0voOZ5YUA8btUgBZhz5kg+Crgu+KmdqRC/PCtwp2dwLq
         DErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784056485; x=1784661285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGEBxSja9QK9v749iu4BHEOzirdhrkQ+xdtjQ0ijsW8=;
        b=ZMh2/dto/CmEYevbNyER/9s2hrUbnJNgOwBLykM5qXJMDxl5M7JvQoWeNaw5ifPztn
         j/1Uu/mw7GwLWHaKd44W+SDwqDO5M34Et+u3r8wxB/qWM5slLBOr2cQ/yirDy9kHgFwg
         HLFEHHVDpTVIJB3yCiwr4PvzU9SnHempYTIffc4ifbZAwsXFT8loqUAjADMB2QA9ajIP
         iLrtPRBhOH/ZP8F6BGDGz1OgZMffIFb11yDyrgedDICTdAHg9UEGHcbV4DnXWQmljsyd
         oBgPr4oFrxj1kCDloOn+GdxPiPGH4CvCzWQmDvpyy9NcHL30NPr4XMOJg05zTy+SEUdy
         BH9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqgnEhRESMEVzAXR6JkOmYTf9hJQcXBO+xTN4sn26DXBz9MteTtWk4H4ad2pWs3s7zCVWKaky+uyWGRJ/uVoCyq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7tHGZjqHwL0KgzcNbw5cYeTTic4YEgfUrZFLe6lO+y0xv5u6q
	F0W5xbodJ+1JDBl/n1Yg9q7dXdS9sN0scFJxFXdCw7UTABWn7bo39O9H
X-Gm-Gg: AfdE7ckcnF26zVwd/vbA3GqxLO1Sd1dB07Q/1CJM/YKD3i+n6HGJ1Tq2k9f2jPf2Tnb
	2LMmVc96MdiYKUGtR9KjJRsEgcVUx7EEMjMSbsN6ph+IXJWOUTRb/7xcWR/mN+pPoyp/8u7cLHP
	0P+X0EC6EE1hRRSG3V8oow9KejK8rpin2UqrhddITAnOUS0sZhh9H/MRHJKx8jryK5WOlmoBIRN
	U5QLwn6fqUZReh+WnphX9IbGo4qoP9XBckWf4dP2OcclDsL5Prkw5VeRneDOfTUms+S7YtTzII6
	ZuD+UuzAKbGHXnpsK7eHWv4W7a5WzOR+0+LNxAhK3TKXkOtlgpZaAc8oEuQtZBOK5y88oCiq8FK
	v6NTJtt+g+xLDjCyAib7xBBrdWFJd3Q0AguPmZuTqXIjJTSQgA2lyrpnXw8qvHEGH5vVvzTXEWV
	lIUAdb5UJwHt4=
X-Received: by 2002:a17:903:15c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2ce9e99be82mr146416405ad.13.1784056484883;
        Tue, 14 Jul 2026 12:14:44 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d451sm120763245ad.65.2026.07.14.12.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:14:43 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	heiko@sntech.de
Cc: netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [RFC PATCH 10/10] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Wed, 15 Jul 2026 03:08:38 +0800
Message-ID: <20260714191341.690906-11-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714191341.690906-1-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_201447_240640_BA6FF59B 
X-CRM114-Status: GOOD (  10.48  )
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

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 806bd2d80d153..8cba6a0a2dd03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23463,6 +23463,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip-dwxpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3


