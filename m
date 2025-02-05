Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2995FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RFLD5Y419LMLKxBPptSqSiuNprPZyJrTzacReh60S5o=; b=yKY2l8KVNox73T
	ORWVrhhm+O8py7Q0T8AiMmrHn5OqohOD/vTqvSrmAk+5MPHvZB3rdEtd3JHOAelyFNIqhkL3c3ZTz
	GyYbKNwtTL2LzosF18aggwputIq5HtbULaoOAJZWFQGPSAvUOK8Oc+B/coFXy7PdwOvKfNcj5iTvY
	GedYMyIO2qWYSKFd8+WGtMTSIqy3sQWzDwQSb/QJCktjGUSKftKYodfxZtJdVs0+XplujwIa0rzUy
	jPo3sEznM0FD3tKY3FH9Czcw8fFEds8eaHCqeWRiywgUwZujj3YGRm6DpxE2kUQZZ0BJ38GxS4S9i
	9mu/SSCW4oWN/L2tGmZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkTy-00000004Jsy-0WTV;
	Wed, 05 Feb 2025 18:50:42 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfkSb-00000004JhH-03kw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 18:49:18 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-71e197d0cdfso112131a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 10:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738781355; x=1739386155; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RFLD5Y419LMLKxBPptSqSiuNprPZyJrTzacReh60S5o=;
        b=q6OAIrsAMNjqBE/K1f4zGnghjF4WiluB3GNRPxI/Tz8EnYbh/nbfPPfPasVKqO3zWH
         ReAagKxHd4bmOteWDpKym7i3UEQPunE3WtqJ3EiK+9BipzunJ6sHPtbEr40HKMn5G+Vl
         vafIJm7D7QJRdcq1eRU5R4AR139lDReAyn82MBFaq3MXz3BTm9L1srxqagU1WaRXUWxL
         G5cSElPmr/CycklWZLNbm4lxrSq/ljSv7h8lDWI8ZevG+5RA7LEJnN8SayhPVZEpAQNI
         9aBkxxsqd8ctWtu9BoGRSS8heu6nJxCVDi8MdAnA2z0zI9+Y/nUoZPu1GcwG6pzpfPsL
         WBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781355; x=1739386155;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFLD5Y419LMLKxBPptSqSiuNprPZyJrTzacReh60S5o=;
        b=IVzI/pePOxXmwcHztgbXTurNaGaD9j666Td8weUEtJvamh6yuppHh1qQTcwSxe6tZC
         kK/rwPZhyDgXq7HYmEIJjhg5bFHOEL+dwSENZLixxNcDo8ufh9dg+oD21UsimgDxjag/
         bmN3YwiDPlOmdkdj9g2sSNE14J8Mtm6ngnuuWO3JgndZHyI9gOXwYOlqDd+s0bHFrcX3
         bFflKVniWSQ1GUei62dBCTa9xGvozdTyDsOHZ1N5wilojRD9gUUFEmexwg9NHm1MBTpE
         1efFj/2IkwYoS8RKFXpCpXaFbCocRcTDbmysiN+wmq7He73xAOr5DZH6eH6rExkHykle
         x54w==
X-Forwarded-Encrypted: i=1; AJvYcCUtv8Uvag5GOq7Tk33Vxm1E4tZxiRnPUyw5OSUjCdFJmJHTrVN7SocXx2YdPQG5VGfXtu+1LVZ620jD/zD43qJY@lists.infradead.org
X-Gm-Message-State: AOJu0YzeyBpgQ7tBp8W8v5uKC/0o1iWyH8o4G8s/Iu6b1bawnERQRDrG
	nDUecgipnMhJuzLoly+Le39kVXVshY9PpIQeCG5PkPaLD/1uARwA2wp5Wlc0pwSY8eZDiVOdjZY
	FcD9MGqI8nFWCJeNhB+mMsQ==
X-Google-Smtp-Source: AGHT+IG1848Nyq0Ep5YZHUoXqdxSYPedyBRtjzatXIPDIYwQRd5LUrtw/B5zE5Ng8GmU9F7dXNmOSuoU4vizvGXdRQ==
X-Received: from otbcs10.prod.google.com ([2002:a05:6830:678a:b0:721:b316:918])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:71aa:b0:71d:f6d3:9fd2 with SMTP id 46e09a7af769-726a428cc52mr2331443a34.24.1738781355567;
 Wed, 05 Feb 2025 10:49:15 -0800 (PST)
Date: Wed, 05 Feb 2025 18:49:14 +0000
In-Reply-To: <Z6KoUBdmjVRuqPnU@linux.dev> (message from Oliver Upton on Tue, 4
 Feb 2025 23:52:48 +0000)
Mime-Version: 1.0
Message-ID: <gsntseos1b2t.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 1/2] perf: arm_pmuv3: Remove cyclical dependency with kvm_host.h
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_104917_053234_E34E8764 
X-CRM114-Status: GOOD (  11.97  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> Hi Colton,

> On Tue, Feb 04, 2025 at 07:57:07PM +0000, Colton Lewis wrote:
>> asm/kvm_host.h includes asm/arm_pmu.h which includes perf/arm_pmuv3.h
>> which includes asm/arm_pmuv3.h which includes asm/kvm_host.h This
>> causes confusing compilation problems when trying to use anything in
>> the chain.

>> Break the cycle by taking asm/kvm_host.h out of asm/arm_pmuv3.h
>> because asm/kvm_host.h is huge and we only need a few functions from
>> it. Move the required declarations to asm/arm_pmuv3.h.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> Please do not move KVM namespaced functions into non-KVM headers. Having
> a separate header for KVM<->PMUv3 driver interfaces is probably the
> right thing to do, especially since you're going to be adding more with
> partitioned PMU support.

That seems like a good idea to me.

