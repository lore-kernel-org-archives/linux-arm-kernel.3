Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56A1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHuBxSVI3miYGq7VQcz5Dk/EGYJMTC0E0UPB/7Z89ow=; b=UpKOnQIYqYwC0SeXOoWZHpK7mo
	dcs8Z/sW7CB7LszV/YWVrQlq8MN7UYg1fACpt9lecGArtIf7LcPsxgFA5PuXTaRrTWbCNCTc2FZpD
	oYYb7SnxSzDmpah9Y8fnS881d02bF71lpT/X6UQjeDn4CKuhs79hC8J9o/0Q0A1ahN53GV3GJkDOg
	+w5H+98W55zZ8fGL7BLss9+fPAJc0nG891ZHrrFAYGzOhMbYYDES2WBR5pqoMZw0J3jic7RGa1oSR
	lzy0d8bCHtGjkxXPhe8P6hFTrIJw06u3XOi9Soqj7b5ulrpouT5o1GUF72cvDq4mjrZzLnNdMjuEr
	dWF029ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vMh-0000000DxyX-0rjA;
	Thu, 24 Apr 2025 12:07:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7to2-0000000Dg3s-2T1Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 350E368455;
	Thu, 24 Apr 2025 10:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12B9C4CEE3;
	Thu, 24 Apr 2025 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745490465;
	bh=Dhr0rsx9WpeMa8aspdbgl7YO+d4d6KcEE2+waQCoYbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zbx8c1dLijPcaODhyVkHFGx5r2ZphraIAZSwlIYG86gb3W26LbpP4Fji8vaGl5y2K
	 MZUj30RABRGse5hQ8qy57swFn1Ipysp2hqD9ujgEc/sCCdXZRUYEZ5f1UzC3ALXkod
	 iZIE8+yDBCE+orVCF0tC0FMM5SuhWYnCr6CAQ1xU2iUK+t38VSe/XeKR1IDpHoSouL
	 elD14Cb89Lw5VWoe6BkQSZOZBl9t+OOeRjfBKiy5PQkeWZoXRVcLh4gp70sDvlZi1V
	 OYMnA71A/D+0tz+iTG1TVlCjAHhDzkcmF+3dwHyu6JgYWDIzCIcKfXEUds/073r5Rp
	 P9X/p9JsBp8BQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 24 Apr 2025 12:25:33 +0200
Subject: [PATCH v2 22/22] arm64: Kconfig: Enable GICv5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gicv5-host-v2-22-545edcaf012b@kernel.org>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
In-Reply-To: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
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

Enable GICv5 driver code for the ARM64 architecture.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08bfa0f3e6f630dc4adfe797a4d273..f1b3c695b376717979ae864865238ae12ad65ca2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -128,6 +128,7 @@ config ARM64
 	select ARM_GIC_V2M if PCI
 	select ARM_GIC_V3
 	select ARM_GIC_V3_ITS if PCI
+	select ARM_GIC_V5
 	select ARM_PSCI_FW
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS

-- 
2.48.0


