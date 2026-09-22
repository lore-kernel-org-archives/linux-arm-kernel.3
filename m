Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25BDC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXSrQeMyHW+MKEBO/LMvcq3vJUhSUVerpVL28o1KObI=; b=oqWYIjH38mqchrBZyBmnVygyw2
	+RB+KvJaaLB02F5J9Fzhmia+Smhu5LUj4SljJGLwmsMpMQHEG+wJq5WDS0nQxnqMujoIP46K1sCHw
	HiIVMaYEpA5+O4xog/4bazeCgw5uf8zc+C5T5h/slo/ku+oJ+S5CbdLkV13HuIsU5xyEkbDPptFPa
	Wn+mTLmFusU+WYGI4Q3SZqcCLKuutgrry7IAxwUYxznwKfLZPTm4airR4+VAticKVOUQ3Iaql0EMm
	uWMEEmnfLPOQTJ92ifTh70a9J5h4jmWB6nh/DXV6uSQ4mRSYhzXrsKKhRBBmCTMisHrBON+g60Kve
	4+qtxv8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yUl-000000059lX-3gFf;
	Tue, 22 Sep 2026 11:17:07 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yUc-000000059je-0Hf0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 11:16:59 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49e6683d48fso40716155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790075815; x=1790680615; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXSrQeMyHW+MKEBO/LMvcq3vJUhSUVerpVL28o1KObI=;
        b=P2P2GWtH0UU75e9tLAVB1Lhji+Ft2izBBN3dCeWPKWBudk8ra8pw+x5K7iU4td6UND
         bjBLGDbVY+HrIsYu5Eez4eyziMI7UDZhWhGgNTw1EXcMKOmwQAnL11OwXIN4E8L5bxn/
         buN3eAJk3KchurTgmflumsh8Uzx774liLgazwios8Ckty3Un3Cl7lpq58N7rx/87fZFQ
         WWwr46its0HOX905obb5uYNsushXl795nVcqINNOZDY4NVX7IU1XAGDqIW8pta34L+cf
         mB5DBCmvnvAHkT/YOK70WMhuSAPkxj0HPJ2iS1dSEufL8h1Ve9rQnjeLIf2J/S6MAZxf
         RbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790075815; x=1790680615;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cXSrQeMyHW+MKEBO/LMvcq3vJUhSUVerpVL28o1KObI=;
        b=tIXroVUjrw4azzkhI6GpTHhu5l14jwq+EA3wReYG6NDO2x2/3QosG910UKlnt+QH0G
         ikPG4hXOH2yl5B9DBxm/WZUVCYSeH5w7SP8WIPxzw/p7hjOXJeHJHBSMRIWTRkgGViLB
         2lialaSWb8e121xXdMn3hNmQC16dDpGW4nXIMUEbgYp8fZW8AYe/AGlJQtUjVVAneLWQ
         PuoJf0q2LK2fReRdqasl+QdpBC7zuxrNVNrqLR/3CwODBiuexr13d1uRPIpr5AvKKDIo
         hOXseTd4DxFHt9ufAsKSz5MxN2sHcRPnXw+SD1FyEQFxoCj1poYfC+YizuMbQOYk2IsC
         XgwA==
X-Forwarded-Encrypted: i=1; AKwUvBySSi1WDJwco9vIc//bAPd1tVQ3Uid2iWh4w93BnIgzhlBRvwtPTbFNby5uxbgZyFba7e+r0sCI+d3UXXMka9HR@lists.infradead.org
X-Gm-Message-State: AFuF++nSHG4680zAEm2D+CLFq6sA6wKFhARkygGRr31c74Ah76s1zybl
	SDwb48uKFu0UjeWR2oi2SibgTRUtQVXrq8BdpQEUROqFN04gziciiByO1Uks5BNX6qLfopDdmjP
	Wg8uZRzSH98XBxki/ONImTTOzuQ==
X-Received: from wmbju2.prod.google.com ([2002:a05:600c:56c2:b0:499:b2d6:1572])
 (user=snehalreddy job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c1a:b0:49d:1de5:ce0a with SMTP id 5b1f17b1804b1-49fc56d4238mr237637205e9.13.1790075815186;
 Tue, 22 Sep 2026 04:16:55 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:16:54 +0000
In-Reply-To: <arJTf9C-dr3eMnsW@google.com>
Mime-Version: 1.0
References: <arJTf9C-dr3eMnsW@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922111654.1024808-1-snehalreddy@google.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Support FFA_FN64_MEM_RECLAIM2 in host handler
From: Snehal Koukuntla <snehalreddy@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Sebastian Ene <sebastianene@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Snehal Koukuntla <snehalreddy@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_041658_126569_ACD60598 
X-CRM114-Status: GOOD (  15.34  )
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

Hi Vincent,

On Tue, Sep 22, 2026 at 10:07:27AM +0000, Vincent Donnefort wrote:
> > +	if (ffa_check_unused_args_sbz(ctxt, 6) || (flags & ~1ULL) || (x4 >> 32)) {
> 
> nit: (flags > 1) ?

Ack, will update in v2.

> > +	if (offset % desc_size != 0) {
> 
> nit: 
> 
> if (offset % desc_size) is enough

Ack.

> > +	if (offset >= (u64)req_desc_cnt * desc_size) {
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> 
> Not sure I understand what Sashiko means here offset can not be bigger than the
> number of constituents we have...
> 
> > +
> > +	hyp_spin_lock(&host_buffers.lock);
> > +	if (!host_buffers.tx) {
> > +		ret = FFA_RET_INVALID_PARAMETERS;
> > +		goto out_unlock;
> > +	}
> > +
> > +	memcpy(hyp_buffers.tx, host_buffers.tx, (u64)req_desc_cnt * desc_size);
> 
> Either I or Sashiko is confused here. The invocation will not do more than
> req_desc_cnt will it?

Agreed. Per [S0039] and [S0047] in the spec, req_desc_cnt is the total
count of constituent descriptors in the TX buffer array starting at
offset 0, and offset indexes into that array so callers can advance
offset on subsequent invocations without repopulating the array.

> > +
> > +	range = (void *)hyp_buffers.tx + offset;
> > +	if (page_index >= range->pg_cnt) {
> > +		ret = FFA_RET_INVALID_PARAMETERS;
> > +		goto out_unlock;
> > +	}
> 
> Should we also verify total_pages here?

Good catch. I will add a check in v2 to verify that the sum of pg_cnt
across the constituent descriptors matches total_pages (without
overflowing) before forwarding the call.

Thanks,
Snehal

