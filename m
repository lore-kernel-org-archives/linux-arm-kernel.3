Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB8EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 11:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64co1eXVWvwVQ0SXBQRdrG1hF0s6ABk2TT7nEdEkzcQ=; b=FCH8rcXlKNwjrUFOJ0wr4QWoPf
	IXHMT3k/ZkZFGYXD4HNllHKdi6VNDhsxqzQgPi5TAfF2oEJn/lu/5xMSMi6j7fgdOJxyQr5JSwU2i
	mmH3cQLA6zQszMZMkDARdv5/NHZ2qzx+zt2EDMLmDtwljWc0IylYBGyR8Z5MsmldvRpp6TN/+reD5
	KjW0l9b+ruFXvsVSx4DdHjQRF8Si9a2ukLtRg+sgiZpeGlfwKbbtPqj4fL5FzaHokc6lNRaA5weWG
	ljq0VJCXqgH6iAvCZCSqjtHHbvcyGmXbO95aMniYpTC193RWy9oBlZeP7NyxP8gO2MbgPnvqbLBV1
	nlk0YRkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBX6d-00000005DbS-0QAi;
	Sun, 04 May 2025 11:01:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBX4j-00000005DTB-3hAS;
	Sun, 04 May 2025 11:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=64co1eXVWvwVQ0SXBQRdrG1hF0s6ABk2TT7nEdEkzcQ=; b=PLfJmqnpH7GgOAYizSRYexRD6q
	7CTvTq02aWc+kWA0UNK0pYYcQC6uxpUEk9sPjKR/Zq4useSWVkpoYUC/bpMK5sMia9EPCmSytFlaL
	TXpUDaYPjQyv6OZ/j0BzLD9kptZOrvc9S8JkeMp/zSJsJfy4gqJKvumM5Rx/1o56TsJomqA0daL7B
	/dmnsknbeBYytwGz/ahGFaJjEipR8uFXzh/JM/T+ZD+LVC2oShnfE/xgC7ePr7TTbpUGYZ5XpZTwi
	hHXAwGpsyotPRTh6rbixgvycQEWTYgl8ouGom8hZKFLNd3QmTXkbBj5dCsE5kkSt8ae2Ls1d4wIsG
	BsObRYgg==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBX4X-0001M5-39; Sun, 04 May 2025 12:59:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	mripard@kernel.org,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: rk3066_hdmi: switch to drm bridge
Date: Sun,  4 May 2025 12:59:38 +0200
Message-ID: <174635636711.1068615.11742267656925492318.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250428102309.1501986-1-andyshrk@163.com>
References: <20250428102309.1501986-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_040001_942072_B0D6DC8D 
X-CRM114-Status: GOOD (  11.63  )
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


On Mon, 28 Apr 2025 18:23:07 +0800, Andy Yan wrote:
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Note: I don't have the hardware to test this driver, so for now
> I can only do the compilation test.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: rk3066_hdmi: switch to drm bridge
      commit: 57d6811e8a6d179aeadb7f102369d1ddefe5aae0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

