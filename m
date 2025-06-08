Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54FAC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=; b=rtDRyeywFrOltZ
	4hqmKEo3zyjw8XCigs6cF9XnO0UBC/b/j0DRdkgSRa/R8ZbDrXSy34afKdSz11qPnGVSVQba9Jc0L
	vwWUV1RmUVRowYdBbcM6+5Zal+/Ojwfk5bqWUaf/VoE88olh58PpGV4NWg8jzTz82GQLIWVTQQ+h1
	mPXXh/WHBKCpN25o/ooxEtibtEHSDjFMUyLYSKmGq2dYqm42W2f0aMWvKz+oQVKwZMjx++/9wncFb
	uAP/EIkK34s5RoOkutBjljtZYTL0MxN4JoCXnyfAIVwn7MvxHcCPM3QqYRrTRScDnKa3q4zqaUk6W
	axDAc920jAXdo/teQUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOHto-00000002kLg-2ydy;
	Sun, 08 Jun 2025 15:25:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOHqF-00000002k57-1GOE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 15:21:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558AjJld006283
	for <linux-arm-kernel@lists.infradead.org>; Sun, 8 Jun 2025 15:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=; b=Pz
	6uu8ruZbbxQJBWUXgV7JoCc7DBOj9QCBE60RwlPOXfeA8Xxzc7Ffhwn92PGbcJaa
	DVAdP+4/zh0K33sE2OxLMn5Iwq8JuQS9jKtDCZDUe3KJXC5cObD13UyoKb70iBmo
	AAgLje+TV0Z9b/VYYs8oa9oa9KGoFrwxndeTr0Z6DfL3TXfeFVLQoE040kMgzbXR
	1njLB2t1KIfGbeBTXdyaktZuc4qggx61LgIJHhlST3b29aqKO7xvsJqvJkThSIJT
	uj6saz0zK4/2pPa8Nx3ARz2hCjM6+khqfnJt+yJPnm/0wrNwbUrJuUa8SaGTFdne
	tpfmjWkvzake6hBeU68Q==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpjysf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Jun 2025 15:21:46 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2e3b719adeeso1417454fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Jun 2025 08:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749396105; x=1750000905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eBW87gG+bs7XTeUanjoqFUZo93HnKMO9MXlkJu+f3B4=;
        b=LnGIFS6JZMQNZQavCUotxjhJ4t5jpjawePnHKCmcpZK4coaHjYZ8n1+PuexS//3w+0
         GmzXRMJGw6gi9xbMWU3/uSJPkPIIkvqhI3z73z3+WsjdQRAOCGRD+E2nWGFCI6KQc8Ux
         zsAnDfOYGEgcycAX8HTkmY3ujBdLI92EV2T8e4JJeEzBJ4mhZXNqeXL0PjAwYpi/6+U2
         KoFvzw0/tF3Io9Qw4Y7PpSuvpm2HOv/MHh3lZ8CmkNyV8/WtKGcN0ZGZSGNaJ47bMRe9
         Zou92inYlp2SErDDsxPoEb9wuKEhirDvuawfz/z4reQuVgVWefoCbG+wRa9CNP9cGQwg
         VdTA==
X-Forwarded-Encrypted: i=1; AJvYcCWY+zRs5OBKyxfDPVsjRxR3dPCtcoaddJRMNG2WcFP/VctbGBR5LVU9Q1Yj5qr2b8FZzDhf+lQrZysGQrdRfZiq@lists.infradead.org
X-Gm-Message-State: AOJu0YwIs5y4d0nRHiRngi1e844BOz4XMAMwIyzb1hI6lLeCO9F+ZiTL
	rmkvIbRcRQTHOJ4unO4YnVY6vBtk+1eP9k7+SbihWYRbMOsbqWrPFqun3nu10uCVU9ouE/hS7FP
	D4ovxCcsLKa6GPkmDSi/fZrBsGpRW0BtcfQEEcKbAm0Fkvr4pguP4MQ4FPpDgHczRQScz3jn0a1
	I0fX5YJZhkQaBxmFKUp0YkPBExqUVwU8YCt7rX42LhEQCFsd+MMmDO
X-Gm-Gg: ASbGncs+fEKXW7SFx9UYQUwveOtQu9vG7sjQ1XQpujmhqmeBrriUOilVWIyNBPDptnv
	e12+8qowtglOIJ+2vb2j84myNy4AbJZc2nlx6nVBbyxedkDHEE7VLJwzvGjoOsCunzH+rtlbi8C
	y/9zXptPbGTRg49ZoGH+Si4XhMapfJtcsBFAw=
X-Received: by 2002:a05:6871:7b0c:b0:2c2:b9cc:afb8 with SMTP id 586e51a60fabf-2ea007a9e74mr5430090fac.7.1749396105519;
        Sun, 08 Jun 2025 08:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeiwEJ5iaDlOgKPAjvzclsMxV+Ve51cmb4U8YPN6w25l7BtGOQgh5AvGBbsmLKSAPaB7+VQf5sDKWINoqBQY8=
X-Received: by 2002:a05:6871:7b0c:b0:2c2:b9cc:afb8 with SMTP id
 586e51a60fabf-2ea007a9e74mr5430084fac.7.1749396105225; Sun, 08 Jun 2025
 08:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 8 Jun 2025 08:21:33 -0700
X-Gm-Features: AX0GCFulliz7op4BWmvcmnZlyStVB3chNWH7TufZIrZInNo_JnqWpgSQFphHTQk
Message-ID: <CACSVV01A8aqyoM4KYuUYVXTHnM1egn5-4UxqPrQVVjuvxxbC6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support for Adreno X1-45 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6845aa8a cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=MXl9TKsJXw4pWBb3H3sA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyMiBTYWx0ZWRfXylhO8xrgGL3s
 eD7Rn67jw9nrXu8keh+JmolWixM/vnCHOmV4YB+jwBFpjrPbFVVSNaL+14SwTD3XNDF+3wDDh1L
 gj0grTF8R3w8XgWd0SHH1qu9IZeTszH9OpTGzpoccIrOpXZoNJLA8ILCkLqg3unUgeDR1Nz3erD
 3GD6i93UjcsGssajmsme2sn7/N8n+FHg3WY8xpf+l8qqLFiBhyn4TvMMYlANSa5VBLGPtmVe8Vg
 ZG1rnIdKlKbvoGez+ZHnzhc2aNzBkkX9uQxTZw7bs6V7PXV7Drzfmb7qLZQ/O8kcwe3SSLw1oIU
 3TPJLIRMTXHsH6wB6Mdcmz8rHJoWv4BLVSjIfniYcHIi5MI36Zd1vFPaUnH+l1hOCIYawpTYxX+
 ohngHLTguwUS1pEoHr+jeXA0zrsIq6Nvheh48a9yDfUmQ1pgzVCiodeYLJriel7EVHL3kI1k
X-Proofpoint-GUID: tboE9-H5rVR19bZEEyz-Krq5gXxvq8id
X-Proofpoint-ORIG-GUID: tboE9-H5rVR19bZEEyz-Krq5gXxvq8id
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=711 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_082147_343274_B774D2FE 
X-CRM114-Status: GOOD (  16.64  )
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
Reply-To: rob.clark@oss.qualcomm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Jun 7, 2025 at 7:15=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
> version). X1-45 is a smaller version of X1-85 with lower core count and
> smaller memories. From UMD perspective, this is similar to "FD735"
> present in Mesa.
>
> Tested Glmark & Vkmark on Debian Gnome desktop.
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

fyi, mesa part: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3=
5404

BR,
-R

> ---
> Akhil P Oommen (3):
>       arm64: defconfig: Enable X1P42100_GPUCC driver
>       drm/msm/adreno: Add Adreno X1-45 support
>       arm64: dts: qcom: Add GPU support to X1P42100 SoC
>
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
>  arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 ++++++++++++++++++++++++=
+++++-
>  arch/arm64/configs/defconfig              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  38 ++++++++++
>  5 files changed, 170 insertions(+), 1 deletion(-)
> ---
> base-commit: b3bded85d838336326ce78e394e7818445e11f20
> change-id: 20250603-x1p-adreno-219da2fd4ca4
>
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>

