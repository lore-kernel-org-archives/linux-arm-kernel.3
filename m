Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BF0C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ycI4WYThtdNsX6KYwyJiENU7SdlsJACu2s2/RAZVc/g=; b=mAYtf76mjAkzHuMhaSdUdVikYN
	P+sSroTC9HvdwKb23+/+H7ndK6u5GsZEiAZxtZZ0cgGDg+OG/oriuYyAXgBIo8a8QXLb3UPFuJUOu
	kcD9unZEx35dsO+5Yo/tBeLUvG4UMnIEKyr1MI1wauuETP6Y6Iu9IB1IUHGE7aVQhQcptFEMQKYcU
	++83NTo0gEjTjvmf+PHNWEKeVN0uUcNa8V4H9+5x6WdPgXdwslDsYiT5tC8rxxqV4nYucPwQbfKpF
	u774fj0wylSMQVkNispFajsFNsGPFRfITF+7GBb0vAMRgQvVcQMpLugTHYIuWMRwYLNFUTOpH+cJs
	KwZuB8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMNv-0000000BvJF-0Ss0;
	Thu, 03 Jul 2025 16:02:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKbK-0000000BbJq-11Ia
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 14:07:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so55255885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 07:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751551665; x=1752156465; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ycI4WYThtdNsX6KYwyJiENU7SdlsJACu2s2/RAZVc/g=;
        b=mKHUk8LpyKbwv4TexbMh66FHbESdJqKfUl5zUbawV3+JFh+JGrxjgu0c340cGMK2O3
         xIWtXhQxb8y4oZbrFVd9RcEaOR+US/C0Ne/Qdpw3oj+tA23vQLYKuoLiw9QiZXg2hbXB
         91WgxNETWqk9xh6OdHDZmIVVRcrkU73W/uy9RtU2WIHFeDOymqKxKYLzk7lxN6wOwVZL
         xItVr4bGI0jp1etpTRaYhD1NMCQFoZfkUcuBQ6yS9XiOdvVB5gOHWFqaDjZ9i7DqHag/
         1EZx7i3tx66F5wkFH8c4fsTdzIR0xUviJSBxvYQoordYJhPKLeNFY814G9HXmECPERau
         cBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751551665; x=1752156465;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ycI4WYThtdNsX6KYwyJiENU7SdlsJACu2s2/RAZVc/g=;
        b=J9YknxVure6IKTrUbKgs6hbh+3jWHbfuSpn+yUA4CoVIMK+q/bvoX5Zq1G6EgCy0so
         biE4k2tP+gDIZHp6lNgKXcM/hCtHUOYVLG+wi7t9dDz27Uyf5iuz08CEgvDJfc1vVzN8
         s8aZty20zK2gRvtf7+YSaJFx2+ve5CLFCYajdLRhMHQpNCnI1L62CXdeTLdyu/aVxxVG
         f34FrB5+w5ZNYoEtC3Tg1OAVM5YsY4yFzU0gMHF6tZVJu6xDCOKcOjwMdsL2KPez1iUS
         PQdDJhuO7wY+Rjjorf/cfxxsnQLQU8CxOtJrQLcRKtE0Ki9fSwWGSEEN3gySnWl2aXgN
         uV6A==
X-Forwarded-Encrypted: i=1; AJvYcCVFp58r7zokwyoHucPNJdLtmFxQ2egPs83VirwCv8bgmEy6/3oL9yXhgWz/63D2SpvKZkmBmGYCEjjEvLuKt7y/@lists.infradead.org
X-Gm-Message-State: AOJu0YyUL0dGhtVNaOSgIJ39oGOjsOfjY+Mxt/FajhFpQs26+QC+oOhm
	yVnNnlqBEfKjZsMYxQCnaEbnGAGENFrGBrSZEKpi2kFNutZYq1KQOon+gFsxVNdBfnE=
X-Gm-Gg: ASbGncvbIYkEQbggaHk+GRnIKR1o75V0rTOOi08BSvoJ97YFxw3xnCkOvljVpOCltca
	9Va9JFWV4ODHYiidsCvVFOciVqAUe3NJVACxJjdkGICMT584rnzFPAaTZ/rpFDS6xUIRwnc0DXE
	NjMHzyvq1L9xrf8soRApwoeM9Vyv+A27BAlE7rNY7Ydib0uL1+ULIqujmX4nD/0Xpj70VSkOic8
	G8mUrWiCa4It+1y3dt21ZX4OZ8AX2sgrW9z4FeH4GdMPHgrQ13YucHTBwskRpwek9AiIETSsiuM
	eAwvqryfudiJJUwMMpDZUVYOcpHDNu4mKUdAezsRW01hR2jIokUC1EHCNKZ5Gv3VU7LhstbYNny
	RxSvRdYvlxS75RBEz
X-Google-Smtp-Source: AGHT+IENaq88sCKdSam+I4emffuT1q9K5iTEZO5saslNhRejQ3SetZS7xkYpcNjBldQAnYj+qmKUfA==
X-Received: by 2002:a05:6000:480c:b0:3a8:310a:b1dc with SMTP id ffacd0b85a97d-3b32fffbbc4mr2523114f8f.56.1751551664251;
        Thu, 03 Jul 2025 07:07:44 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5966csm18926220f8f.72.2025.07.03.07.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:07:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 03 Jul 2025 15:07:40 +0100
Subject: [PATCH] scsi: ufs: exynos: call phy_notify_pmstate() from hibern8
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-ufs-exynos-phy_notify_pmstate-v1-1-49446d7852d1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKuOZmgC/0XNQQ6DIBCF4auYWXcSSgOtXqUxBnGoLIoW0EiMd
 y8pabv83+J7OwTylgI01Q6eVhvs5HKcTxXoUbkHoR1yA2dcsCu74GIC0pbcFHAeU+emaE3q5me
 IKhJqRvXQ10JpKSEbsydjt49/b0t7ei35Jpbx/9JUv48MY4HxCxvGeyXEjRspmpVDexxvUT6tU
 rwAAAA=
X-Change-ID: 20250703-ufs-exynos-phy_notify_pmstate-c0e9db95ac66
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=tZiZ92ztTcdwSFwaDSEjuylr6E2oMfBwx3JEMzcXyII=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoZo6u+V3Q026xLVWd3U0WTHK0GIijnylbPkNaZ
 Nk9sNbretSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaGaOrgAKCRDO6LjWAjRy
 up9jD/wMpHZvlBCnREgmHLSrg0lxxe2ntcr9OETQ+7+AiDjL5pkH9OAGBPU+NCBY/bCqDjguH9v
 EVtws4IY/0/0VViKPOiH2Y9zJuNyaYNzadlQStEJyHJdDFH5YXfJcRGTtbR+mRehJu+6XK6vXDU
 AK6pemUfcwJ8g03tqVMjURIuJYdRns34AUP/BHPlTV92w7MqEXqjifiNfuDqyhADk5Qeq2Gc5Qc
 Cf5CpXIQmWjOKyU0STy1zlQmUnXjipvGTmmjmzNdRcDqK3eQQzMUL2xbnrc7oqzlXimVgkaDLme
 xOSDaZzsw0YiIsM7zHIv9hrWjjrQckT5JOkcZ8LMMvzvxDHTUcZrTasdvCGElrDcnNs2965dw7N
 7zldXitX3acPMpUtmvyf2DwuITA1Y9oPcE2x7CZxBA7k7YGAUEUUc9f++sG4TmNBgE43Ygokkz3
 OEgP5NJNLUZUiz4rZ4WxT7E5RFO6Aur6uf/EEVRqn+PNHWEYbbTmt6NqZZ7MGy5wGI96/Ku1a2i
 TMLTscMTHr/lOTuYwBcfwhQu/n2ue4ARLjIi0flCIp76E4mQ0dh6up3U2ip1m/E2Y/GBvqx4yEF
 BlWaeijNzs9rAJPCuDdxXxNEqoziojgXHxtp3tj20cOHs2ONAeHknZNQb3+BtzXN/kKcsqcrlqc
 xRXHSsU+e3Jg7fA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_070746_304776_FAEF2212 
X-CRM114-Status: GOOD (  11.70  )
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

Notify the ufs phy of the hibern8 link state so that it can program the
appropriate values.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Note this patch has a dependency on the new API proposed in [1]

[1] https://lore.kernel.org/lkml/20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org/ 
---
 drivers/ufs/host/ufs-exynos.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 3e545af536e53e06b66c624ed0dc6dc7de13549f..e9fac23dc15abd685aba4c169c82e211040dec8b 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1574,6 +1574,8 @@ static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 			exynos_ufs_disable_auto_ctrl_hcc(ufs);
 		exynos_ufs_ungate_clks(ufs);
 
+		phy_notify_pmstate(ufs->phy, PHY_UFS_HIBERN8_EXIT);
+
 		if (ufs->opts & EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER) {
 			static const unsigned int granularity_tbl[] = {
 				1, 4, 8, 16, 32, 100
@@ -1606,6 +1608,8 @@ static void exynos_ufs_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 		exynos_ufs_gate_clks(ufs);
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
 			exynos_ufs_enable_auto_ctrl_hcc(ufs);
+
+		phy_notify_pmstate(ufs->phy, PHY_UFS_HIBERN8_ENTER);
 	}
 }
 

---
base-commit: 4611e0cba12ff5bb64b469cfac129f40f41b5caf
change-id: 20250703-ufs-exynos-phy_notify_pmstate-c0e9db95ac66
prerequisite-change-id: 20250703-phy-notify-pmstate-f02ba5582f65:v2
prerequisite-patch-id: 99070bdd3132b74f7b8932d3d8bef685815a5edd
prerequisite-patch-id: 02cd952ede323864a87816a20e3f6e06b885eab3

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


