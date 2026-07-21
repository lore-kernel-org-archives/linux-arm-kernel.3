Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063E4C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 18:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxHJZKOUJ+mwEArxOGlqaPjUgMrI0m93hIaUp+NfhUE=; b=jSDGBHTGzb9KnvP6HKqkVH3Qwa
	qMxuye5AzPZJeT+Q/wJMGdrWKYcF8rdzKmlDapy1tBHOcSJ1x1MzsNfYxq2O7jn2JflbAEMYiO0OP
	WBxOc/sdgXnOQiGjmCCdbaOfnz9+sXGEVkaZ2oaGXG9o+TZAbJAHy9Ge+rSSMfIb8mxDFfoPIeF7E
	LxRxdoGDM+DSp4VHOhUJkWu+JeV73pBxgVTahKja4FDBjoD475eqhS+SIDIOrV94Je4tDt/x5tPeY
	pnEqo6NjYLGfSixW/dhbzK2QvjhKoBcIhuHtnIJaDeluKJBM0mlBu5IO4a5C7nWLob6QeQ+BMMYOg
	5ZvjTguQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmF1B-0000000AAar-18q1;
	Tue, 21 Jul 2026 18:16:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmF18-0000000AAaK-1Hsp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 18:16:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2aDl2160232
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 18:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxHJZKOUJ+mwEArxOGlqaPjUgMrI0m93hIaUp+NfhUE=; b=H1suFNFxOBwIeGth
	OA8vRhizIXFBG4CAe1KjeDlL7ay/+2XMOOc0F7TEF8C7Eqma16aRP5EBvZPitNxZ
	sNBI0PXkyhhpB94gUV+lE2bcEUeW4KzGPQqqUbuho5CiMErC7770aACl9taRh0I6
	X/JqfsjO7i3eUeghy84mlZ9nazJmN82A1rfMAtbxriyh5tYvYgMyBUNxE+VfaOjI
	j5IfcThdptWyZaxM5I92+8KGknTHRfOmp0L5mHc3K5W0ksIzFNa1kHCOn/KpBDrH
	WbV1xrc2wcb8xzURaa+SWghP23Msj57Twv3SPSd7k+FMMuLz699o1p5VyZls/Hex
	bHK3mQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9c41gw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 18:16:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so17564434a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 11:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657793; x=1785262593; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxHJZKOUJ+mwEArxOGlqaPjUgMrI0m93hIaUp+NfhUE=;
        b=irwd/IA4H3b97iW7U1j6E3A6jYtdny7efEfhDvccDeBT84ElgxFKb3T4r7Zxzx+8X5
         IaBcHpIkJosgGGLDSola8O5ppwjNH3149ZwrgfB5kdum1/ijZ+gljCG85ZCYvzWIs055
         Dt8dxYLjNsLehvvW2JHSq389OI7jd0GzH4O2k5S+d8xj50Ypmz+njjotN2wARJ/Qwzyf
         5HZF6I8wyh+7nCTKpzqXoK7zWX4/Dg1hZLoOF0dGszEBKD/hL7jkM00iZpAtg01gOeFO
         AhgxcLs0QxwikaIvBdm2M9Ge1XXYTYk+OZvBRnuHoNJvbHhtxvdLRO8uFSZ+rTBd/E+F
         EWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657793; x=1785262593;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxHJZKOUJ+mwEArxOGlqaPjUgMrI0m93hIaUp+NfhUE=;
        b=dGQZsC2y/2l5vWYLAzjF0LWFVpCvyr1nLF2ZlECHGRzkIBSl6glPnEICmQ01/OsT+6
         2H76SpB+ZS0b9eAtHsQ0mxLYz09MimYeSezHpjAUohqd1RD0lAZl8uDUyG3Lr1h0cCi5
         0DnekkyJLsPG8jBDk4wiCBEetaOP5FmwuhWHJLWRnrbbuWPiOCRmMrmLQrm2xTb+ONd6
         LccuhHHH6NN2wCYDKK7t8VLAeYyfxdSxWG1hsbKrmS35EkuMTKi+H+Ad2stAD5VT9KCi
         NNLEB2T993b4fllDy0mdY8Bp8c7MpSpuHJjVltWpWl69JrVQEllAzpACdPHtKiljPIWU
         rHmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUSRvjraB7F/EDSiI3LnfYSV6/uiONAYPrX26ORQ9YnniB7geYY8k8jzsHOel+j0rDlrCmBV52x3XfGgoTGnIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzVbxBrVlobn1VrEJeP47xmYTChPz6oSUFNkPSQNV6lswY8QKYm
	v0zXigPUHIsWmsePDwzCbQNTK5f32NHVaBaCjznc2fEp6kZlrTNjvrWlqa+7seXtIcI5OdabANL
	AEiLumfJFMaOHnjAWJHTywTf7/bQwTGZUPLDmKb/G0Kov9nmgBo6/fWm+QSk9rbs5FdeEQ3xCo0
	bEEQ==
X-Gm-Gg: AR+sD11g4mDE61v7pMMKSnpPSCwJuKYKlhld/jvyppl4ytzEcL2DuKslVY6Hufqhn83
	XbLH2IEo94lWka6RAfBmwgz5GLbU+wW0bE59k9sVTktoAmZvhF2KBDIK7fOt3Izowjpir+E5loP
	hkIlzxFL8Z3tNcH6DLFasFOBlFwJ2ahAxVF7fvBBL+bbpQOutR9FDxgMP+FSX/yp8DFKaizQasS
	0t1Zb4BvhAm0Qst7sbJWsw82jEPhsP9Pw9d4HJhSMsxs4LEkzbjBY7+Bf8SAMoJiXYw2vfeWe2i
	39Xg2NNLhaBmyPN5OUZ7jkJxomvI46PPg156hvHfOE43iK61ghJxixgxuqkV84WWBJpGcncd9q/
	Ka+suUTFNkaYeZgrhe4pSKYzF0/a3Zg8gXGU=
X-Received: by 2002:a05:6a21:a382:b0:3bf:96c6:78a9 with SMTP id adf61e73a8af0-3c3ad665b3fmr20297997637.2.1784657792868;
        Tue, 21 Jul 2026 11:16:32 -0700 (PDT)
X-Received: by 2002:a05:6a21:a382:b0:3bf:96c6:78a9 with SMTP id adf61e73a8af0-3c3ad665b3fmr20297943637.2.1784657792331;
        Tue, 21 Jul 2026 11:16:32 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e081985sm1059348eec.23.2026.07.21.11.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 11:16:31 -0700 (PDT)
Message-ID: <ebf99b7a-8da5-4974-ab7f-fe26e331b982@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:46:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-11-1be02deffda9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-11-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a5fb781 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nYgDJefOb7ZtON2RxEtQrg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kkr9414Gf28UH8S5ubQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: d8RAIWOCDoXCuWxUyIJANyua3rI4oE5l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfXztXegYH/KzsV
 rzCKuvQCUDjDLaBaybc4Gy7mMzjE4rdpiUr8M0wKmNnsjynepZhtua6Mpd9loreNMPPBKIKgnwi
 gz0jFXyLtgw9OGBtQZNSxdh26nDXgcHNgZPswat2MI7Of99aILiK8KCZbwkVQhSWdGK0H0dW7sX
 NYRMyZHwd3hML99LZA+DnoaxlfU4ahWtUXtnyaSDwf70xDSKshI6cTdQKDE+kwtnqUXWWzccAbI
 RHnoRgjofOkC+/l/zZR7m1JImhoRIHGMUYBrmKw+Dz5/VUzxCmetLx8DO2LIocdGnlf6Th/xo1R
 u85aQlytINAGNS4eKiTis26wUsAGTMSwwlwDXUm7zd5u9g7qd18yNCrp6ObuHJKU9wrRzMKXriK
 oUUVod+3soKylaob8Lw2+gXqjJZSA/4FAeD5ho4HWReEaauhsleQj2kwieB628cHW+D5bpD2sOM
 hIhQre385fIF5K+g9fQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MiBTYWx0ZWRfXxNAwq1zZ875S
 cXkDOBMxC+xQqv+yEoPCJ0d79vPgHslzNASXBDaJlTJ/rDyMZFUFc4S2HrVdHoy+0wxULNGz1L2
 WHl6/qdcl8oordDF4vpBBr397Nsnhh0=
X-Proofpoint-GUID: d8RAIWOCDoXCuWxUyIJANyua3rI4oE5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_111634_360300_B6798338 
X-CRM114-Status: GOOD (  11.25  )
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



On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Switch to devm_kmalloc() and devm_dma_alloc_chan() in
> devm_qce_dma_request(). This allows us to drop two labels and shrink the
> function.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>



