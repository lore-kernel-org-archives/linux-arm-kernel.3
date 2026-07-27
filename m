Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEFCC53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZ3fv38avmtIoGrI2bPGPb4oyGocD7VjuPGceXzIVEk=; b=Wtgoh+QxrIBNgVFYROndpHU4ou
	IsSduOBUq7jWNzc9cMx0vDYvw/FQT4SGHZ7Q6xeeUByCqdSL+7mOmWHJiFKzJha/LzaWZTDDTc+EO
	i9gm3gmrdwJcXS/0II3dm2NwXkFhVTvSeRM3xbgCHod/U96dR+wsRo2yOkxbDbbmzP6S573nI/rFz
	WxyPY9pm1ODv9PpwhWObCHtP7xdqACzw7oMjlv6SM/rJW5W34GfwBRp6pex94Pp+LOLO2vQkvrTmP
	gQIm1FbbPVelSUq/DYslBf2y/8kl54T/2C/PWoJKSBuXxMHrT3uTlPKp2+aV8vtM43SR3yTQCrPB5
	oikLaxig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIRE-00000002TLy-3uU2;
	Mon, 27 Jul 2026 10:20:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIRE-00000002TLc-0sdr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 10:20:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 912CF601DE;
	Mon, 27 Jul 2026 10:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6494F1F000E9;
	Mon, 27 Jul 2026 10:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147599;
	bh=bZ3fv38avmtIoGrI2bPGPb4oyGocD7VjuPGceXzIVEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KUozUGiiK5t+TuyPGT7xLlRpq4SrGC+bPmDggEaCkgyXLeyETGLOADhgbXSUrS1gC
	 +ToqUfvcHAa3eSzv5QOYckbqJhkjg4n3IeCa/Ls7pLfn48eYHuyFYEgFaUolqx45DE
	 gLHQnEzvyenPXzLyPsN9NxayGXjU1x3wQogsqTMl685hkDRLt4+fdTze9+XEZcT0Kv
	 c0khfbd8haTzAGzdEUpyb8hqkCkBTOKd8XqvPS2iMKh436d8FS6ux9dIZbcsjcuZPp
	 ax8L/X4aNnwUhwJU0efpSmCa7RowHv+PhkE9RESz1z5nrYwuLG+ClQxv2W25vNZVLb
	 6hfSbR5RImTZQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Louvel <paul.louvel@bootlin.com>
Subject: Re: [PATCH 1/2] soc: fsl: qe_ports_ic: Use generic I/O helper instead of specific powerPC ones
Date: Mon, 27 Jul 2026 12:19:53 +0200
Message-ID: <178514758572.65824.17884292892664391060.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <b08f76c1d8ff864774246f1e2c2158c223c001be.1783435914.git.chleroy@kernel.org>
References: <b08f76c1d8ff864774246f1e2c2158c223c001be.1783435914.git.chleroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=508; i=chleroy@kernel.org; h=from:subject:message-id; bh=n/NvQ0oVtsmjhJMLoUInodMPJjVmFQM7q4EHR5DfIFg=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSlG5w6rqzPkz115u9AkWmpn+8H3vffupT3e9PGkxHtU 94dXdIj3VHKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQyhIGLUwAmkvCS4Z9Wtdr3yp5TZ70W PGVb9/2YwfJTjVpWXt2//h1Rdjlc8389I8OjI9IhC55ZHHee5B4o3L36wTLO66/cW2z1uFct552 x04QTAA==
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


On Tue, 07 Jul 2026 16:58:14 +0200, Christophe Leroy (CS GROUP) wrote:
> Use ioread32be() and iowrite32be() instead of in_be32() and out_be32()
> to allow build on other platforms than powerPC.
> 
> 

Applied, thanks!

[1/2] soc: fsl: qe_ports_ic: Use generic I/O helper instead of specific powerPC ones
      (no commit info)
[2/2] powerpc: Move CONFIG_QE_GPIO to SoC
      commit: 6599935a1e4be0354326086ea6c73dcb8f43b881

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

