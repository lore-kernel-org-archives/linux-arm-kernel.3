Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05A1CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oO6F8S4iXmJ7ic9vKWXnr67NGfqxQCelinoF/a3mKzE=; b=SMve0PFkvmkbDu
	La+SBm7HCHPIN54QG+xZm1KTjHJMzoYPiu3jwabxC7tIzhDG/nZdZbmBx3y7dcqmwqOe0z2G6YcIT
	FkmjeRm9WNEz1oCc268dlrqDfUbBveS1ILTFKBSClcZpYfrzS8WOvlpIXJ+bmRTlNDQw9rZdNt7eu
	19nHyYkEnAS1yE8u4qqWn+hoUJ/XyUCCamjFGHX9RJBL95zcDLvOvf0fJzot05ezQzK1v66ZAULMe
	v1fEu7opfMb+KhAr2lx+jIrAHbfe962GHJO1qvZCXHwh3S1TnhulUuFVXwGLKazKuyVOhXQrMgR/E
	RldcPAoFQkoLSueE3+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3EM-00000009S0y-2NPv;
	Thu, 04 Sep 2025 06:13:58 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu3BU-00000009RAr-0rQo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 06:11:02 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1756966257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oO6F8S4iXmJ7ic9vKWXnr67NGfqxQCelinoF/a3mKzE=;
	b=N34J/tUXchR98rhDpDOIIqbywhM4RW9JEhANmi4vmvFgiZCHcpgGiuXHa+TMQOfwhsjYQX
	tT1Yjq3uBFOr+OtINAguGizcRQ34MCUoOl8zDOd1CZBQZERH5SFsixbWFAeVIoirr5+cNr
	Vikrw1YU7kwKszke8U8LdAWfTWMc7KQ=
From: Henrik Grimler <henrik@grimler.se>
Subject: [PATCH 0/2] exynos5250-smdk5250: describe SROM controller and
 ethernet port
Date: Thu, 04 Sep 2025 08:10:09 +0200
Message-Id: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEEtuWgC/x2MQQqAIBAAvxJ7TjBjkfpKdNDcagkrXIhA/HvSb
 eYwk0EoMQmMTYZEDwtfZ5WubWDZ3bmR4lAdjDaorTFKYjiwspJ0xUWRQz8g9pq8hRrdiVZ+/+E
 0l/IBA6grvGAAAAA=
X-Change-ID: 20250722-smdk5250-sromc-ea5b95530eb7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=henrik@grimler.se;
 h=from:subject:message-id; bh=81cwNxBRpsy4lHfs6w+lntIgyPt1afBs9lzo5aqkZAE=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBouS1jrDIXgn9bMvXu+aTWq1yB5yYKIbztFjJRb
 5VIRRtWBtWJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaLktYwAKCRCwB25JC3Fh
 a224B/9u6FvVsGJF58jfKHM5mFEdC7WYcp9kMsTZRKwrnmwaYKDqTdV72YSucSj75bzXJxBzxYb
 FmXCK16hndHSynT7lYB5IoB7IsP+Tr/VGh+q6x7DAd6ngowS71DzuPn2+AFhDLrbS61qA1Thxti
 uogT4Gopm1d9+/6FMyV4anUDDJg9DozYLQED45vVzBqiYpG0JKrPi8NivoO63Eu9esnjm6zHPd8
 gSQoK3+eFhcPnXlhKPDfbUMErMmcrydfLlsKqutbYhP4cHAbZWv2zrmPTNIt/aYRxf1mNax6Knd
 nLk6vguLG/K1lxh5EPAMFHyauzGm+O/cgs2LCmjYGdRE8VCU
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_231100_849333_28E0FC4A 
X-CRM114-Status: UNSURE (   7.83  )
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

Based on smdk5250 description in Samsung's vendor kernel [1] and the
u-boot dts [2], the smdk5250 board seems to have a ethernet port
connected to bank 1 of the SROM controller.

Unfortunately I do not have access to the board, so this is not tested
on an actual device, and based solely on the linked sources.

[1] https://github.com/krzk/linux-vendor-backup/blob/samsung/galaxy-note-tab-lte-10.1-2012-gt-n8020-p4note-exynos4412-dump/arch/arm/mach-exynos/mach-smdk5250.c#L982
[2] https://gitlab.com/u-boot/u-boot/-/blob/master/arch/arm/dts/exynos5250-smdk5250.dts

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
Henrik Grimler (2):
      ARM: dts: samsung: exynos5250: describe sromc bank memory map
      ARM: dts: samsung: smdk5250: add sromc node

 arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts | 37 +++++++++++++++++++++++
 arch/arm/boot/dts/samsung/exynos5250.dtsi         |  9 ++++++
 2 files changed, 46 insertions(+)
---
base-commit: 1557c2eb023d9cdf97b4686fd206048c070d4e70
change-id: 20250722-smdk5250-sromc-ea5b95530eb7

Best regards,
-- 
Henrik Grimler <henrik@grimler.se>


