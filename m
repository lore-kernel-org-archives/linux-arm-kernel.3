Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0931CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 02:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/kA6tgLKUjuyzF92vWnLnuV9dyaiQzrFuN5gzvVQORg=; b=QZmkJpx2s4UljryXEQHb1eyjbm
	X84pHIca24m5obiV0yNp3wgR/1ZxjkWaWMdNtrNjJ040AIo1gIBRZ6mcw72xoNXwT/aPgtv9GUFfU
	xL1v+CT5ysU/T9R7J99t7ME8Om9wWE53obGViN8dHMTW2i4++GYCBVZUViQoU6bqx3+Yc6Xj0zS84
	bVHK1JhvTRi+HJjzVGeOFYFUCLd1yrzLEydjfMOVnW2KdXXpGLqpt+4D5efWKhM5aatHmFfufcS7p
	iKmlrxxqKpI2dM7H96BgxpaQlokbciPx3bXwnC4bRZJ6M4IEEk650uJCL9sXGbGKOnlu+zBP288S9
	rGQ96xHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAMB-0000000HUb1-2GnY;
	Tue, 19 May 2026 02:38:55 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPAM7-0000000HUZg-1vNi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 02:38:52 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3680540a6efso1515637a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 19:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779158330; x=1779763130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kA6tgLKUjuyzF92vWnLnuV9dyaiQzrFuN5gzvVQORg=;
        b=WUGst5rIb588U8MlQ4g7T6KYKwkIjFIrrFngCabIrWN7iHjWCWXpgFjS2L9J4HOdGu
         CYhcqo/en8I8EffDSOG10msjb4vOAbxRvPVkC0t6IVCShvK66v2WvGBhC7s9tIegfCgg
         2F/RnXH0FRRloBK92E0kyzzuYn39JoApHt+LKQEV/vMyfiQw4NDOF9YREhCb/eT90EPb
         tg2T3QYX9Fs05R57aNZAwARI7P5+2e/7udGxabsfrMNoESAZIRiA/+UxAtvSgOBFREHK
         Xa2bCHwt5N51pIuIyNiZujD+618lG0f8wgCxFMDXhSZqHr14TiryUvZRnhlzpoLZ6Fic
         KnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779158330; x=1779763130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/kA6tgLKUjuyzF92vWnLnuV9dyaiQzrFuN5gzvVQORg=;
        b=m5zclD3PmUmp6K2rkD+yeIBSLGHLZnqN16UOZ6SZIMF856XNAhQwEeNAU61qbD6KTq
         I6hRZ9qVZPPSzNFkK/+nFtx1AsVnh94/FTUSKXTv5yEFWxLD+R02Cz9x6HiydKN+7+E8
         wnsDUSRmObeBOOFoLzslL5uO1V0YC4OcNZEFWnfvg+tdZAM+nmUGcwFdGQ5bMA2spZCb
         bSgvKkf98yv3NMExufKzImxGsctSdXcMHVsnrsbpISsSqmbX7059w5YxRCzjditl/9XZ
         pAolBKErZrnKNJwZJnswOJS+mip+QB/3pJFsNBx9nEl+1faKXHXudCI2GmfL0bho5wfw
         MzXw==
X-Forwarded-Encrypted: i=1; AFNElJ9o6OG88jy/FcIHaBs6EzMEuD5q2YLsn5hefWW3qiBASPjbiTH3pxQPPveux4k6Stb+rKbsd5IQmvfMXPTwGPo9@lists.infradead.org
X-Gm-Message-State: AOJu0YzZVASH1W0zIbjV5vsBw27Nni1KWuHplpId5nbv4LrY33cfkkdX
	9fkI4fN9XL9hLNnysBA7rYcL1jY+jEY8PMhh0t1BwBXuFcI1/m83y7aT
X-Gm-Gg: Acq92OEnKlw6QpfSE8ka74ifJON4KviVmOCMq/Y68yMu7MGMhJW2qDppgcrUkNs/+Ze
	kS277om6HpknugS/4T2lnqAMZbuMaGIYiAH4Fa1le49pLM7Bukqz02tXMlqow2DQRvIcUIUIebi
	KgF1TJrj/dheb9T/MJbwDfxepGwyO0mZ9uIeDK7WvK10LFeJpAkX+P1SagC0z3DfOUaWfaXMgfH
	rbjGMx9ic+fynbO42Jky4OO4Ekx3c3PSznksx1Pbn3ysnlYXTJpSHEN4ZxQvi8bqJA3b+6beSYO
	bJqzsLYneQ9dOD0NrX2izJf3I6dz5AcfYbEfimnL3x4CDN2EPTQWCdG1MfBM4YsbPHJ78Lazh9v
	TNsS9TjtP2/7VLt2geXsRFUjvJImQsK6Qb/HOTmoEwAl2vOvS38AA5+4iUsc0ixgSnFx9edZMQN
	ayttvMrWVxN+10eRgf/cqTcbOODxLxm31XXDnz5kUJxcQPeEgoR4xQKNy2LyN8tBOeUQ0jFMDSH
	VkJWkxdPLY8yQ==
X-Received: by 2002:a17:90b:260b:b0:365:f8fc:3846 with SMTP id 98e67ed59e1d1-36951b87209mr18957919a91.22.1779158330480;
        Mon, 18 May 2026 19:38:50 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695124601asm12407713a91.2.2026.05.18.19.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:38:50 -0700 (PDT)
From: Neil Cheng <neilcheng0417@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Neil Cheng <neilcheng0417@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add Meta Rainiera6 board
Date: Tue, 19 May 2026 10:38:37 +0800
Message-Id: <1849ce935900a4766823e2eed87789a154426553.1779157117.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779157117.git.neilcheng0417@gmail.com>
References: <cover.1779157117.git.neilcheng0417@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_193851_499416_3D94FD44 
X-CRM114-Status: UNSURE (   9.82  )
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

Document the new compatibles used on Meta Rainiera6.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Cheng <neilcheng0417@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..1a2252eb08f1 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -95,6 +95,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,rainiera6-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
-- 
2.25.1


