Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC66BC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 15:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDDoD7MAAzkQ1fIivP2txqY+zfJIFrV2GeWHb0bMWeg=; b=kmSiMWXiAn6ch5jRYJp9OirPoy
	yxrJcAE7y1rw+KcO6MUUpIPJDWAyJST4Ue+kg7PFyXMmhDfosXcvBoFhX2pFSGaj8Yn1/SQjxIvM6
	YjvW6eGCfiQv/P7smOQJ1Z9D6Jsva2R2eo0Jai6GY7NfthViOXMou3hvwt+xK/nwFMYz7ev9THFq9
	UJiUMa2n4yKYUbWmNH042PzsFPfLBy7EqNS13vD5jtMz6TcBs/rJkB2bnRJNpctvl5uaP7+ze9wsY
	rRt8EXqKbxRY+u0nF7Hobw2dhP9puXJAZUSzYDuHoYNB7hrsO2hlNIQaJ1XElaMYqi7gaqkJGAHgv
	p+yQsGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0LPZ-000000075IS-3xWq;
	Sat, 29 Aug 2026 15:56:05 +0000
Received: from out-10.mta1.migadu.com ([2001:41d0:203:375::a] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0LPV-000000075I3-2UYG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 15:56:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3dTe4I+jOUWdWEDTdrRhpKO6zN5DvkrePHACeVTRXMA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788018957; v=1; x=1788623757;
 b=dVvsLidcMR1dWi8BRMWNvY2WiZ7LvSHOqx/DoN+uDn0bNJi5i0K+PMyx9ExsmYnbBquGVCd6
 iLzYQ1ap5VaYAHd6KkxAy4HXom3iQulxuXZTQJrYaIjHaQ08K5tMGqVMRay4znTB8N9Nny+qZD6
 OFfbYsM39yzNm24lwUQQh7o4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c6770ff25737b36e;
	Sat, 29 Aug 2026 15:55:57 +0000
X-Mizu-Trace-ID: c6770ff25737b36e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2a8173142so2366e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:55:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3lM3pQJc3n2puIpdwM1PqcHzstnumrEfZE4Ky1Bv60eaYDtZWAxdPwVyiPDYpaYUifdhPHq+MM+h5tew2qgxm@lists.infradead.org
X-Gm-Message-State: AFuF++lmN/R/nwRptiPvmsZYTsO/zWXdNZuGvo1LRPIVI151gs2ITJMY
	s1kNJw5nftT2zpQ/NKw8kKMnKsv1YtgTSKFuQBA+AcLb22j7UZ1slVynBGQv+LLQXbAKCvaaJ3O
	OjvdSO2AgiaMHnMS67027azGAfIVEPoM7mhn/IKPm
X-Received: by 2002:a05:6512:4484:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b5ef1bf21emr94137e87.4.1788018952785; Sat, 29 Aug 2026
 08:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260829054856.70549-1-kmehltretter@gmail.com>
 <20260829054856.70549-2-kmehltretter@gmail.com> <CA+EHjTzQM0bf1x2X-Y+eMmUHSYUmJXpt_jQ4Csu7JpkjtFT72Q@mail.gmail.com>
 <apL9jzg-KM_n3Vv2@gmail.com>
In-Reply-To: <apL9jzg-KM_n3Vv2@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sat, 29 Aug 2026 16:55:16 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzP0ijpos=1UOTz36b6_e1Ux90rNPm8HV5AKRhMOd76Zg@mail.gmail.com>
X-Gm-Features: AcwNN1VTjw50xqm9AUGeQ2iOjooRY4VH0Aw3j5JN4xMy5Uv_aVYtiX-pVxGi2Is
Message-ID: <CA+EHjTzP0ijpos=1UOTz36b6_e1Ux90rNPm8HV5AKRhMOd76Zg@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter
 range at base 0
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_085602_465674_749EF801 
X-CRM114-Status: GOOD (  13.04  )
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

On Sat, 29 Aug 2026 at 16:53, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> On Sat, Aug 29, 2026 at 04:04:01PM +0100, Fuad Tabba wrote:
> > > Fixes: 821d935c87bc ("KVM: arm64: Introduce support for userspace SMCCC filtering")
> > > Assisted-by: LLM
> >
> > nit: this should be `Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1]
> > [TOOL2]` rather than LLM
> >
>
> When I first saw 'LLM' in a patch I thought so too.
>
> But it is now allowed, see recent discussion and merge:
>
>   https://lore.kernel.org/r/87qzkuahlr.fsf@trenco.lwn.net/

I missed that. Makes sense to be honest. Either way, that was just a nit :)

Thanks!
/fuad

>
>   816d9992d9ed ("coding-assistants: simplify attribution")
>
> > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
>
> Thanks for the review and also testing!
>
> Karl

