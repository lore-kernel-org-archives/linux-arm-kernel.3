Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C45FC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnrhxChuvUvmnhUjftdL+cEY05K58EtTFKjpp0G3HSU=; b=4dXu23ASOWljVK/RxSUVsHakxh
	JWSQUYstNmNxdF9ryzheE/Iq/6hZfq8POLcivoN3PlVwIJkYEBHSWOG6qA4/7L3zS8Riz4vXLfjy9
	FC/iTsCuFUqod5aLHdFunKtNTcjqXShlOkScxwOuevb0iDR5SE6vDAIrCmiIx1JoWI0AOoL6850tq
	3+8ChA5YM91Yp/2t7ud7RTcIe80fs+LXgsjJEVyEwZ6jtF7W+zn7z9d6fPC2iQS6XN95ErqkZWXQV
	hspV3NV2IV+gddU2/fLiYMZ8nbCMoG1D44FhnO1PLMYpkCj4LbKbiiJZ1hhdhAG0aJ0gCwRIcS+x4
	R7ZvDkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW92-00000000oji-1Hi4;
	Thu, 13 Aug 2026 14:10:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuW8z-00000000ojM-2hFn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:10:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCJn562359442
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 14:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nnrhxChuvUvmnhUjftdL+cEY
	05K58EtTFKjpp0G3HSU=; b=F1pcNEgOoZ3yp0g3uucPc/lGIbIftg4yj93eVVG9
	G8Cygm5t09wMBysVSE1jAhc9qeIaD341KZ6skiYE1bu6JsYTZo51omzlUHy95+uq
	MoMH9vnOU3lwMQBNxRVVcs9Iuo3mpk+lRg4N9Q87INoIKyQfR9LVJpSoDYUyfF6Z
	CjrBiDuwKyLlSulMnczEQPzBn+aWtW6Tarv3FmBnNUwXEwpVA4g1zeIsZ2ltk9lh
	4tOcckJwORwstjwVy5QeYF5AWgQDjlGLYowb1HPMFOpCmRTbZHbUHui0y4hGqi5L
	9kQ9eHIEUZctP86420PdCrEbooubRFj8vhiS7WYeUxLgjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1cb5gufc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 14:10:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so17307495ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786630252; x=1787235052; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nnrhxChuvUvmnhUjftdL+cEY05K58EtTFKjpp0G3HSU=;
        b=PRmgGl68DOKtfzjENDsBCN/CvXS5A5NzYFtGj9Q+aA9WsJHqNGS06a//qtnlPyLD1a
         nOYUyoPd9/BLLlrbLMnTTErKziwllzP8jzcWKzSj1Uxa1WhFMZVaL9iFxKD5w1auZrfC
         ESDc4M1Q9NcI9pl/R87mWPD4f0UKKS+LSZ2B0ZJsUj05I+XSMlZ1w9vfsLS9fcnTn4ZX
         LRK4XbCqf94r9eg+BSNFLi3CYNuI6xL0kCge1xIUMVoi9Mwrgf4Z7Fow01Q0fEbamIDO
         TcVIFhG27bziwy6fRv8Nf6YXCvYQY6hVqyVsO9PdEfSsXlPMfUzuW7uke7Jax2Rb1U9B
         yfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786630252; x=1787235052;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnrhxChuvUvmnhUjftdL+cEY05K58EtTFKjpp0G3HSU=;
        b=NtQpYo2Mf2VVIkbugjeybFZI+XOLzoLLhI1AdkoGnHQog1/lLp3DL/Ldz0Oi710A0N
         l2TS7tE7z6ViEXdy5B2tbHDzelId5/zo9L9dFZje/sRA7MlckQWpIJY7ZdkOAkOIpfxq
         aPWitr4WnzpUzc6RV1QYAmP097zMxz6Orcg0DyGP0thqi0dkwLR2Gm9eceHq6ekqvZ2M
         eC9fyowCQBQUN5aWMxl64vWWx/EfKY3QwLnRXpNHkVAANo5wHh92QeIf+JEUWRgMzhcX
         tctGs98g+74lqa8BXSZlTkdSGnkOqS6+S0SDExwWn+aI5Favdw63GWXdRGqKrFubQ2vt
         k/WQ==
X-Forwarded-Encrypted: i=1; AHgh+RpD+6b4he84EnSfv4YSj92a1qSo5jka5Cjn3pvDLJhf8/wo0g18er2Y4FlnD5xiy42K/2XMpiWkfIZc2xkpsblz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4W5HeSISpqopd3BHyV7eeOCEUXun6W1x8CnamVPfA8WCtBPOU
	f5jypU5DDdGg7+M2cvO8VlLhBvc63e5t6Yk+nAHDlYR87LW3I8U81lAiFlNtWt+nRtRY/YaaMzr
	CHB+Fz2XSElsqbZ6HIcGAsm0U8s0RUfRyYqME08XBfFN86WmmB8evtlSv6NuEeB/7ymQXE1+O11
	OQWA==
X-Gm-Gg: AR+sD11b8VPyyB7YP299niNfrdCclGAI5QAXmxbOHtaTxaxSqVzsGrWdzlG4rmSm3PA
	C8Ksip3++Xdz32XFNEJY3ALNpPStIj9rX/B/q5CZ0xKE3JJymKDcmWLT+KCB67oSeF6vJym9I8Z
	cG08bjMEGKjBhyocp54Hj2z9Os7FRLEajUB/WmvyOjwIaHe21s3sG5Gb+GBoo7p69s3GnuxwJ/r
	NW7REjCqdl9xo6OKuf+2Q9qhX0od82z4c+SfeOoO6YL66ewJqBTGPk2sbvMzNcXWmovGlYs40vg
	tf15VeTXTeYqzd3Vij16FVKOzQ1a3xKKRE8I3hJsf9rU0qjSqkrjLv8eDD6T/lKqttRp45d3FEs
	l6F73UPLM0PR7vGms2naqj4dd5qcwAhH2vg==
X-Received: by 2002:a17:90b:4fc4:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-3931e304a76mr7286865a91.21.1786630252142;
        Thu, 13 Aug 2026 07:10:52 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc4:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-3931e304a76mr7286722a91.21.1786630251469;
        Thu, 13 Aug 2026 07:10:51 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec082633fsm8518276eec.28.2026.08.13.07.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:10:51 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:40:41 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
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
Message-ID: <8db602b8-7fd3-4c11-8fbd-3b8251648eb8@quicinc.com>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-8-steven.price@arm.com>
 <ans1ZSwMEKeT9Gfz@arm.com>
 <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
 <7d4e5920-aa20-40cd-954e-037631bd0d6c@quicinc.com>
 <anx6YbPMVz3OlpA5@arm.com>
 <an2YN7kxB7bjCd2s@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an2YN7kxB7bjCd2s@willie-the-truck>
X-Proofpoint-ORIG-GUID: jH1QsFkj68RD381KesnkypA8GctNnHrE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDEwMSBTYWx0ZWRfX0j4qj0YLa0cT
 eWYhNgA7ngJRAwLqO3RVKEG2lfxOiYc/4SAdY2k6aY/uAvvYJhcwI6W5MUiiqLVJJtqweHh907X
 GG/ERmNkozW0t2YxPM/SBCqyCSoHSsc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDEwMSBTYWx0ZWRfX0x6Ey5Ji9Jzt
 uu/xK5Vi0YVjVK3t3G9zTFUl+gE6ZZ785/Lvik0nl4mF/Op1ROkAtOdYN7aTUbC9i3EX+UOPBbD
 F0ZC6L1BQQ2zrXXW7X/5kLajSeck0RmS1ch9vUkcp1/VnzAKHwPZ5J53FS/6A7tGlroCelkFMHI
 fN6csLnlSitHNHL+LvnMaHFc8x2vNFaR1ffz4L/QXVvfuspi3RwyqyQMDN4lSo7V/MGQOYHAKO0
 2hcs99VNSeEABbKypfIzCeKOp6lLLE1Iq3gHTmKaAfxZ1OjtLnGvybJrO7eti9Z5f/Byn00iyYA
 YXD7LCPOFUjSF/FIhnuq+pfp+5BheWEwNmxGOrpk0rC9VIxeNAhjMSRHHyWa0iJvHdrEMf++8ub
 5N0iBIK7P8RQWwq7HaS+Hlwww1Z8Vr2szWpNxORDcdf61qzPwhMZzjli56icE1gfeiIQZtw4nM/
 yQeOhSLQPSfu0nYGzSA==
X-Authority-Analysis: v=2.4 cv=GoNyPE1C c=1 sm=1 tr=0 ts=6a7dd06c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=vggBfdFIAAAA:8 a=dIWtD5pVMjQwIhOhhukA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jH1QsFkj68RD381KesnkypA8GctNnHrE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_071053_684948_2C354BCD 
X-CRM114-Status: GOOD (  25.31  )
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

On Thu, Aug 13, 2026 at 11:11:03AM +0100, Will Deacon wrote:
> On Wed, Aug 12, 2026 at 02:51:29PM +0100, Catalin Marinas wrote:
> > On Wed, Aug 12, 2026 at 06:12:09PM +0530, Pavan Kondeti wrote:
> > > There is a valid case for fixup_exception() to be needed here in GPF
> > > handling.
> > > 
> > > -000 |load_unaligned_zeropad(inline)
> > > -000 |hash_name(inline)
> > > -000 |link_path_walk()
> > > -001 |path_lookupat()
> > > -002 |filename_lookup()
> > > -003 |vfs_statx()
> > > -004 |vfs_fstatat()
> > > 
> > > We observed this in Android running Gunyah when the page is mapped in
> > > EL1 but unmapped at EL2. path_lookupat() can actually handle this
> > > via fixup_exeption() when a word load crosses the page boundary.
> > > However, Gunyah injects a Synchronous External Abort and we have
> > > a downstream patch [1] that adds fixup_exception() in do_sea(). pKVM
> > > injects [2] such faults back to EL1 and fixup_exception() is taken care.
> > 
> > Ah, good point, completely forgot about load_unaligned_zeropad(). Since
> > we don't unmap the linear map for delegated pages, we'll need the
> > fixup_exception(). And I guess warning in this case is not desirable
> > either. We could limit it to EX_TYPE_KACCESS_ERR_ZERO and
> > EX_TYPE_LOAD_UNALIGNED_ZEROPAD, though not sure it's worth it.
> 
> Alternatively, I think the series to unmap guest memory from the linear
> map would solve that for gmem:
> 
> https://lore.kernel.org/all/20260410151746.61150-1-kalyazin@amazon.com/
> 

Thanks Will for sharing this information.

There are use cases outside gmem like FF-A lend to Secure Partition.
we may not be enforcing all such memory to be unmapped at EL1, correct?

Thanks,
Pavan

