Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DF2606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ht41tyW0;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C2WdeDsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qp9j90rvNjQEHYpNnURle2G+so6ZY/ayC5ckMBJ47tw=; b=Ht41tyW0V5y8bm
	sX04CEp9IeqFIQDrHKYCj8yKiuvnkwm3W7cUJPBndcBGprZ9IggpX6k63cTLqJZIxfUdQpE7UyBy9
	Vk673u9T4DwyudlYU1nPcVVzPrgZufVVsk+ZAtRyxQ/r6iDK8MPMVwZJobH3Epcg3gGLhAA9hLVEF
	lGY0X9W4BEM/yy8Am3iMVkcAXP8n+vqYUFqPBX2fGexRcZyrsnpcwscMfqfpaLm8GFSO2iQGFP54K
	Ak7tuGh05zDzUbqDKJq6DElDGh6M0nPoFYezZjAx7BinnGoT6vpGEjXa++IqXLoCLKirhFYQ+xOV6
	H2RD2LZ5vksQLN6RYUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwk7-0000000Eb7Y-18V1;
	Thu, 22 Oct 2026 17:38:19 +0000
Received: from out-159.mta0.migadu.com ([2001:41d0:1004:224b::9f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwk3-0000000Eb6m-3Pct
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:38:17 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qp9j90rvNjQEHYpNnURle2G+so6ZY/ayC5ckMBJ47tw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792690691; v=1; x=1793295491;
 b=C2WdeDsy/Q6QBr9Xyku5LDGL9KE4sGVWTRGNEc9gDyAjsYyZ4YUmhkHS88MsjykoVJX8Djca
 Gqa15OEkXcTAbl1j3yCpfYDKA+SMukdL022UmNe2NVngXAcx5trsyFP8HuV4HdiPygEIw71tv99
 p6BTAHIKPpfzJTsDz8/+5+2w=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b2080240adfd05ac;
	Thu, 22 Oct 2026 17:38:11 +0000
X-Mizu-Trace-ID: b2080240adfd05ac
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	kernel-team@android.com,
	tabba@google.com
Subject: Re: [PATCH v2 4/4] KVM: arm64: pkvm: Avoid trapping on HVC_RESET_VECTORS
Date: Thu, 22 Oct 2026 18:38:06 +0100
Message-ID: <20261022173806.3752938-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022140048.2522787-5-vdonnefort@google.com>
References: <20261022140048.2522787-1-vdonnefort@google.com> <20261022140048.2522787-5-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_103815_986173_9BB7F47D 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

Hi Vincent,

On Thu, 22 Oct 2026 15:00:48 +0100, Vincent Donnefort <vdonnefort@google.com> wrote:
> pKVM prevents the reset of the hypervisor vector and as a consequence,
> kvm_hyp_initialized can never be reset. Add a fast-path for this case to
> skip unnecessary HVCs on the CPU hotplug and PM path.

Could you drop this patch? It brings back a pKVM check in the host code,
which Marc asked to avoid on v1 [1], to save one HVC that pKVM already
rejects.

Cheers,
/fuad

[1] https://lore.kernel.org/all/86jynbyshv.wl-maz@kernel.org/

