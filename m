Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCFBC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIZZF3VdONOHx+mNvJVopq4jcsPkXQDojBDvTCHofnw=; b=m1fsx/dKngVSYxk3DaB5F4Z1QC
	EFUqruV0uCv6UBwZ3CYtCQyR0wYlS8kspV3ZYtfIXEun3j+H+sM4LbxKq2C0lcjMJwwSDP0FPmEBg
	WqmQDfniKWGis3FpKV8kTBz/sWwhP+7zq6uJTqdm0PllEe2/spr7lEvxVh7InmUbMA2UK+wYulGSt
	o0N2xsCg3lAAlnQ9CRKzqD3Fpnc9WMSj72CYRqjoA0Yj+SjVxWFrGQj8jJE6wJpPUCQgivmYAJqdZ
	kTlEJ/g6aDerEfajMeciBsCYr8f58qQ1xy2Bgn7k61Z2YHC3ZqKy/6UVnNZgZcRdguIY3zi4c14S7
	gbVLDLqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvG7-0000000AgXI-2Tu5;
	Wed, 18 Jun 2025 16:03:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtTt-0000000AOT6-3OaV;
	Wed, 18 Jun 2025 14:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750255776;
	bh=keF4qtNzrgMOTjYFNPm6e0DVoWKRm4eaIoCysbWwg0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOjyIbuKXih008ST9b1XsYdBxBz0K1uPl3kiY+oxxU6PHfh8w4xrLOCHpzxBkILTf
	 Nx+5e8gYQZDa6YkHn1z2dWmULH2JHeVtllgoM0/S+27EDnyIj6o8qILOhU0VnuSGx9
	 hyshYy4saA5/ak9Zcx5B7nCMIW7+hRf951YFEGCOAENenX4liiPl7hgTZPVmu5J4cK
	 ll6jDan2SwjZ0+3Qhs1X7Vur04fjIt0S9NY5yIu4vR+yh6XKbj2R5BtSeVw0do0xEV
	 FyDXIX8BeCFx9qymjJn4eW9j8QPxfuo9h8OZ7O08rUDlh6QXgDWHgwVYBQCjIO8CTm
	 ygQPL3A+Lyd7A==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:45c6:994a:f902:5c74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE43417E1580;
	Wed, 18 Jun 2025 16:09:35 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 5/5] arm64: defconfig: enable Verisilicon IOMMU
Date: Wed, 18 Jun 2025 16:09:14 +0200
Message-ID: <20250618140923.97693-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618140923.97693-1-benjamin.gaignard@collabora.com>
References: <20250618140923.97693-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_070937_991851_0E04DD84 
X-CRM114-Status: UNSURE (   7.90  )
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

Enable Verisilicon IOMMU used by RK3588 AV1 hardware codec.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..ad1515f69b4f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1451,6 +1451,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_VSI_IOMMU=y
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
-- 
2.43.0


