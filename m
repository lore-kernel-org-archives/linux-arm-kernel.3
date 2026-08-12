Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7406C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 03:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbAE3LPUDSURazUhNIkFniQu501TuI9sZ6Nx1+2SCHw=; b=2ov4MMC3hGnDygbvni8rIRlfiG
	twEhHVr6SUZt/TMFIk7WuugQ3BKIhq0j/zQVeONYDPxPm0pcxDUzXR3Ua4D7ZqUfGhtjLbnaMYQn8
	28qu1ydRM0/lFdmWaAiKpfCtwZNZFhwVUbaS5xrCoBWdho493xzDcBbMmS0YuZ7EUxnrMjAv3nT1X
	pBVQtiBZ0djdqY3qml8E9u7ketv1TUZNEeNtKGFs3112VCtZ8td3l9vulPH4WqCv2RiaHQVFHu0uT
	lG7L9BkEAVfI6vEG8FbXY6V7WWNNBBsXvGiN5WfOwUsTmclLpIVWF5XaCwSTd/SEuwLStXPFpqQOa
	o6CZHGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzbB-0000000FLkP-2KKQ;
	Wed, 12 Aug 2026 03:25:49 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtzb6-0000000FLj0-0C00
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 03:25:48 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8f0e5e36912so2920106d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 20:25:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786505137; cv=none;
        d=google.com; s=arc-20260327;
        b=A8obZO6XXOLzeighU0jyEXAzswJrM4rpkipl0uNFIiLvLEDLB5u/GcIXHp8sJsHQKh
         Kcr6pWeVLUBMfDjh6D/rov4qO7bEvR2n6Rx6h9f1C4xjJAxcV5xK1OdIZt2M1C5QpMyL
         o7Ag4a4shs2euqwb1EKGwrAzI4ckaBiHuKMTIcKPiwwLnRFaxxIm4w18LUD5EA2xa2I5
         fCuoIhkgIoH3iWLYqIud11l+lO6leZayLR7eI6p7GCvZ2Qq+zzY1ZdOAJhXdBay/+RuH
         zUKiE0JoVsHXj3wPrfybTGT33sXhgvtm2FrYyiURaIScT4d3yThA4btDr0bFO1PWDOkB
         2wnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sbAE3LPUDSURazUhNIkFniQu501TuI9sZ6Nx1+2SCHw=;
        fh=QDOrTYfeAtpDq4TjCsR7RWI/0S/FLGsZszeFwXoBdUw=;
        b=NFy/pMIcXaIhsO/o4YOdjRwKHG0KCSALDs8XxDvXlluHwthhLncAFCk0jDzijLwnyv
         RNV2smAd44Lj9YDatH9GtmEIxcmSMbaZf2R6pMBzQD7y0IQXCavExDQBZi25Hr/XSDzs
         M0+Dg5a5sjOFGadYdN84TBdFvBIMD6VSPgoLUSRgK+fFaQs8aAbrvDIaQBVKbKB6OSIA
         Mu9qXsoxli3ZpyDSQpmcRdFBbiZ3vy0MEfSWmgZH0saVPJwnm2lTz1KbB85PRNPvU7Qq
         S3x8/8CBhZUWMvqShI1rTQQw1JQWF8Cm+l+CB6vZsRFKkRgBoU9RD+5hZh/XtvFGVBNr
         Pakg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786505137; x=1787109937; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbAE3LPUDSURazUhNIkFniQu501TuI9sZ6Nx1+2SCHw=;
        b=gZ6MwATpPuV4Ag3skYJPCBCawsxkvz/ps60nPLJAGYL0ZV5msjSqxEuYCErJCw44DE
         v8qcrsDPEbeQlSRfc9fBwSdKtzdCLCLWDQbT367rcZXLB1NRrozWbbHdB5LqdgxVnAIH
         a8ln1j3B+f56Op0ly2iZ98qOVXV4Xc+DJ5AJoBUrB6LrDUlLW95sxIEq8v/xB9+yuFgM
         ZIGHeIjjO0oOHq+ljlSkcjSoC7KQMfFxiB4jevEPgsrfzJvifiMm0UUOj93FmYzGAMd0
         qzbI9GkUREr3hoYV/ihlRUpVSu+DmojU3OYEpiU58bz5F8s0ZR/RBDbcnGm8zyovSK3G
         tFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786505137; x=1787109937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbAE3LPUDSURazUhNIkFniQu501TuI9sZ6Nx1+2SCHw=;
        b=Dod2X5da3qo//pp6CT8udLPVPR2TvGqGpIJl0eUPLWJupavsCFyACYv3S8We93kJ85
         zPXdjHC7pOYoM+8F5VgUbV5ZlTM+tSk3+n9rl8Lw7ZFU+B3pL9tWLDsl8HcDiEH6hWaO
         i6/B4ffADSpWWEuKDWg59Q1kGEduKGw7+Phl3fxZU5zoK+jw5umFjQaMMhFQeJCZC6k5
         Yylkifx9NjUY+LLRhj29y6Qgscu8MR4+YPjqwAm8z6xDeiMPsJG7DfCxEgcMJ6ZB2QF1
         MZe7FMaNOOqherI5k6ydI2akIxzW8QoloQtLjhQHqrQZv6bg/rmylzDQahw+DTeF3aSP
         08+g==
X-Forwarded-Encrypted: i=1; AHgh+RoE3cV1fXOCwp7J4Jh8mdfSNxTqUp5o3ecMpVWB1NSNyv9Aw8+FJu1P7P87QkaqDEYp9h+gX52Rdc1OVDc6pdwG@lists.infradead.org
X-Gm-Message-State: AOJu0YxrTHpJmG+S/9yM2Qe7KVIh2Z1nlhkpLdpF11R2vF/IUltKxXAu
	hF6fSI3STG8DF2+VK3JQY3/sdiOgDlp22fJcsSVGAMxpWd64rXOWkepa2sv5eLuSC95FadezRBf
	kQyMo9ZH5k/f31mT2pgHL1KxBd16VJSUcAi/nUiqH
X-Gm-Gg: AR+sD11syHk4/Z7nb1lRgmu6/hUtHXi433rf00ev0B9Ni2jIw3bK22flxX8AO+Zvlte
	Uqdx4FJTUkzZ4ExUebb3TKIhpUbdkkzWU+NVg3pr1piX7LfSkcXKJNcvASkr8ezWybyGixEahMs
	UF/xrwfRxCX80xWxvT5AKjyhcuBToEXlHZk79oocQT6qqu0DyiJBo5Js9rXvuuqc3OWpGJxvHcj
	mezpE4WPwOCoyvSrVJ8rACbYrrd5CcSZ3vlN8Knmr5bHqXy+7o6cYG1L5Ght1FpABwjLDfqHGhb
	xgeepxzRWhOUdEl4z5pdvC8RJS3aOtUCy2eJsr9SlwxDV4ZrX7dfAZs4
X-Received: by 2002:a05:6214:230a:b0:907:c056:d63a with SMTP id
 6a1803df08f44-90a6ffd0170mr15698606d6.20.1786505136817; Tue, 11 Aug 2026
 20:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260803134403.80630-1-steven.price@arm.com> <42170467-fe36-4382-867f-49bdc6a7bc9a@arm.com>
 <d0ffbcb5-0cca-4d1e-9788-6b430345fa9b@redhat.com> <5e86232a-89ed-40ff-89e2-9e48fbf9554e@arm.com>
 <e2894206-7470-4606-b9ac-eedc8d2bdaf3@redhat.com>
In-Reply-To: <e2894206-7470-4606-b9ac-eedc8d2bdaf3@redhat.com>
From: Alper Gun <alpergun@google.com>
Date: Tue, 11 Aug 2026 20:25:25 -0700
X-Gm-Features: AUfX_mydHvtdt9zTnMQDxMEfQcPxjhamET6J18JMLKXgxKIfjEME9sN1_LoiXoQ
Message-ID: <CABpDEukGY+ctSi6wHAaC7o4pGmastX_Y18K2_VYDhNME7TF+wQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/45] arm64: Support for Arm CCA in KVM
To: Gavin Shan <gshan@redhat.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_202546_771351_2D934A05 
X-CRM114-Status: GOOD (  15.61  )
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

On Tue, Aug 11, 2026 at 8:08=E2=80=AFPM Gavin Shan <gshan@redhat.com> wrote=
:
> As the following calltrace indicates, -EAGAIN is returned from tf-rmm::up=
date_ripas()
> because true is returned from s2tte_drain_pending() for the S2TTE corresp=
onding to
> IPA 0x80000000. Linux host received error (RMI_ERROR_RTT, level=3D3) in r=
ipas_change().
> Upon this specific error and the IPA range [0x80000000 0x90000000], find_=
map_level()
> returns level of 2, and realm_create_rtt_levels() returns 0 without popul=
ating any
> RTTs. After that, rmi_rtt_set_ripas() is re-executed and the above loop s=
tarts over
> again.
>
>    Linux host
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    kvm_arch_vcpu_ioctl_run                     // cca/host-v16
>      check_vcpu_requests
>        kvm_check_request
>          kvm_rec_handle_request
>            kvm_complete_ripas_change
>              realm_set_ipa_state
>                ripas_change
>                  rmi_rtt_set_ripas
>                    SMC_RMI_RTT_SET_RIPAS
>
>    TF-RMM
>    =3D=3D=3D=3D=3D=3D
>    SMC_RMI_RTT_SET_RIPAS                      // tf-rmm/topics/rmm-v2.0-p=
oc_3
>      smc_rtt_set_ripas
>        s2tt_walk_lock_unlock
>        rtt_set_ripas_range
>          update_ripas
>            s2tte_drain_pending                // true, returns -EAGAIN
>
> The problem is the pending-bit for RTE corresponding IPA address 0x800000=
00 isn't cleared
> when SMC_RMI_RTT_SET_RIPAS is invoked. I didn't figure out how this bit i=
s set and why
> it's not cleared in time.
>

Hi Gavin, Suzuki,

I think I ran into a similar issue on rmm-v2.0-poc_3 last week.
This looks like a potential RMM bug: could bit 32 be part of the physical
Address (if PA >=3D 4 GiB)?

It seems s2tte_drain_pending() in lib/s2tt/src/s2tt.c checks bit 32 without
checking whether the descriptor is valid or invalid.

In my testing, guarding the drain checks with a check for S2TTE_INVALID see=
med
to resolve the boot hang:
--- a/lib/s2tt/src/s2tt.c
+++ b/lib/s2tt/src/s2tt.c
@@ -1701,6 +1701,10 @@ unsigned long
s2tte_clear_drain_pending(unsigned long s2tte)

 bool s2tte_drain_pending(unsigned long s2tte)
 {
+ if ((s2tte & S2TT_DESC_VALID_MASK) !=3D S2TTE_INVALID) {
+ return false;
+ }
+
  return (s2tte & S2TTE_SW_DRAIN_PENDING_BIT) !=3D 0UL;
 }

@@ -1730,11 +1734,19 @@ unsigned long
s2tte_clear_tlbi_pending(unsigned long s2tte)

 bool s2tte_tlbi_pending(unsigned long s2tte)
 {
+ if ((s2tte & S2TT_DESC_VALID_MASK) !=3D S2TTE_INVALID) {
+ return false;
+ }
+
  return (s2tte & S2TTE_SW_TLBI_PENDING_BIT) !=3D 0UL;
 }

 unsigned int s2tte_drain_handle(unsigned long s2tte)
 {
+ if ((s2tte & S2TT_DESC_VALID_MASK) !=3D S2TTE_INVALID) {
+ return 0U;
+ }
+
  return (unsigned int)EXTRACT(S2TTE_SW_HANDLE, s2tte);
 }

Sharing in case it helps.
Thanks,
Alper

