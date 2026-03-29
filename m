Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111E2F3D5FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCjfDWTPSu7BA8044iKcVbUEHoU8+6VbM9W4QsjWKY8=; b=XKCP1r4jHWH7BRDVrwQWuLzS+B
	Cjr7mWLqnJAg5C6jsLsj+8T3oq1+6/oioAuXy4b05nlCD2WWQncS7jlb0v4kQ/0kN3yrDT+cga/zn
	r2Pbxs8Ana+ccUu9htukeTyrsZlf6BV2VTGYfwNQrbIwsy4wSv/7amPQeDi5Ub8EM5XXhLERpICB0
	OMwQix0YC4aSrwHM/HaGtagIH8XNR2OlxF2HZ6/F1LhOHOtO6g4ndtshXRbTCDg7bbNSIyuKvXSjr
	FTe1D8cGPjKEXulxyjT0tBR0LB5UcLkxwf2HM97LYiwSogOE6nm0sywEllYul8JwMApbkpQVwVtOw
	yg54ClVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6o0v-00000009rCA-2XYC;
	Sun, 29 Mar 2026 11:09:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6o0t-00000009rBp-2MbO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 11:09:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAiA7j3932275
	for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 11:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SCjfDWTPSu7BA8044iKcVbUE
	HoU8+6VbM9W4QsjWKY8=; b=WfcPVv9yts14Ft+20iRLnT4rpEyma2BbcYrwjDbJ
	L3Dqe+FHWlp5QQM8Kd6Faux98F3MAE/qNe52c622fFaNbunkmHaFRp8aBQM3O2lJ
	vG5foEvnRRUsGYtcxOvhB8kQO8AmdpOcKiAtNcfFBQgsgwt2RFkVj2qS5XRx8j1Q
	636MNsMXeQRK8A6pluHs93ZHu0NF0F4HydlxqOjI0kqnuTNzHCyYsHb5QGLUppI0
	Va9+9TGFx5Opj0nnc32dKCwBmkotNypaXA5B4N0huebNF9KXNRVyeV/Cz6/twoXg
	bNEDT/Iclu37Q/cBNvdJKI3NvPRaQxOyuJmlkno+2V729Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pdaxr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 11:09:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50911c94db1so88126111cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774782541; x=1775387341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SCjfDWTPSu7BA8044iKcVbUEHoU8+6VbM9W4QsjWKY8=;
        b=EhSj7sGiz0wjdfi1wHiXg0YIsWdkXh5vzIpMFG7tfUHcyee5yi3/81kT2a10vZdQEQ
         mTH6FsRMwFHrSupVKji0ZstBr5WYKPaFTQc7uLCSWfT1ANLKOVYYAsTEPu3uRa6LfrGa
         IgIDZlxkO0TBvrnA/abS10hAPe4r8B3iUT8j1aJ+MQw6iKp2hkq4eyBEItllm5EW0KqQ
         nq6miCpBef4eAlVGCssXRigIXrKM8q/YRHCGUhXaky8LvScJa1ed+ZaJspxr4XpNZoQ6
         fYYkscvRaxNS5Ht33df47ou+SGT837FbbETgksXEavjgnYdYYFAdhOEoGS7T+Vfdm48l
         QBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774782541; x=1775387341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCjfDWTPSu7BA8044iKcVbUEHoU8+6VbM9W4QsjWKY8=;
        b=S60jSNKL61VEZBT1aaVdJ78Nd8DWcSI+GEOB3UN2st0zTXGp0PHPoYXaOnKg2hPvBH
         1Og1HlWPf9R0tRiEp/5pkDDUECvJomhg/nJ5JQcianzgUk5ZACotIrS0+LWaq1wi/MEO
         zc4lggfylN4IQ9zPODeookmZLNdd2OVuSZjtP5dDazmdMMR821jDqbROT+pusT5isqPn
         PathGO1hMPKNOmNCF4uZqKmmPH8Ub0O4eAjJBB7X1JZ1HgmremZjVNl4ASdZIAnn0/S/
         hXe5dhrDXXbqcd+cQy2z7l98EOC4gSdYOXSwNI6UAlHiUixHEDOX0ODRWsGkeYuEfNHY
         CtJg==
X-Forwarded-Encrypted: i=1; AJvYcCVN2/Oai8gvBwmzUG9q7kcxOUNfVFC1NS0+d7UB0assXs7uvib8F690qWSLJYqL8gxmClOh3id2UEBV8EqLALOQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7ZXyrKweiliq6ZRv7Occt6f/HfW9eoEKUB55yv+JeRldWAVC9
	2gxtW0OdHN3WEXLv+MDff1jByITQPtkWJR0ybfB5QBPL/qo7QbZQzG20HBUAFRfB1wxOA5MZ5Nu
	vb+YYPJf6+f1+Rwj5WcfwerZQrJbVeTll+AEpIydn/nMjA+GFUflXw0t2NsV3Q1XpqIOMJ91evb
	8C0nwbW7W4xQ==
X-Gm-Gg: ATEYQzwwW+A42xQRQyMz4fGzYCm8hChwg9fG/oheRIrOxzDkXrHM4JHtU+hN8wlAi3u
	mTH96zr9L2kP60J7slCXdD2QKOscbOiW12bj0WScnFtm2Jt6jxDnJgCyMeYhn79RPT5IVdfZRSt
	MyDm7stCrftip/tmzIpOBYjOTF8WpgS03rgzXLcAI8USc9up2b8CQbqijyToU+tlQ+jCW/F0wjb
	NTQDhGwLPxq6OSrQxsKlQyTWxylMYwJTNEyZ7bM9sBFrtpXGLUujQuOBnPuy6uL04DmQRZh5ucc
	dFlvafxVLng24D504FHgZcq3FRn/6fP3dGZjrhM18WxtIr4O8+fPVgFTMG7S6zY7DgiWF62ak8f
	YKinfL6ulQIE1wUrW/6Bn8kxKblZDrWUQn/gUQAjP1fTRfH3muMHQVh9kS2W7+BV89W7YzlfqR2
	H2+iuOHpjPad/imoZeChcHUkrkGadTJ/fISvQ=
X-Received: by 2002:a05:622a:64b:b0:50b:4c03:7b88 with SMTP id d75a77b69052e-50ba39c1effmr120235501cf.67.1774782541467;
        Sun, 29 Mar 2026 04:09:01 -0700 (PDT)
X-Received: by 2002:a05:622a:64b:b0:50b:4c03:7b88 with SMTP id d75a77b69052e-50ba39c1effmr120235211cf.67.1774782540999;
        Sun, 29 Mar 2026 04:09:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403cc1sm987221e87.28.2026.03.29.04.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 04:08:59 -0700 (PDT)
Date: Sun, 29 Mar 2026 14:08:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: enable UART6 for robot
 expansion board
Message-ID: <smbe2ltwykqvlzhryclcm5p7wdhjb72tzuqoramjynrsz35tmb@q6l2osdzflvn>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327083101.1343613-3-canfeng.zhuang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6TYhoRzfBli873YbZKXTFzH0W8_v2MHh
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69c9084e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=S3gobNufr5BrtecctxwA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6TYhoRzfBli873YbZKXTFzH0W8_v2MHh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4NiBTYWx0ZWRfX467cTz5N9WdQ
 5fmSL3tSsGT8imw9abFTDTShOn0jRPLPaAaZ0lUkdcLyz4SvZ9y+y4g+1rUO/1NUWZoq4/9zvw3
 f8gnw6QpCWs1emJ1Cc3DBg3McsPyIcLIM8QjcBk8DnhrbfarI2kuq7I15+eU8Tz6ipbBUW0Gmwl
 7kaxz2dCOrDAltLqA875yvNsQC7nkc8hktshz/mFUuSCqAVOBOjLkLzZzgVWLXTP8D3BRZ7ed5o
 biKpn0crEf7llE37hBFveQKodzXzABbKMhanRULRJngTNg5GOKH/P03c2V5D2eDAT4E3nrQLGaJ
 BqyiJQpg1hKcP/xkohz4vynAq8wrFLZfoYSQrNUZFyeow3kMKWNtprfidSCtd3B0lC+qU739bz3
 eIW0QKCKYqbus5TpBiTlyRbaWNaOxIM5wR+R2I6qTYgR5KanloZpiI+O3InOj1fIUTQZa0KTOXR
 n/mJhLsZLU6j0KrNByQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_03,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_040903_640945_E25059F9 
X-CRM114-Status: GOOD (  18.23  )
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

On Fri, Mar 27, 2026 at 04:31:01PM +0800, Canfeng Zhuang wrote:
> The monaco-evk mezzanine connector supports a robot expansion board that
> requires UART6, which is currently disabled. This prevents the expansion
> board from exchanging data and control commands.
> 
> Enable UART6 and assign the serial2 alias to provide stable device
> enumeration for the expansion board.
> 
> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> index 565418b86b2a..0b26861eac02 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
> @@ -21,6 +21,7 @@ aliases {
>  		ethernet0 = &ethernet0;
>  		i2c1 = &i2c1;
>  		serial0 = &uart7;
> +		serial2 = &uart6;

What happened to serial1?

>  	};
>  
>  	chosen {

-- 
With best wishes
Dmitry

