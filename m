Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2664FEFB4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 13:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPIqTFFpT/PXvwbQOLCA7CZTzOhp7BPu53PuAcWiGq0=; b=JSdLTvkAnKg3zXNqV0jge4ISeX
	Heu+VDlHtW48KbarleJ5odQRQWrd1ci3Buk0v1A59u0vwKEi62IHZKANssLKQ+EtrJhltT9Rx3yBe
	lU4G0pW5cTZcseNJyuInPmtijboVW0QPzrsoKT7wN++dfteqViXyn7sETQ2laDAOayzR9STtzDJXE
	pp6cRqYWWtr4s8aQB2MPxotUg4VA7kJsws/p4m4s9caw3lAIY5MIJGr4WIjWeIr/b12/9BSG5bT+7
	grgXLiy+QAIWCVgAfswBsmjVP3ZZu7909VTJ1reA/usrD4KE0RuZ1bBvWZSzPnqgMi2afQh8M0SQc
	GwGVeDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyAH-00000008OdK-0oil;
	Fri, 27 Feb 2026 13:45:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyAD-00000008Ocd-3FBo;
	Fri, 27 Feb 2026 13:45:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D47CD40183;
	Fri, 27 Feb 2026 13:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02162C116C6;
	Fri, 27 Feb 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772199952;
	bh=b242g2qNf10eAecZBeoervTpA+wsH+kaSLHINlPH/aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxnQmO6FxSK9R8f9ct2N8OQyn1ufXUd6i18deXkxbsu0sXgYwCE5rarxBeew/HF2f
	 UUt420Jcfpt4ij4pGxa91h7L7C4HBJXjfcsMzbXStKwi6GDoLdovUmw0xlpoEGhCz4
	 UvdnnGUTzUhgCDs6y38V0FQnaV61NVcL2tHlcSBlCasBjCqfmWJbvCw+wBtMcvLn+D
	 Ubtb4tLUVTA0oItWJrqTynbPtdSFuCA+7YTajUxfbIxz5OJ/DTUTw4OOCW8W/lgKrf
	 769x3gGF2uw+uMN26XoR+DeGGiBa8oE3aDw5u5uyrAePiT8EVxegJPPFh2xMQUK2RB
	 6Exubf6OBYUqA==
Date: Fri, 27 Feb 2026 19:15:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 7/8] phy: qcom-sgmii-eth: relax order of
 .power_on() vs .set_mode*()
Message-ID: <aaGgDfaOBHNY6xL2@vaman>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <E1vvCcE-0000000ArLT-1COQ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvCcE-0000000ArLT-1COQ@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_054554_119546_FFF9926D 
X-CRM114-Status: UNSURE (   5.53  )
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

On 25-02-26, 10:59, Russell King (Oracle) wrote:
> Allow any order of the .power_on() and .set_mode*() methods as per the
> recent discussion. This means phy_power_on() with this SerDes will now
> restore the previous setup without requiring a subsequent
> phy_set_mode*() call.
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

