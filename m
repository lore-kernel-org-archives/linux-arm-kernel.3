Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCE0C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVLqIkYv+eBmdgh9AzWCJ90b9WZ/2sR3WX5M/g/GVaY=; b=RNouSG6SR43reV2S8gS8j5qnoW
	PoWvHC7T6L4aUAU0NhrmDEspf+yW2HIm9ouOuLHrovQ+etlj+TIaCL+MGgYegUVCf3gL2VWc26JH/
	ttkkImMt1VIthaaG77AZZUtIdzVwcfJaziAmhofoXlE0CfabtE9DAzg3QaauKCsZ7wPxUVzxDpXql
	+AqmIvkEQiK4S28IGbXsl2MHNMFy5ov/LVnLTmFkbFvPLQbngUQ/V4whzNakVEsTtlYFfGCgSu5Ut
	RZbyuXlsQRVJmdzk1uj8Qty2VyS/K6A0KO6F9zNDxWMDJY5ryIbtpTdjIn9hsVfuxJAU7X9I/fQ/p
	kOGQPF8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57S3-0000000AYWf-0KOh;
	Wed, 16 Apr 2025 18:25:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57Dr-0000000AWXk-294b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C47084A382;
	Wed, 16 Apr 2025 18:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28084C4CEE2;
	Wed, 16 Apr 2025 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827054;
	bh=BwHkWTpOhur440Z80ly8g3N+djQD6dBjxS1kT5nV74c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzmYjCsNepDSraryG5VzpwlDZMymqsbCUIVG1pE93F4nsvJ4sDUKkIFceIGn8SsqS
	 zTTTblMvtpNo4tz5BuU38fRzxWuWXvj9KKn07rXgfg786pZE7moBJKDzN0cWo+pKba
	 1WqTfdUgmXyJkofHy+pcBGnfJvqFg8ulA1BqG91BvG2a/vHN0gKGU9T5BiT2VjSAk1
	 EQ1qH6zHSeXlNy7WWa1++M3lNS+qOj99aCAKZDSBaxoPvdDx5xjr9rKNS7EVlkpPEX
	 8VzNpr0+ZnMqloSkevz2u734MLJELNtf1/Fc5fQNt/0SORCDqLTE8WFV4Am8FM524w
	 VbZQCI0SUXE2w==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	ulf.hansson@linaro.org,
	linus.walleij@linaro.org,
	catalin.marinas@arm.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sricharan R <quic_srichara@quicinc.com>
Cc: quic_varada@quicinc.com
Subject: Re: (subset) [PATCH V5 0/6] Add minimal boot support for IPQ5424
Date: Wed, 16 Apr 2025 13:10:44 -0500
Message-ID: <174482704415.446874.4349704931217088020.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20241028060506.246606-1-quic_srichara@quicinc.com>
References: <20241028060506.246606-1-quic_srichara@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_111055_567055_1D3F02AF 
X-CRM114-Status: UNSURE (   7.45  )
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


On Mon, 28 Oct 2024 11:35:00 +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways and
> Access Points.
> 
> This series adds minimal board boot support for ipq5424-rdp466 board.
> 
> [...]

Applied, thanks!

[6/6] arm64: defconfig: Enable IPQ5424 RDP466 base configs
      commit: 4b77122818239bcc05995d0234491b91c8cd477f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

