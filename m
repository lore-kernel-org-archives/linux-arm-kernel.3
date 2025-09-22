Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55F7CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 23:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YROanHWLsZyxpmkg+bbLtUTGJa8eSeOXO+0+S132Fq0=; b=t9h48R6s16jmX63OnOGyvFIogJ
	d8EB3y4DrVxe1rd+ryywQhS1J5rLS6GJi5oG0hqjaVAmAj948kVZU5rxKkDvys/2vtZsARdGfFs+6
	p017B9iXEXSbq8bJziitCBwp2t3NgY7vFuRY+YbgNMh6TyspzOw460E9LyaZTSVWoEn/48h/9/Dg6
	WhtxPG1XR5y3vFkCoiANSpTskKU3Pf1bdBuzLdLYW7Crd3vZQRIpnsyud2oUYdHybbxSZlPa3evQX
	nicnQyl+buY8YQTkBK8a+IBZj2iW+iI76uN236wzl1XNSnuhBWVmO703FiIaY991dfzMXnNI8coLN
	1JPXbicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0q4e-0000000Bn4a-356f;
	Mon, 22 Sep 2025 23:36:00 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0q4c-0000000Bn3W-0e88
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 23:35:59 +0000
Date: Mon, 22 Sep 2025 16:35:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758584155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YROanHWLsZyxpmkg+bbLtUTGJa8eSeOXO+0+S132Fq0=;
	b=bhknsX6/vaxKSZnPvKsUbfdwHD6LKytZGBvllisw+rMQMMDWi/4rtFUuhfA4B3/v1aCWwx
	Lp3TL0ZLYkFWymqq4yqURK4uTHU3iRkrYuECvy+ovmF+ipjkrCz8O7QI8VSLtwPLDJfEmb
	fe6iGL/v60eF86/upnlOh+WZHIH3+qc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: selftests: Cover ID_AA64ISAR3_EL1 in
 set_id_regs
Message-ID: <aNHdVtel5VGMltJb@linux.dev>
References: <20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_163558_332942_D588D748 
X-CRM114-Status: UNSURE (   8.99  )
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

On Sat, Sep 20, 2025 at 08:51:58PM +0100, Mark Brown wrote:
> The set_id_regs selftest lacks coverag for ID_AA64ISR3_EL1 which has
> several features exposed to KVM guests in it.  Add coverage, and while
> we're here adjust the test to improve maintainability a bit.  
> 
> The test will fail without the recently applied change adding FEAT_LSFE:
> 
>    https://lore.kernel.org/r/175829303126.1764550.939188785634158487.b4-ty@kernel.org
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Mark Brown (2):
>       KVM: arm64: selftests: Remove a duplicate register listing in set_id_regs
>       KVM: arm64: selftests: Cover ID_AA64ISAR3_EL1 in set_id_regs

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

Thanks,
Oliver

