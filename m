Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CB7C98305
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWkl2gI4Dl651xy5p+ZRq11frqsemeLyAmJ3wzayKPw=; b=OOgWU6Mb5xUJivCj5u4YXRVEbJ
	dq/KrdBxTMYV8Y7XDgGLTR7EsQyltACbMClaBcDtZNKAB4kNl6ptXCdXZZQinLPP/obCAXMORtOQ3
	clJ4K2kLd2SCox0iOcB7rGzYmoaIoYeI5phHef6WufLK5cL8zW8UBcMcfL93009h7W/dKpH/GkDVH
	tckFGw9bEkF0YvEn2BBv/zxMRcHncavNUHk3LU6wfxHDlWLOp0gLOL/TrgU1GaB69FVtnOSBiPwiP
	WOnN68iVbT+5djealO0QAYL5tpwCtOkbPxPaiEnW+/lUH55gDesLDV1HG5kWsyqXh4hFQOk5PTtGv
	K7WjxoHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tpE-00000004KGP-1ECJ;
	Tue, 22 Sep 2026 06:17:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tpC-00000004KFN-18Kw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 06:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WWkl2gI4Dl651xy5p+ZRq11frqsemeLyAmJ3wzayKPw=; b=Iy2G2cZOrUfwK8TmlEbEvtZ/rQ
	dd6AwJHIaSPxVS741Hz/Ks8ZAVP+4ClcjWLwWUkXpL03mE/f3KWpcFd7LUtYtNMemZLjXwcv9fEOJ
	fWAvdvVazDRv/xvJksVybrOUEJX6APAYZKmK/yHlUu3MFEnxkAJ3qTnd84YJMRp7egv/qpHbZDNBn
	AeoVT5RVDw/sFLV+Hzcx7F+1hYLiayGH+SuXBQQBcX7iVNRVtTaCjPvydnyfEE3ep0RvKHSjRJaMv
	WHozvE2nIQ0KSsIrpbJTJmbiymCRbe8MnG4wrus4dfSIHp3XZHcWxqrK6vwMR9zdGyKNCFqPWoKd9
	B2Pas7FA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8tp7-0000000D9Oi-2QFA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:17:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00L963677173
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WWkl2gI4Dl651xy5p+ZRq11f
	rqsemeLyAmJ3wzayKPw=; b=GnBDRBIwRxwG2hKdfSdL1C+/oagrSMerIR6B3ast
	gFSZ/l8MaIiWqwgNwE/LPLZ0gkTGMtbMpyY3ICt+6LZQniNcJSGquYjnW9/FWXu5
	A6mBhexJb7PnHOPLt3Wf5WtvGbB5sGwhXtlCwLUimuppaQaUmqkAxFA0Rx/vjeQX
	N9GmrL0AvaX6roiraAWk+qzahYA5CDxHf+6w6fGN3poa/IOhSiqmqKAHISoZeQ0D
	7XPAA48EvlTtyLZ7qciYsvJ8NbLgiD9/CUo07DIr+L1LK/5mueVsJTaQxVa52Ec7
	evFXgRB3NUeag3riS3J/fqYsa7SCplCPT1TPplD3b5isQw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vjqys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:17:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc489e7a701so5496247a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 23:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790057864; x=1790662664; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWkl2gI4Dl651xy5p+ZRq11frqsemeLyAmJ3wzayKPw=;
        b=aooGbB6CS0ELBmwaw7OwauQMlWMByp9sQfNtoWBFXPjvctq1CImNla6HIhmUVJIpRb
         JlIIgfYNZCNby/C90H2l0o8w2xzyglfjmbrvJSmAAyJw2qVsHUh8xFtSYyQ1ChMr69NL
         jRHYgY/4RzzCv7Bpl47Mz6P7VqqZxNaGmN8qf3olc+guRqpsZ9cS1xAbkIsCJZn5VWdo
         W+KCDCNbnMSANiQ+f7TCG+7yV22kJxaC42AQE/SKyfFFQLW+t1MmlR7TeexSLvZN+vlr
         NTtZZw0apBc7iYHBZrpZes9oan//5EiKu9tySfzzObLe20XE90QD0q0NUcs3FEHijsj6
         CdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057864; x=1790662664;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWkl2gI4Dl651xy5p+ZRq11frqsemeLyAmJ3wzayKPw=;
        b=ccaIB3OntIUapPCtYWnWM5kTinjLOMhGaK8AjTloBIiMY8P+boRSzdSNxwMgKFkKs4
         vl1kxw3WwSCNjpfWrvs6Z5aVivNyekEuG/z8raPoGbDEmk48AOMgxNH5zIIGH01ftZox
         PVvGqs/FdnOnI8X8AOjJmMpbGXy+8j1Cct/0thZv/SCtJhKtbS7vP58tptJIDnFcR10o
         ZqsHyX07cM4xFWyF46WvtgBbKXllYoDaiSkiaq1/uA6h1E4sV726rbssbG/a79YdxZ7o
         tR5WLhthb95s4x3Uk6kgIoMlxnHlb0Wsd09TDQHSkcxnDH9fNOhWkA1u+GZzsKWnbd1D
         5Reg==
X-Forwarded-Encrypted: i=1; AKwUvByys394bwPsg/EHAzxZFkqO7PtxMljiRgbtgBxwaMouA9YnlHzGf/vGYqwLlQRKMJZoRSbXLUOgj3JTjcEp9CUI@lists.infradead.org
X-Gm-Message-State: AFuF++lqWOOuEZ2CNFFrNrWJG/k1cfgZ2TRpV8SE7RkAwumhbIBBtesU
	NY2h8rqafDepKrI8K5L16beizGejUKx9TzvOWceAkfdEv7iI1xE7IG3vzIp/xSH6YBznPvDjXTX
	HnX/a8ePujaChX0idrf04iOAaZB+31ZR7qDeU57ckfwBorYpKozo4w8VmfNYXZRPKTwODIirE4B
	qtd1PlDrVrpg==
X-Gm-Gg: AYBFou0q58Anl4mtOBZ77yDQynEEoy8Wd2BOMoF8qjCpGhjb+9MAadENEvTurnYArkd
	cdoNCasPrqaMf2aEk4s4GlLsUS/JsOAhKKyXyu5aJv+npbNXiuRxnwaagynNYcHIgssjipQ7rYN
	Wy/YDSGOwBrH8p+Y5Q9oPQq7ujvrVOd0vNZQZ2Q17xhNf5bhlG+HxV5bTGE1jHtiHFBgnFozSt9
	iSNhl2NoiB/swc37mFcT7JcS7hZ9Mry4p9Rf9iYVh7H1f1S1MaWcGbvl3Q2yBX6mw6R+ASe6mve
	K04VNW7H4c5qzREhIpj+sIbwWKQPh1PLaD+mgQ6TOFl4JevM9lt3wIJo07MCcb9aj6wyCUn6FOZ
	qJaD9iKlJfMD6Rnbb84Y+mElaRUbmSIUrz7Q=
X-Received: by 2002:a17:903:3b86:b0:2dd:c100:a5e9 with SMTP id d9443c01a7336-2df60b7ab72mr1331765ad.61.1790057863726;
        Mon, 21 Sep 2026 23:17:43 -0700 (PDT)
X-Received: by 2002:a17:903:3b86:b0:2dd:c100:a5e9 with SMTP id d9443c01a7336-2df60b7ab72mr1331645ad.61.1790057863321;
        Mon, 21 Sep 2026 23:17:43 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e786dsm2974252eec.1.2026.09.21.23.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:17:42 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:47:35 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Message-ID: <arIdf+RFybbdI4ki@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
 <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7266e78b-6768-47f3-873b-920c4f7e5d80@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfXzFSN6/LJ4g7g
 om0vsA8Opj7yDf+H6UuaZo1sR6q2TNiQ7ortbW+ElwdqaPvgbacnBQsrdJm/CmfBpS8Kz+DE1cr
 q0dXYWQkIVwTfNPtJcciVZCyEpIs+x0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA4OCBTYWx0ZWRfX1Faty+47u3UP
 SN8nGNDCGgbTEWP196opgWWymFTh2H4nPJvrMJiJUGAJpxppM2vYraMh3EfSi/nSdHTK06MuK8Y
 74iFqISYt4ABexXT5PJadhN9yB/DjXcNxI//A0/cyz5yM/dNAZCLSwoHkjELRqGqj5jLcxiv4dV
 2QsQ6JHkeldQ1PZMiWEUtV9uPD/YLhxBeuKy6pxiYAkpr9+zokDhfnpWt8BN1ptb362AVH5zvN/
 yvarZ6xF0QrUtJ+KBeJG/qJbOa4zFidnvOe6mtAyYv+arq7IKwVS3uRMljayciAH3H5qiXCEjnd
 p5gbW0U7TTZLRhzvrRmSsP6/sOB8EMXaKIsAzF38ZLeexYEBhwe2SqCHLWO/g2g10rrVaSdF3so
 ob/taPVutOCqORoRW8yL5ft8il4z6oHYfsFXUG9LNdfeIFTQ3HKC5wtOFmV5xmDsqEDRZvJhDd4
 KxuMtbge/QgI1HWVIRg==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab21d88 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=x-C9AHaFmKqvuEDWSewA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: KGSLaRGS2BqoroFbO-i6IcKJT7yeQ1Ii
X-Proofpoint-GUID: KGSLaRGS2BqoroFbO-i6IcKJT7yeQ1Ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_071750_384597_FCAAE34C 
X-CRM114-Status: GOOD (  17.22  )
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

On Wed, Sep 09, 2026 at 04:51:01PM +0200, Konrad Dybcio wrote:
> On 9/7/26 8:33 AM, Shashank Maurya wrote:
> > Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
> > Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
> > I2C8.
> > 
> > Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	reg_dsi_touch: regulator-touch {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "rpi-touch";
> > +		regulator-min-microvolt = <5500000>;
> > +		regulator-max-microvolt = <5500000>;
> > +		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		regulator-always-on;
> > +	};
> 
> Does this need to be always-on? There's clearly a consumer for it
> 
> Konrad

No, I'll remove regulator-always-on in next revision.

