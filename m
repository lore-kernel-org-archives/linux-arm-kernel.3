Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B70C021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIhN0R5QlN5gfMPD8y/C9Ok4w/DGGUuFXTQ4OChy43E=; b=LEikje/vp6UNyXxZgasEvYVCee
	g6bPerIMJZlBY3o5M4+LVgT6hdKnvY4ldltflq7A+6IKGyXzpMcJVmEoOYyFiihKl/6sPJ2pbXJQ/
	2edzJcddtdIBWOkftSTF3VBOhH5nFFDhlY4OPwrJu4oIhNaGc9Lfi2Y3yDSF8PnJi0/6Y/omWDveW
	G+3Xap41wpvYR0jGJH0Xy0tKPUNxFjDDw++ZgdRzp+tPyCIBZmSezsgQXT7v2QECNRWGGQQLcI8fY
	rJ7vQE7+PJroH4DiWbEVSrA0b4jsg/mGFmeP5GwbM133hCteyexGmBrf1DAkKxr9G+LgM0nNmep1G
	EbDjVtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2xZ-000000051RJ-3Nef;
	Mon, 17 Feb 2025 15:23:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2hT-00000004z7J-2Jlm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739804781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cIhN0R5QlN5gfMPD8y/C9Ok4w/DGGUuFXTQ4OChy43E=;
	b=JR8wWPic3TySoWxnOWoSu1KnHpro9Z5373oWQpE0wO3fk/8qAtdP49Tm2huVW530m2D9Jf
	KFmUSrDKV6RHEPKbLO8L0XnfiQTM7QbyMR0oBqoybWaBvPRS1sNLQDlymdhEQnx0M0CjZ8
	4a++msOXHqrjaqTppAmmZfQS5eVGXVw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-V-sLzXu_OIiMF9PpJ9i-eQ-1; Mon, 17 Feb 2025 10:06:19 -0500
X-MC-Unique: V-sLzXu_OIiMF9PpJ9i-eQ-1
X-Mimecast-MFC-AGG-ID: V-sLzXu_OIiMF9PpJ9i-eQ_1739804779
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4394040fea1so25765375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 07:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804778; x=1740409578;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cIhN0R5QlN5gfMPD8y/C9Ok4w/DGGUuFXTQ4OChy43E=;
        b=L4K7MEjA4aCGcKjq1TAGbYO+yJUDqcdf6DaIYWHSIOfcIIH1xdmOvr8fKZOEKYON5v
         bUafYStFvQo7X61jtGcWxk///LVLyIZ/uixjp75KthZ486ACcXPXOvy45C/kJs5o6RQT
         tazxG+rl1sAfyotrLqoUac3MlBwGekVNL9g0SzuZyjm1UvM6mwSDZ25f4OwL1/7cbzHu
         C+/47Ae8rwqOWsVLsc6eP2QWFpeBqm31qCfmkRfZnqryGuXiZ70o1ysNPz1qcDyP3OIq
         GPQz4mPLEzA2T9E9Fnev+5o0r28z0a5wNqP8XGGyuS9FXU5GegXd6bB/jaNckrK4cr1Y
         FkSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO/fCWSRx6Zrwp3+YQRYd16sXlQsvIEQt/AJevZSSOa68MQZbwnXogafcAMx03ZX3gAH8mi9Ndf052IClq/DQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YyXJ0GFccqcItfPSFOftWoOVtXjmN05qXias5+JfIYsn225vuNW
	+8JIp3B914g/EfRmXYnSPl6hKxuGAZ8udN4qf8I5NPbmQCdpkpUkZpasFU5/lzH/GxnxtQ1i5Y+
	RcBndrJppubMAQfCVxIsmbOxzvFy2vML5PKBX6Q8Btfp0aI5KPY7whYXY3CuvmvJ4OBIFNF0i
X-Gm-Gg: ASbGncsAZw2SMzH39D2Hb59uG/UNRBXFyppmTukxNSvZ3dSZXwjDp3hPijJ9ikHsDA/
	mFBDQbPUCZuWOM6HKlKhlwwRPg1R9l3SOURQaI4clr/CQiKy5Ap/RoXBt1V9OXxIcBjlqCuq7sw
	iIj9Y0QFW/2isRZt8JiG0Ewv6WIToivZ4CTDFpV7pNNRvg8RrqnuoVAyeoadLizsXQHWktXqhOV
	+sXX1g1oP+qjwyEjOD6REvMFtrz3k7NXnsQZb6MVHhqljTBYaCOmoFfzJB7GVhI9KpLRSQcafpk
	IShnDJxvkTSmH/stykUPrd0tGH+oho5nbvTFNeDiUY9bMrp6Z7rVkQ==
X-Received: by 2002:a05:600c:1784:b0:439:5fa1:af56 with SMTP id 5b1f17b1804b1-43960bbfd9fmr182694395e9.2.1739804778572;
        Mon, 17 Feb 2025 07:06:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVu6DcpgSOODbx4M+M3zf9KaHfo6c0Pz4pVxnIXGaBPyQrP1BWzFL6eAilUcGtKBfEe91Usw==
X-Received: by 2002:a05:600c:1784:b0:439:5fa1:af56 with SMTP id 5b1f17b1804b1-43960bbfd9fmr182693755e9.2.1739804778154;
        Mon, 17 Feb 2025 07:06:18 -0800 (PST)
Received: from rh (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5c29sm12533867f8f.72.2025.02.17.07.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 07:06:17 -0800 (PST)
Date: Mon, 17 Feb 2025 16:06:16 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Oliver Upton <oliver.upton@linux.dev>
cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Zenghui Yu <yuzenghui@huawei.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
    Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
In-Reply-To: <Z7BoydkyT_h0gwOV@linux.dev>
Message-ID: <afac82bb-2d7d-66d0-cdb8-d8e3471a2bed@redhat.com>
References: <20250211143910.16775-1-sebott@redhat.com> <20250211143910.16775-2-sebott@redhat.com> <Z7BoydkyT_h0gwOV@linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lL_GTPz_MsQZXeuIHzhcm9Ij8MqUBrHApVWzYZx2N3s_1739804779
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_070623_663614_06D1EF08 
X-CRM114-Status: GOOD (  18.22  )
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

Hello Oliver,

On Sat, 15 Feb 2025, Oliver Upton wrote:
> On Tue, Feb 11, 2025 at 03:39:07PM +0100, Sebastian Ott wrote:
>> +static int set_id_reg_non_ftr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
>> +			      u64 val)
>> +{
>> +	u32 id = reg_to_encoding(rd);
>> +	int ret;
>> +
>> +	mutex_lock(&vcpu->kvm->arch.config_lock);
>
> There's quite a few early outs, guard() might be a better fit than
> explicitly dropping the lock.

Yea, I thought about that too but most of the other functions in that file
use the classic lock primitives. But you're right - it looks cleaner.

>
>> +	/*
>> +	 * Since guest access to MIDR_EL1 is not trapped
>> +	 * set up VPIDR_EL2 to hold the MIDR_EL1 value.
>> +	 */
>> +	if (id == SYS_MIDR_EL1)
>> +		write_sysreg(val, vpidr_el2);
>
> This is problematic for a couple reasons:
>
> - If the kernel isn't running at EL2, VPIDR_EL2 is undefined
>
> - VPIDR_EL2 needs to be handled as part of the vCPU context, not
>   written to without a running vCPU. What would happen if two vCPUs
>   have different MIDR values?

Indeed. Sry, I hadn't thought about that. That makes much more sense now.

> Here's a new diff with some hacks thrown in to handle VPIDR_EL2
> correctly. Very lightly tested :)

Thank you very much! I've integrated that and currently run some tests
with it.

Sebastian


