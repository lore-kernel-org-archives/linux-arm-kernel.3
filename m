Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC71C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5ODFOLBDRSuSRe0FKrA5EBasSsWwYo5oqsRBYLdzcQ=; b=juwJMuCC5mh2piWGvYw3EIw+hI
	R/wWmorSTll+UolrTIHSwR/7NTK150mMjEvgyh6FZKE1RI31fSsMLWULcq6h39xU6PikI4jZB9P+m
	St6zYAZy37Wx3mRU8VxQnzF16xwKyPfpQZ+wlcaNcoyNMGAW5EgjTAt9fK1gslQ03E7VuYhdG2fvP
	xzggiRxTqP38L2Y6boD/2XcAY7GU7odLJneQXmDJWXocZiADRROuXFDEPyP3ixUnvIkKaPBJiCodN
	rtnP/Jr/uHnXj32zx73+fG+gIDTuJPWYk6VguwEBdu8Ws8zFiCuiBn3zavk+2/QbmBeAcFFbLXobs
	oIAMYOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjMu-0000000ACvY-46Qh;
	Wed, 19 Aug 2026 16:42:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjMs-0000000ACur-1hET
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:42:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BBA214BF;
	Wed, 19 Aug 2026 09:42:17 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C8B53F85F;
	Wed, 19 Aug 2026 09:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787157741; bh=W1ppSykwItkTQz0g17FZTvhSElTOeWoKXsJjVg7bfAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Figfs/0iURS/KBp+1t5gW7r16MA/MdgyFtdE7+XSkDILZ+jObt5M3XdbCu8q0Tw+Y
	 leewidxQ6MOjHdQmZMl8u2WpTm5F93N2jFoBK0SH1ldOigAbLLQ0nO8e7h2Mi+vqpT
	 OhiiT+UaosXRFOevgQfIaD9La+GypT9TN/L+9wY0=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v19 02/14] KVM: arm64: Fix FGT mapping for HFGITR_EL2.nGCSEPP
Date: Wed, 19 Aug 2026 17:42:16 +0100
Message-ID: <aoXc6FAZf9GFo0cg@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aoW1ywZGCvJaYQqN@LeoBrasDK>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org> <20260812-arm64-gcs-v19-2-9105afd828ac@kernel.org> <aoW1ywZGCvJaYQqN@LeoBrasDK>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_094222_485615_A1CFF4CE 
X-CRM114-Status: GOOD (  15.04  )
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

On Wed, Aug 19, 2026 at 02:55:23PM +0100, Leonardo Bras wrote:
> On Wed, Aug 12, 2026 at 08:12:01PM +0100, Mark Brown wrote:
> > The encoding to trap mapping currently maps a FGT on OP_GCSPOPX to
> > HFGITR_EL2.nGCSEPP but as per DDI0601 2026-06 this FGT controls trapping
> > of GCSPUSHX and GCSPOPCX, and not the separate GCSPOPX instruction.
> > Update the mapping to reflect the architecture.
> 
> That information seems to match the one in Arm ARM version M.c.
> nGCSEPP, bit [59]
> 	When FEAT_GCS is implemented:
> 	Trap execution of any of the following AArch64 instructions at EL1 to EL2:
> 		• GCSPUSHX.
> 		• GCSPOPCX.
> 
> It looks like GCSPOPX can fault if the record is not a valid entry, but 
> there seems to be no trap register bit for that.
> 
> Thanks!
> Leo, 
> 
> 

Ah, FWIW:
Reviewed-by: Leonardo Bras <leo.bras@arm.com>


