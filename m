Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B433BCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxV7ngvfcwDYs3XVjbuPiw74ltU6lWm+WOr2nuykH/4=; b=0DX4u+7350N/AdZapt+R4syS2Z
	iz8z70+HA44GU7xKmtcy8XbQn+Od2hWqrzoMBYrt4HxM/8Pi/TNtnDH05SKgZ2I1VSfZnAgoSOkcc
	S3e6W0z1wbhin0RsPXZOTpMY/TrSW6cW+kcKs2/CwnY4LXSF4/bJll0NDaCk8ULtiAc8x8zTNaDRP
	4jEOqdMvr9MPYG8+w8zll63w2SIoCkiWpxZhFTBi5i63AAgCuyu0HqFXQKRZYGLdU6JhfQvsC2SUd
	89wse1zHqODPsYipKc8EnYBcOfWkTdc0yK9Yci3VhMc9M9A9gFCppae10jTubi+jmEdFNiEm/ldUY
	x98xFExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKKz-00000008ogz-1UoT;
	Sat, 30 May 2026 14:06:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKKw-00000008oga-0ThA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 14:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=jxV7
	ngvfcwDYs3XVjbuPiw74ltU6lWm+WOr2nuykH/4=; b=aq3Q+QFHpOXBnB8eBf3c
	XMGVv2c6YeAfcCasT57jtlGaBtFT9SgrQQ0sEl+ha6L8VE51V0O2sagjYy3lv8qI
	lwsrcCaybcN3scUUkoy9NQIbeQ1rf19naDYryMoH8Ui4e6jjG+ylqRITqhCieHPZ
	ioBT12l5WFwCEEwoU2cRILw4V8P6Rse0JvT7mMJvveoCOVikmcpIf2lALA2a13Pu
	mN6kfSSXDu4/MGGQNiKTyxtvzMAm7c23kAoRa51MoXTMbjKptHwkuAWW0Vl/bCvC
	gcnb87kNPVpw8DB8N+fdgXfKHTyViS3/1cQ7APAUiJvB4NNZIjGFG0xihAH6Y2vN
	EA==
Received: (qmail 1763752 invoked from network); 30 May 2026 16:06:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 May 2026 16:06:45 +0200
X-UD-Smtp-Session: l3s3148p1@Mci0eAlTGIAqAQ4KEBW5QLbOwWyJKVt/
Date: Sat, 30 May 2026 16:06:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Suresh Vankadara <quic_svankada@quicinc.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH 2/8] dt-bindings: i2c: qcom-cci: Document Shikra
 compatible
Message-ID: <ahru9MckM2pHN4m2@shikoro>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-shikra-camss-review-v1-2-645d2c8c75a7@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_070650_431330_9D8DCE3F 
X-CRM114-Status: UNSURE (   6.71  )
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

On Tue, May 26, 2026 at 10:42:46PM +0530, Nihal Kumar Gupta wrote:
> Add Shikra compatible consistent with CAMSS CCI interfaces.
> It requires only two clocks.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


