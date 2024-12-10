Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B269E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J7kgWgBG7zDr62P+Eop70r3Co12mfVgVIEm97IsjBc=; b=RO2rV4cIEQ9u6RMJk//0Pit9Cx
	27SxoS6gdi+m/TxQxjgfyZmPxtS/PmnTwSH4y7hXo5KeZbCiK4QQWt+7KkEjRlcFCtLc6Yzuw/y0+
	X1ny2bzdAnCMwrXfdP7QqnOVyUc4qb5sBkWfdzSU7QmLkB3HAVMSyhdDlNdriJcqUrQOizxIYKl1N
	qK11ucz4nv2LJrbY9/QBgD1pSkyfRtDhc8DgLlE+dW+Th1E6FeQJYl51waAzFAkC3NWj0GvucakkI
	dd2UIE0cQpu9ztgcB616wWMo1l3lX18qmiNmVKKh3tOuIBs7NRcFkVuWz3VcxjkzCCIUUbpuvwES1
	ri5y43vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKosm-00000009ndm-18cl;
	Tue, 10 Dec 2024 01:17:48 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKorh-00000009nQx-0iwV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 01:16:42 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-725d9f57d90so1711731b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 17:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733793400; x=1734398200; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J7kgWgBG7zDr62P+Eop70r3Co12mfVgVIEm97IsjBc=;
        b=Nl3/75YekVhzhzYV32A9jDrzA8RpITkhemNUT6U3K6IECTGD/sHnNKVRPsrMh+TZro
         BDZdfJmz7Jm90ddItHIt3LQc8NcCTp/ptsQx0/qv/6af4WP6CgOYjv3vqFOq8ODW2dRn
         5O1DdC27bcUiikntcU6dVuSVZDyLaZZrqNfRalpJr13xYCHqNA7sSjg7zIYagnTeD2KA
         oKHsmiDaDI71riWPt2xj0XbGWmNlbUD/HytlUPdf54yNSLoOwToTd2okCHdeiFlDmOwU
         Mtyg/dWbxLA2lgqps0+KER/0btb4JAbjn0NBxK25W5tIn7aLJ4LUvXm2Jj8ltSX3+LHb
         zf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733793400; x=1734398200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J7kgWgBG7zDr62P+Eop70r3Co12mfVgVIEm97IsjBc=;
        b=huVHfdC5ABE92a5BCSGXl8G38SLtEdkjmWnzjFDV8F+1K5sO65HYqiBNFEMJI3wDx8
         P4ondBwzomJpWihkPQ0L/3wQBZ1sOvqBkwbLj6pcw2DujRgUX6k4N7CyJqa5r9ZPNY+v
         uZMjdQV3VlUWF5xulB346gw0vIGdfs3uoO++EVYjCtBdD94WqZRmosLMs0VYaOiXU2R3
         P+jZHuv3YYsJA8yMjNz4Fz56HYON92I3pNjQgGMz4uRMt7TEcCeUjn5W26bs5H+dHmq3
         Lir2YRIwz4MIrlKDUSmoEETIKxXhoInVnlko9YN//EJexXLXgvEWjp8dHx/+1K1r73UR
         iaxA==
X-Forwarded-Encrypted: i=1; AJvYcCWL6tzK9lYINdrkq2OD5rF7FY0FCGg1xfzBX/7ekaDnb8tpx0qmmw6af/5DCkd8VLvvbIne7WDqaoQAQ5ZAp/Ll@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5LzZv6PlmbnEllmJT6MQb9e3Xe2GFI1TlSUZK+2zgqVt6eh14
	McuKLXqexQMwQSP/eMfeYXZkcvxZLN/ZCQmu9u9rCXLDEqpttKQS0goV1HEPh1CUM2ze9P6ZK8q
	IeYqOdEVB8QB03tSNyGAl2Dh8W/RAvp19Y/zhJA==
X-Gm-Gg: ASbGncu3K35MgGqsZSj5RxCQXTTeoXuWAgj/NVobkRCsQG1hthCXNv82qe896o6Lz6s
	JY5kmai77lsyi2vg+kBRLNc9PT+FlNc2xHw==
X-Google-Smtp-Source: AGHT+IFHWG7f/jrba0MmMIk74bj4FLvJsvbUDpvVWZRJa41JQQnsmT4zcuqnPTsbFg31v4fSgu0FSerblu+cl90/X5I=
X-Received: by 2002:a05:6a20:12cc:b0:1e0:ca95:3cb3 with SMTP id
 adf61e73a8af0-1e18713c3d0mr22123398637.37.1733793400400; Mon, 09 Dec 2024
 17:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-7-a4f9691421f8@rivosinc.com> <8dc7e94c-4bf2-4367-8561-166bec6ec315@sifive.com>
In-Reply-To: <8dc7e94c-4bf2-4367-8561-166bec6ec315@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 9 Dec 2024 17:16:29 -0800
Message-ID: <CAHBxVyF73ZEuPk+skhr6jJbdUYWS6cm4=vneV8jrd=7Lh0H6vQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] RISC-V: KVM: Implement get event info function
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_171641_422061_0C71C9FE 
X-CRM114-Status: GOOD (  27.71  )
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

On Mon, Dec 2, 2024 at 3:02=E2=80=AFPM Samuel Holland <samuel.holland@sifiv=
e.com> wrote:
>
> Hi Atish,
>
> On 2024-11-19 2:29 PM, Atish Patra wrote:
> > The new get_event_info funciton allows the guest to query the presence
> > of multiple events with single SBI call. Currently, the perf driver
> > in linux guest invokes it for all the standard SBI PMU events. Support
> > the SBI function implementation in KVM as well.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
> >  arch/riscv/kvm/vcpu_pmu.c             | 67 +++++++++++++++++++++++++++=
++++++++
> >  arch/riscv/kvm/vcpu_sbi_pmu.c         |  3 ++
> >  3 files changed, 73 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include=
/asm/kvm_vcpu_pmu.h
> > index 1d85b6617508..9a930afc8f57 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
> > @@ -98,6 +98,9 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu);
> >  int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsig=
ned long saddr_low,
> >                                     unsigned long saddr_high, unsigned =
long flags,
> >                                     struct kvm_vcpu_sbi_return *retdata=
);
> > +int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long=
 saddr_low,
> > +                               unsigned long saddr_high, unsigned long=
 num_events,
> > +                               unsigned long flags, struct kvm_vcpu_sb=
i_return *retdata);
> >  void kvm_riscv_vcpu_pmu_deinit(struct kvm_vcpu *vcpu);
> >  void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
> >
> > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > index efd66835c2b8..a30f7ec31479 100644
> > --- a/arch/riscv/kvm/vcpu_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > @@ -456,6 +456,73 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct k=
vm_vcpu *vcpu, unsigned long s
> >       return 0;
> >  }
> >
> > +int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu *vcpu, unsigned long=
 saddr_low,
> > +                               unsigned long saddr_high, unsigned long=
 num_events,
> > +                               unsigned long flags, struct kvm_vcpu_sb=
i_return *retdata)
> > +{
> > +     unsigned long hva;
> > +     struct riscv_pmu_event_info *einfo;
> > +     int shmem_size =3D num_events * sizeof(*einfo);
> > +     bool writable;
> > +     gpa_t shmem;
> > +     u32 eidx, etype;
> > +     u64 econfig;
> > +     int ret;
> > +
> > +     if (flags !=3D 0 || (saddr_low & (SZ_16 - 1))) {
> > +             ret =3D SBI_ERR_INVALID_PARAM;
> > +             goto out;
> > +     }
> > +
> > +     shmem =3D saddr_low;
> > +     if (saddr_high !=3D 0) {
> > +             if (IS_ENABLED(CONFIG_32BIT)) {
> > +                     shmem |=3D ((gpa_t)saddr_high << 32);
> > +             } else {
> > +                     ret =3D SBI_ERR_INVALID_ADDRESS;
> > +                     goto out;
> > +             }
> > +     }
> > +
> > +     hva =3D kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writ=
able);
> > +     if (kvm_is_error_hva(hva) || !writable) {
> > +             ret =3D SBI_ERR_INVALID_ADDRESS;
>
> This only checks the first page if the address crosses a page boundary. M=
aybe
> that is okay since kvm_vcpu_read_guest()/kvm_vcpu_write_guest() will fail=
 if a
> later page is inaccessible?
>

That's my assumption as well.
We can invoke kvm_vcpu_gfn_to_hva_prot in a loop to validate all the
pages starting with shmem though.
The difference would be the error code returned
(SBI_ERR_INVALID_ADDRESS vs SBI_ERR_FAILURE)
which the specification allows anyways.

Let me know if you think KVM must validate the entire range. I can add in v=
2.

> > +             goto out;
> > +     }
> > +
> > +     einfo =3D kzalloc(shmem_size, GFP_KERNEL);
> > +     if (!einfo)
> > +             return -ENOMEM;
> > +
> > +     ret =3D kvm_vcpu_read_guest(vcpu, shmem, einfo, shmem_size);
> > +     if (ret) {
> > +             ret =3D SBI_ERR_FAILURE;
> > +             goto free_mem;
> > +     }
> > +
> > +     for (int i =3D 0; i < num_events; i++) {
> > +             eidx =3D einfo[i].event_idx;
> > +             etype =3D kvm_pmu_get_perf_event_type(eidx);
> > +             econfig =3D kvm_pmu_get_perf_event_config(eidx, einfo[i].=
event_data);
> > +             ret =3D riscv_pmu_get_event_info(etype, econfig, NULL);
> > +             if (ret > 0)
> > +                     einfo[i].output =3D 1;
>
> This also needs to write `output` in the else case to indicate that the e=
vent is
> not supported; the spec does not require the caller to initialize bit 0 o=
f
> output to zero.
>

Sure. Added.

> Regards,
> Samuel
>
> > +     }
> > +
> > +     kvm_vcpu_write_guest(vcpu, shmem, einfo, shmem_size);
> > +     if (ret) {
> > +             ret =3D SBI_ERR_FAILURE;
> > +             goto free_mem;
> > +     }
> > +
> > +free_mem:
> > +     kfree(einfo);
> > +out:
> > +     retdata->err_val =3D ret;
> > +
> > +     return 0;
> > +}
> > +
> >  int kvm_riscv_vcpu_pmu_num_ctrs(struct kvm_vcpu *vcpu,
> >                               struct kvm_vcpu_sbi_return *retdata)
> >  {
> > diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pm=
u.c
> > index e4be34e03e83..a020d979d179 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
> > @@ -73,6 +73,9 @@ static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *v=
cpu, struct kvm_run *run,
> >       case SBI_EXT_PMU_SNAPSHOT_SET_SHMEM:
> >               ret =3D kvm_riscv_vcpu_pmu_snapshot_set_shmem(vcpu, cp->a=
0, cp->a1, cp->a2, retdata);
> >               break;
> > +     case SBI_EXT_PMU_EVENT_GET_INFO:
> > +             ret =3D kvm_riscv_vcpu_pmu_event_info(vcpu, cp->a0, cp->a=
1, cp->a2, cp->a3, retdata);
> > +             break;
> >       default:
> >               retdata->err_val =3D SBI_ERR_NOT_SUPPORTED;
> >       }
> >
>

