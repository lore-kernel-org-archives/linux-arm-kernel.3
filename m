Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051F7FD9E2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 01:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a0ophL26+sVcN850DI9mUVGoIJLV7TZp6m+ZBROay8=; b=tkqwUc+nLHvjVNSJJyPkjviXiq
	ZnT6Txwjap3vWEfZgMfb8ySw009scEbI8CZw13vPSvXExKKkA2COqqBQKP+tk78IgzGexpk/WPaE2
	QKaM/l5zCqEKEHKHLBHjDnY1oIDkmMZbB+mOg61VlscxdIsP6BnLorLvq/4w5b+Z0/iTuYfLEetyq
	ZR9SVAYAI4kkHm3PeilY8j+SwL83mg/fWu/EsyH+UGUV1YTYZwDAqktJFXWn2SHWs6B7q2pPe7ziV
	QTyck1CyBfX8P6AWQQNp5/6cTYPKdou0FdOAR0dSk4Dr1fbtqIfrBdjs/wFRu/yXBmbXbjyNvN254
	8Oqq2Faw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvmcx-00000007UDY-3Dpd;
	Fri, 27 Feb 2026 01:26:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvmcw-00000007UDB-0czI;
	Fri, 27 Feb 2026 01:26:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A2DF43599;
	Fri, 27 Feb 2026 01:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65302C116C6;
	Fri, 27 Feb 2026 01:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772155604;
	bh=hSJg4qauvG+7+fWEs47LIA3wWemCOEi5vHzM2SoFyQU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HVsPwexo8yQC1McqS9JeWC0dIgxu1ad7PFQ22F991iYeUBVcYSuPOP84+EK5Y9pJB
	 s5PJk8FxLshZme53gbaRIOggFE+wq9oL5Os0uK8s1L3/QJYzquBLDZ0wHuN62GGBP8
	 44IszaOZK0R6ejURWjnzivmC0W1LEGgDI1QNBzyYM0f5wh/ZXMRcK69pYhStJ0RECS
	 8sFIquFryVggccd5pUkOnJ7HsoAy70K8n4IbQzTLC2aQv7vCMR9/+zQVd9KfpHbvFA
	 mg5035FzbtoblNIfsRDZSJgRrIRS26FBO23ak1AqrCpMD1AB9c7iA5URfN5LqlAUqZ
	 +KcPyCNgIMV6Q==
Date: Thu, 26 Feb 2026 17:26:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260226172642.18a0b20b@kernel.org>
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_172646_218851_DCFABFF0 
X-CRM114-Status: UNSURE (   4.90  )
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

On Thu, 26 Feb 2026 23:07:16 +0000 Russell King (Oracle) wrote:
> Subject: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further serdes reorganisation

The only exception to the 24h rule is if a reviewer _asks_ you 
to repost ASAP. Maintainers also wait, there are no exceptions.
Please don't do this again. Having to deal with multi-tier system
of privileges and rules will make our (maintainers) job even more
miserable than it already is.

