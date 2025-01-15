Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1125E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 02:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1lKjpbk63mxtl7vga8tYlGlCIEdePmj224F6xKAau0=; b=BxgRWuNKzDxIaZKHB+ip0Ldld/
	375ETRNTAuFDtWsLgwbTx5+HzMS0mj9o2VP8Mj2Xa3YK/qpaA68uNf0iFpl8vbsxJZX1g5iITslWp
	1SKFT1Z355ThvMR78sjia6K+eJLVjk1VwA/AWGtF5WdX1t2noOnCwITPfNvhMOnLIYic1I/dCIcD4
	5AO4Rqnx7dNDz/oDxNlO+kaTeU/a3s3Ba9LNif/ZDMUTJsLii1U8zCrnEFU9sN9Ri6PIrmXdVCLm+
	wEWOFCRZiUNgzrhZskTJGq9kpZpBiplcJCGVgEPmHYC38enxMEzLy+PKXS5KIwfON9ZCZlEdh6KSb
	SWCz5DTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXspH-0000000ANEY-1pfN;
	Wed, 15 Jan 2025 02:08:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXso1-0000000AN8G-1nUW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 02:06:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC4615C5A83;
	Wed, 15 Jan 2025 02:06:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3A2C4CEDD;
	Wed, 15 Jan 2025 02:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736906812;
	bh=Is2DEKJqxrZolAAhs79aRj+JZ1MAa+Qb4ZhMoIVs3d8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gZyofTVxT+u0L1znLIHaVN7i/eistrx0gCPsPi/UxOgGoHuAjcBiP6ME2pKBxTacu
	 zFM1j6uCI7pcHUql7guwQmcGIuNSL3tQcbl9j2CbHRJ61+aODAhHOJ7cU6sOx1zv/i
	 q+gJCXt/eCmA/hOWlACdyak6CaezRoe/2rLWeDI5jIvDIsbLB+2AsJtOqMYiLRx0CA
	 3KdE7YelM4LW+HUdQwrvQl2ep73dZ22N2wBND0ITlX4VnZTu8usyuK037Q3acaCgWq
	 mDse7By8hi98ni1zoNYA7Ug/AO/THF1IxXS8zkiBQbtnpcAgYLKZXh2euq5Il7jQoC
	 GmtnMio6JkIMg==
Date: Tue, 14 Jan 2025 18:06:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, imx@lists.linux.dev
Subject: Re: [PATCH net-next 2/5] net: ti: icssg-prueth: Use
 syscon_regmap_lookup_by_phandle_args
Message-ID: <20250114180650.4ba50ea4@kernel.org>
In-Reply-To: <1376b2b3-90c4-4f06-b05c-10b9e5d1535e@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
	<20250112-syscon-phandle-args-net-v1-2-3423889935f7@linaro.org>
	<0eaff868-f67f-4e8a-ade8-4bdf98d9d094@ti.com>
	<1376b2b3-90c4-4f06-b05c-10b9e5d1535e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_180653_514944_74F71B29 
X-CRM114-Status: UNSURE (   9.54  )
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

On Mon, 13 Jan 2025 12:04:35 +0100 Krzysztof Kozlowski wrote:
> > The patch only touches `drivers/net/ethernet/ti/am65-cpsw-nuss.c`
> > however the subject suggests the patch is related to "icssg-prueth".
> > 
> > I suppose the subject should be changed to "am65-cpsw-nuss" instead of
> > "icssg-prueth"  
> 
> Indeed, copy paste.

Will fix when applying.

