Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AA7CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ut72Gkptn/NBySJV/auF15VVBqcdKlrwYtyzCOsNz0=; b=HPR+grpX5nMuO6qU6MbyKF0wBK
	Hx+XCbp/nI3UkRXXK5EiXGz19qy2Ny1stpz1Q5JyjZ8dAdjr66KVMN35DGDRfTLwhf5z81QsaG/iD
	qQjzji4onE6ceayG5WuyPucazGZAL/Ck7vCkmoMv/+F6RMaeXNMyfA6jGZZilfGuLingeRjdru5Qm
	rnYHp4JBCQddf++ytcXW+to5hB8/Dkr4Kq0cv4u57cPwezvbas7a9NUAXt0uJnNdzKGXKKoGpcmiU
	0yF5nR4TSBouee7Iuju36LPkSsvLnEH2ulngBif1V8ZX0JPXhik+HcTu8Awv/TEMoOHMqk1lkQgsq
	1yJOkfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFYP-00000000cpj-29TH;
	Tue, 19 May 2026 08:11:53 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPFYN-00000000cnS-1gQ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 08:11:52 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b9fe2d6793so82746695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 01:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779178310; x=1779783110; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ut72Gkptn/NBySJV/auF15VVBqcdKlrwYtyzCOsNz0=;
        b=YaLe1argOTjchz1SHMJtbkNyXCHZbA7f0wEfwRone6j9o9Bjy1Bf1Tx/QKEaH2SAwK
         CohboqawIba44TKvTFwcv9D0KI6F4XtHUaxMqRXAHVzxhtJ/17Gvb84bci61cH0SdKSP
         ky724/Kn0lEj5vCxmzS0QdMbji1zwxI6w5TrGaWx2RssnNlDflACJneK6gjkiLGRZx7t
         wPw6au5andg0pBSYo7/rqk1OjBraE8K5k6aBLZ2YV2Hz5HbgpfgDXtk0xlZLSwsk03er
         CLtTkRX9howMDsbum3qMe2iei89Er5zgBesEML36ARLQjG01Z4iL6yx8/NituhZu55oc
         fksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178310; x=1779783110;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ut72Gkptn/NBySJV/auF15VVBqcdKlrwYtyzCOsNz0=;
        b=CFqifVEdB/R2BOmtLGjMezlZVCrfx9ZdB2Rx+Ov5OC5c6u1zMpuTTS2sdyWUT+WfK0
         C3aRyRkZqCVCeAe+/wIYO+KTPut+t5xY7fJm7q4MFy5bj2NYo4KQrcTEkPiZnlKOMXM5
         aWsY8E7jZQ2Vq63cTDvevc4t5oCgMMV0zp2EFgzb6QHpqLG/NdzhXQxN44ru1//heqED
         htC4rMRi+Uamtj7dDwDk2k8VhwTVeCW/WSXOuRoHmj3lD4GbKVJWODB0gROnwlaAfy+G
         PTl65fdXMBbZ56vzBgRNXWgkkkdf+hzPHFFOTJ/ptQvqW+5GIgqTR7pwdiCkZIj5DwC0
         oakg==
X-Forwarded-Encrypted: i=1; AFNElJ/sd83SYPTgU80DeZOP8ZI8lsc62s1DOZqGXXlVcHIMulye9ZRVuoKxzWz2Jz5DrrSEElIoo4g2GZtJ/oDGOWqq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/IckadB8aBqnleAgaibEi+Y50YJLY+5zTlbRNeuBg/VeK+1be
	LTh8B+lY72PVvQE3q9AEkc3phmJBVzitux7aKdAb2aUheto3uHuCmFH+Kfv8x4HfsCLaGEukTt8
	ykizPffMbonG6aYQ2snk0DHUbHg==
X-Received: from plvv3.prod.google.com ([2002:a17:902:d083:b0:2be:3026:1d0f])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f08d:b0:2bd:2051:13ed with SMTP id d9443c01a7336-2bd7e87ef1amr129360345ad.23.1779178309741;
 Tue, 19 May 2026 01:11:49 -0700 (PDT)
Date: Tue, 19 May 2026 08:11:47 +0000
In-Reply-To: <20260518175249.GS7702@ziepe.ca>
Mime-Version: 1.0
References: <20260518175249.GS7702@ziepe.ca>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260519081148.1301245-1-joonwonkang@google.com>
Subject: Re: [PATCH] iommu: Allow device driver to use its own PASID space for SVA
From: Joonwon Kang <joonwonkang@google.com>
To: jgg@ziepe.ca
Cc: Alexander.Grest@microsoft.com, alexander.shishkin@linux.intel.com, 
	amhetre@nvidia.com, baolu.lu@linux.intel.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, easwar.hariharan@linux.microsoft.com, 
	hpa@zytor.com, iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, 
	joonwonkang@google.com, joro@8bytes.org, jpb@kernel.org, kas@kernel.org, 
	kees@kernel.org, kevin.tian@intel.com, kirill.shutemov@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, nicolinc@nvidia.com, peterz@infradead.org, praan@google.com, 
	robin.murphy@arm.com, ryasuoka@redhat.com, smostafa@google.com, 
	sohil.mehta@intel.com, tglx@kernel.org, will@kernel.org, x86@kernel.org, 
	xin@zytor.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_011151_440771_6646863A 
X-CRM114-Status: GOOD (  28.23  )
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

> On Mon, May 18, 2026 at 09:06:54AM +0000, Joonwon Kang wrote:
> > > On Fri, May 15, 2026 at 09:46:05AM +0000, Joonwon Kang wrote:
> > > > diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> > > > index 0ca3912ecb7f..61e2e52105e5 100644
> > > > --- a/arch/x86/kernel/traps.c
> > > > +++ b/arch/x86/kernel/traps.c
> > > > @@ -864,6 +864,8 @@ static bool try_fixup_enqcmd_gp(void)
> > > >  		return false;
> > > >  
> > > >  	pasid = mm_get_enqcmd_pasid(current->mm);
> > > > +	if (pasid == IOMMU_PASID_INVALID)
> > > > +		return false;
> > > 
> > > If you do this then probably you should get rid of mm_valid_pasid(),
> > > mm_get_enqcmd_pasid() already has the NULL check so the two functions
> > > are kind of pointless.
> > > 
> > > You also missed the other place calling mm_valid_pasid() that should
> > > really be sensitive to this as well:
> > > 
> > > static int prctl_enable_tagged_addr(struct mm_struct *mm, unsigned long nr_bits)
> > > {
> > > [..]
> > >         if (mm_valid_pasid(mm) &&
> > >             !test_bit(MM_CONTEXT_FORCE_TAGGED_SVA, &mm->context.flags))
> > >                 return -EINVAL;
> > > 
> > > Make that removal a prep patch
> > > 
> > 
> > Thanks for pointing this out. I think mm_valid_pasid() is to check if SVA
> > is currently in action while mm_get_enqcmd_pasid() is to get the PASID for
> > "ENQCMD instruction execution".
> 
> > Since it is now possible with this patch to activate SVA without involving
> > EL0(for ENQCMD-like instructions),
> 
> I see, this thing about which is about LAM should remain, yes
> 
> But all the "EL0" machinery about trapping and enabling ENQCMD should
> be moved over to mm_get_enqcmd_pasid() and never call mm_valid_pasid()

Yes, it makes sense. Let me fix that in the next version.

Thanks,
Joonwon Kang

