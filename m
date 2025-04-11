Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE97C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahE45842u7TdL15efT6Z7ZHkp/0EW6XeVJ2l3pr4tVY=; b=2tGubPF4pzVsXoCfLGPuhQ4Zue
	cR86ZNpzDMSMnEW5ve5O2O/QTnadPe7XVMBBa/Vlis8ou4MFWbsTm5EXCaqJSuu2IIUy9rjMQiIBv
	stRY3049IH3cebY08uGBETVsj7XMMxSkbeKoj+o91S+EM5RmWRQKhs64i6D7LwKUk+Z5ByQFOntmK
	SGUgQO1NiqqBih8xVaOrzZTcWeqAR9c7u+iAgsJclxRk+oS4xPkaO5TYUAuVTAqb0Hf04GKidOhcS
	deuGH9KdEUS31j8VZGvL35uY3vC69+2+en8BIqgolJhmSrid/Ut/hn97wbNClolqdn2bEK7Ldtj+V
	mEnFA4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Eme-0000000DzRt-17Xv;
	Fri, 11 Apr 2025 13:51:04 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3EXp-0000000Dx0F-34js
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:35:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2264c9d0295so198825ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 06:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744378544; x=1744983344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ahE45842u7TdL15efT6Z7ZHkp/0EW6XeVJ2l3pr4tVY=;
        b=OQnj0UrKYxmuUycRuBH/zWLyW/26d7oxIjaQyi81uzHMs4T3Vl8ZQ27tgW9FiNmvXi
         YoMjz0MO6YHQaGYkDD0P4tdPegLCimq9FkxwOOFq/CJE0Xk3GrzZMrFWBqXnZsMlpYTD
         q4yIpCBNtAbwaJg+KFAUFnzRkwxUjDh9//Dps5qUde8ib/Ba9nYtWWkdBu3IkCPeS8z4
         FlmddNEglM7LRRZvzswtR4KyNFuWJ4eyE5yuF5g8qcxqMJTCJRd9+Up1tQCFQKeM/RgN
         GmEuIth50KfnVOByvBS5Xg7k6dq3JooA4tA/lyjHYagBF54B8yVNYP6phrTMazisHyl0
         m6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378544; x=1744983344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahE45842u7TdL15efT6Z7ZHkp/0EW6XeVJ2l3pr4tVY=;
        b=Th5VsAECV7czRk4WEosJdPR1SIjsiwRjuVzItzFZe14AFnWgtnZR7SyFajnxJPcxj5
         bA7kATcQJX/XO2NZzgrZlWt3VGWaOcQ0Muy48D4sedFxTOpW2RRdb3PZDURr5ruV4KK6
         IKOIzAEe+C6ZIQJFX9D/38Ps/TYx8xtPQShq9u1vR6W5Iwh7n1B0ufLM+hlB1CRgRKZD
         +VHVKmFeqizk2jcV2AEtZ2CM4BaSxDkskNqqpoP+MYXCoINy37DE5+u2jOBpC3QiluoC
         55RU6hKOZXyF6/74cTcExTv5lNj3kWvFC1Ma+g2gctWlU2o8niCkG5WdUtE0Qk+M38mS
         UxPw==
X-Forwarded-Encrypted: i=1; AJvYcCWCSR9WsWEZeql6v/FC2xV0vPoTMhmXCcD2G84K4vpNL1z6t3SZlTHt69xKPdFllI4NNj+o5jvG3qYhlx4NfaV2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6l6E75ITbt3ztV+Gd+3N/eFvtgR/Yr3q5Gi/gNLLOA7ezJUsx
	ObSGSTDSZx8vOxgvNOA8Zk4qWo0EsZFh0W9UcLm/zonuGbEuAoGqDh8DyaZMfw==
X-Gm-Gg: ASbGncuifcTznfHjZ5ducmWHIwYEtqjyrhxQ86eTd/2Ws4OlR8ERtI5p9cjB9mDM0Dr
	316yCE+dDwx7sRx08hXLZV4sKOxpC+fLWgsElJOH4tkQ0ILWatsjEa3/Fz11ci6a3f6HI49Pf2o
	IR5gh6HIraUlfkUlwzKT8YypEKcJpazmRcWyolEgE0p2k0uzbRuttfVHPN/xi32SHpN8VJnylV1
	hGPSrFfKJPYWsAuEa/z2shHR8eAG0HeqK1azi/xzYLMqPIIG+clVTRZn/4f7+fjaSjTrQ0spsRF
	16C2OH1veN9gsDcSJIDOP9ne+2tBdrFvbAImb9FTBAB6eQsLOzjSCLWIF3YzP3JPJfHVF+o/wCY
	=
X-Google-Smtp-Source: AGHT+IFuZy5EqTvHAoVOBfr4Fk23t7EUqNIlbLfmzgyWRo1kRCsj3C5cAT42IIfvlQGQQk8a2X+0UQ==
X-Received: by 2002:a17:903:1b65:b0:216:2839:145 with SMTP id d9443c01a7336-22bea8acbadmr2351335ad.1.1744378543195;
        Fri, 11 Apr 2025 06:35:43 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198be9sm1459659b3a.9.2025.04.11.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:35:42 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:35:34 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>,
	will@kernel.org, joro@8bytes.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow stream table to have nodes with
 the same ID
Message-ID: <Z_kaprkADtmMLyiH@google.com>
References: <20250411044706.356395-1-nicolinc@nvidia.com>
 <b62f5ea3-99cd-4e9e-a2a8-cb325308ed34@arm.com>
 <20250411130155.GD8423@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411130155.GD8423@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_063545_781445_AA59914C 
X-CRM114-Status: GOOD (  43.66  )
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

On Fri, Apr 11, 2025 at 10:01:55AM -0300, Jason Gunthorpe wrote:
> On Fri, Apr 11, 2025 at 01:10:29PM +0100, Robin Murphy wrote:
> 
> > This is adding support for StreamID aliasing between devices, and as such it
> > is incomplete. It's not OK to just allow devices to arbitrarily rewrite each
> > other's STEs,
> 
> Okay, yes, we should be checking the iommu_group before permitting two
> devices to share the STE. That is an easy fix, see below
> 
> > Aliases can only be permitted within a group, which means
> > arm_smmu_device_group() also has to check and account for them in the first
> > place - note that that applies to PCI devices as well, because as
> > soon as we
> 
> On this system the alias come from the PCI DMA alias support and
> pci_device_group() is already correctly grouping things.
> 
> Aliases from other places, like the IORT, never did work..
> 
> > allow StreamID aliasing at all then we're inherently allowing RID->SID
> > mappings to alias outside the PCI hierarchy in ways that pci_device_group()
> > can't know about. It should work out basically the same as SMMUv2, just with
> > the streams tree in place of the S2CR array.
> 
> You mean the logic in v2's arm_smmu_device_group() to consult the
> stream map to select the group if the IORT is creating aliases? Yes it
> could be done..
> 
> However, this is a significant regression fix and I think we can be
> confident there are no IORT tables in the wild that have aliases or
> they would already be broken.
> 
> How about we add the missing validation that the group is the same,
> that is easy to do and should be there anyhow:
> 
> static int arm_smmu_streams_cmp_node(struct rb_node *lhs,
> 				     const struct rb_node *rhs)
> {
> 	struct arm_smmu_stream *stream_lhs =
> 		&rb_entry(lhs, struct arm_smmu_stream, node);
> 	struct arm_smmu_stream *stream_rhs =
> 		rb_entry(rhs, struct arm_smmu_stream, node);
> 
> 	if (stream_lhs->id < stream_rhs->id)
> 		return -1;
> 	if (stream_lhs->id > stream_rhs->id)
> 		return 1;
> 
> 	/*
> 	 * The stream table can have multiple nodes with the same ID if there
> 	 * are DMA aliases. If multiple masters share the same iommu group then
> 	 * they can use the overlapping STEs within the group.
> 	 */
> 	if (stream_lhs->master->dev->iommu_group ==
> 	    stream_rhs->master->dev->iommu_group) {
> 		if (stream_lhs < stream_rhs)
> 			return -1;
> 		if (stream_lhs > stream_rhs)
> 			return 1;
> 	}
> 	return 0;
> }
> 
> That change will narrow this patch to only enable PCI DMA aliases that
> already generate the correct iommu groupings. Other sources of alising
> that don't generate the right groupings will continue to fail as they
> do today.
> 

Isn't the device grouped *after* the ops->probe_device call? I see that
the dev->iommu_group is assigned the ops->probe_device call in
iommu_init_device.. so I guess this would still fail?

Thanks,
Praan

> Then I propose continuing to wait for a user before adding support for
> more alias scenarios to arm_smmu_device_group()?
> 
> > > +	/*
> > > +	 * If there are DMA alises then there are multiple devices with the same
> > > +	 * stream ID and we cannot reliably convert from SID to master.
> > > +	 */
> > > +	if (node->rb_left &&
> > > +	    rb_entry(node->rb_left, struct arm_smmu_stream, node)->id == sid)
> > > +		return NULL;
> > > +	if (node->rb_right &&
> > > +	    rb_entry(node->rb_right, struct arm_smmu_stream, node)->id == sid)
> > > +		return NULL;
> > 
> > This doesn't really work - the whole mechanism needs to fundamentally change
> > to mapping StreamIDs to groups rather than to devices. Then it's really up
> > to individual callers what they want to do if the group has more than one
> > device.
> 
> There are only two callers. One is using it to print the log message,
> in this case it will fall back to the unknown stream ID path and still
> print a log message. This could perhaps print the group ID # instead
> of the raw stream ID but I wouldn't do that in a regression fix rc
> patch.
> 
> The other is doing stall/future PRI, and I don't think we should be
> doing iommu_group based fault reporting at all. Returning NULL
> effectively disables it.
> 
> Jason

