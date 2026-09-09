Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B488C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gm+9IjBE9cdQ/0pMBuXgvhCeHwdA9Cjik6T73NaZKR8=; b=TsM3hfsPwE5MX5HGjMPr99Br8I
	QJMPfutou5qa+nwLQJrpHoY+HCqGEY/D1U9g9Wnc5n0ousIBlk+BO8oSQg8God+ZAjOHQcc9D76UB
	Np9DhSsOAxn4tA4f2PrYReTF2kNPZgeFAAwCb5LX0eG91kCHgMfKOgsGO4YTAi+g0lvR4MQZINLLV
	TI5eCLRT0e9dopgJDbv4iTvbSGL2uucaGszJGx10SkMBDYTWe6+iZ8pQte8V4TdEzEZTxu0b2+cAl
	FjzTF59ogqzeLJWnqK5/Ts/etKOzlJTjky/AINKAzgkHrQh52sN4NkSJhAOoJKyxA2VlGFcdbvPw0
	PJvwgMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MVF-0000000CXxD-3cLd;
	Wed, 09 Sep 2026 17:54:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MVD-0000000CXwa-0ubu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:54:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7TDf2771661
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 17:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gm+9IjBE9cdQ/0pMBuXgvhCeHwdA9Cjik6T73NaZKR8=; b=cfSmyUPWCvHVtyLu
	rz3IstZAvuTT/9o3NMA2V7wpZlhnhTyDMkensAM702lydzjPUNY/5MnMyBn+m+lU
	4do4aN1R7NvndsOueLhOgi7L9Jqun10CqXzzuVfslinBDtV+HM19c+g/CM5jHlNi
	oz4ZgsYrj3fkko46TF43drgpkXBXLE3MQCE/9H3Ared3JU+EgiveZOx6fOcSEzCt
	tE9Zd1gwdEV7s48UWJ3h34zi4OjNH9HsSn0Dmdd5cf8t9lsPyyDFtfsu/dcTTtsJ
	LfUuBFznsJ86c39+lHrRtGVMtUqpU8E7FgBoIALMcsi4QRbjVbL/Gk73ElfjxzZo
	hv410Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x9wu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 17:54:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so9662830a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 10:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976468; x=1789581268; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gm+9IjBE9cdQ/0pMBuXgvhCeHwdA9Cjik6T73NaZKR8=;
        b=Bu8Y3fbZFrLn93or9LbkXG175NlrZRCHOh3UXqILR0F7Ld+TVIU8wTOQSCEwV4EEtA
         XUZRP+Rwbyh5rew6mxHK+vy7A6S4xliM/1DBSRC5q1/E2C2gyos+nqxlFXDY3eC0RwFw
         pgqjfXo1o9LZt8D5RpOBXA9QSRYagesbXTZlxdfPVChKyct3ELoSec+H+mVl8YJeR3cP
         8JWHKU8V4YtaO7zwUhctpBdZGYZ27y2MlrMtQPHF+sWyJM18kJ80yX86Oeb/TgIPKEcb
         UIORQXduPWT+rIWHJzVYRYUrcws2JgLiN3DR+N3Fdgx5+TX4201hrLaP+7ii5y6BfAub
         pH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976468; x=1789581268;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gm+9IjBE9cdQ/0pMBuXgvhCeHwdA9Cjik6T73NaZKR8=;
        b=pgthdkhchnPgAw9MoDZMvyJyyVOF7lF2w2wv1XbPS2CEDHijyB52fliSA2KBRbEg2f
         dd9VVwGZGrPLFNJMTnWLRM18YO2eqVRZ/gsVFSD2b4aCFDaGMEqA9f/HXTmjVevGcX4R
         tby9g51VVV340d33qS6uiVEGj2w3ZHlrsBHk39UejI10wezQycME/us+WIrviUl6sBwL
         jQTjTU7rm2wYGK927H0oNtkDmceFSVhbBIYVBVjqkOtefzuNzkj1eoh7nF9iTKS98IMa
         fUgndiSqbes/FGFiyy2B/qfiLVNmC+wS09R2Sp13FvCD0tCFSCtF57Ff+KZyqhZ1cs/p
         1dYA==
X-Forwarded-Encrypted: i=1; AKwUvBwo90yzCIr9qnaOtN2zQNXQsScew9/xfd8x8rqLOHIoaFlIPwcP3x/MUbHFc0nu66wjWGnPbPYrs5X6N1JPrNy0@lists.infradead.org
X-Gm-Message-State: AFuF++nyB5A7rYOVV3an4q8eeIX1HxoSgWcsCmhnx4rxlO8vk83xjqCE
	XRL5wUX85YR2gYqelqy6xAWfM7bpI0EIC7xGI3+IgmNxcnulYh3C3mmCaY/VyvyyOfmsXauk3es
	Ew9nLyudgr2m/qKeqRAguSnmWw3056j00/8RrY9whWBrt9wiaaLpyCJ2UiHt4H6Fx/gYZmJqd45
	//OA==
X-Gm-Gg: AYBFou3wy5DxDh9Zgzl5OWconEdcKiNHmDY8hB0RyAowkeoMAJSL1dkqDoujiNE/aHr
	x9OlT4cvmCxhIIMRbQ+ylf65uAWmUmlTZkIGsAiQzIUHPZ/Wk7NVMH5Xx5M7bv2YkOBKPhUYz+C
	opN0zoklKQe/+wAJ5Qv5xuvv9BcX6Y0lejhMRESDAOuLs8ojJ5x1md0ZXV5rsH5Boa+7bcZSYyz
	TojR9wyuAKkd4ubsVHX5rphkpBYVQixwCUJhpytrnO6/fJpWTdmhFLgiPKgph/XU3qFj8e8Bb73
	oBtxL/QZbpsZ2VvlLqiwXq2BLCr8vEtFGwSMHsAvbJS36OywsB147/5KntnMkFhwMUAXY6scCyj
	QPJK9VjvPGKc27yvSFC/q/GmaeBs=
X-Received: by 2002:a05:6a20:2d2c:b0:3d3:adad:f173 with SMTP id adf61e73a8af0-3dabb270ed0mr12635172637.21.1788976467964;
        Wed, 09 Sep 2026 10:54:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d2c:b0:3d3:adad:f173 with SMTP id adf61e73a8af0-3dabb270ed0mr12635021637.21.1788976466966;
        Wed, 09 Sep 2026 10:54:26 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm72009935eec.15.2026.09.09.10.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:54:26 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:54:20 -0700
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
Subject: Re: [PATCH v3 06/13] iommu/arm-smmu-v3: Submit CMDQ_OP_PRI_RESP for
 IOPF event
Message-ID: <20260909105420.00000abe@oss.qualcomm.com>
In-Reply-To: <apttObDR6jf0rvt+@nvidia.com>
References: <cover.1788222485.git.nicolinc@nvidia.com>
	<9280aea7ae7197eca3f223ef5b998aa25afb29d6.1788222485.git.nicolinc@nvidia.com>
	<178846311317.1308030.4335813024474016483.b4-review@b4>
	<apttObDR6jf0rvt+@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE5OSBTYWx0ZWRfX9Wx9WFs1Z54x
 jNersPM0NwNUxrmoClF+qs2cTJKYpdT0GJmiI+xzBqOfjpBGIKdOU4tMORrnA3RvPqQ5iyxiIs0
 9BUjLPLsFKHfzwEFWukZ2VhGkwOf8lQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE5OSBTYWx0ZWRfXwPhWRrxkulu3
 pizlxZO4xf3kmth7PpE4/FCC6UoJkIvFWHLOLbzYj26KOgmnImodnhrktlS3UchMRacIZldzXeP
 7KrOtkm8N13/GbcvXSJxa24/wXEdiNlYfQvAMQfaiLRG33zvKVYPbBQ0OOAh2Z4JxRb8MfrXjkx
 EhIEvkBOfSwHa/JYkzs7WKHEXhboGUQw/2NJvQ7iWgo7T8TlQTb3Omg7v/JxicjVGqkqoHmglgQ
 MJyijynJ6YeDpSuY6kkKc36EgUpnfNC1ngslXysF06I3O8rQ3k8s+2vdA1UsbTa7IpQgJpz1V+4
 ItWi2EHOeA/9rXaYvDpCgGKcUL6yX7xiJ9ue47VUphlvTskTjf8Subvfv0cxrZtv3YTu4yZ9igO
 5VMXc0XiNPBUMIM+oeXpEthvw2pIPYUd5aEy/c2kXpA+CU/aEBBBASQdgiAuvvw43uaj5V07Nv5
 Sc7MSdMbpseQ/+GY+jQ==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa19d55 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Ikd4Dj_1AAAA:8 a=9koHXFDKl-DiS4GoSb4A:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: LTuidf2F0qb_LjcXJlg9Yn17hldzkT-q
X-Proofpoint-GUID: LTuidf2F0qb_LjcXJlg9Yn17hldzkT-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105431_396365_411811DC 
X-CRM114-Status: GOOD (  22.51  )
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

On Fri, 4 Sep 2026 18:15:37 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Thu, Sep 03, 2026 at 12:18:33PM -0700, Jonathan Cameron wrote:
> > > To handle IOMMU_FAULT_PAGE_REQ from the PRI queue, arm_smmu_page_response()
> > > must issue a CMDQ_OP_PRI_RESP back to the SMMU.
> > > 
> > > A stall event in the EVTQ and a PRI request in the PRIQ both surface to the
> > > IOPF infrastructure with fault.type == IOMMU_FAULT_PAGE_REQ. SMMUv3 forbids
> > > the Stall model on PCIe streams (PCIe must use Terminate), and PRI is only  
> > 
> > There are those systems that annoy some because they smell like PCIe
> > (present PCIe software interfaces) but aren't and use stall mode. However, it
> > is nonsense to use PRI with stall mode. So, instead I'd just argue that for
> > stall the fault handling is done synchronously from a device point of
> > view so a PRI request makes no sense rather htan associating this with
> > PCIe as such.  
> 
> I changed the paragraph to:
> 
> A stall event in the EVTQ and a PRI request in the PRIQ both surface to the
> IOPF infrastructure with fault.type == IOMMU_FAULT_PAGE_REQ. Yet, both two
> models are alternatives: a stalling master resolves a fault synchronously,
> holding the transaction until a CMDQ_OP_RESUME, so it has no reason to also
> issue a page request. A later change refuses PRI on a stall_enabled master,
> so the two will never co-occur. arm_smmu_page_response() can therefore key
> on the master state: CMDQ_OP_RESUME for stall_enabled, CMDQ_OP_PRI_RESP for
> pri_enabled, mapping IOMMU_PAGE_RESP_* to the PRI response codes.
> 
Nice.



