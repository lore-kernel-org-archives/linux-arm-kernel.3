Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71E0C61DE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 21:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvoT0ABXJ37oRXJzczpVIrP9vDVAFqUkQqaM10ticEQ=; b=GnacWrCi293At3s5bxpN/QqxHw
	CxnNqoCb2+NOHWLFPESW061nTYRpxyfeUh/I/kHSuaIKEhTcYPjJ3E+AMyv+tVN4Z9URtScQoThhr
	+Xq+UTNh9aoSqbJDn00rGKZ2UKWWt+Ydr8jovpX474rGRk/Vz30obJOOv+rb7kMajIgBycFBDBkDZ
	J6NS+fIo9aavLAbU9/lR44Mq8vAH26Gm9ExkEdYXswf4Uw4M5ktr+X2RfQNzq3wLXZH6gpe+34N+M
	ltEGPSgx3+pKUQql/i4gExwuEeK+PNrUAK7l0ZfBJQKC+ThW4CmNF3497J1ZuytD45qEYijvLuRbX
	t1m+cNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0moI-000000086Ad-0H3R;
	Sun, 30 Aug 2026 21:11:26 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0moG-000000086A5-0MJq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 21:11:25 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-52fac937235so188921cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 14:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788124283; cv=none;
        d=google.com; s=arc-20260327;
        b=HSvv8qTPNZ7scsX/AQ/DsW+AOPQ1i21Ek4E/zxUVMdIijlAImTNBMRmWQ7QfGlu+Ed
         8CfyalxPwJPtqM16eM7YTh6v2K2xQvsKiPWVQou2Le5InMiQaIkfUbImLehapxzHZ8tO
         F3h8A/ggPqUUw87p2zZg2YnOpCOJ3iZnHAmWDtNf1Mkq+G1MGWVvanT/QtPr1HWiPXUJ
         JEAVhuE4IVNGDH5rSYQJnt03Uo5EDXRv09NS0g/qCVv6miqsMrPfaiurOUFdEpPJTkuT
         KVbj6UYvUJXgsHoR0UCpVeFr3rW3d4UUlC0PGi22by7DMoOErVV2cwv7hsaeUDFYhRpa
         +R3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LvoT0ABXJ37oRXJzczpVIrP9vDVAFqUkQqaM10ticEQ=;
        fh=IkAWRp/N8NjH1NrGHJzUJ39FSTzbCHPCl6Mxgi2sZhc=;
        b=D4uuTDuGrhoteeZzlFf9At3tqYBIKgHujzxaSXGydS6oNPXh2Z0jkghNKeH+fMerR8
         pYRX29c6qT9zwsEpnLKnEp9ZRidqlbvQujenRvyGb5C7GfBJ3r8Gf3WLA2M5U/c3m1H6
         +2C8ETESxOG5oev70RaykSMFnFaRIaL6PoYd75EWY/rt4oQblmGhK4Uodarnos68hniI
         v+aXpareG7E1OWuJUTANd+f2otlSrN48RCKl4f2uMJ12JVqZoPKKEzwtam9T5bQ5OL9K
         irG0n2sKt5zeUoQ4rb+GVSEHuw3TC/wdr3Gqy4YI1SMAthbNzzwm4ZMBoh8SCFSN6Lf0
         tX7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788124283; x=1788729083; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LvoT0ABXJ37oRXJzczpVIrP9vDVAFqUkQqaM10ticEQ=;
        b=n2x+20rapW0Rnj5ZBKlxQjLRN9Jr2iqCl6wrfIg3QsyEb7Ky/ilTLNfljR1TjatAen
         iBolBALLhCCDkQfnNGwOwJm5Yx7R9PIhH9g/QphnRpMfXkQzC+MhR3zNXDSCjE/hsAPo
         Fz3TlK6qCDiSGBnFSiJ0JpDgJ31O9c9xUIAjjh2LuFl1m4ajW0aj7KBa7lVsPLQZWg5l
         YXQAX9mUASTMuwkHYhokuKJh/B9eVAQZb8P4ojfgHQkVhAxHdNgZEyEQWayYrwuZXtBm
         F3Qt40LE6o7RJ7JzOgiXuChTDqWoZVwcFbFpWSeE9CUsN1oUuTVr14U9RrNo/NnACQf2
         idbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788124283; x=1788729083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LvoT0ABXJ37oRXJzczpVIrP9vDVAFqUkQqaM10ticEQ=;
        b=gOO6U2qY6D4oVgAIO6xy2XjkkNIcnB7Q/gyLuJmTMC7GjJzzz8D1KAzGryaR6xot/t
         VnOPwdf3Y1s8swO95RViy09UDMJdTrAwEGErV0mZdopwuP2EQ/4uAbg9qY/j5UvJyf/R
         tsRddjJKZBkDvXrkPICBtIqPlP1JIJsaPXdNqmmaExdv5VmIfR/uBGw9Ywd3Fgwb9nRl
         AODIhaIhcfc8EuLAyGBnLUjpblF5Y8DX6Yy4Pj+2DXSvHKWnfDkbpINqJvUnPJ+eFZD2
         kcALuXz8yDAOhhoSDrwc9AqoYfaq0peJ3xUDGCRTpOaTc06qvQAXVXOYVC7Agqp5TPKR
         H3Jg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0cY8sN/Nhv/JeCaW8wkD4V1EHTbI05omI+Lq2rqw0QgKOG6vrH+8l2DjGeZ5cBRQifa8hNulExd8xWHbwt7U1@lists.infradead.org
X-Gm-Message-State: AFuF++nVJ5UiSsAojqUZIG+KANYEcIhQeLF1TVcelVniMhDn42IbC4du
	YEu6AQHzvHL0IX+fJzIyICdQEo5IlwU/Dlicns9uh8Ipk7URoWnrpQQMrm0M1BzZ0Dij5er5CWg
	oYkwIY+cj4Wav/v0G2t3DXmN5U4E2a7V9yBxAPN/R
X-Gm-Gg: AR+sD10PrA2obD2KC2Xha1D9ik4REhD4i0KG2mu2RGrNsG7uytixYw11mrwBY9sH/aa
	slbhgvUlXktugUqPc3lDfik6xCNCBeW9rx/i4jl8Pe1qXuO1Rk7t9EhRx4BObLIv3anPG45/T/U
	XXqaQlTsPlNBCjrl20bYin43fU+JqQYPqCVh9YGtCfMvaOShUgVqFze+3VT+kptJtZrVBkQL55W
	aDAf7WYFzxnHu8ZFzpQhbAZAdZ8a5oIm4psu8qDdVPoyyRDFDoimUPyzNOhjGwE5WgfGi12i4nh
	OrUIumePzSF6t2CEZWebn5YROByzt6vd9dcgHX8feQ==
X-Received: by 2002:a05:622a:1826:b0:52f:4a75:f840 with SMTP id
 d75a77b69052e-52ff73abd47mr20315321cf.9.1788124282089; Sun, 30 Aug 2026
 14:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260728210928.1050849-1-praan@google.com> <20260728210928.1050849-12-praan@google.com>
In-Reply-To: <20260728210928.1050849-12-praan@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 30 Aug 2026 14:11:10 -0700
X-Gm-Features: AcwNN1WSE_2VKnc3OTfaU7trfJzE4w8fa_RgAfFK9wTt348qCgdtkmoNL21lY6M
Message-ID: <CAE2F3rAwUpepQ5UfXuGdDGUzjY+4Xo9ttjyOUKY=7xyyA41j+A@mail.gmail.com>
Subject: Re: [PATCH v9 11/12] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_141124_143668_EBF99457 
X-CRM114-Status: GOOD (  19.18  )
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

On Tue, Jul 28, 2026 at 2:10=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
> @@ -2386,6 +2407,34 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, v=
oid *dev)
>         static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
>                                       DEFAULT_RATELIMIT_BURST);
>
> +       /*
> +        * Use a non-sleeping get to avoid a circular dependency deadlock
> +        * with arm_smmu_runtime_suspend().
> +        *
> +        * When using a combined_irq, the suspend thread waits for pendin=
g
> +        * threaded handlers to complete. If the IRQ thread blocks waitin=
g
> +        * for the PM core, it creates a deadlock:
> +        *
> +        *  [Suspend Thread]                  | [IRQ Thread]
> +        *  pm_runtime_suspend()              |
> +        *    state =3D RPM_SUSPENDING;         |
> +        *                                    | IRQ fires
> +        *                                    | arm_smmu_rpm_get()
> +        *                                    |   sleeps (waiting for sus=
pend)
> +        *  arm_smmu_runtime_suspend()        |
> +        *    ...                             |
> +        *    synchronize_irq()               |
> +        *      sleeps (waiting for IRQ)      |
> +        *
> +        *           <=3D=3D=3D=3D DEADLOCK =3D=3D=3D=3D>
> +        *
> +        * A non-sleeping get allows the thread to instantly drop the eve=
nt
> +        * if the device is suspending, safely bypassing the synchronize_=
irq()
> +        * deadlock.
> +        */
> +       if (!arm_smmu_rpm_get_if_active(smmu))
> +               return IRQ_NONE;
> +
>         do {
>                 while (!queue_remove_raw(q, evt)) {
>                         arm_smmu_decode_event(smmu, evt, &event);

Sashiko has the following concern:

> Does returning IRQ_NONE here during transient PM states cause an interrup=
t
> storm or data loss?
> If the device is in a transient state (like RPM_SUSPENDING), this lockles=
s
> check returns false and the thread aborts without acknowledging the hardw=
are
> interrupt. For a level-triggered interrupt, this could cause an infinite
> interrupt storm since the line is unmasked on thread exit.
> Additionally, can aborting early here cause pending events to be permanen=
tly
> erased on resume?
> Because the thread aborts without updating the software llq.prod index vi=
a
> queue_sync_prod_in(), the stale pointer will be written back to the hardw=
are
> EVTQ_PROD register during arm_smmu_device_reset() on resume.

I tend to agree with the concern about the stale producer index.
Should we call queue_sync_prod_in(&smmu->evtq.q) in
arm_smmu_runtime_suspend() after disabling the event queue? Also, how
about printing a warning and returning IRQ_HANDLED if
arm_smmu_rpm_get_if_active(smmu) returns false here?

