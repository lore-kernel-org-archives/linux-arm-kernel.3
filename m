Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77455D149F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UI1vTxlBOxYE5W4xsGO7gchMf+mOAzEAvs84vZBAp0U=; b=cIRnOpeRdlHI51T23RWjovPyPx
	62ro0vOHKiSSuBGd5shHbLpL0bl1NJsryvtR58KQ5fxyVtoBx1VaGjdAC9MLdD2Wb0lILXbJwS7DH
	lprRnhandtm2IRfWSBrvctHfHgoU7n5qUNtW5MscszbHyCXVHzRODbKbdwdTjE+LvxmibFCFWIZCY
	v24lnsO/QvbAJ9m9ssFvoxCqqN8APLt57+WyKeVhTx+Y/plIgB61Y+V5dc4ZX9kkiduzysyC/vICp
	2aYUJmteJfFbQlCZRFjG9FO2dy4Qs/GUc6dJstBUGrCJmtYoI9H1qrz3PRoO0o0vWFpG9VjSUet4h
	CTiv4zHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4ShZ-00000005Qve-1kQ9;
	Fri, 25 Oct 2024 22:22:37 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SbV-00000005PnZ-3bgf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 22:16:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729894578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UI1vTxlBOxYE5W4xsGO7gchMf+mOAzEAvs84vZBAp0U=;
	b=ijXdlP1IJrJOQ+IsWfLev5HcVuwPf2qY7Xha9nF+1Hjf5SkAHdXobRxt5zA9IYzdOrlbJM
	c17M+IZuvvHP6vQ64U+fwRnPELCXzN7JV1sg4QT7bT+guKjOpYc+xn5ck0bVCok+6vWluJ
	c9JeOIHEkWMk/PHFxdxJr2KKXGnzgho=
From: Oliver Upton <oliver.upton@linux.dev>
To: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH 0/2] KVM: arm64: Simplify handling of GICv3 hardware with broken SEIS
Date: Fri, 25 Oct 2024 22:16:07 +0000
Message-ID: <172989453422.3686528.17691027763300650560.b4-ty@linux.dev>
In-Reply-To: <20241022144016.27350-1-will@kernel.org>
References: <20241022144016.27350-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_151622_057345_2E43C82C 
X-CRM114-Status: UNSURE (   8.48  )
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

On Tue, 22 Oct 2024 15:40:14 +0100, Will Deacon wrote:
> While looking at reducing the host memory mapped into pKVM at EL2, I
> noticed that the GICv3 CPU interface emulation for hardware with broken
> SEIS implementations can be simplified and the corresponding mapping of
> 'kvm_vgic_global_state' can be dropped.
> 
> Please have a look!
> 
> [...]

Included Marc's recommended changelog addition.

Applied to kvmarm/next, thanks!

[1/2] KVM: arm64: Just advertise SEIS as 0 when emulating ICC_CTLR_EL1
      https://git.kernel.org/kvmarm/kvmarm/c/ad361ed4771d
[2/2] KVM: arm64: Don't map 'kvm_vgic_global_state' at EL2 with pKVM
      https://git.kernel.org/kvmarm/kvmarm/c/8aaf3f7dce74

--
Best,
Oliver

