Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CE7C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ychoTIYUDfWoAxLjnl2uUah2giqPU08urAHpAFQWzs8=; b=VF/J1Bj/pJCRbInMSDM7Xf73ww
	TooyTHbUqlv5BNq0CPMj/trnEPfOWZoL1iegC8u+3Ku5S09wV3D+XHLnVnpCUck/xtKswPQZx5uL+
	thQngaWp5vP59U1dKyGqaCl1aaKbzI0+A+RbD98PzPrEUrRqVcL/Au8URtfOYGjskbuj5d2qi5GFR
	a5FXtTXJDB8m0ioi7yYJA0Jp8Ef8woOPUiJNlWokSx3exSifg4R5B8sPdUbICPXYsucfvu2ALnXUH
	HQsKg31dcz9QIGmeWZo9B4SrwgIDGdZrgH3ZQ/cCP5PVAtuFYkGuWxo1szWtmgHvSn2a97irdo9Zy
	Dd3sxNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4eb-00000005PSD-0nKq;
	Mon, 17 Feb 2025 17:11:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3PD-0000000596W-2hwy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:51:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAFF0152B;
	Mon, 17 Feb 2025 07:51:53 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5E683F5A1;
	Mon, 17 Feb 2025 07:51:32 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: cristian.marussi@arm.com,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jason Liu <jason.hui.liu@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: imx: Correct tx size of scmi_imx_misc_ctrl_set
Date: Mon, 17 Feb 2025 15:51:21 +0000
Message-Id: <173980739601.1667400.18386300454514478201.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123063441.392555-1-peng.fan@oss.nxp.com>
References: <20250123063441.392555-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_075135_725847_E7828169 
X-CRM114-Status: UNSURE (   7.26  )
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

On Thu, 23 Jan 2025 14:34:41 +0800, Peng Fan (OSS) wrote:
> 'struct scmi_imx_misc_ctrl_set_in' has a zero length array in the end,
> so sizeof will not count 'value[]', and txsize is smaller than actual
> size for tx,and SCMI firmware will take this protocol error.
> 
> Fix this by enlarge the txsize with 'num * 4' to count in the size of
> data.
> 
> [...]

Applied with some minor changes to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: imx: Correct tx size of scmi_imx_misc_ctrl_set
      https://git.kernel.org/sudeep.holla/c/ab027c488fc4
--
Regards,
Sudeep


