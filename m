Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97009CA5FFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 02:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Dxub2OIKlJbgbQwnT0clqTj/0Io9aNg27HTao1ESOk=; b=q7SAIfPSfdpSAIhIxCBZEDu7M7
	G3uFFOG0iFotAX+pyhf3iMJPSzZalYrhzVXHT48C9/2DpannE9+BbK9YlP1vE71YVR+Q2f3IN/ryR
	zJoeBKppPKk5vCrJjVoM9KlvH6gdkR/2OXTpRs3HsaBWehatpttAitw++dFyEOGQkG31g49AHqgmw
	PCXWZ2ZDGvtSuWLolTEp3+GyqhIplp4jp2GfEkUkCjI0L5LuVcnk+VoXxe0gSOHFdmjG5Sa637UA7
	HA8O7mBKVh7EkH+pSHWYjbV+oDQg0+pc0gM+DXBjQuivrbpJdqBnL75fwXNWZprSWgJTqBMZpPDwE
	yDOiUzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDv9t-0000000HWEB-3gON;
	Tue, 06 Oct 2026 02:44:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDv9s-0000000HWDr-0wH2;
	Tue, 06 Oct 2026 02:44:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7832F43B34;
	Tue,  6 Oct 2026 02:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005811F00893;
	Tue,  6 Oct 2026 02:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791254639;
	bh=3Dxub2OIKlJbgbQwnT0clqTj/0Io9aNg27HTao1ESOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SAF2AiqUeS9WRFiufDP4pIYM9g5LxvnLUCxi9scPLYPoGoP9vFBe2ZGNdfMZD/Hk4
	 q9y7uOLhb/vtl9OU0jfb7TrcHmkwGpS11zkDvKp6z5i96rA9Pe8aBxG0E8R5uS9Er8
	 TzUJ5uTieVDMFoAyuQ+uk6ZL3/nDFUPB0+3kJ+z7dTx6f1PyhIBwB4H+liFswYTU+L
	 bSoD/VZFk0M4nZ8eG0erNz6Zn2gOa4LnZUqQHE3PuHXH+/6/XuDt84xC7Wpaqnw89i
	 ffudlGArDdKARbIJk/Avu5dL/R6nNZZOoieuQv9wcz8gvNg0Q2dBJBlZmspjcaDq4b
	 2/YCwLeuSYFiA==
From: "Martin K. Petersen (Oracle)" <mkp@kernel.org>
To: peter.wang@mediatek.com,
	Pengpeng Hou <hppiscas@163.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>,
	chaotian.jing@mediatek.com,
	chu.stanley@gmail.com,
	james.bottomley@hansenpartnership.com,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	stanleyjhu@google.com
Subject: Re: [PATCH v2] scsi: ufs: mediatek: handle mPHY power-on failures
Date: Mon,  5 Oct 2026 22:43:51 -0400
Message-ID: <179125457805.2089616.5429696204542801966.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920034953.19535-1-hppiscas@163.com>
References: <20260920034953.19535-1-hppiscas@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Sun, 20 Sep 2026 11:49:53 +0800, Pengpeng Hou wrote:

> The MediaTek helper enables VA09 before powering on the mPHY, but
> ignores the PHY result. A failure can leave VA09 enabled and publish
> mphy_powered_on as true, so a later power-on attempt is skipped.
> 
> Check phy_power_on(), attempt to unwind VA09 on failure, and leave the
> state flag unchanged. Propagate the helper result from host
> initialization as well as its existing resume caller. Keep the original
> PHY error if the supply rollback also fails, and report that rollback
> separately.
> 
> [...]

Applied to 7.3/scsi-fixes, thanks!

[1/1] scsi: ufs: mediatek: handle mPHY power-on failures
      https://git.kernel.org/mkp/scsi/c/78e04810542d

-- 
Martin K. Petersen

