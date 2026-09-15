Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34394C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLWSmlyXJzRPOS1GeQ3EyJF1epHoFNqr/jbcGqxOmCY=; b=bfRioMdC549pQEhYQzJb6McWop
	6jHNko5ZM8oFqPFnggIDLz0yiIb/PgBWnoOdkSHJJzHT9SPLZG9YYOXxNwvqSLb6nVg9iMQqCOzjo
	bywbMnh9sftcsLkK0GvF1RwMnoxtCnhCHmHY7PVk98Wu2hCYqeYkwei+szJkUKPtOdimaPBq/3Q3f
	pIQjsvEECKceRo2+W88mT2DNb5/OQYtRxdtJH5MZcMmHfm3LwOHNMoihcxqvxm/kwhdvGUnt+gyph
	ldx8L7XRdsush9syJUsjYSuGedbpQR/JD+ZkjJy0Mtk6ds/8xN7ui0MW3/3mk6q57b2W2czx3EDEM
	8piyMc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4D-00000005ioM-2Ulc;
	Tue, 15 Sep 2026 09:03:05 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P48-00000005iib-18Z0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:03:01 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c294af0caa8so6161966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462979; x=1790067779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLWSmlyXJzRPOS1GeQ3EyJF1epHoFNqr/jbcGqxOmCY=;
        b=ShFSqJVQmyuuXiIIXrALM6aXvdaRmcDxUawKxVPDDDx4xbi/FmXf87JTD39+uTNguA
         MipyuiPr+/FELboK1KAyFRtQYDt24D1qkzbk5xsvs/0h3nRh1PDZQ5BTwNVh1GD+VzYQ
         6xhOSNLl1CJZ84uZFkbywjgCK1NnE9SQ9Yqo2bOo6HwfF6dJMf6kTntH7+qQGczjd4FV
         FnUse+FuviCXfHH1lPp8jsCPcM5ke62xNGXF+JLCFo2EpmDTmutezbKfbFLVOTwWtHg0
         eZm/b1rGaJmKCCA0pTTUCUcMBIzRL555sZjlnXp8ZNloALnksfoF/54qygA14d2L3OuT
         7+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462979; x=1790067779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLWSmlyXJzRPOS1GeQ3EyJF1epHoFNqr/jbcGqxOmCY=;
        b=dzyLq8+sRqVqaPolvk+K2xYTSlFFxgeO8k8/Yxe4Wst6hE0scGPo2iDBc2QvRI1Nde
         5GJK/ywNJcDXcf3gJPAN54H0zTHubWnzSxY6K+aYFbjNDmUttReG/ZDd+4eLjlDw62Ue
         auQrVOj+IoaLixSQE8bQ2jXu+rBEucIs5W8hAa2Mswne0m+1wXneArdMxJoP6FPZkjVC
         l1uz97aify/Zej8SW8GjG9GXwtrejFlgthseRxg0I/lMMl02zhb6Vm2L1CTHFjXylSii
         HJHiiL9b61ceGDk92ASj1AA5MPwZNeA6Om6PGrtkn6Ulw0ApL8eTWNKEY+qFDGL7u73u
         wT9A==
X-Forwarded-Encrypted: i=1; AKwUvBzjCAMDNBF4/m9HVCl4tbeiNQvvYP+f/QV9YRzl/dNE5ijbxqILa4a08LdSp/utdP2uDUyk5DK6CCiUTuPyggwV@lists.infradead.org
X-Gm-Message-State: AFuF++kwhq7Vee8dqIGB18dSqO8iNt1cabC8G7ShTXTv7NfSLdJlf6M6
	06IwDH8eQRyK0NvX+jYoi8YoS4HWQ05yXObiIZNbRnpuyyqNsPYv38f0
X-Gm-Gg: AYBFou0B/U5dGQ0qpBY4zKI4XfTwepdZJg7eptj1sGiXomYbQHJG6WZHZpvLjFXyAHB
	eFeUR8lT/LnBbC6/3TB+QuN3jT615eDWBrYJR7bVbyVRMFFu4WgUiBrxO2nXiDIlpfWRoU6+CZD
	MB8/JncRVHP4XBzcSBii8nq0h5m/5+BH0Mh8mXR2E0lySa29EmHimvwFzPW63u+W5MdKNIXTFVh
	znODCId5P7gQWGO47f1VD09asPm7KGy6QCOBD3pLLkzo487O6x4Xher/XSzzci1G5rvvQISslLr
	TProDB/agYvjZ8Q1sEAKf3jUvlAM3gfwbFquXTggYHBE3+VS/GRRei6FTZOFcPbhbO93Apvoo5n
	hKbHxh2qXZQ8+ojeo99Asl1baieY4J45UC3YFxQxb/KVSBAkY1+rUn7mahZiV/wZmCs+vcK29PG
	cWTQlZFYFhCf+/bHZsqkln0nQ4AWS8n19b4DH1Wp9qw3MbBPM8eXjUuraJKj/LL03Ye+vU+9xjg
	bT7swMaymNsJXoaSUUoVks0ig48P84L8hWMf5xHYs4xerPdbD+rGHDnKxTWKVkj40ZgDHi/T9cG
	p8zLMox428Zig5ligKhGzs92txt+1N5k+EpdKAa1YKThyC4hh2eiCy0b9XpgY4GTjX78F58mWx5
	yRRyxHdM0OImW2ArCZ6GX54fz/qhCKI9ogXizafqdr8KkLhE1X5/+t1nWTYWRMyTn9B483kLYKQ
	dgyfpewZtAFCSY6MZ+BcBd2NyhThAebLloWiEBzVxoOzyInX5kkToRi9Lnv5Ok1XT4aHaJSzSAq
	8mLEUMg4Is=
X-Received: by 2002:a17:907:9407:b0:c29:4634:5c99 with SMTP id a640c23a62f3a-c29d771747dmr18032566b.4.1789462978527;
        Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:57 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 5/6] usb: mtu3: add missing pm_runtime_dont_use_autosuspend() calls
Date: Tue, 15 Sep 2026 09:02:22 +0000
Message-ID: <20260915090223.1346-6-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_020300_331068_C6B4C20E 
X-CRM114-Status: GOOD (  12.02  )
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

The comm_init_err label in mtu3_probe() and mtu3_remove() both call
pm_runtime_disable() on error or device teardown, but don't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend().

Found using Coccinelle.

Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
Fixes: fa6f59e28c61 ("usb: mtu3: support runtime PM for host mode")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/mtu3/mtu3_plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index b4f4c776adb9..ce64c36a98f7 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -445,6 +445,7 @@ static int mtu3_probe(struct platform_device *pdev)
 comm_init_err:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	ssusb_debugfs_remove_root(ssusb);
 
 	return ret;
@@ -483,6 +484,7 @@ static void mtu3_remove(struct platform_device *pdev)
 	ssusb_rscs_exit(ssusb);
 	ssusb_debugfs_remove_root(ssusb);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 }
-- 
2.47.3


