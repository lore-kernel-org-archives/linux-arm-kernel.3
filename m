Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A4DCFD65D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IVuHe0wt1etXnyCGWeXSp+IZ3Qg2MMH2Kny/0EnRpgQ=; b=JZZA67GymY1hkRLwvgZi1MlmpP
	t4QPKZzo7KwpoUB2cTm6f3UapJ6HdpHqTiNfczgPsfbc0oJcgE0XArXq6REhTxVEKTVn/xUW/S1Ym
	2fSUeLhK8gUB1Nf7vG3YbNppOhinG41qn9xlinouD0FQs256749ByaY24MpVCo3Hpe9vDfH/kF0kw
	BsuoGfs8zFvD9/IrkoUaGuc0oVa41kIUoSeSolmOTzW19Xb42mcMqz6IDMtiVY2Mep8+AvYrqtSoQ
	Ys/cQmApDAtAM12xUKg8dv+lKCt7C+8ajeHEJeVnOikD/yJD0QEp0HKJ1apU7VlP/BN4mMxeWtZkJ
	c5k/8ObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWEj-0000000FFKk-3EUW;
	Wed, 07 Jan 2026 16:18:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWEh-0000000FFKK-2Vtr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:18:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079q56t218415
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Jan 2026 16:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IVuHe0wt1etXnyCGWeXSp+IZ
	3Qg2MMH2Kny/0EnRpgQ=; b=M7ommpBtDPH5Y2ncr1awtSMNvETTSlM1jTl+9vJP
	WmQGzKpcCpRugST+xcH7Z+lv0RagNJ3ZEMe3aWzIMur6OwWqMElh6SRhrGC9dwA3
	as6c/lkESylKRgTqvcR6XUUXU521nL83yf+ZKdUrwg8CYucGIXKKLcQm2s7PUWiN
	y2JGdPQ0F+R5YOrPPthSHj64qgu7sE/UFbEA8cckO1mP7n6eGkOqyXUiNT1p2Sd0
	AfrACZnMFWHwgiXaszqyXKUJ+Zdx7hs1C6fD2His0GATr+lbzn+v+fqAenK2O6yx
	vg4roz1ujWe2Z6j5IyU9jKTuSkZJq8J2F+zhsgzVNgYA6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn8096hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 16:18:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2de6600c0so583445585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 08:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767802694; x=1768407494; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVuHe0wt1etXnyCGWeXSp+IZ3Qg2MMH2Kny/0EnRpgQ=;
        b=fOdSqlwBK3jELiDMWXoyqH6TfDFARMHdJ64APic6uXux+OYdyQuH4ljyxA1Ho6JwmT
         GI8kNlwdCK6+W8xMXe1PywM2if+8M5qJdvzf/fefQmyrQZ+C6EUVtJbLb2DUAs+LqCwF
         /q2P+Nfh0ywfG/juSvguYU3r7/8OnyH6gDr2eybMfvZBVFLvRmNWtaZF6zh7GlQRlavW
         bKASN2KZrMXMdkp7JWmLmyIdrEq94yvbmDxuoao1vJ0gHEqLXWxF6uNvCHU3ttXTYla3
         rqG/vi+mZwf471JyzyfzAdpX+0dIgvRWFuOAw4dmwrzeOBdFhGNZHqe69qhFD6i0a3WK
         qB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802694; x=1768407494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVuHe0wt1etXnyCGWeXSp+IZ3Qg2MMH2Kny/0EnRpgQ=;
        b=IP39JGnmb2LtIQQKo4BlDSUpIGY/+B9R+ry6h6yKyO8pk/CpGL93EXeKVtR9QFD5a2
         kaxe4l/kjiST1Y4W3ZVaWL6yp9clJ+ztkfx696pDf5Uyb4aWTLXkpeGb9gv14aozBGKg
         b3gIFMA5FFYUxRJ/NSTkx0KsQzUv1UD1PDv3HxAW1m3+UpN45ucvXvfskirU8FHL+Dvn
         zaOBGfc/oauASFvB5VVpUR3pzHM41sDpRW2YDwKOLvVQ7JfEcS6EHB2S85dXGWB05aRR
         cKHWKnwpr+PZxK1UIIAAC6AxpjdTNa1cq21gXInQTiibfP1yANp6ht7M0OZaBST+kb22
         8Tdw==
X-Forwarded-Encrypted: i=1; AJvYcCUPP1QTzwKG824wAImFrP0R7YXvzXlqb+Qkz0lhV21pldR5DBB4UtywHD2pS8rDOrgXRakNUAIMU+PcP1APlSaE@lists.infradead.org
X-Gm-Message-State: AOJu0YxDplJ+u7z7XmtFr4rXKn7fdvL1sgw7dtj9LnvQQZVMbVuIVv0H
	YmWCcAG4/yu2CeKW/sDytRfN5Ic3CCo0dknJ5nN4SrKUTkXVYblJdkW6yy+PiP+uceWO4h6pOLu
	B4viZfoyY1+S/pySleXhCuLxcSaN278Yjh+oNmvw294uBg6UhFQwGB07PBHlGpBTq4ZMMN8vXBy
	pnxg==
X-Gm-Gg: AY/fxX6qQnSAsUC16TTEpOD6TcC4M6EEXy4M2q/gSi4W/f/lCOkFD4GelCc0U9MVz9F
	K1NtCMt85bdN+6p+78f3Rv0Vw0SHKH0Xlgc5qKD/ASuxlVpoZzCiGC5+ToQwdvk4FCv5abgI7HZ
	JHBKZKTdiDHWKBnyBQGUXevHrMGYtb0EhYbV/PV3OoJyXPJcEXVPl1havduhR8tThpL7OKFeMW9
	AR8tTELQL35ow9W3RLrPxMWj7wN4HLLAsDL6QjFwk7KtONs0Xjhgi+YW8ow2cFixKz59eOEjbup
	v4f2pzr2Xtlca3gfGh1jpF+jWEjcvmFesnZDys6w3r10SCurAwfnEeoVzFXojkstCSow+ZR3Oha
	iJlZPMsQTr0wuSnL/P4Xo6HJMXYjMiAYYWHv675uULl5jdRI+EsZ7zALVPMTSownqYRCdeYH2RC
	6hgSLEeGiwHHshpgLaQmIL/ik=
X-Received: by 2002:a05:622a:4209:b0:4f4:e6b0:7120 with SMTP id d75a77b69052e-4ffb4b5da0emr34184301cf.82.1767802694052;
        Wed, 07 Jan 2026 08:18:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHY38emXXXkVnOMgdE65Id2wbfbRgInUDB1ehakjGirLO2ZFzXh0B1U67TMsqyhlMzUF0FBw==
X-Received: by 2002:a05:622a:4209:b0:4f4:e6b0:7120 with SMTP id d75a77b69052e-4ffb4b5da0emr34183661cf.82.1767802693489;
        Wed, 07 Jan 2026 08:18:13 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65ced9absm1402000e87.5.2026.01.07.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:18:12 -0800 (PST)
Date: Wed, 7 Jan 2026 18:18:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 10/11] clk: qcom: Add support for VideoCC driver for
 Kaanapali
Message-ID: <cfp2ukahbgay4fbm5bqq22mn2jumj5o577wskrfsjtftpznpa3@cksi2qp7igjm>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-10-8e10adc236a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-10-8e10adc236a8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OtJCCi/t c=1 sm=1 tr=0 ts=695e8747 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0FKzuNh7WTnq1YNKSakA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: snOf4E73HnCdCJdb6QIyHAdR9F_pxIHo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX7qaWR9jIJDJe
 paJE5B9ub2WD9DuhFBLikOB8TFc3lbyDVuS6bmiZsZhS2YZ/Z8HeeJYY7PfxAEpZNjZz3KNt83u
 a+Wn7i/WNGv29ikaofqPMYDgSo73AysOOnWj+076dmXTiZ3y1bwsIGurRzKzHPFZE4VxopKVTzV
 qYE2/M6gYpTTmQ+vKr7TPqZ2pTw4vG8peViPa5vaUZqpBQPiWR5+6tZ5KO3WBsenTlXxdHN5iix
 IepF30jISWLZjfIRc71Gtf1paZ90Em8xovipoFPEzvxYKgrqBanyYiP+xp3SO37dlcV3EGPEqk6
 JizCik70Tk43oSkz0CDGE5YBjuB52a2JkDW6RcHwI9wcqHleH9mPjrHBpcbm8F8a115UzF0svjm
 OKXJCJ2ACTY8uxnzuCbUrTHkPRDNkoV9+0GpquOmyHK59lY01ldsXLHOGC/D+CK5VsAo5q68jJ1
 54nZ+okQgrJIPfTPtWg==
X-Proofpoint-ORIG-GUID: snOf4E73HnCdCJdb6QIyHAdR9F_pxIHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_081815_641550_A2CBF45E 
X-CRM114-Status: GOOD (  16.68  )
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

On Wed, Jan 07, 2026 at 03:13:13PM +0530, Taniya Das wrote:
> Enable Kaanapali video clock driver for video SW to be able to control
> the clocks from the Video SW driver.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig             |   9 +
>  drivers/clk/qcom/Makefile            |   1 +
>  drivers/clk/qcom/videocc-kaanapali.c | 821 +++++++++++++++++++++++++++++++++++
>  3 files changed, 831 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

