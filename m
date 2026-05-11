Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97870CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 03:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cpyMNVLiIt/MKd5auuA+yMznLxqeT0beCG+PUpZtsJs=; b=hvfzUHkz87bxCGc8zmj5Sw+JyZ
	1/B5cWJsJqtWV9Src29E/20farFtAUoXy56RVpbLEGc4oebFwxym6LhdMjot7Rk7GFYoehA13YmMj
	DR9BIoYm4LTHm9oiWao1X5Nwc99FES0LJdyKnGyP6KAywKCXvvKFTszSBP7nqkfv7w2jwU74LaRvd
	ZDM341d9sTRXQQAlDd4WKCcetWJKFSVR4FYV2KDvu2shSt3QSaP1XjJS9xuY/64FoqJM7sxI4G4n+
	1Mwx9ec3Xb9ojmyopx+yUGTmMN0uHPzeXIokVNTBKEs3X3KxBD6yopmJIy36LO1fC1gfNo0f0TDwo
	jaHFGNDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMH7q-0000000C9Ah-02tF;
	Mon, 11 May 2026 03:16:10 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMH7n-0000000C9AA-154B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 03:16:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2b45cb89f7eso23943755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 20:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469366; x=1779074166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpyMNVLiIt/MKd5auuA+yMznLxqeT0beCG+PUpZtsJs=;
        b=f5ZJzxfv1RChgKkBp80jSONoEDHFHmICndEwCOgORpf1Hvy2QwW18cAeAsR/yNeLjd
         MXLv5zrMQ+q6HDQUmobmq4OJnOJFEq6xvyigxFKu0zq8n82DhURyGptxBc+iXIok3kGT
         tOBCRGLPvasSZjt1zSCP/YyeUnm8CCGbhDZqabU50DGvuC4294z6Ddv59MWCjHClcFOt
         7PX3XGBd68WxQt6e/EhhtNOC7yxDw+OQIXOoMY0iOG3ucrHtSZhCXtd28hIgAwJWQqBS
         /QyBIbCUBPz/9q5x4wiEPEvH14PVGCq7g870IbLZ/6LKzTCovqe8JVt7LvzJmkvQVgww
         BzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469366; x=1779074166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpyMNVLiIt/MKd5auuA+yMznLxqeT0beCG+PUpZtsJs=;
        b=NTu1Gx6bqO9IkDA0SRJJcnYMiJPf4aOL6DU4Nz485sKSYW4Y+zAO2yxLCIEIqfj8IZ
         TbFr+1FH783WMyzOGRHdrgV075lxo8tkL+yyzhYha8y5+37VSmN/7/NyG/k6U0ghsIzx
         UeDJMOT6HgNO2XgvDTvfuB+9Rahdc1luIVVHsZGwYFrtwWXY4rHe+R4gsLAEoJjO5Llu
         vsAEPvh19beHM4UuOLxxrkx+tmtjM0bUaOqehXrPAZNHHKG0zTw06vSPCgb2QsGSCVcg
         p7OD+kDTT+vfBSSyLMhEiIMLDNlu7t8FppQZesgxNIoNd3LYfnR3XkNA9H3Cp0A5LI8Q
         QGCw==
X-Forwarded-Encrypted: i=1; AFNElJ8OQcRkGB08wicHYwcKYYdT3vDkKvyF9jwT/CZJJVXKgVpYZl9JtdicIQ0n2f4mQhCo2tZTm9T+HEbD1uoqfaqZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs41uGKrSuF0jV86QSB+95VRdXt0mKCoPn1K20ThERUSPuxOdS
	P8HK9dkihSA3HtzMLQQici4glP1LW7tkZFy2OzSHuH2bs2kxHbMdEZ+B
X-Gm-Gg: Acq92OFgXnLwmGEPSZDYKwh6dc2e31QHSOQl4480bbDvRlblGoik7dwW3HS9dimDFqj
	3kwIzW83UHt67LWwYbEAUElT2pak0pTwxUB6Ns46fakrJrI0BYESjTcBQvRWWAhn3O9WCEX691w
	upEiytzqXP24L5baEA2vISJbacL4I3vn5ASMS6YA8Br3QZiXfZ3lz7JQw5HU2B9d2TwDwzPTw4D
	UDev5ZhOxYZRsJFibmMwl3qHx0NkyUaQgfTyqnFnE+qEkjnZ5orcxUXT4ZTD4q6qEmKhwe0sSsS
	EaDGU1cDI1xObRZimLfXD/udpvZR8HdXwadJzZofB5itQ7XX15ND3/jmINnB/DElVbTdOe6Qhc5
	dNTW+AojPn/zSk2CUMoBe3D22EriRLs6fjn3aYJoQICyRIDVjZheVxrhO7lgUNbmNtqnz7lqivc
	Hy6cggOGCriKvHCLHVxgeScNLsF3cDbBPeOIs/3ZwViIUil8UtZS/P4h0eZjKyepOBEYolUn4Md
	qrQ5p0Ak51G
X-Received: by 2002:a17:902:f78d:b0:2b0:606b:6fd3 with SMTP id d9443c01a7336-2ba78b30a89mr238596305ad.5.1778469365759;
        Sun, 10 May 2026 20:16:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d26944sm81585935ad.10.2026.05.10.20.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:16:05 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 0/1] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Mon, 11 May 2026 11:15:58 +0800
Message-ID: <20260511031600.31929-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_201607_362524_55F099A5 
X-CRM114-Status: UNSURE (   5.38  )
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

Fix four bugs in the MA35D1 PLL clock driver that cause incorrect
frequency values returned from recalc_rate() and determine_rate().

-- 
2.49.0

