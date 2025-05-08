Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDB4C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 03:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BDD4yNEsjszfNYx9lT8DUsAY8Oe7hO3jU9PQmGvxdp8=; b=ztHZVRnTqRaqQYODkWBF59BZAY
	u41uhEfhEqH4UUtbhopbCqxMSgnmhSvWmGgcYqkEEWMPgaoDj+O3FB1lVx9t9QkObkVUYTfg7V9+Y
	+LBpxZgft+5rd3Qi1NLhnbspWXCVUJOnUpT8iRSBUlkY6OQNMJxx6XvmJk4q6KDi6PfGMZSyZevX+
	uqpdEQs4UFM59wj3j7H5UolQIGVglQk7x7zAA4K90m8JnnVt8RNzA19q7BKKmNCAX04LtVq7FUqOR
	DSTN6kI9o590Qb2c0lIanSDBPW5ajTxHtpsQY8HhpTbAc0MFYRxdUgHemZUBVNYm1rwLIqzh+DJIY
	oH51FpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCs34-0000000HEAh-0QaV;
	Thu, 08 May 2025 03:35:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCs11-0000000HDvi-1LI6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 03:33:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22fa414c478so1291465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 20:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746675222; x=1747280022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDD4yNEsjszfNYx9lT8DUsAY8Oe7hO3jU9PQmGvxdp8=;
        b=PxyYDIe965r1QIkG9kW/ftvd7mTr24FG8JbSgvCb4NB6qRUOJN2vfNvWGHXZ1GC0UE
         pwNInbuJrNLOFfrRofqOoQSMLq/CqnnDZfLmFIEdCNFmUDI3670Hc/yYFXd5Fi0wOetk
         rFg1Q6BZyPDEvmtf8lGwE1ZbZAMY/mz9cnLpnxHmFZFKIF5Nlx2QiDm82E4hsdyuE7kx
         gnRoXIo9xCbEcrA/D86bnpe/c+qAQ3i+J2QbvPH+1UqOCDD7Ua9r/RmcC/UbMM67o6cj
         glwLjuABrejriSYXJ86O1NQhziKtYMDqR/xoJVlWsHqLwq2fRn8COwv6CzWh6wmiEE5F
         Dgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746675222; x=1747280022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDD4yNEsjszfNYx9lT8DUsAY8Oe7hO3jU9PQmGvxdp8=;
        b=BKK56V8yNm1fqd/9+3FzUaLhrNYI95ky7sreYF1dM5vM1R5BU3MZoro48Not7cCHCx
         AbV11DkAmwFJsD1FUr/LA7LN28B0I+LZebstosC52jvOZYu3c32c+WtVyqHqt2FbMNwi
         WqL54SsBILmgR9ndHLdgffVw9O7zfeWvpX9MTcRAziJVYpQsblOhm2jsh5Sit7OCzxHN
         sroxVlo7smoBIwEfWpdMtD1oqLTovv/NG3Kf2O3U34+qD9aT0xCB8LpFZ1xoyIoo4BNV
         nKDgBT5yXPmlDlY3zT/85oz8sVGA1ZkM/Hz3THoJOJ6ZRfAWuFV03YkliqqR5DL1pcQa
         EL8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVF8MzrRlLPbmu0fdtmFYA/DuWzbntFDOYoGHKmgK6oO/1ekERyGL00//CATA8u4Q3K7kd2uHhhPhmKTmOv/xjE@lists.infradead.org
X-Gm-Message-State: AOJu0YwZd9VpgumTZdbuTXj9cqJbidzIR5P3x0VECjAWSeA0FuvxVfjJ
	pIUxDGe6bstbERu+qB+AGedNS+Zt5ESNYvKStPD6jZuZF3ILPxCD
X-Gm-Gg: ASbGncvrWDcr7YdBdVIDSEcitP07So8WLg1OmcV0jiowFGCpilg+2b3zrxw8DY8ihNH
	Ga0tZm/Lt9cs2rLXBW5d70CN5WSpoDwl9d2IatBTYS+S8o7ozgX9r0UMD1zt8F/TOoJtdv/rKVU
	lsiYH33r9+Y75qyXOyCrP6gZnBsS4WdHqcnI/yi2eTHZDesmbp5oLuQbGGPEYIavsOc9AvniWwz
	IHkQvhqsFKgx9WxY4wb+OqvhE5ZwGRCmTnrndj114wvrASoqyxQvNg2rPQuOxWeVmHFhGvIZYoB
	X6oOvbasHoQhFGLW6sQYuDZpauO6sjRCQxcSSA7ehdfboczViUOWYXgAJl05GQSOiwFUED3FoAU
	KZLSov6g+61OK
X-Google-Smtp-Source: AGHT+IFDlLNJXygEF1m8UuwcdjVPwP+2wnjTRA4umRjmVjJvM/vrOQRs5VsFbED/owDgYFVHwooruw==
X-Received: by 2002:a17:903:19c7:b0:220:eade:d77e with SMTP id d9443c01a7336-22e5eddc7c8mr95430005ad.40.1746675222059;
        Wed, 07 May 2025 20:33:42 -0700 (PDT)
Received: from KERNELXING-MB0.tencent.com ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ffdsm101685265ad.179.2025.05.07.20.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 20:33:41 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: irusskikh@marvell.com,
	andrew+netdev@lunn.ch,
	bharat@chelsio.com,
	ayush.sawal@chelsio.com,
	horatiu.vultur@microchip.com,
	UNGLinuxDriver@microchip.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sgoutham@marvell.com,
	willemb@google.com
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: [PATCH net-next v1 0/4] misc drivers' sw timestamp changes
Date: Thu,  8 May 2025 11:33:24 +0800
Message-Id: <20250508033328.12507-1-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_203343_359970_07A6BF36 
X-CRM114-Status: UNSURE (   7.76  )
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

From: Jason Xing <kernelxing@tencent.com>

I filtered more than 100 drivers and only modified four outstanding
drivers among them because the software timestamp generation is
too early. The idea of this series is derived from the brief talk[1]
with Willem. In conclusion, this series makes the generation of software
timestamp near/before kicking the doorbell for drivers.

[1]: https://lore.kernel.org/all/681b9d2210879_1f6aad294bc@willemb.c.googlers.com.notmuch/

Jason Xing (4):
  net: atlantic: generate software timestamp just before the doorbell
  net: cxgb4: generate software timestamp just before the doorbell
  net: stmmac: generate software timestamp just before the doorbell
  net: lan966x: generate software timestamp just before the doorbell

 drivers/net/ethernet/aquantia/atlantic/aq_main.c            | 1 -
 drivers/net/ethernet/aquantia/atlantic/aq_nic.c             | 2 ++
 drivers/net/ethernet/chelsio/cxgb4/sge.c                    | 5 ++---
 .../net/ethernet/chelsio/inline_crypto/ch_ktls/chcr_ktls.c  | 2 +-
 drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c           | 6 ++----
 6 files changed, 8 insertions(+), 10 deletions(-)

-- 
2.43.5


