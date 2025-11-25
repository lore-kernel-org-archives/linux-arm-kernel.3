Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04C1CFD37C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nzjYoLuwpYnz7W92bzjIjzD0CCCnI7l331fHmFyPX4=; b=osEskS0opaX/uf1IDgxdjP+oRA
	O4695iIGGeGi3/CS9936HHoT5+TFylG1iQ54Ft43softasAHxEUtQlEN8mhwGk+0pI0zyF74fQfG0
	jl0WBrQ1s3Ce0pG67BkXdtF6ridy4PRQrOfxCN45vqs0XrtervT+re3qJTm46xPY4b+uF2Cf5ca88
	RjXs0YJ6Q5QpgE+QKgFpVjU6kPdkCl+LPIEhF5Z001q59g9JkrPGX+NwrfwKZevFfBpbj15NkK+aK
	cpbwaB9mCcMLFlEMGmCP+62bK6qk0ZM025DmJSCFll11qf3H/1qwHgu7jpoBA3rxiOpqu3zR131py
	9y3QqJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvsb-0000000Db3y-1VH6;
	Tue, 25 Nov 2025 16:27:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvsY-0000000Db3E-3thN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 16:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7nzjYoLuwpYnz7W92bzjIjzD0CCCnI7l331fHmFyPX4=; b=ZbaNjvR02uqUoXkpFZUTGgs/dw
	kA52jOICIIw7Fki34N9cRTDMfueZcuh7g8ekx2s9FpvqAiQFP6a8N1GMfCpkk5/UkcoVuqwPrIjXb
	iDuiEfrVWUTjl4BiUtFA3l9jBK1c4jmNYGosHWrV1lPV4pmk0NbbnCPjBKuuYWvFEkXQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vNvsJ-00F264-O9; Tue, 25 Nov 2025 17:26:43 +0100
Date: Tue, 25 Nov 2025 17:26:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: rohan.g.thomas@altera.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: Fix E2E delay mechanism
Message-ID: <e721d2d5-73cc-4c32-b99c-55f0fb625563@lunn.ch>
References: <20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_082658_969969_C2CA0230 
X-CRM114-Status: GOOD (  11.73  )
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

On Tue, Nov 25, 2025 at 10:50:02PM +0800, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> For E2E delay mechanism, "received DELAY_REQ without timestamp" error
> messages shows up for dwmac v3.70+ and dwxgmac IPs.
> 
> This issue affects socfpga platforms, Agilex7 (dwmac 3.70) and
> Agilex5 (dwxgmac). According to the databook, to enable timestamping
> for all events, the SNAPTYPSEL bit in the MAC_Timestamp_Control
> register must be set to 2'b00, and the TSEVNTENA bit must be cleared
> to 0'b0.
> 
> Commit 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism") already
> addresses this problem for all dwmacs above version v4.10. However,
> same holds true for v3.70 and above, as well as for dwxgmac. Updates
> the check accordingly.
> 
> Fixes: 14f347334bf2 ("net: stmmac: Correctly take timestamp for PTPv2")
> Fixes: f2fb6b6275eb ("net: stmmac: enable timestamp snapshot for required PTP packets in dwmac v5.10a")
> Fixes: 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism")

Given the list of Fixes: do you want this back ported to stable? If
so, you should not submit it for net-next.

	Andrew

