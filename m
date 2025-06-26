Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FB7C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 16:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mp0Gioriq+Cm97moLnLwRbcOGGhJvQyXKdRIuZwi4PY=; b=WcUkdkOBWYRDArhPXlSRtakOYe
	015GwNvCRnrGtrRNJCuRt97KFVJydjdQPjjTDAc4Tquzv7YiEzWyUhtFSoAfwBVNuwuyWqBKEC/MT
	PggddrvJoyxjHrOoyxTrjgXJNQo20UwX86YpgECnYf44zFJHFLenVtW0y9mcatKVTvgKWQFvFoXuO
	NRibERlpuEm+ZyzVirmgktAraKNDRgInjj5KW5EIy+hHCKQZ2na7QYlwgqyISxBz1KOVbUwvDwNV7
	B5k+kKvuCjgunRGCAsR+ssJM6326WgSotrEk1q7H7yWvNFpOStaT4QMGQlaBAQ5Ni8g03BJmxMPB/
	u288Xo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpDZ-0000000CEVC-16Y7;
	Thu, 26 Jun 2025 16:12:53 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoMV-0000000C5gn-3k8Y;
	Thu, 26 Jun 2025 15:18:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750951060; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KdSQNg44XY0aDBvJpvwXJ7hZnCNtm34c2MB+E5W50MAJcF15A5lW5tN0yLKUY4dmZ2hd7FBA8Wpq4zxs6C2QhOiv2UdiD2NMWACJVvae0vAdODDYmWZBRFNK/3vUso0LJLfoj5mQ38H3yK21dGM99BnFPKR0merCQtCf8Ln6vzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750951060; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Mp0Gioriq+Cm97moLnLwRbcOGGhJvQyXKdRIuZwi4PY=; 
	b=E/O9TBewgZI2hhCliPHlup/Fk9aG+rWNhf4zGhfN1J4arLvGktzO1syiexEMAqfqti5smuv9j7zgN56ZDiqe6EDMZ3SeTTbhjaeMClSuY4B6zPJZMN55IVQ2iz5jJewf7AR5HlJyvwTqV73cjXVrUSQtl0PWhqcksyDl9kzfewY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750951060;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=Mp0Gioriq+Cm97moLnLwRbcOGGhJvQyXKdRIuZwi4PY=;
	b=ZYdfM9BPepva/BjM/XIknPqiog0Qholkn1PB6/NVAawm0j21pgk8/tUelTxG5GHP
	bHzBMPgrE/wVmBuBJMHy1Q2xWwNs4GVKCW7Z31rgzmlWmpUk0nV+RgPUkVsGxhGV9vb
	welB1E4xpdwqNvOD8sa0NtTdM+0T1P9h8L97Rh7g=
Received: by mx.zohomail.com with SMTPS id 1750951058759577.5834453049853;
	Thu, 26 Jun 2025 08:17:38 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 26 Jun 2025 17:16:49 +0200
Subject: [PATCH] arm64: defconfig: enable further Rockchip platform drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250626-rk3588-defconfig-v1-1-39a19a41c181@collabora.com>
X-B4-Tracking: v=1; b=H4sIAGBkXWgC/zXMQQqDMBCF4auEWXdAY6PiVYoLm0zsUEzaSSyCe
 PeGSpf/g/ftkEiYEgxqB6EPJ46hRH1RYB9TmAnZlQZdaVO1ukV5Nqbv0ZG3MXiesasNNZ13xlw
 tlNtLyPP2I2/j2ULvtcj5HOE+JUIbl4XzoAJtGf86jMfxBfiKZT2TAAAA
X-Change-ID: 20250626-rk3588-defconfig-715e37fd554c
To: Heiko Stuebner <heiko@sntech.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_081803_996728_CD5ADD51 
X-CRM114-Status: UNSURE (   8.10  )
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

The RK3588 SoC, and its sibling, the RK3588S, are supported by mainline
Linux. However, some of its SoC drivers are currently not enabled in the
arm64 defconfig.

Enable rockchip-dfi, rockchip-rga, and the Rockchip specific extensions
to Hantro as modules.

These drivers are also used on other Rockchip SoCs that mainline
supports, notably RK3566/RK3568, as well as RK3399.

Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e071f8f45607dbfd8e00b915b27999949ee0fc88..8b5ecb20ed6450faa0da14a6fdb4cb227a1f735f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1789,3 +1789,6 @@ CONFIG_CORESIGHT_STM=m
 CONFIG_CORESIGHT_CPU_DEBUG=m
 CONFIG_CORESIGHT_CTI=m
 CONFIG_MEMTEST=y
+CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=m
+CONFIG_VIDEO_ROCKCHIP_RGA=m
+CONFIG_VIDEO_HANTRO_ROCKCHIP=m

---
base-commit: 7e5ee158886bb7c244a34623de6a410b62023d60
change-id: 20250626-rk3588-defconfig-715e37fd554c

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


