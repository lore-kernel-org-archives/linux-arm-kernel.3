Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE96DD5E38D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TIpKfwdT1+V2/DYFro5omO/AHjLEeNsZo5nVmsz40p0=; b=pDX8IDLQ3c46gR9VxaLF9Kp6f8
	DcpnTpSd0weu6hnsJYjUsatq7Fhw55OWzrz4i/TGPIGGIHihsktKZsNMTRWG0GjiFuL132P7Nb1to
	QlK6KoVyX3/r9ldIcktnq5IxkxzQ8sKHJ+X1Ybc8AvTZhXYMqdG69w/ilJRJZ+ZzNyeoTFqOGzD+G
	qwpIhCPmwjn/xD2Ytj9oLyI8cxmr03mSEbzfLWzeZ6l4Lb5U7KWqgMdLJGReGLdIXsLqcmqZ09yaU
	khyEfvRXfDi0EWPpWOXzBI6R3L/WfG3SOdPB6vSufN7obugx2oVN4aJ1HXzStbzhOVcd2oVtxLl+4
	o7LazJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA885-0000000EvJl-3jRS;
	Sun, 10 Nov 2024 13:37:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA86K-0000000Ev5U-1JBw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 13:35:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C033BA40BA8;
	Sun, 10 Nov 2024 13:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76D3C4CECD;
	Sun, 10 Nov 2024 13:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731245731;
	bh=wAosZbIeN6i75DZ5IsgZbec7MRK0ROPy5XUoDy34nVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIO3FtlPwBtQzNX8Fv2NF3KEdJX2RtwjTu39d03m+uljJkRn7OH+k8RZPnmgcFxMq
	 M1hfjVXujTHfJMX6lffuBSc8ENpI9wWnC8D1P+N2fAl6cIfO5oFJWQf2nFUwflwlmL
	 /VvhI0PQt2tZFZSh8kZSsoBd5wg4ztRHl8IYNgyS6BeVTkAjQHaVPQaucIJzGtoSP/
	 mWbEIo81hX6927L4OIw99CG6RUamy+stIDIhQLrIwM1tAM0bN2srXhHy9M6ReiR5m8
	 wQl6pdNj/YHmNLRs5mWa3Upps1A/nSV1Ib5q4B22FH1jDr7DxiLz6gPRdDumu8JDoI
	 AO8UytdIltBRA==
Date: Sun, 10 Nov 2024 13:35:24 +0000
From: Simon Horman <horms@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lftan.linux@gmail.com
Subject: Re: [PATCH net-next v3 1/3] net: stmmac: dwmac4: Fix MTL_OP_MODE_RTC
 mask and shift macros
Message-ID: <20241110133524.GO4507@kernel.org>
References: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
 <20241107063637.2122726-2-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107063637.2122726-2-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_053536_437117_C07E434B 
X-CRM114-Status: UNSURE (   6.82  )
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

On Thu, Nov 07, 2024 at 02:36:34PM +0800, Ley Foon Tan wrote:
> RTC fields are located in bits [1:0]. Correct the _MASK and _SHIFT
> macros to use the appropriate mask and shift.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Simon Horman <horms@kernel.org>


