Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9374C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anN6OkhNmZN5rfojNfj49R23fREKeQy6o6tuVnDAthw=; b=XQZHt6S4Xi5h2a9t480IrtNwGA
	ZTrI6Xx+jS6nr4fZZf+3kkNhnLyMIoVd7BsJXFjmTfvYRxDKkqw+COd/mFLN5TNqK2Td8jY+nUi7D
	3EbXcA+MN9E3E4IrJrwbnCnTcaJjW59u6ETuiw06aV58p6Mg/MsQuyEG9N3vBLqhpT3xhH9AjP+zn
	CUa090xUnsToCixa4T9QdYeEmpl3za9e91nYvPd9WXkDugp8pFlKxd+4Sd3nIISMw6b0Awhc8/qvg
	BI390G/MV1NCQ3hRStusToPgXVMNIyY2vmxbKYAxZsHUvmWSGPIxZAFXVopZe0Tonrt7Hi9IS344i
	BNu2QVrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIPu-00000002T1b-3BdI;
	Mon, 27 Jul 2026 10:18:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIPq-00000002Szz-054E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 10:18:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A46C343FB0;
	Mon, 27 Jul 2026 10:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367D51F000E9;
	Mon, 27 Jul 2026 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147513;
	bh=anN6OkhNmZN5rfojNfj49R23fREKeQy6o6tuVnDAthw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R9ZVino81q9zjUPoHRUK9Jw08Wqpa6CQ+xSQSGQegEtHcSXkxQFNgJKzusYjsHptp
	 cX/YBzal+rQNmXtUZhAXYDG2L9GW1Bg3gHqB+49KrZcjApDL/W2ye1yR3hpsF7Rm8v
	 VBSNxFVyKzawmx4m5giUaojN6RCDzXa5WMt+3nILO3C1fs0Et3ygIl57ATKqsrC875
	 JmTXjI0mNxGAMB5LpP9XoOFjVDisach/xz69XdlCdRQRBIRQgMZ4W1BhVYqXDaw9nb
	 luCwM/KYZjjJDP7sWPIY171spZnyJNtl7jpaI3jI9JlnKgXpMd9HXHlhENyYDarsp0
	 NxQqgl5wLGi6A==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Roy Pledge <Roy.Pledge@nxp.com>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Pan Chuang <panchuang@vivo.com>
Cc: Christophe Leroy <chleroy@kernel.org>
Subject: Re: [PATCH] soc: fsl: dpio: Remove redundant dev_err()
Date: Mon, 27 Jul 2026 12:18:01 +0200
Message-ID: <178514745089.65524.2547109396537618281.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260723024748.30105-1-panchuang@vivo.com>
References: <20260723024748.30105-1-panchuang@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=496; i=chleroy@kernel.org; h=from:subject:message-id; bh=RvpL6q+ypK9jjNxeg1QDxvDBu9u5Z6E8rgNAlFoBt3Y=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSlGyRF3td6dWWFfaKLR/bsbcZ1702kQ5dImixntWrrv X6AV+pMRykLgxgXg6yYIsvx/9y7ZnR9Sc2fuksfZg4rE8gQBi5OAZhI0B6Gf2YHv2i+STKx/npF IS4mLuPMtLoCewPTlB8ipo19PM/nTmL4n3bmRDT7n+nfPLfmTKj0MlPfsLZ5J6NnJNvDiLfrXqv c4QYA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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


On Thu, 23 Jul 2026 10:47:48 +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> 

Applied, thanks!

[1/1] soc: fsl: dpio: Remove redundant dev_err()
      commit: 863a06885322bb1c0f43fe93faf13ad3e34b3f90

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

