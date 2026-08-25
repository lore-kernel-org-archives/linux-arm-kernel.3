Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755CFC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 08:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ego9HMrjkuLUDdeK1Iq+KNPEGXEGkY7+DINyeWm7S4E=; b=GYhAIQKhwhmUXJz/xxnNzR1WeG
	+E6kSwv1ulq94wUixMldEAJaCM85CJZk6e1lUy1QFH3GauoaLItUC1+pLOyHLP+9Ckpx6cMYDS7iR
	l1G/7XwfycNLLKJDIjweS5p3QtqGE+2LslySMy/51xepy9SXhrwzNCr3jTse3ie7mcGRpwYFJOCjZ
	GjQXMIXPgsJDD79mzEdlTFqYmgW8ozfjzlb4kgM3ld4n590rB4Hcfc3f4tjwiCeAFBshiUq1PQDsB
	A+0E+NOPFMCu8bpKetb3d0NmyX/fAqhWHGE4uuZF3e80VG5RxrUGES7aJ7mMhGDUxHf9xZVAAq18u
	i+BD5AMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymFA-00000000LXI-0r2L;
	Tue, 25 Aug 2026 08:10:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymF7-00000000LW9-3Cwd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:10:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4980dc26022so30334345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 01:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787645448; x=1788250248; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ego9HMrjkuLUDdeK1Iq+KNPEGXEGkY7+DINyeWm7S4E=;
        b=FHux2JUUUmtS0hpRLp1Qfe7/qd8HXldNeOfsYEafjQcDTZwa3As5ne4sz69Ch8kOUH
         a0vKMI9QFtJwIc3Lo8gYYygHR5w9FjoTPDoJk1YzRAvOSEltbr7PvMYF9TkAIs26tCMY
         S7PrShYDQ+K7YazlmSveJmp9vX2fFDSRjs7/kr1ZqxU0Cja75GcvhBDO6fd0SU7bHBGM
         mWJCCn54mJmX2T4HKbwNuoNUf/bDV0oxhb8zAWTTI4FPyo5r949ZJv0rRtlJKYqh0gEa
         1iGAUGGGEIZTfy2dQCmdnDzFTslRd1vCyCAfrjiEuzeXGJIn6pKrvcyfW19hS/ENSrSP
         8Naw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787645448; x=1788250248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ego9HMrjkuLUDdeK1Iq+KNPEGXEGkY7+DINyeWm7S4E=;
        b=jvCJalUnGBKYQu9O2NJbfY773Rs684XTp1tCFwOysLVRqnLfAJdLQ2oqgg4AuzLawG
         g1FFrDi2YuBLyoPdX6/CbA0SOVVSirwR+lpqCU/X64foR/ybZJOGhQANeL/Wbw+TNrzi
         rOsO5X9dWZa0s5n9RKbWtSEwCLk02i/00ck357YsVm8363uiYi6JruNvec0bXQUhGDID
         Kvre3t7tUZbWt3kQsq0sJ8IYYYZOxXcCLl3CH0Iic3VkQtzq01lGIK24vruSAg/YoZat
         PWY+INds5K2Yji53kJjVl5hknKcg+uuDGKclasd8YNGT3NeteV3PPK+MP/zWWWLPDchW
         3bFw==
X-Forwarded-Encrypted: i=1; AHgh+RqszfBvRmwpB//lQDdat6kbCmnup46ihP/PgJ0vt6hyS7TehlslaMuIF/5J+erNYoyWygqwwj1uYFo2JjoSKK50@lists.infradead.org
X-Gm-Message-State: AFuF++n3hZiqkPucujVvqR3wcNbCLXbMoi12DMCN+LDkSAGhI/5TNltn
	m3Wa809AyguQwDRZsxCpZZIx3XhIyYKuddCKTReoJ1PSozmrzg9+SMvlr7dZEuSH5g==
X-Gm-Gg: AR+sD10sGBZC5gyV9yp2mjPIafvlm7rGJt2+SF7uOurT+HA6sTf4U+hyTWRjl124OAd
	vWFjKauA000hQd5H+TEUq0ldxkvbRlAQAvnffUL+CbyUc/lMT95deQnPGEakaJ3aIAJV50/5AEF
	iW2zieTx7vpGRhgA50JxX+2Zr7kLVRDRotMJoCgUTRC7sUer8/nPHPHPkN61X/1PzL+ztYsyrfc
	JNQx9T3wTB8dOwtIMUpBB8WT7FGvclv69dDCqiSZE01wtbirl3Wy4/NNzf7lddyKOnaYE8EBPiL
	q82/jFnGmyAcAdg9dNsimaqeHAcND1oGTbq+1n+bRdWU7A2iBK+g0ZQGlfTw//ViivjfYpT021Z
	XhfrFeRsLFkXY+QVWWyhyjjPPVBWg/HTD1jbzDWTdnGbVddTDtclsgplOdpsmHYku738m5I2kIj
	UuYembdxIuvghOoGw1tnJL+5w6y8hyaVfcwXgfGot5BdOfQ+8kLe9rQU7CohThZJWAFBtGXXV9g
	MmKwWaZOtrzR3njVihkXcDXBv4puH00
X-Received: by 2002:a05:600c:3f0c:b0:499:79b9:e226 with SMTP id 5b1f17b1804b1-499c178db57mr292491155e9.0.1787645447447;
        Tue, 25 Aug 2026 01:10:47 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d65c326esm18410685e9.10.2026.08.25.01.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:10:46 -0700 (PDT)
Date: Tue, 25 Aug 2026 09:10:43 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com
Subject: Re: [PATCH v4 06/17] KVM: arm64: Add pkvm_hyp_req infrastructure
Message-ID: <ao1OAx_zLwpaw_5Y@google.com>
References: <20260731143541.956291-1-vdonnefort@google.com>
 <20260731143541.956291-7-vdonnefort@google.com>
 <yq5afr02wstl.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5afr02wstl.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_011049_820851_7090E727 
X-CRM114-Status: GOOD (  16.64  )
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

On Tue, Aug 25, 2026 at 01:11:10PM +0530, Aneesh Kumar K.V wrote:
> Vincent Donnefort <vdonnefort@google.com> writes:
> 
> > Introduce a struct pkvm_hyp_req to enable the pKVM hypervisor to request
> > resources from the host.
> >
> > Provide serialisation helpers to transport these requests via SMCCC
> > registers (starting from a2):
> >
> >   pkvm_hyp_req_to_smccc() to encode into the SMCCC args.
> >   smccc_to_pkvm_hyp_req() to decode them.
> >
> > When the hypervisor raises a request, the host must handle it and retry
> > the HVC. To automate this sequence, introduce the pkvm_call_hyp_req()
> > macro. This intercepts pending requests, invokes the handler and retries
> > the HVC.
> >
> > Additionally, introduce a trace event to track the handling of these
> > requests.
> >
> > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> 
> This is very similar to the memory-transferring SRO operations described
> in section B4.3, RMI operations, of https://support.arm.com/documentation/den0137/2-0bet3/
> 
> The SRO model covers more details than the pkvm_hyp_req infrastructure.
> Should we look at making the two more similar?
> 
> -aneesh

Hum, this is really just a few lines of code. Also, pKVM doesn't need a stable
ABI with the kernel. Implementing a portion of a spec here sounds way too
complicated for that simple usage IMO. I struggle to see in what way this would
make pKVM better.

-- 
Vincent

