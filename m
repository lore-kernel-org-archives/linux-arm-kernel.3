Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E438BC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 16:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=; b=3T5sEQUmJtHOhHuUJeWpWkKlRY
	3hGS7XXg4cifcRluMATmY4gGSa0uqyIOg83EdLjrekvQjZYsvfAgCT8MqtJxbqFlfm2sAeEN2Z7AR
	FWHK/guevSb/H8EAPMVzPZDyQfMkzY7+JwoSLQuey4qPfIIsSLNFhyMXQED061bAYm4kFaBZkA9dE
	qNXDx4PV3+UiQXEYb3W11gez97IfF1K/H02wmTLh2fCx13lT2AqLHti6cFQVR8gxU/9NhJYQL4sBz
	DkiiKdwcxggN/xV9WEsI6k7HYD/4v1t+xGTHSuWwnDOkMcwtdLdQjsLUgeqGavgNIzBoTITqdA42b
	BA3OoijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBc0I-00000005cts-0mlO;
	Sun, 04 May 2025 16:15:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBbyK-00000005c3a-1vTe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 16:13:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5442wY7u018049
	for <linux-arm-kernel@lists.infradead.org>; Sun, 4 May 2025 16:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=; b=KmuoZremEiorgmv6
	hZ8N2J1KRhkxb3L9zQJbG+Vwnt1Ki+ZvBh8uLNPQ3LzBeVueVVb2dCfIsvhQ/T/m
	ZXJs4Z5p5W5H/Q3Ikmk4H3EjF5dSmGJ9aI1NU7zXqhBc/uIDsa088TteaElE4RQX
	dc5iUulHFfafIrOBKhwzXy0gWXSUTDXJAVTcJ7/hmrfWe31Ij7qU6WHk9ARh4DJJ
	jkGwtA4HS8orNBfiW9BB6Jlf61e9njSAzEl/fppwE6QYxxMiqFlTgtK+BgRj7t7A
	8RmJOKvzpLGK9aSIzsvkgX6a25X0wk+5fjH8OB7ouNjlbj+CoMsbTpCCQmmkuv/7
	fS1NCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg26s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 16:13:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7cabd21579eso5493185a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 09:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375222; x=1746980022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=;
        b=MTm5Cw4SGgrPfxnbfirRcsiYHObxtLa05X3vPjydDstAnHaDHWzCLdGxobPf8uLoLS
         +9p/V85UVhsNza7IR3vlVatT0onQQ/r2r5vqotD7DZyGdiYjWMUho21IF4Jul8+hXa3S
         2b6vbo9+sunoJRr04s1MX3WbOEMaa37+icPWaNk58XUWAqNPW70GjkoDq0y5SYjKTfcb
         6qVO4QqQhAF6TEfxQ+RGRzjTF+XO+/dddjHaqTi8Rh7Bwb88jVM36X6NBJTkEZ/2a5k+
         eDyRXg9EfJ1LKQdUZ89J/XyCpNmHuBgs6s079vj0jraFDxzvj0evWGKE/HQDbDMQzODQ
         G4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCX1fPDhQrqJTvHNj31FKcCa0rRP4Vx8shEui+WrvohDHIs/RLrQfGZ6daRAMuL8sqHYaidvF16OsZJEtMOhp8PH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyso/XMEb5Q7JjhDs5Q3OKF3VNqVrPvegbYKRdd9Cushy1sRHXR
	ozgR6GihHA5YV3rOfw2IjzkEVX/3XUl3ub9HdfUCMoQQK1q5oHsAH8Pt45IQ9zP5ppkO74oUGgq
	/YMNb4r0KLgMfjGX+1tgDd6XjZEu/6d/pUf3m7Sj4Z6c0DgMPF0xUCelG9lkJP+6JOBzI3vkmJQ
	==
X-Gm-Gg: ASbGncvwNlm1TdZJaasbxZHvPivhDmM8T++hJErRwPC2Y+UHQZzLCgQmemfNb+oZNRW
	ZTnmsoBPECaXiJyAdnJAVcgv69QwX2LSZ97S7mDbz53mNzhVTVKDjXEZ126B0LjWcTLsWSy1wWK
	tuGjZn4s27ItC/aFUaM41AU8ON7rLInAU+KA60F2pVpZ2WZcP+98YdYi9guW/dsOg1OBWG3eaZ9
	ei+bk96ctpoKDyZa7wlwwFkL7EavFr68uFnMZYcQ0w6rMCVOzPG9di+7y8RDzXo5v5g7OS6Cuzo
	MMnhW83uXgTGzY+qxb+mWvoeBVzthHqKLAmonfL6GDBhofTVSkNk5jkd5nLn07rgefT9xinIzKZ
	ORMwmYVmIhb/Z31co95xjkhwN
X-Received: by 2002:a05:620a:bc5:b0:7c5:a29e:3477 with SMTP id af79cd13be357-7cadfeda15emr898763185a.53.1746375222399;
        Sun, 04 May 2025 09:13:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9jh4HRhFrjaplPP4DWWTXh3MXHXCDhI5cVsnoV7jzD3rgGA1I0X5J69xbTqyP4ckpUfqShg==
X-Received: by 2002:a05:620a:bc5:b0:7c5:a29e:3477 with SMTP id af79cd13be357-7cadfeda15emr898759485a.53.1746375221999;
        Sun, 04 May 2025 09:13:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/10] drm/msm: add support for SAR2130P
Date: Sun,  4 May 2025 19:13:24 +0300
Message-Id: <174637445761.1385605.10286310480029078025.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FnNjSM5toOeIP2dqZg7E_FBsypU-3REn
X-Proofpoint-ORIG-GUID: FnNjSM5toOeIP2dqZg7E_FBsypU-3REn
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=68179237 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=iEGPaXCqe01J9_RIJz0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX0QgX0V9k51vM
 jpafwHi6fEDD6aC0fjqO95TjnMpRLXf+tGdiLyilowJepyxjKRMi8QlaIWAV6VmMarkEcdalB9V
 zElMIY/qi+Ivx4BiVNKUxNWR4FsfiKxYcuxQpMLP1od7GOWoOSOrYXYfQ4mp76t5kNH3TvwCFhJ
 61YcXnnwXzaApRQxnJHbcpo0CsAbF63Lcjkyrz6romdnk1YN3OgN8H3orr5U/YSxTng7Of0OwpY
 td2W+4uqQ6wXylu/DjEKS7RMhPj4SNKk7tyA+7ib6EXqmC5thrCQblG1ijp5ZRx73jpEGlTaNFj
 5AvaUjzWsEkJ38gXT/h+0LQ31Fi9KN4RfZcyvA5paVRvB7bXxWioa1rOaopt91chMgPiSGjqv02
 O6axCXiIDG2zLKrqp8FdCd/gVV85SW7CTjyO/Z3n1mIexbvQFLaP4mZtHGp4TEQOlTU+yKCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=920 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_091344_623478_1DCF6E93 
X-CRM114-Status: GOOD (  12.99  )
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


On Fri, 18 Apr 2025 10:49:55 +0300, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: display/msm: dp-controller: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b341da1172fe
[02/10] dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3c70c9d0a99d
[03/10] dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/262650e71854
[04/10] dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/759fe7181723
[05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3096209b7a62
[06/10] drm/msm/mdss: add SAR2130P device configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1e7cbfea6624
[07/10] drm/msm/dsi/phy: add configuration for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8e63b2075e01
[08/10] drm/msm/dpu: add catalog entry for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/178575173472

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

