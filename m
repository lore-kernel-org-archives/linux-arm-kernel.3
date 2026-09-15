Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3D5C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 23:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtfgcKKZ9v2ZBngMs3bfVx7nttoh7eLy//n2NDiu6Fs=; b=EQAgbSuthmQHWBVweNJWIkt3Wp
	FzyxjhBKFbWB6aNEBDCBPFlxKXjw+syBLv2Uao6Ed5KZPVAxX2xeN7GaMJOpGxosEngTtgQvwhZfQ
	Q86fVYFxAZYapWcwPertxNS0qMFSaAN8pliz7S6gvnTAoHpJAbfPKZjWd8WN9bMOALeIHaqsrMyI2
	4ukhC3+J1Rb4KzLxAbqkfJ1Z04YFBUuE0nObnrQitYxSu1zRercdSwy1H6BG12TAqz9jCVhuAgP1B
	UEZXlxrGxSHwxb6yCWkg8bHrim8TMRG17PPi8XMFaiX5TdkxnA9LYS63FOFXP24sgAKlqTO8oaaQ4
	9hmkCUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cQh-000000083Sw-1ZHI;
	Tue, 15 Sep 2026 23:19:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6cQe-000000083Sc-25p6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 23:19:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZ2xX050941
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 23:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtfgcKKZ9v2ZBngMs3bfVx7nttoh7eLy//n2NDiu6Fs=; b=k/QXEAJZPF8o0hbe
	zJKDfE96pVBa6P6bbffHXgxPf8ByvvwCNLbQnT8jOezZGipe4pQSNCGmZX6SRja8
	s/9qSA3W+q10+k0RWG6A1fN7nTsXKcU7JJTQK8pJfgEic5IZceBfiq/G7j6jw4Pl
	qEI1MTMbuUDn0PJ05QNcU2Mi8jlC0Zoc9UhECS73gMVHhyBVerUWFJPQASwRjnvq
	NScXnu5WeM/LgfqcvMDPKyDNt9/T55bqjZ+k+djBfWZDep2JIUzDzKpCYkRxsXTi
	dkTVzF+P5nstaHlgNeZqW7wrKLfy/uLQa0i3+5pealS2Iu7hagzVSugToGtCx19l
	IGD4Kg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n61qef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 23:19:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so742353a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789514347; x=1790119147; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GtfgcKKZ9v2ZBngMs3bfVx7nttoh7eLy//n2NDiu6Fs=;
        b=Oy/VTeqO2336Uo/3TnFU77S2r1H1m9CtDlGZPFvS94QsuT/mcGa/TBUZLJyoxbDeWB
         zdOmOGjwO6phXGTj7SNrPd4LQ+Wo8AVsl/3qkDC6maBXYn69UFYlIGyACt0vBjvZgt/i
         Dc6akwyxxJghzfxLM0zHtQ81PVvpitAECTJ7eo8h2E100XmCYDbR6Ro1MyxqZKoKzwke
         +J/w3/0fZHPkXT3aoctOvSggty9IfTP/nTE0XWryxAX+qLeyUSqk8FtX0oPrWXmzbwSx
         ZjLkamu2aMVmWCSttgvIWg0PKXpNC8c4PN9iu7/WT8/BWoP+Yv4Y/ERB7crrstaE1Up8
         jY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514347; x=1790119147;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GtfgcKKZ9v2ZBngMs3bfVx7nttoh7eLy//n2NDiu6Fs=;
        b=DjTr+f7xejE6FRzcOBINlQ+lcwtm6D6yrqtbz+2dh4+EJ+qp62k5oLuqF+0n+TTIiy
         7VWxQ75QCs6xS8vCKTrmvvoad8uzatNsbyEsDY6gSj9MPPsC3Y5XsfjMjm0HUVtnCGPH
         419xDspYpPGoojKnzpVMnHMkny6kl4P49lYtjymvGvdS8rnfBsYVvU7GXH2PZCjLPQDA
         WtqKSfquccRVHY9WfDbgX2Y5e+Q06c5VaWu1ylm5Hrv8kzAqHIdjoFZ9zIedtuVVNaxJ
         ONBz97aAIgKuJvMFce/E0/C09OaWsYmG1vyoJ+PvKr8isxeN4VuvIvcV/frb52W52WrW
         a1EQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcdWClBJxmEme7UmEtt2fD+QumrYIEiTnXCiBbAat4ER5C0otpLzAtahPZemY5QBmwitAQdKJC+F1Gzdn48ovB@lists.infradead.org
X-Gm-Message-State: AFuF++mN1ivlaXLK2GgG5umVMjVcE8tOJyvTOqY9iU/Se20oU7rpZM6y
	XX90DO1lQPJE40GfF2s8byRmJ2t7ClU1qU36kQI6LQUTs3x5R8qxsr2IGrvWyYBhleiZYz0RceJ
	o6QOJL2C88C0aehBAm0HtYAF0o0Cn3dh42U6ENqHT6sTUETYFDidZn5HBzigZgTGhGBygYEHi/l
	ypqA==
X-Gm-Gg: AYBFou0SAKt5l5aHUKLHApLrSOB9YaAq8Y2XZTK1dxjPTrt5aML+toBzi/Owu+RESNH
	MzJydWdF4F1C5DqszS3/QZ5GU9KYZK5UAEjzO9sB0G3gmH8CPzzZVd/K4vhy1ztXO8MSq1fL+bJ
	92Nws+ounuJaJgpfLsbzvRmwDErDs+dcPF+9Gp2AT8eFH8+Mge5OWMsAd0N33BgTSCkL8tcbap9
	gO7IjXPtF1gb+xvBK+0hRlywCvIjlVMUamyn27g2CKNq02yzQlVQCuzc6qKELCYtnkkoAQhYt/A
	UWsMaR6SUPeQCO/FJV/rbNHxlkcoEu7UBwQ2rIBrcmxen/35Z2PDm2PNaiQPxsJ/k50ysG3eqYI
	MK3RGEiUUAzlHdf/KI9HE1+3Y5uw=
X-Received: by 2002:a17:90b:398d:b0:39d:ec1f:b3fd with SMTP id 98e67ed59e1d1-39dfe036be1mr8656431a91.8.1789514346880;
        Tue, 15 Sep 2026 16:19:06 -0700 (PDT)
X-Received: by 2002:a17:90b:398d:b0:39d:ec1f:b3fd with SMTP id 98e67ed59e1d1-39dfe036be1mr8656394a91.8.1789514346415;
        Tue, 15 Sep 2026 16:19:06 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm2279027eec.9.2026.09.15.16.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:19:06 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:19:02 -0700
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
Subject: Re: [PATCH v5 03/15] iommu/arm-smmu-v3: Add Q_POS() macro
Message-ID: <20260915161902.00006cd1@oss.qualcomm.com>
In-Reply-To: <1db9d32df4a59dcac286e7a82bc2704cdd69b8e0.1789446520.git.nicolinc@nvidia.com>
References: <cover.1789446520.git.nicolinc@nvidia.com>
	<1db9d32df4a59dcac286e7a82bc2704cdd69b8e0.1789446520.git.nicolinc@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aa9d26b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=39RnTaQb96y4xN-8A7QA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX0Wx5nkSewzuC
 ymA7VvvhCMPfUMJade1lbRfb35mQkRHxTqnHOSG4VuGojn6NPvs9TKQ9v1ts7PHrvsN6LHZIjNs
 mKNBf6ONRKavOT9ZnbUFOv7xqIZfaaq0TvaxpXTLytCb/duF2avJTS2D626VMNSZxLPIGfOm2PE
 cKpIzGPCE0/Gd7/EODtDrHzPc+iwfqH+uGspIPy5ST3E1Td+vI2cZ+NMcuGc+82HddcWU8eOEYp
 t6XZUBoEw/CrL9uxleT5PWHPN/5AcbMWVlS470kDXM0OF0SKoVw3o8tpGgIyXqDTrjyMQr4v3CU
 65YQRIH2A3kMPB6AZ2YLgkQ0jF14fQL8KUDG8hO2pBZ9wBCMOc+Nttu+HB5RF4om9sUHMckQdwe
 nQ7vZ6Vhf5YCVFF04o4NvRId66JuOA4CgvAnCwO5CbuZeDPQzgDlbK6rLLkk/A2XQSGylVJywLd
 XcodZ028PQAhPOTQIbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX8S3pTjCmJXXn
 qHSYmlvqojhWWTbxYezZQe63GjuIsghSCpl9O8Qmhh40YaALB8DaE9vfy/khUE2NURLG5dBlYJ6
 gLG/yT/Qi9axSh8B+IeWnO6yR+3bC0o=
X-Proofpoint-GUID: JteyjtTxKC_arlCsmCmkw8jrxg64UKfX
X-Proofpoint-ORIG-GUID: JteyjtTxKC_arlCsmCmkw8jrxg64UKfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_161908_567955_C9650E94 
X-CRM114-Status: GOOD (  13.96  )
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

On Tue, 15 Sep 2026 09:38:15 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> A queue position, the wrap bit combined with the index, is Q_WRP | Q_IDX.
> It is a (max_n_shift + 1)-bit value that wraps at twice the queue capacity.
> queue_inc_cons(), queue_sync_cons_ovf(), and queue_inc_prod_n() currently
> compute such positions by open-coding the two macros at each call site.
> 
> Add a Q_POS() macro and switch the open-coded sites to it.
> 
> A subsequent change will build a Q_DIFF() on it, to count the entries that
> a queue pointer moved past.
> 
> No functional change intended.
> 
> Assisted-by: LLM
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

