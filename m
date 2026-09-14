Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D652C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZAYEJxdeFjAwVE5L3W7h6pCWtSz8H6kR2tHLO5oA3V8=; b=Z0bP1FTqc5OaPs4SWfWKTtlRkp
	fxnh4YeIjJlD4e3zNIYpIUQA+8f5pWSR51QE3b9+DCV5lB26Dg/Jc3gFfIyQHpCQDrzGBCM0uRXjN
	AqgB6zpsDmPc/3C4ZcwQiBopkfSgcIqYhttJ0Oqju+DQ1t3Ie7lXL9QhwehnA45uRJDS6czs5FlWS
	ktAG+Ss+zk6TjFNvMQOqPvwpyWQ3L0g5AmIZuqzEza7xichKhDw1eOd+fsr62Opx3AW6C2kkmp1/7
	7FXyYG9ZrQC2zxYwN7hMxRtP8xLib54Bng5K/zAewObOSAaoZQ/AexNRjoYzFzyt6m3wffS67rikT
	slzkrmZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dn0-00000004doS-3I5e;
	Mon, 14 Sep 2026 21:00:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dmy-00000004do3-0oOC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:00:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EJYQLF1903381
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAYEJxdeFjAwVE5L3W7h6pCWtSz8H6kR2tHLO5oA3V8=; b=ADqzTKdaK1WkT0OO
	CUcqr5Mq88hxvRB1ZxCocDO92SEb/w5sRiOWWdgG/KyIvF+kSvDr0iNN1pe6XL0M
	/61AhcKgIbDw6Hc2H9LSpm8fPQJH4aIS4OycV8d3v+koSlh4f5fJTCsRAGf9kZ7N
	uITo0CHQYtotv8qpKt3CTFafGIPsiCXcodB3lQhsXWJDjhSqqxbnpZ/46tCilJhp
	n5ZoCgX0/kScPmCJZEaTzf6U3kJRYr2yEp4+kPFQZYYKPWH2/o3GwZRTx3r2W62+
	9Zk47d7IV7SF7rnRjC7icOQ0yXZdlLlVAExAFABmr0PkB5kpitVHF0R6ghWUyrMi
	yYHdkg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5u1d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 21:00:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee1ec30f2so42334865ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 14:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789419630; x=1790024430; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZAYEJxdeFjAwVE5L3W7h6pCWtSz8H6kR2tHLO5oA3V8=;
        b=jgMlHro1r3v8zIYdzspt6yddgIOexbOvvWQ4ovdKr1NqP1mDwvgZG3k8lNmrhUFO8q
         1C/WbWEbrOY5XNnz0jBrtZptPAhrmcRLZCLd1fVSfddt3JR4gKdZqvTYmRoW4eGILasT
         imjC3XXYvSKa6wYFIxZfrTvyx8qbyNbr3o2sjUOSDSNpXbDK7lbSpt2m4kYl2YAO6Qmu
         uMBOv96PeKTmS4Pl3Ibe/Vx9Ugt9b8jf5mczIiUJokBxLZkBOJ2Ax0CHgoO5cC2Llgj+
         AU8rmIPOjiiDyx9ghPWqzOkNsLH5jSVOj7CArpVrcvdUdztCpMZOM6Z8CH5z9yMIa4VQ
         2X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789419630; x=1790024430;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAYEJxdeFjAwVE5L3W7h6pCWtSz8H6kR2tHLO5oA3V8=;
        b=1IDnoRLN1oAeBNY8yfDt4wDQn5M6ysHgEVNjVtZIBFjZd3ltfUkwLL0nLumiWEjpfp
         rGQMtBo5h0x7nIzRLgDhFzkqa2mxC2HCSaTkTK9Q4+RNKh0uNsBoDWOOzntZ+ZKNmnGP
         I1m4sFrssFoV+LAarF6pWOFTzKvsJNorsA+Yy6lJFyvzRWFtAmgxG7+T840z/LQa9kiJ
         mB31vPrHOySHlzz8DR+aGmIcKV/Kn/RBSF5Ay635Ty2xWexvuq6mkUAw3Sn2eOwYM8Z6
         MjmnlgBYbT//flqYEG/L9xgd4ogkupE+HjFUQA8lt+xfuIusa/LOhkYqeFEHENtPTR2O
         Oi6A==
X-Forwarded-Encrypted: i=1; AKwUvByUaM/rVvYKfk8KNlAxh5jq3l3An7z/Kqb5GTaAAMhBzT3XzwIM+/nmQZTxJ6yYBxArTIMg4KQAH9AHVhlzChAQ@lists.infradead.org
X-Gm-Message-State: AFuF++mdlaJouxKfRdX9RwkWAhBUbL6kx9+NZsUzP0+jDI2mXH7VnzGe
	EQMyJfKdo1Ttpwc2v5JlfjrI16A8ZroCbL2d76nr+dH4Dc04wZbRKTYpuhSgwLbYYdiFR99o31N
	8o5kO0b+cYhQHV1v/cl4/JPhKpMhQPpJ2eIl4ljlTcO7ihYgWBeM1Nn5BVOboExJCAHodZlWDJ3
	K1mw==
X-Gm-Gg: AYBFou2mCfBiRViYgPlCtlGZYEbmwAdRwvBJ+usV27yjBkx5C1RyVxMdaKKJ7cgKsMc
	pkBWfcrxW6NDC6UFpTb4PqVNu7hM9EP6kSNMM8jgsiqUWycIDc8ynDMIUCNyarRga8nMu3Pv9Nm
	e3ZCife8oIDalomlbf/yQiVzCu92bXP/vFGFtaQ2fjCV68iGtFrnxcKFqTCBJiqKl47cYsProe7
	Oz0xI2+jElPzxfGs1NB3PYJZ4UKNMAHFD4jvftxfudOMptp7hBD2MF8HoyMYW9TP6+Q+vIbgLx4
	DFGx7JnM1CzeCbbo2MuiU/LOS3XKNRfTBf1PV7L9bK2EIiQhbaHFSBRFTvrnsn793xid8ZP+4Tn
	pKQPhoU69mfQNvZ/y2/jensiga+s=
X-Received: by 2002:a17:902:e801:b0:2db:331b:e187 with SMTP id d9443c01a7336-2dd6c5f3c7fmr81467475ad.8.1789419629464;
        Mon, 14 Sep 2026 14:00:29 -0700 (PDT)
X-Received: by 2002:a17:902:e801:b0:2db:331b:e187 with SMTP id d9443c01a7336-2dd6c5f3c7fmr81465905ad.8.1789419628575;
        Mon, 14 Sep 2026 14:00:28 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm30638408eec.3.2026.09.14.14.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:00:28 -0700 (PDT)
Date: Mon, 14 Sep 2026 14:00:24 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <20260914140024.00002024@oss.qualcomm.com>
In-Reply-To: <20260914060511.277948-8-aneesh.kumar@kernel.org>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
	<20260914060511.277948-8-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDMwMCBTYWx0ZWRfX2fMDpCPjUmah
 AcBCFiOKW2hfNEE9IberbrgB63tKH9YiBBchpluwHGD0xfxb15yEzLi7JcysutlXDVDH2jACfrE
 xr0tmpPESMxgPtgJB8/PuVDFb+V8vQw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDMwMCBTYWx0ZWRfX+RN/Nt+pzCBC
 ixjx9LpDt+Xd8qMeOlw6NWqDSUDAy3G4M4bxAg7f+RQf+2SaKPZBxFgqkfqzypUJk7cmJ1IAaJB
 TpjiYQoE4+5slTzRZE5wRt40+NQzrpMnJgpVGCbmBhXXNJc97YxpVTs9G4UWAvWkUE5X2xhtMfk
 36zZdk2rex8pTPEAqScXzNPve5LeI1QniS1CxHe+/1tknV7KXixYGHvuuEfQI5jynSXW3Z778mo
 kgAMT0gShlC4JCfPq910XMzXxH1m1RsCUrHmQq0LMCAbWyNIVfyaMjAjExV0JTzFRKquWCBaUm+
 70GIRCCx7adC46z39ttGDOBp0L+V/Z9zyL0B9cqNwX53rvl8hEpb5bYUx3PP3RP8yqRBLk31aqz
 zoolctlX08bz+STk1N6X7N2y5ucs2TkudWZHkbvf/ZxU49pJrMuMzsW4UQwyHWzPooR8MAi6ioJ
 xe2HQlsMeP5H5PQKcqQ==
X-Proofpoint-GUID: obDLMipsyvtDwVC_UUI1OiQhUd25C_Mc
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa8606e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=JfrnYn6hAAAA:8 a=RSa_GfCpIaWGdN_FLdYA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: obDLMipsyvtDwVC_UUI1OiQhUd25C_Mc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140300
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_140032_354948_7AA51DB0 
X-CRM114-Status: GOOD (  30.48  )
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

On Mon, 14 Sep 2026 11:35:11 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The SMCCC firmware driver now creates the arm-smccc platform device and
> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
> The arm64-specific arm-cca-dev platform device stub is therefore no longer
> needed.
> 
> However, userspace has used the arm-cca-dev platform device to detect Arm
> CCA Realm guests [1]. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel device-model
> details.
> 
> Add /sys/firmware/cca/realm_guest as a stable, architecture-provided ABI
> for detecting whether the kernel is running as an Arm CCA Realm guest. The
> file returns 1 in Realm world and 0 otherwise, similar to the existing s390
> /sys/firmware/uv/prot_virt_guest interface for protected virtualization
> guests.
> 
> Remove the dummy arm-cca-dev registration now that userspace has a
> dedicated CCA Realm guest indicator, and document the new ABI in
> Documentation/ABI/testing/sysfs-firmware-cca.

My gut feeling would be to split this in to the new stuff in first patch
and the removal in second. That would make a revert simpler should it
turn out that someone has userspace that will actually notice and can't
be easily updated.  I'm not that bothered though as it will be your problem
not mine (hopefully!) ;)

> 
> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

Could make that a link tag.
 Link: https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com #[1]
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
One trivial thing inline.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  Documentation/ABI/testing/sysfs-firmware-cca | 10 +++++
>  drivers/firmware/arm_rmm/rsi.c               | 42 +++++++++++++++-----
>  2 files changed, 42 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-firmware-cca
> 
> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
> new file mode 100644
> index 000000000000..bf177d636b92
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
> @@ -0,0 +1,10 @@
> +What:		/sys/firmware/cca/realm_guest
> +Date:		May 2026
> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> +Description:	Read-only. Indicates whether the kernel is running as an
> +		Arm Confidential Compute Architecture (CCA) Realm guest.
> +
> +		The value is one of:
> +
> +		0: the kernel is not running as a Realm guest
> +		1: the kernel is running as a Realm guest
> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
> index 2dd69febedbd..52f40256bd78 100644
> --- a/drivers/firmware/arm_rmm/rsi.c
> +++ b/drivers/firmware/arm_rmm/rsi.c

> +static const struct attribute *cca_realm_attrs[] = {
> +	&cca_realm_guest.attr,
> +	NULL,

Given we don't want anything added after this, no comma ideally.

>  };


