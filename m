Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BA4C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOI7Z+k/jw/HwkIzU4wUrpSnIOnbW4yX7Ts578dd7m0=; b=OTkvKZV8QR1GbIz95+fVxx9gFd
	XdoOBOH38Y6ipXcpsXdtlKpbYqjtIDPFasONPVjaS4+7P6DAktHOPZqwcPmSaUpSL5teTFsH200ux
	LOx2wbWCLQEmsWGdQDhmquz1tzTFVbNpur6gT0BWNza9O7M0s0DNzrREvJHoYp4vgY44eZTnO3Jk7
	uvEDA5/ixugKRJGTHX4gPjJxh/gwjU94ndsFCO5wfSsh1rbptUTYvTBkm7fgiMK7Fjbb22HQ3L09E
	TfzCVkWmnTY1zrPDgn1j2RxlOiB3GafSyQDmEKC3fSX3/a5XxjYz0A1R+Wjk/nN/qNpisw6a2vXAU
	ywaESxEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNxZ-00000004c0a-12Qr;
	Fri, 21 Feb 2025 08:00:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlNpc-00000004aS2-34a5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 07:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740124339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rOI7Z+k/jw/HwkIzU4wUrpSnIOnbW4yX7Ts578dd7m0=;
	b=bBcAWn9cGqy4H6qmy4L3R6rfw0RlLDCMFoGh/MIEwdo9cwuNSg1NXIutRdcMiRWVf+WCAR
	Atij/qMDaZ9tV/S7w4L7MqbKE6sZ62j1fLxM91oZYsBe9nYZplSshRYU3tpSXBpH5vAiu+
	pCwZwPvMITK8GkGbE/oZyq7/N2Q+jx4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-2W__KWruOGaCueChEqsuCg-1; Fri, 21 Feb 2025 02:52:18 -0500
X-MC-Unique: 2W__KWruOGaCueChEqsuCg-1
X-Mimecast-MFC-AGG-ID: 2W__KWruOGaCueChEqsuCg_1740124337
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4399c5ba9e4so9444705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 23:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740124337; x=1740729137;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOI7Z+k/jw/HwkIzU4wUrpSnIOnbW4yX7Ts578dd7m0=;
        b=jiYXWDwklpeDBmUujLnKAUgN0qaVbPU8Uh5I5/dxJ8KKeCyPTOVOY1ozuoLlNKYhCN
         0dcylRkCJMICC4VoA/eh/JLjmJFqWJ6R1m63GKnzzWKff3uGmOHG3RjUMVFitD3cxii3
         Q/0qVAs2vjM2sZ0gBw/7382lRYaYYcnkKQsnT1QymeMKEp+n8mKBBCAs+WGtuE5bx3Vq
         39H48uKnQM3cIDREzFYcJNPQoX6XmwMGoTN4OY8+q9AFww9qc0kzB+y8I+imB6Y3zt7K
         Lp89sOo17Lo1nq6K537CiecMnRzYcQRpLkuuDMToBMosuU9p75NcKLNUcGlQGwMzS5sL
         J/kw==
X-Forwarded-Encrypted: i=1; AJvYcCVaLQ8zw8PmrvUTu80pcb9ZH1NOW/wtqqLsepuy5USSPZP6YtHMYmNEgUzIiWhJ4Vt+7WeGPvxzm47X2FgqpKMR@lists.infradead.org
X-Gm-Message-State: AOJu0YzStXwD85J7rOBbG0nCH2fqSphUVKTZDQfq27O4f4P9nm2RR7qA
	zFsd/pWAaLQXXfmw7E6ADNh5puy2V1SI6yYvk/1goD4tpLAOwerdtDUqyf+QW2VNEdlF72auGKi
	23I9zCIK+At5fJigQ+5nPrNDinyghj8VMFekt7hEOlf4fmIQg8Cf8m6dlmGdk4Z8KCvXKKn+Q
X-Gm-Gg: ASbGncsqPYUBZR0gY2b6rxJkN2lKAGJFKKrLAzHoSUCcr0a/V3GfaRHFWurV3+qz/Vy
	Vm0xQk/hOSZYDsHWGwf/RPPYRFpK/6qfYlp+B9eSTNVs3LMVlfAMixy5xRvf3+GU9bzKL0wdd/L
	ICrvji3sFZuAcIz2ZM3zqc87kbMCFvjOTyWIiqDH6OpNeiUnmfFYMZO2Iov5FqKBnRe3XvGcHyJ
	/HUkwoylnvGmBBPw9SKqLPeQumc/LI3MyUXDx7nWxG5/j2apC8WzZN39xgi5Bx/A5Jqi7v3wLJO
	1DhX2ufnNQoV86wLxYVJocg60N+TsVEEvcQAoUQqhAU7DxKKGtNfjp7d7Vd8jPvd
X-Received: by 2002:a05:600c:5246:b0:439:9a40:aa09 with SMTP id 5b1f17b1804b1-439ae21d202mr13079625e9.25.1740124337021;
        Thu, 20 Feb 2025 23:52:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6RndQ6ymoZEFzvzfDt+1GKRpaPngpEuFYmDAHqGLJUcufH5YS8MWYZmZqlHO+/W+nddETwA==
X-Received: by 2002:a05:600c:5246:b0:439:9a40:aa09 with SMTP id 5b1f17b1804b1-439ae21d202mr13079435e9.25.1740124336660;
        Thu, 20 Feb 2025 23:52:16 -0800 (PST)
Received: from rh (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce735sm9240925e9.3.2025.02.20.23.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 23:52:16 -0800 (PST)
Date: Fri, 21 Feb 2025 08:52:15 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
    Eric Auger <eric.auger@redhat.com>, gankulkarni@os.amperecomputing.com
Subject: Re: [PATCH v2 02/14] KVM: arm64: Hide ID_AA64MMFR2_EL1.NV from guest
 and userspace
In-Reply-To: <86r03squ0w.wl-maz@kernel.org>
Message-ID: <5f9699c5-ccc8-9339-bfca-1ace8d7f86b6@redhat.com>
References: <20250220134907.554085-1-maz@kernel.org> <20250220134907.554085-3-maz@kernel.org> <af16f5bc-4300-54d3-b480-c559ec070a44@redhat.com> <86r03squ0w.wl-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k4EJHTUd8XSWcKH-9iNL_sxDsxP78scNlYgCrGO7erI_1740124337
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_235220_847513_48443F52 
X-CRM114-Status: GOOD (  13.27  )
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

On Thu, 20 Feb 2025, Marc Zyngier wrote:
> On Thu, 20 Feb 2025 17:36:35 +0000,
> Sebastian Ott <sebott@redhat.com> wrote:
>> On Thu, 20 Feb 2025, Marc Zyngier wrote:
>>> Since our take on FEAT_NV is to only support FEAT_NV2, we should
>>> never expose ID_AA64MMFR2_EL1.NV to a guest nor userspace.
>>>
>>> Make sure we mask this field for good.
>>>
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>> ---
>>> arch/arm64/kvm/sys_regs.c | 1 +
>>> 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
>>> index 82430c1e1dd02..9f10dbd26e348 100644
>>> --- a/arch/arm64/kvm/sys_regs.c
>>> +++ b/arch/arm64/kvm/sys_regs.c
>>> @@ -1627,6 +1627,7 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
>>> 		break;
>>> 	case SYS_ID_AA64MMFR2_EL1:
>>> 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
>>> +		val &= ~ID_AA64MMFR2_EL1_NV;
>>> 		break;
>>
>> This would cause issues when you update the host kernel while keeping the
>> guests register state. Could we allow to write (but ignore) the previously
>> valid value? Like it was handled in:
>> 	6685f5d572c2 KVM: arm64: Disable MPAM visibility by default and ignore VMM writes
>
> Yeah, this falls into the same "shouldn't have exposed this the first
> place" bucket. Annoying. Something like the diff below?

Yes, thanks!


