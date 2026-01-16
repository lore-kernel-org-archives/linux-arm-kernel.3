Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863FAD4899D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OkE0GM3UlKk2CulWJNx4KPyGxVd6jcoppfmycqlbInc=; b=DnEW2O8CACIr/fRI6E73lCfZRf
	nPny3zlwm3oIK/DRNeuKtUHC7pLlJUjyRrQeP/uJ0cmxXqYjkfZU5wzaclZ7AIX6kLduB7gqwHEx/
	pf0LDsyLpiJjobyO/exmFB3pz0zaQeBJ89fZBDYIpM6zWZ4Ey4oqZB3np80Svkpw8hGfMLhIweIc4
	CrUjPdHcmfUYI6HqURrMcGADSJLjsGfduicn6VqBNq1o5MooddwTOD0jMsdCfeZ0sJhlk/iDuaMfI
	2d3Z9iYfNQFguZTK79UIBzrRd9JwVUjq0+7hj6M0vkwmPknW+uFZl0k+9gvqVs4OMhfK/DpSKZNPz
	cn1Nf+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjoF-0000000EB3E-1BL4;
	Fri, 16 Jan 2026 13:24:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjoC-0000000EB1G-45Hk;
	Fri, 16 Jan 2026 13:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D5E543458;
	Fri, 16 Jan 2026 13:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C34C116C6;
	Fri, 16 Jan 2026 13:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768569851;
	bh=n3iW2Tj+vCxQwVgYlwOE8woENlPxrgCzFts6M+ARsAM=;
	h=From:Date:Subject:To:Cc:From;
	b=CR9VgakFnZ32Tn4Bud5kKBJQ4vKOrem9l4rK6FPaU8V4Z/nrOVK+SyU62j9RBSSLq
	 GnkLaJQC+VXQCK9ZLvUv8ic1ogM8vWNei4y1rGj6ZPHKOQklJulLkeUww+xRkKxJyh
	 nAa34r76fRvltLMUZ3PBZVd4zIYkvH3JPwkLufsNiSnDxTO1LjBKTufVqH88qI/Epq
	 bZuFfrAVmRXeBw0VrWSm/VSiDhl9zxN81B2Ntixuck/XcbyK7B7q6gtmFqewykIgmH
	 Jo70tdHJSEYM6RgSSuPvCcbfERAbqDhA4NpcpHHcPbqykzKo4aieT2fwDtV6g72FhO
	 afUONp8i4GoYQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 16 Jan 2026 13:23:40 +0000
Subject: [PATCH] spi: rockchip: Use plain request_irq()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-spi-rockchip-threaded-irq-v1-1-c45c3a5a38b1@kernel.org>
X-B4-Tracking: v=1; b=H4sIANs7amkC/yXMQQ6CQAxA0auQrm0yRSXBqxgXMK1ONYGxBUNCu
 DujLt/i/xVcTMXhUq1g8lHXcSigQwUxdcNDULkY6lA3geiMnhVtjK+YNOOUTDoWRrU39tSciAM
 fW2qh9Nnkrsvvfb397XP/lDh9h7BtO5/Jyf99AAAA
X-Change-ID: 20260115-spi-rockchip-threaded-irq-b1641d0d3919
To: Heiko Stuebner <heiko@sntech.de>
Cc: Aishwarya TCV <Aishwarya.TCV@arm.com>, linux-spi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1355; i=broonie@kernel.org;
 h=from:subject:message-id; bh=n3iW2Tj+vCxQwVgYlwOE8woENlPxrgCzFts6M+ARsAM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpajv5U/lesGnmB76mqSKLV43KjffKXBwaNmwv+
 NzWMRlI02iJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaWo7+QAKCRAk1otyXVSH
 0CwGB/9/rGyUTjSO6Hyo6yX5Kteocrj34723rjZQgoAAfZzMecwg9BstwYHILNZ7ja/h3JtyN8L
 rmY7/4Vb4FuZPJGYS/62FJxRHpWHEP0GSfZTE+fr1D5RC49x8VkVWetwcgVz2sKJDv1tJJpKmL1
 LSMk3LpP5fhkww3jsZC0STIpIcmqqnJbUKMQPesuXDb5uCiRP3njbLr3MZSr6LwbULqSVh98HVN
 tOxbppgq9jJmXlUb+eB8h1tciMBgcri3899j2dqooCD4fd/kiGOSzmWAbsAKS6OJhdxNwYGtvlR
 uJ7JKz6GHSiCFNH7gQ2z7qjOIR0DjxXBGz+7Wzo+bqrGCwlT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_052413_049770_F7C4B1A2 
X-CRM114-Status: GOOD (  11.62  )
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

The Rockchip driver has since interrupt support was added used
request_threaded_irq() but not actually supplied a threaded handler,
handling everything in the primary handler.  This is equivalent to just
using a plain request_irq(), and since aef30c8d569c (genirq: Warn about
using IRQF_ONESHOT without a threaded handler) the current behaviour has
triggered a WARN_ON().  Convert to use request_irq().

Reported-by: Aishwarya TCV <Aishwarya.TCV@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 1a6381de6f33..62e1bc08c940 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -805,8 +805,8 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_put_ctlr;
 
-	ret = devm_request_threaded_irq(&pdev->dev, ret, rockchip_spi_isr, NULL,
-					IRQF_ONESHOT, dev_name(&pdev->dev), ctlr);
+	ret = devm_request_irq(&pdev->dev, ret, rockchip_spi_isr, 0,
+			       dev_name(&pdev->dev), ctlr);
 	if (ret)
 		goto err_put_ctlr;
 

---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260115-spi-rockchip-threaded-irq-b1641d0d3919

Best regards,
--  
Mark Brown <broonie@kernel.org>


