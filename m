Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F2ECA9EC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 08:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dr49tUUlFxPFnEicxFg6BKjDZLTyIOa8zv4bTCe4eu4=; b=cbLhV6RMRBNHi9xPt+OzDWEHpb
	QxnvRgsbIROIdkFvCzYf2EmT9ggHMH0oSXtqYW8/T1fn+l8vFGgHyvnaU68NlmpzjX2TPn4bDV56Q
	eDotXNsXiPBCo5wNTjVps2m1LD+Kq6dZ2AB0i39ZFqcsHf1lKN9wBZDKV4hABS73iEe22I9kYHYIm
	Gy2g2MtPGU55mw7RUG96T8ZcuRAUkIvp1fFSw/5G9EynyOfsND9O/sol21Jt2gMCka518x3UFdJ06
	62NufTqJTqkIy2pczF4VV69GOGe9UKNzh2gxaK8iX0VmluQda7f4UEVGXaorf4wI5a3TpzBoVGMpP
	ZPBOO4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFonp-00000008qfE-1KX7;
	Sun, 11 Oct 2026 08:21:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFonk-00000008qcl-0O3k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 08:21:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso4186295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 01:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791706858; x=1792311658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dr49tUUlFxPFnEicxFg6BKjDZLTyIOa8zv4bTCe4eu4=;
        b=SPL9BDbchk8RDvYE0ljtx9f0IO7Qrtk+GEZtWj1sb7SIBNobglQ9zqd/1+5vF/InkX
         rFb4dYLXL+PMxk7QYiHXNsRDZgseNlmpOZbZ8yXmyU88iEjSgouDQIvC4czYMN5OR9g5
         RBrpHW3jNSn0Pyrp249WS+Umph62G9LH0CtQLJ03H12tzYkt+7Y/+1E9AuLBcWjNgT21
         k3mF0fe5DSzsPTJw72ZrWXj97tcTrjUI3hxk4/XeLpLnFqTvNzNk4MmWVgYcdIQDpJgw
         MunvsqIICqGfT3SUavNRc7O4r8t0vOjrn9nyiHHOdYm1GCDZiJ8FyYGKMGddqD/LxH8j
         j7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791706858; x=1792311658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dr49tUUlFxPFnEicxFg6BKjDZLTyIOa8zv4bTCe4eu4=;
        b=Too2jY+7tinUZCjD/DxuM3bElhB6d/yE1+ePeq0vHC8w26ReOh8XNov719JRDES3/d
         Ao8V6qGWTLe924k1GbN6ZsUAcudSSWKvM7HFO1fCMpiVkPURsYrn1RivLpY5iPmHccM8
         2NSBrD19NSlH1usDjqGcK4GskaoDhnUGBsBc1YQGo3pyv+XXyT/Ui7Scfn5+0SkhkqHk
         I/kewqugFsaUM45vMS1nmKiYroUcmJon86Rp9UB+YvuP2AsDj4HHzjIUFVH5VHjpdAGA
         7v58PDKqs5I+HHREZjG8Re1pNgBc1XMDf0yO4yV0WFf6UQ3HQIzIS17ur4OKC9sOxnYy
         xPmA==
X-Forwarded-Encrypted: i=1; AKwUvBzvbDM08wC0V9vyZ3PayppyjxeFcsQC5B+v1R1ZOifo9nfQS9bFvM+5n85EZaVoh/o4i84sm8/RMhrDklJmWcC6@lists.infradead.org
X-Gm-Message-State: AFq9FYIfzuAo3gQsJnaznViWA+YyBD882hYHqBI169ddVLa85VkovnV5
	eNVlbIPk2dshc6NGmlXqg76MJAGiFZ+kxe7Jlu7j2R6PTIMMrQ89wkii
X-Gm-Gg: AYBFou3YRDPC5JNM2T6WwQt1s4J5E28WooPNodbqcVACTdnPWKdWJn6e8941snhyQor
	aLaPF5pnFQIN4PqivIiE+kjrkGrbyB/NzP2Sxia+b0P1rSZF43oSDNg9tS0Ay8y0hJsP8CE+N9i
	Az0IAl33+5juGs3jyJ4C1iXQBI8e5OOLrdOs8CNwkN0Oy/KAnzo0dVfM41ix1HnQpZwe75vYnWC
	5zHwDna0O++9PiU+ZzjhJlRecg1f27f/IRmqHdO4rBA0o1OpRMPa6Zp9X72d0+lxhRakPlJGzPs
	nfUfrLD8AugBsFVPPRdA94JjQAH1GvtxgQIq8MDWY2QMVuKRY2Z+1QdDSlyyTsnajMQiVPjhw26
	SUWwoeuajrjWBbfP5r1neWEXs2ueYVSeMd1YCR4+UAQ4goLRIHPlqfSD0aWYSArmRrzoW3pcqjj
	f9ES9ISWKOQ5VFLvGwX1C1smNxw5ZCzhd5Zqa7Fggx9RUOexPEDUZMercdRJeZr7K1RYU=
X-Received: by 2002:a05:600c:4708:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a18e47a8a5mr126204925e9.10.1791706857720;
        Sun, 11 Oct 2026 01:20:57 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a195002123sm152063175e9.1.2026.10.11.01.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:20:57 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] phy: mediatek: phy-mtk-hdmi: Use regmap to manipulate hdmi registers
Date: Sun, 11 Oct 2026 10:20:30 +0200
Message-ID: <20261011082042.348422-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_012100_927533_1108167C 
X-CRM114-Status: GOOD (  16.66  )
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

While working on MediaTek mt8167 HDMI support I noticed that on some SoCs
like mt8167 and mt8173 the registers used by HDMI PHY are actually inside
the memory space mapped by the apmixedsys driver. On mt8173 this driver
maps its memory using of_iomap, while on mt8167 it currently uses
devm_platform_ioremap_resource. The current phy_hdmi_mtk uses
devm_platform_ioremap_resource too, which causes a conflict between the
two at probe:

hdmi-phy: error -EBUSY: can't request region for resource
[mem 0x10018300-0x1001831f]

In patch [1] I initially proposed to use the same approach of mt8173
in mt8167 too. While working Sashiko correctly pointed out that it never
unmaps its memory during remove [2], even on mt8173. It is of course
possible to add code for that, but it would mean creating a dedicated
drvdata structure, and it seems a little invasive. Using the devm_*
functions is certainly cleaner.

This patch goes in the opposite direction - it converts all register
access for mtk hdmi phy to the regmap_* functions and obtains the regmap
using device_node_to_regmap, which internally uses iomap and does not
trigger the conflict. This way memory can still be managed by the
apmixedsys driver using the devm_* and the HDMI phy only gets a regmap.

This patch has been tested on mt8167 only. Unfortunately I have no devices
with the other SoCs that are touched by this refactoring, so I am sending
it as a RFC to gather feedback from more experienced kernel devs.

[1] https://lore.kernel.org/linux-mediatek/20261010115539.9237-4-l.scorcia@gmail.com/T/#u
[2] https://sashiko.dev/#/patchset/20261010115539.9237-1-l.scorcia%40gmail.com

Luca Leonardo Scorcia (1):
  phy: mediatek: phy-mtk-hdmi: Use regmap to manipulate hdmi registers

 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 145 ++++++++--------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 133 +++++++--------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 185 ++++++++++-----------
 drivers/phy/mediatek/phy-mtk-hdmi.c        |   2 +-
 drivers/phy/mediatek/phy-mtk-hdmi.h        |   3 +-
 5 files changed, 235 insertions(+), 233 deletions(-)

-- 
2.43.0


