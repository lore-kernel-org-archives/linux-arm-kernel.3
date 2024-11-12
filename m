Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70102D3ABFB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5EwDoznPHftZt4XcgE67jhMn4He2osy3HklDxVTx4w=; b=WQKsP6J58sVUAperY20uvT24w6
	MG6Jt7Bzs/xsZGl9ePUd24TtFo8AVRa6UzKB3GulAwzYzq/hIptxzYMNukRPdPA0vfoqBeNkRqGrS
	BTWTnDimQAzIWp/+mSOWTaA9jwyQRrrRgLYw/gIXRY81tU1Gw5XEk5l+Y9ZcqFkofDa9A/CtP5TP3
	ia5yzuLWQKmlKLd8NEiUScMcOmitV+Ke4e7I0PRVNRCUklaBXZOwD3kP/tnWejjAOJIWi5nCfvnfp
	BgMJf7NVEhBvdLwfWZdnpJGAgWsss4dws1f8WUnY4FcjElo5Uo2RgipTyFwwc7kUeDfvQ8hmNDIxe
	fZnAT7Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqbI-00000003UmF-3rSP;
	Tue, 12 Nov 2024 13:06:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqY7-00000003U78-3RDb;
	Tue, 12 Nov 2024 13:03:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 947BFA41A60;
	Tue, 12 Nov 2024 13:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3DD0C4CECD;
	Tue, 12 Nov 2024 13:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731416594;
	bh=ECj5XhRXQ/Zst8H3AmAZiJNySS2gWUlAEVZ/YWBAayA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QpwAvlnnxlHt865i/XRmNcaI0OA4JQqJXEz5crxqmyEuz9s9SLx9HXAvvt0iAPPNT
	 YxnWrQvcL6AgHJ2BrLQ4QRcG79YChUQVSwcuOGKPwC4LKSDDF5xZa8uP3dW7l19YZ/
	 SPFQGwoJoSweQOyWofxLHWCgitcHl0/lsI5CNiR6yhW0ZJgwfyPdm1ChaJ9pMO7CVD
	 6f2FG/zprkAyXEER9zc7AG0baJ0axKilO2f+U823YiKQmqjjdYSh4hlhHZc2+lnl+K
	 B9GGTfoQFqHe4MU2wLumlDpoIFPLuADA3U3LO5KFeP/GxHbrg4/v5mPD+aoKcNiIzy
	 /hXAwMEUZ3CFg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peng.fan@oss.nxp.com,  m.felsch@pengutronix.de,  pratyush@kernel.org,
  mwalle@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  robh@kernel.org,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  shawnguo@kernel.org,  s.hauer@pengutronix.de,  kernel@pengutronix.de,
  festevam@gmail.com,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,  Peng Fan
 <peng.fan@nxp.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mtd: jedec,spi-nor: add optional
 vcc-supply
In-Reply-To: <20241111111946.9048-1-tudor.ambarus@linaro.org> (Tudor Ambarus's
	message of "Mon, 11 Nov 2024 13:19:44 +0200")
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
Date: Tue, 12 Nov 2024 13:03:10 +0000
Message-ID: <mafs0msi47gfl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_050316_152688_1F5E1982 
X-CRM114-Status: UNSURE (   5.76  )
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

On Mon, Nov 11 2024, Tudor Ambarus wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Introduce optional vcc-supply property, SPI NOR flashes needs power supply
> to work properly. The power supply maybe software controlable per board
> design.
>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

