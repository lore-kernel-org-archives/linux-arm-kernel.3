Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05427C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+THMLn1UZx9nf5RAT2P7GzAZnM9DxkEgB9Bh6dff4ho=; b=djX7BaKhWMIGDiYG841IpmXksD
	UW3foaoXos7hl//HVUlS1fQfhxwsUKJUtAUenjVoCP7Y3BES+q+MJajLXcDc2nQq2sVfhgVnvYIFz
	pWdFOJTcNY5qfL2MU77con4dgDKMbFR2BSTxMia2CfxIZ0D0PQzmlWtXJwISQQCFmU2RoXvrAZIwK
	kuQaA34CO8uGfOoh7BMklqwnSBwpt9v7KTA98tB4ApIJ/J7rUiuQXLILoQVca5LJtuU/QruKCv4P0
	1cdYxwYMB5DbnUB56heqTupkZuzlBJUZtE27e6BVQkbFHXb74M/cky3fvM6WCU4UAuygMLhxQKjqo
	TSvDdgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvttY-00000005q8y-2q6R;
	Mon, 17 Aug 2026 09:44:40 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvttU-00000005q7F-18G0;
	Mon, 17 Aug 2026 09:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	From:Reply-To; bh=+THMLn1UZx9nf5RAT2P7GzAZnM9DxkEgB9Bh6dff4ho=; b=F9ED7xRebfO
	fpKmtDdJPClyjkM0wdEcvuHinh/JJwYUq/anG2SrWwi7ulZMSHNb5DyOM2paCKQs6s1+1EydqZ7e4
	NguAxHxj5o9yjk+tszmJgayTZR3WRQIqTqYItjv7rB1LVtFRp/MMsfAdN/N8xpAJ/XXwR5y8wzINo
	g59JSsj6T+PpEDZEE88JBG0Ijjuq1T6ySXwPqQ6oRtx4JVd+x6F17ATJTTrWYqaQ1gFofG2TyxvwO
	042PoThldp1pqUi3M8n/FzC+N4+txPch8hazThaEJBW1C+MaKLVWe9bt61FUV0EDNExBsfbCI3cEV
	RZjJS2tHgicIp0AoouP6p0g==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wvtt1-0046Zh-1a; Mon, 17 Aug 2026 11:44:07 +0200
Received: from gate.service.igalia.com ([192.168.21.52])
	by mail.igalia.com with esmtp (Exim)
	id 1wvtt0-00AeNY-0G; Mon, 17 Aug 2026 11:44:06 +0200
Received: from berto by gate.service.igalia.com with local (Exim 4.96)
	(envelope-from <berto@igalia.com>)
	id 1wvtsz-002qMz-2h;
	Mon, 17 Aug 2026 09:44:05 +0000
Date: Mon, 17 Aug 2026 11:44:05 +0200
From: Alberto Garcia <berto@igalia.com>
To: Rong Zhang <i@rong.moe>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Chris Lu =?utf-8?B?KOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
	sean.wang@kernel.org, "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
	Will-CY Lee =?utf-8?B?KOadjuaUv+epjik=?= <Will-CY.Lee@mediatek.com>,
	"marcel@holtmann.org" <marcel@holtmann.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	SS Wu =?utf-8?B?KOW3q+aGsuasoyk=?= <ss.wu@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
	"patchwork-bot+bluetooth@kernel.org" <patchwork-bot+bluetooth@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: Disable remote wakeup for MT7922/MT7925
Message-ID: <aoLX5TsNv5d9jw0g@igalia.com>
References: <20260603-btmtk-remote-wakeup-v1-1-5c1006442f36@rong.moe>
 <178050901239.1520440.2026593395539384648.git-patchwork-notify@kernel.org>
 <3f9c376a5dbfc9d737e2a7f83c5db8e591fb8793.camel@mediatek.com>
 <17FE08E9-2229-4C97-846F-6FA099E22C90@rong.moe>
 <CABBYNZ+rR71SKUEuZBTf+E3SwRNzV2-s-zt8EwNJM3PSx9qB_A@mail.gmail.com>
 <fd8587e97a48e49332a4ad36e51e18739d000250.camel@mediatek.com>
 <4e96132bcfb267af05c06dc277b5ba6895e3ddde.camel@rong.moe>
 <99fb847b8fdedb1464798230407719912d6585c6.camel@mediatek.com>
 <20260809223320.24431a4a.michal.pecio@gmail.com>
 <868e97331dc74f176db2d3efdd1c579049b8e493.camel@rong.moe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868e97331dc74f176db2d3efdd1c579049b8e493.camel@rong.moe>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_024437_405361_823E4D1D 
X-CRM114-Status: UNSURE (   9.58  )
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

On Tue, Aug 11, 2026 at 04:03:38AM +0800, Rong Zhang wrote:
> I have also seen claims that auto power management is broken in btusb:
> > https://lore.kernel.org/linux-bluetooth/cover.1774348119.git.berto@igalia.com/T/#u
> 
> I believe the proper fix of autopm failure during initialization is
> https://lore.kernel.org/linux-bluetooth/20250319231235.812700-1-sean.wang@kernel.org/

I'm afraid that patch does not fix the problem for me.

With a patched kernel 6.12.96, after a couple of reboots:

kernel: Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20241106151414
kernel: Bluetooth: hci0: Failed to write uhw reg(-113)
kernel: Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.

Berto

