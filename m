Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7CEF36C41
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 08:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyLNVnLhvqgP/9eazyTAksD1yYCngDRJ5jtR0ZQJ7/0=; b=14nPy5YegEpF2Hlr25j1PCkN7K
	7qSUzPFEx/3+C6LcfjhFEkjpHcNBxCYEWAPjL7TMrfVAk9kcCVMBJ86wAENseuiVbMrW/hjAZtGBA
	linDbpHv5a4DIFBv8qoZIIErhloy5TVFirTnWWT8wsFQxLU+qGj2AJI8yqknMW+7GvilWIxb+8RiQ
	WavOq4VbAgA8W3MKzq814wottwjwLyVkyT8Zz3w+13FfhOV23q6ROcGSVND/9k2svpDEzTxIUwk9p
	A/nB3EqeO45p4E/tlmI98fFhsHEDM2xjlmtzAWz9MMR5xLm/RvI1xyBYIsgnOCuOPJ6broKgHgPb9
	7hjjccSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEjaC-00000006Zcz-065f;
	Mon, 20 Apr 2026 08:02:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEja9-00000006Zcb-3UrD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 08:02:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K7W9041475377
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 08:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uyLNVnLhvqgP/9eazyTAksD1
	yYCngDRJ5jtR0ZQJ7/0=; b=GfOL26UhQ9dennEiHyv4FygYiyKhAvUMGKDJweSC
	Vb4OXYfjbXAtzEDt8Uf7cjB8Cqb9YaWzBDuuzDH4ao8NxRdsoIk3NeURRTaKMng/
	EtIWI6AUT2pkJ1douRR4oH6L6MnXD6byDJKu/nSRsdD5fb4f821tuRhEu4PjUjgl
	BwYn/BeYwFOjsCqaoNgWVgzipM+zcTJeWgHwTr5pujhlJXmuUTIA/Ec+t6dakRo4
	FAcsaBUUiPjVJy6WffKcfZ07HdFGvPKKrxoXeorabDjUq7/Ql5i1wR7nGUOhjM2s
	nF0cJNjpcGp/bBs8D/k4prte6HjFYgE+3nNsyy2pQJmL1A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr50dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 08:02:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2d83e7461so46071135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 01:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776672131; x=1777276931; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uyLNVnLhvqgP/9eazyTAksD1yYCngDRJ5jtR0ZQJ7/0=;
        b=YCf7lChwveRlsG+8zgq299k6LKl8byAgNMGiQRS23e5AHSkQ3AMP8Tb4KMlyUQpqGH
         xD0Ov9d2Lnd4rh7Q6gz4ABags0rqMMB5LKFmCbfUccumTaSpU5t9vYelTIDNWOVGUE+y
         oTf9wqcySF8hyp4/YXcXvMMYAlB83NyVpN09UxEz3Kbl1/DQfEHCn3wW/wJ0bPjK+vPJ
         iA+3YxbuGefylRdbgV/Sm26szbUJeUMzPipaiSd6+x71Xs75XIYCMrQ5rEx7aqjfG5Ph
         J5eXJwUP05/AxcgP2AGksZT9RS5VEfKzK1F6UOpoWm8c5gStdJ0bBwP4DQAZR/UxumF3
         nTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776672131; x=1777276931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyLNVnLhvqgP/9eazyTAksD1yYCngDRJ5jtR0ZQJ7/0=;
        b=dAAPeRZ7M0qnw9HqE7Il34OLvUJ2ljL24kAlEVA+y0Is1whqJ2ghIDGwhCOjIPwjP+
         fTNhisab9w3EZGMY1ZQOtesKY3NWz683kzlbNBDld6en72JPa2iAkhJZyVJQWl3zbvCx
         GVtn3HAe4LGY5+dy9qeLaqgZ1XxXkf8vGRPqXPZu1+boSFuvlcX7NQWEWc/nDP3pIa/h
         TkPVCXdCL7gBf5Pp3YJ+oKw8sSwtdme2YgOl5djOwU9nIxT1ASkoI9GX3iSAzKFsij3C
         SOyrLCFl31aTlOkfVKACkHyl8WPpwYhXfX3UIX/O5mOzC0+BBt2Y2aUzeTmeNQ8wQ42s
         jn6A==
X-Forwarded-Encrypted: i=1; AFNElJ+cuRZlFFGFo1bbQj2oS0+8+FHSlfVepTDIXvzJWMiq3c6XOybLsK0ZOCIIdTjL1IidhScspCwm/epLlgPjN00e@lists.infradead.org
X-Gm-Message-State: AOJu0YzX2OyahMi02T/lyN1BtYBs+N/vb+WxquSdBmHlz/H2lTpk91Xb
	f6ON2HFKAMLTri7mjn5BPjSgJLyvgULBOofq7tm/4GQP7MfhgonjgXfvB2hxxRE+21U9n2xioC6
	pRqBiseMNR2cJKLnafzJOG4+ZppWseIvU5TlLv8DPLI3G2oSgEAGxaZBNMNOq+IF0nhSYx85nW7
	msww==
X-Gm-Gg: AeBDiesB72Si/uHMXmgiQP7/ZyRhWSLrnYbU67SvsYKMAyRpAuAiZ7lJ2bPuDYqV8uk
	qySqiS6yLGZDGPTggKTyCCFzyuubdT/akiAcK54ScT+Mcl7uC1tq/EWiRprLi38k9QBMM/DYzgJ
	jvn/vYB9aIHbT01rswLwMvt4exPdQN7F3HkiaPizgsI8qXcWM92/FJ1H25JYXHF1FHqniLH+1MH
	g1xFbTZ88uLC7OU5IjgIFbCn2L6eT8VoIOgeFgHisDIO50iLvds38LhclNSooWbKPDEcSWLPCVl
	MVhdDerlQroZ1OwinAb8nk88UnqIcljnm9aVOfL8naCQCqb2zAe7lN63y9XQhAgvnvru7Sxz343
	plCO6WBUhsaBQcldz4Grdif6MtCYOtuhwrMZguDToRWR6S7Sk//A+aty2VWRJilmH5w==
X-Received: by 2002:a05:6a20:158b:b0:398:7b18:837b with SMTP id adf61e73a8af0-3a08d78d8dbmr13014566637.25.1776672130779;
        Mon, 20 Apr 2026 01:02:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:158b:b0:398:7b18:837b with SMTP id adf61e73a8af0-3a08d78d8dbmr13014506637.25.1776672130164;
        Mon, 20 Apr 2026 01:02:10 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8fcbdsm7098332a12.6.2026.04.20.01.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 01:02:09 -0700 (PDT)
Date: Mon, 20 Apr 2026 13:32:03 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
        Vincent Donnefort <vdonnefort@google.com>,
        Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 00/30] KVM: arm64: Add support for protected guest memory
 with pKVM
Message-ID: <3f52367b-f927-4d4d-9df3-bcd8cd954d47@quicinc.com>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NyBTYWx0ZWRfX9Z+c8v/DysLI
 CzXnkETwCmyYUgRKDl58/TGxleN7esNzFtGfm3AKqzaDs00N4BTD0qq2jcYjy0Y7lXKXfGLbui9
 63Gj+t51I75KopiPRERqLETLTylwPD88NTAoQuYIJboRCH5zs7YZfVbI2vbwrICfBiXj6EHe93a
 OtvjrUae37izQFmqRyEuzu7kWr88MHDDgabankxNUZETOLnIJzLtInn9EKrXJe9aq2N2C5ruJCa
 7krgbmrD+WGKXbyiE7BFlIyBs9Kd/4Pe0mPsfGaC+f1wy89hgzfRNdWFyfM/8qOtgm97aKDJyPq
 AVP3olgXZsXafxVE6lT5Rqc3d0TJdydn/B3EeliezWClk8QxTbG79KeNJsQonv9RO+8r0NXgr4Q
 cSRWUvgKecK42C5MGNIeoVzs/fW2gV9nYmHV8Z4TdvflW7VnZuw8B4JGBPdrCicoYPZQfBP2Y+S
 DQqA7Y2ead+DLjNoaRA==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e5dd83 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=s4NR7P1BVOtW2zOh99MA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uWfWO6SLXUXJ69vAG_nc86fFvBanOfR5
X-Proofpoint-GUID: uWfWO6SLXUXJ69vAG_nc86fFvBanOfR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_010213_961445_2CDEAEFE 
X-CRM114-Status: GOOD (  30.44  )
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

Hi Will,

On Mon, Jan 05, 2026 at 03:49:08PM +0000, Will Deacon wrote:
> Hi folks,
> 
> Although pKVM has been shipping in Android kernels for a while now,
> protected guest (pVM) support has been somewhat languishing upstream.
> This has partly been because we've been waiting for guest_memfd() but
> also because it hasn't been clear how to expose pVMs to userspace (which
> is necessary for testing) without getting everything in place beforehand.
> This has led to frustration on both sides of the fence [1] and so this
> patch series attempts to get things moving again by exposing pVM
> features in an incremental fashion based on top of anonymous memory,
> which is what we have been using in Android. The big difference between
> this series and the Android implementation is the graceful handling of
> host stage-2 faults arising from accesses made using kernel mappings.
> The hope is that this will unblock pKVM upstreaming efforts while the
> guest_memfd() work continues to evolve.
> 
> Specifically, this patch series implements support for protected guest
> memory with pKVM, where pages are unmapped from the host as they are
> faulted into the guest and can be shared back from the guest using pKVM
> hypercalls. Protected guests are created using a new machine type
> identifier and can be booted to a shell using the kvmtool patches
> available at [2], which finally means that we are able to test the pVM
> logic in pKVM. Since this is an incremental step towards full isolation
> from the host (for example, the CPU register state and DMA accesses are
> not yet isolated), creating a pVM requires a developer Kconfig option to
> be enabled in addition to booting with 'kvm-arm.mode=protected' and
> results in a kernel taint.
> 

Good to see Protected VM support in upstream w/ pKVM.

We (Qualcomm) have been trying to resume Gunyah upstreaming [1] efforts 
for some time but the path to re-use guest_memfd is not straight forward as
guest_memfd is tightly coupled with KVM. While the efforts to use it for
pKVM is pending and refactoring to make it use outside KVM is not
happening anytime soon, we plan to send Gunyah series similar to how
this series is dealt with pages lent/donated to the Guest. Please let us
know if you have any suggestions/comments for us.

[1]
https://lore.kernel.org/all/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com/
Thanks,
Pavan

