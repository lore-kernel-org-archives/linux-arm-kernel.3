Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC86E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBDWUj0OGGwVtelrV5MSIm2IZ8rpdHIv+zi5tYtb2mM=; b=VkEs85eKF72qd1WO3d3He4MLUW
	o3eEZkaZOugziG99YoUWR2nsLUtOcW5qbMif59RDHYzMkBUhXf13EK/T9H9sAkYXOj+HbZkwpc7ov
	nbFQF/rVRh9mYjzgcLEDlcGb+JJo5Jae4FZqP6dQyJJbKg6I+4WDBOzpJa2X6GZVTz27U+QDEE/fV
	tHEwHUpkYZjRfDyCpPrDh9TL7nj4jP7LtWJQbCeci0xgFlMaEzqA8f/j+4EZDRfBimnJj768cDgxi
	Awcml9z6E5Z5zrybFSBp/6jX+Km/qXTW4F18xbxXEN+knNCxaRfgbw+yQJ80FACpFeRUMTZGWFfsc
	RAEmgPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKHXK-00000005Ku4-2HyD;
	Sun, 08 Dec 2024 13:41:26 +0000
Received: from m16.mail.126.com ([220.197.31.7])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKHWH-00000005Kq5-2Ofg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 13:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=FBDWU
	j0OGGwVtelrV5MSIm2IZ8rpdHIv+zi5tYtb2mM=; b=Aurap/aVLCWunKEb7mBP8
	pp857jSAL3GYtJlsKSJWQWn6iADiVzmYlfqJTdT2BFyGBsyBPdP7nQ0OAG0MZMUp
	00bK2SOvoXeWmx9lIaW8Mh7QbOflYnaC0STtrDBnidkMKyhh52jsc07oVWsCFqZp
	PH9t2a5wV2FX5YziHmYph8=
Received: from nilq-virtual-machine.. (unknown [60.24.211.0])
	by gzsmtp1 (Coremail) with SMTP id pSkvCgDnz7ykoVVnXP4ICQ--.13915S2;
	Sun, 08 Dec 2024 21:39:49 +0800 (CST)
From: niliqiang <ni_liqiang@126.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	li.zhichao@zte.com.cn,
	ma.weichao@zte.com.cn,
	ni.liqiang@zte.com.cn,
	ni_liqiang@126.com
Subject: Re: [PATCH] drivers/iommu: Protect STE base address in multi-core and  multi-process concurrent scenarios
Date: Sun,  8 Dec 2024 21:39:47 +0800
Message-Id: <20241208133947.20871-1-ni_liqiang@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111142800.63760-1-ni_liqiang@126.com>
References: <20241111142800.63760-1-ni_liqiang@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: pSkvCgDnz7ykoVVnXP4ICQ--.13915S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1GQDUUUUU
X-Originating-IP: [60.24.211.0]
X-CM-SenderInfo: xqlbzxxtld0wa6rslhhfrp/1tbiYBOu5WdUy9sPRgACsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_054022_034162_C7D56808 
X-CRM114-Status: UNSURE (   3.90  )
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

I found that the email sent by git send-email command was partially
successful, so please allow me to reply to the previous patch.

I look forward to the reply from experts. Thank you.


