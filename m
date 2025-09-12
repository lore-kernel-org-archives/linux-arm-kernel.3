Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB80CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Me3gQ2+XLChgmuRgGxhLuD7lEdljJYpRCmXxWniexUs=; b=pfqYqGjXE3D/kIPbp8Ptiu8eEo
	X3MBeYUiCnl5DhYDStC2qM0lazULOOqtF3rauWWTGMop8W2aPwBfuPHOpaPi+iJMIxJ8gsoieZoss
	hsvsC+3mjWNakwrf47z9K6u8LX/3/6+Vfnqk3tCDiCttQ/eEFEq8l0IuowhRAA43XIy5c0+1Z6dVJ
	xoQwovT1LetR5u2zlikdSNQCaS6/pueFHGmFzDjr35Vb+2773UmnDBfxNB8UnSDUz13CSjCFjBfjA
	ZJBdePcKAkVeTQxb3bUdJtsgyO/oWdOMxCf/raU+aB+FFKV5s80ZB7Xq8zDRCvq6mlq7MqnL7j741
	TjBeVVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux22N-00000008u8q-2gZu;
	Fri, 12 Sep 2025 11:33:55 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux22L-00000008u7W-0AH5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:33:54 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-327f87275d4so1821458a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 04:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757676832; x=1758281632; darn=lists.infradead.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Me3gQ2+XLChgmuRgGxhLuD7lEdljJYpRCmXxWniexUs=;
        b=hzfusLCWGAFtaqUeVPH4TantEx7g7/MTWFLxKJcF/g/tx5QpPOS/aAouPs/l1eYX2U
         VomTMinC67AyJriiA33xPRNw/byBEwpchyCfpXLEz3UgW4ZPC+v2NITMimAjWJZG5bKT
         /QPYwrdC2V3oh7Y2WM0wiGvNRFR8o9TAwSmRTH9qeqERLs+UXa2ocgfXZkrceYXRLUUc
         b7GErB6wUtvrZ3pOs4uPaL2ESGIu0yliX3CZxc5xa8xO8SKuTFY1YvPzuE3B8j9pFGQ6
         SrTK6mrkcaU3rY1Cs2rr11mAo3hf90dTnhfxYtS0FLW1PHHpcoB/ezFyohZ/R8y4t/oN
         HuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757676832; x=1758281632;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Me3gQ2+XLChgmuRgGxhLuD7lEdljJYpRCmXxWniexUs=;
        b=gM1io/QV3ud2C62tCvsKFBudfLIDWJK7XmyaUlEKRcdxJ5zUwZRfb44LA7sn1l5lzR
         UL23JtQnaPiN2i9hMGj7m8w08c+gDgtls/GSee9QF6gblZbyMZgvkL5D+vS9C0ou6jMQ
         oF0cALMMQnatVbXhfK50Gkt0AuvyirOZQ+MXhuPmMBxC7LKqPuCQT5wVbZq4Sj8nztnF
         YGkOfvcZwoZPa0NwSb4Uh1b6FkowZNuXr5J1CHi0GeSiwgb3HPv6RilIaexlJY/XgGE9
         e1nnn0BP2pM6fq7lko9WBwOXnaXstVS6nuoOxEMF3Z9mDLtMeJ2LSBIYEMmNebQB64vr
         CCGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVre1XfIPVFb4OWnoNOiuZmODAG+lR99KNUWLqv4KXd6zcHUppMc/K5PsY0hndbv1PNQBDSNQ7VXN7je1e5vA6l@lists.infradead.org
X-Gm-Message-State: AOJu0YxZoQywuFNJ9To5HCU9pMVACo+X5WhxyOcjlVH7fTIifapNUGuD
	ToIATmYZWmqquNi9lbqHrx8f0xQtV4K9+OHzRpmboqTVvqa91+OzY3MaGfifWDvI
X-Gm-Gg: ASbGncvJIVdAYI9I95iDRPSwArz/YvY+CKIbBd27DfThDa3qy1tl4KfkBFSTDob8YZt
	N3rgy5z7ExNlJA+eRWJ9El3GAyND+y8ej7MprBkOUZP1JjsVtpquLIqfeq9CZsXrYyiJ78YX9N4
	bPDN2ii3vdPqDrg1Miq0nLjXpPIlf/FZkOVdC3MufzGYsDkcJFPsqBsYFMoymxz3WvrLctfa8PA
	3Cbn0XERYLQ38RP1eWSkeqH0OGmAWUEX3Wx4X2O1PCRNsqwe+buSNb/Da+COwQSPj5N4d+8p2Zx
	ZdI14QfVW5q4xqyhUkL18PDa604mQPPAgGEhZISJh6/L01sgvsoS9SYX6NnSAHhEZwaq5XGSnzS
	NkejhFOMBYprrIpCWstiwgpitwnQdP241dafj3f60NgxfnuFZECSESjm8Fze2Tju0htRCPKRdJ9
	tGPa8lzak=
X-Google-Smtp-Source: AGHT+IG4CQOrsidgDKZqODfMcOoJgWe/C+OuZOd1ih4oVDYDwhAJqojGn09l0Bnkzu0cbpihXieC8w==
X-Received: by 2002:a17:90b:3889:b0:32d:5721:df96 with SMTP id 98e67ed59e1d1-32de4f808f5mr2582134a91.32.1757676831756;
        Fri, 12 Sep 2025 04:33:51 -0700 (PDT)
Received: from smtpclient.apple (p73a27f58.hyognt01.ap.so-net.ne.jp. [115.162.127.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd7ceecfasm2203933a91.7.2025.09.12.04.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 04:33:51 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] PMCR_EL0.N is RAZ/WI. At least a build failes in Ubuntu 22.04 LTS. Remove the set function.
Date: Fri, 12 Sep 2025 20:33:39 +0900
Message-Id: <3FEB4D87-EEAF-4A21-BCBC-291A4A7C2230@gmail.com>
References: <867by4c4v1.wl-maz@kernel.org>
Cc: Itaru Kitayama <itaru.kitayama@linux.dev>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 K Poulose Suzuki <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>
In-Reply-To: <867by4c4v1.wl-maz@kernel.org>
To: Marc Zyngier <maz@kernel.org>
X-Mailer: iPhone Mail (22G100)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_043353_081016_9FBF995F 
X-CRM114-Status: GOOD (  17.00  )
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



> On Sep 12, 2025, at 20:01, Marc Zyngier <maz@kernel.org> wrote:
>=20
> =EF=BB=BFOn Fri, 12 Sep 2025 09:27:40 +0100,
> Itaru Kitayama <itaru.kitayama@linux.dev> wrote:
>>=20
>> Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
>=20
> This isn't an acceptable commit message.
>=20
>> ---
>> Seen a build failure with old Ubuntu 22.04 LTS, while the latest release
>> has no build issue, a write to the bit fields is RAZ/WI, remove the
>> function.
>> ---
>> tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 6 ------
>> 1 file changed, 6 deletions(-)
>>=20
>> diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/to=
ols/testing/selftests/kvm/arm64/vpmu_counter_access.c
>> index f16b3b27e32ed7ca57481f27d689d47783aa0345..56214a4430be90b3e1d840f27=
19b22dd44f0b49b 100644
>> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
>> @@ -45,11 +45,6 @@ static uint64_t get_pmcr_n(uint64_t pmcr)
>>    return FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
>> }
>>=20
>> -static void set_pmcr_n(uint64_t *pmcr, uint64_t pmcr_n)
>> -{
>> -    u64p_replace_bits((__u64 *) pmcr, pmcr_n, ARMV8_PMU_PMCR_N);
>> -}
>> -
>> static uint64_t get_counters_mask(uint64_t n)
>> {
>>    uint64_t mask =3D BIT(ARMV8_PMU_CYCLE_IDX);
>> @@ -490,7 +485,6 @@ static void test_create_vpmu_vm_with_pmcr_n(uint64_t p=
mcr_n, bool expect_fail)
>>     * Setting a larger value of PMCR.N should not modify the field, and
>>     * return a success.
>>     */
>> -    set_pmcr_n(&pmcr, pmcr_n);
>>    vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0), pmcr);
>>    pmcr =3D vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0));
>>=20
>>=20
>=20
> So what are you fixing here? A build failure? A semantic defect?
> Something else? What makes this a valid change?
>=20
> Frankly, I have no idea.
>=20
> But KVM definitely allows PMCR_EL0.N to be written from userspace, and
> that's not going to change.
>=20

Then I=E2=80=99ll drop this patch.

Thanks,
Itaru.

>    M.
>=20
> --
> Without deviation from the norm, progress is not possible.

