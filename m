Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7C5D1CDAE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 23:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ag2rUPpvKCJnvoHqo1L2RywGMQt0q/Ufo8NO+0utJLk=; b=xKSzuCQ+i3f+qm
	uDCbLeo+v6wshblBpO6ueW40FjKY7nsPFBsX2WqYkwjhfKrMSCjFqGLZmuWz4Z4LAKEbQFZYiM1pX
	slwqztP0KJMFt/+Q64emWbjkeG1Z0zZfvUOeDsd7NoK7zp31TGT+cQ4ODqf78X8XvLhIaKVTsWPfz
	a8xHW78GP29qw7g0M/I4P5NrbVrXkd8XhUyd8c1UgTzWkdc+oZH4jUPgE4oHKqDm5dxECgG08y9FF
	KjBfaoAQnXpMNSbqU4VUp015CWr2Blt48wGce/uzM0K8gf8PPn0jZTVeeQB7oI/TtUIzmlFtMBuqm
	YlLK0rmQeD4HPojVH9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQwgx-00000007GoQ-22XP;
	Wed, 03 Dec 2025 23:55:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQwgu-00000007GnJ-0Rz7;
	Wed, 03 Dec 2025 23:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764806119;
	bh=eeiK8qF5KoQK7iU0+trZ+GhePwhJdWmwzsZ69/GKdVw=;
	h=From:Subject:Date:To:Cc:From;
	b=gygoWo9+tjne34mYaJ6ORr/oOBf1h1aN15bO+8+yJpQ2OF21tnQ8aa8MOp6hbgcQe
	 ZuUzSbek8QaM/EwpC9S1xuvyJkPexKEKCoMBr6q5PR7XzWwI4OsTfFPqOmIPCF+iYN
	 bmlLkt3KfKGp7pUrbqqGvwyzIoFpZwVQ4EgFLBXZraQ7LQzEzdtw5xQx3eoZGhxw6a
	 A3aufIKwc8c1ci8x+MsluCqNvRzErepOhTFs7KKVxnfnx6cQZiWckYoZFjR5U60a0A
	 BA/fdyVGajuLfse5lspqdVKaegxOnqRL6yeAA/GChsvI4is/9cgQ1VY8DtBKveZqkg
	 /00/GWFKx+QCg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 85EF117E0610;
	Thu,  4 Dec 2025 00:55:19 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/2] Fixup HDMI PLL for phy-rockchip-samsung-hdptx
Date: Thu, 04 Dec 2025 01:54:08 +0200
Message-Id: <20251204-phy-hdptx-pll-fix-v1-0-d94fd6cfd59b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKDNMGkC/x2MQQqAIBAAvxJ7bsGksPpKdAhdc0FMNKKQ/p50n
 IGZApkSU4a5KZDo4sxHqNC1DWi3hZ2QTWWQQg6dFD1G96Az8bwxeo+WbxRqVHqSJLQlqF1MVPX
 /XNb3/QDi1h+oYwAAAA==
X-Change-ID: 20251204-phy-hdptx-pll-fix-0787c92e0cfe
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_155524_328306_629BF613 
X-CRM114-Status: UNSURE (   6.44  )
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

The Samsung HDMI/eDP TX PHY is currently not able to provide an accurate
enough PLL output frequency to match the TMDS rate of a 1080p@120Hz
display mode, when used with 10 bpc RGB.

This patch set adds a new entry to the TMDS configuration table,
providing the necessary frequency division coefficients for the PHY PLL
to generate the expected 461.101250 MHz output.

Additionally, it drops a bunch of unused members from struct
ropll_config and makes the configuration table more readable.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (2):
      phy: rockchip: samsung-hdptx: Pre-compute HDMI PLL config for 461.10125 MHz output
      phy: rockchip: samsung-hdptx: Cleanup TMDS PLL config table

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 79 +++++++----------------
 1 file changed, 24 insertions(+), 55 deletions(-)
---
base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
change-id: 20251204-phy-hdptx-pll-fix-0787c92e0cfe


