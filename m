Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A4DC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0l36qpCnDAhRnaTWedEaUZwbfvZPD7EM2qytUdMEXlk=; b=KjmYfcNN6SMzgmrJ2TYyFbgsl2
	IEF6YGo/g6ALigYdo+rCUoCIcraBsEwJ6dqHsGKpoMRbHTNoIqM80amGw/LUfvh4n2BVYBLC0pXmu
	f2SbTZgY4kBdP7BV63BCi8QJKs4NojYC/W54NeGsN98BfiyeoocCW/CkMmIUqQ/GT1hxQfxJhBRoG
	60sVjZ5cINqN0R1J1VcLufBHDhzaI4ItrYWaEVMblniRbkFcIK9SUIhq83nTZ9nL5q+gUUfA1/Ue/
	WRr8XlXdSxOdMb9k3yHxv9sWbmARbvGgOCpzDjQUygsIB36FW96b2KCRfNaGoUgwOVdwPjhGgv5OF
	2vjNrH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqdz-0000000Cc6y-2F37;
	Tue, 13 May 2025 14:30:07 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqXn-0000000CbF1-0Q9Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:23:44 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4c4fa0bfca2so2240626137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747146222; x=1747751022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0l36qpCnDAhRnaTWedEaUZwbfvZPD7EM2qytUdMEXlk=;
        b=ggShowtEGK9IlL+ScR1VSUZ1FCipeUYKh532WH+JBngHl0cGrvDRWl3I7fZSHyhW5d
         uKiBNrgOYbmbJysmqiINRVeHrwuS9UUI5XlUVm/YOuUMqHI+CA9DZU5dFAXyTf5+VXZ3
         M1JagzQxRlGKuiT2m/eytlKXzoEon87GKJBW64GZFXcmJoA9ATxfUd7UOByGYgM94Ny/
         SuOMOf85ZnL+4X06wBNfWIsr53sBwjaj6boRFm9dUS2onMUsFyulduVklPNjquifN+Fk
         hSoymmRCJGzqn8rENIVBYo9xV7V5nscuM/K/t+uGyIUsYlZon+3mzxZbtbzSft6qKroq
         +dGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146222; x=1747751022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0l36qpCnDAhRnaTWedEaUZwbfvZPD7EM2qytUdMEXlk=;
        b=iMCNw/2ytZMhlacFGnp9HdMP0TkA8ApqXhwgpV9wc6/TgsRJzd/hILMsFUWCwYLcb3
         XFDKs7IA8B+cqVtfHAntioG6tDC0eNynTfyPaJ8f2FXCSsAkiKyjYrwET932OQ7JWa+d
         0XeGle49/y1SXB9fM3O3C9InlCw9lFlRR8wbYoX6nXoEQNnWl8CU9eEq+Tp/nk5enuBj
         iXG1Nqh9t0d/BFO/3+qEECY82tsy2QQ6GLMD2zUaa7lkVgoBe0q2P0NYdFgN5hWNMdOJ
         ULwrebp30r7+fW24b+p7tWSMaBX58Bs4mh2O9hCBcdS8EKkwkjol2smFyGHtkhVPkAWC
         Wdlg==
X-Forwarded-Encrypted: i=1; AJvYcCVx8X++YUqeZLYqL8BrPjB0ShNZGRzGdFahw/l7Hjxi7nkx97+iqyZLLPHx0zkcJw/M8uDRRvTskQIxlseKCaDn@lists.infradead.org
X-Gm-Message-State: AOJu0YzWfWhMfloG7rgGHhasrZSQDxunFtCz43lFOZCqR0GT5m77jzM7
	G4qzn/cwKncuSqJdhgKwjKYVMB+2OxFOyYr7/fKMVFjlkw33+fSW
X-Gm-Gg: ASbGncv3CKUue5EVdcu7If8Y8cR9V9/3LC8C3CVnmVN01FYBqKLQImRExqKmPl3iUqb
	0ykOrCgFvSDF5j3eJRUXG/FPP2UkB/Xj1DQ4VsSbVya2VIcnjeCG8nPMaQyTB8rFN7S77rYcvzC
	1MJoqiA2CPKaNWezxxQk3H564SFqAXzxuh6MAk++5r78owcYCjYOJnKgQi9MeAL6mMETUuy2GYm
	4WmnEEzlrMlvMFxcUXesFkLvixrnlx5nKgNyfnD0faLK2JOA4k94+Nn+b+i9vM2KdDqQJ7RenOb
	vK4dqtkwUpAfjy0oPW4K/KEVwHOoIM2WRqxbUdequRFaTvh4zrZxHNa91bXH7H9eXA==
X-Google-Smtp-Source: AGHT+IEPnMB4IboXCa/1FdqFHavEmkJxVozv+Io0Cs9hnebsXUci5GmVrdypDMhC+ZsSI0YngK2PIg==
X-Received: by 2002:a67:e7cc:0:b0:4dd:ab6c:765a with SMTP id ada2fe7eead31-4deed36dc90mr14572810137.12.1747146221656;
        Tue, 13 May 2025 07:23:41 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5c18:acd6:b894:dc8f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4deb203c26bsm6630965137.27.2025.05.13.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:23:41 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] ARM: imx_v6_v7_defconfig: Select BT_HCIUART_BCM
Date: Tue, 13 May 2025 11:23:20 -0300
Message-Id: <20250513142320.4036324-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513142320.4036324-1-festevam@gmail.com>
References: <20250513142320.4036324-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_072343_138539_5B642A3A 
X-CRM114-Status: UNSURE (   9.18  )
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

Select BT_HCIUART_BCM so that Bluetooth can work by default on a
imx7s-warp board with a BCM43455 Wifi/Bluetooth chip.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 062c1eb8dd60..6f62d2e96239 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -68,6 +68,7 @@ CONFIG_BT=y
 CONFIG_BT_BNEP=m
 CONFIG_BT_HCIUART=y
 CONFIG_BT_HCIUART_LL=y
+CONFIG_BT_HCIUART_BCM=y
 CONFIG_BT_NXPUART=m
 CONFIG_CFG80211=y
 CONFIG_CFG80211_WEXT=y
-- 
2.34.1


