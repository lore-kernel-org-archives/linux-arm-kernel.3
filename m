Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C2BCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KA48W7VRQ3uJFaVC9VZEckxeCX/Ro12c18oCYgFj9fI=; b=wA+T2U3sbejM0+3zTlsIlUD2n6
	yffYBDbrD3j5gKpu3QiLu3FgEjeW8kPq6DPUM4fkisXVQkiQ1IdLWB7loqnUuH///vQAU+v0lE4aj
	9Q/vCGHkreedfoCR0s44QKJ+7ULK7W2KGPPidNMp+0tUBrhcf5ygOXZaeN5ik1Z1Al/TVy2NTVL1w
	1DcokbNGuokwwsBPfiVxIJtFkElwxPy3qG7RouowFaNI1EdTRKtxU7tLweoBHtNL6ONVf3qxrwtCo
	YjI6YrtLcRGdIHGs2WrQnuz5SRNqgPhBEFhAOQj15uWWLTL45/ODbvAOooTcWReO/coma7YVaCEvU
	seLrav8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEIFp-00000001fTK-2svS;
	Wed, 07 Oct 2026 03:23:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEIFn-00000001fSs-1zOi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 03:23:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6971HLiQ2136088
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Oct 2026 03:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KA48W7VRQ3uJFaVC9VZEckxe
	CX/Ro12c18oCYgFj9fI=; b=AOKk/AKTQqwVwdqwJ4RHXf+UEx/9Grw0PuLX/Bh/
	fl7qmVTYUXmKbu/7NT7+v/CcdcMsB1xLUIf3kOnGjtU69HCbuajma6LhoYQstI7b
	+/StMXc+dK5ASKTn5EvU0nXazkyeC3FzioFavxTKdJ21ZkvOQ5ijNyEzWjLcLol9
	HzYY1UlnJP+B2uwJp6/oSPjKpqBQ9Q9uEjZDssBxyOxW/NbqGrT3pLSdtIrhcNjv
	4iprMdmBfYjVS7wyH9Bn573mYa8s4vDzrlvk1CbQpUtj1UeNEU9bTw2iH0lwRWZ6
	ojdvncwWq3r3pOx1FR7EIz+qe7rXf/SPy/yro6ssnwx9pQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c678cst-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 03:23:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7148752eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 20:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791343414; x=1791948214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KA48W7VRQ3uJFaVC9VZEckxeCX/Ro12c18oCYgFj9fI=;
        b=hMv8Zznfg3sD4qN7LglyJzs1Rh/qISgbrlwLWvPxhjqt8X4FL/s+y7B0Es+HHWbwze
         5X+mXJZ1LO6etfbTQOG1zTsqJLozpsXnINWtLdnLJQ153VEEclhNuaooPYtVX9dE7fFq
         eSPXVvEUKu7ZnhyTzqABiFuuNXR7e4V6MVnCJwZlX5TV2naIaefU19HNNY8qM7BYgKo5
         6irC/lhcR3TQUjA7Bg7YjSSJgKUFAdTid5mpY60gAyqbvju4foSeTy66yeDLgCO84+XD
         P17zimy0Lmerp08h1OVijFZuo94OMX5JJZNoavdD9ClPFCSdIrSxtmwnHhiRR0LpIxqs
         Owog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791343414; x=1791948214;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA48W7VRQ3uJFaVC9VZEckxeCX/Ro12c18oCYgFj9fI=;
        b=Bg9J42FS4Apc+dQXqpehxiA6+zo9cNthX2sehx1V1qZmfaiOkEAnN9C2HCrvWTjVZ6
         ehRdA8icHiz8FbP+TmIlGFLvmmzKW0Tlw7ukieT/AOhon9vErEAXUFc9DDnqcdIRNhAh
         L9Up8nCaWrp9P2Yz7+HDroOYOf0Qsxe9QjvNwH4WllhW6T3E+2MqOBtI6VCspHbLSPsS
         G1tZuTWzmtjnx6D+odrIqpfIE3pl8IiCG/VcMU4twBk4UvGTkYb2QaaXKJj/u0x6nMOm
         7vG2To2ZJsN3Tk9Klyqm5qYqnU3srLTfPzh/BVco1Lea9//2nFXcFZge2ybTqdXhG6RR
         BgFw==
X-Forwarded-Encrypted: i=1; AKwUvBw5FGr1IrP2yO8OBlZnbQx+Rbyx/t39euvpBHUM022IaKdiFH+Sb3Oc03jO8zU+ezD0Js9CVIesmxx+vTZ6RWuW@lists.infradead.org
X-Gm-Message-State: AFuF++ns5dJVEciKEjJiqxLyJCWcaQqpHPkjSn5d8KbIzRkjb6kYl1Ep
	X/d7PAMfwluTrufi4DT7T+l2qnjOD+GTSkpTKmkjwj7bhHS8yHgKxs6PyGz1NdzabbwUlH7YpHY
	1Es/NjHYuBKiZpHtijeMswxLzfke0bzIVHab11T+aXK3UEirkCC0cFD7dhyDmio0ScuZz8V9GUM
	Ngbw==
X-Gm-Gg: AYBFou0ReV8jIJ99Q5tKNPJ8tckuX8rFJLmUBzyu/gIW2umTsqKxs1JUmJIrXZjnkJf
	b/WOaRlW8M8NX8L0+XI2gZUWV3/4f1d5h691zlDyUEmdHKJRveMmDMB6f5tkCu16Pts+Q2KNRCT
	IsKTnR6c0FLLFCyR3grqxnuM8wOg8dH/uexlcGo+hr60Hcx4wN1QEEmu0Idx8rDaCd2vsEpGxCB
	6WbeXGvZLTlz5Ky3DH2PmEqI9Smt/NFyGPUOpDwjFGMzmKvqbgtChGvrvBOYe2TmZfHw+re9X03
	AAYYF/LO3ryZTUlvmV4jkYZjKVqjERcRUUkLEnWRalkHVgyZ6uiuq2GlZEDDs45M+noZLex4As5
	NxGRhzF0jkWpeIJoflWaykQs1kgACTYm1hpUHk8xisQ==
X-Received: by 2002:a05:7300:c00e:10b0:34e:caae:20f5 with SMTP id 5a478bee46e88-3515de2686cmr822507eec.30.1791343413985;
        Tue, 06 Oct 2026 20:23:33 -0700 (PDT)
X-Received: by 2002:a05:7300:c00e:10b0:34e:caae:20f5 with SMTP id 5a478bee46e88-3515de2686cmr822477eec.30.1791343413469;
        Tue, 06 Oct 2026 20:23:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515b03da93sm2702320eec.29.2026.10.06.20.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 20:23:32 -0700 (PDT)
Date: Wed, 7 Oct 2026 11:23:25 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, mark.rutland@arm.com, kernel-team@android.com,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord
 SoC
Message-ID: <asW7Lay9i_hiuTcP@QCOM-aGQu4IUr3Y>
References: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
 <179095635040.2123203.12001281676860626455.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179095635040.2123203.12001281676860626455.b4-ty@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAxMiBTYWx0ZWRfXxK29O7nSOnUZ
 5w+lFR0lADTtq3qO6C/TL4IPwUYIdQqR61BhuWZFnTk4BrmMKj317FQBP0YBYgn8VTdBw1EHUMK
 0Hz+ZhiNbM+1fJz5GMeZtlRow2QlY5s=
X-Proofpoint-ORIG-GUID: e7VjgV-e4R1h_zxstq8KO2D0oGoYRgm7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAxMiBTYWx0ZWRfX6UcWRzbsXoOp
 9qnNM0hlv8amxnzAl5KnLW1vgc0OqyATh56IRi0gflDa68iW3SGZ+SjzZxfReukje8VbmdUSn0N
 DkkJrGwlFEsV5lijh6oSF7R5XvNknL6kx/VZpDfpTc24tAuXe4V1gTxZyCj3wYYMuXEa87u4KfX
 ot6w09iXd8ArE2OiIxtNn4F3m+n/d2QZOva18uJH9n1ULkNUnE1DAklSDtVt+dvic/vy6B1zxNe
 j22H1oicic1NVZ5yDGwjcZpz/pxJuXjCDOiktiOlLOUYoILOU8RBGLXgBsC36d5mX/Ypw038p4W
 SXpl8s+DPN376qsqhUM/+BXci+oZV9pN48N98fh7+WL7yOio0Tn1WgDyRAS7KtRVol48OL4IrWZ
 wly7Q5YhDH4OugbzOmcSEkScE1RvoqA5NS1KV7+vafEZbNePNV4Ogtri0HPcv4eGBGmbKkgBi2t
 79983P1IxghmmuPNPYA==
X-Authority-Analysis: v=2.4 cv=OfcNnRTY c=1 sm=1 tr=0 ts=6ac5bb37 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=362RFuTrwy6jnSdmp1cA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: e7VjgV-e4R1h_zxstq8KO2D0oGoYRgm7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_202339_655606_782742D1 
X-CRM114-Status: GOOD (  14.68  )
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

On Fri, Oct 02, 2026 at 05:46:40PM +0100, Will Deacon wrote:
> On Wed, 02 Sep 2026 09:38:58 +0800, Shawn Guo wrote:
> > Add specific compatible string to document the GPU SMMU present on
> > Nord SoC, and constrain it to the single HLOS vote clock.
> > 
> > 
> 
> Applied to iommu (arm/smmu/bindings), thanks!
> 
> [1/1] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
>       https://git.kernel.org/iommu/c/e9da5ec4a1d6

Hi Will,

Could we get this into linux-next please?

Shawn

