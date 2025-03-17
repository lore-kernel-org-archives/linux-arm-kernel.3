Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB90C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 17:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpipuAxqPW1dg5rtnXmqf7geV2rQwrKohm20kVDjdjE=; b=M4cU52VijbnTz9xUJJoXQ1+Jwz
	7wdM2BQJusovMjliH/fc+s1IUdq1qBvClvIV1c6z524FvGQoK6dHd5wIu6L7zqdcUSCNdIlAD+/6f
	CDAfPAoJObyL1v+uCiuYwLO9r5UmhN6G02sJUS07iDpCnLauIwBeVEGdwouxzgeblP+4hHviOGRu4
	sYbXdADA8K76CBsfkR4Jxvuant7yRS4blfZqZttKiJcioqF0I1aZvd4gAMI4uvd5lPRIu4x1+Zci3
	1OfUFtsOTCFeq0KlBt7Nk07IIyXlIC8t7RZBotMfSxJYyyFyU0DN5ZcqH/avz0DsWXSPFliYO93Fp
	orahHjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDue-00000003Smr-1suD;
	Mon, 17 Mar 2025 17:06:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDsw-00000003SPJ-3eSN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:04:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8676DA48B45;
	Mon, 17 Mar 2025 16:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954E4C4CEE3;
	Mon, 17 Mar 2025 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742231057;
	bh=+0Yok0f4BvfhWWxYAciYqdDpMnOmtFLo3n6+UuKVRgw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kfoKHWtwnkmFbMNWJlgQddRElUpFQ964Egvhgn+4DBOHbw1x1hxBwBOWIpdr+V6gN
	 +uXysXkEPYgBcnny+7t2souzVBkzw+MFZBgzpDT5SRIJEsBQWwz+263CKI5GX5FbFi
	 Q82LTP7hXXc+GlW+P2OVgkhvJRTih6XF99NJ1OeivS8Q5sDJMIaSwG2Xm8NYBYcxiV
	 a2Y6T5tgWCJwrJA5yl4uznPRdi9Xt0AWMf3Dm2oqYgXTG3xBvSpV6dRV7rQK9wD80u
	 7PpD8CCA4gxsVOFgUus5fGj6hgwq8DtZcQFoe4yNY0RdViWTHwXu/wLAzN6vX9yh/g
	 6LJPH6HCIcDFw==
From: Bjorn Andersson <andersson@kernel.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com,
	geert+renesas@glider.be,
	lumag@kernel.org,
	heiko@sntech.de,
	biju.das.jz@bp.renesas.com,
	quic_tdas@quicinc.com,
	nfraprado@collabora.com,
	elinor.montmasson@savoirfairelinux.com,
	ross.burton@arm.com,
	javier.carrasco@wolfvision.net,
	ebiggers@google.com,
	quic_anusha@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: quic_varada@quicinc.com,
	quic_srichara@quicinc.com
Subject: Re: (subset) [PATCH v12 0/6] Add NSS clock controller support for IPQ9574
Date: Mon, 17 Mar 2025 12:04:13 -0500
Message-ID: <174223105141.2000272.10352611755097062716.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
References: <20250313110359.242491-1-quic_mmanikan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100418_977232_69CEE332 
X-CRM114-Status: UNSURE (   9.14  )
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


On Thu, 13 Mar 2025 16:33:53 +0530, Manikanta Mylavarapu wrote:
> Add bindings, driver and devicetree node for networking sub system clock
> controller on IPQ9574. Also add support for gpll0_out_aux clock
> which serves as the parent for some nss clocks.
> 
> Changes in V12:
> 	- nsscc driver
> 		- Pick up R-b tag.
> 	- dtsi
> 		- Pick up R-b tag.
> 	- defconfig
> 		- Pick up R-b tag.
> 	- Rebased on linux-next tip.
> 
> [...]

Applied, thanks!

[6/6] arm64: defconfig: Build NSS Clock Controller driver for IPQ9574
      commit: 95204a95fd9657ffbd3f3c4a726e458833e4213d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

