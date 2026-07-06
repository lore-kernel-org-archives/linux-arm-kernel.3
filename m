Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67265C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYBpy8zRzkofUshdAnxZ/FWgmq9S3pQn543IzDx2MdA=; b=ZYblPjU3ottMSzrrmgamlOILMG
	KWYaUDjR4DN6/fRjivLgKyquUHjrvDnHNv+J3pbhTXL0G+rd6UxsLzpk6pyU7PvV1EhFzY6zUz1om
	sorEob6aJFKH9VdUH/a08k7YouWdAPO1gwbT2tcZuRN5wf8xOGExVFBKsA8VvTKsCHtCdMhd30OfY
	0sfyViLKIhSlmp+zf6Z10+ld8r7YYxVJfpbxFHjJf5TctBhHyKgX2n3nKr5i0XeqEuA7W9asVfdwE
	D0yAdCQjaiiM51n8d1eSzj2BoyqnUDMYlr98Yq+kyOiZSfHq4Lv3aUBo8vIly8w2OWcJZgpFlSV95
	VvlJlIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgm2z-0000000D1eB-1emK;
	Mon, 06 Jul 2026 16:19:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgm2y-0000000D1dm-1NmK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:19:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE217438A6;
	Mon,  6 Jul 2026 16:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4611F000E9;
	Mon,  6 Jul 2026 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783354791;
	bh=UYBpy8zRzkofUshdAnxZ/FWgmq9S3pQn543IzDx2MdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k3zTKPcjQfumojhu8OA6gDYeOViJPi/Jg2c8ZbHHAEksn5AxKLYy0V8fhwjhBH7Cy
	 HG3syJBi6dXVfkFn7Fu799XT/2AJQVqxe9I7OXfvC31V0+3AQsBE1ITqDDvlrTlqUz
	 yF6SnkfUlSYaqGh558iIyinO24Qfx3M0/ts61AV9Q+RqZcddHSZhwvs8GjaR/olPAq
	 SDIJY1ksKjOsKWMDF7o1NVb9yOImMvFNmy9siqKdgPcizEl/BX3BlN1UIjhRPNTtjs
	 kEhR59fV5JxbxUaWWwI/QtmbxX3uVz8/+t7GU0tPT6I5HTo+/RT/cjAx8+1p7TXz8f
	 Vg3VGOmFXMjbQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wgm2v-00000002241-2h0s;
	Mon, 06 Jul 2026 16:19:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Victor Kamensky <victor.kamensky@linaro.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] KVM: arm64: Fix and test MMIO sign-extending loads
Date: Mon,  6 Jul 2026 17:19:46 +0100
Message-ID: <178335476045.1423186.16967081834090661030.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706115522.954913-1-fuad.tabba@linux.dev>
References: <20260706115522.954913-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, seiden@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org, christoffer.dall@linaro.org, victor.kamensky@linaro.org, tabba@google.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Mon, 06 Jul 2026 12:55:20 +0100, Fuad Tabba wrote:
> Changes since v2 [1]:
>   - Patch 2: dropped the second make_el0_accessible() call and the
>     el0_be_loads_end symbol; the EL0 code page does not need its
>     user-access bit set because it is fetched, not loaded. (sashiko)
> 
> Oliver's Reviewed-by is on patch 1 only: the code there is unchanged
> since v1.
> 
> [...]

Applied to fixes, thanks!

[1/2] KVM: arm64: Fix sign-extension of MMIO loads
      commit: 85f56708a443ec02a290878f00d79a1ff5110e41
[2/2] KVM: arm64: selftests: Add MMIO sign-extending load test
      commit: 65a38ddeaeed1a962bc1b4ca03c98201c877fea5

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



