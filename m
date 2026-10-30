Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E014606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p9H/QB91;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+wSqpex
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qAPz+q05J224FADG5AGvB6vTxv/qL4tcXrC9H9Sjahg=; b=p9H/QB91c/mlkBY+URyIz1KCuz
	r0sQfjd5wZcoXpXXtxzC4uR00H+JSL9z6DabifanyEWXQnzGoy9XaxWF7ISr0lX1jWAVh9iI4bnUr
	ybdK/HmVAM0BtvdV8KJwhKZcznliN2MZoUnbp5bLbRX51rRPJmwlUXScOdELff6J07vqSnxM3b9NG
	+F4KnaPMnxtAmgr9Fo1ejKJI6u6KwbO+4gWucn6N/lqNiJAJIRd+UJgpYLJpKOTo/20vE2EetPwSY
	JjxKZJUmlRuupRrHPLsmiczsaNZ8mytAcQAfPMTgbH2ODdJsjSwj4woiiwfea+KRa/XmOunrWqNgV
	H4Z46g4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlKs-0000000BctZ-3DJb;
	Fri, 30 Oct 2026 12:03:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMlKs-0000000Bcsu-0SmN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 12:03:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 013F560252;
	Fri, 30 Oct 2026 12:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A4BC1F0093A;
	Fri, 30 Oct 2026 12:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793361832;
	bh=qAPz+q05J224FADG5AGvB6vTxv/qL4tcXrC9H9Sjahg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X+wSqpexr2WBrOmsc/ciaqLCuSTHbRwzwV5/UogvJFEABK9V1tMvRXzq5GZ1ymkAH
	 VMVvqaiqlBfZoA1/BHmgJnpfmjXtKak6144qshL8u96+G5LFWcAOhTqfPJ0pVqn6dn
	 1l6/TBGsPnd7Yq4Ns36BpdIeIRC98z1wG7wvbQvW3iHlPZ0w6mlKYAtn16VmJcp5FV
	 DBOqNOOLB+4A6xRfxImMleZ6U0+w0GOOwt/9jEzsGdsHlGcciakCIlqL2uIrBMVvUv
	 l1Ynw/toqblBmjKGF0Enfvl1/D417O8V+EhELAD0u1pp4nZ/6/nwDuY0LPYIlhhrH3
	 XAIyrXTT8zDXQ==
Date: Fri, 30 Oct 2026 12:03:46 +0000
From: Will Deacon <will@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:ARM PMU PROFILING AND DEBUGGING" <linux-perf-users@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Support for BCM5301X AXI trace PMUs
Message-ID: <auSHoj46Os6gSEUH@willie-the-truck>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Florian,

On Tue, Oct 27, 2026 at 10:51:21AM -0700, Florian Fainelli wrote:
> This patch series adds support for the BCM5301x PMUs which are AXI trace
> engines present in the chip.

Do these replace/interact/support the series from Ian at:

https://lore.kernel.org/r/20261002175738.3242646-1-irogers@google.com

?

Will

