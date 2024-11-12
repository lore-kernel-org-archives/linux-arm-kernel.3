Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C77D42BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dmpqs5aE19Tc62cip8LOitV1DuPQHwzZKG1ifAR7Kw=; b=AWxHnB/kGX2dXYFXCVN8cYIhbV
	fqGXe6cO51YUBilWuRIMFn4WLBrMJziufDj3kYU/VYwLsQj6t0ehmZnblDCRzlvEMBjUOLH3jYANH
	DRfVCCF9yb8n6G7Rn/aooGKAZfY+juwOmnyCJkwAqcwGU/GtrjdhImK053aCV8anqQF1gkB+xf19z
	4kdsQtQuriFC/BP60diFSs9uVinG0+2pIb9P8PM376MWdevN4IAFqOjV7sOn8lRV96y7O2cJAMgST
	CKbaop4dN/wly0mtKOkAWcRGAcSEjZF8KYY3gElXNCQAvgANyrbtTwyQJDjNNCCuvSw48sx9dlVlc
	/ek/7Bxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAthn-000000048BU-3W2g;
	Tue, 12 Nov 2024 16:25:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtTF-000000045YL-0K3I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B31D2A41E40;
	Tue, 12 Nov 2024 16:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D9EC4CECD;
	Tue, 12 Nov 2024 16:10:21 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Oleg Nesterov <oleg@redhat.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/ptrace: Clarify documentation of VL configuration via ptrace
Date: Tue, 12 Nov 2024 16:10:19 +0000
Message-Id: <173142780465.896456.9873316347312765271.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241106-arm64-sve-ptrace-vl-set-v1-1-3b164e8b559c@kernel.org>
References: <20241106-arm64-sve-ptrace-vl-set-v1-1-3b164e8b559c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_081025_206641_F9735A4D 
X-CRM114-Status: GOOD (  10.36  )
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

On Wed, 06 Nov 2024 17:41:32 +0000, Mark Brown wrote:
> When we configure SVE, SSVE or ZA via ptrace we allow the user to configure
> the vector length and specify any of the flags that are accepted when
> configuring via prctl(). This includes the S[VM]E_SET_VL_ONEXEC flag which
> defers the configuration of the VL until an exec(). We don't do anything to
> limit the provision of register data as part of configuring the _ONEXEC VL
> but as a function of the VL enumeration support we do this will be
> interpreted using the vector length currently configured for the process.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/ptrace: Clarify documentation of VL configuration via ptrace
      https://git.kernel.org/arm64/c/c0139f6cbb1f

-- 
Catalin


