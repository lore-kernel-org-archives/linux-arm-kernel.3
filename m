Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA2BCA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjbi9/c1VrImWNtJEnP+BlHeSMxTK9lWfNpXD7dyXn4=; b=lAHcnQqd9XDwSrCO+Dl9iWME8A
	mcgjBFckI4b5L1J6lKaIUMMvC2igRWv80gjdwQfng805YJ9ODXDwUUOR/ZcdWKxj6TCySzq+Pbdph
	mc3gj7cQanVtZ0cqlg2MK3eiXOPkjSC6tVjmeTYRFw15ue7d4bBFi8HDammD2AiZNLyTNTWRjfpq8
	2WAjchbpROE9XX7LCKY275BR5VncZm5AB568G/1TOTlqt2FyED3jSorIpIdZWAThm1Rd1O29iD5N9
	3lheofsWRLZVRDBNaqv50k3b8/SVDUTMu2V9bq3UUK1OHK/bmk1jLikP4fdQzrc64b05RHb0dEGwI
	1o614H4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdQh-0000000BgFP-1HOZ;
	Fri, 02 Oct 2026 13:36:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdQg-0000000BgFF-3C0q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:36:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0175860A8D;
	Fri,  2 Oct 2026 13:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AB41F000FF;
	Fri,  2 Oct 2026 13:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790948161;
	bh=yjbi9/c1VrImWNtJEnP+BlHeSMxTK9lWfNpXD7dyXn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DBJpr6EEspHlhw3V+cgQv5AtHdoUAjDZ+NvGoFmXvakvXHMf/y8FQaUlrebt+chyu
	 qOlXWV2L/di5rTJ+TGwrrwrmdPkWECJ+/oiAuRTSH8DmKVZtEWv/TwUpYOdTuVLBkt
	 jxk7RrvHHtfcHMjymiP+flXfKrFqsu8qLCBulLgxQ8TD/97axXTX/yUJvsEhw1AoCd
	 l0L9/TkJCVSSZnCKxHFmoOltPP9y/UuwAC6egNNM0A99rTaPppXLIkyRqevCf/7SCV
	 C3orf732YFpueQK+jI5XFvyst54YP82P1vmUWbaruSCvAhynt5o8zykhiRSWMelPkw
	 7Jzsw6iW4HAgw==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Bill Wendling <morbo@google.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev,
	codemender-patching+linux@google.com
Subject: Re: [PATCH] bus: fsl-mc: Annotate fsl_mc_io.portal_virt_addr with __counted_by_ptr
Date: Fri,  2 Oct 2026 15:35:47 +0200
Message-ID: <179094814058.161441.1021426703218235186.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922223538.2287676-1-morbo@google.com>
References: <20260922223538.2287676-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=704; i=chleroy@kernel.org; h=from:subject:message-id; bh=FzGXoQmG9DwM4d/cV6mXr3MHN7XZR/N+SpZKV92FTfw=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTt32zsfK8k2dpj28ZjnnFLohdU2pRd+5TqcqyrJDI3b vUXpe8cHaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAiHxUZGfa+/OR2M5D9n7zJ p/JtUo8OHXt4eN6Wb6kzV156+Uc+jPU9I8PMHUsEJ+pZJjO883r71Cvuqn7FVFXjJ9Of2C1ZUBB /JZIPAA==
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


On Tue, 22 Sep 2026 22:35:38 +0000, Bill Wendling wrote:
> The GCC and Clang compilers provide the __counted_by_ptr attribute,
> which is used by KASAN and compiler bounds-checking to detect
> out-of-bounds accesses to pointer fields.
> 
> In "struct fsl_mc_io", the "portal_virt_addr" pointer points to the MC
> command portal virtual address. The size of this allocated portal in
> bytes is tracked by the "portal_size" field within the same structure.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: Annotate fsl_mc_io.portal_virt_addr with __counted_by_ptr
      commit: df0fd0f5af4ddd84a76e21da8e6b489928c5e300

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

