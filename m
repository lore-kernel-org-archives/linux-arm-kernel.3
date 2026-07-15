Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FF9C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VtbUyXNZDuhV6bSABJhftrGxCknDqtWcOIQUqrvTi4=; b=z3bCCYRa688D8Hp5NvIGZx3DjV
	lCe+BIqVb+2SrktKJbyeioYp49M4V6lVZD2RTtp5PeEEEmjv08hR0DbkImFQJwpBheN7j30Ef8XYf
	N6Y1Y4jPPek9g0sVDv6LpNXq83guWfdeygDZQvGqZsV5W5tv+P/6iGp8uSaJ4P/GZX4XOlAjZcyyl
	0jRjZeZolLL09Rhx1mDUOuPQ0wUw9cWl6hqZByB6siQLRrRMQTGPzQ1teQ4FtKxIS52vJpJq4/XNC
	ZCeOBLT6ZSTZ5HhPG2WqN4wjDXbDDgMDvmjUP47VrE9SkRkTxJl7eKFl2b2xv6hlPq0xTzpNGawy2
	jBC7HKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvU0-0000000EFeS-0ug8;
	Wed, 15 Jul 2026 09:00:48 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvTw-0000000EFdT-1GN2;
	Wed, 15 Jul 2026 09:00:46 +0000
Received: from Vostro-3710.lan (unknown [113.80.141.85])
	by smtp.qiye.163.com (Hmail) with ESMTP id 46448d459;
	Wed, 15 Jul 2026 17:00:36 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: lorenzo@kernel.org
Cc: Bo.Jiao@mediatek.com,
	amadeus@jmu.edu.cn,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	matthias.bgg@gmail.com,
	nbd@nbd.name,
	rex.lu@mediatek.com,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	shayne.chen@mediatek.com,
	sujuan.chen@mediatek.com
Subject: Re: [PATCH mt76 v5 16/16] wifi: mt76: mt7996: Add SW path for HW-RRO v3.1
Date: Wed, 15 Jul 2026 17:00:30 +0800
Message-Id: <20260715090030.1535098-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <alc6xTe4uPIJHQy8@lore-desk>
References: <alc6xTe4uPIJHQy8@lore-desk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f6501aadf03a2kunm7c2e8de7748cb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTRpOVh1ITEodQktKTx9CHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVQ0tVSk9KVUNOWVdZFhoPEhUdFFlBWU9LSFVCQklOS1
	VKS0tVSkJLQlkG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_020044_524862_42FA4B74 
X-CRM114-Status: UNSURE (   3.77  )
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

Hi,

> IIRC WED is not supported for HW RRO3.1 at the moment

Okay, seeing this commit, I mistakenly thought it meant support:
net: mediatek: wed: Introduce MT7992 WED support to MT7988 SoC

Sorry for the noise.

Thanks,
Chukun

