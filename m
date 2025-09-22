Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240D9CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 03:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s2pZSik72TY21Dy++4e2+FSjBI2j0gpKQPCcrZ1+wys=; b=yI6PItBGwzLyZUTLc51yEVPrOE
	3U3fl1bk8TUZwBdo6Tz7NDivN3ijfsM3lQHFm7OctcnUnvj0J89I/YfcoMjJQfUwsZIwVfyb9Gfnb
	3ZKIixyNwxYcxxK0t1MyEkEvDuTwxA8yD+2U5lZL0XebK5l6AoeJWqvr26KEpZwLLIpvp4UxVyPET
	lBae59H5WOojFzUX0YZSBhHyzJXxFxloRtaks26Xr5gBTKZNYyREKE/sIDEXZOeu0D+Uw8klmH6d/
	mXBmjGWCKZjowdOu6CSNboyxEL2e4Jc9Mxyb9qtxmt2IPPm9UlxZJFFpkNM9z3UZCimD2tBJ24gLJ
	uSQbifNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XhF-00000008k5a-37wH;
	Mon, 22 Sep 2025 03:58:37 +0000
Received: from p-west1-cluster6-host12-snip4-4.eps.apple.com ([57.103.67.17] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XhD-00000008k4i-1dHq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 03:58:37 +0000
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-10 (Postfix) with UTF8SMTPS id 13B6F1800718;
	Mon, 22 Sep 2025 03:58:29 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanhinton.com; s=sig1; bh=s2pZSik72TY21Dy++4e2+FSjBI2j0gpKQPCcrZ1+wys=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=okXmIHd7KwiREU5Ukxzd3CF1CYjnUjBfxsBa+oVepm7ebaupmABKEesJbffZWu4hnZsLfOD8IqRmUe6Bi2dVzbvcAAnMk7jYdylfpsihAhWLfwmRPEDnS+wqtsu3z2Ig1VynP1cbylV+l5gSa2QnCTqkTrmwTZ3RWJ6JdA/WZuDEXaMHuWuHg18b+TSj9mrldbIUHl+BTMePiR7ryIeNHk/fMufZfMx809WmEX2xyltKnl6icjA3ck9h4qMmt54yv8Ef6xRx8VNbHXvxHIm3nH7oetg7z/ezdfPI6qW5NEtw1eqpzeLpyus4J6cMPSMgYZ6adEphm0L4yzZvM71IzQ==
mail-alias-created-date: 1643268037438
Received: from localhost (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-10 (Postfix) with UTF8SMTPSA id 2D5021800125;
	Mon, 22 Sep 2025 03:58:29 +0000 (UTC)
From: Bryan Hinton <bryan@bryanhinton.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	daniel@makrotopia.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bryan@bryanhinton.com
Subject: [PATCH v3 0/2] arm64: dts: mt7981/openwrt-one: UART labels and console
Date: Sun, 21 Sep 2025 22:58:08 -0500
Message-ID: <20250922035828.2941327-1-bryan@bryanhinton.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4RuZaZCIurzNU15Ktsexkjb433pEZ9CI
X-Proofpoint-GUID: 4RuZaZCIurzNU15Ktsexkjb433pEZ9CI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDAzNiBTYWx0ZWRfX5xzue/VdevBo
 QzS108sHnbWZ0qgiL3S0R24E7FOX6N8U+2bWyJXaYG5kBH43gX0TeV5iPHCA8DZojWC+2xVD1ma
 kcD6yRBkRArd85kfGfLilQdLUciVkIxA7a/gzfTcIzxI/orTl3sUbZfovvHGYYRl8h/W2I1r3Ma
 ELWAoglVrGQxtkdQFG4xpZssUy2fJrSa3viOIy0U8cWDKJHSx2kJpFj5UaieGqX58hbg89cItVA
 Raut4zBcHsEaG3cTGw9/D7sebPqbmz32XJFjjZ2RvN3Tg8Uya+l0VqMuncAKkfB0OED8blTSQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=788 clxscore=1030 spamscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509220036
X-JNJ: AAAAAAABLAgEF4m/ScTvlirqyLyT96PSZK4hRhRnpe9ErY5FGoXkDTgetLg7US6PlacoOlQwO9xOw/GyxXFbSO7NWcylsa6gW7Aj4RzIw9IU23XxEolIBS/dECsEEV/Yxk3Up3wXjnUhEpfskON+d3siZ73Fs3IsZKoJBtw6/nPkskY5ApX+a4O/ppuXW6ztcQEnVDiGwXvyOnMfIbekBXOGRocO0vaEo61JDO5CqgDNRYRgynY9OCVIrn3ViaZxANGpVxFcfAmNozm4Gy3XhOUltMHVGIQRprRtnXldG+67N/w6361aW6eOcG2wy23LNnoKsPdKqbXQxI670uk8PzI4dq5mfNV11b46Aq/8qqiOD2Sw1+RcOdWU8rZfUumMuBK6rbQAEuz7R2aonFPCM9Ec12vQQI9QjEfq95H62rqwEwZpnBUw73kmdKSLhR92MPRp3RoEUaRiUZzaZf9HtMw3Csd7BT3mIYlEjBMloxSFnIdidnKxkDs9yvHA3BAN5kP4hXOV2Eb+2p3xB69LugDTL/oJ0wjDu37C4fCh+bUSqv9X+k21bfznIP0gRfrju/Ue/65QpevCrTsRSHGN3FAOHgsZu6UWXdGHgP+emWF2PokSh3CK3jkF40mKy1Vv0xTJgtFhzeEvpDQDyJp2xUB+uCMRt8/+Epr3O2MOytSn8wjDAA0ZhZpkIA/2/FjxBbCKAqz37fDu3/ozRlHDwWFEx49nw0k6aKnls3Nfw4oWUu01nA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_205835_596012_71D7B934 
X-CRM114-Status: UNSURE (   8.83  )
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

This series makes two small updates for MT7981:

- Patch 1/2: Add stable labels (uart0, uart1, uart2) in the SoC dtsi so
  that board dts files can reference them directly.
- Patch 2/2: Update the OpenWrt One board dts to define serial0 alias,
  set chosen stdout-path, and enable uart0.

Both patches were build-tested (dtbs) and boot-tested: mainline Image+DTB
built and loaded via U-Boot on MT7981 hardware, with serial console output
verified.

Changes in v3:
- Patch 1/2: Unchanged.
- Patch 2/2: Drop disallowed 'current-speed' from uart0 per dtbs_check.
  Console baud is already specified via stdout-path.

Thanks,
Bryan

---

Bryan Hinton (2):
  arm64: dts: mediatek: mt7981b: add labels for UART0/1/2 nodes
  arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 115200

 arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts | 12 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi            |  6 +++---
 2 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.51.0


