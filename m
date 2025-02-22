Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B023BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 10:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLpjXo+GVmPwyWEF2qYFfEoZfsGZe5JCfcxy6CJgOEo=; b=TPe2U32YtZvagtK03d9tTuMMx8
	oxHmse7diP5Ut89Ie/Wz4IA+rUbx2O/YCJTLZea7N05uz/Ws9BeBkFoFHiYZ/DP+FSopncrHaWgeF
	DJZaGKmrz8nyCt7YN2QGohVr+NiYppsmhu0k2VLzDVC8FeZwcB/l8gaZiGOh+7P1qyfoj3bLkgk+R
	PLQS8HV69gfCUyV62UjFJYSNyWPH6DWOrl+9uOwBa8zwH30Rfi2W0hgB33GOg3WeFRNorQEkFqgwr
	QjiV7O5N+gDpbDyg4yy2yndKWho03+aNo5VHhbf6xcKomKtutPb07jlnO1kBV0GG9ZjMTht7PoS48
	+tiXEntg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmKd-00000007nRC-1JMh;
	Sat, 22 Feb 2025 10:01:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmJ9-00000007nHB-3v3e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 10:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 035B55C4D03;
	Sat, 22 Feb 2025 09:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FDCC4CED1;
	Sat, 22 Feb 2025 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740218426;
	bh=O0GBKjyjvst1Ef+k3JkpAQlW8scAA9rB7DUZrqOeRDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oc2fscaEwhy/TUTIxe3wf9j8WIRhkk1A87kqKUKxmzwZ2RSIbP5HuqEiQGHMS41sJ
	 IuMORh5KiiBrcUB1G/rfWq9LwRjHBeKZy4pihkOC++Fsyo/TM7rJ3pxYLcLNvbf5uP
	 mzZAIwcGrLLv9EZbGix723ngzBn374tQ+t5/XgIxoA4NrfHDjTun3v6qzdU/AZ2ZIb
	 DgoswH6eLC3JeavzhgcuZBD+6E2O0trw9wh4ERrhuVK6aP3aN0D8S+9Zf3uUaPSgqN
	 tim1TXV3XWb8KC0v4O9A6IucpXEraDL6o9zdZtGTKlsbg4BOGAY1iI3gvTlFkgwxXU
	 0dj7HLInl2eOA==
Date: Sat, 22 Feb 2025 15:30:22 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: use rgmii_clock() to
 set the link clock
Message-ID: <Z7mgNoJTIE8bbxte@vaman>
References: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_020028_018035_085D5DCD 
X-CRM114-Status: UNSURE (   6.02  )
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

On 21-02-25, 11:38, Russell King (Oracle) wrote:
> The link clock operates at twice the RGMII clock rate. Therefore, we
> can use the rgmii_clock() helper to set this clock rate.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

