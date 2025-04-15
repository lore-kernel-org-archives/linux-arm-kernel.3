Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C0EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2rU+2/DAdfeDTzcu3czX3OXDy+kV2hraQlukBVYidA=; b=qOSi7uaoBkag515Q+3QiQsPhjL
	RudsAOBzFXZy5JTcHmzM6D0sVEzEbEJf/nBjKVVb9Sb6hGSEpfWojnvItU4hjFCWpvQjJFRwC6o2V
	OF07+fApp9yagY2oLIYLlN00FsJDZtWf9NCu6e4Ibp2buz7CAh5ll07Goccr0OeLoGZzsdetBr60v
	hzbKQBRDV5LXSAXFENLzU/54K1gnp/CPLjObqrNxoJfhltOHHioaGNbK4fRcJ6+kTYoVIDte9kA4f
	lwBdboSVEBsmjxYhrlI2QcWnKdjrmrxZ5wS0pAO6kKZ4SXdN9CsL+zg0euROuuyc1YqSkJOjGpv3e
	pjr0u28A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dlG-00000005NDt-3pl7;
	Tue, 15 Apr 2025 10:43:27 +0000
Received: from mail-m21466.qiye.163.com ([117.135.214.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4daS-00000005LKH-0suw;
	Tue, 15 Apr 2025 10:32:17 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11f2f6015;
	Tue, 15 Apr 2025 18:32:10 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 3/3] nvmem: rockchip-otp: Add support for rk3562
Date: Tue, 15 Apr 2025 18:32:03 +0800
Message-Id: <20250415103203.82972-4-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415103203.82972-1-kever.yang@rock-chips.com>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0IYVkoeHk9LTh9KSENMQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a963901a25b03afkunm11f2f6015
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nkk6URw6HjICEhgMFBgZIiE4
	CktPCxdVSlVKTE9PTEpISkhJSUtDVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUpNSUw3Bg++
DKIM-Signature: a=rsa-sha256;
	b=EfC4sK23XRiJ7p7rSdymQJ/3mM6Mrl8gix4vDQT7F8LEMdZXMCdYJ/1dx3tPnAhb1jBov8XyTwxpYq1xuayS25WsmFTtiEs3JnWnO7u98sm36bHsY3/OsWpn7XGN8WK3ohUKhgZ2uj/eGAvgSvT7n+CmLfnFypCTZPgv5OfQUcg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=x2rU+2/DAdfeDTzcu3czX3OXDy+kV2hraQlukBVYidA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_033216_505722_CA545DD0 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Finley Xiao <finley.xiao@rock-chips.com>

This adds the necessary data for handling otp on the rk3562.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3:
- Use rk3568 data structure for rk3562

Changes in v2: None

 drivers/nvmem/rockchip-otp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index cfb69bc58869..62ce22d72586 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -376,6 +376,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3562-otp",
+		.data = &rk3568_data,
+	},
 	{
 		.compatible = "rockchip,rk3568-otp",
 		.data = &rk3568_data,
-- 
2.25.1


