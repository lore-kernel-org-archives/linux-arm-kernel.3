Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D3CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KiQlGZ/C9rse9ilBfNrRdO+ytUNlHw4XOon1PrdZMm4=; b=JvvR1/XPzUus3gIiU74IuXKqoI
	xs0v2INULC7Vcy4BY+d3g3zAhoSHT8M8YcNEGNSjQD9jUQMjHbkqpRJ1A6bQaS3D3gk098EE9pM6I
	/3zKOopczXS68YoOmKTkVJOLJX4Y4oGC4zgER5049uwflsR4Z9kABxZ87vhfUq7I53+GkKpUyWqr5
	HwLiuVcbp+K27aeR9nEmmRVl5NLe/vA1+6/6qg4UUT0vL8l59P/rHegGwJo7HAcDYXV9Vzgb6L4KK
	W1acyjw6lYiFcgE+aOxzbkos9uymTBxqEF+gjndU5zO52EdByiCHYHEk7fnGWxp1KCvaMuRmzo16l
	9iK3TX+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM4A-0000000G3O7-3zVR;
	Fri, 05 Sep 2025 02:20:42 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuHZQ-0000000EaQR-3cAp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 21:32:41 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-805a1931a15so152886085a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 14:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757021559; x=1757626359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KiQlGZ/C9rse9ilBfNrRdO+ytUNlHw4XOon1PrdZMm4=;
        b=VpAgSzL+5bprFraK+AfW1SZ+AvMf1rfSQ1M45QuePzUFcPQamfxcsBVeUYb7WhgcBy
         jLbHWcRk4a3lWYCFu5iN0ECVuraL/iaeir1rxa5DDrlP9RAmV7DD1XyjN3kcvGAi6vCD
         74UXk7W5snrCvUlR65Wlb+Jq43hHd9N4lUUntEUd7S0dvqYeEnnS/fVV0nkWfX/mgDRg
         i0t/ySanr+8G54y8cx+uLRASUeNSr1gBD/Cx2HS1IJrrLZf24oTNM7IM5NYlgqWjXpIY
         E0Nx+P0z1WaiIriqH7phfhaQDyLkQmCjFwxZyFRQKJF+h+let77Y809T+cQoE1iYF0zi
         DVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757021559; x=1757626359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiQlGZ/C9rse9ilBfNrRdO+ytUNlHw4XOon1PrdZMm4=;
        b=fRPd1+YTAx4+1NPIQLJo+/21LoSUmVYLyK4CTGFSJBeoGaGUK/PHC3WPadfP5H1vVe
         oik1qGlF0jsLQV2YYBuE6qm+7vPcX5hJG2s6KiDV7uIbbgZgSeYru4mbeNfvdwODry+V
         dNNvvipLavd1tdZZUqiEylUzvg9JzTvvWndLkJYvNlImgVI5ABQQ1UpINER3hwWQHVkE
         0W05G3SLrIDxuvzr77M6LubLVWZPKGdKJFv/uqyorOBx5iDXdjg7zXN8WK+iUjI8DpB+
         1msDOW/xXwmhzMCPhfUCwn1LMJAuFdHwCMRu8fG2FiCQZs0+WCqeAcFYAFCcN7cu98PC
         SWsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBuZBHar33sEOWk75b1mhdq45lh0WlJHDI2chmmVjD76NgSCfoJywVrZWrB6Iah4wxF+aonLKmPQlOLlExd7Bc@lists.infradead.org
X-Gm-Message-State: AOJu0YxaznJQu04GxbYZnx6o+D/svfoEuyKpdYs/WATsTuQGvdigm6Na
	LvtSCqJ7ET9NLRlXrFXZqBfEMy657J3xpOWodPanIpoA3E8E+wfWelvL
X-Gm-Gg: ASbGncvD9pR17LGSsis9aWMGygX/M+SBPvjhNrUemqMjh6H5oOCoiesy7sndlIgTJc5
	yukBYXdCQQoGmqJYLX4YQ1stKv+nA03yCTn46BYijdpvdmEkBnh2YBPBir5eAtYNQCbxYr0vZYq
	ExwI2ZfiRlJEpWrzzw0rZnqi8Ci2gdsOMNZ+veJpJWD309Ia92VS9vBAp64p/muYYx9/pe96O0W
	OJLVlNycTFE86SU9rJ88C0cM4aNNOvUGEYAtjiOAcHOgQl6WSfk9961jCtsHgqkIGxpfrlP5K0p
	NOt6PK7Jw/HWJGYZI5YZJPJiIjsi6F7fQy9V6R+5PIPLIUY2ZIyP7LPN039u3ZKSRhGshiEiLVT
	feFCbobV/KId6nVrvEtxglmJVv6yG5kbk4C9c7dKIHox01pO00oD8sqhqkQEUumqjEkN6sWQ=
X-Google-Smtp-Source: AGHT+IEX9DX3HrEdBrePkobi7MjVYIUxvz0xv/s17E/klLNvnS90SGZ7neelcaD/b0IshyGCidEOrg==
X-Received: by 2002:a05:620a:3189:b0:80b:4b83:5fae with SMTP id af79cd13be357-80b4b83643dmr863293385a.44.1757021559248;
        Thu, 04 Sep 2025 14:32:39 -0700 (PDT)
Received: from archlinux ([2601:644:8200:acc7::9ec])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f635cbesm35473501cf.5.2025.09.04.14.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 14:32:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 net-next 0/2] net: thunder_bgx: convert fwnode to OF
Date: Thu,  4 Sep 2025 14:32:26 -0700
Message-ID: <20250904213228.8866-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_143240_897621_D2BF94E2 
X-CRM114-Status: UNSURE (   7.10  )
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

NVMEM support addition and fwnode removals in favor of OF

v2: split up patch

Rosen Penev (2):
  net: thunder_bgx: check for MAC probe defer
  net: thunder_bgx: use OF loop instead of fwnode

 .../net/ethernet/cavium/thunder/thunder_bgx.c | 24 ++++++++-----------
 1 file changed, 10 insertions(+), 14 deletions(-)

-- 
2.51.0


