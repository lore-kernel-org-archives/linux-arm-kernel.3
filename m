Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A65E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yPQ0zLzYuKnYkeFDfWM0/c26tZ4izY49n9st5sFwwBA=; b=Nf9I85syoamk2CPXP8VI74alNf
	Hs07ATfc9ofI7lINtPpRAV4qW+VxdyOvx+yRCTLcVK76G9cQ+H5CF+DezXsMsNWJXCZwB+Nbk4Sdg
	tGVrpcpH5UcmoJ4YNIhIvoeT9RhJWxtbj+2UhhzB9uW5TzHutzg+UqselYXZ8YWnk+xgSIYURfsjA
	7TZamyVPiU6iKIzvt27l2ruafinBD0zA+senPUxUoxGlbBWO0tKv/rmMXYn7OKr3BWZfYoHKmCL2J
	MDMeVig3K5Nz1zBGQGNd/KnAXN3j1IR6NPaHn+HnXPKbK88OUlB4+gOZnbR+aSduCtOg8zFwN090W
	28d1WZlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM7Df-00000004Cpl-3Db3;
	Fri, 13 Dec 2024 15:04:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM74f-00000004Agu-1a3D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 14:55:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 935D4A41998;
	Fri, 13 Dec 2024 14:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB5FC4CED0;
	Fri, 13 Dec 2024 14:55:21 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Will Deacon <will@kernel.org>,
	broonie@kernel.org,
	Dave.Martin@arm.com
Subject: Re: [PATCH v2] arm64: signal: Ensure signal delivery failure is recoverable
Date: Fri, 13 Dec 2024 14:55:19 +0000
Message-Id: <173410171664.5468.16391474217431387071.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210160940.2031997-1-kevin.brodsky@arm.com>
References: <20241210160940.2031997-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_065525_483355_EE1E7F53 
X-CRM114-Status: UNSURE (   8.95  )
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

On Tue, 10 Dec 2024 16:09:40 +0000, Kevin Brodsky wrote:
> Commit eaf62ce1563b ("arm64/signal: Set up and restore the GCS
> context for signal handlers") introduced a potential failure point
> at the end of setup_return(). This is unfortunate as it is too late
> to deliver a SIGSEGV: if that SIGSEGV is handled, the subsequent
> sigreturn will end up returning to the original handler, which is
> not the intention (since we failed to deliver that signal).
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: signal: Ensure signal delivery failure is recoverable
      https://git.kernel.org/arm64/c/a3b4647e2f9a

-- 
Catalin


