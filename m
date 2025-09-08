Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD8CCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s6dihIf8dRj48AF5jPOhCRWjZ7JWA05I9MIiVmOPVtw=; b=SXWaih2EYvdoGN
	6EQetGA1D+1gHI3442mqrfBE4wphOZ6fXGl9b+3P229TEtf/2kDcYxfL0UrFoak0NVAEF3bpEFUfr
	B+mIT9YHmVMkKtyc+vDHwgGl15ZjaVA9H0P+5A4+OeC+jfQhgiwUewIdlCTijlNm1UKT4y9zrUPGd
	50WuATykDTHmeM88PADddnD4CfpbBg4irgicJUsJK3kwm0kJ1bnlrZdLya838PFkyCvS8rn/zXUFv
	m542LZSiEMHp2FLCDn5z+o0qTmBBcmH/i8uxaKYsMzh0980Ur0LDFUvk9BO4GfR5TyQCTVRx3T4+X
	KMgyR6ZTO9B3pJ0S3YCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWTI-0000000FMaL-31RT;
	Mon, 08 Sep 2025 07:39:28 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWJs-0000000FHrG-2ltx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:29:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1757316457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s6dihIf8dRj48AF5jPOhCRWjZ7JWA05I9MIiVmOPVtw=;
	b=X0Q6oZKqzJr+JTOYipYoyZoI04xQnZRkJ/ggYeJXe0d3TZolCHT5M5mpiBqRGj4m6wY+tS
	ShE5D36ZOd1cxRonket/mri5wWtLYX157va0J62dksPWsHCNYMAAzaufzZkaWP+md5nZuT
	XKCUzH6UomkCbYTJkIGoOO7CGEH2/o4=
From: Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 0/3] exynos5250-smdk5250: describe SROM controller and
 ethernet port
Date: Mon, 08 Sep 2025 09:26:54 +0200
Message-Id: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD6FvmgC/13MTQ6CQAyG4auQrh1TBgeCK+9hWMwMFRrlJ60hG
 sLdHXHnrm+T71lBSZgUztkKQgsrT2MKe8gg9n7syHCbGixah5W1Rof27tJtVKYhGvIu1M4VSKG
 CNJqFbvzawWuTumd9TvLe/SX/fn9Ujad/askNmlCUGEsfMI/lpRMeHiRHJWi2bfsAzoijF60AA
 AA=
X-Change-ID: 20250722-smdk5250-sromc-ea5b95530eb7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506; i=henrik@grimler.se;
 h=from:subject:message-id; bh=m6P2ifyb2S9aL4S799UQEuuQspOh/8y6FFDeBdDh+ZA=;
 b=owEBiQF2/pANAwAIAbAHbkkLcWFrAcsmYgBovoVYKGkaXfYWHIIoUROmHqmzQeWHVBTPFVcfF
 b537vzfq/OJAU8EAAEIADkWIQQsfymul4kfZBmp4s2wB25JC3FhawUCaL6FWBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwzLDIACgkQsAduSQtxYWsYtQgAgF4PHPETcK6t3eCeZlF0EPy3GjYIrQH
 qnxESTAzF/51M+p4KKxslzW6+UYQE4fRlRIkVgKcCKeZhvwpZ9GW8c3qpUFK0JMEErjKFDH4s3E
 5SXeLSfM95i98GKBjOD89eqGYQ12kpddUYgdnJXMXaDqCdBBxUQhhE7xDIy63pZz3CZDabIAVeC
 aA+8ZJkOOHtsAeWx6LtG48EN/5lifqS/oRrQs7tgbqWs+2Zu9By0HtQySyWIFuVMh4qxyJpwlZa
 jTyccjPtAq0O88McodoD6qG5zDqh+/o12q+GLFwBeT1tCIq14vjnCuME4WGkNKo35Z13/xHIyYr
 Rty5nEqbbsA==
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_002944_834795_8721A6C3 
X-CRM114-Status: GOOD (  10.19  )
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
Changes in v2:
- Use comma separated tuples in ranges (@krzk)
- Add patch to update ranges format in exynos5410.dtsi as well
- Link to v1: https://lore.kernel.org/r/20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se

---
Henrik Grimler (3):
      ARM: dts: samsung: exynos5410: use multiple tuples for sromc ranges
      ARM: dts: samsung: exynos5250: describe sromc bank memory map
      ARM: dts: samsung: smdk5250: add sromc node

 arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts | 37 +++++++++++++++++++++++
 arch/arm/boot/dts/samsung/exynos5250.dtsi         |  9 ++++++
 arch/arm/boot/dts/samsung/exynos5410.dtsi         |  8 ++---
 3 files changed, 50 insertions(+), 4 deletions(-)
---
base-commit: 1557c2eb023d9cdf97b4686fd206048c070d4e70
change-id: 20250722-smdk5250-sromc-ea5b95530eb7

Best regards,
-- 
Henrik Grimler <henrik@grimler.se>


