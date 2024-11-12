Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EABED3ABFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L11BXtPdZG5uK5QvuZbEiygNXr4TgUtk8dKYuLWZmTc=; b=PnjdfVvYYlSb9BRu/dLMlttLWl
	z5aPP3Ds9kzZoGsplU/SOSXWBpKnphvNpJ1p8AXoT3RayalqqQ3i6G7Z7eLwrdcthMxB4B41i1eoy
	G9d3RWQiFhQcGJo609Zm39fG+AuTGNnVTYYSIpPD++kCaNlgxIEtFr6CPzUC3YSC15Vsdgknl5+ZJ
	vwr/bihM4P+lDABNdxpo9TqkxRom1jdOajtJfmJrT52P7enDVoh/s56JlscqjH0XeLgJ/JHpisKXl
	tsJrU4JPBDSoNXo48iaTnmboyMTDeDY21KPRAwazKeDyTVduYUfmC63DkBXVZ8fXXJ7E2GrdGPRqh
	HNjyi5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqga-00000003VmD-0hJl;
	Tue, 12 Nov 2024 13:12:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqaz-00000003Uha-0beO;
	Tue, 12 Nov 2024 13:06:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 279245C5768;
	Tue, 12 Nov 2024 13:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4BBC4CECD;
	Tue, 12 Nov 2024 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731416772;
	bh=bM9nBG1OjDCb/Ngw88/ql6ZjrXxF2rOfAhx/y+BwB48=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TYw5imcBuNLJz0eYDWuR4WtmQU+uMPZnuwBkdZ3Zdtxi4400zXf4bfAWS9UxZDfqW
	 Rta4ixJQ8WvBFv3w/eJAmoM5+NLKqR33GxMu1OWy8jM5zN67syebOoGjqpATCF811Q
	 bfs1P2mmUnTRdb/mMsztkvLSMG58Qqk4LIVlk2ZIaAc5/AK+NwTHz31iSS6RNcRpTJ
	 xcrg2pvTHD9ZNTgvJYDXasvQx0cQOWQsqZSAklmXzntfhGM3wzpsCgf5QmW28Aq+gq
	 o1D4DOKlQcliTYGwhxhdhSQK70EwCkjrAX5qK5+qGWkPSrC7xZqQEXtsw4G79O+n6c
	 uvspPaE14vb1A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peng.fan@oss.nxp.com,  m.felsch@pengutronix.de,  pratyush@kernel.org,
  mwalle@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  robh@kernel.org,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  shawnguo@kernel.org,  s.hauer@pengutronix.de,  kernel@pengutronix.de,
  festevam@gmail.com,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/3] mtd: spi-nor: use local variable for struct device
In-Reply-To: <20241111111946.9048-2-tudor.ambarus@linaro.org> (Tudor Ambarus's
	message of "Mon, 11 Nov 2024 13:19:45 +0200")
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
	<20241111111946.9048-2-tudor.ambarus@linaro.org>
Date: Tue, 12 Nov 2024 13:06:08 +0000
Message-ID: <mafs0frnw7gan.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_050613_239689_CBBF375E 
X-CRM114-Status: UNSURE (   5.94  )
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

On Mon, Nov 11 2024, Tudor Ambarus wrote:

> Use a local variable for the struct device pointers to avoid
> dereferencing.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

