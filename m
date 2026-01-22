Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603C0C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyXCyfqoPfaOMVqDx5PgXQAT7msFqz8l6P7wwZTYYRI=; b=hybGT/PPuBOOQ+qCVMCDle7wZj
	4VNkofgXldXaN603EgyZDSt+6BAQLfU7i7k42AwumRxIzkf/EgDASD0PiV7KI3uYY/BvLwhpZOOPo
	sRfwwUxB6wPkFrWo7pra/TA9Db8IEr+kGAlh2w77nAeEpHH/bk2GRuGAphc/StMdm3HVcIV9jC68V
	AxxiXgL6TU+Qj4K6w2vFC2ZgTBbx1MtOEPAKK96gLu4CBTy7rBYDUl7X2T/NEZCIawWFWCN3ggU7r
	KBNtna8aLevqI5usQhFbqOsZKfmel+gcwX1FO+ILWpPP5A0iPv1PTDnWqxZmd/b+1+rIFCkoVTcgR
	4Ld5nNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqip-00000006ig3-0GIm;
	Thu, 22 Jan 2026 09:11:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqim-00000006ifP-2H7D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:11:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A60B43DFA;
	Thu, 22 Jan 2026 09:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE156C116C6;
	Thu, 22 Jan 2026 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769073080;
	bh=KJHCIOkGx5u/d7mxF8NKEwJkoQXnIm8GQsBg2ZgGEFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dcPxjQOVfaMrESS2G5htdN7nCV2jKRGRWNLMe3I+4Ghds00qWam4R8QLTrhKjwUlI
	 ycf3k43vcscqRrq4ms9QbE1ADSd87GkCNRbvZHRVjM5ugkIndNrJc4CxKXJXoj59hX
	 z4mU5q8bJtkaAaaq/ZpMH/FRia//d10r66sczcH5gRLZPcMKBCSwjKJWAHLGHJSKSc
	 tuvf+ikA2cVV7ECP+PxV8O5NI860rw589TFGFTRl78dpnqdBpPWiYrAhx0UOivPmkS
	 YVKYIk1PbGyBec2lraeXMKPpvD3rdIV9+m+A4X5If/FJYMddA17GuQl3TeKwOEu2an
	 aLYrT4FdgCUDQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1viqij-00000004cXL-3SbK;
	Thu, 22 Jan 2026 09:11:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	wanghaibin.wang@huawei.com
Subject: Re: [PATCH] KVM: arm64: nv: Return correct RES0 bits for FGT registers
Date: Thu, 22 Jan 2026 09:11:15 +0000
Message-ID: <176907305597.536564.1301692951815712064.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121101631.41037-1-zenghui.yu@linux.dev>
References: <20260121101631.41037-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, wanghaibin.wang@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_011120_600400_39D30CB8 
X-CRM114-Status: UNSURE (   9.68  )
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

On Wed, 21 Jan 2026 18:16:31 +0800, Zenghui Yu wrote:
> We had extended the sysreg masking infrastructure to more general
> registers, instead of restricting it to VNCR-backed registers, since
> commit a0162020095e ("KVM: arm64: Extend masking facility to arbitrary
> registers"). Fix kvm_get_sysreg_res0() to reflect this fact.
> 
> Note that we're sure that we only deal with FGT registers in
> kvm_get_sysreg_res0(), the
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: nv: Return correct RES0 bits for FGT registers
      commit: 2eb80a2eee18762a33aa770d742d64fe47852c7e

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



