Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB25DD3569F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7LeXVP7XAGNaq3kzCC9n1xMAwM3zSZ7L4N8NPlKf2c=; b=1jgar/BwV8gx2H41c8I6glGHUf
	X9lA1ymK4piEm6TY9QDOzpQEn2pZKbqzAjioazU/DD2rHB34d++eYzaR82C9R9KE0l5KvRqhUGjFU
	7y3u8vniLY1o4+sgBljLlVrSNP59Zi1hhW2bGzyRd0dIaqEnKK13ZRaMBx3ySPnSJPgOD5V1zR9Nh
	VUT1iBRQNUNBuXzSWILJSp91XlGRlOyA6ghUa5MSYVzh8Lpkq9tfN3KR2Qp9OGlqUfoGljGrLQt9H
	qe12TRiow+wTgTHkIBB5Jg+k3xVCnPQ/7C8TOsPQ4cfOG1nbs9DG+nVEfMaYg6CeUvbxL1ddX/HTB
	E/GdUIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3LI-0000000FtV3-0oVh;
	Wed, 28 Jan 2026 11:04:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3LH-0000000FtUw-07DL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E2956001A;
	Wed, 28 Jan 2026 11:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31454C4CEF1;
	Wed, 28 Jan 2026 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769598249;
	bh=g+DcgaV9vvajzIjNngoxQZBjOrt714zE+t0gjBetTQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RkUk405vHf2xBFoT/TUH5O1r0/VcIUy5lvckzSbRkQ5wmvNzLw/9bCxUsbVn5BDJ/
	 Ig8Sn6SwqT1wR9/FijXtQBpZzQBdx3uvq1AVBeNL82EKaRAgBJOdBQM5CzTtVn7K2J
	 yCx6nZRUxqj7+rRAcRI2G2sGn2CWpIRHa9G+tPl+XAgdYUB4a2ceZgpqimGHPJ5ReV
	 JkzAKWhToYM4q4C0ZC7+quoWk+yi7oSYEueF/zs+yYkFESlUYLEUtA07bxBCFCtxIo
	 EKSjgSTMELRCCrbRpiaxrPo1bBsnSmyz5/U6BThs2WP6WLiH0OEsiQ+Vl+wyYLUEPo
	 pqBJTTXh7Ffbw==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
Date: Wed, 28 Jan 2026 12:04:04 +0100
Message-ID: <176959816683.2069840.8945134159377635375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
References: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=622; i=chleroy@kernel.org; h=from:subject:message-id; bh=XGgvbaf5H9k+ateqB29Q3mR73UZredPzMwVmw4XGytU=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRWvlU5F3urWPzNmlPsYTkWh2/ovPF+vkpiKi+zdejEI 0HS8w2cOkpZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBEvn5mZHh2d1bp5UnpBq4B LW6rlqz6VfdIquXBrdC5H1Yv1HZRv3SCkeFNa9Svrk2rHq0suegcUaAu9VfmfYDsKpfszhwJ4/x 3+TwA
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


On Wed, 07 Jan 2026 17:59:09 +0100, Christophe Leroy (CS GROUP) wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
> 
> Implement an interrupt driver for it so that those IRQs can then
> be linked to the related GPIOs.
> 
> [...]

Applied, thanks!

[1/2] soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
[2/2] dt-bindings: soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

