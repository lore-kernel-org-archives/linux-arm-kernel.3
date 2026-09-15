Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF8AC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 23:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXdEkFs+2jBbAlp34VMYxKpRmZ4A7s9s9pc8ZFfcFQM=; b=GxDg6rgHZV95/vGsGQY9TGmYZC
	paTIxAk2vfN7W96RL+K1sjYDXpfCrhzELyJdxAu1WFbrwzs/ya5OqnkIMwwC3N+bMIws/VutT9d22
	y29zHFgpx+QId4XZtfp4+lnCakh0mdVbNsNs6585ONG0mRGt4AsBK71G5lQbFwORi41tQW+TJPAHk
	CiH9NauKVOTgZqjrRmEDnvDS0AHOjm8arTeHkLC7ASZM80HNeRuAh7SGeHPCXHQlPjjJ+QVzXousy
	BSR+PabqhflUBhxx1kzhiLO/xHc5Cred6QCPK4cZzmK/bnzA4NGRLL0Y+INdQC4H3NzRbATcmrzYu
	KhqnJgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cTd-000000083on-1VJk;
	Tue, 15 Sep 2026 23:22:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cTa-000000083o3-0fVZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 23:22:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYula079855
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 23:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXdEkFs+2jBbAlp34VMYxKpRmZ4A7s9s9pc8ZFfcFQM=; b=c1C0ls2rJ6H7oNea
	dYoIXwjesL5h2aMoSihGD7oBDL3G+/FU4H0OjwUDFfMUkKJQK2HpJbexUb+QHrk6
	ZsmDdI6h8XLVUcYR0PDLCFFdh57RprE+LnqaxMjjUQm/QRfGBv1bLHVxasx/XYjY
	UobEYpxjy3G8HmwDazQnArrvtm26NFDYlmm9G27XtZ0DnioZcqaBus4sMWoM6TbU
	h8QyR5TOWAwWpi3/UH5DgSMgejaozBCzOXj54Y9hPFFUAfKAc7UPvMARkXcXZ+ca
	Poj4zo7G64BcOP6MnJQzZ3+rsQ1wBLfTTT6UtgGuxi7b8kXOEsRneyvLoHJkL+Mz
	6VgWxQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagehc06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 23:22:09 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8663802b58fso5349450b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 16:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789514528; x=1790119328; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oXdEkFs+2jBbAlp34VMYxKpRmZ4A7s9s9pc8ZFfcFQM=;
        b=W/6qbiV1ty/qrjkgukV81nvjYIWwLk8It/c+j1JZ/qdfF13D57goi4Cyb4hM49y1u1
         IZ1SmXwR8C4k+U20+0o4AfLmyTO0WRQ/p++LeEiqIU30VF0yjzkVAz7R+vmQgE6gxn78
         799kghVzpe2svndp4wM5ONzGYEwkqB97FPEkXgbWfl3ruX4I8FlyLNWTrcJjmPH93QJn
         wFnZoMP1L1pIh/hJ7NPPG3FOKJZVBUnQsVbX0/JtNU6OQGxaZvdGNmsXwgdYy7qqswdH
         I7wytwmxJG8biv4yJq1x4fH0dIXIOWu27pvgjqTNgbU4g11HTP2WmQ8Orl3xoR9ZlFtd
         LsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514528; x=1790119328;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXdEkFs+2jBbAlp34VMYxKpRmZ4A7s9s9pc8ZFfcFQM=;
        b=hG+olb2GkqOw3FtTGxn2IBhiesKD9vuYvPtKekHfEqBT/I0xtF72D9bkr4Owp2m+zY
         l8wJ2GnzFPhkDiuhajfyaGpbxKTG71ywKQUakVjT5VuHLJdGGvMeBMQTTkYkW6Xy4XZr
         PKJjdyJa11Hwl75mvRgn5gSccdYTThL/aCkdzFWPWzkvf+cK5h6FynflZaDmW/aHpsmT
         rU2Kz0tFIDu+dNZwr7QswNcU0rTvaNXMkJVUnkzybct7cNK/fSiILp+bBMDSsp/gNhHQ
         OZByOMGkQpMdvct/kSCGJ63HAMswrgw0Iz/6AVgFNhcYD3sDit0dMojupgstfUyJ6/F5
         9guQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfOnSEkrXhHon2ifOzzu83MsmNgW8kLbY5XSZokdUvj62U+wCqHhVw5FD0prOqLKoAuGpfU13u1hYjueajl/ci@lists.infradead.org
X-Gm-Message-State: AFuF++m+muZv2uHF9G+JPI34xLbD/hFJIRjo7i9U5rg78Xyi0x3Tt+4Z
	5D070Bp7yKQT62RT5x66b12Xvwg+uEfWxwdMG7AMlYBr3j5kQRTnxJSiWmwJHOVhE+9kCKsZDj7
	LU72RYeD8/QFAx0ZaS2dns+KhPpIvVepEHkvQXyg1UGtH89PQBR+4+qBakg94jU3n96IVNeimo9
	RjJw==
X-Gm-Gg: AYBFou3QXa3ZaIlSqd0kFAjN5LVDFBSOy4EUNzHu7O7ywur7WjClO9Hwqn/pKO51PHw
	lqTA+8LAcGMhQW1H0NwMWu/yKjQutXRwpjf1+zD52xRaJ3dFz1Z+d7YCeH28jepdNdr6A2Z/g0a
	h26wCl/QIDxciwLUcXOHBO6YI8qqO+ItStXbxIlibl7gTDzS8oP3RG3A4zyfS/WgKuoLQCZB6S/
	HAPj+OqwARG2PwTRnTeSPNEk8cgOkj1OjAjU3mBLVU3+319zllwaeTaoTnaTD4GCWoIOofLOxKW
	h+WdeqEiT8MzjcnhfVqrYI2WvHHiAIOasFP50EIH4rRAijRTvjXgbtapvnCLIgOYkGS0T4LdkKc
	GZKzWSJuotqDMiuYUR/eppU9Kwu4=
X-Received: by 2002:a05:6a21:9090:b0:3d0:e034:a26f with SMTP id adf61e73a8af0-3dd5f5d8672mr1167674637.17.1789514528289;
        Tue, 15 Sep 2026 16:22:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:9090:b0:3d0:e034:a26f with SMTP id adf61e73a8af0-3dd5f5d8672mr1167615637.17.1789514527903;
        Tue, 15 Sep 2026 16:22:07 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b0520asm2203060eec.27.2026.09.15.16.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:22:07 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:22:04 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
        <joro@8bytes.org>, <bhelgaas@google.com>, <praan@google.com>,
        <kevin.tian@intel.com>, <kees@kernel.org>, <smostafa@google.com>,
        <baolu.lu@linux.intel.com>, Jean-Philippe Brucker <jpb@kernel.org>,
        "Eric
 Auger" <eric.auger@redhat.com>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <skaestle@nvidia.com>, <mmarrid@nvidia.com>, <skolothumtho@nvidia.com>,
        <bbiber@nvidia.com>, <harsha.v@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/15] iommu/arm-smmu-v3: Support PRI Page Request in
 arm_smmu_handle_ppr()
Message-ID: <20260915162204.000054b9@oss.qualcomm.com>
In-Reply-To: <dd1ee0afb947b5f7c229c21b7fcff5d18f9bc326.1789446520.git.nicolinc@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
	<dd1ee0afb947b5f7c229c21b7fcff5d18f9bc326.1789446520.git.nicolinc@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX4WmThVfuvQYM
 54DUCsJcSdfGlSYyy1pfwvNGj0dAfTWG3LWGri+UH7NESSaei9ltBk291ce3aQSudO7TGHkFWU4
 biK+hYtuv+RcTYQOe3oh0xfsVgW2eY4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX4QIBryH4tJ/T
 HEZhI9CRo80n6V9jy4FkDcVBRj3vM387zH2WNIodV0RMc92WD5HQdxwzD+yrPWqKq8oBpfzen1+
 wOK3ix579T72vQuoLtQO0bZ2SPvUP9e198UyUJjUDz1dgFGHILHmtan+QSMlXUVoH+Vm6yHNwvJ
 YPVLtaf0AGVrEaSSNvpGuPDK+pL4gFg0q8jGTMPreU37TRGPyaJLX/3aaemByB1PlW5w7kOXgDw
 KVfWXphKcEyxo33XuGSQiCfVRyTZonCqShydeV2mECH+V6L7yBgjkJNuj5gNjOuHcl74G1rh2eq
 3da8biDuR4kULK/6z53TT6IMC0OH0+90BGL9InhOcjXVeGzZZ+ME2+iph+a1EBIGNgTtBKK1xcW
 LAHje0y9qTUKVF2LVtENedggNb/bM6llV3V9Q/tbAEud4sdS+XNnbwaxSU9zaKe5toFOz2xBGKs
 OZ7fnLvrNSY9gmpKazQ==
X-Proofpoint-GUID: Lnw0rAxV9lRe9K3BgShPN5pPpRA-3ny-
X-Proofpoint-ORIG-GUID: Lnw0rAxV9lRe9K3BgShPN5pPpRA-3ny-
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aa9d321 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=h35TsNJSbmzmzvWWgmEA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_162211_166587_E8800E99 
X-CRM114-Status: GOOD (  18.45  )
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

On Tue, 15 Sep 2026 09:38:22 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> For a PRI-enabled master, convert every PRIQ entry into an iopf_fault and
> report it through iommu_report_device_fault().
> 
> For an unknown StreamID or a master without PRI enabled, keep the existing
> LAST-page DENY path. Merge its two messages into one ratelimited line so a
> faulty device cannot flood the kernel log.
> 
> Discard any PASID Stop Marker (LRW = 0b100) prior to the fault report and
> the DENY fallback both, because a Stop Marker does not expect a response.
> The IOPF infrastructure requires the driver to discard it, as per the doc
> at iommu_report_device_fault(). This also matches the intel-iommu code.
> 
> When SSV is clear, the same LRW encoding is a PRI Page Request that expects
> a response, so let it fall through.
> 
> Note that master->pri_enabled will only be set by a later change, once all
> the PRI paths are ready.
> 
> Co-developed-by: Barak Biber <bbiber@nvidia.com>
> Signed-off-by: Barak Biber <bbiber@nvidia.com>
> Co-developed-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Stefan Kaestle <skaestle@nvidia.com>
> Signed-off-by: Malak Marrid <mmarrid@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

