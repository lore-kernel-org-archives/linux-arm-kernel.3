Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A491CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOPk9lUKmu3dyT3km0TD9pgYxeOvFnYVbbb0LRmiqBQ=; b=yCIGWTSOohFajeTpvozlh9XwB4
	LtToGx2cv/EVsPcXM5EvO0eTcnOr8fJLJc8zPRm4W83LxuSR6zdKziuuElOjwS4ZT6c+I3KE/5ETO
	VZEeZSS6XU9l9OGjfbNDCTO70/Eq5U15oEGK/VoMMuyXfmjgIapiO77tarYqzZrTRkwKzz26yY/2O
	8rpSTGnFUZF5v79lThX+8ra2MRegoaL52Rru6lOD5UArwzsK7YdXvkmFTlY0t8fiz9BUpmAZngZ4w
	uYdSRtLXFcYijnRM6BXnTXOpFmn2NOeueN3/f6vJ9Y+3GOFOiv3+9b19y4xCu0Bey/6KX2JNMlKVP
	XrGpVduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtwC-0000000Ewi4-0wZ2;
	Mon, 18 May 2026 09:07:00 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtw9-0000000Ewh9-2uTV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 09:06:59 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2baedd2fd43so15354075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 02:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779095216; x=1779700016; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOPk9lUKmu3dyT3km0TD9pgYxeOvFnYVbbb0LRmiqBQ=;
        b=Dae+Bp9cdUvWI6ntZCiUSMzyuGbC1oC8IWDPksbrmZ+Evn/6K8evUEKrnda+kFIlDf
         87AddD4SCbkNzYsM7LdewSxFsxFeDSiGPW3in+qrnALzYWMVLqOAu81xv/MfwVyyh/9p
         FRTwMkZJCouO0bTk+qgIfcsE6E9A8C83GO1s1eD+9acIFJNy/GQ+Vm7hUKUfd8sstNjv
         vxlXUCs2UNABVuvE0YuRUKDIoaYX26Tgw64wBwdkbbTY97fKOJ2J5S6fElr+dCpY61vX
         uS4VPW1hBNycYAvDBNFyNSETY3nRApQD28gyxDjgCQFTHnehKxcsrLAQIuiHYKZ648pv
         vdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095216; x=1779700016;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOPk9lUKmu3dyT3km0TD9pgYxeOvFnYVbbb0LRmiqBQ=;
        b=IO7mezBqxfoXJlYOq8vajNQtmI/bJ0d2WsEILI2QkPj9eSRURZoYsFDagXpg3x110F
         j1RrSsNN4QlKFCXiu62ZQONUbyW2UBHDvhGdno4Mv8wwkqJ+xIClK4LaUnIpB/2s5ohI
         RwupoiNvATObH3m2u6mA7Q7JKTPXiXqJZ7hGPpTI3gPnLKKcr8CGZopHe4mV3M8Dcfxb
         sxerUoWraz8YEYxzBtfAsEGCjY+qkwWW4sJeyHNKxuHWxd2PRBAFWqptDwxAHnnukCce
         piOj+fZKgEdzivoVAcbzxe2GLFs4AtcOpBIgjHpAMH8X7/3XCXfZAkEWkeORvbjkk1dw
         ms+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/AgPYfu2J7/ftrjd3c6aXR2TGheTfSEQgPkDZM/GWRxmltgc66c1ylS0nqCVrAGU+E9aS3969qMWXADaqNIxF8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0P7YV/9q4sKxBI6jWikDEE3YNVVQl3OQLtMb2nVZxZLDXfjAP
	JxBOuVHSxtqPtKiybVvIxHIzMJ/huuDDfzSKeWwVcjPUe7nb3TKyBUc0vAFA+HU06N1fsbXnVSG
	B9nddoW1SWS/S/T9Q5ewbE3spYg==
X-Received: from plbv16.prod.google.com ([2002:a17:903:44d0:b0:2b2:488e:b71])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:384c:b0:2bc:6d46:ae9d with SMTP id d9443c01a7336-2bd7e8ca92cmr152641245ad.17.1779095215808;
 Mon, 18 May 2026 02:06:55 -0700 (PDT)
Date: Mon, 18 May 2026 09:06:54 +0000
In-Reply-To: <20260515231808.GQ7702@ziepe.ca>
Mime-Version: 1.0
References: <20260515231808.GQ7702@ziepe.ca>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260518090654.730478-1-joonwonkang@google.com>
Subject: Re: [PATCH] iommu: Allow device driver to use its own PASID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca, kirill.shutemov@linux.intel.com
Cc: Alexander.Grest@microsoft.com, alexander.shishkin@linux.intel.com, 
	amhetre@nvidia.com, baolu.lu@linux.intel.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	hpa@zytor.com, iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, 
	joonwonkang@google.com, joro@8bytes.org, jpb@kernel.org, kas@kernel.org, 
	kees@kernel.org, kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, nicolinc@nvidia.com, 
	peterz@infradead.org, praan@google.com, robin.murphy@arm.com, 
	ryasuoka@redhat.com, smostafa@google.com, sohil.mehta@intel.com, 
	tglx@kernel.org, will@kernel.org, x86@kernel.org, xin@zytor.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_020657_762216_50B02129 
X-CRM114-Status: GOOD (  28.17  )
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

> On Fri, May 15, 2026 at 09:46:05AM +0000, Joonwon Kang wrote:
> > diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> > index 0ca3912ecb7f..61e2e52105e5 100644
> > --- a/arch/x86/kernel/traps.c
> > +++ b/arch/x86/kernel/traps.c
> > @@ -864,6 +864,8 @@ static bool try_fixup_enqcmd_gp(void)
> >  		return false;
> >  
> >  	pasid = mm_get_enqcmd_pasid(current->mm);
> > +	if (pasid == IOMMU_PASID_INVALID)
> > +		return false;
> 
> If you do this then probably you should get rid of mm_valid_pasid(),
> mm_get_enqcmd_pasid() already has the NULL check so the two functions
> are kind of pointless.
> 
> You also missed the other place calling mm_valid_pasid() that should
> really be sensitive to this as well:
> 
> static int prctl_enable_tagged_addr(struct mm_struct *mm, unsigned long nr_bits)
> {
> [..]
>         if (mm_valid_pasid(mm) &&
>             !test_bit(MM_CONTEXT_FORCE_TAGGED_SVA, &mm->context.flags))
>                 return -EINVAL;
> 
> Make that removal a prep patch
> 

Thanks for pointing this out. I think mm_valid_pasid() is to check if SVA
is currently in action while mm_get_enqcmd_pasid() is to get the PASID for
"ENQCMD instruction execution". What prctl_enable_tagged_addr()
semantically requires here seems to be only checking if SVA is activated
or not regardless of whether EL0 can execute ENQCMD instruction; the
function wants to return error if SVA has been activated when LAM is to be
activated as they are mutually exclusive [1]. So, I think we should leave
it as-is. I am adding the author Kiryl as a reviewer for confirmation.

Since it is now possible with this patch to activate SVA without involving
EL0(for ENQCMD-like instructions), callers should be able to distinguish
between if SVA is activated and if EL0 can execute ENQCMD-like
instructions in addition to the SVA activation. mm_valid_pasid() is for
the former and mm_get_enqcmd_pasid() is for the latter. So, I think there
will be loss if we make the latter API serve for the former.

Or, I guess we could rename mm_valid_pasid() to be more specific like
mm_sva_activated() or mm_sva_in_use(). What do you think?

> I didn't try to check the rest closely but the approach looked sane to
> me

Thanks. Sashiko reported valid points [2] and I will handle them in the
meantime.

[1] https://lore.kernel.org/all/20230312112612.31869-12-kirill.shutemov@linux.intel.com/
[2] https://sashiko.dev/#/patchset/20260515094605.3195841-1-joonwonkang%40google.com

Thanks,
Joonwon Kang

