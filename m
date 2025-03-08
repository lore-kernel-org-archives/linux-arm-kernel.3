Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34A4C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 00:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYeyexpgZAOSEyM2YI0dyyGQC8RvhY8BnjdFq1CeiqQ=; b=a8iVaD1SNoEEHGqM1KmwRbsycg
	htd2sHGTSKwnOi6+/w3vyQUZiqwVVbB9+qSJ7xowY8vRuufjum07QgHGh5dwnGpGSO0bxyLdbgVbV
	cWqS3q9dZadh8YHXyINZC59hNFAxLE2ARvbOiohXbvflbruPWYY7gIrE0K5G72wi3/iN8ay7YVd+y
	V2f2sWjgIM+5BkG25A0N/iMH8KRQjWSL9CWZZBibA3DFDhZkjuaOOJ+YKfym2ix6Mwet0EU3/ig89
	5uY0eecZs2YSEHQOmp+LBzhugAvFwsWTCC/905kUOqcw8um8iKl12Em85sbs12o0vZT0dO7ETGDMe
	gefaLMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhu2-0000000Ftez-0Maf;
	Sat, 08 Mar 2025 00:18:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqhsO-0000000FtaQ-2ljS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 00:17:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF0F8A4533D;
	Sat,  8 Mar 2025 00:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C87BC4CED1;
	Sat,  8 Mar 2025 00:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741393030;
	bh=K48dDGbOfAtjEwZKUeVi9F4L/hg/zp79smFcJIBF2XA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eAjLBcPi7Z+cbhJes7xnEuaKTj/9axZCw71jGJLnxQ1z6jI57I/npvgmGQf6EzlX4
	 PkDsKKx5zlcVHiw5lr4doNT4y9LEiwcRoKXRCA9tLzXEnc9/nGeblHI7aKfXtkvfjy
	 krULEnxAar/u1eGwjpHr/HrJ4/IT15cl7fBCVlPMKc+YjpqYz8jLp3u0Vz1Zp/2axp
	 LDhnYwVmjhpcEaeDtYSe+2hOZaX1AMfi7oyskj1I+j5BAqGBXeFBpUBpi1836fCq2M
	 VMW2lu+DIDUURnnhxL9zVutYqhkttp9FoRPLtUxFGXSWPnWvbCpJLF3O+egIVkak2f
	 ZO6xuAKBhNLoQ==
From: William Breathitt Gray <wbg@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Dharma.B@microchip.com
Subject: Re: [PATCH v8 0/2] microchip-tcb-capture: Add Capture, Compare, Overflow etc. events
Date: Sat,  8 Mar 2025 09:17:04 +0900
Message-ID: <174139258236.459919.5227805319293627161.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306134441.582819-1-csokas.bence@prolan.hu>
References: <20250306134441.582819-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108; i=wbg@kernel.org; h=from:subject:message-id; bh=x07tfBdhBjiiaz1pNHTW16UZFI8p5Ig8SxC5mcIGNt4=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDOmneyqOeDExb1v2ScR/Veduz127go+leDz5eEL02Hclr oq3GcocHaUsDGJcDLJiiiy95mfvPrikqvHjxfxtMHNYmUCGMHBxCsBEyvsY/vBlBVyqyvd7+WL+ g1OT/p9MPHboQM2V6gma3N6Lsg0O/v/E8D/MPzXeWHSTmbDg7nWlrRdvRZ1ZL/nC88DTb4u5l0r +8ucAAA==
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_161712_783237_26CD755C 
X-CRM114-Status: UNSURE (   8.23  )
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


On Thu, 06 Mar 2025 14:44:35 +0100, Bence Csókás wrote:
> The TCB has three R/W-able "general purpose" hardware registers:
> RA, RB and RC. The hardware is capable of:
> * sampling Counter Value Register (CV) to RA/RB on a trigger edge
> * sending an interrupt of this change
> * sending an interrupt on CV change due to trigger
> * triggering an interrupt on CV compare to RC
> * stop counting after sampling to RB
> 
> [...]

Applied to counter-next, thanks!

[1/2] counter: microchip-tcb-capture: Add IRQ handling
      commit: e5d5813968217b99ef2b83f13353967b218e3841
[2/2] counter: microchip-tcb-capture: Add capture extensions for registers RA/RB
      commit: 1adc6240a80278c613f655b71c6c0d447b2d5932

Bence, I've submitted a patchset adding support for the RC Compare as a
new 'compare' Count extension.[^1] If it works for you, please Ack that
series and we can hopefully get everything picked up by the 6.15 merge
window.

William Breathitt Gray <wbg@kernel.org>

[^1] https://lore.kernel.org/linux-iio/20250306-introduce-compare-component-v1-0-93993b3dca9c@kernel.org/

