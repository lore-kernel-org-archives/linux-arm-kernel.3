Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC523C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=za/W1R0ep7nxOntbTWLBzDdMEq25zG+1KoYLZ6nWMzs=; b=aEJCk23CHUb0u4rehUFGLuj+PO
	txHKYkEluHDPQIVeGxWyNvYTdJyL9Nd/nWdr+N6RufcxX9vX0GP6VrPZp46EWvm9T5sZFDq6rC8mU
	ZKrOH0KOQd0wcnDmUWtMuWGowAkFaWHy03hgpYG4wcIM09XPnIfhUc6Ipo5Ms7u1X+kiZTG5mbVAq
	FqgRpLsLvCtjwZdDcP1kOl8+gnyLORLdm5hTBrAvUJVb3eqPfy/iBe2hPEFixFYZcbWl10V7IjKV/
	t6CCA4ssoIpyVfmNhld6P0NiVL2STSYbzeUPydE9lTEaD5CoF7sEw2L8zPZwzophuXvjW776vBx6L
	pR7Kq6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9KG-00000001Bzf-3ZGF;
	Tue, 04 Aug 2026 07:12:36 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9KD-00000001Bz5-2ssy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1785827549; bh=za/W1R0ep7nxOntbTWLBzDdMEq25zG+1KoYLZ6nWMzs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=dQ8wW+YB1GEDP6dYSPPjbGUPbyBM4apdqsxDn77vD5/MrCUWfGI16KSvMXEh/C4qm
	 Rik+qDja03aS6+EBFqPWcK+uTZdv5XPao/6qkGdxRyelVBDhFpW7TKgY7a0rVvTuQy
	 vyWn93Olb6jNI6v7bf2dXFTSr1w9km+HOVTNXmq9qb6LG5V6aahOod6+5P+NDp8G4D
	 Blxx2tO5sh7CbhWUlK5KC0qZJ7JkQxji4DWTk1HkFcK2q5vUAJB+6L0OGSV4AWU94m
	 o49QOEtE+S7WWO/Wy5olIB2gnyZ52eFG6Qfv6iJVkUkNLiRq6ZKn0XHdbCQbWjOYiJ
	 MKeRRR6UW6Cag==
Received: from localhost (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id E523660085;
	Tue,  4 Aug 2026 09:12:28 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 09:12:28 +0200
Message-Id: <DKFZ162370HZ.2XC8HNVB1DU6H@bereza.email>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Vishal Sagar" <vishal.sagar@amd.com>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Use readl_poll_timeout() instead
 of atomic variant
From: "Alex Bereza" <alex@bereza.email>
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Frank Li" <Frank.Li@kernel.org>, "Michal Simek"
 <michal.simek@amd.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <UR3xiwNn0coPyYguDWjjQi-IWPyN8Surtot50IAldzugiznKwuwlVUScNRaQ1TMK5KEQcdglATeQVSWqQrsOuw==@protonmail.internalid> <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
In-Reply-To: <20260803-xilinx-dma-poll-fix-v1-1-892302c4847d@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001234_199031_E74F75C2 
X-CRM114-Status: UNSURE (   4.15  )
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

Hi Tomi,

seems your patch is not based off the current dmaengine tree. Please
have a look at
https://lore.kernel.org/dmaengine/20260402-fix-atomic-poll-timeout-regressi=
on-v4-0-f30d6a6c13cb@bereza.email/

BR
Alex

