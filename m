Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1671D597A3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 20:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2wfruU0o5MqkGZQlyyUPdYIgcNLexv/NYFlVrUjaf0=; b=bIbnKWz5s/ZjJQgM6DGJghSNrW
	GhBhCEjtv9aom95S/1TtH90/iGnSARA3VjCuTJgOpQeTw2hNDMHwMPKzKZ3Q1D/AnOaMFMPc7Pvnp
	ORMaLPKapz81tHo9WCdeELyKPOh9s4L6RH2wO6/FcUzTMLknjyDlYu2zS0yds/Pb6iiSOu7nv+Eou
	86Pah2C11jtSgiQTYoozw8TpR+qSxnytYEiQsty2IYUssVZhxohI/sa86lse/qc+UWtXTnwXTct3L
	zbOYFGbzgGe89hcU+EJQpK8jW5YXqOikTG4ppAdF5NMVW5JIeTcKCo9P321ZrYnBjc/DYveBG9e7A
	6kVp8TqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAxXY-00000004sNT-3baw;
	Tue, 12 Nov 2024 20:31:08 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAwKg-00000004fqu-3F2D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 19:13:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731438822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k2wfruU0o5MqkGZQlyyUPdYIgcNLexv/NYFlVrUjaf0=;
	b=nswQ7FZ5qmBP/kugTAbcuj0+xAIgf8NB4/n/qS3hx7IGc3FCjrj6Xi6HelVeSqxa95yf2M
	6vYQz+5m1TTXmuhzGgcvf60p4YozmyoaeEF9pr1o/FbiSZVf8GjmQ3izmZlzs9iysdMUcL
	Rc8270A+I3YuY34i3envIE3Ka6Buct0=
From: Oliver Upton <oliver.upton@linux.dev>
To: tabba@google.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	James Clark <james.clark@linaro.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Pass on SVE mapping failures
Date: Tue, 12 Nov 2024 11:13:27 -0800
Message-Id: <173143830153.1780821.3252624992091199319.b4-ty@linux.dev>
In-Reply-To: <20241112105604.795809-1-james.clark@linaro.org>
References: <20241112105604.795809-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_111347_063984_862D11B0 
X-CRM114-Status: UNSURE (   6.78  )
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

On Tue, 12 Nov 2024 10:56:03 +0000, James Clark wrote:
> This function can fail but its return value isn't passed onto the
> caller. Presumably this could result in a broken state.
> 
> 

Applied to next, thanks!

[1/1] KVM: arm64: Pass on SVE mapping failures
      https://git.kernel.org/kvmarm/kvmarm/c/60ad25e14ab5

--
Best,
Oliver

