Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E2AE9D407
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 16:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3KWRmO8T3+sOv7HbyeA8955cqGs0E1a3VZDZWt0aA8=; b=EH2PGRSThoLQO06VoKgsB/u/6b
	ZHfwUn/geNvW+vQk9fIYu9MXs7dAWaopYPdb8d5UXkFX9SmGUICgdu7wAT79SLGOavSYVN5UnkTXb
	fVtZSmPa7eeJErUXJq1jGKSArH00vZoaz2/s18/BfR1jR3OZOOWNbuQqUSG6oONcbcAutB2oaze2R
	gdOReC/7iPRK4s2M90t6ohNpwtW/FkLV1nWsHq7GkCENn7pfP/FdhmMLzRzbtAXLLEKv+yWh9GTxK
	zcTIc1v41Tv8Ge6vW2dkZQy6l7Awgbo5apgJroDj4FI3ckViOg6ali3U8Jjgu0dBWQqc7n2mym8v9
	yH4yIJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfK7-00000008ish-3nOO;
	Wed, 04 Feb 2026 16:01:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfK6-00000008isV-0YAt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 16:01:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20B2A60010;
	Wed,  4 Feb 2026 16:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A428C4CEF7;
	Wed,  4 Feb 2026 16:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770220904;
	bh=QJ5pDaQD2KX//M2ocucFLrlEQ7KHC4f85/La5AN4f0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFVS7vLCleEkoxejTw0R2Lj+Kd53mkrYUYRiYpnqcEb6td0V43kps77g8IeDHEp2V
	 UPxEurqGbRyJHKZ7tBaJ4381T8Cmp1UdH63XIFXT7Q2KsSJAKKYvwNUy0QB5kxWlMp
	 VODWhBkWS8OMco6Mzpco4HZzqNpvC+feLKJDjvL6LJ2w2WV2DndVkXnTHTo1pLUE1c
	 ZPKKaOhQ8Z2sm9CT8Bb7V8oOHK7hyCKVNwHV9PyGTQJuisv0/uqFmrs+EsP13Ynb3B
	 3XV7ByGorK5pyQw3ZfsBW/ewMDtkXwybnlxoBsJxJpG/TvsIYe0f9si7BQdtsIRaRR
	 CqUzIsCwO1LOQ==
Date: Wed, 4 Feb 2026 17:01:41 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Message-ID: <aYNtLbUel_oWUHfh@zenone.zhora.eu>
References: <20260122-sm6150_evk-v5-0-039b170450a3@oss.qualcomm.com>
 <20260122-sm6150_evk-v5-2-039b170450a3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122-sm6150_evk-v5-2-039b170450a3@oss.qualcomm.com>
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

Hi Wenmeng,

On Thu, Jan 22, 2026 at 06:48:53PM +0800, Wenmeng Liu wrote:
> Add the sm6150 CCI device string compatible.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Acked-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

