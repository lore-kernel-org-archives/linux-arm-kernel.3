Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740F2C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WAPuc1vGDQFoHNCJwmaAMdSxrov7MEAcUbenNV8BYY=; b=Ee0vya3ErQLBz0BHWoVChwAxtk
	jq6cytDr0TkrJ8dA18gH98nv3ZnP0REjlfA2hA+wOXx/PIFzn46QbMggDqUv0Cmm5EGEPmi0oRYyI
	yexP/s8oeOnoJCcG3ZrFVN63B8FarvcRw1TYXoUK1Vd2OZNRGz9YVZ75axjTLwgFBh8gpSbezG8Dy
	0PvySqQv7hphNDxMo1PFOn2jHlUYqHmh0EVZRwqOQMmgcRO1wags6FAks35AnWyoWLa5z4g4PsSaP
	8Lzm1r3t/soC1tF83uBjQBZrcjiqnzc36769QyYaIWqfsDmxAp2t046Lt5+anTwc7KjIj3GIQFqh3
	0JftzAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrKe-0000000Gbcd-0bhf;
	Tue, 25 Feb 2025 09:34:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqsS-0000000GVWJ-0Unc;
	Tue, 25 Feb 2025 09:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740474318;
	bh=lk3BYwntCJ0BLjT+Ae8fo9enQLjePlvLMz51aun1oIU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oStsbuEznWGEwvh/4VTuaJefqJvEOLhoa75payzjQos2CcGGHrnoqoah18V2Si9Fc
	 u5BAfEEjtkp0Ftuhn+E4uzHhmSEe+lxR4RgicBWZ+X5C4NLwE1/z0rDw/jbnqyr6Tw
	 WhnmD6g4vjFD+dOCu+nTz5jJ4GLihvtMV/cvmmeOfZah5wJanP3pHMZB5gNz9VtPrM
	 lULALHwDk1jfwh9/bKI8JH5AgDT1qDiT316nPE2IlE5GSnRlOHxXrwX3ttVzcADP3k
	 VPie5t4RgpiLxhXZzexwXNxkmqNp+MB0qAn2kDCBYtMv3w1P638ErLRSb6uU9F3Tk3
	 RUAdqOV5HWX2g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4FF7517E0B13;
	Tue, 25 Feb 2025 10:05:18 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Fei Shao <fshao@chromium.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250221-mtk-socinfo-fix-print-v1-1-20500f30ef66@collabora.com>
References: <20250221-mtk-socinfo-fix-print-v1-1-20500f30ef66@collabora.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Avoid using machine
 attribute in SoC detection log
Message-Id: <174047431824.20024.2432870807445431455.b4-ty@collabora.com>
Date: Tue, 25 Feb 2025 10:05:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010520_304298_6D1B202A 
X-CRM114-Status: UNSURE (   7.80  )
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

On Fri, 21 Feb 2025 12:04:02 +0100, Louis-Alexis Eyraud wrote:
> The recently introduced SoC attribute info rework avoided modifying the
> machine attribut but still used it in the log message on successful SoC
> matching. It leads to print a confusing log about a board-related info
> (read from devicetree) and not about the matched SoC:
> ```
> mtk-socinfo mtk-socinfo.0.auto: MediaTek MediaTek Genio-510 EVK SoC
>   detected
> ```
> 
> [...]

Applied to v6.14-next/soc, thanks!

[1/1] soc: mediatek: mtk-socinfo: Avoid using machine attribute in SoC detection log
      commit: 02b916592319fdb336925df75415d98481dca300

Cheers,
Angelo



