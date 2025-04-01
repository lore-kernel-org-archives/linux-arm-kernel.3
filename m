Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B105EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hG+NDYMsYoKmeFNbNELvnbxifLqMtLmEdRN4Ky8nLwU=; b=bztNbcpYCahnLMERLCkY1BF+j+
	R3UceulNzqCysbegVr5z+/eu4y7HM+aiugkSO6mg6xIuZqn2AqZnbVw3ojvf6LxskGU9Gw4phXo6D
	HQ7L8sjsF9L7JIwtNai7+QOaZLVuv2rV/fujkbgkyoq6r4Zb1ffTEGqN5MGPYHxD35bp9HOjxnUKb
	v1CqQvd7IyKDNma2tdonmU9aB/KoaYReiKb62erROENhm5DsHL93gBPkNU9taLh32yPjIKaz4SEBq
	/cUlOIWynYUCeOEBFKi8LFrwIrAlmchPCR7TYjhp52obqKews7vENOlgIL6r0xqkl6Ru3ySOj/1Oi
	YSoipPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzk1R-00000004Wzc-2Otp;
	Tue, 01 Apr 2025 22:23:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzjzU-00000004WnV-2fky
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 22:21:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E81905C3FCC;
	Tue,  1 Apr 2025 22:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEE9C4CEE4;
	Tue,  1 Apr 2025 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743546111;
	bh=ENKysy1w5gXYqZNN3vEbRv1hbxW5lAmjngNmDqFJPAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kn5LRtujRd0syaL524zkiotqAQiyuuNadY0yL/uSzkCntMS7DF33tHXFv3yNCtLyn
	 UqKwsy9MCLqTERNzOJ684np6ayYNooJTZ+j2OpR+9771xhjKs4sWL0iXVCUf8QNLX4
	 CvC5LLod5e/YOaYRitQTKgPK5Hx1yJveG6XSmRHxKw2d7BNHKYzl9KeG2qIMYJl5qq
	 K45xPbu7MDzv1JHlPhXSZ9l4IRKi2xyL86qr93p/dyE2CB6cJ+HXM8CGhVPUyrwplm
	 BiFMOb/H3FM2d8ruHW3JOc4cAAJyAlSSqxtRdWjtp7E3m7STV/zuL8PDqy7q/Y2lCm
	 q+kQw+kbvLAdQ==
Date: Tue, 1 Apr 2025 17:21:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: firmware: Add i.MX95 SCMI LMM and
 CPU protocol
Message-ID: <174354610735.4103067.17720099043816826170.robh@kernel.org>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250303-imx-lmm-cpu-v3-2-7695f6f61cfc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-imx-lmm-cpu-v3-2-7695f6f61cfc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_152152_716885_AA3A71F7 
X-CRM114-Status: GOOD (  10.94  )
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


On Mon, 03 Mar 2025 10:53:23 +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add i.MX SCMI Extension protocols bindings for:
> - Logic Machine Management(LMM) Protocol
>   intended for boot, shutdown, and reset of other logical machines (LM).
>   It is usually used to allow one LM to manager another used as an offload
>   or accelerator engine..
> - CPU Protocol.
>   allows an agent to start or stop a CPU. It is used to manage auxiliary
>   CPUs in an LM (e.g. additional cores in an AP cluster).
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../bindings/firmware/nxp,imx95-scmi.yaml          | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


