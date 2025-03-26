Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F06FC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RY0WQaB9X6ZreP0NVetrV9wAt2tqT58NwwimdxdQF20=; b=u8c3PQRSLkxbzZSf0acMqw7Vd6
	UgbxoNkZeLVwB0D2DMrMvTAvyxhUy9gY4kO/akNkrMxrzZ1RRcqiFyaHVU+7xclUeo9yiJHC7p9UI
	iCaIbALdXqDqak/RuPR64xsA5TpCw+Y0J8UZObsgcEMkcJhy3Oe1HXGzkXT5j3jO1sN50DK/MVoXv
	a9NVQRKwlKDuJmGSsH7TB22avFK6HDL7BK3PxwnS20Oq8zZl6IqIxPjFUJCnPmDhCVdeyGfjH3IVk
	eRaBbPq8mggEWP61njDLG4kV4OidSn9t6eJ2hopOgw9EQCHe3ZukJMg/wdGFeJMe+1aajvK9dtmKd
	joptjRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRsi-00000008hyd-1JmI;
	Wed, 26 Mar 2025 14:37:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRps-00000008hXf-0YiB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 14:34:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73E4A009030
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 14:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RY0WQaB9X6ZreP0NVetrV9wA
	t2tqT58NwwimdxdQF20=; b=NoGaHWXDU+LVn7AtakWhD0dYjqhRxg19LcJnyWot
	M/3wJQ88MXpKvUmtVT0OZ7pDfosQbmfvVDvA2VlMiKKAUgk8p03yDTe633zFmNyw
	gnKRUaH4ngrb+70yFCr5ihb5jJKMuE/c7jZ6Z7J2CSFA+vtWRhNynmx3Ah5F3yld
	HbIar1xIAdoM1xcaqNhtdKV4b8IBmlTqByep1i3f5uQogALygQmMpu6eNteXZQKr
	s5LwbUUEbgCDtTNbmOgGqEn17IuH2ORrZ5cksGaiOLfkTfLfHKnOXGGKR9Wb4skG
	spaqFv87QtX/1bB49QeRtKJNOTDOdov98QopXiTB75gBnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4n9gp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 14:34:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff55so954651085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 07:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999666; x=1743604466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RY0WQaB9X6ZreP0NVetrV9wAt2tqT58NwwimdxdQF20=;
        b=TssoOcOGyjSZQxdUcLtEofVF7WQKs/Vt0AweBMaS2zV+bhltHOBRQ4uK+2RhTcH8Sf
         imL9GfD/XK1NWO0aRbzfy9DpHOzyO860gyx5KokGD+XP8pMtyUd3XHDza041ZtyJgOtq
         kkiLUul0iE94b3IPJMT3jv/J+ZRAZqF/jXiTTfkFqYC7Zkx+lX5GgsoXkBCC+vyQ5tM4
         A14tij758ea0fe0E7YeRbK9QjRJ5QLr9Kcstvt1bjd9HPQEu6DCaT7AY5CMlH110s68o
         osz3p6rTOCrXulsjisAWg5wWQsoAIm6ykrToX9l6YcxxBw5rCIa5FKOKJbLjxFPtGg6s
         QT0g==
X-Forwarded-Encrypted: i=1; AJvYcCVzCIAA6P30bNO+ECPu7S7rKSLTolwg66IMllBouTBFfpZfYeSfBTXW8Tc2X0HMDuZ1AwSbhVBzwt7J+AvIyIit@lists.infradead.org
X-Gm-Message-State: AOJu0YxkejpyDMCuwCNdtXcd5rt8hPm5T4GivSZZKobHsOFIsIGdVNTG
	TnrmQbPI3WwiO333gWJ2ro27/7hZhdWNNHyjOLdlo9qBqQpHYonajTuQ+BH6Ykm5dh472XqNMWv
	B2WP+UNrbKRWo5DraLHcLYwPQfxXcGIFUA3I2PbRRkmoN+dSzFy41Uanhq3a7H+u1Uahvqv7jke
	kAMT7AKw==
X-Gm-Gg: ASbGncsbM3UVsFHK6Qdloj0VaM/30xrpoJ+KXd8RWPLejAgs3tZV6j5kZW4JTtM0bLl
	Wckw/dCDR/kp4nFOJf0NDbqdf65CVFA6SnEEYxoWGpJUBnKiSHxzjEFo5LMI0rVX1zx5DeSkKPd
	g8/FGPOQRfNZ8FyH1nV055k2LGkwnbnLm+/XXU2TkZnnQVmxncrOtP02VHp/kd7GeBUko5daP4n
	LpLDFT/F36tlRiTyGvi39Fa2+t31jQ14KrFHT7hi/gkIiHscBE4/m2qcjQ3g4PoDNwm8tDNF1A3
	mKeUASfPYqNHchQcKORF1/qEgoT286gq1LyVDhj9/GThbDTXxwVXO/86d+8q5YYx3xGEzj8BBJK
	T5MM=
X-Received: by 2002:a05:620a:4588:b0:7c5:4d22:2149 with SMTP id af79cd13be357-7c5ba18febamr3269038685a.30.1742999665686;
        Wed, 26 Mar 2025 07:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECnr4KG/OEqDIRPkCO6WNP3n/KkReiXPV8GoopXIeN6jC6CBHU7czD9VyoO4qTAXKU2p3ZKg==
X-Received: by 2002:a05:620a:4588:b0:7c5:4d22:2149 with SMTP id af79cd13be357-7c5ba18febamr3269034685a.30.1742999665204;
        Wed, 26 Mar 2025 07:34:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6508252sm1818881e87.179.2025.03.26.07.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:34:24 -0700 (PDT)
Date: Wed, 26 Mar 2025 16:34:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 10/10] arm64: defconfig: Add M31 eUSB2 PHY config for
 SM8750
Message-ID: <bsbv6isa4dprmirm66keduxdshm4h5spl4q5xptcuduo6jyux7@35axuo7mze5b>
References: <20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com>
 <20250324-sm8750_usb_master-v3-10-13e096dc88fd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324-sm8750_usb_master-v3-10-13e096dc88fd@quicinc.com>
X-Proofpoint-ORIG-GUID: OiiMetemWSg30tIfjPmm9CLS6w72q7nW
X-Proofpoint-GUID: OiiMetemWSg30tIfjPmm9CLS6w72q7nW
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e41073 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xq4t1jtuFps5bkffva0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=538 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_073428_171487_F56A4359 
X-CRM114-Status: GOOD (  16.46  )
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

On Mon, Mar 24, 2025 at 01:18:38PM -0700, Melody Olvera wrote:
> The SM8750 SoCs use an eUSB2 PHY driver different from the
> already existing M31 USB driver because it requires a connection
> to an eUSB2 repeater. Thus, for USB to probe and work properly on
> SM8750, enable the additional driver.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

