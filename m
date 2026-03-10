Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3F2FD4F16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zInzCrCkZXCDw29/mYN8IaAjac/fDAMtfEbQdiWPTn4=; b=jImyWlGxDa7H3P
	03a4IU2B7mZQGkZsYEoP1lAvzfgvSm6DZtzdSxf/bunZFPx7BVq5rjqlwSGB/5TEbPX2OtDYeTRME
	Vok+nOoocx06sqBu76oraRv4/LMW/sNx1FZLqKvbTQCA8RTmLoTH5dubD4gRVo/fcUDg35tn/4tBy
	FX6kTKOSodkvSuLgOsQYBheRN3furSb5rVxjeYKqFnyKDMPDOqfw9Vl+tf7HVF0TWp+Ck+MsJkGxq
	VXLgHCi+iReHz0MKX0inidUSjPA9KgAD9e/uk9TF2P6H/bDMug9TvyE/VqgT68XTcuSmyz7MECCyW
	4hwrxX07Kbjj7kEelcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Vc-0000000A9g8-2JVA;
	Tue, 10 Mar 2026 19:12:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02Vb-0000000A9g0-0qIz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:12:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4516260054;
	Tue, 10 Mar 2026 19:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF093C19425;
	Tue, 10 Mar 2026 19:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773169966;
	bh=pchNCTeWBuIso3MqwEPQmTgbMDOHGghbyhTfYohp4bg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tFCo6esZ0UfkFMOz+12yP46Mo5PdFq+bIZlJtZQ/1e+HveqqKMRvyLSsvaDPEBToS
	 2hAu7WkTh3u3DANL56eyowAhOHD0vS0uTRH848akwwprtl/sQdM0Gu/9CUWMTW4/KM
	 ozhoWBSgcpz5H0RhGHkyeOOz2VRH1nW1ksA/N5VJQWklKLvSMnw+V6QRyxGPJ6Ibhr
	 lcL8c6v6g/H0JDjXGfrk3ioXy4BYEYw5sGi64KHX/P0FpVIzrkAPolK835k/aKAm2l
	 f8yGd9z9tuzb2zzLRAVLweWCUDg9MKTq+3C7e3BltrCqkW1Enf+xnTBzZ9yvOjYkNT
	 gaH60bidebVig==
Date: Tue, 10 Mar 2026 14:12:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com,
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V7 00/13] pci-imx6: Add support for parsing the reset
 property in new Root Port binding
Message-ID: <20260310191244.GA764308@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310015426.365675-1-sherry.sun@nxp.com>
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

On Tue, Mar 10, 2026 at 09:54:13AM +0800, Sherry Sun wrote:
> This patch set adds support for parsing the reset property in new Root Port
> binding in pci-imx6 driver, similar to the implementation in the qcom pcie
> driver[1].

What is this series based on?  It doesn't apply to v7.0-rc1
(preferred) or pci/next.

