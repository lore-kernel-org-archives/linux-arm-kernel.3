Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96D910AB807
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 19:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqTxQ4+4Pepmm+b7jcLTYHrn6v3kt/yLegb5GQyalhs=; b=JfL8tPBEwCLFTeuN9ehse4B1Wy
	1Ksre26+uYCw7aUH1vC7WaS8WCygqHqjXCWS9PdF7D7G+6BegOXRq2E46LPV6Df3cW/UE4ZGxUBGx
	QeMCzFcgolXmD+Zv8yvUgibydIVpEBfLVoAeS5Q1BOk2PTfVTOkqLapbKH3hFLBbQWSrv0ZaH2Bne
	bk+Exgq+5Pwx1Xh3PXix7Bhjvs12h3crSFGORfbWTWXi33VNp/yxrX1ixx7btQVWu4+W2UWN8zMwt
	GmhN+J+W344xI7JgAJUdXMWNETREk9hsn6j+lyZ62HFys5Xzhjy7akmxP/PSQAmk9snJbknQWwxrp
	u0rJyebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qaN-0000000687X-0UD1;
	Thu, 26 Mar 2026 19:41:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qa7-000000067xW-14s2;
	Thu, 26 Mar 2026 19:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=UqTxQ4+4Pepmm+b7jcLTYHrn6v3kt/yLegb5GQyalhs=; b=LH8F33gGysSTYfISC7040NDRaD
	DsLmNS1xma9eh6z+mEvhsnZUTmXRnynwKegM5QzVVxZq8Ss75LiexyIC7Z3S3SH9imRTftaDHfm/2
	LcxircO6NNZ7pjq/na0O/42/KFwgedsC93YYts7AbtX2gTNE33RyY94x89hkMS9RBHSrh4hmJNrAb
	Gj9w/BbAFUmL+PVjDUQaT5m3eS20BqWF7085khKiY6KhOG9TkeRYEpJrg9uTv1zKqGD3imK0+492c
	st1y+9uWqr5wZWApsARXySbB0SxxiY04zmsl+62vohNDC4aRJ4tZRW3FFKMmJdd8Up/df6VIfO4nG
	Ny4iJquA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH RESEND] drm/rockchip: cdn-dp: add missing check in cdn_dp_config_video()
Date: Thu, 26 Mar 2026 20:41:03 +0100
Message-ID: <177455405026.1277100.9686566905955604923.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <adf6b313-f7db-4d8f-9000-8c65446ba041@auroraos.dev>
References: <adf6b313-f7db-4d8f-9000-8c65446ba041@auroraos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_124127_315010_C2E51A16 
X-CRM114-Status: UNSURE (   8.82  )
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


On Fri, 30 Jan 2026 23:35:42 +0300, Sergey Shtylyov wrote:
> The result of cdn_dp_reg_write() is checked everywhere (with the error
> being logged by the callers) except one place in cdn_dp_config_video().
> Add the missing result check, bailing out early on error...
> 
> Found by Linux Verification Center (linuxtesting.org) with the Svace static
> analysis tool.
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: cdn-dp: add missing check in cdn_dp_config_video()
      commit: 46c31e1604d121221167cb09380de8c7d53290b9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

