Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97259D70DEF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 21:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRGDSLsH1Ba5TlpGi2/Qppd+TqYA+uIyrCSKV8c+2WA=; b=jV1j96EoOa3C9bSkCa1+9X1asi
	g5qmj1tmlmhdvhc1LVjZ/yw6QKc7u5AewyzdH6ilUfj6y8wUy3nBtzmYLbsI9JORstAF4mNPEeNTx
	s2NvS+mjMDO9hx7o3zR5n9oap9FRCzr/Ejbg8X3ySyA58a/plm74MB7OXAUjpxiNayvcOHRoYoJUn
	iBp2Rgm2PEnu3UvZNcY6OTt/9shiALZBPfvSzxRnSfNA+HuNFEHd9Fio75mpb9NGCdy+Z+rePvfO/
	ErfUu0nSjOxhy/rOpx1bRcbQ/aRNU+Nif7OH8gjfIJnkZ4z/d/ANohXKCOdcRReOgxQLFzPVjSmND
	t2zXwa6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGlng-0000000GPhK-37qf;
	Thu, 28 Nov 2024 21:11:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGlmh-0000000GPbA-3MHO;
	Thu, 28 Nov 2024 21:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dRGDSLsH1Ba5TlpGi2/Qppd+TqYA+uIyrCSKV8c+2WA=; b=ZICoxLpNRbdIDou0AmGn11jvlc
	k03QIEqjQElwbzcq4BLd4vJIAj0vxYBM49xS66tC/8H0HkgCthYtDSsnTQA+p9oNSM5ND77P7Gstm
	PLHz3JTUgHezjhaLnl1LgIgqJs41QR5KT94GVpPKokNyyLGy/UYbJmbLg0LeyArhA2Q0Q2Rgoz5YS
	gVzkXjmrcRllJu45vXd0Q9c+TF8j/1deQYNLQIZHcCHyo1tKBys+jGiDrHmKvnv1LP57MZb1bqaf4
	IcTqWIkje74vkMCvBCNcevb04kafzs5W3X8JAK3FaLWtlc0ckgYdh7MPjtOnqD0oAMYivtAMObQFd
	hRUwMh/g==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tGlmY-0007ud-1h; Thu, 28 Nov 2024 22:10:38 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@theobroma-systems.com,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sebastian.reichel@collabora.com,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk verification
Date: Thu, 28 Nov 2024 22:10:28 +0100
Message-ID: <173282819998.1000394.12551012503214788208.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241115151131.416830-1-heiko@sntech.de>
References: <20241115151131.416830-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_131047_829706_42AD01EB 
X-CRM114-Status: UNSURE (   9.18  )
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


On Fri, 15 Nov 2024 16:11:31 +0100, Heiko Stuebner wrote:
> The clock is in Hz while the value checked against is in kHz, so
> actual frequencies will never be able to be below to max value.
> Fix this by specifying the max-value in Hz too.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk verification
      commit: 5807f4ee6d32a4cce9a4df36f0d455c64c861947

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

