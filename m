Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4008C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOeJ/YiI8e12fm2dAGxoe8Rmz3Oyrn7Nh3nN6MptXKs=; b=cmpq3wGSI8Tn3Bmq/T7xCd1ZIF
	tYciwfWPuiA64dPakxb8bh99mSooGUJRP7/zPhmfBTCqVaOsnLkoSZHxgN5UFGLZU74Ut6T+LU5y4
	X/QKOfaLqwbs6oxPtho1Fibu7/1pFDVh67Rs5ouiJgH6mfS+9n23qLqtHWtTH46RXjK4iefk9B8qw
	rHfC4PD8tc/oYGC3AGEHbb6uT6VwLUvPlGfOGJ/OLDKx/m90VVVjOWFQZA45V+cpCQ7tyuB9qVz1n
	UYyhBjKoBVHxl5Tzsoj1GH8l9Y3rAyx4cKznj3RHh8UJkD9Lf2U93kSxxTw0Zndh3HA+0Pf9czACA
	j9MlPeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW7Z-00000004X2x-3152;
	Fri, 23 May 2025 17:23:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIW50-00000004WIj-3Zb5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 17:21:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCADjY024810
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 17:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hOeJ/YiI8e12fm2dAGxoe8Rm
	z3Oyrn7Nh3nN6MptXKs=; b=jA+WO9AH+rgfSlKGcCcc9D0hEV8twve1YSHej4s7
	uZSl2MxD61YJJTXPHau9GnWwuOma8kuJt/3MoIePPZIsN0bE5g5IPYYW+XUWUBlq
	t9oAZKpi0BngcwHb+dbw+zWQKqxF4IHwnUjLBktWcUg9cYnbnxZDeHMsgLVC/Rx8
	zHLbrxc7cZUio9ZqDRPvio2lcjQYiX4gjnxsFGrQP20cZRYmiTcTUXSG/dtMQUjj
	CKxfGlyUXhVOSCECGQlog1gAcLQgLjPxP47ICqU4yMAg2R37evj/W4v5MJ/46MTr
	DCmOxYYuuAHLpuW+4A0d8jgYXiv1b4gMEFDNN7T0cs6mtg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf52nhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 17:21:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso730506d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 10:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020868; x=1748625668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOeJ/YiI8e12fm2dAGxoe8Rmz3Oyrn7Nh3nN6MptXKs=;
        b=X08nJKhiqZRWTDLRLB6aZcrkgOSTulYApYcHgNSpT6CQM7eId7jnSsh54fuuavUbkH
         04HSZqMzOPAR9WAMntrLa40+ryY0/wUK5FoHoKbcxiUNfO3cAsdyxx19U87u2rATIaCl
         muWtCHTDRsVHqfXdHEsT8LwFOX53Dh8vNLkAbAaaAWT8BAbxKwHg9ToeneJC+c3vbs4U
         2FI5c445okCTppY4ZFe8xeUvN4zKZtJ4Nz94der/Jn+LpXZi/+Jhdk10OutMvn2Fs9rg
         hldpQYSiKssaACezHpUfCA1MioADpXXpPbPDnNacO0c/kAVV+7RlXmu3P3AoJYgFKRr9
         riHg==
X-Forwarded-Encrypted: i=1; AJvYcCXNXThNEOLQKsr8+2JpxXRhOsftp/sLLjwLdfSbQ6ilYIABFbLVw3VszW8ru57z7HpCZ4WkRBX8oNKbkvY9fC7G@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd9E6XHY3UprRSI8P0i0fZu7Ag27wwX1mwsY+S5e3JgWmpZUfR
	OIGjLj5A/MN8EX942xCXTAZGQkj9x04OrX7TvzjhHFn+zMcAAdGtruYplkX0L9n+O4EwyaLPTKc
	oB8CxnN/bh1ootEp3FJG3O5rZgWynb6gtwPvtSCrSF3N+y96NBLZeEcr7VNO93aOJ7KuicRUyD4
	MncA==
X-Gm-Gg: ASbGncu4eTCtdPxo8Vb6DT3icI8pJSnzE427lDDMvOoI+JoSaXSsZH4rnoUgs18SA4S
	D21oG0S2ERuVWr/aE1yW23Oz6fQL1yY8yhHwFAvVhLZXVFsoUZ9uCV1EjmKWAnUaEiDbou9WJF6
	6qlcn8E5JxvWCtE12qwRPDKrE1RHu5Ob+oXQKOZkIBSM4rzp+N1u77dHmacEysMQAwMi6QHVh+t
	7XgUjcem4OXyyXjB5YGlwd+U05z98mnj34S+IrAB64AQeAE8hdwuwz9QixSW+cx6ehcfcxbxWEk
	tRvntuPoJmMz18IVsjSPVVa94cjooRchzGxJPR33Bm0Wz0BZhD0EgEW/dHYDsXH5AeMKqSv/GPU
	=
X-Received: by 2002:a05:6214:2421:b0:6e8:eabf:fd44 with SMTP id 6a1803df08f44-6fa9d164c6amr5107386d6.27.1748020868420;
        Fri, 23 May 2025 10:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAwI+WOeejjHyUSuLpRFabtnlXhNit49HAfJqjK62r1LhKzwWGL9glcTDdMCXNFX/SZfAESA==
X-Received: by 2002:a05:6214:2421:b0:6e8:eabf:fd44 with SMTP id 6a1803df08f44-6fa9d164c6amr5107016d6.27.1748020868070;
        Fri, 23 May 2025 10:21:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc06fdc1sm2032229e87.110.2025.05.23.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:21:07 -0700 (PDT)
Date: Fri, 23 May 2025 20:21:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Casey Connolly <casey.connolly@linaro.org>
Cc: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Eric Biggers <ebiggers@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Nishanth Menon <nm@ti.com>, Vinod Koul <vkoul@kernel.org>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND] arm64: defconfig: update renamed PHY_SNPS_EUSB2
Message-ID: <z75sarbxjtrrsrew2e33xelvl2oa6auchndjztz6ym3emy6mer@imoqowpg65hp>
References: <20250523115630.459249-3-casey.connolly@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523115630.459249-3-casey.connolly@linaro.org>
X-Proofpoint-GUID: coIQn1fwdB5jQ93ueOoFeinuP7eMoIwE
X-Proofpoint-ORIG-GUID: coIQn1fwdB5jQ93ueOoFeinuP7eMoIwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OCBTYWx0ZWRfXw/NxVpdMqrJF
 UyknRjVn3aLwYCOlEH9zlY1O5vwBpgWaZ9KiGIlpYp3YOFgz8Wfyc1KoMYjz+MKb4AMBtEkMRXk
 KOqSuWBBohoXGqydqgLeIDZrkujVngWJScRI9kJA3DXAo5jZJzb9l0MgJyWNa0Nli5MusW+nAsP
 hgVDKGgGFT1/Fi1AhVRkAO5vg+jTHvYG5YW97d00pZszutdGYRHHVQM5xOzAioynNs+er91U1Wd
 HX1AAMDxJtxgTz7lOZTJO+gkoeM6cBe+jhd4VHJcrtHBV1tyynUVkFsrsfvwX3qpsimtDIIQAAH
 SzTZyjsUcOJOr1l0vubK3SIfBujciR0YU8Oiz6eeuDmLWr4e3kPeVbTzwK2FE+bNlEdcIGdrfCd
 TjeBCmEnSFr7MxPOzqiSAKQdi8UAtkkqsp8zJToh9XfqHljDhC1Udg545tx+5JuksARCzeU9
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=6830ae85 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ko6UrOkXu6_aCceG0REA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=680 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_102111_007876_535E4E44 
X-CRM114-Status: GOOD (  15.55  )
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

On Fri, May 23, 2025 at 01:55:34PM +0200, Casey Connolly wrote:
> This config option was renamed, update the defconfig to match.
> 
> Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
> Resend to correct Fixes tag
> 
> Cc: linux-arm-msm@vger.kernel.org

This CC is likely ignored

Nevertheless

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  arch/arm64/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
With best wishes
Dmitry

