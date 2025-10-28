Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C46CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 03:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q7Dr88n0rsMeY0SbLXIpFyJggBzx8goTlgYQ7zbZXXM=; b=ZRO4Yhbyqs4wt7EY4yQyYfA+tz
	mj1p6Xk2BoOGZM23USMlyiXAbMeCtPiR+o2bSAQ9Pcs7h0d7vND6aJBl9kxdvpKMkLw/quF7sP51N
	Imh95cV+SsLtHYVh1Qc7N0s+ZhceVun5i5zQgRc2zCGg+qjYW438FvPIcaKOoonfyfiybAoR1jNjG
	3Yxq3EPbGuQmkpxZZSxAGYTDFGSvvbbETJzS46G1Jx9rcCtELjAWQGRaAFCOMz8lN8fP+eMkizE/n
	zdLudyq1K+TxC2dg3FT+Sda+tEdqfbdfb5bQVFsQ974ippc5oKmi9uoh595X500kc33rio0jgLfLv
	QV0qW//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDaCR-0000000F9lJ-1gH4;
	Tue, 28 Oct 2025 03:16:43 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDaCO-0000000F9kg-0j2s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 03:16:42 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-77f67ba775aso6792933b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 20:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761621399; x=1762226199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7Dr88n0rsMeY0SbLXIpFyJggBzx8goTlgYQ7zbZXXM=;
        b=dQ+mk8n5d0TgfiGgkY+gzgYxzZyZ39ynd2YKyHOeMKiruRBH+byJTASuy2Vbt5GsFg
         rvm5OzFijsvNJCEoyfEWD35r2VjnjJ5htSHce9ZvzwOzw3jZnORhoA1NcXEN+GQCmj5J
         GVHf4IkXauIfnZzj+7jKpME5q6JfIal+JVkh6/2eQQccXkJYLR9O8c9um2jQaMBIophy
         Zr8Py6IMJM+pBQ25313ENP684K70CTWwlU9NyUtiqWar/cAtVBs/Cju1g9yz/Zb2tLjU
         NWTBqxIHjbesiX0KhAumvC17w6zxRyTkTzq7hS6ahUYL6rJuBbnTyb2u30rqZdeMz+wr
         uz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761621399; x=1762226199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7Dr88n0rsMeY0SbLXIpFyJggBzx8goTlgYQ7zbZXXM=;
        b=JYfoC7yvPqVCYKXcZcdEqefbWF7rKRcpkYqEfpxryKLTlUr3ZVmCjSbJevzZy6OyVn
         Mi7TcperoNwYFwcQCsEAVgjNzDhK3jYMF1OWDPQf/NvSMMW++lEdP2vujx0lQeNuj02Z
         gMJbHkFaNF9p6YH99ZUXg4wWXP0L8J0owCgW4+CUpN1w85p0dIDClCwfwWPhy/jN6loB
         SKhRTa/JXIljSleSvVNNX46ojHuYGg590whLJgEa+iB/xqfgzUmp6dRDNZnhI7DEtLzD
         oE2uQOzCy7Z5ap0+dRCJORCCHCJAh8vVsd0j9KABv9FfPnQD2CnEjAXF7ugWkStcJxXZ
         Vlnw==
X-Forwarded-Encrypted: i=1; AJvYcCUBvrgBUq8EWoUkJpI1Zs+kQRd0Tu2E8dzc6Ua8kb7SARhAaRHv/hImx226mvFTTJUTGaSHX6lQr3yKwwbe8Avt@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4VtfOjerSETQdqJgTcTK3Qqr63tZYPPme2iqvmUuD3J1K9kO+
	vGUg3EIc30VVnJNPe9OAshtzDuPc3ZtMPFOMjqn0B1GLcS4XKOCsUUKH
X-Gm-Gg: ASbGnctx/2T+qfB/FE9UsVP5xcml2+GUWZM/KVsCG6oXruHOK4U5hWJiECGd0KNN2Hn
	rmof/KG9N9UC/hAUPZ+3gETu1SI5hCu0f11RIMu+anc8GIqy7vYhU6UpFGk3aygHR3AZWBaGdY8
	yTO6AYqtFp3aml0VWzSl/iqNeDNSfRgeczoWz99klVSMWLgmwBNtAECbukr2YC+DusF5hIbixW4
	jOUB7jkyGS6J+7hCjUvqWracSd7vlk8jdCuDEB21B54DN5UXouomyTLndHzcwx/20UQNXGk8SVp
	bOqOS3iQMLF9JFEcYntl6Yn2vyHgqmZGD8PFWdsvCIuZEyUeZSEQ6bVBJ5897yL90eIA5ZX8cMf
	NlwDaYzHJ2J6IxWP4cegtmuASqFfVPa+UMAzdzS34riEELxsp8/64JN67YMbsuJcuCUNVXBwrPa
	1F4MJWvoRuHbETlVMvB1uj5Q==
X-Google-Smtp-Source: AGHT+IGeeElAGdz52QvzDON6TZ6X2VN+9KdN3tRsb9MvpzKrX+azsLuImQoCuSHnyIB4CWg/XHY7mQ==
X-Received: by 2002:a05:6a00:c8d:b0:7a2:6b48:5359 with SMTP id d2e1a72fcca58-7a441c46a7cmr2594121b3a.24.1761621399271;
        Mon, 27 Oct 2025 20:16:39 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a41408c4dfsm9818276b3a.65.2025.10.27.20.16.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Oct 2025 20:16:38 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] soc: imx: gpc: fix reference count leak in imx_gpc_remove
Date: Tue, 28 Oct 2025 11:16:20 +0800
Message-Id: <20251028031623.43284-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_201640_216647_2671FBAF 
X-CRM114-Status: GOOD (  12.73  )
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

of_get_child_by_name() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: 721cabf6c660 ("soc: imx: move PGC handling to a new GPC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/pmdomain/imx/gpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index 33991f3c6b55..a34b260274f7 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -536,6 +536,8 @@ static void imx_gpc_remove(struct platform_device *pdev)
 			return;
 		}
 	}
+
+	of_node_put(pgc_node);
 }
 
 static struct platform_driver imx_gpc_driver = {
-- 
2.39.5 (Apple Git-154)


