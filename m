Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C9D606EE92
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GYZQjEfU;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RfmHz4Fz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x/FsVPxFZdwretPYcMBzrm58LiH7fpqIQNmVBOK7HkE=; b=GYZQjEfUD73c/H
	ZXfqcrSPFT3XZl65dmBrVAYYzepO6jeiJFOUGtHWp/U+ug0Mc/7Lb0+v3JQ+MY+YzTnvCa6ESBIZ2
	/WXUMGtHcBwzHAWkuokUkG9b7+jL3XC54g+3Dd7qvHOPlNcofGGdKJQAbbzL+YtdSca/4HDx0bf4R
	1nKWJBdpXxNskDM9N8zLrGABY5SnYW9D9XU/kTUhpCd1HBQtRaAIHPzN4PYgA1xyOBk7Rx52ek0n6
	QzjUPneuEaO54aFbzS46qua6GitA4+U1po+Zc3QMO+i9n08905rr2h5Vad8rrGEA95xkKw7GMJw9K
	xblgFlozHuLCLz57mXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDZ-00000002T2y-1N4g;
	Tue, 03 Nov 2026 13:06:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEDV-00000002Sws-1kl7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:06:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2962443F8C;
	Tue,  3 Nov 2026 13:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8601F00A21;
	Tue,  3 Nov 2026 13:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711181;
	bh=x/FsVPxFZdwretPYcMBzrm58LiH7fpqIQNmVBOK7HkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RfmHz4FzxU3w2f6jRloSc2Y/6x40zsf77FmNb/Foh3p4Ddi8OE4c1dyG/Nt0Td3P1
	 2bu28l1OXKmGYoxdGFrh1XlLJRsWqVlNo/Hxx8DwnZMwLKxKuUHTKYjL3jWjlv6dip
	 Mltp+8YTjUVtgPKhYdcCG9xZanU71Ppc2bCANdoxCMd9IZXfQMVFpb75hcAvgtEbn7
	 chdrUYNIoO0S99LN+I4SAlE0QYAN/Egc2Lh5MBNrn9YebJkNeCRSGQeLjVT4DczdKM
	 qwOil4H/LbiwXpQ16/pW1Zfy68zb20H6dozXRVo+Nx78UolqCu03HKyKyuQ/srQIw0
	 PJSuV5qWDtZDw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xOEDT-0000000ATWs-1Lis;
	Tue, 03 Nov 2026 13:06:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>
Subject: Re: [PATCH v3 0/3] KVM: arm64: Fix PMU handling in pKVM
Date: Tue,  3 Nov 2026 13:05:37 +0000
Message-ID: <179371111276.2844725.10156435514804417873.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028153152.1740044-1-fuad.tabba@linux.dev>
References: <20261028153152.1740044-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, vdonnefort@google.com, kernel-team@android.com, linux-kernel@vger.kernel.org, oculytic@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 15:31:49 +0000, Fuad Tabba wrote:
> Changes since v2 [1]:
>   - Stop the host's counters with PMCR_EL0.E rather than the individual
>     counter enables. (Marc)
> 
> Two fixes and a hardening patch for PMU handling in pKVM, as one series
> [2].
> 
> [...]

Applied to fixes, thanks!

[1/3] KVM: arm64: Synchronise kvm_host_data before host deprivileging
      commit: 9e29ea628848d29eea948200c4357f530b0e1768
[2/3] KVM: arm64: Pass the PMU events to the hyp vCPU of non-protected guests
      commit: 8ee90ca40b10cc040544fdccf24b20115f46aa7d
[3/3] KVM: arm64: Disable host PMU counters for protected guests
      commit: a7dd36f7e381025bdf01d8665bf37167368754c4

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



