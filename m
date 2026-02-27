Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91D0FEFB50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 13:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVq0eY/Q9TFKTYXSf0I+/8LIb40WHB94r3wZtaoWslI=; b=LswWWR5UQPqomJl3ENFQkoMXcJ
	iaTZ91ankNSwMqQbhGhw8Ph9iFH6EVoB9g4wbc2m/BMh3mkqsMc0jrarA1fq3d3v2nVA89wHKtzRH
	iRscxW8cfsHVVVc8mdp+zDCMm5l5fKdfYwwslOUi8Vn7uAjUOkq0Zv7feyd8jgjaeAMVO+UX8EFKb
	TT3YqxiYFosiQWjoBoFctYpOojSXReZ4ksSfZoOMzh1d7IamERFCLcBIpEndvIuh1q+oHh13Gy/oX
	Eqnfs1ZEeofvnFeVHVUqtpfu/63mDt0WggmF1DSo+kCn9I2++X7FRP0usL4+ENKRibnHGfnaC3oFn
	iYiDSNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvy8n-00000008ORC-42Im;
	Fri, 27 Feb 2026 13:44:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvy8m-00000008OR2-0wzU;
	Fri, 27 Feb 2026 13:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4488E60008;
	Fri, 27 Feb 2026 13:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74884C116C6;
	Fri, 27 Feb 2026 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772199833;
	bh=w8CiRJDdjaW9aDKfP3+nyfiRb9ToVwtTsc4kKJoE85c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VsOPvrK0YjRdtxU/ZGev/S4fmMq05NZwIwdOFeFe+B0qw25c2AMMOyobge3/TZLnQ
	 rlPgcDFNFHZfSIYsblbHYqYRDUHRnxjV0UmHuepU2mev5kcSgCdSHIXbwAqcoOZeVc
	 jH2jHKeC25WdjAwXHgbMCnDYSLF+klqLCF/gzf63jlN9v8g3UvqFahuuOrkTUK4EuO
	 Ylm5PRd2LZgBOS+I/FZWPxTp1FBDbWvR6PbjLDGmsoGrhw5ISy98PMb8gyPPkSIuTv
	 /XdT0lH0C9wPEuz5QADkForJx9rHpxqOyaOFr0AHEtM8AWD+lSADVuNbn17y2zfKR9
	 3GxNIYISdhziA==
Date: Fri, 27 Feb 2026 19:13:49 +0530
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
Subject: Re: [PATCH net-next 5/8] phy: qcom-sgmii-eth: use PHY interface mode
 for SerDes settings
Message-ID: <aaGfldzQq2nL0rx6@vaman>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <E1vvCc4-0000000ArLA-0Eix@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvCc4-0000000ArLA-0Eix@rmk-PC.armlinux.org.uk>
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
> As established in the previous commit, using SPEED_1000 and SPEED_2500
> does not make sense for a SerDes due to the PCS encoding that is used
> over the SerDes link, which inflates the data rate at the SerDes. Thus,
> the use of these constants in a SerDes driver is incorrect.
> 
> Since qcom-sgmii-eth no longer implements phy_set_speed(), but instead
> uses the PHY interface mode passed via the .set_mode() method, convert
> the driver to use the PHY interface mode internally to decide whether
> to configure the SerDes for 1.25Gbps or 3.125Gbps mode.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

