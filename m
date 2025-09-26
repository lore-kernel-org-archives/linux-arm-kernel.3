Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7452CCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nj2RnivyVd0n/WCOVEL7yqPGa2Dwqhx2efpqU1IBZH0=; b=ekpFFlYQFgSnBlx0syvtMWpaI9
	eIMACnicDId/jbnG1XilDHP0jTieJEUbttMzQ9DT9HaVpMcbOJ8chGAXLJb/MKseqa8/CLABNeEcN
	2LNoONJUE5FkoRN5wCvkkydHD5RlyNzbKjFR02EKhMa1nGuu6iJcvnaFrRygC6l9tEVwFNdHe9Cn1
	rFUxTAe+xOF6oOV1/vEDho3hQ6YNXhWMZj9gLHyqV+pl9AENoAtJBXpIQFz0DsBRth0AQC7UgEKt/
	yVMm3enAbHJ33Uyj8qdlgN9i4+DzZH8qYP9vVL6pfHrX2cGKgwMOZaTgv7YBxVTmPWw7NqH8FBs1V
	d25qbPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28sr-00000001jCv-3yVf;
	Fri, 26 Sep 2025 13:53:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28sp-00000001jAQ-0mbD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:53:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vY8f020680
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 13:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nj2RnivyVd0n/WCOVEL7yqPG
	a2Dwqhx2efpqU1IBZH0=; b=hg2wO8C+R0urRtBfZxtj2aG7BOq4ov0hngmLSsaO
	X5KuzdguO8iTvI1k6mXqGMiRPYJhwB94qyXgwQWNc541Kz9d66RpEXEz0bjCYVXT
	0GO4tHcML2p8xnAtjveHkOLeCRCbY/FFYtvoNPnggr3izeH0iDy8t2Iumh6RbF7Z
	f+jLphKHo8upBAAeyGYNhpDo565cesigtjO92ZjDLPYo6Ty0WTGD8Q+uePLX0jVh
	ZWCSJmRKCMrSHOMcC+cFW8ZleEqi7inzPWqClG4zSHQZmI0YUPF87j0ciz/qN+qH
	vyYAXw2tlmrzlvWE1AbAXFTf1CEqoRPvQRhuba1yuwBANw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qu2hk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 13:53:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7f821f8716eso55788936d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 06:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894789; x=1759499589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nj2RnivyVd0n/WCOVEL7yqPGa2Dwqhx2efpqU1IBZH0=;
        b=AnLbNNCteMaU5cu+Ii/4vNZoFwttw3uCQaloBPmU1UstWcSWDJKqaDGwdtXIZRU5wS
         ypPPCGc/d+7OU3FgJi/DNahBhiY/wgp8HOykP4LI2ZRjKMR0xNMkBMzvowbcZ222OXkX
         4AWn/tiid215wJT+Wj2dFTw0cMiZCaK5FdpWmsVLtkpDG1SS6T2Pk8r5G4fOtFp89PD8
         09l7ShkySVCkFE5ptVpWz65x7k2OmQmgazsUdQy+6/NYkTQDS6PIan+jtJP7kBZ5Pjwm
         +SP8vMCvkIoLqr3LjBDFZqNy1IdGk6DgLE/A2T4Nj+DREHWptxDrf99rr+R/gw7VsU1+
         wyag==
X-Forwarded-Encrypted: i=1; AJvYcCX0UWqgYsCjw9XKs6XCSOqMIBL5xaPL1GfFdH2ep8X8C8dm0uOSY9tgNZuLlwtaK0bSmTzdX0kC0cWdbByBeIDG@lists.infradead.org
X-Gm-Message-State: AOJu0YwigDmqlNSTH63ao0czfhStj56+ciPcUzTxcj8Mh+/7YSkJJwGT
	pEuOnlFQ4NsBw5oBhBPD6Qxavm5GaV3192LlDZ58bsgFHFsD3VG5bPqfBzg5Dc15ZO2ci72P5om
	p7ZTdAoS/RdIyPoMG+bKMZaPvVpuTIOID7f4HiG5rKP82VGLwfqKb6U17AEtdF69hqfkdHaPFE2
	uTIw==
X-Gm-Gg: ASbGnctSPECIcqLfwFjL9+Hld7KOEPoWdRX9L/S3m5HfTDF5GB00DACTI+ra+v+Z4U5
	wlX4A16tNvENkqdl36pSRRvrrPQQ2NZmt/GW+uevi/C9oIkzqdCJDZ64tJbk80qFMmbCZlX0lf7
	u8UmIgKp4uPRz6r90MWC1JuH83ucG7xQ9jTVm97YChG/RYDO5ean7QcmJfHINu/bAfY9Z8pSnEE
	GB3DnJr0xSK4SWjsUcJ8LIfLz2dHHXbKmHBjFovSp85YSXJBx6Ijb6ASsjctgBaIaswmdHCMFsL
	kVzjjNepx/a6GK/Zr3wHi8QZdQy0SvJzTbOTGyAHqomsRG5gnp8WxZxDY9I/DtfsriyzNKJJVO/
	UBNr0xXY8+3GdSIQlveptYhQQo4lP6sxtMPUGlYucOPOo1MJABWS9
X-Received: by 2002:a05:622a:1389:b0:4b7:a1b6:cf29 with SMTP id d75a77b69052e-4dace86b1e7mr81075491cf.41.1758894789330;
        Fri, 26 Sep 2025 06:53:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMoJDS8aWtbyVs7IfWYIbTpQ5DxMdjd7gKuy6V247TUGZ3bJClP3qwuMmbDr8kW0U3F2DuOg==
X-Received: by 2002:a05:622a:1389:b0:4b7:a1b6:cf29 with SMTP id d75a77b69052e-4dace86b1e7mr81075101cf.41.1758894788737;
        Fri, 26 Sep 2025 06:53:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316ff55acsm1846590e87.129.2025.09.26.06.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:53:07 -0700 (PDT)
Date: Fri, 26 Sep 2025 16:53:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <kxy6p3fj656utoubj37ujzycmmszebmwb4c4u7zkb7t46ddwuk@xwg3xht5elj4>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
X-Proofpoint-GUID: 7TTmCF23TDtypc51HoVBd294hXXvkrmT
X-Proofpoint-ORIG-GUID: 7TTmCF23TDtypc51HoVBd294hXXvkrmT
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d69ac6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=jz6_z25kcqxLI5rURXQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX2sCFjtCjw2BZ
 jM4g6UYn05oxRzor58QiEC7L1Ft1SYRLeh8wjNxjQygTHHJ4L29Hx5cpIpiaHLQKBYXSH1v4HVI
 vQHYM4mT9I+7Rp86eZr1HlpHk1WP3srmOzcMqDk5Jvfo6FNAnywt/GH9bUkmU0+nVh/8n2d5vSL
 K93NUDUOJGY91RQH591EDNrylYDdGJBzSoubK9/ivZ7RmJwH18vXydMzrHYcW0wjpjdYZM9Z3bW
 CKzLVuaooZbPGaQSbD9YGN6qBLqi4M/pGKFkOtFxlnhNMMW5yNt7ZucRkyRAiS/DSvpp3doIFg8
 C4NHDLGm2qY38lumFhnS4JsOH3A8fjQRK38skvq7zzicYW9cHV/ckRU59eWoLYj/kBaJKKhVzI7
 wsMSbgVbzMB8pJM2NpTsN0m02GijAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_065311_230603_C5242073 
X-CRM114-Status: GOOD (  13.84  )
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

On Fri, Sep 26, 2025 at 02:29:54PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> with their corresponding PHYs.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 245 +++++++++++++++++++++++++++
>  1 file changed, 245 insertions(+)
> 

Squash together with the series adding mdss1. There should be exactly
three patches: fix for DP, addition of mdss1 to the lemans.dtsi,
addition of mdss1 to lemans-ride.dtsi.

-- 
With best wishes
Dmitry

