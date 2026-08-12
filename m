Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C7C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpsE0CluZfRv1K7AmPiInqF31WCTjf8G43ue2nF02Wo=; b=uP/DhxypBdDCxAt/UjNYkaize/
	o/9V93g6Ytzu8ZUaeP+fd8zaU8Nwe7p+hmDdUgPC1SQ8X9XujhysDEMiIlbxCnZfUMzGQDOOtikHr
	GVyj/PW+Q6hdlriBsutLfFD+UdLb5BvPZB9yh64c2uQhmoNgMDgaH4tCtUS50Y2VofoQXdJ2+3iUg
	5q+ywz/5bELjaO+MbbFM7uZ/lg/ZugeC4XEIIJqOpn6SkQVENA5m1t1Om9JoPLvmmTyyUkYJMGwsH
	TakKDHLtNbbw+gWvy7u/OizM10xt+1mFOE12WbSM/jUHiA79s8EPUJ0sK+EkY51Lp7XurCfXO5HNJ
	VLN89JTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8Ho-0000000GCxQ-0oD2;
	Wed, 12 Aug 2026 12:42:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu8Hl-0000000GCwn-1lbb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 12:42:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB46fa3265824
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 12:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RpsE0CluZfRv1K7AmPiInqF3
	1WCTjf8G43ue2nF02Wo=; b=hc07wEyf9hg1I2f1Af4LWb4Jsokg20l/rGEwe5rl
	ocDQF+TuF3htAoKsm/rsEG5gAePzRqwEIesef6OglYL+cgmZ0oO0cHLEmkVy/NC/
	od/eWLXtRbBrFzncpV02t4rKejnDJWGEyoVVVKUk19lNLeaw0DOU0x9WzbZi3Rzq
	PE8ITNEdEC9/O6NBHLb9dYr94tuoY7LL7lEodPo0HX80XPltXc5Er7cRzXl6oTFA
	s7ZNlZ+M2j9erAShKWgECpMmULNV6/RNo75pXhKS6StbHpI9lDodoQC8F+eUWhdm
	Q/FJTupgpj2BCmus5KSB50yen1bgVEbRClGc4d91mRB61Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrku6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 12:42:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbef1d25500so45469a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786538540; x=1787143340; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RpsE0CluZfRv1K7AmPiInqF31WCTjf8G43ue2nF02Wo=;
        b=YTefXLnlagBoDIFNOMA7UkriX6N4oNQOMXj/MfVsaVUhAfkcEeawh/DN4AriN2rz/5
         uxeGjVJEGSVmyHYqT5iAOfBkEvr9tlQAix1QB9JWv/h3A9lEAk2tAJVpHwUczI4xIlzN
         HNWNYHujS6Fa6TVq+vPdsqtY5xEF6MGtEPgbOMAwjxL04OIanvHoZuvyZKeWpi7nqHqv
         qnlh1dWv0jH8Ps1qQYHm3bkPCRctzfmvvIPQpFfHPJ78wbpyNZlmj9+uufgRDl+wmrl8
         tAKnXhf6tf17X7g1M4ofSFjP4Tc84W3HRz383XSLOoai2o4hxE0p1Nmvf18dH4CemdPF
         rXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786538540; x=1787143340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpsE0CluZfRv1K7AmPiInqF31WCTjf8G43ue2nF02Wo=;
        b=cN4zH22VEpcKAj/mwfGV44TWERADlYdLwPv/M/AZTFdzRYSAkxWNpoGpKtIY0UPFWh
         qmMrZr+iAJJfN2w21oRTxku9kMZSKT7W0MFzIfo8DUPx2OfzsGsGPHQ/wB4hQnQjrzYD
         UfzJiz7JZY19Kd77PJYn+r9qiV4wL4gmJ+PtCBJ01gn6EYN3XlOsOXxhXlW6wFSPIOBJ
         M57UcNII4krrvYkJlMu2TNnC+AhIRL/K7Mw8q/a1vLF7Qf4o/XtDkygLXIRYD5cU2nvR
         afNzDghFZ6FMOeTSswdRZfEbG+rFm5Zn+wxEGKycNaSkkoXncWci2QTTjpoA10K7YgC3
         hHbg==
X-Forwarded-Encrypted: i=1; AHgh+RpNeyxmC3H1Y224+bhbKyBuyL0NCZVXoL+EdB3j/5wpj4otGQoEC8avA9+q+ZMH5jvJQfkFlGVAXtTx98CRDI6b@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+QPBrjn4pg0ZVYKK30RB5lyqUvveeJAH9R2YPwy7Dj3yZhcYr
	d/YRLEWDCMoLFVMCNIHboI/suQzkvWsmKitrpRTLzQBfOzdZhgZ+CgK+K8NwMx/dQv37Zb7xBCe
	81YEBdJoOtRzYvOgfH0RIdu037Klt+Y1QY0ALzosUQAM9NMGFa+/iVCvnM7XpJTxIPfs17fz73v
	1wfA==
X-Gm-Gg: AR+sD13bmd7nHHNl8CV3nIG5HAkyhexo2FSjqCpUk5MK3BzhzED9Vr8JCdX9mooeJ+H
	s04FfPfpZjzZIaXbqn4ucHjvEM+GMZ56kuFw2EBxOGT3hFzSYgtc0A6T8gIbwnSkwQxWb0pZ9L1
	4HYnqyUH3wy4DapMhocEXuYhC+CynwAALx/cAQIz7hzHrgPEK+iXBa45/rHN4BH29NScEEMLIYt
	e7SaRJiNYttxrg9xkmPlei10LkFRysUSSvPAmk10O3BTa89yLId5NG9IpVksDjpW9eQ9qRGXIIg
	CBMyV0ZEEyCZNqwIgsdTClmDhAz7rpTrX1TlwDkSdKLXrsiYjIIaSluh9TKzH6ablRX4ODpyRiO
	hCRpMCQE756peS16l+JhwUnZWla0M4ziczw==
X-Received: by 2002:a05:6a21:700d:b0:3cb:b3ea:858a with SMTP id adf61e73a8af0-3cc3f739945mr5799515637.20.1786538539864;
        Wed, 12 Aug 2026 05:42:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:700d:b0:3cb:b3ea:858a with SMTP id adf61e73a8af0-3cc3f739945mr5799443637.20.1786538539337;
        Wed, 12 Aug 2026 05:42:19 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf628e42asm13617523eec.15.2026.08.12.05.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:42:18 -0700 (PDT)
Date: Wed, 12 Aug 2026 18:12:09 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
        Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Zenghui Yu <yuzenghui@huawei.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Joey Gouly <joey.gouly@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
        Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
        Gavin Shan <gshan@redhat.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Alper Gun <alpergun@google.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
        Emi Kisanuki <fj0570is@fujitsu.com>,
        Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
        Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 07/45] arm64: mm: Handle Granule Protection Faults
 (GPFs)
Message-ID: <7d4e5920-aa20-40cd-954e-037631bd0d6c@quicinc.com>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-8-steven.price@arm.com>
 <ans1ZSwMEKeT9Gfz@arm.com>
 <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
X-Proofpoint-GUID: 0xRBM8O7PuD-jm0fPzje-Pcdk0LIQ9sC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX7/h7cDklccca
 cqxIe5F5TPdNeyBFmi3vgX4vcUj+IJAj3GSPDO9SdAJ4vEaKe5W6kbTUyOX3QHmA2QLP+3Bk0nZ
 kjruicH8/Yy5i9r53WBOnNDTnxx5UqE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX9Ji4ylccsHmj
 6KxqCrqvQ08qi/ajY5pFoZg8iTPBJnWDZTuJlpWdt78VqJ2W0rsimOyhz4GYZ4kqdBM5rzOJ36p
 SDolgvpCDJels97IkFAMg1QrO4iRTsxQstzs+JiCwbEJY/C28k4M28B9TaOlUKdCgZq3uYPtwCh
 yqYxlA/FbQ/z2JLJX/wiN8+NaYuiu6XEKVkC3SL+dqx4Dkb2wuAuGtvdTNOck7DAfla+ScE1Nly
 E9eyx2gGQm6YzWdbEvKdDkA5EzQRQItmnytoRTx8htLdJA0hyY24znSrR1elhGfTwHas7utnOGy
 +aYiqXqEp+fPhK0UiC25gGqDeyOHp/nnEYcZvsEY+1ijj8deURya4yDOeXTcG5sAm6g2d8hyV9g
 Qv52qv9zartM9TSz6AqOnTs3RmfyWPnkEA3OmfWLlnZO+PUz55xKVw+udsZBivgJ5YuWNbkZghQ
 TfJo06MxtZUqxbBVewQ==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c6a2c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Oh2cFVv5AAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8
 a=okfElxvwRwk4E0nMkqUA:9 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=7KeoIwV6GZqOttXkcoxL:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 0xRBM8O7PuD-jm0fPzje-Pcdk0LIQ9sC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_054221_874555_6E448FB1 
X-CRM114-Status: GOOD (  35.69  )
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

On Tue, Aug 11, 2026 at 04:11:13PM +0100, Suzuki K Poulose wrote:
> On 11/08/2026 15:44, Catalin Marinas wrote:
> > On Mon, Aug 03, 2026 at 02:43:23PM +0100, Steven Price wrote:
> > > If the host attempts to access granules that have been delegated for use
> > > in a realm these accesses will be caught and will trigger a Granule
> > > Protection Fault (GPF).
> > > 
> > > A fault during a page walk signals a bug in the kernel and is handled by
> > > oopsing the kernel. A non-page walk fault could be caused by user space
> > > having access to a page which has been delegated to the kernel and will
> > > trigger a SIGBUS to allow debugging why user space is trying to access a
> > > delegated page.
> > > 
> > > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > ---
> > > Changes since v10:
> > >   * Don't call arm64_notify_die() in do_gpf() but simply return 1.
> > > Changes since v2:
> > >   * Include missing "Granule Protection Fault at level -1"
> > > ---
> > >   arch/arm64/mm/fault.c | 28 ++++++++++++++++++++++------
> > >   1 file changed, 22 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > > index 85e23388f9bb..ea3ae0ca7dba 100644
> > > --- a/arch/arm64/mm/fault.c
> > > +++ b/arch/arm64/mm/fault.c
> > > @@ -909,6 +909,22 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
> > >   	return 0;
> > >   }
> > > +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > > +{
> > > +	const struct fault_info *inf = esr_to_fault_info(esr);
> > > +
> > > +	die_kernel_fault(inf->name, far, esr, regs);
> > > +	return 0;
> > > +}
> > > +
> > > +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
> > > +{
> > > +	if (!is_el1_instruction_abort(esr) && fixup_exception(regs, esr))
> > > +		return 0;
> > > +
> > > +	return 1;
> > > +}
> > 
> > Is there a valid case for fixup_exception() here? IOW, do we ever have a
> > valid user mapping of the pages delegated to a guest? If the above is
> > considered a kernel bug, I'd not silently ignore this (like return less
> > bytes copied or -EFAULT to user) but rather warn, potentially
> > rate-limited.
> 
> Good question. This shouldn't be a valid case. We expect the VMM to use
> guest_memfd and that should prevent any mmaps and thus fixups shouldn't
> be required. That said, this series doesn't enforce that the VMM uses
> GMEM backed memslots for Guest RAM. We should probably do that while
> mapping things in.
> 
> With that, we could drop that fixup and scream a bit.
> 

There is a valid case for fixup_exception() to be needed here in GPF
handling.

-000 |load_unaligned_zeropad(inline)
-000 |hash_name(inline)
-000 |link_path_walk()
-001 |path_lookupat()
-002 |filename_lookup()
-003 |vfs_statx()
-004 |vfs_fstatat()

We observed this in Android running Gunyah when the page is mapped in
EL1 but unmapped at EL2. path_lookupat() can actually handle this
via fixup_exeption() when a word load crosses the page boundary.
However, Gunyah injects a Synchronous External Abort and we have
a downstream patch [1] that adds fixup_exception() in do_sea(). pKVM
injects [2] such faults back to EL1 and fixup_exception() is taken care.

This patch allows Hypervisors like Gunyah to simulate GPF instead of
Synchronous External Abort for kernel to gracefully handle the 
load_unaligned_zeropad() access.

Thanks,
Pavan


[1] https://android-review.googlesource.com/c/kernel/common/+/2996781
[2] https://lore.kernel.org/all/20260330144841.26181-20-will@kernel.org/

