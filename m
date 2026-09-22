Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F15C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 22:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ij3pQRHyLZbZtGm1WSsSpgH2KR2KK6oLa6dVIzgew98=; b=v49SAlK/IT2Ein3eJ1eLO8zq6X
	nd9qzuiX5NC2PmEmczOj1//C9cZ6Jw0EKhTxv4OdMSN/hfK4gSVkY3iLjGWB21USMoAtygKXv3as/
	KrBVGPz+n5IB8hEzHbCFPQ3W/k3nMIQyVoBCI8Ckv5NsxKVkSqReoCTV/RGJ6t8TO1vUGIq++c4R+
	a+5nzUStvDr94XYG90qiA2Gxvnsn04B3Nyn0p81inndmLnIMHLDdwwcITHTi01WNKjfsclKBBdtVj
	22gvmFyQtdIqP7LFf+e6UuILzEpBKbuxmR8YRm1v9j9KHnhOQTFK5P1Abi1+NLDVjsPfOa48Hz45I
	Zf2f6Qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99Mw-00000006hxb-0m82;
	Tue, 22 Sep 2026 22:53:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x99Mu-00000006hxE-26AZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 22:53:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJD5jL1166839
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ij3pQRHyLZbZtGm1WSsSpgH2KR2KK6oLa6dVIzgew98=; b=T0jMB3y0rL8j0v0n
	uLQ9L1ct+DF5ggyvqScz234nKNMbEy/2euOzbMqYlNwebz2EMqzizBoskOik5kaf
	5OJIIYXDaGGMxfc/PbxdMF/xa4eAmIHoSu9t2LwPE/BrNcUHf687+RrvoMq3mckU
	/ss+V85KBbnPpfroU9jjsSPT4EiBw2ScJSrw60JNNHk8Q5KBD3+Z74OtnL05CGbJ
	2BeU8SYiC6J0gBkULd3MqUx1qpkZmxmzDe2RreJezeE8IQmEu82IDQQkZ3jzRuJQ
	Y0efI4/JaTIRCIlDteaRp6xaaXgm7pLAJ+UrhwjYelKZ63sE2RpbOoQaT9CkoG7V
	Rz3sNQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw0ydm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 22:53:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so399248eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117623; x=1790722423; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ij3pQRHyLZbZtGm1WSsSpgH2KR2KK6oLa6dVIzgew98=;
        b=GxVLsQCLLStbTQuTeL1owG/mqkCiR4MOI+RF+a8Tvm9LUeXMaHAKnjVf7OisSuXahz
         M1CoUVxg4ThIkMcwfFK334IY4L3k2byUKk+Op1SCQwRUPjRzTFxFkT5SvePdXWyxHSYa
         zHDsHOzHC5HP6TxTlYtpjY+1v8T7nN6McQwJkLrRX37pWXQ1xFaLNk8bhZoZtKNO3AcS
         faBGv28ynCsOhIgM9kANvRxDWaV6QtKeOotn+QaUczKlI2B2VhICEzwcIcUpnZ1XYTCo
         EVJUgKoBQI2fRl1ja/5jVMeYglP2UXoVt1aaa/mMehD14kaHEW+xuiwOY5xTKVmZ6avs
         2r6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117623; x=1790722423;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ij3pQRHyLZbZtGm1WSsSpgH2KR2KK6oLa6dVIzgew98=;
        b=qKaQ69I30Hfq936TEoxQFHB7wrOmqCRuWqtcLJyfx3cWSp/NusGxIfwMnoTgAOWhhJ
         JHOvWpl1UbimXLvjenR4T/SVc91wk39eD7TrC5gdmBtoJjCdRWs00eFBd7kyCTeu4pYK
         MtND2dwcV5DcTmJ6wSvKlPdo7uZ4EzkyrK0bYDSwjlnyYR4h0tPt/ZvY9RvFJwgvRcH9
         /UCxt88xBDFLhoNEjbYuiXB0nXcqnxnv1BU7ISRUlfyrEv+NQw0KjYvK+cSuPE08du8r
         ooz8UBeRtQ+8ETxpIHa+HGV4aO5YxOtM1TVmmaDOE45Wy+X+zTF69tOPXyqvw6ZLEdPX
         IfkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4nPz1CJt4a0hAGdbUpIGTSZbS8drTlJdEIMFBdxhEU49ZS+DmaPqmO1cIKe2TT3/fB7CRVzQl+YAZ30WQjAT+@lists.infradead.org
X-Gm-Message-State: AFuF++ll+iM+QUbOSRS3vuy4K/CC67HANrBFawX2J2Kiliwn3DGPZ1CG
	pgYmvF8XpjSd9BjJmb+ko6FXdHBpiLGUsLe+IyR+7NGlU+ouS1YipK/lDFiDk/huNad23i0Bz1Y
	Te3tQqh/nfyuRrMhyVQhN/CYYpxS53Noj/1Zl3jT1X7W6ee5eFasmEWeQ7XJy/MeIkuYl/UnbCd
	VSQg==
X-Gm-Gg: AYBFou2eP5Bho2M4pkbQkxO2dn+0WjZlMhdap+a9DM1w5Gv5CCRUChLyUqh86vzfwyq
	Me/VraDwvWQCwB+zRXkfRq05NpWxhu80jwvfanLAovxDx0MrKdyRVzmy5qKdnzkRz9fokrpBr2z
	zXCGnbfhpj+oQUzMmxbmt4E9z65UK+nOl78LFpya3B1DrLkDPzxNlhTiLbA4tudIuqp2f1JCSSj
	tmwgyVYHukJpCYBdCjI9X7YBnno1KM2RKH140ehqloW9XuVAX51Z7XDyyITrOAubCTM9gx1xFuF
	nqY9p4OyOgLT+DQWqHBJkuxAgIugk516UiXHIe5pB8PLuJmN/EWuVB63byS1pHuqiD8oRo8pUR5
	J1wYsdRtINh763tiQ6sz/7ZB+d/shLL8Wcsn8yFQX3/hjswoa5L80KA==
X-Received: by 2002:a05:693c:801c:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-33e8c250524mr868844eec.15.1790117623127;
        Tue, 22 Sep 2026 15:53:43 -0700 (PDT)
X-Received: by 2002:a05:693c:801c:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-33e8c250524mr868793eec.15.1790117622505;
        Tue, 22 Sep 2026 15:53:42 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96848e18sm1178819eec.17.2026.09.22.15.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:53:42 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:53:38 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 16/20] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
Message-ID: <20260922155338.000064e5@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-17-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-17-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX+nqSYKlHkYCu
 Myep8QBg/RPHNJgdbFTgRb6y1tSxtu9wU5uvjiHg337L9qI4YXTnXR1pCwqWHFKu0/D4U4kf+11
 g9W2FPQHgkg+jeHx1A6tM48Oew2wFCf6U3eAjHfPO1C1UZaOUTK0hjm3eq8YlWeNaol5EX55xeg
 XA7Kivvy5BFg+Nsv9JcaV/ENdYVjz0KIt2fTyWZQucFCddH5F338gLiqV3NKolfv7FHu6bYupnv
 VZoFMfSb0qn1NSosPQK3h8WIl51Aib8TSZ6xUZWkKOxY9IjT+CuAdnTo12QWPgCbrSJ3EF2cB7t
 CG/y3WiL2zlD+5kjH30YW4GapbIu+7B3hibwKoENUzvpSJxPd9w17lpL95XgAo2DofC7Eb5Oovs
 tdbzGQiyd1FViLT0d9g6oon9dDelw7jnEtFn6h68o4UN1bQ8A9YFqZSn9j3Rgf8WICGO4M85AbU
 uEFapnVOPzUxERLxWtg==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab306f7 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=z_NLTHdx8yjNkCs6FmoA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 95w4tP4SLXhZYcNSRLUqbhYcpAQd_5ee
X-Proofpoint-ORIG-GUID: 95w4tP4SLXhZYcNSRLUqbhYcpAQd_5ee
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfXw4C2Kc1tSYEW
 hPdp4OSHqxM/JhxtETrFm88J1owV4kqenVaWKFKkI3t/pxobHMXcgj0taHGJrjIqVPDfMVdAStS
 2cOYkqTGElMyBvU50SBp2uQWUDXj4zw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_155344_579312_04381582 
X-CRM114-Status: GOOD (  22.18  )
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

On Sun, 20 Sep 2026 22:28:41 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Limit the capabilities that are allowed for Realm VMs. Similarly block
> the vm_ioctls backed by the capabilities.
> 
> Repurpose the kvm_pkvm_ioctl_allowed() to support both pKVM and Realm
> ioctls. Rename the helper to kvm_vm_ioctl_allowed() and move it
> into arch/arm64/kvm/arm.c. Also add a generic kvm_vm_ext_allowed()
> to handle pKVM and Realm capability filtering and route them accordingly.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
One trivial - otherwise seems fine to me.

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 86e705330d7bd..eab8543a4194d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c

> +/*
> + * Check whether the KVM VM IOCTL is allowed. For pKVM and Realm VMs, certain
> + * ioctls are not allowed. Further, certain features are allowed only for
> + * non-protected VMs in pKVM.
> + */
> +static inline bool kvm_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> +{
> +	long ext;
> +	int r;
> +
> +	/*
> +	 * We are guaranteed to be called with a valid kvm instance, as the
> +	 * only caller is kvm_arch_vm_ioctl(). Catch any deviations, as we
> +	 * rely on the kvm instance below.
> +	 */
> +	if (WARN_ON_ONCE(!kvm))
> +		return false;
> +
> +	/* Cover both pKVM host and Realm VMs */

Comment is a little confusing.  This is the path that covers everything
other than those two.  Maybe 'Rest of function covers both...'

> +	if (!kvm_vm_hyp_is_distrusting(kvm))
> +		return true;
> +
> +	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +	if (WARN_ON_ONCE(r < 0))
> +		return false;
> +
> +	return kvm_vm_ext_allowed(kvm, ext);
> +}

