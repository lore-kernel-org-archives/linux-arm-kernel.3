Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D77ECCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+PPLh18Ga7Of33Qc9JQjSRKTIdyiI9L/FmbmLJPMnU=; b=o0krvuE2iBPwFtPU0SkD21E7Xi
	YurRgSMLPR1pQqwh9px1MYnVKkb1maCUzfshfxUC+FB9PFwmpakkGCmCxsPPibwRLygbK2T7ttGRB
	2jquPQX7jg49y1s0fllya7IMR5rWrqmEUZLtrBmXfRpVm/bMnFE7szn7tL/Zneg7zgH/qdOvf9YYU
	2kpcpBleneUc8bdSp1o8AxqQj3L7e/mdbWS4oDaTr2rb1PdnjSaEF+7IYb3QvQfxr4aDbyoaeyTZb
	p30fUv6e8ZREunEzTIaIf6jkwHywu0U+8+L/g3khdtYUXzghmLedrmo+Qjzoz2VuoZJ8eUVIxMz2R
	WHOS1XEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMiJ-00000004uzd-0Ob0;
	Mon, 10 Nov 2025 07:53:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIMiI-00000004uzV-1H8X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 07:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 611BA60145;
	Mon, 10 Nov 2025 07:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D485BC19421;
	Mon, 10 Nov 2025 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762761201;
	bh=aD0bXMxM8CDFNwDaCde/4X7QKwASqM9PdFPOKWf2baY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hexuYCT4AMkN1E6qvheK7tISxjHWRQ4H/TNG/8ZbbB+/RdyRFtKW9X5ECOzbZ9/6w
	 dwPqPtFd4IcRWwiYZXfvrUFPg/8bmKLhS7A6fnyWMmulvoBl9KHF/k20dbmse+gp3H
	 s8ojxcNbRZ8U1VTKpqZUM32zWNDYRVN5FlyxnM44duK8lcJCWmQjvWBdmKzU5annFb
	 66geaZnQb2qxwDXwpq8OSQ7UB0pF2Ow6YUrXy/Gue+aZdyMhcoj5xidZYAhSVDlrCV
	 S2c9KP2XfH2UMZYD5YjDXVU5I/8feh9AT+Tg4Txa86WhCToi3/FcrBVHOHYColYLyu
	 TcQYEYc68EvFQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, alice.guo@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alice Guo <alice.guo@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20251020-imx94-v1-0-0b4b58a57bf9@nxp.com>
References: <20251020-imx94-v1-0-0b4b58a57bf9@nxp.com>
Subject: Re: (subset) [PATCH v2 0/3] Add i.MX94 OCOTP support
Message-Id: <176276119135.18911.11093560408618836361.b4-ty@kernel.org>
Date: Mon, 10 Nov 2025 07:53:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 20 Oct 2025 18:50:41 +0800, alice.guo@oss.nxp.com wrote:
> This patch series adds support for the OCOTP controller on the i.MX94
> SoC. The OCOTP controller provides access to eFuse regions.
> 
> Tested on an i.MX943 EVK board with successful NVMEM read access via
> sysfs.
> 
> Changes for v2:
>  - improved commit messages for each patch
>  - added Acked-by and Reviewed-by tags from reviewers
>  - updated the efuse@47510000 node
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: nvmem: imx-ocotp: Add support for i.MX94
      commit: 294e0add7bb8eca991f7e8d064c71acfffd10462
[2/3] nvmem: imx-ocotp-ele: Add i.MX94 OCOTP support
      commit: 9e8d7c3115f4eceaae2d5282518be78bcb7ca188

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


