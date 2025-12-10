Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C31FD2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 08:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaVrsxaWW/xE3ijm84e8O1hckueX7M+RVS9RTEowbKE=; b=P7IdjulSVaEKJKzXEtWsmwhYxg
	5Up5X1cMf51FHBuLyGcyjo4QQEzGFJy4YYN47rW+4RXOvVHodbY1JPpBorfpgiK9WVoJ/iyoMva39
	ydx6xue4yXx9R7Cil9D2z3ZPEHKNP9rsFSFXhLMc4pqRnVw2jw+l5xMZ05gcp/asKv6CLGh0nTHOv
	6tzIJdN7S86yEpLnVJg4v2niDjn8wyylZAxHSxuvPUkj8Fqwye1hHrb0HsimqV5BAW8ZsdHhBB/td
	66sArhEj6JSJTAWmcC9MLb9P4bt197Vsw2slVlDWUZPiAKcVUY9U3E9znUbhV5qIgJ/2WF8HTLEhW
	9k2Pi8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFay-0000000FFMc-3RCX;
	Wed, 10 Dec 2025 08:30:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTFau-0000000FFMG-0XFA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 08:30:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6DifW1598243
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 08:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BaVrsxaWW/xE3ijm84e8O1hc
	kueX7M+RVS9RTEowbKE=; b=OEsdP+jEmVLOtgYQJdWiV0cdwhOLghB6WILlPtow
	iz9n9w35272+wXQpuGJ3cTvvnf+04iCTYno6/qbGTynUKrc5AAAOcWbDe8w08Qmb
	Xak+veMGTdahnIprG7Nsa2E7paaOw/SzkbTrykCbWQGBImrXFXiGHbtlBylT4aNK
	AbKg7auT7DV0tEigcaABid1or0GK82GYwcn+ZJwW5zkbeJoU1hox8r2P6tQSiK3u
	JMju5s8IWO7fWZIPBO2ON0lzwEh1q/8FfSyWWAIg9acjTrBS+vady3NjVlKcrB9U
	MG1MN/rsxDKgymkJwQHJbPgRQwZlw8VukXHUm9USYcTdmg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp0mvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 08:30:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09211413so154751871cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 00:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765355442; x=1765960242; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BaVrsxaWW/xE3ijm84e8O1hckueX7M+RVS9RTEowbKE=;
        b=TvWIOFIfzHmTv2AE1V3pQfra10tzTXdfrU52H0wv6SOdRFHAsE+B1VxAH1h7bdH6hU
         jSiSEe2vbM06Odsw/hzdW7GnO9F7RKUPmsWvRca2ZL4M+d2U/vVmcXeuraar7MkrjsTE
         Ekc9Q6yGucVUJ2OWJ8iAm0w2hupFLBfyiJU1lp/hGEGq9n0kQXeGo12f6lfCOxJ8RTve
         ebtYLL3iHxXHftSvnFWH5hlE26+cHoLBJoJr/FTTulzK/IgPFbJ5wedWfql5YVMbYaYU
         o8h8ush4+fuqc0UOErDWJNLJAnSnOSee9A6/ERjZPsBOaKepAfkRdySaJkMKXa/d0eRt
         nFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355443; x=1765960243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaVrsxaWW/xE3ijm84e8O1hckueX7M+RVS9RTEowbKE=;
        b=gYzXNL/jE/hfwi6NaZU7faQ9WOtrt1SnwZ1I6rZfJEsGLpdE/qw0XymOnMh7E92+HR
         /DP1ycwW4p27szgxsvhlcdSVccfF0bueuVw3U712OjEnSIlHPmNrvd/ZZ0/DI5BRtaz6
         KT+85Y2E/4THpCiqTBltsi+EVxxTH2/FUxQASfuV7eR7gTMO6aAsqB+9Zi4BtrFcJWpP
         P6A6/RVlnYtiuPNrtvexR1KRDLF+sUJEtjwRTLWnyHTTpltMFEXKhaB+H3iYzLJhegRK
         7Y2JvT3MPL6tIAFCORhhB52RRJ2yvDUTRvb+yorunyWeNbyqQuUh1mmsOv2GFYEdJL45
         Ya8g==
X-Forwarded-Encrypted: i=1; AJvYcCVFDu/LqUvjtnocGTPAQjt5PsJ12eVTfagV8PxH5bqO2XdVy2VP0H4vtZBjJbKeKi8aJ9GqAtlCnDaVJfsGLyue@lists.infradead.org
X-Gm-Message-State: AOJu0Yx971gOLYWOV6FdyPNr8xW0C+CR+wDc0hZWMv+R0zxElYJRC2HA
	Q8T/tc2tcJLUTW9zW7xwaorx9QoYWUQxRq4lSAbrKeuFcH3nD6qZDQp+TZ9Xfb5yuwCmYMTvKef
	q+qEjSvVH3EICFMuLmeeGeye4660/AqzlH9zmoU0nk4JdnfHPfpF9m7PDY5exNFRGqDVUYgOkUI
	0lUA==
X-Gm-Gg: ASbGncvhirUR7+rkEpKuVKjtzLyCgZMFiVcA0+zk1zdwldfW3iMHqVoy3Qr+1MM4yfc
	DwuI5K6gjGTO7GKJmap74SU/E3XwtefNC39rjUu79u4k46zWo6j0/wyq74dHmTaMlcMkgBYqRsX
	YkgzH9CkQTvd/F21eDdIhZ74MCUEg31UZMtsEgOAAy+a5ZjzQUOpGaIKym/RGVG1JtacZririal
	RDTcSVd2Nc2/bT9OhljSqOJY3xVe1eUnU4RhKftaYTOhcllZ1KK0QU0AaTBWNtXeSBaguS2QI0v
	1Q5wcYJ6vOAY3WEzQRUCGdzK4MENL8IjWXiXuH31dQbLYdJPaMnR+UGdqEchkzMm5cO7DNt7i1j
	j3eqEtBrsWm4cgIpAa1YrAVVYwhkD7SXwuKBzpLZop1odL6FDRXRBfBkKhgTKyChJT57/FtzCZh
	CdRMiOzq5leY2bzZh3jyWRRLw=
X-Received: by 2002:a05:622a:a30a:b0:4ee:1806:97f7 with SMTP id d75a77b69052e-4f1b1a7db1dmr15168561cf.47.1765355442526;
        Wed, 10 Dec 2025 00:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtqikgbD78OR/TCirFrEnhCsQjS6VLCnfWR6a+KQxIbEmUhDluyiIUFEvvL7QnBCmP9kh7zQ==
X-Received: by 2002:a05:622a:a30a:b0:4ee:1806:97f7 with SMTP id d75a77b69052e-4f1b1a7db1dmr15168321cf.47.1765355441988;
        Wed, 10 Dec 2025 00:30:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2acsm6186915e87.61.2025.12.10.00.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:30:41 -0800 (PST)
Date: Wed, 10 Dec 2025 10:30:39 +0200
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
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display
 device nodes
Message-ID: <cndguco6ijb666ugbqpbffyhbbgs2nyno3qujuevz5dnpegir3@ygkh7vctnzuj>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MyBTYWx0ZWRfXyhXRFY608hwG
 6DHTAbAicF8M5QeBFqSLP/Uyj1bqrG7TxdARydxaK2RAstK+V566FJOGm+WF55bdcyT4x9cC1vw
 XtsvWWZRaoQKORy+Zt6seRi0Qqvv3o1eien3A1mn496fF1cgNa5Y8qQ7fMgUnys6yi+HKr0qEkf
 rJq8Va472iksTzXG9tFQuBKfeOIfd4VPcrY0lwgVUivzVJduT6GT6cjvwz/q40EP/x73lwgwZ94
 rlFC4lFQhYGBd786oV4Ww0x/rQe+rR65t/T3UhKuYTxhOlbYLLOiLO8O+4SXKoyhciinLD1seg+
 R1JUsTM9+CPra1lDFAPCzfaYMBbfJKJy9QA4jx2Hfizkv2ODrogdMzTnzX6maebCLcZA0bBZkXP
 Ua8E5BiCm5PXilfRQjMWu9yi6JaviA==
X-Proofpoint-ORIG-GUID: boWKEwPTrvqrJ0JRDWBDFsBHoMD0sSxc
X-Proofpoint-GUID: boWKEwPTrvqrJ0JRDWBDFsBHoMD0sSxc
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=69392fb3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=Dm6QUQfMve3NhQMXUkAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_003045_097920_6B185C91 
X-CRM114-Status: GOOD (  15.18  )
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

On Tue, Nov 25, 2025 at 04:26:21PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 338 ++++++++++++++++++++++++++-
>  1 file changed, 336 insertions(+), 2 deletions(-)
> 
> +
> +				mdss1_dp_opp_table: opp-table {

Why do we need two instances of the table?

> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +
> +				mdss1_dp1_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-160000000 {
> +						opp-hz = /bits/ 64 <160000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};
> +		};
> +

-- 
With best wishes
Dmitry

