Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F81F5581E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 11:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PsndaJhCTCpTmO1OsNUkW3V3Ph6eGaHFsklZOAPJF0M=; b=wuDm3HOJwPvr/oxbvv9T5RIF86
	smivE5C0hRr2wXakEORtGOkkv6ywUQvLyTFmbaNuZoonrzHocIRLlfBmB29Xgaoy4s9rgQbwGbpqY
	IiJYwdd5xz2D6TXoncUTmRX/D3MGKn96Ary6zN7uD14bFXeOZDdOLj4mNwfCJww0jV1y0Q51hSMof
	nH/I919B8kqfwmKsJdQEAGK8/fPRecVDi1GPk+ce572DxzDLAd0E7+ursvrvA+XNDumevCk+KD9ca
	J0kZ7yj7ALdJHfePn+szhZAcDzUTE+oRB0Or1OTnYIr8bkC0+sELqumhYkVUknmfkyUgGntXPYwyy
	2i7KLxvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmmS-00000006nKr-473x;
	Mon, 20 Apr 2026 11:27:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmmQ-00000006nKU-1091
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 11:27:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBQwSU1598294
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 11:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PsndaJhCTCpTmO1OsNUkW3V3
	Ph6eGaHFsklZOAPJF0M=; b=SVQMKQw5/aErfOq8H1vTpTAoNI7Lb8O8VZtzRnvX
	j3Zk1xM2VnerLb6ywQCXKerO0Zb5Xqoom6oo4Oh4sRB4gj42XYjTCrTgC9idlZEr
	6HUPCxuCrlewjfK5igmpUZ3pLsefFZ0ADA8osYtloWJJJCZHTHY00hWnkV+6R5bJ
	Dp5asdJ1W7iFMXMRgbf10xOTMxDNccqNMru1mG2ghul5kjaLvs+pKxeMQdUEKKl5
	NLTw3Y7RvWJGj8hRnUTiLjLmrFDlxbTL1OhuOmMDf1Xc/kfdtioxQQx9YazoZCwO
	b91XbV1zfVhyJ1/Fc851r3csLbUCMlOC6cXwljeLQaRhog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnh79q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 11:27:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so5087593a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 04:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776684425; x=1777289225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PsndaJhCTCpTmO1OsNUkW3V3Ph6eGaHFsklZOAPJF0M=;
        b=Ww+O7l2Mex4DT8mR48G1y8OODOzzyxbBjMd4X6J76CoY0cSTYkK+sGKENhIC6SuHFS
         6SK5W7ApVVJrVqPGiDKftJuupoG3eihRxSp+7k7k0Qb+6NEj3UNV+CINWtqLonnpcj6/
         gu1hxUdETSFBS65FfvH1L06TabmWauLJdAI8RtL6xG98iFSOo1wpFPA/8mErvFQfZf0k
         YLdY1z881PTxzJN+RvbnzxBKBvKOZR8wGHJ4Rj0qhHq62ZroL+qoR4V8BcIYCLDxOuAk
         vkxsCbUQv8t79zmV/z/L+rqdbFpi8via8MtxSgj9VPwEq+mXShY9/e346dy4w+hISkCz
         W80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776684425; x=1777289225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PsndaJhCTCpTmO1OsNUkW3V3Ph6eGaHFsklZOAPJF0M=;
        b=T0Vl7UfmCUh6YRsbC2Rm4cW1ciWpzyDDXv4rR16nm8lVJiniGpBS/CISQyhBbt4zw/
         cE4/Qikhi/ipxTmqKaXx9rdKm5OVsxYrV6gxru0tg18RpNnN/50tbarGSU7vayNsVsg/
         r+WA4ux3r5hLNizrzdEusxAekT1ddzdBT8VVQalbs/8AsGge8u1QMeuly/+iP6W5eckb
         DFAsA1cPYOPdYCy+D0apBOyMbh+2pflRkIoo2TUbk5dOKrNS0Jzu3fv1oQ0viiiN1VLl
         qjMw2EX5Fm5JILzDa4Ftuqag3ohPf57s7WobV6TSm1fVk7ToPS4K01r4C1o6YTgaRxWn
         5VwQ==
X-Forwarded-Encrypted: i=1; AFNElJ84GmliYyujIhp+JUSw3wNTzevf250NBJX0jDzhgCMZzs6H2+QYn/OPffJRYKGkleeswYH5iL+sZxqui8vKbE7M@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+Q3yfu2JoVgz+DSmia1Ls2RexW5TwdWJl257nNO4vw4wi6FiX
	6Uf+MihAdjRcJV73UE5cbaYdZO99NtSiQWHb2HEYL8EIBzEqC8LsqD9u49GSJi8CgzS7bxosW5l
	SnAmy91MsOigBc6ZqmtwTP+uKUyYi2DdR0jYih+/iMXHu092ZEXcrbs7ZPOKfIslWkZgOH66Xhg
	o6ig==
X-Gm-Gg: AeBDiesOh+H25z09YAZ25Q142qMyB+aI55w/4ZPiMrvJaYxHI3+Bxh2utMRObjq3S+F
	dqs3DjFRi51Obmcs1j6CMvCpR9JFeAu9kAWqtf9JITGVhK/hGTUX8TxIi0+Tyg17X6aDb86T7uY
	33WggHMNM/hqKsK4fdn3huio/w4ELZjZcqt6Y7/RlQsd3X0TLtjU2lYNhT1AxCsxizOohtvX4k1
	RR+x7gQaUCCqczDWJJtOXPJyQBZ6z5rQlJpnDOoifvJQSHY0COJfhP38ZCbqQRr6cdVKGaJI/RE
	zXyr6fo/iSFgOUJPRKDZa5BkZqplKBUq6g+i6G1iwm0EGSDZlq2oItG8ekUL33y38+dPN4TVWyo
	WC6+vnGaIY53CADeQq8yi513BxV3YaLiagv4pAswgIuEvkqNT60yQrVPiSFI1xN+VFQ==
X-Received: by 2002:a17:90b:1807:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-361403f2bd5mr14890488a91.11.1776684424683;
        Mon, 20 Apr 2026 04:27:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1807:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-361403f2bd5mr14890454a91.11.1776684424211;
        Mon, 20 Apr 2026 04:27:04 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fbd470fsm3981614a91.12.2026.04.20.04.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:27:03 -0700 (PDT)
Date: Mon, 20 Apr 2026 16:56:57 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
        Vincent Donnefort <vdonnefort@google.com>,
        Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 00/30] KVM: arm64: Add support for protected guest memory
 with pKVM
Message-ID: <573483a8-7cb7-479f-a96d-67416ef1f6db@quicinc.com>
References: <20260105154939.11041-1-will@kernel.org>
 <3f52367b-f927-4d4d-9df3-bcd8cd954d47@quicinc.com>
 <aeX5Q7QNxmBCmsqM@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeX5Q7QNxmBCmsqM@willie-the-truck>
X-Proofpoint-ORIG-GUID: iYQA3KP6vYuDyqGYahUUs0OMVEWh0SWW
X-Proofpoint-GUID: iYQA3KP6vYuDyqGYahUUs0OMVEWh0SWW
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e60d89 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=vggBfdFIAAAA:8 a=KSvv7RmM8nE5zw0GlVcA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDExMSBTYWx0ZWRfX22tz33d081n0
 Bkv1jeNpVcCEPdTEnNgQfENuh2tXT9OhWIUaCQtCpgHMKELiGLasImbE879Yw/xiFghqNfmBCLu
 CzLlBLNTw+QSidATxTbQ1xH9cQ4ZQmE+g8i9Cj2kz31PcxVzI2mH7SLGNkHnYAOEKehCp8cBvY6
 yllLNLXK64itq43/Qu7Tal1Szjg5qGYvxlmIYe2EfvGL07gl5TwvAouG/rqzjevHU64F3e6q1O4
 CX0osCoDOuvOViIxnx2zg6Z8Nucy5vHBqqTD321LX8hVw5BeM02ItLE713VsZQBuDUOmftIHGpT
 QmmEkgCet6FiY3KXnacekvR+arPKLI+zaFUe8lFElf4wE2uP3a3Jl+lrocvdsUEQKJqb8d4dKSW
 uDuQocrrDmJcHUL8KWUs5iyHa69WphyWuItYEsyCndDrv1oA61LBd9+mdc90qoFO4hNFnl0SPCP
 +gBoelG5zC1hK6Yv9mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_042706_297905_8473EF48 
X-CRM114-Status: GOOD (  46.14  )
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

On Mon, Apr 20, 2026 at 11:00:35AM +0100, Will Deacon wrote:
> On Mon, Apr 20, 2026 at 01:32:03PM +0530, Pavan Kondeti wrote:
> > Hi Will,
> > 
> > On Mon, Jan 05, 2026 at 03:49:08PM +0000, Will Deacon wrote:
> > > Hi folks,
> > > 
> > > Although pKVM has been shipping in Android kernels for a while now,
> > > protected guest (pVM) support has been somewhat languishing upstream.
> > > This has partly been because we've been waiting for guest_memfd() but
> > > also because it hasn't been clear how to expose pVMs to userspace (which
> > > is necessary for testing) without getting everything in place beforehand.
> > > This has led to frustration on both sides of the fence [1] and so this
> > > patch series attempts to get things moving again by exposing pVM
> > > features in an incremental fashion based on top of anonymous memory,
> > > which is what we have been using in Android. The big difference between
> > > this series and the Android implementation is the graceful handling of
> > > host stage-2 faults arising from accesses made using kernel mappings.
> > > The hope is that this will unblock pKVM upstreaming efforts while the
> > > guest_memfd() work continues to evolve.
> > > 
> > > Specifically, this patch series implements support for protected guest
> > > memory with pKVM, where pages are unmapped from the host as they are
> > > faulted into the guest and can be shared back from the guest using pKVM
> > > hypercalls. Protected guests are created using a new machine type
> > > identifier and can be booted to a shell using the kvmtool patches
> > > available at [2], which finally means that we are able to test the pVM
> > > logic in pKVM. Since this is an incremental step towards full isolation
> > > from the host (for example, the CPU register state and DMA accesses are
> > > not yet isolated), creating a pVM requires a developer Kconfig option to
> > > be enabled in addition to booting with 'kvm-arm.mode=protected' and
> > > results in a kernel taint.
> > > 
> > 
> > Good to see Protected VM support in upstream w/ pKVM.
> > 
> > We (Qualcomm) have been trying to resume Gunyah upstreaming [1] efforts 
> > for some time but the path to re-use guest_memfd is not straight forward as
> > guest_memfd is tightly coupled with KVM. While the efforts to use it for
> > pKVM is pending and refactoring to make it use outside KVM is not
> > happening anytime soon, we plan to send Gunyah series similar to how
> > this series is dealt with pages lent/donated to the Guest. Please let us
> > know if you have any suggestions/comments for us.
> 
> The major problem I see with this is that the host/hyp interface for
> handling stage-2 faults is internal to pKVM. The exception is injected
> back into the host using a funky ESR encoding and the hypercall used
> to forcefully reclaim the page is not ABI. I have no appetite for
> standardising these mechanisms (the flexibility is one of pKVM's big
> advantages) but I also do not want to complicate EL1 fault handling path
> with hypervisor-specific crap that we have to maintain forever.

Thanks Will for the feedback. Agree that we don't want to sprinkle Gunyah
specific checks in fault handling code. Do we need to handle anything
apart from

(a) user space access a memory that is lent to the guest. Gunyah will 
inject Synchronous External Abort and the offending process will be killed.

(b) For kernel access, we need to unmap the memory at S1 while lending
it to the guest. Earlier, Elliot attempted this with [1]. I am thinking
we can leverage from Direct map removal work done for guest_memfd w/o
really using it :-) . I am hoping [2] can be made available for Gunyah
module as well.

For the (b) problem above, pKVM takes a different route in upstream i.e
pkvm_force_reclaim_guest_page(). I believe this avoids kernel panic at 
the expense of memory corruption in the guest. correct?

Thanks,
Pavan

[1]
https://lore.kernel.org/all/20240222-gunyah-v17-19-1e9da6763d38@quicinc.com/
[2]
https://lore.kernel.org/all/20260317141031.514-3-kalyazin@amazon.com/

