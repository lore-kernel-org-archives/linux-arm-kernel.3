Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AE9EA71A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 04:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkGFo2uls78DCBvdk/ApDVoQ+XtuJ02VYs5MSe2EIU8=; b=eb5mcs0NrFTXFZEz+hL7GAtARg
	yL+w881OGFnMkkbIO7pJlrff6y844PMZwS9N+c0UqqiJZyoQzcarN0zsKTZ/+9bJ6Src5Le8PfLr4
	FjA3Kxi0C6KdB5UJHwpM+pqcFqljiluyNUsdfMJ/3PTxdywtFwVmMT9q+ZgVg43Hg3Xpa8vnjSM8d
	Qk1VWpd4fAyyBVPDo7lEBY/3p73kfj2Hs625SNLo58cHJe6xEMoLmDEDMt/DLmN6d80OMzSJyvC/x
	BiC0JyJnGj/AWr/24Hskr4j4JKkwYbgnEiMn5plPK/+9Y8eAAFs8CB+ARFZTGgcPJzLfczm+2GHCD
	FdE2pY1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF2Wl-000000081Ga-2nwf;
	Tue, 21 Apr 2026 04:15:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF2Wj-000000081GF-1sPW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 04:15:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KKBrnl3455276
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 04:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RkGFo2uls78DCBvdk/ApDVoQ
	+XtuJ02VYs5MSe2EIU8=; b=YYFcdhbRBYMXcne12sxl6IN5FLxgBqeweC4iERHj
	BpXUyaceCgBvEmUR6SdxgiuZRhjTDPtpn2Pg584U40CiDkUFpHLYgisdDXtboYzb
	6e5mMFtPDjgBx8e2CHER5JSTQ1AUzeDxrBXUN1/GWWPluRr5Fb0p8ngNmtmloxhG
	BY02jhyqnqw61pddvt30LPS/fRt/YIb6kOQPItNfUccspaw3QjtX/T2+I63Q24YL
	SZyT7EBfC+191scbiXZjH8tX4KGuxw377/VMC2IMXrbxbesezEZb6MtbhXxwA4Qn
	fMFvamc6rjMbDS2TjS5lyz26C40SevSpep33JmZb+/yFCQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfvjv6ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 04:15:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9f49e4beso1615061b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 21:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776744954; x=1777349754; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RkGFo2uls78DCBvdk/ApDVoQ+XtuJ02VYs5MSe2EIU8=;
        b=fiOVCrgcvUOHhQLKVyS/cfkClJzTsZ+alFm89l2WLcZUvjAk/HmUJZMymQgsbzuzP8
         KRJqsGgT3kFwdEWQsxli9mPZICHiuZ1XCuaKPcrlAWAdSgkQQUE+Bgf2xTf6gomShovg
         35aQkCk1VMgODmsGZgd+EyZCTjF2gvzy4EgP+dA5PNnZfFdz0BSJ+8Xj9ZrN+OAGgzjq
         YDZqAMgqd7/CcyVniY1iNmJooeAGS+sstk4KmDwALfKlYIh6LL0dZiTsb06I8OxBjsab
         dXb7Es/5GW6VI840zaFX6UyxPn3tfS2bafDHC7t8pr4sAABTFiFuiFmsB9vCaHfy6c4G
         KRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776744954; x=1777349754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkGFo2uls78DCBvdk/ApDVoQ+XtuJ02VYs5MSe2EIU8=;
        b=TFZ08c+lHeWggnTEmI/xSSWj1IQgpJh++4DFzmUZeeKSrDPQUGyBDXDJVQPQ13cbjP
         3R6JbhS6H9kgvHeBJDqVVOpGCB0P6C5MPnQAINEYcAoAUkvKoe3nLEikKdlGUydDbUa7
         DgkjMOrIPvHopmJtwaM6kcbK0gSoe/AS8ASabWig0VwIjUPAq1X+2GHfi4W9V5i84/Rn
         wBg+vNKHZKsLiTaRCa4lTmlHS8yFmK7r0biht0lnu7yfwLNbPqj+iUzMe7ugewh428/O
         fRTMrQOAp0trCIwoDyYyhw2NLxOcKmGrEoi5+ykF+oAfEmYrbmJ5WNMW1SAaCwOFUyFH
         fCbw==
X-Forwarded-Encrypted: i=1; AFNElJ9XBDFgP8PWV+BbAkepE4POToJcxyp4zYGMUgEMQ2kBKerV/Wyy27Owrc2PVqNIa+d2HkpIfsyJyQwPAOQh/rkI@lists.infradead.org
X-Gm-Message-State: AOJu0YwoKLjd8ssqWI86ZQe9DsxiJNV1jaAlQqE8wzLswsqo5X5gqoNR
	xGfW99HJuecn4D542mc8pPQSbXSSYI++gL/Y8B+cMwdsNTDmuw7svyT3tT6xH8LfGynMobRWkBU
	OsOASDRaqPdfiTRbxzlcx2XC1NhGE3SntjsYUYS11DLDT8GXwvujrC2Gxfu9Ab+GhRIAU3MNtw6
	r35eutR9x8ew==
X-Gm-Gg: AeBDieuw5Ho5k8t5rhrbanGpwqjH2+kTi0WyW10Nc9O7/NSBQI+7rPw8GOK8/McUWOE
	kKN5daGLBSMzE9beJNw8uEyou4MXJNYNVptpgosE1XNPV3OB32yoF1ndjcpchjhC4giGOSWwPW4
	dhhD99yUpWQx2p5O0t5G1NpJxqh3pc7YaPXY2xOg+xdWWWvmUUeqnUrZXnq3cPWyf7RajrsTMRR
	N3JgrS3W5Wcvc5FVgbNSglKcfwUHMHAfZRy/8zmYzQOaMmdrZpIO0czilIgvJc5UQ6QdinKQmTe
	Pe76xuO7KRQ5GL2QNmmIGG2/LOZ80EkxSDyJwGc2YFoVta5y/15wcLx95IpyOX9miaUIXUh5NUP
	b0o5hwH8p/jtL+DNpk4ql0e7wyWVgdHItZX3aAtx3JIcpXJii35i+d0jEaUnBrlXk1Q==
X-Received: by 2002:a05:6a00:17a1:b0:82c:e0d7:2681 with SMTP id d2e1a72fcca58-82f8c8888b4mr16461972b3a.16.1776744954398;
        Mon, 20 Apr 2026 21:15:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a1:b0:82c:e0d7:2681 with SMTP id d2e1a72fcca58-82f8c8888b4mr16461940b3a.16.1776744953857;
        Mon, 20 Apr 2026 21:15:53 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm13484114b3a.47.2026.04.20.21.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 21:15:53 -0700 (PDT)
Date: Tue, 21 Apr 2026 09:45:47 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev,
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
Message-ID: <8ad3fff0-578c-4db6-b3d8-00ce4e72e50b@quicinc.com>
References: <20260105154939.11041-1-will@kernel.org>
 <3f52367b-f927-4d4d-9df3-bcd8cd954d47@quicinc.com>
 <aeX5Q7QNxmBCmsqM@willie-the-truck>
 <573483a8-7cb7-479f-a96d-67416ef1f6db@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <573483a8-7cb7-479f-a96d-67416ef1f6db@quicinc.com>
X-Proofpoint-ORIG-GUID: f629uoJxmGJESK4torFpKYCj6dFIIWY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDAzOSBTYWx0ZWRfX6+CfMvg5NGhh
 JeZz/QSlwqlbQcLhk0Hn8LfBE9d2UuX2FgUJwo5I99KVDl4oxQggoUs/k2Q94f/epLKizFyh/iw
 XFLtseE/Q1Ee6FM8fxJ1T2iNhkETdNtoT0FNVffr8MKzl+QP5pBXBzIdMaY+Ta48QWL/ei5J4cl
 NIuF9Yq+DX0cH0n5JMgVAYtQYHP3Zp7HkqH6bM8dbZqXlQpFBnC+er1dWVJtYDx7Voe9x+sW7/d
 nYboVe/A5ig2huu+2+T7kdeXJ/VvNRLXD7ujqvyj29j0nFDdDtLxHCrL881QmhODsU/NFkX7zhq
 R1lEUH4uttpx7Z9cHE8qqIOP6M0FgYVQUUp7IXsdSo+73BgboQ1xOZa0q1v+kuMni3qkzFKbFc2
 AiOUfi5L48yiiqZgceZe/0wIbtEyt/8Wkq/S3mJAIIiFDfCLyNcPvUprrtMD2i8jqZAH1SRfpoS
 jniTf+CxFhBvat4T8ug==
X-Authority-Analysis: v=2.4 cv=XNMAjwhE c=1 sm=1 tr=0 ts=69e6f9fb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=usknv1qGnw5aPmP1rO0A:9 a=CjuIK1q_8ugA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: f629uoJxmGJESK4torFpKYCj6dFIIWY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_211557_630612_025CCA32 
X-CRM114-Status: GOOD (  50.53  )
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

On Mon, Apr 20, 2026 at 04:56:57PM +0530, Pavan Kondeti wrote:
> On Mon, Apr 20, 2026 at 11:00:35AM +0100, Will Deacon wrote:
> > On Mon, Apr 20, 2026 at 01:32:03PM +0530, Pavan Kondeti wrote:
> > > Hi Will,
> > > 
> > > On Mon, Jan 05, 2026 at 03:49:08PM +0000, Will Deacon wrote:
> > > > Hi folks,
> > > > 
> > > > Although pKVM has been shipping in Android kernels for a while now,
> > > > protected guest (pVM) support has been somewhat languishing upstream.
> > > > This has partly been because we've been waiting for guest_memfd() but
> > > > also because it hasn't been clear how to expose pVMs to userspace (which
> > > > is necessary for testing) without getting everything in place beforehand.
> > > > This has led to frustration on both sides of the fence [1] and so this
> > > > patch series attempts to get things moving again by exposing pVM
> > > > features in an incremental fashion based on top of anonymous memory,
> > > > which is what we have been using in Android. The big difference between
> > > > this series and the Android implementation is the graceful handling of
> > > > host stage-2 faults arising from accesses made using kernel mappings.
> > > > The hope is that this will unblock pKVM upstreaming efforts while the
> > > > guest_memfd() work continues to evolve.
> > > > 
> > > > Specifically, this patch series implements support for protected guest
> > > > memory with pKVM, where pages are unmapped from the host as they are
> > > > faulted into the guest and can be shared back from the guest using pKVM
> > > > hypercalls. Protected guests are created using a new machine type
> > > > identifier and can be booted to a shell using the kvmtool patches
> > > > available at [2], which finally means that we are able to test the pVM
> > > > logic in pKVM. Since this is an incremental step towards full isolation
> > > > from the host (for example, the CPU register state and DMA accesses are
> > > > not yet isolated), creating a pVM requires a developer Kconfig option to
> > > > be enabled in addition to booting with 'kvm-arm.mode=protected' and
> > > > results in a kernel taint.
> > > > 
> > > 
> > > Good to see Protected VM support in upstream w/ pKVM.
> > > 
> > > We (Qualcomm) have been trying to resume Gunyah upstreaming [1] efforts 
> > > for some time but the path to re-use guest_memfd is not straight forward as
> > > guest_memfd is tightly coupled with KVM. While the efforts to use it for
> > > pKVM is pending and refactoring to make it use outside KVM is not
> > > happening anytime soon, we plan to send Gunyah series similar to how
> > > this series is dealt with pages lent/donated to the Guest. Please let us
> > > know if you have any suggestions/comments for us.
> > 
> > The major problem I see with this is that the host/hyp interface for
> > handling stage-2 faults is internal to pKVM. The exception is injected
> > back into the host using a funky ESR encoding and the hypercall used
> > to forcefully reclaim the page is not ABI. I have no appetite for
> > standardising these mechanisms (the flexibility is one of pKVM's big
> > advantages) but I also do not want to complicate EL1 fault handling path
> > with hypervisor-specific crap that we have to maintain forever.
> 
> Thanks Will for the feedback. Agree that we don't want to sprinkle Gunyah
> specific checks in fault handling code. Do we need to handle anything
> apart from
> 
> (a) user space access a memory that is lent to the guest. Gunyah will 
> inject Synchronous External Abort and the offending process will be killed.
> 
> (b) For kernel access, we need to unmap the memory at S1 while lending
> it to the guest. Earlier, Elliot attempted this with [1]. I am thinking
> we can leverage from Direct map removal work done for guest_memfd w/o
> really using it :-) . I am hoping [2] can be made available for Gunyah
> module as well.
> 
> For the (b) problem above, pKVM takes a different route in upstream i.e
> pkvm_force_reclaim_guest_page(). I believe this avoids kernel panic at 
> the expense of memory corruption in the guest. correct?

sorry, not memory corruption but returning -EFAULT to VCPU_RUN ioctl
which probably make VMM to kill the VM.

Thanks,
Pavan

