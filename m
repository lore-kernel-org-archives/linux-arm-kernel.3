Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AACC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 08:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRWq+bBWMkqfZbZV/+7P3UIt2LtdL2A1Y5faFTjaNBA=; b=gDTODwm9jFCku6L/dT4xeOaM5X
	MfU7y4dBhcmQVK/1Y7l7gy1wq0MnuXuv4bPyAh/kFZteLAHPIv4TOtRIXCtZ0R651EOsEMDYx23uS
	/bcLHsV3QqeEQNaZ8UUucN3qADOb3HpKuCVfdMQAMk+vJBNiW4ZJZtWWEERw8zBsxqi++Hj84//F6
	k/ycbExN4UkQZjY7DILs07q2gCuGgBFc5xMfVhJN8em5UC2UrwgGXcnwn2R+up6ZfEuafRyLpviFj
	84ak4eYjHysd6kmBz2h9lih6V43ZaZkunQ/No0enXGOLyomhVi4dUt6qeQrZTUNkp17Vj7+oFflg1
	wzCGwtuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaaI-0000000Epe8-2B5i;
	Wed, 07 May 2025 08:56:58 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCZeT-0000000EctX-3Ptm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 07:57:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746604631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRWq+bBWMkqfZbZV/+7P3UIt2LtdL2A1Y5faFTjaNBA=;
	b=bVzP8GPgXCiJVtfukPZyZEn+h1ClvsVypIaZaEC/5LM2fZIMR+jjCvHA9f7exEtTbry2rE
	FJCnvJ9D2C7HZbuAGq+aYluNIbwZbjNud8S8OfPTPsZkjHyO0qEgKTH+JsqLWgxzfJRRvr
	jCNDUrNNnMVcCMel/QN+VtI6FzW4OBA=
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Sebastian Ott <sebott@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix uninitialized memcache pointer in user_mem_abort()
Date: Wed,  7 May 2025 00:56:51 -0700
Message-Id: <174660459083.2542293.85268453831284543.b4-ty@linux.dev>
In-Reply-To: <20250505173148.33900-1-sebott@redhat.com>
References: <20250505173148.33900-1-sebott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_005713_989051_041C6B8A 
X-CRM114-Status: UNSURE (   7.58  )
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

On Mon, 05 May 2025 19:31:48 +0200, Sebastian Ott wrote:
> Commit fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM") made the
> initialization of the local memcache variable in user_mem_abort()
> conditional, leaving a codepath where it is used uninitialized via
> kvm_pgtable_stage2_map().
> 
> This can fail on any path that requires a stage-2 allocation
> without transition via a permission fault or dirty logging.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix uninitialized memcache pointer in user_mem_abort()
      https://git.kernel.org/kvmarm/kvmarm/c/157dbc4a321f

--
Best,
Oliver

