Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4372CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Maojrdkd+5w2XWqqGc/P00CzPWv+6mS70oBhALVRgBY=; b=RqgOWUvQ1Xpu66
	5yzbgk3QgXz5zI0lgp2JEBW3xbphLw/+UBOPkjQrQOWM2HjNhgsLEHQ3a8zar16lf33v9rAHRg4/6
	Mm7Ocsn8T4JwBPSIGLvOkb7k6dz0WayxiO233QiLsMJec43WkC8eopxTO+ctkAbWtcRq54O+qHOvB
	3gbXKmWQVkXFIhSxNhYTud6RD7Wor1Qm4ms7fbwSzP9eAUlQhUy567XqR48+RK6ANBPmrH1XjNuHz
	SSlDRQjiMZpsGud6xI9r1kW+YcN+pB7wsz/2O4WhXSlbl0y63DPYihoBbGV/HCHUAe/ogq1Llsjb0
	BppQ0Czpr99TCcGnfwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNadN-00000006IXi-2kT6;
	Thu, 14 May 2026 18:18:09 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNadL-00000006IX2-0uF2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 18:18:08 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-7dbb6b95836so17384747a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 11:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778782685; x=1779387485; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Maojrdkd+5w2XWqqGc/P00CzPWv+6mS70oBhALVRgBY=;
        b=d8jUU6jkx2yIpbKf3Z52Mf3vCCa1CQ75XwoSOcwb12fTuY2005rmuKLraJUfLR7jEf
         YXqcwAVORnHTEsrAJP2KxYDbjuoV4nyKfz/CsfjNji+boCBcNNW5bExyHD6Oz7jRmtGA
         e+02ED2Yr+8Puc1eESVaADBjYbqLb6gBGhmzU7Zhpp3nbbV2P9jZ/Gbgvr2atdYf/0Fg
         2U7X39Gll+uy8eyeAbSGvbNHkq2Aq7t2PMLE/SjNrsb7SNnNeX22CI6UDWxe/2m+lDfb
         M+kCJpa/vwhHlLPym+S0UjEhddSD6OT26la+bbHrGm5zNSMvjWSdwV8Pgs4S79sTy7+d
         Llug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778782685; x=1779387485;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Maojrdkd+5w2XWqqGc/P00CzPWv+6mS70oBhALVRgBY=;
        b=dzSrZ8+nzRYxHDTSUFZ2bFeyRQnIXcuiq3kJmVJUl9ThaqZqPRs/S37YkqgqZI6Nwa
         k2bnlqPxYrN4WHfUox6PFxtdJhiopBc9jvnb/Zy8mT+bsg8c/r7Xq1WoXP3cubpYrwlV
         IH3K481fFhRGVrUV/0Pqm1Fx4xXKb+mhhV9/6Enj7U+pGjgYAHdYIkJS1Bbi6tkY9fso
         KrrS8pNmD0A+hBMhJe4wvcptltElafQ4Qqi7rCuPpx28mFtlgxbBAreC9T4jaU9Hq9hz
         KLa4YKBWh4h5jdoy1tiwnBpdypqsUs4S6TP1y+9Q4t4UpohGKLUHPmoBQCEyFqjkIhF0
         4ZXg==
X-Forwarded-Encrypted: i=1; AFNElJ/SeY5sqEBn+g3W8vgvo72Pj1l9Qjdi/BCaoEuU2HXZbA2I5F+87UZPd+R+eviU1ZQnf3tPIwfS76owd2Zqffcr@lists.infradead.org
X-Gm-Message-State: AOJu0YwDm9L1Hp/FgAjm7lACn6MT7LtQQDX+k3gAzEEeXqopp5EVg66u
	8Y4zTXaTd4kZtzRCll9asDX1ms/yBMXZDuDD/ybjDZcJu3Dn+UWcGNkF9hu3943tCVZknD/xvBO
	miWqUpyUgqL+wwWXHFQCNLbM1kA==
X-Received: from iobhm2.prod.google.com ([2002:a05:6602:f42:b0:973:4a64:ab4c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1746:b0:684:bf61:ed25 with SMTP id 006d021491bc7-69c942e1b26mr401033eaf.19.1778782684266;
 Thu, 14 May 2026 11:18:04 -0700 (PDT)
Date: Thu, 14 May 2026 18:18:03 +0000
In-Reply-To: <agQsM7XFsbxbFRLO@kernel.org> (message from Oliver Upton on Wed,
 13 May 2026 00:45:55 -0700)
Mime-Version: 1.0
Message-ID: <gsnttss9c0tg.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 08/20] KVM: arm64: Add Partitioned PMU register trap handlers
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_111807_256926_0DAA1C08 
X-CRM114-Status: GOOD (  16.87  )
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

Oliver Upton <oupton@kernel.org> writes:

> On Mon, May 04, 2026 at 09:18:01PM +0000, Colton Lewis wrote:
>> We may want a partitioned PMU but not have FEAT_FGT to untrap the
>> specific registers that would normally be untrapped. Add handling for
>> those trapped register accesses that does the right thing if the PMU
>> is partitioned.

>> For registers that shouldn't be written to hardware because they
>> require special handling (PMEVTYPER and PMOVS), write to the virtual
>> register. A later patch will ensure these are handled correctly at
>> vcpu_load time.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>

> I'd prefer an approach that provides a single accessor helper that takes
> a vcpu_sysreg enum as an argument and internally handles the dispatch
> between partitioned and emulated PMUs. That goes for all of the PMU
> sysregs.

That seems ugly to me. It'll need a giant switch or two to re-dispatch
to the correct sysreg handling when we were already dispatched courtesy
of the function we are in.

Are you thinking:

single_accessor(vcpu_sysreg)
{
         if (is_partitioned) {
            switch (vcpu_sysreg) {
            ...
            }
            return;
        }

        switch (vcpu_sysreg) {
        ...
        }
}

or I could do the switch on the outside and duplicate the is_partitioned
check but that's the same as what happens now with extra steps.


> This will help you reuse some of the PMU emuation code that you'll still
> need for things like nested...

I'm not seeing what you mean. Could you explain further please?

> Thanks,
> Oliver

