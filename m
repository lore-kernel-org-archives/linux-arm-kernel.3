Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74705CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 21:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOXrp9J2r+CDi4nERcGa+NMGO50us7+1tDY9PXJ0VsY=; b=i8h7qVgsobyvZQJILYFj9WxNwg
	ppQQ3N1iDl/Xn+8icbWZ8GtXOHQ+PwCtdO7sTqqkgHkUMlqcFedIhmgVu8ZZETNZ0mO+8ul30qGCn
	t4ojz/2nYTjUbee5CA6/+nx+wv5jtOHxJOa2V+Ce7mYfor++Xj6xPKP4DC6F7WnHwEM/p7TXFpBma
	BOooVsXY0pRiGfKKPJjB4KSNcxW1g344irmHM5FWPp75Y3+ToVEhCtswTSRuQigqPAM78w/DiPzNN
	osPW7UGqRKbhywjmX1F8pLCr/npEVOpiGdHMJL41usaLGojbC1vMQrpeE6j+A/6aqExGxI6pN3Hpj
	F+ENULjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqLb-00000003TUo-0Pet;
	Sat, 08 Nov 2025 21:19:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqLZ-00000003TU9-0v7s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 21:19:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24FD1416C1;
	Sat,  8 Nov 2025 21:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE8AC19421;
	Sat,  8 Nov 2025 21:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762636782;
	bh=mZBsIKRxZAfCP/AlJVftP7beNGOQUluIE3BGP9P1dw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vDMlrKidahpBtOn2ZlZEV2PBA/P88eO5JznXyzI1JZdTtFycjYBsB5VNduiV2cqAD
	 qXyDl+1ttAL9sBfgG0peDfmavGmVvXr7LYnxUEjXEgqFNG9f+YK4sa+lFIbxFC4QO6
	 0HvTEKyoMZa9FQlfGeXa35IHUNqaJLG2up8TPg5GjbvtjlbOzL2cUv23roWzK94EuH
	 AbATx/ci6IaKz1tNR0tdfrEXGcLljVMNQgNqMjDaEWoHU6H5BaqhnoUwhwkbPIfw6j
	 pXT83X0x1Kp6qiKfG7kRtBUsKXsXKPtq66I1J8mHPqS6vD+Gtwnt5JfGb/txAhrZR6
	 Q4mGAJ3aG0yRg==
Date: Sat, 8 Nov 2025 22:14:49 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Tom Rini <trini@konsulko.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] scripts/make_fit: Speed up operation
Message-ID: <aQ-yyfwbGJNTS6N5@levanger>
References: <20251006230205.521341-1-sjg@chromium.org>
 <20251006230205.521341-2-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006230205.521341-2-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_131945_280386_1F79507B 
X-CRM114-Status: GOOD (  11.36  )
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

On Mon, Oct 06, 2025 at 05:01:52PM -0600, Simon Glass wrote:
> The kernel is likely at least 16MB so we may as well use that as a step
> size when reallocating space for the FIT in memory. Pack the FIT at the
> end, so there is no wasted space.
> 
> This reduces the time to pack by an order of magnitude, or so.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>


-- 
Nicolas

