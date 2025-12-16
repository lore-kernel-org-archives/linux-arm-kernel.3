Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F46D64060
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 22:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+K9oHXy9CoE2Iutxvsb9f32gwPILUiKga23gHX+m8Es=; b=i3vThsI5GO5Do8b3EyM3EjYYvZ
	eZZtG4ukTBPKqHsxRy7NlIaoaqpWMuD7W6Ma2tH75SaIjSCYCplDvDiYIbBWfvqFETGRGdn+l0JaA
	I5p1WladWVYg6heIIJNuDjteObD1smJ31q004w1QbsmSUdhlfQnImHTSF51AawE4QX75Dc7dENIaB
	A4J50SVA+Byx3CL12yhJHfrZqw7lY0cOqrQx3OpoTrp4qTF8h1h/u0xW+1JlK/q/a3vcsuvqxfDog
	DWNC3COYGhChic73fUxTxkrMJSYL5w1eCV2aKiJFyPvE/EpsEMvFsC1dvYNuimoKs1XBeNdkrR2qN
	PMbaICxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVe0C-00000005vGT-1D0u;
	Tue, 16 Dec 2025 22:58:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVe0A-00000005vFS-0aqe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 22:58:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so11135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 14:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765925920; x=1766530720; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+K9oHXy9CoE2Iutxvsb9f32gwPILUiKga23gHX+m8Es=;
        b=wppLgqtACPAw6fRUqdO2Z5sSt8S2svpbqJF0rdmCGxUfipaK2MeuIYIXX80zvmIaLA
         QFr9Q95TgLlbbXzFdnwUe5XjQw9RPx2pO/vxg97h+LbB1PWmwH0n3ZvTlex7VYWF+rH/
         RRfI0aG17wkfhPwJeOnCCMOAk25kd2fxvmSnOc2+NZX9O5tIE1hTfV2JD67chlfRZBJO
         5bHGqYQ1sHVH1IeOTH+hD8NDyAWBukQpPxkYbNLdWi2eVC3INYdTSu4N1e7KG167HQQj
         kHl+fi9nvW+FomJKoK3HJsdQqTnthjfngNmNqDnZmanvsIh9vDiM30XgFdOcwYjuaueO
         kOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765925920; x=1766530720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+K9oHXy9CoE2Iutxvsb9f32gwPILUiKga23gHX+m8Es=;
        b=RNYTp39jSGODpF3W+h2lSEDq3GRx59qFxmEYMuYrvK5HucdL0/u93Ucn8Sqi50vpTg
         y1bQA5qD65GEexEDrzQPDTlfLWDhFgDtZw6+OAHFNzNav2pfUmd0qD+mvqJdBIPAzW/r
         QGiGNXIQXSVywPi71GzULk6YVr6u2S0Tqf/+fgy6bta0Lf1YKs6GvVY99QkMZqFmypB1
         LSx3mPcCxKKQLpW/9rqI/IPiFLAjkaM8hsna5OkvPvSZ1LQtwLPv+80axLGFC/ODfWYU
         B8bgytOntdFEa+TkePJzQvvTmg5dO0lP0ezT0S/pby3fkA0hZRd5ePAN2VjxyL1bi7VX
         +mVg==
X-Forwarded-Encrypted: i=1; AJvYcCV6FZpTOLLoB7wUiw/EV1r1Swbs8rNgA/VppyiumA//33Ai0lkyEIXCC9dW5NVohEl3jkt56e+6Kyx8vPFufVXa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7TJUOctjOaQVtlrGn2H2aug4LFCW1zY97CdQfjN80E7o7QS6X
	M3CJhSZ4winmLQpella7WSHGPn9JmXXlBy3LpP86eCgnAzJhUOaYH/t3+CKQNSEjtg==
X-Gm-Gg: AY/fxX5YYj9stS1oLsqM0D+DDbmzb1mRA1F8OOCynTmYIaYX8v+qHhk3s+ihp2XihfW
	Vws2iZD2xNeUUTzkT6eziqm2+GGhu0uLieLkEwZwpERZsuqDV92kAwn9IPCQ12idoDgvzavb1AI
	lRDPJvw8H0sOKlND7zdZ0eO8CNBze0eeRkrRAIvQMJ/Hu1W29Uhl6CzdNl8wTaffEGtZdbCe88k
	eN21sLTUBEmF3XdAeQxCK1KkvWApfa9/07N6wgSKQkIW4c9c8szYjyYqX58qgD8fLZhaMh0PHK/
	gFCyYIVRZP1k6X8ebICPMvkY66/KbdkDngxTCz9L1H4k4mMRnEn5EBWl2ZgI+AXkuxaGpf4nM44
	Jt5hZouTrSe1BLs4nbDM3kuT5/tmNIBGJURwdd4nGdr1g2LXq5KFJr82oKlUy4N0uld4qg43btS
	OWjcyBbMcvAYOntlZPEJR35QJ9AHhCegNVXhTLJrNKVEeKA65gVWkJ
X-Google-Smtp-Source: AGHT+IFlMVBkDaS1E2qi3AffURSPog2nfcOnVrpcf8Ei/2t/IInwUKpWIeZ4ineTv2meyteT01GDwQ==
X-Received: by 2002:a05:600c:58c6:b0:477:b358:c0cc with SMTP id 5b1f17b1804b1-47bdd2be429mr49955e9.17.1765925919932;
        Tue, 16 Dec 2025 14:58:39 -0800 (PST)
Received: from google.com (170.226.195.35.bc.googleusercontent.com. [35.195.226.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1edd26sm10841175e9.13.2025.12.16.14.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 14:58:38 -0800 (PST)
Date: Tue, 16 Dec 2025 22:58:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, skolothumtho@nvidia.com,
	praan@google.com, xueshuai@linux.alibaba.com
Subject: Re: [PATCH rc v3 1/4] iommu/arm-smmu-v3: Add ignored bits to fix STE
 update sequence
Message-ID: <aUHkGCEeu7L5uCMR@google.com>
References: <cover.1765334526.git.nicolinc@nvidia.com>
 <cc0d4ab571e2e789ee1cddfa035379dc54f0601b.1765334526.git.nicolinc@nvidia.com>
 <aT87A1ur4htPjM5T@google.com>
 <20251216000952.GA6079@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251216000952.GA6079@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_145842_221733_54E1DFC0 
X-CRM114-Status: GOOD (  46.22  )
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

On Mon, Dec 15, 2025 at 08:09:52PM -0400, Jason Gunthorpe wrote:
> On Sun, Dec 14, 2025 at 10:32:35PM +0000, Mostafa Saleh wrote:
> > >   * Figure out if we can do a hitless update of entry to become target. Returns a
> > >   * bit mask where 1 indicates that qword needs to be set disruptively.
> > > @@ -1094,13 +1100,22 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
> > >  {
> > >  	__le64 target_used[NUM_ENTRY_QWORDS] = {};
> > >  	__le64 cur_used[NUM_ENTRY_QWORDS] = {};
> > > +	__le64 ignored[NUM_ENTRY_QWORDS] = {};
> > 
> > I think we can avoid extra stack allocation for another STE, if we make
> > the function update cur_used directly, but no strong opinion.
> 
> It does more than just mask cur_used, it also adjusts ignored:
> 
> > > +		/*
> > > +		 * Ignored is only used for bits that are used by both entries,
> > > +		 * otherwise it is sequenced according to the unused entry.
> > > +		 */
> > > +		ignored[i] &= target_used[i] & cur_used[i];
> 
> Which also explains this:

I haven't tested that, but I was thinking about (applies on top of the patches)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 72ba41591fdb..9981eefcf0da 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1083,7 +1083,7 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_used);

 VISIBLE_IF_KUNIT
-void arm_smmu_get_ste_ignored(__le64 *ignored_bits)
+void arm_smmu_get_ste_ignored(__le64 *used)
 {
 	/*
 	 * MEV does not meaningfully impact the operation of the HW, it only
@@ -1093,17 +1093,14 @@ void arm_smmu_get_ste_ignored(__le64 *ignored_bits)
 	 *
 	 *  Note: Software must expect, and be able to deal with, coalesced
 	 *  fault records even when MEV == 0.
-	 */
-	ignored_bits[1] |= cpu_to_le64(STRTAB_STE_1_MEV);
-
-	/*
+	 *
 	 * EATS is used to reject and control the ATS behavior of the device. If
 	 * we are changing it away from 0 then we already trust the device to
 	 * use ATS properly and we have sequenced the device's ATS enable in PCI
 	 * config space to prevent it from issuing ATS while we are changing
 	 * EATS.
 	 */
-	ignored_bits[1] |= cpu_to_le64(STRTAB_STE_1_EATS);
+	used[1] &= ~cpu_to_le64(STRTAB_STE_1_EATS | STRTAB_STE_1_MEV);
 }
 EXPORT_SYMBOL_IF_KUNIT(arm_smmu_get_ste_ignored);

@@ -1119,22 +1116,15 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
 {
 	__le64 target_used[NUM_ENTRY_QWORDS] = {};
 	__le64 cur_used[NUM_ENTRY_QWORDS] = {};
-	__le64 ignored[NUM_ENTRY_QWORDS] = {};
 	u8 used_qword_diff = 0;
 	unsigned int i;

 	writer->ops->get_used(entry, cur_used);
 	writer->ops->get_used(target, target_used);
-	if (writer->ops->get_ignored)
-		writer->ops->get_ignored(ignored);
+	if (writer->ops->filter_ignored)
+		writer->ops->filter_ignored(cur_used);

 	for (i = 0; i != NUM_ENTRY_QWORDS; i++) {
-		/*
-		 * Ignored is only used for bits that are used by both entries,
-		 * otherwise it is sequenced according to the unused entry.
-		 */
-		ignored[i] &= target_used[i] & cur_used[i];
-
 		/*
 		 * Check that masks are up to date, the make functions are not
 		 * allowed to set a bit to 1 if the used function doesn't say it
@@ -1142,8 +1132,6 @@ static u8 arm_smmu_entry_qword_diff(struct arm_smmu_entry_writer *writer,
 		 */
 		WARN_ON_ONCE(target[i] & ~target_used[i]);

-		/* Bits can change because they are not currently being used */
-		cur_used[i] &= ~ignored[i];
 		unused_update[i] = (entry[i] & cur_used[i]) |
 				   (target[i] & ~cur_used[i]);
 		/*
@@ -1575,7 +1563,7 @@ static void arm_smmu_ste_writer_sync_entry(struct arm_smmu_entry_writer *writer)
 static const struct arm_smmu_entry_writer_ops arm_smmu_ste_writer_ops = {
 	.sync = arm_smmu_ste_writer_sync_entry,
 	.get_used = arm_smmu_get_ste_used,
-	.get_ignored = arm_smmu_get_ste_ignored,
+	.filter_ignored = arm_smmu_get_ste_ignored,
 };

 static void arm_smmu_write_ste(struct arm_smmu_master *master, u32 sid,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index d5f0e5407b9f..97b995974049 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -900,7 +900,7 @@ struct arm_smmu_entry_writer {

 struct arm_smmu_entry_writer_ops {
 	void (*get_used)(const __le64 *entry, __le64 *used);
-	void (*get_ignored)(__le64 *ignored_bits);
+	void (*filter_ignored)(__le64 *used);
 	void (*sync)(struct arm_smmu_entry_writer *writer);
 };


And we only clear the bits from cur_used, there is no need to for the
other mask ignored (ignored[i] &= target_used[i] & cur_used[i])
- If an ignored bit is not in cur_used it will not impact
  "cur_used[i] &= ~ignored[i]" as it must be already zero
- If an ignored bit is not in target_used, it doesn't really matter,
  we can ignore it anyway, as it is safe to do so.

Anyway, I am not fixated on that though, extra 64B on the stack is not that bad.

> 
> > I have some mixed feelings about this, having get_used(), then get_ignored()
> > with the same bits set seems confusing to me, specially the get_ignored()
> > loops back to update cur_used, which is set from get_used()
> 
> The same bits are set because of the above - we need to know what the
> actual used bits are to decide if we need to rely on the ignored rule
> to do the update.
>  
> > My initial though was just to remove this bit from get_used() + some changes
> > to checks setting bits that are not used would be enough, and the semantics
> > of get_used() can be something as:
> > “Return bits used by the updated translation regime that MUST be observed
> > atomically” and in that case we can ignore things as MEV as it doesn’t
> > impact the translation.
> 
> Aside from the above this would cause problems with the validation
> assertions, so it is not a great idea.

Yes, that's why I didn't like this, it had to hack the validation logic.

Thanks,
Mostafa

> 
> > However, this approach makes it a bit explicit which bits are ignored, if we
> > keep this logic, I think changing the name of get_ignored() might help, to
> > something as "get_allowed_break()" or "get_update_safe()"?
> 
> update_safe sounds good to me
> 
> Jason

