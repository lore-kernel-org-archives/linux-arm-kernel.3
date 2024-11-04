Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6385AD132AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hnm3/rOohZDjqezN9Tjj89Kz227yzgfXkolbFN6GOdQ=; b=omn0ikXW0OEMXOxElXSAC6vcvL
	jjOEfgxRNUdHh1dEes8Q8//bcUEPD+8zTDxVC2l64RYEtJafq8EGhl0TGC4+prFotXFgNIupW2pCY
	J87di9posl8TUwDLEUwVUMhhOU+lCKxN2cRXj+oepPVQ4BZL7+b4B9BkjLmVbHSw4g++DVrnZ5gea
	XTE0R6m0VPksyMf64VtbUqDAc/VwtUGC+KQU4QcdLyl8wDIUv7x1CkPXZCZHBuIAeWEuNtaBwruPg
	HjmNkpNFy1OGw27fK/d5SU+RRfJaiO2wCjR42t/DD5iHZzIV/voVNhfdwFjO5k8X311A0rlKIOLHO
	/6H04Kwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uhT-0000000DNRa-1vU7;
	Mon, 04 Nov 2024 10:52:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ufl-0000000DN2E-0Sah
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 10:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B24955C545D;
	Mon,  4 Nov 2024 10:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8C1C4CED2;
	Mon,  4 Nov 2024 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730717460;
	bh=zFX/x8ihpVgKkLrPR/NOpvs8U5Bnl1iPYEi4kaxTzUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AaYMsEHdUhfP+ru8PlIg+MjKg/1rkmzIPbJ91lyd43WXj+qAgtYsBZdnsKEqRq/qu
	 csEQXH1vqPfv2HS0CDUiioJbpbzLTlrxXzQyKOq++Axi3VNwPVF6aZ3QFFoU//J2Ce
	 2FFrhEZG5UMEqm9BQaxT1ouAsCIPtE/NTes0kZvRERg5eewBBMZEvSvAt8tHYXG4FM
	 yz47eAh3iSYbc+sTErvn2/350w4ZP/SIV1oI9bHXYz+qW/HKoECkaTGFsnE6Tu44cn
	 etBn/vNGm4jmu06uBCCexvt4oADJQSCC6053JXJYHKNslvbpK3ZZqxnJYYUzvAKEED
	 LTIvHE/j8TT3w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 05/21] spi: stm32: fix missing device mode capability in stm32mp25
Date: Mon,  4 Nov 2024 05:49:41 -0500
Message-ID: <20241104105048.96444-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241104105048.96444-1-sashal@kernel.org>
References: <20241104105048.96444-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_025101_226784_28CEB19D 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Alain Volmat <alain.volmat@foss.st.com>

[ Upstream commit b5a468199b995bd8ee3c26f169a416a181210c9e ]

The STM32MP25 SOC has capability to behave in device mode however
missing .has_device_mode within its stm32mp25_spi_cfg structure leads
to not being able to enable the device mode.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
Link: https://patch.msgid.link/20241009-spi-mp25-device-fix-v1-1-8e5ca7db7838@foss.st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-stm32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 4c4ff074e3f6f..fc72a89fb3a7b 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2044,6 +2044,7 @@ static const struct stm32_spi_cfg stm32mp25_spi_cfg = {
 	.baud_rate_div_max = STM32H7_SPI_MBR_DIV_MAX,
 	.has_fifo = true,
 	.prevent_dma_burst = true,
+	.has_device_mode = true,
 };
 
 static const struct of_device_id stm32_spi_of_match[] = {
-- 
2.43.0


