Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B17C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DM/6oD8ApXS0Kg5hiipfejBF2lSa9KZ0WHSwF3lBGc=; b=kjZMwAcgkfX/co+sWUpH6ql+/n
	kPe3PVHthXqDGfJs0J7bar7o8B+PZt6KEk18HYEuZuoWxZpc+KOObq+QBlCcvNKSS5b1vMCWwjnh6
	ouLaK5OdvtvjDPylJdmygY1Am9uF1l0WWVkDZ+Bft4TvMV9+1XX1enMDgpv5iQD1qAmidLfv9aKO4
	cfFEg2pIT9ICCfwfAgcpwThMLq68WzeFvTRoVVHoPh3hXtqE1gMTnoVoPiWmPzW0X1YZiHV+5HOwx
	GFbDIdaxLKzd9f9XVb/eUu4NEzkmvnJnkOa0oPPY1Ta0bhMw9Gxq+UmEg44poaCy6eQVUUsZ0o4AI
	qCf5dhKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp9O-00000002dwT-0qXO;
	Thu, 09 Jul 2026 13:50:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp9L-00000002dvo-0qHs;
	Thu, 09 Jul 2026 13:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783605041;
	bh=4wdH6AGIdQUkCwGwkppnR1MG/7RO3rn/yOme0vJchCk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TVKrhXE5tTCw+l7BZOGSxtRUBOUkgQzRCdTjNpwNL7gNEv2tKDOn70zSdLIsetN1b
	 uVzsvAekzRpgHdN2dsKDCk8R4vdo74JavuDMIhZ+WySmA9KLoDxJ3pJ9KONLNVUIH+
	 f3uJq0gNuZ35R/o07svK3z84yM/irsa/QExRGEnztO1oG8H+6FnB8ssG2xLWQVN5Zt
	 eph/9ZB5vGtbKXbY78+qzHYZjVlnJkTLZLMI+QUcXOSCzHJ9lg9ULggoMJE8IpmovP
	 Lfh4wwdtlWP0R6tb7wEeNa0sCAchrHx9yraiQtbOJ+x9sOW1A23o61OvO0D6q/qa0m
	 DmbjHX3pTy7dQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A26C17E003B;
	Thu, 09 Jul 2026 15:50:41 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20260709132416.212212-1-griffin@kroah.com>
References: <20260709132416.212212-1-griffin@kroah.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo Add error handling in
 devm_kasprintf()
Message-Id: <178360504157.57747.16235792548671319644.b4-ty@b4>
Date: Thu, 09 Jul 2026 15:50:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_065047_785186_B1DE7ECB 
X-CRM114-Status: UNSURE (   5.86  )
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

On Thu, 09 Jul 2026 15:24:16 +0200, Griffin Kroah-Hartman wrote:
> Add an error check to the devm_kasprintf() function in
> mtk_socinfo_create_socinfo_node(), returning -ENOMEM if the function
> failed.

Applied to v7.2-next/soc, thanks!

[1/1] soc: mediatek: mtk-socinfo Add error handling in devm_kasprintf()
      commit: e4a3c99bbf779d6357adb8101ad18f34c2194306

Cheers,
Angelo



