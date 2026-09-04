Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A655C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1wI7K97Z7sffgIc6844mzrHNbwJsm2GeFEd77pMsddk=; b=LTxTlFEC1n+XpNz+XknHnv1poN
	VzhaxoNgdvmjYmc/Zcz1YRsJQq/jxxXushrCkUSVlTHdNxeuRMewixA/SkeAaRB+mmMccTfTYqfl0
	gsE8Qn/c6xTsVn+RehYoa0iYhPFpq5NWYYehnq8yJPnvmCdeuvwJoT6lO54/fk3Uv7mD1cAzRO7VH
	bXFTvnq97A9OTV1IeyYtDPc21bZLiEkJrM9pUcoiaWeUy9js43rZtWjtNWU1CRkRB/Yx7KfZ265a4
	i/NrsTenuyDzol6q4a03GBtojeYAOvClc/8JAXvvWeDeYxPQ8zaZtW4ucvozPHo9rSDgqFArFM39t
	c4wCgBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WCc-00000002a8M-14R8;
	Fri, 04 Sep 2026 15:51:42 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WCZ-00000002a75-2KI7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:51:41 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-398a5aad413so864790a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788537098; x=1789141898; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1wI7K97Z7sffgIc6844mzrHNbwJsm2GeFEd77pMsddk=;
        b=HcfxoytA1yNP6zg62urS431Tr6TEfefli7XB27dsWrfgAGVYLliy+9QiRqORsb8eSi
         ca4OyjsglkbZPaSBMgEGEEw8O+rgdaY0cy6vt84lgQbWu+4lsy+L6H+BRLk67troIWkr
         M67F8n80e+eisNY2WpSjXfxxAkKMJT2v0nVRq2/tpNbSYz3BWZkKYP+234E0zPCXonAE
         vTHGFXANq6yHxlr8Gi5o2TRSDLlgZ3Cu7nwHZcMEVO20eW7pkgbaEWl8WmWkFA4YKwQA
         QgbibRjjTPxXeLjRXEaoMmpV1TEAXbQjF62lseax8UFWzUFP6gY8VUgy/g8/2AWe75a9
         891w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537098; x=1789141898;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1wI7K97Z7sffgIc6844mzrHNbwJsm2GeFEd77pMsddk=;
        b=iM3iG1MG3j/LDYlVRSwpH4a1V3kHIUW1K0oADnoia+XLKA8Bo/IjbQuzWe53ZFu7lW
         ddqRs3vjA9AOaUJVDe18LXDGoyrFSOmOmocDHxqjgmk+1Lc8upzjKh0KrOrWzELIHIXq
         5gkxpUY8KHn903q5BCqqZ76UptF6QZwxxsqxkcrlV312TixHMF1+fHQBfSapFO5Am18Q
         oJVPTZh2R+2JnJ3hzxGtyPKTkQw29btRiBXolVZHTkh/KMsVZLAHsJMZrmW7jUZZrC92
         F+9xisOgVbCFlGDBhaQuQ93+/5Gfw0EPPAeYbGMIyZDcujPG5T2i52qb0UJCZ8mOFkYA
         7dcg==
X-Forwarded-Encrypted: i=1; AKwUvBzJIF1iAnYy+GhugZmBTW+amUBNCu7smHPw4s2UmhNfA7gqe8CxbYNLb8s53Edq2aIxSgq+fZ01VIBiT2UJRgZh@lists.infradead.org
X-Gm-Message-State: AFuF++nfFjoC4RwHYzwn4W5XO3Nf/0Il8n5bbCk+AEhsGsY4ipKWm+I6
	WM5Fb7k4ippTQDnsF2FQxZOqyFKbJW2nFRbZn/9XIDwW+XwlzXU3y7Yc
X-Gm-Gg: AYBFou1LN8T/Pf59WrkCWBhP6IeOIX0lDMsiHviUUWu86cmvfY3ju0OL6071ZtA9peS
	8S1pTPiAlUYHy52R6RbtNMkxQZnsWFlDxw+ZL7HjuBtCBuCHpWlwikn0iFVjXuLM65j7zPbxLAD
	c4Rd+aWHBwj1VuGfSHnfYcfvOKKcXcAJc4LcD3agXVDn18SH1nKHNWG0/2Hbgvz24eP/KxyjlCC
	c+WkRCLyld9Q9GsC73m4n9ADyNfFcSiFd4RiDKOGMGbuYo5YwK5qkHSjvZ9quW8UaC8AsCAKMFZ
	+l9fPVYdWcEuUc9ounb9ZI6KvCCLSAOT4T9GQ0bGW18SM9c46jK/i9TJY9GPr/Kg2qA5j4msrad
	5Rqf+r7OirFyGOz0MbkY1q2rqI2oVE2HsVKC6Ezbk5N4TAQQxNPe8UdLQCnp7jX2UFxXENbvEnU
	5JXfv1C4N9CWD+XLpskeE36tKPQ9zmMCailSXQT4jN11YiSetQdBX5C/w3E7FWdy5Dulkr54WIu
	wiCLH4/m3U0G0/GI1wiGL844G1u4/tMo+U6MZcrCuP2qXNJxPGLWM1o
X-Received: by 2002:a17:90b:2749:b0:398:d292:e6d5 with SMTP id 98e67ed59e1d1-39b26304385mr11311044a91.24.1788537097799;
        Fri, 04 Sep 2026 08:51:37 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e4fafsm11390320a91.1.2026.09.04.08.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:51:37 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 04 Sep 2026 23:51:29 +0800
Subject: [PATCH] spi: mtk-nor: fix runtime PM usage count leak in probe
 error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mtk-nor-v1-1-cefdca098f83@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubY6pDVeRS6YMw4ZbSMl7264/
 NX/+y7w5Jg8VMkFjg72vNqILE1Aj60dSHAfDTnmEkssxBJmYVcnENGYUndKSQOx3hwZPr+nuvn
 t924iHd453PcDww0MN2sAAAA=
X-Change-ID: 20260904-mtk-nor-000ff9cb886f
To: Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537093; l=1008;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=fC8E2y6Z5Q/OrCnge+02KY1tB0zJIUqzvl0v1HTFuJY=;
 b=Hjljg0NeZLG5gJIKscFNfsTfPBNzmXNZzZZdjt+VFCksVrkMrlsQ8WNQBjn0I6eayViNdBFXR
 nC28js6qxURAaeHZi6f0vbvRDNT3CXLfJnL8bkidZcn+YRJwCce1Rff
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_085139_587700_B17D05A0 
X-CRM114-Status: GOOD (  10.67  )
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

mtk_nor_probe() takes a runtime PM reference with
pm_runtime_get_noresume() before registering the controller, but the
error path never drops it.

Balance the get with pm_runtime_put_noidle() in the error path.

Fixes: 3bfd9103c7af ("spi: spi-mtk-nor: Add power management support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-mtk-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 63f5139176c8..6b6e55d68048 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -929,6 +929,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	return 0;
 
 err_probe:
+	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);

---
base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
change-id: 20260904-mtk-nor-000ff9cb886f

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


