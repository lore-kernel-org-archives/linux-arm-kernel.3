Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15212CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjpCswRNwHm4qDuVXA6p6HddaeayOy1isCVMskpwHjk=; b=vCJ6ukKcGZLmJXD5BK7Dgl+56Q
	AnUas2Q0JSIcU6MWEPyL6Wk84CPbsaYl/twOAYMF4hyphhI2HI1u/2s4kSo4UOp2kLLoCSSiwgM/6
	EwhBRQEIm0f9EHyutDAy0VEnSCjEvKrYFYDq8lBqLRAR2tiOvqtj9++GNuBtjuaHtAII209P+TrPl
	rU07UKJyUM35I7d8Y8HzX/QtlmXSDNPFezzZ3pJLZ1cuEwNHCVYAj+ZJKMnlSQ8v6VA9WkvdQwSBg
	CJAppDg+pcHeJwIX3B7z97s5Hp+/6eNgUVzK2/VxNi7krobManNs1kqJCpVUKU0um1pjSl8sInM6l
	x6D/h0JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uua3M-00000003PJh-3RMz;
	Fri, 05 Sep 2025 17:16:48 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWRB-00000001xUw-2eQI;
	Fri, 05 Sep 2025 13:25:10 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b476c67c5easo1431590a12.0;
        Fri, 05 Sep 2025 06:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757078709; x=1757683509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjpCswRNwHm4qDuVXA6p6HddaeayOy1isCVMskpwHjk=;
        b=Foa5bQkwsomk5HWGXzxJ2jzXZZMckOJ46ThvrI7PH1iZa6JM8XkOIE5Nhk+UOmn+Ed
         SMGh1BwE7YugQsYbRQgEbVkB3JXUPDkJg6Xpi4W1lAiFn6YYxWJAiPaRFO1CZ86u2vAq
         51Q7qXhJQXMScitESwWvxTaxy6cf/Naehe4fKK/aSBFD02YUqUvSUp0PR5U2YXcsd9Zt
         dBe6OQgn2PSnNa5DCMdlhsFnLI21HvB9PWQu3xOiJJ9lFLV6/PRQEwVVqgAIoihU+0st
         E1OC2zuYjOGRwP657BmnVAvAd6G/gZt8Q0z1d03vR5Ns4GvmgdBG6gxV6sucM4gZySfS
         AiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757078709; x=1757683509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjpCswRNwHm4qDuVXA6p6HddaeayOy1isCVMskpwHjk=;
        b=H/imWB/fyKUeB4fXSp0pz3lweIRdtDVy8PSVCJxEd6CnjNVLJHVRTx25PcHUyews9K
         Md1vpknX7MVEYNxCd7e1qk6W5o4v8eVYo5T3cmBiD6ANcp9QZF74zCm41rPT/vt2vfoL
         c6X5ASYJN5epbO7Xh4QMD0YjYmNB4Ajpw469WjaA6uAx+Cf/k3LwKbE9VQnvVyD9NSi4
         KdpShLVCPrcO2LBhs5xQuniUKblqK2tmjE6ImRiJYTalE04u3F5eNv9wAFPrtdQ4WdLY
         BVRrvwB4RhadSslSBcovI5IHDahDiGR9LpMNBAs3HYb7N+s3/yRq+Y340A7X9ksuqHfN
         ZpMg==
X-Forwarded-Encrypted: i=1; AJvYcCU12tugbocgbaTCyaJysw2u+F43A9fotRjSYPQ3BObv03lI8TmAuEwDlIFNWmVSlqJzNfepvY/WVbXeZ/nb4mLl@lists.infradead.org, AJvYcCXz9mOgWnJm1ZVTsfaNXpgOBSLY3lVv+rWZQ9e6GHTSygRK+BM9gDVLkRZuX8+NxZIInSHLuBK/2UHCZS9QSsE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzG9nCzbaAjnoEoJw5NIiwFNQsx2dId/7iQ0bRoaUa/kO87PwBt
	hOHLQV1OFMA1hlj5ijCy7iFFWazXkdNWM4dAZnO2YtRvQ7bFnMBxyJxL
X-Gm-Gg: ASbGnctTrTKWzQ/x9KiCypk6G1dfQELjeXNRDqo1PDyhS6zEQZxx1L55MtFDcYjFOl6
	WZnEN30RPOmpAkYa2NzREMrk6ZGE/RMbHv0YnDCfLX8YvOMfwQsfzOMnpWW0+QGltg+jmfe/7TS
	X/CFtcXe0Vl14LBPmedH7wNyEFiv/M0DDScQFU+MOL2O8Y0BMFlN23fx+zc2Gma3HIao/qfnrFH
	6R8VdDmwFlKb7GqyKlhrDDixvFNCV0iK7U2UTup1/z7IpYJcTZKWwAfx7CstjP5ixYGMsyYMuAn
	9LAfwqL28XfXIZDa35O3M0HmufFGs2rrzyO60yz6SDYhUOj80elvZr5pwRr5sH98eEPXKFxKhAm
	YjUcYJaXrxohTP/5wHVh+Cw==
X-Google-Smtp-Source: AGHT+IGxNwEqchbs6gvhjmUUItnd4HF+uIwOz1yiQdQWl5Efpol8faj87oXSrj9zTsiWjqWAwTJa6g==
X-Received: by 2002:a17:902:ef43:b0:240:ac96:e054 with SMTP id d9443c01a7336-24cef93811fmr39057815ad.23.1757078708668;
        Fri, 05 Sep 2025 06:25:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c8945d8d4sm76447955ad.127.2025.09.05.06.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 06:25:08 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 2/4] dt-bindings: clock: rk3368: add CLK_I2S_8CH_PRE and CLK_I2S_8CH_FRAC
Date: Fri,  5 Sep 2025 21:23:26 +0800
Message-ID: <20250905132328.9859-3-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250905132328.9859-1-cn.liweihao@gmail.com>
References: <20250905132328.9859-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_062509_704684_7B22C16A 
X-CRM114-Status: UNSURE (   8.89  )
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

We need a clock id to assign clock parent when use i2s 8ch as audio
device, CLK_I2S_8CH_FRAC should be CLK_I2S_8CH_PRE parent so we can get
frequency we want.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 include/dt-bindings/clock/rk3368-cru.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/rk3368-cru.h b/include/dt-bindings/clock/rk3368-cru.h
index b951e29069..795e721957 100644
--- a/include/dt-bindings/clock/rk3368-cru.h
+++ b/include/dt-bindings/clock/rk3368-cru.h
@@ -183,6 +183,9 @@
 #define HCLK_BUS		477
 #define HCLK_PERI		478
 
+#define CLK_I2S_8CH_PRE		500
+#define CLK_I2S_8CH_FRAC	501
+
 /* soft-reset indices */
 #define SRST_CORE_B0		0
 #define SRST_CORE_B1		1
-- 
2.39.5


