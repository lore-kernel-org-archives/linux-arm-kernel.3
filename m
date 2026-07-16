Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02CEC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ao3Os8JtzbF7f7/1BpjjC1xMw0gtVZj+GS1Rx2K1zgA=; b=n0f+4909gtXBs0v9rOd+IDLWri
	AvD2tHmU3ydscGyc7fblWwhFnOErckyyOYXXAbXh66pWyFcPXu0ZqA2MJPLtRfSTfwD7vqcpgC2cU
	syc0ZeAWIMgbJU0Up/iz7VxEWivR0lfDPrF8a7y8cwWA9Opf8JCcjTM8/kG3BifnZoQ2OCIokiw9O
	pGY+9XuRphcOccHt99+fQ5CLn0/SsYMQDEpWBViSGuM4P5RIIwcLb0oH8ZXq5Xd+VF6LH1H0OTWU+
	vMqOqpNM7OsWW1GEU1VuTqKwij5eXlPw+J9wYi12lQ8k/KL5ipI2tKGyQHIUed4BTNTpmsj6O7LzR
	b+UtJ6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPFv-00000000CcK-2u5C;
	Thu, 16 Jul 2026 16:48:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPFr-00000000CbL-1981
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:48:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3A9C60A5E;
	Thu, 16 Jul 2026 16:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119C51F00A3D;
	Thu, 16 Jul 2026 16:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220490;
	bh=ao3Os8JtzbF7f7/1BpjjC1xMw0gtVZj+GS1Rx2K1zgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ViWsLPL2L52z1dRWFarT3WKwOmdLfcmjumsZrcTU6Y7mQm+T+bUqGdAuCrWJvh7Qd
	 GrHnXyA5x6zeUnMHSelbd6ChDxPwHqtpRj01pW9yfSyRfe34/PNIQn1KzAv67vR3JU
	 lJ2AvbihnqW5kcVPEEB+d34Ne0MWTdxZ7SJcT8u/7rRvJehdg4AiFwQGxqPfMlefMh
	 CHhNo6M5PufoIqqSkpgvWwbXhCG7pOuMSztxpOPDDUXB+1IyUCTVGMDzHJyoKa7rEh
	 19iw6RsUoNLdkWGjlh91PrD7ks5HYgESM7rGlc/R4maw1UFr5/VD3EuGPqyAiRGUf4
	 jQxRC312NvcBg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: When logging data aborts only decode Xs when ISV=1
Date: Thu, 16 Jul 2026 17:47:57 +0100
Message-ID: <178421467427.63287.7221010122666741553.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702-arm64-xs-decode-v1-1-64600f149969@kernel.org>
References: <20260702-arm64-xs-decode-v1-1-64600f149969@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Thu, 02 Jul 2026 20:13:35 +0100, Mark Brown wrote:
> When logging the decode of a data abort we currently unconditionally decode
> and display Xs. Currently the only defined non-RES0 values for this field
> are for cases where ISV=1, move the decode of Xs into our existing check
> for ISV=1. This avoids potential confusion if some other use is assigned to
> these bits for ISV=0 cases in future, or misleading someone into thinking
> there is a meaningful value there with currently defined architecture.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mm: When logging data aborts only decode Xs when ISV=1
      https://git.kernel.org/arm64/c/f797f51a185f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

