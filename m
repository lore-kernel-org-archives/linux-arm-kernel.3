Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD005C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 20:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1/4TQCQv4x02z/PLYtJPpvADBvf6W/GQerzpdxNkZY=; b=UM+RiSMYKRRjcIn7/4r7kxgGmd
	6aa6l0z5098v85VCAZQLt6Smeim8lKREpncGzluMMeLebVDuF6xmcE37VPyHHp1iA5oY8Js3lRnGF
	uliuz9tG0NZjV0jUcXoL2sfijCqOx1IcqfDpTmCRa/xVnmyQlajZQLdDIjUi3QLTs8xM7OaOT6TZF
	Le44a51s6XmQjC1CRAIt7FzPnD5KZw7sKjOQ+I7cc+3NlrM1CQw7qE9fzxwg1HL8L8e7+1addUJff
	NI8b/LeT+4MxUhRzNN++BAkbg7zx+eJD+JIoUOsnnaRw50/Km2MfYt0F8SbMFXeDqkkYV9k9p9LpV
	UC5RojwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNyX-00000005RJa-0JXs;
	Thu, 02 Jul 2026 20:25:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfNyU-00000005RJA-21WA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 20:25:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c81db32393so256285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783023929; x=1783628729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D1/4TQCQv4x02z/PLYtJPpvADBvf6W/GQerzpdxNkZY=;
        b=sG7pAPfi1inKqkixHs54fpRWf+uqbf4ZrSbubMPfePfs9IDoTW198v3tjvmdVRAqRC
         ZOY7YmGCAb6GT5MXbYB6ROwHQrT1e0+RG8Cfym8DaxLpKcBgPUtY+K77/gBZXsOQ2Yo+
         1J0xdhQn5LnDenqYNw8qHRqGwOUY1natYGdcdEsrFQKi7j7+D+WXZK9e7Yt5ZUNumby0
         zbtFO7P8dTPBe7jt9IKwymDPnjuizFJ6z6cgEg4SU9D0QMZ4zsCw9b3UkELiAyOKI4vR
         vy23DwNjokOa+zWNtZFMi7EDPiUISneQ1o2kKufDniD4qYajUPUeZcsmQwri+WIlYLDA
         lFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783023929; x=1783628729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1/4TQCQv4x02z/PLYtJPpvADBvf6W/GQerzpdxNkZY=;
        b=fSH4POPXBXlhnMxeg4pizc6NbKnNDJFJmt1nq9NgVdhCHm03xa8nbdtZ9PAB2Vuo1H
         UdXG+Nz7Hl4OR1FDDxMcGYLnBBM99Q/W6i2HHIvQN2rx2OLVlch2l6RLJb13D/1XqH1f
         LNQ7a8E5TGC2bFjpr057YM6V+YXlvp20CiiDKp454IBisDWmE6NRmPTmOoyLySXES7kv
         z5CGu+niDG+CJxD1+26P5uCovFBZtBwp57WoJVUsMkg8cz9vqWWaH4jDO5Ljo3tB/GQU
         eFZ9cSP9KDbXiqEcXIUeWeiwrcQmHbMTHj63tMy/w8HeaaoDRNRFBydZfL64cqQ7eCJd
         ibnA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3SdeYtb6fHU4k9Mnn3JCkq3jP2NPK1r1A7N5Ww6RpFNsrc5qG4KdRApx8/FcZqn8QZuL4P7VUC4vIu+4Y6OMG@lists.infradead.org
X-Gm-Message-State: AOJu0YxXs6v87+XohMtxMH5UdGn9nb1WCpMEguaXBfFjVI7vz4jF2SiL
	xERl06MqSGuUKjuwXw3teH8Mr/FHykF2CR1js2puoY8b9NzWvQwcirvSQVjhnw8ZLQ==
X-Gm-Gg: AfdE7ckPXr+khQR0JLet9RrWA1Zc+ITk2rXQMkZNtxQkgg4Zn1CSTGymzZCJ3/fJpFF
	snqiVc5DJWGw/e9RzqV32/+vq6HfxeN8q8bT7ps1ibigVSM71WCX1m5T7U44hgVtSmkoSvmS5QT
	SJTnHRQ4DH1cL9LbytC6l+f306FnCDi4UV4ipcbauOlYW1qBP8itDGT1RVzMV0Fr1Xq5ihumOy3
	4BgiVpsNQI6mPYXw9qjOaGbbhEdBL5gOS4gYg1sVzlrh5ofawevk/ahRYccM0xKa2sK8zTmtHDB
	AjrbZH4Y9kE2efTfa4o/wi1YPfJnsFM10enUuG/o7BLW5sR6h3wrTw8GJ8Zy/ArOAd7eD0sUnVe
	S6aBq0EFEMNa+4/KA2jLilQfFYHZLJqTJRxZZqWNj+tCmw3FHj/aqAzHX+INHKm7F68Mbsmgmp5
	sP1n+8NwypUVcaZT/X/JtDL0dy1ARIGWlXGGmnqOl92sHsB3M=
X-Received: by 2002:a17:902:da8e:b0:2bf:1000:d3ac with SMTP id d9443c01a7336-2caa6ff1431mr2958025ad.11.1783023928961;
        Thu, 02 Jul 2026 13:25:28 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa0b7e9sm18461795ad.81.2026.07.02.13.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:25:27 -0700 (PDT)
Date: Thu, 2 Jul 2026 20:25:21 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>, Kyle McMartin <jkkm@meta.com>,
	Breno Leitao <leitao@debian.org>, Usama Arif <usama.arif@linux.dev>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
 kdump kernel
Message-ID: <akbJMT2mH7QfLwuQ@google.com>
References: <20260702112825.781750-1-kas@kernel.org>
 <akZ-KIVJlmP4LEcQ@google.com>
 <akaFcwcSHVGeT8PZ@thinkstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akaFcwcSHVGeT8PZ@thinkstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_132530_553683_60EE8E39 
X-CRM114-Status: GOOD (  20.30  )
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

On Thu, Jul 02, 2026 at 04:38:55PM +0100, Kiryl Shutsemau wrote:
> On Thu, Jul 02, 2026 at 03:05:12PM +0000, Pranjal Shrivastava wrote:
> > On Thu, Jul 02, 2026 at 12:28:25PM +0100, Kiryl Shutsemau (Meta) wrote:
> > > The command, event and PRI queues are sized from the maxima the hardware
> > 
> > A minor note here is PRI & EVT queues are disabled for the kdump kernel
> > (see arm_smmu_device_reset). We could just mention all SMMU queues are
> > sized [...] in the commit message. 
> 
> Fair enough.
> 
> Here's updated commit message (I will send v3 in few days, if no new
> feedback):
> 
> Subject: [PATCH v3] iommu/arm-smmu-v3: Shrink command/event/PRI queues in
>  kdump kernel
> 
> All SMMU queues are sized from the maxima the hardware advertises in IDR1,
> which can be several megabytes each, and are allocated at probe. The kdump
> kernel already disables the event and PRI queues (arm_smmu_device_reset()
> drops CR0_EVTQEN/CR0_PRIQEN) but still allocates them at full size. On
> systems with many SMMUv3 instances that cost is paid per instance and adds
> up to tens of megabytes of coherent DMA in the capture kernel.
> 
> A kdump capture kernel runs from a small crashkernel reservation and only
> has to drive the few devices used to save the dump, so deep queues serve
> no purpose. The queues are not on the DMA data path, so dump throughput is
> unaffected; a shallower command queue only bounds how many commands may be
> in flight before a sync, which does not matter for the capture kernel's
> small device count and modest I/O.
> 
> Clamp every queue to a single page when is_kdump_kernel() is true. Doing
> it in arm_smmu_init_one_queue() covers the command, event and PRI queues
> in one place. The command queue still holds at least one batch plus a sync
> (256 entries on a 4K-page kernel, well above CMDQ_BATCH_ENTRIES), so
> command batching keeps working.
>

Looks good. Thanks!

Praan

