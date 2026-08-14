Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0987EC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVIasMr6ok/pt36pC50hDKA8cdlBEv5jazPUbRxQ61M=; b=WE+GHHJ75htdRp0eJs1dvUO3mf
	79DHOH6mgoU26FeFD8H5E1BJ/pHkoWTIDK7YL0tEKuz7Ahlua9CjIPDhD8qoQRaChY7WkV2vzKLM6
	XOXZiNZAOsDgJBC161S2tG/uHdfiQ7pibYVXPs9RYZppKhHeWTcGW4CYiIkICTbs7NcMT9t8UI4Sx
	Wp766cn/8/quQUuRNMpiZwhvKgAtU69RUsPhYIiWKHCoPLxM60iBACOg3tisl9+YNSPl6Lqt0h5Jw
	GMkYjpIuni6UNJJnP3A7ljOFidKtsxBWMGPtmyjkb3jqEurwBVXHwXV51UceYVr9Q6KvtVmgLVokJ
	630NtF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunY3-00000002JLO-3aVP;
	Fri, 14 Aug 2026 08:45:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunY0-00000002JKv-2n5A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 08:45:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fPMU678180
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 08:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EVIasMr6ok/pt36pC50hDKA8
	cdlBEv5jazPUbRxQ61M=; b=ADAGnN/knxZwKwlqppLvR3DFXAywgoljCOl+bDim
	5OT8g8p1fI+jfG4Tv7QmaNjNoeROItyK5SqhEbWTo+zwlTjzwWTP3rVzs7ks7eIY
	a9/wsuMj/CE+x6BLqTjGCH8HL1HkoDlnDzR10GS+cDQhgoiRg3jkBzXjfZSAJ8kG
	+fjd4JynOdTTM2sRCQ1iC9vxldRXmga4ert1Llf1Nf4q2HqFf6ttwkmJ21iRqLLv
	+Bv1jYNq+LORKb8xk1UyJBCgl4rnQTu0k4KEDFcJ70xHPUngeLqlZrjkMMvD0PbN
	dCCT9KOOgCVVZF9bS+tojskYCm9xmevmrwLRAEJpHfgm3g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1v8prup9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 08:45:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso548135a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786697151; x=1787301951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVIasMr6ok/pt36pC50hDKA8cdlBEv5jazPUbRxQ61M=;
        b=Rn8WvMHOM9pvVUx2bHX3w3FBha3bSMZ75F2d761P+F76xGqbWq4hjyaPfXl5d62yjX
         TfaNk8k+lGJJXmqNREA1I5jOLQvMkmLfUIfoUxtzcPpIsLqqSiSo9u5T7d6qj24BvUVj
         fn4/AS9WxCPIyn6qJ75xu+PX0TA0Z72+mLll+M1wfR3qvdJKKbOWKzyftH2QowYP22GR
         mfs6a1qTin2rt15EyqoHwaTp8iUe958SIT//mLlUPEyZmpYY9aq6gIEMfL/rJ4ihhwgY
         wW4Sw2yZLmcxGGDNYRNK7AzmnzDa8EbAiSIEhM+j0t+eo9gjfXPgW739LnUjOJBHBVht
         pEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786697151; x=1787301951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVIasMr6ok/pt36pC50hDKA8cdlBEv5jazPUbRxQ61M=;
        b=B9RwwbUEWZZ99FABaKoY2U6pbvOX/iogn13uV/3VLnje+Nb3254FTISoc2Vj8IkqX8
         8vmKwGxHw+JM2kQAMV8mps20R3tSV6XAqtNvJkPrzbXLXcviGv5hvtVeamj2avWHLcDb
         clp9T71eRPvAcTIHKO2pCffoqegy7j74+QpCoLvkxYRD1vqq/Uuqx8g3ddo+KQhaCGkv
         LYmSBRnHr4Spoy/0ZqN0HEr1ld/ax4CuTON/1c9Ln/nGabGbNUeE7p1uxo8Kn4c7jqi8
         akXfaUEK4QKAdh3riGN9gQMHkhxmehCTeUDqwFnBGPQ3vxsTsOL096hZ1bkB3DdGf1/j
         f/xQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPSXINoBYNgPKQOyjO3IL6K3wFCYAumw9IqWq3hA8sLsifk9vGe7RSmbhtnxIzvWVXbfQfq0HE9dOvkSuOQT3e@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw8t1orE0d8lKkrJfy+/1qDkeALBd16v852pUiSA6V8CYwux97
	4bRiHlqSPLo9cYnh01rTgaQk08HUz48bBW9rTYbqJKu078V26jPmse1tLx2iPgDM3kFTz+srnBq
	M4EZO5UJa39Q7ZvJb9BTRWJuswzI1DBTMi94MWom/Q3WBTZHlS4/oSGUYbcjUjM3lhzYgq8xdL7
	5u/YS+M5I60bMu
X-Gm-Gg: AR+sD10wSjwgAs6whwr0CC12aPiSBJnq94dKIxiutnprae5GP/Nk6g7HGUXRxxhHbXn
	r3j4VMRdsRWA/PuOHo75rn1WrCHj3rMbXcfm0KIh2Zs8Vx4SrTkcrUwYj6H9ewf3EJSxv64Qwl4
	TcXuWmuTFFSB5BwakKt1Kw7I6dzux4P1o9jSpyjKiiINh5GAcTz6BRKE0ESL9bCrJ1RR4JXKIpO
	zj/G5BjvBBr/A3PwD8Q+RC78VFG8h8KPTpWNVX8PGryPm8bl0oNIBIi2xOCXploHLCmaC8uOTYj
	lA6CKpujcycrZizOMEUJwksZ2wmqfw+35YPgW3stUoJlv/lEzqDPzYmMvbGodeHRp6jgLEnGSsj
	7mU3EDDIG0hO7dFfkz9Fv8rmJyUCT0Sc+Og==
X-Received: by 2002:a05:6a20:430d:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3cc71d533c0mr4527078637.6.1786697150993;
        Fri, 14 Aug 2026 01:45:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:430d:b0:3c3:bbe6:95de with SMTP id adf61e73a8af0-3cc71d533c0mr4527037637.6.1786697150586;
        Fri, 14 Aug 2026 01:45:50 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320e9df03d4sm1808869eec.15.2026.08.14.01.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 01:45:50 -0700 (PDT)
Date: Fri, 14 Aug 2026 14:15:39 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
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
Message-ID: <5b557560-7664-4336-9e5f-86de8dcd6d90@quicinc.com>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-8-steven.price@arm.com>
 <ans1ZSwMEKeT9Gfz@arm.com>
 <d4bdecca-517a-4b4b-bf67-cef6b09bc8c1@arm.com>
 <7d4e5920-aa20-40cd-954e-037631bd0d6c@quicinc.com>
 <anx6YbPMVz3OlpA5@arm.com>
 <an2YN7kxB7bjCd2s@willie-the-truck>
 <8db602b8-7fd3-4c11-8fbd-3b8251648eb8@quicinc.com>
 <an3ihGk3znnk8TWV@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an3ihGk3znnk8TWV@willie-the-truck>
X-Authority-Analysis: v=2.4 cv=K4MS2SWI c=1 sm=1 tr=0 ts=6a7ed5bf cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=vggBfdFIAAAA:8 a=KKAkSRfTAAAA:8 a=oGdhJ8GHBgxCdCDN5qoA:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA2NiBTYWx0ZWRfXwPlAutnqxU9W
 53TWCJKF856zI5/eEDdRJ4Py95ylE8ORpxsSsbSO8WvuxECbFiuy4yHPuBqrTaMeLtstE109aa5
 EuA0T8Mwwfht4JOqNORdpofiJWeNAoYCwpQ6U+U75AbZ+XiTINMAR8cKMHrCIlx78C+AvlL665P
 sH5NLrhoFkEdTXbxOhAp446uHUiJLnf+Cf+r9x6oLuEE6e78bbAekEWoHJP092QQsV1sMcxuyA/
 I9+C2TqSzRZDD0AQyxWaIsmUv5ieVoTILbpgvicoNsCSNMZktC6WTA9EBlTvM6wNp9n3BruWCjm
 8/eq5rHD3wCJAVe7ya/vZSoNyGailpfgc8NNhnSNEWtLgL1fI9Sijm+feTtaY6CEZG9PQuRTkV9
 QJNhnVwq5fnvh0iMOpH1oDQgQCfMXzyxEehyGgnt7hUnvxd0rECD8VURtyEJxJ58V7sdVCCZXtV
 n4rVMHq3D0WnQzhdE/g==
X-Proofpoint-GUID: r6J7-mx8uEkqHUrP5Pc-wtDfM6oUoAFU
X-Proofpoint-ORIG-GUID: r6J7-mx8uEkqHUrP5Pc-wtDfM6oUoAFU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA2NiBTYWx0ZWRfX6cvZQpMSqz6+
 sf2TdLztARQyR08Rdm7WucTAJyqrWJhXVNLl4gkSrjYrbBWKpGueTwm9Zu4OXS9/XKVY7+DksLe
 JNX+d0jNQI9I3Cbgh5D4U2L3oPFjNY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_014552_711588_E4C2ACDC 
X-CRM114-Status: GOOD (  29.39  )
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

On Thu, Aug 13, 2026 at 04:28:04PM +0100, Will Deacon wrote:
> On Thu, Aug 13, 2026 at 07:40:41PM +0530, Pavan Kondeti wrote:
> > On Thu, Aug 13, 2026 at 11:11:03AM +0100, Will Deacon wrote:
> > > On Wed, Aug 12, 2026 at 02:51:29PM +0100, Catalin Marinas wrote:
> > > > On Wed, Aug 12, 2026 at 06:12:09PM +0530, Pavan Kondeti wrote:
> > > > > There is a valid case for fixup_exception() to be needed here in GPF
> > > > > handling.
> > > > > 
> > > > > -000 |load_unaligned_zeropad(inline)
> > > > > -000 |hash_name(inline)
> > > > > -000 |link_path_walk()
> > > > > -001 |path_lookupat()
> > > > > -002 |filename_lookup()
> > > > > -003 |vfs_statx()
> > > > > -004 |vfs_fstatat()
> > > > > 
> > > > > We observed this in Android running Gunyah when the page is mapped in
> > > > > EL1 but unmapped at EL2. path_lookupat() can actually handle this
> > > > > via fixup_exeption() when a word load crosses the page boundary.
> > > > > However, Gunyah injects a Synchronous External Abort and we have
> > > > > a downstream patch [1] that adds fixup_exception() in do_sea(). pKVM
> > > > > injects [2] such faults back to EL1 and fixup_exception() is taken care.
> > > > 
> > > > Ah, good point, completely forgot about load_unaligned_zeropad(). Since
> > > > we don't unmap the linear map for delegated pages, we'll need the
> > > > fixup_exception(). And I guess warning in this case is not desirable
> > > > either. We could limit it to EX_TYPE_KACCESS_ERR_ZERO and
> > > > EX_TYPE_LOAD_UNALIGNED_ZEROPAD, though not sure it's worth it.
> > > 
> > > Alternatively, I think the series to unmap guest memory from the linear
> > > map would solve that for gmem:
> > > 
> > > https://lore.kernel.org/all/20260410151746.61150-1-kalyazin@amazon.com/
> > > 
> > 
> > Thanks Will for sharing this information.
> > 
> > There are use cases outside gmem like FF-A lend to Secure Partition.
> > we may not be enforcing all such memory to be unmapped at EL1, correct?
> 
> If you leave the cacheable linear alias of memory intact across an
> NS -> S transition, then you're in for a bad time [1].
> 
> Will
> 
> [1] https://lore.kernel.org/all/20221114110329.68413-1-manivannan.sadhasivam@linaro.org/

Thanks for the reply. In the above case, XPU does not like the speculative fetches. I am
not sure if there is a hard requirement for unmap of FF_A memory lent to secure
partition managed under Root with GPT.

Thanks,
Pavan

