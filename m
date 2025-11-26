Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C198D10390
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Msbg8SMAOfIyv4Wvtt34feTWVQ3E3vx5/EeCGtc5QE=; b=J8Y99YJzYOTO4f/WsWK12c/Ozx
	e/8QqXkNOlrZgfSRtyfAdQtKrPcH5bevqLKDk+NWtAC9+aXgFDL612Cr6PL3IJZw21BiremzEQt2V
	nAIv3fN+S1mKX99hgVaiL1WuPrWRbOlrSYUx6l7yCwiIqw2sozCXnpXYGOi4RTrKSv4Mnes7MDe4Z
	gsm+DcpAMSl68D7StoeCmrUkKbkMJGRrp/HkbRHaOVXfDat0f/I6Bk96Y5w1Ayg3vHivNEAGBVMqX
	LrXgV1OJxVbTqu/p8KvcUQiOAqkCqDsiW5Ycm53ABHvL6aIz1W7S8XIBszF4lXc+gF0BEWhU5t1eI
	ZqJyUkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAzC-0000000EcC5-3kkE;
	Wed, 26 Nov 2025 08:34:50 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAz8-0000000Ec6X-42Iq;
	Wed, 26 Nov 2025 08:34:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764146040;
	bh=6Msbg8SMAOfIyv4Wvtt34feTWVQ3E3vx5/EeCGtc5QE=;
	h=From:To:Subject:Date:Message-Id;
	b=MpkIsEdcFwEs2hIInVfE+eibZ/3P2gIkGvEOwVBF6A1bmm0gI2dzGcu5H5JvJwEer
	 iPhLmrPmA5J5BFuFUoJMUWjga9EZEmclx5qG5Fq1pJytQZaq9mgxGs9OaT/XOxlwDS
	 G/2yWURrpe93hBF27qijY8IahGxEsmzJXjoXB2Ek=
X-QQ-mid: zesmtpgz4t1764146030tfcb12351
X-QQ-Originating-IP: etrN7Rhn/qcM/9hSFq6eDCga1Sjs5DbC09JbfnYxMzM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Nov 2025 16:33:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7926629937500190388
From: Chaoyi Chen <kernel@airkyi.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 0/2] iommu/rockchip: Add support for multiple interface clocks
Date: Wed, 26 Nov 2025 16:33:43 +0800
Message-Id: <20251126083345.88-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NZMyfNCZ7Gpeq1xd/i/MhZ556HZf5I+juRpNs8JHdwkdf4ToqdutII1R
	3gOEyYFLag6SqtxqJ1GTxsS0pr6Kd/sev2dosSYDVKf9NulcDwJQ6/Gy8ZuKcL5uU/SLG3J
	nZq+x7dCYnX2J2B4tYdKwW6r+m5w3yT0mJsK3NhCq7aLLc1XKcy1W52FDzruhXKJ9nqi8Wx
	CYuCFULDFKwRLLHZaqMrs8rZSXRmIL775ls0MyqBK9Xf7wYNi/jR2JfzG7k31SqOqgE2+xw
	ylOu4vNIZSahmsUyhs4aviBzvlNcfZxP6+bBreWP/CLmxlJtAhObWlT9/IXqqV51JvXb3GU
	gs6UF7rh2Iayj1HviKjuPx0SqDMp2uZl4U5buNo+/ON2JU87nkE/x2tB5u6uWads0kFNt1o
	d36K33aQTWGNIUTt4qzyKF+Gy/y+wxGNxDGudrKVDGGWl+JKG8cD+Jq4N3e9iNWySC3gOmr
	SqUEKWk0A87ZLKkSZcH8Z9cT1V/DT4aHbaMC/EytKzQqQU+i29+XHn+zTCY44stKT5klU0h
	Int+tx/VobHBPzk8vX8BX1SqvanIIT8Zyi60uuDoHP3tPZhFIjEma9fkLwnzWyCdeGDhetI
	m7Eiv2454ixMeYHHARKOjqecJqlXs+wopEGEmGor3Bs4T6/+HcgXqtMTaKrH4vphqXUNpvw
	ABhTc8zcgTLLR9DAmVLCLntTRixlF8VPlRBEbVLaK2kRbk8n9seDw4GmGVFPviyj+Ok6k4F
	eRL9VYPjG1Wl4K3A3MSbAOcM0qqsfd9fJhe15MLGOl+SE/oNx5ytevfBWIYEZiIWYV8eopD
	nM/CQGssbZq0mtZh9VmfiOpZKKJ0+hqsoDNjuF+TQc/iwXNScInxQ0HxlE3YTFZpnbXoamH
	8reN3MYA7QtUKDSehrrsz3KQrp+INM7XvEqYksCTILC91NmuZcGhVDci9V7nGeSn5aBc5Hm
	UbPbJCvOot/vUIKYKu3aErv0rF7TOVmOt6v9TCXGQGloRa/mQGa436bIC
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_003447_453680_63A8D8A3 
X-CRM114-Status: UNSURE (   8.25  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Hi,

Some rockchip iommus require extra clocks besides aclk and interface
clock, such as the iommus for NPU and RKVENC in RK3576.

This series adds support for these extra clocks, which are called
`iface_x`.

Chaoyi Chen (2):
  dt-bindings: iommu: rockchip: Add support for multiple interface
    clocks
  iommu/rockchip: Use devm_clk_bulk_get_all() to get multiple iface
    clock

 .../bindings/iommu/rockchip,iommu.yaml        |  8 ++++++++
 drivers/iommu/rockchip-iommu.c                | 20 ++++---------------
 2 files changed, 12 insertions(+), 16 deletions(-)

--
2.51.1


