Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C213C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 23:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnbLxDMWbVDlEpTCXqz7a4gZe51CrxPsR3b6bqVyzmI=; b=d3shRNISfh1a+16s3PXNiOsXnb
	vftuMSGwZ5IidcOI/Y5tUXLOPMJ7gKMN4dzeJYjya4qVmmadPrerCtsYV917i3BZ7ZjKfnYBoxNqF
	EVaaKFDuWGOQAhB53SWfl0H+TLT//F8p9EjeS7GBciQP6ONrB7Vho2vkIlSKNCXegPTnN5Oon7FCO
	pSy39qqjV/kCzxobZjtzp8t+mAx+S9o16KN67diK5psUXnpxmOhwQmxtCJQbB/DbGoHupkfujgJL8
	r2FwA+fP39sTLc7qz05gO6QgsUaqILKmqxbpDvHnwhwBIXgWL9jw9chuuvkPos9SAtoclWy/OdPSH
	V90XYAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tugUH-00000007PkL-2rXn;
	Tue, 18 Mar 2025 23:36:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tugSY-00000007PLO-3QcC;
	Tue, 18 Mar 2025 23:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 10979A48D97;
	Tue, 18 Mar 2025 23:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3461C4CEE9;
	Tue, 18 Mar 2025 23:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742340897;
	bh=pMn93BCYx8Yd/sNKAxUy368DN98GPccSOpgU0WBYfvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ma8z723PtjSDzA2o+p77HmCpTJX4ju6WX+CjS6LUcxG96CpWq32+ZfhY03OVdZfxP
	 SqKNCq35x5v7tsPOfZk1UZWc/yR5hUCAZOhyRu0SX4PuASaXrMhyOXcj9a6mxsE0X4
	 v6LM0d0mnjjVgklNNskiyKXvuHHtGZt8OLibTuDWSzuCJMcxywDRqUju9giscYQhU5
	 Q2lJK/0ZqX92Vh7zurs+49Bnvs0XW2o/6CeO5KvqPffQXRObGesnQIcEBHFICqXnk/
	 HP03ZRR3JdFb3n2PiowiQXCu/8XXXDvcXuM2qqIqzeqD7/0EDwIHsJRS0PLzrJOQND
	 u6/KFxAn9xSRw==
Date: Wed, 19 Mar 2025 00:34:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Zoie Lin <zoie.lin@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, teddy.chen@mediatek.com, 
	joseph-cc.chang@mediatek.com, leilk.liu@mediatek.com
Subject: Re: [PATCH v5 1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <fqicrglyug7gmkmysok7hilhmkyhxmnkztzv4iffgry6xce6t3@2i6b2ihfu4rb>
References: <20250314145407.2900190-1-zoie.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314145407.2900190-1-zoie.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_163458_918425_0C0B6E74 
X-CRM114-Status: UNSURE (   9.24  )
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

Hi Zoie,

On Fri, Mar 14, 2025 at 10:53:43PM +0800, Zoie Lin wrote:
> Introduce support for runtime PM operations in
> the I2C driver, enabling runtime suspend and resume functionality.
> 
> Although in most platforms, the bus power of i2c is always
> on, some platforms disable the i2c bus power in order to meet
> low power request.
> 
> This implementation includes bus regulator control to facilitate
> proper handling of the bus power based on platform requirements.
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>

merged to i2c/i2c-host.

Thanks,
Andi

