Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA01C56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVRb7jDDIf4dRw2iFM4v7gAnB8dbYcYzZljxJ9FA5ro=; b=wO9pv8Fsq3qWoXkCxCv0g+MMXr
	gcOlEFM+oXHaPbs2cVhnGfeExT/skx82dXAVQZ24QhzuFCPw5KmBzRnstcwinaaQ58Lf+N46UHiKG
	LXeuhgXONod7Z5hOmKrAHbWVR0K/vAKjE7RmtLJjFJjNNCBksJu9fTJwBI6hNgJXn+QM/3GUkjN0E
	DNVsuB7e07gI6LAODJH7vx6dfIXXoNZt3k8Dg0PRnJT6swkdo2YoGnZaWkp7kvGaq+DEahAGV3YF9
	dwxllcVgGb+Ak1Gnmz8MVA9poTnIr49i8PuIkaH2ad2FSJnWgZVXMMVGMir6rS+llImyYQSPj6Ala
	zn6Ddd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1qD-00000006MmY-2hvT;
	Thu, 06 Aug 2026 17:25:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1qB-00000006Ml6-3drq;
	Thu, 06 Aug 2026 17:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786037109;
	bh=n5csWBZ1Cc9hN61HecqWXzAxfd/8ZtnL2A003yAEm7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G4fC89TivAI0LBDDEXSYehx6D2C0qK/XR+kNMQ7xCOcWVywrRODk34qhFdK3tT3vK
	 1zrS1SjRl11sa2JG+vlxVTta3FFeVTWxwtJm95BxBMx7+S/rEuhLVDXMq0PFC0OyR6
	 56eeX5XjgulSZgh4aZJ5GHbECWOsVS+69h8lOS4BwghhSs6tPpO5BSInaIWVwSlc2X
	 jWL0U/wq8OCsZnj8+VrMm5P+SLvJF/C6hU8VmF+/hVSlzox+DkSRET41PVyu0aT+cT
	 6Ky7D4frr5qLjOamwbwd99ZqOD3KOvQ0UZlV1x+lgZr3UbeB98mn9qHKy5QcKg4Rxw
	 y+tK6+NleToRQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C106B17E0749;
	Thu, 06 Aug 2026 19:25:09 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 7E7DB48002C; Thu, 06 Aug 2026 19:25:09 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 06 Aug 2026 19:24:57 +0200
Subject: [PATCH 2/4] arm64: defconfig: enable Verisilicon IOMMU for
 Rockchip RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-rockchip-defconfig-additions-v1-2-6b1d8baa0bf5@collabora.com>
References: <20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com>
In-Reply-To: <20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ystj/RqTsUnUheF3WZO7iCSd0a9m0vX7F4z34dkNvug=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp0w3UqNAZWeTC8C/bDIhLjXHj2W0CBFOBde
 MWCGOQmRk3O2okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqdMN1AAoJENju1/PI
 O/qanm0P/R8yf+7Si0fYmFeegXYXwMphPcwtR1LLB/3v1Jcsnew1R/0vCzRjee57Tbv0c81A4nN
 y0Jr4sBAqxg2jaUo2qfN8n7GCjrpJOHfaiIEoG8O01UUWmQ2Dedif5O7bgDWhZft/LgG0ksuwQ1
 LvKW1Ygrgyr3w4hEpJz9dATCYkwtghcj+sqqwyFvTTq4PQESDXP0imbMDxj1EDTETqLX4WJdzzH
 r7KmrcsMNITdnzsPVIPpavO/IJZbEIOKvDAyOTrd9RhaEaa8qSb1uI8aDRnKVjOGtjCJXtSlLjh
 jylMLoO2XLQ3T4RHD99niNDLIv7QEeovaL/G4lRa6mtkMZxb+FAQ0Js70RlTNRp/20QFiXnQM2u
 EEL/kDFp+ugXtWF9KaD3Kusn9VvAc7tqg+61T8RHa3Uk4xU58a6uPxYTJJ0vVHVEvj9mDaUizH7
 fHNlRM2WD8xFnSeFnSaHTMQ4Y4T9mupXlHKLEVwHwTtO14D+XwzjPbhMM7U1AdGcK2xWVDuzFCC
 qfR03ORRGNagMlQB7BOZDtOgxAaMxyfFYviJQ3hCt/VZFuGwSXBFL/PjC321kBrSrnyK/TGSEJ0
 PP9frzj0iftAzN18J+KcI5PJsRSNgPNNuiy1jweJD3ttdT5mcymX13vRYnYYTtjG9OTbNLcK0ZM
 yeLxnyKx+supoqJGf4EYxkg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_102512_063905_A6597AC9 
X-CRM114-Status: UNSURE (   8.92  )
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

From: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Enable Verisilicon IOMMU used by Rockchip RK3588 AV1 hardware codec.
This hardware block could be found in Radxa ROCK 5B board.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c84df0a9cf6e..c7d9dfd120e9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1612,6 +1612,7 @@ CONFIG_ROCKCHIP_IOMMU=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_APPLE_DART=m
 CONFIG_MTK_IOMMU=y
+CONFIG_VSI_IOMMU=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m

-- 
2.53.0


