Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ADFCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 07:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RLA/DGKm3EXMzePk9BvP8NDtl/YaS8WddbAf4crKqY=; b=bVj/+RuubmaNeBmUXAjArp8c9Q
	ccu7RmXHa6xCM3S3Nu09jUzH7Gb7cRU6g9VboZ7UL9xMDE3RA2VawSKv54QD9bDr4xIxsLo98UYkH
	8UC9uOl12mbTGKIiia7oRJ4FluEfcrZU7INsxB6ixmerRZ1Zi0Jkq8PmjECQuGjIASBaFhYRqzxzi
	YsALTrHo80XbJs1LUykSnqVd7pQBYmrrRnjYRRPc2myyu6duYINgouuvygli+YDhHqjVIjuGJVSH8
	wOGjb7Jq+3lpQxwxCcnWo81voqKhXPyYmkOOoaHDT215tXOm1kOs5Sm+Y+hS1izuwu5Db3VUrdzgp
	ijCCJtGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0vy-000000009Oe-0Mp6;
	Wed, 29 Oct 2025 07:49:30 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0vv-000000009Nw-3zdS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 07:49:29 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso974897b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761724167; x=1762328967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RLA/DGKm3EXMzePk9BvP8NDtl/YaS8WddbAf4crKqY=;
        b=GbhYSG8/tEueKCGyYJRiKOCaaByguOhclK8ISK+c/E8B4IJgsDucWvjuBAxA5baiXx
         zLJjbYCiiq0G2HQg/ibAnQhVU9sNPP402v7gKxhpbDx94Z5oYju7hGhL4SeKfCl9CK6q
         aMwHJiXrR5aLiRCuhesVqPtqNPfzQQAziezsZjowI8PTegUzKHeogbzApBIvTxGUUlnR
         JaxK0NTw8YpKT2HR9z0K15Sn9pZYxdK+kiuH1Nv9BjcBx2/HbcSJ0G/5c4z/iQIaU5sT
         7BBmPsnobu98B4q4D8gtokYjrOHr+M+kTRMfpMhjrnc29iqJCpC5SMrViGGqyy9cU6q3
         Jqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761724167; x=1762328967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RLA/DGKm3EXMzePk9BvP8NDtl/YaS8WddbAf4crKqY=;
        b=wD2L3EbQG+1krPu4GZNVXZWQwGUw0eD9zHsJNCdV5w7tAn4kamlOb8TWc2IBSGYU6u
         H5cEwVloAghoxLWi49dN+vo8Fq+24DDEHWdR7yPfPsFtt2QhU9GZf4KYTX1ajiJv9lq3
         oOF1hqqq8T6ZrOzShrFgN9f8oYZZmUSMNLFm0PNMdMvllVbjdtJMto+ZZMcFUNyEowPF
         Uzvxek9PIxvdD83IQHuhv7SIfCRh5SIAMjJPj53mwzeIxYcGrjYFeu7+n7AAcpo0RjpU
         FwV6za34M8h961/5ZapD6i2TpDZiZ+2MANmDMcoluzQPoXryN9kmfFnFuGOqXae9pv2F
         LbAg==
X-Forwarded-Encrypted: i=1; AJvYcCXj45hOxlV9X8L+4ydBPB7cPCruPNYE1UDghOFZqHrb57d0IjKwy3zF/6qhzTRCSNUu1HnPapq4rAq3QAllT+8i@lists.infradead.org
X-Gm-Message-State: AOJu0YyVhieznDFE8dtEHKhYtOv0nGmJnRwjNjs8uVzkYxC7Bd06iNDI
	E6SLZp/RXEhBa42c06pvRyLVstUIw9GPZFbFH7zeNs1nQlCseFBcl/j9
X-Gm-Gg: ASbGncsraHdhv41ibTe/9q+BYQ9DLm6+VpY3czj3p1mVqAu/LtlwZv7NuB4KvPbF5Wg
	jf1WMF7exvqs3N9b2eNUX69tBGPVZEFgIu16j32YCG+LOY8m7r59rmUXF7sMcN4g4v/qgUr0PPk
	3dMbEB8/qDc0YUxxw16Ep8OMM4jHn9RAqSPAbBE9/qyn9dH44mrMLm/IVEUy5cLQxzhTXaZYIjZ
	Ayukt6I5psp1Q2b9Sdich97JIxhJ7q9F4oJbn68IHGH+WGt17LEbi7isT2R1UkgHjgXk1QsedQS
	POJXSmzAjnHzbuDQCKeYBfvtvk4G7Qipu5PGhBI8xqmIUASY08xDoTaKPL2k3eVUOTNn3MorAs1
	M25PD4dX4QBYrgqfifs/pdY2gs93X4Ii+Ynl7BD9bzOLGPMuwYfAnWz0fgj+XjOK4LDfgTj6oNT
	8gjFYrHNzXtfLR5mbmFQcsRg==
X-Google-Smtp-Source: AGHT+IEjGFYHvTA0394tCrKBxDkPiihw2m2Mpe1BSWvzEwpLa5iv/ijoEfCshocB13qZhqbfk34Zvg==
X-Received: by 2002:a05:6a00:4907:b0:7a4:f552:b524 with SMTP id d2e1a72fcca58-7a4f552b7d3mr1920900b3a.28.1761724166997;
        Wed, 29 Oct 2025 00:49:26 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a41404dddcsm14151864b3a.38.2025.10.29.00.49.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Oct 2025 00:49:26 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/sun4i: Fix device node reference leak in sun4i_tcon_of_get_id_from_port
Date: Wed, 29 Oct 2025 15:49:10 +0800
Message-Id: <20251029074911.19265-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_004928_016079_F040BDBD 
X-CRM114-Status: GOOD (  10.39  )
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

Fix a device node reference leak where the remote endpoint node obtained
by of_graph_get_remote_endpoint() was not being properly released.

Add of_node_put() calls after of_property_read_u32() to fix this.

Fixes: e8d5bbf7f4c4 ("drm/sun4i: tcon: get TCON ID and matching engine with remote endpoint ID")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291d..9214769a2857 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -970,6 +970,7 @@ static int sun4i_tcon_of_get_id_from_port(struct device_node *port)
 			continue;
 
 		ret = of_property_read_u32(remote, "reg", &reg);
+		of_node_put(remote);
 		if (ret)
 			continue;
 
-- 
2.39.5 (Apple Git-154)


