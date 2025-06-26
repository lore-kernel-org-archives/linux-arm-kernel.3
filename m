Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387ACC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 23:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0g7iSied3OEnPT7KVQMAkGAzIEK4A+z+aiw/sGNinZg=; b=f6kSsczBPDCnFu
	XJHGGvTs5c4fbgfn9o4ZPooD8Ssc3SLra1oRwta3U5bxI0J1LGndXHN8bIVLbB4yYn9QELhhk4+SO
	wDGPmSB7zKVNq9a0L4bc3IFAnSqftJBp0fdPREVArKZcn32LvjnWoyK1GC1ysIZcnxjyRowQLVYot
	AWvWBKvZoyudTtw5GOIESmZuWvsXYbNkOxVXfS4fkCyNXEVoFXwjjKuAxW3sk9sVQvvHM1ztpEmHy
	ODLozJh3M8vpglFujPVvOV3bmfTkBcaiXyWstWfaRdB7cyyfQsG1vxoqo6adq8a0aiPNRpkxRfsjW
	kCr/QWCkCpJEB8vCA32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvaf-0000000D0Z5-0aXY;
	Thu, 26 Jun 2025 23:01:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUtb0-0000000Cme8-3Jk6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 20:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 131095C555A;
	Thu, 26 Jun 2025 20:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84894C4CEEB;
	Thu, 26 Jun 2025 20:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750971201;
	bh=0g7iSied3OEnPT7KVQMAkGAzIEK4A+z+aiw/sGNinZg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AXjhJWui5+w9ZEguUthWz8aOBt63fz+PqDqaMPG7AQM7MW7VMMNYqmR5ot4CkE111
	 OQaSUdW8eN7vpH8xtVbdzFmvYzMUmvWOlhdQwGt5wUeybDv7I4+tgtjuIsfFa7RQvo
	 Aen/y5yFfhASs91QlMJ+Wz1z13WZc0fBb3waPzA1N5KjiO3NmgG3u9l/55JVr6fguo
	 W88NlRFFgagQE//5mHpplVIT8SdZJMASZyBpWMWVarCJQxppT72ohAsxeHTt5fuBh0
	 30jFvrv4O8D0tGLNyMl2RcKZInFOvKpYu6Erm/I/tMDgIhitgTUmTCCG4Fl07zfvaI
	 6nOLgPrYBcOfg==
Date: Thu, 26 Jun 2025 15:53:20 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] dt-binding: pci-imx6: Add external reference
 clock mode support
Message-ID: <20250626205320.GA1639629@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626073804.3113757-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_135322_870365_809ADB90 
X-CRM114-Status: UNSURE (   6.68  )
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

On Thu, Jun 26, 2025 at 03:38:03PM +0800, Richard Zhu wrote:
> On i.MX, the PCIe reference clock might come from either internal
> system PLL or external clock source.
> Add the external reference clock source for reference clock.

Add blank line between paragraphs or reflow into a single paragraph.

