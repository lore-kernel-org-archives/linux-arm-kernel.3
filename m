Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215C7CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoCiVofkihU7HPUi3IX0CnSOHLAMfManJqPdcZxdW10=; b=j+/2OymrG9BTbwCwXKLBKGh1I/
	lIRlpDdI5KQu70qe2yjSONURwP3zQB8kX3agZKPBaeQKFgVflqfe3lQtX6154rEz2YYpJNUUd/Qxz
	9innrMiJuXNeJuG5HnH/lZbDdRe7ZhngsSiKBauBObPh6hjZoZE6HUqVShGo55E9hHYRIrooVYbP7
	h+uBXsaKkcROCuCZYavmlocJD8bdB9n/qztfBRsgnFmRk9x1TupY0m95Q+ts+5LK6aYzcxKD9nJ33
	WE5H4NRaR8Gn/c5xsH4HLiiGBl3UrLIIPGN0TgVtuqZHmfBAw9c6z5teAWsE5DEQIiyDXufpEyi+l
	E/PjkfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCZ-0000000BWih-3j55;
	Sat, 25 Oct 2025 16:33:11 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCY-0000000BWiP-0uXM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:11 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-78e4056623fso32547846d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761409989; x=1762014789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoCiVofkihU7HPUi3IX0CnSOHLAMfManJqPdcZxdW10=;
        b=Xc0k1HwmJ/96BdqhgvJo98CBr7mFB3fu0PbxDUnjH/CnGGSNup3xjjsCYxF2IdL0Y3
         /2aYB/0rilZIyHEbCUy5eoD+i2+SSqs808CNjq7lb5309XCV+vzbmivqn+PT7ed0FPO7
         dvk/m+7YAGrlpXV0q0PknuAqLr+DVTjKdNLAVqemmmynljHpuTK6No+IIqItrtFZhJVZ
         S2/56gyOM4QuwdIjSuUFtFSfMGZjFMOaZ1SGjG6kbElWVNX6akt8QOfORbfyWFdcj/1s
         pZfPPhbKmhm7jsu2dMb9VfKf9wKXuWhYKdeZw44Crivb8YRkdTIAz7H953doaDH5/ipD
         3gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761409989; x=1762014789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoCiVofkihU7HPUi3IX0CnSOHLAMfManJqPdcZxdW10=;
        b=WksSJnjqWkoNeteiXKGiM5zitMly2aocb8eHlOMHx1jLGf/hAwCFXu25uFLZmYhuyS
         QLF8HVc5wdyT+lzOFsgwDeUtFZvI1z6qG5zTnkoW9kH0WeRVwP05afZZUI5Ax8MiI6Du
         5SSVbFx8Lz0jqVeZXwsIUIZwQU7R6GyrvULTCSQ68qECmYWWx3RtIUjF3Sm63tTe2X+a
         qU4RCq31gse9M9w+BWnhaW15SUUA2wnUAnHupyXtDcpdSIWIplsAgnSpZQ4GyuJ7fQ2u
         sQE06dOXyV425Na/4q2SX3BAFXjE+GdaKoG4s5+OZYFy5QN1Aykh0c/dzAno4mCDZ1AU
         RJfA==
X-Forwarded-Encrypted: i=1; AJvYcCX+b0/u4zciRXI+dOBZn2er3Y/ozueulKc/GiOQEHp0BcQW4O7tm7Vl9py+q/BcP+aJVNjalA4scwfpz/Tz7830@lists.infradead.org
X-Gm-Message-State: AOJu0YxItnJUTNyMxdCPFKlLhNa9iW1Nh0xAmNLNScRNlH6GJ/5F2VZt
	RTNR8/5fV+PlrsAjX7Akdj94XG/c1vVx8umsq2y/4B6JxQ+KfeE8Ssqw
X-Gm-Gg: ASbGncsdjJGmnnKjo6hS+XXNx3J5UZCxe1b6L3toFLBeAYi79iVDr/P8aorhU+Td/Us
	2SzNslDH15ZRyY+txlug29f5vsf5qQiHzUYEYTasnQOnrEILfYrWTw0jDUDMdoJYP0JSeCEnFTE
	u0+6yfCWMPIGETUl2yIINUROF8nWn+ztjW1mE1qFjiOexMwiS9EHVfI9QMiMwfSd8+GefnNLanz
	lcv/8Q+fgDQRa1/knzNpTMeRe2nVUUwvN2dapYApvHHSyEWrd5duPyIMoJcx5lZ4SK5Pe048N5f
	q5RHX2ysTmRVr6D1h7RLeLeW/xVyFWOnZs52kyl9tiWdEvz8ahhwztpKYOXzHbA3dCt8V0g9w8k
	exLDqzoYHBsgFVj16lKIpHq2EvWtqoE+J3LSwps9Sf4nS/7kQcL9E5w6Vh/9DE08BnhRZ23TJ
X-Google-Smtp-Source: AGHT+IGH02bA/hRDTKDZFiOYcreM6dX0URruEDzc6HE9hqOeDZU2lVRtUdzNlu49mj64aBg33Sqn1g==
X-Received: by 2002:a05:6214:4e01:b0:87c:21db:cbbe with SMTP id 6a1803df08f44-87c21dbcdfamr369300846d6.26.1761409988610;
        Sat, 25 Oct 2025 09:33:08 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc49ee9a0sm16415796d6.60.2025.10.25.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:08 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 08/21] mfd: drop local BITS() macro
Date: Sat, 25 Oct 2025 12:32:50 -0400
Message-ID: <20251025163305.306787-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093310_278961_9AA8840A 
X-CRM114-Status: UNSURE (   8.75  )
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

Now that generic BITS() is introduced, drop the local one.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/mfd/db8500-prcmu-regs.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mfd/db8500-prcmu-regs.h b/drivers/mfd/db8500-prcmu-regs.h
index 25d2d5966211..c2bbf325efb9 100644
--- a/drivers/mfd/db8500-prcmu-regs.h
+++ b/drivers/mfd/db8500-prcmu-regs.h
@@ -12,9 +12,6 @@
 #ifndef __DB8500_PRCMU_REGS_H
 #define __DB8500_PRCMU_REGS_H
 
-#undef BITS
-#define BITS(_start, _end) ((BIT(_end) - BIT(_start)) + BIT(_end))
-
 #define PRCM_ACLK_MGT		(0x004)
 #define PRCM_SVAMMCSPCLK_MGT	(0x008)
 #define PRCM_SIAMMDSPCLK_MGT	(0x00C)
-- 
2.43.0


