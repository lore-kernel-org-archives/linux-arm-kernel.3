Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E17FC591C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2hmAPdeq+yK4yox6gFwVhrtvKKbGXLa4UpDk8msuzM=; b=FMNGa71QFoPvIttMFucBargTIE
	LRNXSI7XcnLNi78WBBtJzpzbXwoCLRepeiFm6IttIL+8F9oDnJXKY1t0OtmBYiTavhNhecxmHOrlv
	RfvNVFJoFdpr8rNrq6ahBY6VzFNLa1Y1Z8JJxJ0YIZCn7rqcCqd442Wow79HdLMOK+wExzTxgRFYs
	yGbh7j2WlRoYO4bEyxph2WflQLC4y/NTrNUGZt0TRYXmLt2b1p5ckcmF9xarOv1acnq6tllblkChj
	NNEF7Y0R2vk7a+SLr8G0CLu+9aEY1JgRRt3dLZqXBFt6xHb6h6VpnAw3nB3t2d1t6bN3TGZDDLLUb
	6EEPGsug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvY3U-00000005qOe-0N28;
	Thu, 26 Feb 2026 09:53:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvY3Q-00000005qNo-4655
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:53:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E82D643DD9;
	Thu, 26 Feb 2026 09:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27A3C19422;
	Thu, 26 Feb 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772099586;
	bh=gOp0kpfXl5Pk7tntCuMPl5ytXJG2Ia6XHeykt8grkxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bKAl6+a63YoKhP045GVfWx0jHVFXhW9LZJwtaG1W4eWc1goGV4M4TfPBoQAA6izqI
	 6WdQBpAv54eP1ND0tIBHQHI+GWfxGafuqN75FJ/POxBvVk+QceuIEnnd85M3egf5o3
	 pCeDonuhpqPi3Q5JsPNW71YAQT68YxFW1abLbggLEb7X7tezojU4W02K9iE8iBv9cy
	 VgBvu/TU6bNIYRIbEQ5QLvlwgl65/0WF9vYEMym0EF+pNunedprXYz4G1AGpCnrD0q
	 9yWeaUPqehQ2DxyUkSk0kvZgsTFG5PoBx2dLGHDyLcNtEmzEKx81wVi4YZWkCj0xCb
	 xFPIqy5iBsk7Q==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 0/6] fsl-mc: Move over to device MSI infrastructure
Date: Thu, 26 Feb 2026 10:50:43 +0100
Message-ID: <177209938125.547814.7154250802402503122.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260224100936.3752303-1-maz@kernel.org>
References: <20260224100936.3752303-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045; i=chleroy@kernel.org; h=from:subject:message-id; bh=boh47sxvFmCUdmRIsSFUJwcMqqWdfzkyZGUbgxkJCNk=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQuEC/5yeVfffBG5F+JDwyhtnLatdJqQmdfN6+451Eof /MXj+2NjlIWBjEuBlkxRZbj/7l3zej6kpo/dZc+zBxWJpAhDFycAjAR5/0Mf7iP1Brdbp1lf/vd nH39+VdOHVs059/V8+df+0xw/dNbcmo9w/+s9i2MK73M59yteOu92Urq9mWZG9n5jhaLrF209+1 vSuIHAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_015309_063985_04EDB8FC 
X-CRM114-Status: UNSURE (   8.31  )
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


On Tue, 24 Feb 2026 10:09:30 +0000, Marc Zyngier wrote:
> This is the second drop of this cleanup series for the fsl-mc MSI
> infrastructure, initially posted at [1].
> 
> * From v1 [1]:
> 
>   - Drop the now unused DOMAIN_BUS_FSL_MC_MSI bus token
> 
> [...]

Applied, thanks!

[1/6] fsl-mc: Remove MSI domain propagation to sub-devices
      commit: 1fb7392ee3408494d4d62c09a8c3e5f5934caba7
[2/6] fsl-mc: Add minimal infrastructure to use platform MSI
      commit: 0c9f522f2d41c7e055a602a0d2c41dc7af01010b
[3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent handling
      commit: cf3179b4e53f527aba9f0c6c3b921619c8adf761
[4/6] fsl-mc: Switch over to per-device platform MSI
      commit: 4a958e47c246fa3fb8954f4303e0da15ab3d026d
[5/6] fsl-mc: Remove legacy MSI implementation
      commit: 14b1cbcc6cec0b02298f4adf717646cd943b7ef6
[6/6] platform-msi: Remove stale comment
      commit: f0a2eac6a597268034fd40d92c1469182438b53d

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

