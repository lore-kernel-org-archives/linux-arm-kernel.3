Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2383EC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=; b=xnx2Xp64vWnoCFJaWt0Gl1xRdT
	Xw5R/XM7NCRTL45NrUaTKQ6Fqy57qxW1eBo4ZgTU8POJ3r+h7ruUoqf9PshCHuBEh6K7g9BSmhs9W
	PoRU8RscVcGjD6OdV+R/1C52cJaVHRgyigvSuIi/4Qv+/c1YxbikJS9prR/sgjLgpUxx6Ckdeksaw
	IzDdCMGIDqDqc7p6LjHadChwu9WJUTjBUIqEQIA7w1IfDzdVwQtrdxA5nvw+YnrKk/hUCQduYDJkq
	5PXMVXCJRXHpnRbd6algHbRgFipAmisNHcfnfEhRIzJA8F1CttA58YXACDDBTJZJ09NJiTQSVmxCW
	8mGrfnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lBj-00000008jW9-33Wh;
	Wed, 16 Sep 2026 08:40:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lBh-00000008jVf-1ycQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:40:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G8VXpp910433
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 08:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=; b=CzkOeRvKZ/Il1fGq
	PfgHu7bAoFRYlU1hcVGhiYp7ou5rH95zbeILnNuLzAZ0QL17PL50zJ0rRoRDmuTO
	wvwj0tQAdSLdRUmvQv4zGDY0jN+IKXAG+IGqnIJAoGuF0p+bhKkPYHZlwSiNq+1C
	lusrNWf3kL86da9h/kfq0hPAEt4OTzG1angAnV79j4oyKJteoAXN1K1L2Mn8Oo0L
	K72y0qnEVR4TMpHBh6Ic8ja2i/8zJaXnjoQMclW/F5nuBl5b+TxZdWVIKthwdv/s
	7VyO28k3JswSvm1+GusSnyaphy+uFf32epbGhoOIHhL2tPLD8lolBbckzeAUoO65
	4DQsMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3r15h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 08:40:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f248907fso432040385a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 01:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789548015; x=1790152815; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=;
        b=cB+j5VbFChfN61Kkwu2KdJ9hkKmhehoh4hm8oDVXybqGg9p3i5H+wIn2Iv/Pa46sNE
         dGAvjNh2cJJeQlpQiecMX/o3Os2gQ3ujcNWfircP2Ibtpr+iAgdi54Q1RSCfpSs32AZI
         ae01MPykAA7hgY7vMe6SnoTVU059WvfR1ftF18qSWN4zFjNAk/KLMBn+OKYJ5o8bCAqP
         r5iV5jUErO1R3qc23HszWbA6Xm8eMWPEbcrblDOwnIOEDjaY6vZEhU9dQqzEQYO5x+jR
         AH96NhiP4bbxiyBgTyycqB+RtG1IYExQYKWlbockIv/YSWSSXxB/B3mUBgmC4DIdkvQk
         XiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789548015; x=1790152815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v0esT5zQ0L/7sBuFLspH1Wt9EuNM6Iwk/HfF5ZHe2E=;
        b=WteTW4vw16y+dLDEutIEYiVFQTeOolnBGzsjfaEGavUM7CUZmNeTHUT3HJV+0uQv4v
         NBPZgVfDtLfG5jyjwW7UF4fAYa6+BCs28xHspzPDHii2dPZbeYewN7Bg1vkkPDqu3lG/
         ysxyVQQ4FRjmFv5U3tzQdrHti+ozluT5B4ZTkiexZ3aDq/A/bc6O1Dijzm7MZTZUX+Ac
         1acJHv+nPTsG8qpBQbe8Q87HAMXpyks1enKhKYtyKzxotNLFAxKbi2xVN1vbK1C34N0O
         Gb1ZL1+J+dMsIHhhjIx3OEASIcsh0tOrPoyc+SUGG97A771JnNmSQWRNMzO58/aRubY0
         UwGA==
X-Forwarded-Encrypted: i=1; AKwUvBy1uwMpRwCaHMp1tKG+BS+i7sKMPmF3oMIMNR79Fl6nLV8rmSdXam+pbHjZ0lgrXVEIRDmFq2DRckOpPYyEneNj@lists.infradead.org
X-Gm-Message-State: AFuF++mc/aj/fx3g4fizheQ5FRcYmgwRlppmtZRPpbFyv5rOqGnk+bdU
	F13Y72CdLmAgRzY6Ls08OM0xfcQeBci+8kK+7oRfv7FeQRqmzUGLS2eWzfiNRz16xRAuDO0YJAj
	5GwLg8Gif3PVfgQd0TtzTKJ5azBV0YIXGbQIDOMT4iIJvujOCbpyvWidzFaJrEtLSL34OlDwz+G
	lnYw==
X-Gm-Gg: AYBFou2pwDzVWre1ii78uUsDw/eoKyfJY5WJ+lkT0s6gNeExMvy0cce7C7Wtig4Wyx7
	q0C44u/hN4vn/W4aw0nvp6FA3LtdSaEa3dISP0o2PSZqOREBdNWs2Pr1RAvQlpKb3widFb4Uy8E
	y6I7BawxrwyxY3h9mRTCvEeSrXEkRBpWwrTPoyGLv5Rg099onnHVWfYOycgBqTGxs7WCdIAWV/v
	6wj3h970D5nvIOq5JeJ38YplRoRGzu7R2/nTDT7Xqmv2IzEMSB1Z3M1mftSbD0UFRo/Si8qoyRr
	JFGGApZDWvb6MPWvnPFgV4ID3dzVUHGiKY6WL/VVpxKiuFd8KqdCp2dqO/dlUrOAoa28boUEish
	LTQhIyEWFUIWCghwEoFgz1/koanc=
X-Received: by 2002:a05:620a:390a:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93bb77b1c21mr246029285a.19.1789548015001;
        Wed, 16 Sep 2026 01:40:15 -0700 (PDT)
X-Received: by 2002:a05:620a:390a:b0:939:b8d6:9b1c with SMTP id af79cd13be357-93bb77b1c21mr246027385a.19.1789548014553;
        Wed, 16 Sep 2026 01:40:14 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83d906d8sm73865635e9.5.2026.09.16.01.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:40:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
        Michal Simek <michal.simek@amd.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add parsing of hogs
Date: Wed, 16 Sep 2026 10:40:10 +0200
Message-ID: <178954800853.4594.8595812335240808989.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
References: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfX9zROlRPzCdd6
 2ISnWGPVB7dNB6NVFGkJgJz+KOzT2pNwh+AWEcpjJWos+mZx0KW8uOYCE/2KMG8Vy0k07fTN6sr
 LCh1zPDM7brj5Q0XhfphEy5lfmO5LKbcMWYmzMQKMVfPiRWSJTBbwK+/M1lDAvXEpMfPOFAvAXL
 TelWUlbfV9rlMYwWAu05bj6sl2cCjN4Uh5GtvMDfAFiA+XH4mDyN7PciPCQTbqRnwv9F0fo4zRT
 Y/DRNHS3z8bB9Bcwevo0w7/w6Wz7WRGexMk1mfHbp95MxGiD7vvGKy8FSCdzmAQWHTvNmjSnFq/
 +mo5C3wOvVvGwJ3AQnHI5deaEjX8TQk3UCNloAWaeQAF1KYKTxWsISHievFMBSgnk6zvFibBpGs
 b7kvmY+xy2wN7IhNFYton94zNP+cMG4AtAzlOcu0gflF34BHyOKrL8B+qxcoBHOpsbi29YmCMc4
 xPEtGyb63vThhJfQXnQ==
X-Proofpoint-GUID: WTtpVemPBWzdRgv-Zpo6yYJKSivvlyf7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfX8xtWHbKBwKRv
 HjXqxqp/Zmf1+5staS1JBa/RneEcK7S7oez+xLcoKuCbKtWPjr9gVdX15VRUUpLKDb+3HD1gSDS
 CyY9qR0PVuN27OYcTYm9bVR5ISAkxpQ=
X-Proofpoint-ORIG-GUID: WTtpVemPBWzdRgv-Zpo6yYJKSivvlyf7
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa55ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UEueuJH-RofihTD06CQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_014017_520524_37C39728 
X-CRM114-Status: GOOD (  11.78  )
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


On Mon, 14 Sep 2026 10:51:54 +0200, Michal Simek wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs the same way
> it is done by commit 545908a9fb9c ("dt-bindings: gpio-mmio: Support
> hogs") and commit e8f2ca6be61f ("dt-bindings: gpio: ast2400-gpio: Add
> hogs parsing").
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: zynq: Add parsing of hogs
      https://git.kernel.org/brgl/c/4bfe5b08a5912d1720689b1fc7f46c9b8641997d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

