Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FF0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 23:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHW2uIjqLfLRrfePxMDheicUVgtFeVkPZz48RRH6vbw=; b=SUNEpfbIa3tnP3vXJchIp1CeFj
	aKCwwvrNXZWqD+4sOaNKWdncHd1xzhZ/NQCZelL/HSj8lNgJr2Ck/TyNOrZ1oPRVCjJSRI+unw6OD
	BYmSO+f/jry4NkTg9K2p0JEwYqBTyOWvSMSEISAr0kFBTQC2Q0smTeK8/xmO+ZEk005ooeeO1eSzH
	FTeRDvqII5eDvxkdF5BQrVDeMMt538nBmUkhLcVRh3svlEKIRYuFRvT0NkyW8vWRJczpsxSKqw254
	rEoDjEjQX2fYCyKnLjSxvgpec6msPqctqaB0iqY5wC7vcxEKVFkd+3En3aYaOZrGVGeQbj+rN9WEo
	k1jAzU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWO53-0000000HDSM-0cHI;
	Fri, 10 Jan 2025 23:06:17 +0000
Received: from out-185.mta1.migadu.com ([2001:41d0:203:375::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWO3p-0000000HDI3-1KIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 23:05:02 +0000
Date: Fri, 10 Jan 2025 15:04:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736550298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iHW2uIjqLfLRrfePxMDheicUVgtFeVkPZz48RRH6vbw=;
	b=sraxE+KEzy341Fie9FEharelhRsU58Cl0w9fs6jIbtqeKdTyeurqcVepZ8kVGA+tnshp1W
	Nx5Q9rsE7R9U3u/khpEASt3SF1JWqDHcYxLmYKfFkGdBA4dooZkBEyJqAhuVWvqOxe3t/e
	vcMOAK2XHNxiuSPuewis0B+9tcZ4I94=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Sebastian Ott <sebott@redhat.com>,
	Fuad Tabba <tabba@google.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: vgic: Use str_enabled_disabled() in
 vgic_v3_probe()
Message-ID: <Z4GnkbjAcFwqYTaK@linux.dev>
References: <20250110225310.369980-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110225310.369980-2-thorsten.blum@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_150501_622255_1019B3C2 
X-CRM114-Status: UNSURE (   6.18  )
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

On Fri, Jan 10, 2025 at 11:53:09PM +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

