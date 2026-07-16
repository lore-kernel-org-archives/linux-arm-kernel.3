Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2451C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GrO9yku15Nd4atEWaEXkVKcrXj8oZipRV1TYhFxDaxE=; b=tqu+C7Gl3WN8MGOnrmyG/MWzh2
	G2FrFAGLP/iDO6sqcMnvJ06esdl63aYKumNIFnzVpGRye4+f2s7AbvvWANZK6LY5+EhQByArNmccM
	30F1v5jfEQ2Czap/ebHB5duhkiR58b2apE5CzrmJsiSw7H8vOnH8KpnHm1hqSRwgDmz+w7dEYsaY8
	K3LmpxKoEwMM0Shgvx165rqA8j3B1Moyb6LAmVKP3eq/O+KkvceCog7eJOu/bCUKXlwwPDwN39fVx
	y1dcWsEesDZ80RNvl0ad6nN7YA9syA05EKPiRe6vSbSDbV7CynwO3C5IciDriZATzSt/A2umQs36b
	Q85rQYPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPic-00000000Fpb-17Op;
	Thu, 16 Jul 2026 17:17:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPiZ-00000000Fnq-0SQG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:17:52 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cee9b74ee1so34694155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222270; x=1784827070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GrO9yku15Nd4atEWaEXkVKcrXj8oZipRV1TYhFxDaxE=;
        b=aFeEaCywu75bGxOmllWBLcG0ADeZS2+bFDtaD1K57W6vqPZSQ94zU8GvBLBYDhuyy4
         /5hV1I2eN90/eA8zdCKaKgtx4usaL5YuGZ0YRoharXWFNWfbXVGBadSIQYG2ITw3BARm
         2DlAOcJFcdEwwPZiZCtqGwpbtNiIswb9CASBTNoILellyDzVuAmAFQH8nOfjvefE0aLg
         6SBdwICDEuRFzopFv2sK8Lz1gdMF02Te+0RWEnZ4Q9rFKGXrCxCF8jdmtrsqsp3yW1eJ
         LNS5ghFwwhCG0m9j96SJ99/z57inXWm6XvWiK4zUzrWe/N1KKCD8cjZbvbdax7eRIb0X
         1LSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222270; x=1784827070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GrO9yku15Nd4atEWaEXkVKcrXj8oZipRV1TYhFxDaxE=;
        b=ni2//ZKLyUsDA9Zv4z1B0s41Jxcl3JEohmAam+P/ahPtXWp4e0XUFRVuzAvb+VqDUR
         ce9ntqkn7aeklS0fzBumXYYtESa+D7RE9E1dpUPiRai3+masVl11PTsQbS7hiSZ9fXPp
         /hk4uPqhtciag3ZMZM/vQnrm9swDM2h1y7WN8lCoDGDwfDD03axLx50n3Q+u22+r4LWv
         yecxOmYwtWXl0xhbhBcln0JDUJ9ujeDI0V/+kmffiipY87VeQgwH8d6ygT9n0PFBIsW/
         qnutC2uJBSygKPTNi/xAeoq5Jz+MWCpstptexDurfuoDwGcx/jbKMcpzECH46UIJtX1w
         poQg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9KFQgJmVAQMiHau3ah0m6uRBe4aHf6zIH23VPKzZZa3YSKj5uFU0mNOAfjM210gsJIfiQHSUgwG8ByX1ZfKhm@lists.infradead.org
X-Gm-Message-State: AOJu0YxfzZNO6lYRfOeSHneb6sr6BDTz41W44DsU1zwki+7cLEApGcyd
	bDBDG0UCdxZlLLf+95My1C1DLCy6K7uXGOlFQwDQ4dRW6IM8tlkG3dqh
X-Gm-Gg: AfdE7cm4udwCYimG88xqcvo6MbLDQXw3xY63SThRxm6NrCNbTYxsa+D5+HhWRcxWQ7b
	L9zs8ZWeM4IiKiDDsMbf8Yt+JGT+I8B8gA7XdwuWFxeZ+7EWpRP8Sdq1FLAecfsQYOLh1HvYG1V
	UnBTs9Iky0auUcRPXRCRHyypETgzAvxgeL/pdLTb2YBn1G66Iiv9KXF4pv0YPAVb9HSkIIEDpof
	d8dolk2aXE75Q9hTI1LQKAsWY77hBc+HWvydY7/wc9sXVepDY9ii6k2/EkAXbB+5tQb0+MyeXPw
	aiUg/eJ5Mbkv8O6DKXxM4HDhfRXdr5sq4S8iwwgJOtHro+V0B04X/kliVV3DtLsFHbRcyyTxBhG
	c5fyiqBT42TnYktpE8vpp1pjV7Gmh6oCjup1A1/gPNATZN9qNpCEoi9/PhSxkt+oCMmMXweOvyM
	O1wHzJ2T11EWPzg4c+9GRANr7RjFewsm7uNg==
X-Received: by 2002:a17:903:2ec5:b0:2ca:17e2:2acc with SMTP id d9443c01a7336-2cf03cef19amr85530865ad.21.1784222270259;
        Thu, 16 Jul 2026 10:17:50 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:49 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/3] soc: mediatek: pwrap: MT6589 + MT6320 support
Date: Fri, 17 Jul 2026 02:17:30 +0900
Message-ID: <20260716171733.300885-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_101751_150155_2054AD71 
X-CRM114-Status: UNSURE (   9.21  )
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

This patch series adds support for MediaTek MT6589 PWRAP and MT6320
PMIC which are used together.
It also adds minimum compatibility string for MT6320.

Tested on Lenovo YOGA Tablet 10 Wi-Fi model.

Akari Tsuyukusa (3):
  dt-bindings: soc: mediatek: pwrap: Add compatible for MT6589 SoC
  dt-bindings: mfd: mediatek: mt6397: add MT6320 compatible string
  soc: mediatek: pwrap: add MT6589 PWARP and MT6320 PMIC support

 .../bindings/mfd/mediatek,mt6397.yaml         |   1 +
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |   5 +-
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 292 ++++++++++++++----
 3 files changed, 239 insertions(+), 59 deletions(-)

-- 
2.54.0


