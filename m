Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B8BC79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3G5n1JEubzvFQoHqpYm6GVn4ifURnR0UinvnQLMEbo=; b=VK1xc33fl5qwxQecLZHYyqP/fv
	6lMBKbpTz27d+st7BCsqw99InDJaGeJ9Tw5lgKYhTQPy4LGCLsrDgfxPz0SG9PDaNCb5tsMkfxSrB
	9XYMPyVbWh0djzpXjFLF4z4YdAj+UEZhF0p2iLUThmqE5x0wVe2WAFxeO4C90+/uW6qLZeHbxrqIF
	FtgqtA0D8uj2E7uxB6OGdjVTIEuaC7ljbjvVMs5dfSzFO7vv+g8bn4Fe6AH9mDeqrZR0PG8fvmj/u
	JDGrVgWxJbE5h8A0V5Rzu2a2MDUbXSAidx2LzU83mpUfh9C8kvc5T5ncw6/yGSz7k3h5Lz6bfBMVl
	5r88TyjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MZA-0000000CZ4o-1JtM;
	Wed, 09 Sep 2026 17:58:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MZ8-0000000CZ2V-16pE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 17:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=A3G5n1JEubzvFQoHqpYm6GVn4ifURnR0UinvnQLMEbo=; b=dT+y5dwwbFxFIoEQ+lZ7a78dKI
	ENlbbiJBlnr3MbatzuXziDHHTHd9n9fxFCbIylqAP/loOm53y82wro2pKvzHGDb+TRIePiNAANpid
	b0sfAxBXvL9wnzfQhibA9RXC0lf/d2LPfdclPpXNadAUIlKAIGuc3udy1Q/yDQHnzfXBVF2jqS5oL
	pN7fS53v6/B7J5Nrs8i2Nn7sWxQeNHawBxhajVKmggbC2u3qGWv2rhNIRHjVzthDB0CuOP92F00HZ
	P1XQ5rlPh013phI2/x4WPdIZNazLAOJpIE4z2QmgHxZkJ5HdTkrboKT6TKpC+SpYjQO3kr7jNqBG4
	3/r72yeg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4MZ3-00000001WJ0-0c3O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:58:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7LdR2562030
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 17:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3G5n1JEubzvFQoHqpYm6GVn4ifURnR0UinvnQLMEbo=; b=gJqS/YCDncjuUTiC
	uQBCyhOKBKswcxjl6dcirxA+/EYMfhJpbDaYZ8t2Qb+j0kIcGJr94D02bT4oTxRc
	ucBScFxNoUMrzNYGQH5TbZKwBs/LPzgm96WWjRzoQwP/V70T865RcJ9k0NV4QCIY
	M9CnABckcXx56rPcHxSN2osYwc5n+PQQEaKdLiMBnMXKcuEaiHatLfnuUMhedEPV
	kshbzVTQnObDG7B5K8+vJifmzUyRTlsLIFDYN9QgqPsTR9Nr/Ak7UpfP0tk5dou9
	qFsGCtsbH9p6K0eymdvsAX/1hKw9oxHwvpMjKZ8UWwJaedIjvMbEQGRynfcKIC2t
	nBknwg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj289a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 17:58:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d7443e0f0bso95962825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976703; x=1789581503; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A3G5n1JEubzvFQoHqpYm6GVn4ifURnR0UinvnQLMEbo=;
        b=eCc+sv+P8GAF/c4QM0t2JHVtzqLZ+PWYXfhP18CUkjcRlWfRNLFtRfqw7pLHMbDvre
         fHzOfHHv8ScUaaq5lqmvBbnkeup7gQEdPk0WWvPCrW2Aw4ylAJAK09VsGBNhr4+iVo3I
         pZ9VUhnGkF64erkKxmogp1qkJvWz+6ZZST+VSmqvA3viwFB7sxFrQAMYN8qwqcgbnUt1
         8P9SqpfCPEyRlvKZvSfxWHE3UZHQL+F2hBV3uB/YEqPGTcu2+GGtP+iaZg8TC54d5neW
         94fmrF+5K6L3IO2OI/YBKja49O3FVUZROb0CWmIqb2OI7jHMfdr2yEbkSeY+f7ju0PcO
         IJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976703; x=1789581503;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3G5n1JEubzvFQoHqpYm6GVn4ifURnR0UinvnQLMEbo=;
        b=lbRw7flp/9egQISr6K56YrHGx0M8sf7Z7SxMLpvL8f0FHOP7NlRNtG87YfNoxbCj4G
         v3IqZkKXrZPVl7++lIw+9QfRAhqXj7m8Xjf8p9r+YGZuupcQ3emNwDm8jpXHYmLARreq
         sgQOtGm036L6DHqJLxPLDtPCNGoJ0rd8CbtMO3D1Kk2yagbpaL/5g/rj5N8gCfSUz+nj
         3mwi/f/bHKHQNBTLOFsOna4FpMlCHeH85IQBeLImAirr3tMvVA41cT0wkSQq1ov6JKxf
         NBAPYqMMG1npezzMxCzARvzB5/eyaPmrjFAh/ko4/Qpi8ih8TloSDgEvSZaoIUjsTMNN
         k8LQ==
X-Forwarded-Encrypted: i=1; AKwUvBys3DMFKIdP0Du0xsCvRJsoYHhIQBN749vHgJo91JvgxH3kBTYu7esvxlo0CRFhQg5Q7XR3aSNmcy76Y65r2fml@lists.infradead.org
X-Gm-Message-State: AFuF++ndkcevJ6lZS93OQB9+P9FdT+2E+f78arb9OPGtSOG6VVkZltKs
	Xk6SexpdtVtWErF+lKJUyVO5jIBGYTgRtCFcL47aDYOr28+GpVFrtGL0gL3vy9zvuMBn8s9V6qi
	i2QUXO1SgKpCAiiwA0mwWhjR/sD6vv+/+XDPmzl6AwkxqwEz26PM0wRTwD9Vyd8Ancchget10rl
	AWDw==
X-Gm-Gg: AYBFou2LRgqTJtvCBegwz2z/hEZtFmsM4eChsit2MkAoG/8KbJJXUZdCTvrzqdOkYnQ
	eVyhQO/bUGYRpFzNgY9HUFEbjFjZK07bWXrSVjYNSUiB/qY4zps36ur8hgkTuJD3q8CElwX0E7o
	73MTKaJnKVo+W+uEePjSE0d4BgCd3/7swFLnpu9yvWsvT51hKfw0B7UJMaq0f5QSBzTPny/JZVz
	r4kGtO3SayD85CR5I8D90vwnQFTtMY9EXZRmiyIvE1Cj4GSHbaRO3gIcrW6EZBWLypMXc4t8w67
	7YBNAkVL53OdWxDxhoakSYrN0UzTwj1x0Qg8nQ0icGf58boBJGSSAoE8mUKf4BdC0TIB/c3CV4Z
	NZCvyxLnLEyHlSiAUUpFrwX8eSnk=
X-Received: by 2002:a17:90b:4d86:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39d70980956mr2813322a91.5.1788976703349;
        Wed, 09 Sep 2026 10:58:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4d86:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39d70980956mr2813204a91.5.1788976702119;
        Wed, 09 Sep 2026 10:58:22 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm40569970c88.3.2026.09.09.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:58:20 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:58:16 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
        <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
        <kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
        <baolu.lu@linux.intel.com>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <skaestle@nvidia.com>,
        <mmarrid@nvidia.com>, <skolothumtho@nvidia.com>, <bbiber@nvidia.com>,
        <harsha.v@oss.qualcomm.com>
Subject: Re: [PATCH v3 07/13] iommu/arm-smmu-v3: Disable the queue IRQs
 before disabling the SMMU
Message-ID: <20260909105816.00002e4d@oss.qualcomm.com>
In-Reply-To: <apuLhri9BpqncLRT@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
	<a6fba7f7a01f5955dfb44d34adc6262c8534e829.1788222486.git.nicolinc@nvidia.com>
	<178846311318.1308030.6301643510859406126.b4-review@b4>
	<apuLhri9BpqncLRT@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfXw7hdUsFGdLGy
 u+XMUtGI2pLog+AvWy5hYZ0u3nvSjdg8DkdOuNikBIgqBzAgEOdILiG/AAc9uyWDbxh8pMKh4Cu
 qcey8KuSVubxFNo+RCz2MlghVuPlXE4=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa19e40 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ikd4Dj_1AAAA:8 a=YF44DY9b4ahQXEfF3N0A:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: _ElyMeel-e-W6wewYM4qD65Aor-zrk1T
X-Proofpoint-GUID: _ElyMeel-e-W6wewYM4qD65Aor-zrk1T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfXzY254NHvm8EP
 zf75+kgASVVlRRGHRF+tgQ+DTdaY3em2xHmSIS9oe52jtN4ggrTeVsUoWwFtm+khaFmtglphtyy
 Y3ML1CYC0sDDrtggDAOh1NenIFu6UXVgKDHJa66E0TM9clJy6/xjFuTXgtx3Cc+nj+muvTw1/kx
 QIo/0zYQJ1vQkpiVamSOqFwxGyVkXtcEdfkgmuyC5ZxQOP0NkqdBkXChLtpVVsm/CpYbbaXRuRK
 NwsIZYtZ+GvwpsVITu00Vw9JxgZ07bNb4o+fu6kSvVUipg0aF5bc04ksOwzmIk1BL+hwrRNHZBm
 kYAb1AvMuwwgrSz1gHH9/Elz6eqsGd/aa0Twrb0Kb42tRMWTQoUuPN/gx4UzDvUvM0bwdBhr/Nr
 5UbGGvNu2nJVffwfZCFU9T1izU3fRcop/kabQyycDzs0MDI0tnf2TwfTPmW38nXpUF0QQ4FbXjU
 ZioIfkub+xucsSZFonA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_185829_604736_7FFDDB32 
X-CRM114-Status: GOOD (  27.78  )
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

On Fri, 4 Sep 2026 20:24:54 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Thu, Sep 03, 2026 at 12:18:33PM -0700, Jonathan Cameron wrote:
> > > The EVTQ, PRIQ and combined IRQ handlers are threaded and issue commands of
> > > their own, e.g. a CMDQ_OP_PRI_RESP for a page request. Disabling the SMMU
> > > while one is in flight hands that command to a queue consuming nothing, so
> > > its poll waits out a full timeout.
> > > 
> > > Two paths disable the SMMU while those IRQs are still requested: a failing
> > > arm_smmu_device_reset() returns to a probe that disables the device itself,
> > > and arm_smmu_disable_action() covers an unbind or any later probe failure.
> > > Both can run after arm_smmu_setup_irqs() requested the IRQs.
> > > 
> > > Disable those IRQs first in both paths, so that no handler is left running
> > > once the SMMU goes down.  
> > 
> > Why this soluton rather than a flag to stop them queuing new work + a
> > synchronize_irq() to deal with threads in flight.
> > 
> > irq disables always worry me a little as they tend to be patching over
> > something nastier.  I think this works though so I'm not going to
> > strongly object.  
> 
> Well, I don't see a reason to add extra flags: each irq here only
> has one single source, so disable_irq() is fundamentally similar
> to a flag + synchronize_irq(), but also masks the irq line, which
> makes sense in the probe-revert and shutdown paths. Above all, it
> is cleaner.
> 
> If there is a solid reason for not using disable_irq() here, I'd
> not mind changing that though.

It is probably just my mental model that disable_irq() is normally
papering over devices that can't behave well and stop sending irqs
at the source end.  The main difference is whether there is any
potential of the unhandled irq logic kicking in.  I kind of dislike
relying on exactly how that works under the hood (needs a lot of
irqs to trigger) for any path that we expect to actually hit.

Anyhow, I don't feel that strongly about this one.

Jonathan


> 
> Thanks
> Nicolin


