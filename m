Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB56CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 18:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msHud40OIqSpq3f9V3YZxbeDa6wD/0SM5+Ku3Otx2Tg=; b=fdbo7r1zm5dYZgSkOXNh5e0yPE
	YrhFVVE6e38elhGst5SVq6srqGdN3g1Yo73yhKoHFQXc6pExCIv2HRgYUXeCgcNbswPRa2I81khPM
	7pHQRAbTT/jQD9SDXqcpPnofiX4uOCccoYsjinm3ymtgvKBmJ8ZdDMPfXXBIqfNWJCR6OJKwDeZh/
	HAHFYMD/GGihYVnPEYdOMu4xiwqvWm6BawPkTPfNliEUV3waeOFocTXFwIxXdtM53prEfSKJHstOM
	mGc/Qo+20HEt+BRPoR3X4icaK7pQQsYPVd0hIm9/TPmcYpmYiv12mlhJKRGSuSPQ0fF58f+D4mHBd
	aOT35hcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcvF-00000004Je8-44Jy;
	Tue, 29 Sep 2026 18:51:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcvE-00000004Jda-3GBA;
	Tue, 29 Sep 2026 18:51:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1707843FFE;
	Tue, 29 Sep 2026 18:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F361F00893;
	Tue, 29 Sep 2026 18:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790707884;
	bh=msHud40OIqSpq3f9V3YZxbeDa6wD/0SM5+Ku3Otx2Tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UuHvziogyqqoB6sgRjWKmHRCY1ChY4ksOWiyPrINoQti0aErTuaUxVVS3UTwG1F2P
	 RVzDVUSyxibpT07QGGrXXtss4Silcc1mp9BMPDYiDXaEcp2K92/wrFl0TE5eF9jiln
	 Zz+7iFjzrlQtM4OAP9fP5StTCM+vGYju23G8UmKv3Cs7cNjX96iORCi7ssIvsJe6NZ
	 x54zK6+65yz3zz5rbtn5w7iBcAXeAsJgG0VEE2F0MrvgOe8IXDZHdE6XJx0fWr9ryz
	 cxKz6QPitnCK4eghbtB+3bzQAPxnnSvFbsBfqh8pUJZhHB3KsI5d3JN14sef3lgzPd
	 r0B/JSwpcBshg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>,
	jason-jh.lin@mediatek.com
Subject: Re: [PATCH 6.6.y] drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()
Date: Tue, 29 Sep 2026 14:50:56 -0400
Message-ID: <2026-09-29-daily-reply-0013-re-mediatek-crtc-destroy-null-6-6@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929031902.88182-1-artem@trailofbits.com>
References: <20260929031902.88182-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> This one addresses CVE-2024-53056. It skips command-packet destruction when
> channel setup failed before packet creation.

Queued for 6.6, thanks.

-- 
Thanks,
Sasha

