Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA59BFEFB50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 13:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jZDVoK2Jplw2qyaKtdF9bM6jWLT9Yo415ZI36x6Apc=; b=ZVj4qtxwWl/+ipGV3xPIyKnWjT
	rpij7MxrG3Gzx+Cnxyis4k9d8vW4jhaRhku69ZWfiNYB72Hzuz6sOv25Jm03ou9oURB//splxURW0
	gHVNN1dtr7SXcr6lYzaOhsMNuRnFvUOzn/FsWQcM+sH7l20qnT4+mrUw0+G4c+MAkj4uzmhtrLIhy
	glulcKiLqaz1EqMJHq95myKda8QAd749JAkWXqY4+c77sK7A1pS8FVX7mk4xRNRuL32qoOliXuR9S
	a2bQtd/YAjnCX89RiBcaBZIeep1OQaMpjEyhV8gO/7UkK8Ng+vhnS6EFcYKgmLIMpaSKq+/JsGD3R
	3QUwMMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvy7W-00000008OHO-4Asu;
	Fri, 27 Feb 2026 13:43:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvy7U-00000008OH0-2KJC;
	Fri, 27 Feb 2026 13:43:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA5A742B8B;
	Fri, 27 Feb 2026 13:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95B7C19423;
	Fri, 27 Feb 2026 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772199781;
	bh=Vsxx0tf/aez0eT/Zy9uhaG0dHCfN3A4iBIahMreaC/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRWRg1pU523wK9B4qH/oqfxalX1dWT1tRMgvmqEhkAiQCC6+aZk47rC2NcYr6UhO7
	 GSaSHNrYzBOKKhEh7mMElKMbIDwYIVryRv2a2FKCzh/P1lwmx+3yg7CYFUgUSSH3nm
	 CS9LpGw+mDUvIYt+G4TAFRUiF8RMm6xHL2yo1kipylcbA2Y1kDSNeJetaEvXB8TCct
	 q//5qO9lU20DNXf1PWD6Wus6q11rsXwDCKxYDHhlxzJD5gag8NF1z+LfJQ4HBDiIYD
	 kXX/RBc8sB2pEWWe6mDQ76zpgQoYJL1j4f+8GDWw60K/7018hfFa9IdueKYAESm5AS
	 554gGzUr67QjA==
Date: Fri, 27 Feb 2026 19:12:57 +0530
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
Subject: Re: [PATCH net-next 4/8] phy: qcom-sgmii-eth: remove .set_speed()
 implementation
Message-ID: <aaGfYSTaBEQpLG54@vaman>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <E1vvCby-0000000ArL4-3x4U@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvCby-0000000ArL4-3x4U@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_054304_614085_C79A82DC 
X-CRM114-Status: UNSURE (   8.99  )
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
> Now that the qcom-ethqos driver has migrated to use phy_set_mode_ext()
> rather than phy_set_speed() to configure the SerDes, the support for
> phy_set_speed() is now obsolete. Remove support for this method.
> 
> Using the MAC speed for the SerDes is never correct due to the PCS
> encoding. For SGMII and 2500BASE-X, the PCS uses 8B10B encoding, and
> so:
> 
>   MAC rate * PCS output bits / PCS input bits = SerDes rate
>    1000M   *       10        /       8        = 1250M
>    2500M   *       10        /       8        = 3125M
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

