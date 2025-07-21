Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A6EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6yVoIizskpBbKdog3ktrLxGca0R5J425gZKVF8sBm8=; b=2hsWPvW0miR1elH+mYK6aD8JgU
	w5OZXJh+dFVp77AQmyT7vQwoz4vtnApxHjAdd5qC22qlz/jYatR/i9MaDCm4zZl4fqG3BXC9VBvls
	t8tpjMfTwT6eV7O5q9oIomMVn2MtIuWPsr0XatfAmmGdh4efJr7AIYEaBgB+mgwL9bdg5sNJP7wxB
	/Su7zTTAXr8GByMZsktKJjuKaaBmyxO4Xze3nSjBW//eh+ehTNdbwT2O1mfMmRgIUbL9krLnzGoG6
	v8fMrhP/qaH/rR9/Gk4PDYP5XNDU1I6JxMB+6y7B4bQg1DgMVQLbIV6YT1IFRpthsuUR76wjZV259
	Prw0ho8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqpK-0000000HQ4k-0ISq;
	Mon, 21 Jul 2025 13:45:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpiO-0000000HGUC-0yNH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:33:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753101234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6yVoIizskpBbKdog3ktrLxGca0R5J425gZKVF8sBm8=;
	b=IGrVnxTD8rlPq9w7ZeRW/vWc7CBMW70oLdCbdoj1kYWum5grCaHH9vydEnU0j9xLKF0/FZ
	8uueTOFOLuR0SttwrkGKd4wLDv/zNojrFPQ1lsZgiDfnLRFLat6MPO4YdCbzEqMNrh4ysi
	/qZ4pTHtDRdf+C5ABBBa0XageppUr6M=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-lsDY9m-DMzyRevcE2smU0A-1; Mon,
 21 Jul 2025 08:32:15 -0400
X-MC-Unique: lsDY9m-DMzyRevcE2smU0A-1
X-Mimecast-MFC-AGG-ID: lsDY9m-DMzyRevcE2smU0A_1753101133
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20FBC19560BB;
	Mon, 21 Jul 2025 12:32:13 +0000 (UTC)
Received: from localhost (pixel-6a.str.redhat.com [10.33.192.205])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B51D30001BC;
	Mon, 21 Jul 2025 12:32:11 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Zenghui
 Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>
Subject: Re: [PATCH 6/7] KVM: arm64: Expose FEAT_RASv1p1 in a canonical manner
In-Reply-To: <20250721101955.535159-7-maz@kernel.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250721101955.535159-1-maz@kernel.org>
 <20250721101955.535159-7-maz@kernel.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 21 Jul 2025 14:32:08 +0200
Message-ID: <87seip67xz.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_053356_390709_F5307C63 
X-CRM114-Status: GOOD (  17.13  )
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

On Mon, Jul 21 2025, Marc Zyngier <maz@kernel.org> wrote:

> If we have RASv1p1 on the host, advertise it to the guest in the
> "canonical way", by setting ID_AA64PFR0_EL1 to V1P1, rather than
> the convoluted RAS+RAS_frac method.

Don't the two methods have slightly different semantics with RAS == V1P1
possibly implying FEAT_DoubleFault, and RAS+RAS_frac not?

>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/sys_regs.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 9fb2812106cb0..549766d7abca8 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1800,6 +1800,15 @@ static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>  	if (!vcpu_has_sve(vcpu))
>  		val &= ~ID_AA64PFR0_EL1_SVE_MASK;
>  
> +	/*
> +	 * Describe RASv1p1 in a canonical way -- ID_AA64PFR1_EL1.RAS_frac
> +	 * is cleared separately.
> +	 */
> +	if (cpus_have_final_cap(ARM64_HAS_RASV1P1_EXTN)) {
> +		val &= ~ID_AA64PFR0_EL1_RAS;
> +		val |= SYS_FIELD_PREP_ENUM(ID_AA64PFR0_EL1, RAS, V1P1);
> +	}
> +
>  	/*
>  	 * The default is to expose CSV2 == 1 if the HW isn't affected.
>  	 * Although this is a per-CPU feature, we make it global because
> -- 
> 2.39.2


