Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67267606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yToDXIUY;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qmN/XCMN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A+c88oY+OM1KTWwYSavDme1bSrIZkOp07+hlEpWVcCw=; b=yToDXIUYNEmPVhCr768sZ6a77L
	Rm/n8ziHt97vcqNFfVveN9IFztoqUW2CXOnv15RzdJp6TRRtRHBnT9KdVoH7nJjsNgHC70RS7laF9
	n/gXk6rWTerlCdh6LvVgUq1BUJDpmwYJ4ZVR5AzBOYKCtdNbz8vLkZRqCaXDDtNki9VgwSQSMF3+s
	qy1IviOx/gL9LhZmY1G0TmPuhpLTOmIED0WJDgrjudhm4GuSP5JgrwDbqJbX+PjIY4B8jZBgrxEh8
	4jJqvz7bXefea/I8Jq9SCB+qA4tM73qL398mP8CGfe6UWpESqhuHu7TFF7mDEulCoYjHF1QBVvGev
	IU+WurqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOds0-00000005z5C-0Uo5;
	Wed, 04 Nov 2026 16:29:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdrw-00000005z2Y-2YXz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:29:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA628169C;
	Wed,  4 Nov 2026 08:29:44 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 378FE3F632;
	Wed,  4 Nov 2026 08:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793809787; bh=yfV7Pr/7oJjyugoqKWkyvS9QCQp5fdkcK+WpMwo/qac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qmN/XCMN+bMq7vL3IroW/zO5c9utj8tVY7h4PeGCnZGzZx6QJb+MVfxfmxpGIFkWs
	 MPGF/7odw2F/vJpAguk557fWflsz7TXTzAaTdWmwif+k4Ga1M/3BXeRPSyJhdDYVVy
	 1rCDBkJOH7eR30KB5XIpAumuo7e8R8w3RhGUWzuw=
Date: Wed, 4 Nov 2026 16:29:42 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: michael.reeves077@gmail.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Myria Sarvay <myrialsarvay@gmail.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: Apply existing Apple Silicon CPU
 workarounds to newer CPUs
Message-ID: <autddoQr_lqAS3v-@arm.com>
References: <20261021-apple-m3-m4-kvm-v2-0-04905152cc2a@gmail.com>
 <20261021-apple-m3-m4-kvm-v2-2-04905152cc2a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-apple-m3-m4-kvm-v2-2-04905152cc2a@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_082949_737415_9CB8F67F 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 10:53:21AM +1100, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
> 
> Add M3, M3 Pro, M3 Max, base M4, A18 Pro and M5 Pro to apple_cpus
> so they receive the existing PMU trap and broken SEIS workarounds.
> 
> Add these CPUs to has_vgic_v3 so KVM detects TDIR support and can
> trap guest DIR accesses without trapping all common registers.
> 
> Co-developed-by: Yureka Lilian <yureka@cyberchaos.dev>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Tested-by: Yureka Lilian <yureka@cyberchaos.dev>
> Tested-by: Myria Sarvay <myrialsarvay@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

