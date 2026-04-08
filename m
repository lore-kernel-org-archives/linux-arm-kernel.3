Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CBF10FC44A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 21:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLhQk/GcRQzTBdz6Sgw1idF6hAS9xniYesYPBlEvfFA=; b=oSTXcoLU053cVQLd07aADnxheh
	EUoFPMjcFwy7KhfS/B9ENqREtMy7XBYvt3cvnG9qhuHMRV0hySFuN7rJS1uIBvTm44i7W3jJcJO3Z
	b8/aJbC/UT5SV+8epEMn1uSe6YPVrvni6vI6Yh3w6cZkdmv/LyEkqrSkNXdlaOA1lRdsYWZUTBRDs
	kJz8ZjByVETc4JqSFYbqA/oE3eJdoGxX0zdEERQD8NagaZJpuJnn6jVXKfRy7rBFsANm3/OfMYXDo
	m9fJ/45+QMLSIeQkWX/k38hEF0PuGIcA2V0CopWekChLckIINoM3oBWVAvlq9YRb/VMDjT/uQ37+z
	2nd2nCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAav6-00000009ST0-1Rbq;
	Wed, 08 Apr 2026 21:58:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAav5-00000009SSu-0FWa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 21:58:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ACC7600CB
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 21:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5636C19424
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 21:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775685520;
	bh=gLhQk/GcRQzTBdz6Sgw1idF6hAS9xniYesYPBlEvfFA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jK/fHVBBlK8Ch5c2VQhERNpXDMnvynf/9nH2KPuDEBFwZfWST6DQyIjTJL3EvSm5f
	 XPUnFmF6vlE22ttrL3Jxm5IeUhengTQK6+LQNaMQs7boykglCj82Fd6Y9n16TeJm8f
	 FqIGhZGd8h2h+OkzfU/p7JCtkxvEQ0RsnFQ7UGzn4e+ROFoxZLKZ1M/5/2EW188Sc/
	 6c3qeqfu+SKjWSpP2MuiMHWLyd6oWHCqJHIvhcKD5eJyCR4mlBSDvTfZuVcMS1wocG
	 1iFw2S0xyciWKypOtwhhwuy4DQsAYGEdMZWH0b8DxtbdffzjYzm4HNx7dDfWBPtxeW
	 meWXSRtBZgU2g==
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-506a6cf8242so2016761cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 14:58:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvkhUtYAtnustcEagn1tqRohdOjcvoIsYSH/qY4K7Ar4nHJR6LMOsw5QJWUCyexlvl8JV7RWfSCEXaI4zcBbxd@lists.infradead.org
X-Gm-Message-State: AOJu0YwrSCptiLxktKykDXS8BGZiCJo8Pogx/QT6TL9qSALYykcqGKiC
	pieuS/eVlLW9X0Qsx6FzsJY/lRbj1AyhOMKCvCPYWo2+EYuBwxLi+nGWPToV5kmBIAavjU4jqx1
	kTEAhjsO5569CCGJd2y40aF06XuR7gAc=
X-Received: by 2002:a05:620a:280c:b0:8cd:7271:65f0 with SMTP id
 af79cd13be357-8d41da56bfcmr3255803085a.44.1775685520089; Wed, 08 Apr 2026
 14:58:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260408025115.27368-1-baohua@kernel.org> <20260408025115.27368-8-baohua@kernel.org>
 <90cfbbb4-9f75-4c67-a1c5-34780b2f7108@arm.com>
In-Reply-To: <90cfbbb4-9f75-4c67-a1c5-34780b2f7108@arm.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 9 Apr 2026 05:58:28 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zn9KcA-KXTp3-F6uCe-AEiqrawdwFffBvxTJbDVwgyvQ@mail.gmail.com>
X-Gm-Features: AQROBzCoMjacDMsJOO1TbJJq704JVsHCBUimPGPOnAYdW4abGNDECmY_PU-x9sA
Message-ID: <CAGsJ_4zn9KcA-KXTp3-F6uCe-AEiqrawdwFffBvxTJbDVwgyvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 7/8] mm/vmalloc: Coalesce same page_shift mappings in
 vmap to avoid pgtable zigzag
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	urezki@gmail.com, linux-kernel@vger.kernel.org, anshuman.khandual@arm.com, 
	ryan.roberts@arm.com, ajd@linux.ibm.com, rppt@kernel.org, david@kernel.org, 
	Xueyuan.chen21@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Apr 8, 2026 at 7:36=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
>
>
> On 08/04/26 8:21 am, Barry Song (Xiaomi) wrote:
> > For vmap(), detect pages with the same page_shift and map them in
> > batches, avoiding the pgtable zigzag caused by per-page mapping.
> >
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > ---
>
> In patch 4, you eliminate the pagetable rewalk, and in patch 5,
> you re-introduce it, then in this patch you eliminate it again.
> So please just squash this into #5.
>

Sure. I guess I revealed some of the development process in this
patchset. The patch was initially written with page table rewalks
for simplicity and then iteratively improved. I agree that nobody
really cares how it was originally written :-)

Best Regards
Barry

