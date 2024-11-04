Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED5DD132A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0x8YfzKgLTDDx7pLL9ZIfdpCd48D9g1TybgGh/+DyxA=; b=zQH8nxYS8tfXKLg9ANZpHCKcxR
	NPrFyIPVfN+c/GJ5YOxy8i+fUVDZ+qMKTEo8gf/Q580W+pP+R5w9DMtrvOMt8j1mOoSkq2HjV7rsp
	3Y1I7IdvumrO7hF/r2XbPRydpiuZe3IjBNZQCNSzu5yfn0VWQaPu39vKNP8HOSkM29+baQcQ78BtE
	5dV0lbwG1/EYVL1Nkxp3L61IMhhBWRITLFxr9rYpGpumzQWUaTdQmiO+GF4KTSyA9gBBYDKJCaDqs
	Ock6wm8hV6CHIup56D3WKeF7gmYPDbbfok+ZQMuG/8OeWgKUAgbzMfJxDncK2PIpI4PqLTgfkztPE
	Bca22pXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tL2-0000000D9GE-34AE;
	Mon, 04 Nov 2024 09:25:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tIC-0000000D8k4-1gZW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:22:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so30793595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 01:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1730712154; x=1731316954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0x8YfzKgLTDDx7pLL9ZIfdpCd48D9g1TybgGh/+DyxA=;
        b=JKBP9EUBHFCgnoTFQpbtRRUXbCfoVpA/k2XjKxmhHlAmdYI1+7T3tDBDmX76ZiMIve
         nkrB81foiml2C8qKrlgL5f2u0Ri7zDnl2To5zChMVqjse3mVfx/1LsqWzHX8Lu5VeLe9
         OULbnsf0O2ErUcIhUhD3eeMWlHxTOSbUpJCEu1dS+7Mv2KcOzhsj3ZX9GDnNqtkEHFoN
         RRD48D1CKTTfFoxJY6UrbItnhRaa6mK9zV9G7i4BotMbinqtkJCMn7SCdS8S+YKWXTxe
         8aY/X7cS0fJBmeceoF7Vy+2J6VLQ9Tm4hNOKrHuH1PhT+kc2K1hC2Mijyo7tqOvCRzZJ
         gC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730712154; x=1731316954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0x8YfzKgLTDDx7pLL9ZIfdpCd48D9g1TybgGh/+DyxA=;
        b=T3PxaeUMlB/uTA9bt8DKY9rAaLSP7xzGA/a7kbSnxvuXv0WttycCZ0cRFIvteCcZmK
         15rxr7agCOE3YqaGUfPTv+ARQbU2z0PqvzEjxq2fv7oONP8SqU8m5pc2UhKYMxXzslIQ
         Q5TF7NZp+BM9QEerngf8Iz7THvwrmMTQllR4hlkn3q/R5JExHdKrLvy7oYVlp2PVKsgP
         ZZxmOcKPdGWFwSz4E7zDtJ3SPmZ9kj+G6MbVpZ0FW3rxd/yvgECPtWVuXQ5SQX7RotqO
         Ueo00LtmCqbS57zHwDLPAGGvjKVn0N8dInx8yQDEcLc1zsFiggu/K+hVkie5GmV1I0IN
         lu4A==
X-Forwarded-Encrypted: i=1; AJvYcCWW6GZaN6fn9dkokrhO1/RAL3hk2KdKppIV8XW+HiXyqiwko5R5xkqK5QCBx+T8KSKPt+5uZkQ+5hJgKy4jXyy9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw7EegZG/CJLNmShrldM/b85zWsR+MFsPeegmIrSlm3djNMJ6P
	xc02BnsBAW9VB8z5BIIHhSMT9gszSp1iYZnkyP2367+rZWPzCzL8kjf9v1lMxtE=
X-Google-Smtp-Source: AGHT+IEP9RuCeHmDYOOToxOTcWwGxpvwDvs0FtYDNiDwDu9dBrotM0xovdSu4CmO4Yn3WMu3dC2yrw==
X-Received: by 2002:a05:6000:18a7:b0:37d:45ab:422b with SMTP id ffacd0b85a97d-381b708b694mr15447460f8f.31.1730712154262;
        Mon, 04 Nov 2024 01:22:34 -0800 (PST)
Received: from stroh80.lab.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116a781sm12744872f8f.96.2024.11.04.01.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 01:22:33 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	sylv@sylv.io,
	linux-hwmon@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Naresh Solanki <naresh.solanki@9elements.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Date: Mon,  4 Nov 2024 14:52:14 +0530
Message-ID: <20241104092220.2268805-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_012236_585152_66960E46 
X-CRM114-Status: UNSURE (   9.19  )
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

Document the new compatibles used on IBM SBP1.

Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in V4:
- Retain Acked-by from v2.
- Fix alphabetic order
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2f92b8ab08fa..c79c74ab3d78 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -91,6 +91,7 @@ properties:
               - ibm,everest-bmc
               - ibm,fuji-bmc
               - ibm,rainier-bmc
+              - ibm,sbp1-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
               - inventec,starscream-bmc

base-commit: 30a984c0c9d8c631cc135280f83c441d50096b6d
-- 
2.42.0


