Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339A1E8385B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 07:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2P+ECG2vxZRApWW3EQOfpyiFthEBPrS5O1JGmhWTvVU=; b=3tEp1XhMZT6rd9R19fIkdcbPzy
	K3yvGftCVUZpmNZ/sGBqw2Y456STZlk4OfiobBCnj38ieJ4LmsvjOYpVpBofM9H2xEmjRNuMV//h2
	zI2ah3+4f+B92RzndCxG13mWkGxx/DX7LVEBvPe14cblsry8ma3iqy+eDDmC9LMPsArLvLWDc6+qk
	/K+dUG8QZVFs3LShel7+GDzQAj8xq/WALHgL5sPQsobyLROwv2qoaEJPafJ0WsWXSsP2vd0s3c6fz
	ReU0TG43kdEG3MCXF08781aGpRWusSPoNnGFeo4uCulwTnYtTrTnjTsjsLuSM2FCIQVa33jpJjGHd
	Vk1ZvdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFiz-00000007mOz-07cR;
	Tue, 17 Feb 2026 07:42:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsFiu-00000007mOA-0OqH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 07:42:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNYm6r2296956
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 07:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2P+ECG2vxZRApWW3EQOfpyiF
	thEBPrS5O1JGmhWTvVU=; b=hz82HG9CNLKnvW1q+EWyiLA/LZredeZN2J90x/qh
	dy4px04E/HNbPuq36qX1J7rOKW8e7CHt3IsdF9WYD2/6tw0gXMYPRuSvqRJaTadr
	pvdtO0SN8agIJ8p2RA4N0FVo6CI5o1vs3vxakzP2cXrKzFeEIuVNwNKu6lBOvTTQ
	QAZQ3bakDSXz5RqnBHE0VPE1Je6DyXOeYZvDMaMI+IH7gm5H0nEBAJoUU+OxVwDJ
	Ygo6j3/Idpivkt0CZixyqRQ03sAosTt/HjvWV7l6CU0wLBzczd8Xu3Mk/B17KRP2
	0EEb4XFPojmqhBUXmfph7uZUglaRI1S9s39BJ9GBISbO3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ajsd6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 07:42:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ab7f67fso3935181685a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 23:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314137; x=1771918937; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2P+ECG2vxZRApWW3EQOfpyiFthEBPrS5O1JGmhWTvVU=;
        b=DgcQ9WztZL117Me8m6ZD+ImHlC8nGaKrSZfuA0L2a4V3tGklHZL/xeukLj7CoaDSyh
         pVGjDbHEL53wpy6aG7q4d9gKHoP2Yupo5rTHgF9m/GfhSKDrjluuOM/qPSxfKH/WETAQ
         CB4kgTSrCF8uAaw3uv6ROaGxttABzhoZmK2CVnpwQ3nbwwSle/Q8POL+QU9n8t97lqvm
         XOdmFA4eX8nj9TFZ0aivai/qvttYEDOTTQZI9M8B450Z/FtFBz0mcLBz5OhnXcs9h6fX
         TSfVTyuhWV8t5yKHmKBJWLHmTBwTWUYjpOKZhEDILy89evO5XWjDd6pGMILFEeEbK2Qt
         /z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314137; x=1771918937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2P+ECG2vxZRApWW3EQOfpyiFthEBPrS5O1JGmhWTvVU=;
        b=TFu3Ivv3SbSyuluJS+Bahg+MyJF15A0zbZ6j1pb/YVOxu2ripweh36hFfAD+T0BSvH
         bLoKAQxTyfojMa/n+kYw6p081yCtUGN9Pnv2Bk/dgT9K9e3EA9EjOn3zCH8zsfpeJfSY
         Si2TvJbXv6o8bdm4LKcgqoAMAwDOhXLhhTECB9F6BLm3oegpdXFWNLIkP4ztcT99tLwf
         1pZes8iu5fPD3b3jZ+44TeGhLirvdXzIa5BTsFrEH8cwqb3F11/vMis77frQyWe7ON5N
         XZWRoTkwuhlJetFX+th2wdk2BXKOXJX31NDzC/LyjVvc8hWllixlnLciw2x77e0JH5br
         PYIg==
X-Forwarded-Encrypted: i=1; AJvYcCUL/0KiWeL7BDDZNFMfPImVfa4EoJh0uMsNx3V1uEMdU3bDwM3mIYHI7AScz4e8fTbkh6pI3H5BdMTMAroIbx/7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnx+EL5MCq3zVLNjSuOcy4MswZcmQ/l6kA7iFN4IGSllcInrqP
	XBYLOcIBBgut2d7iWgChH+7DvBPDqXy5wyHO7K/VCqmCCs6yNZoxoAjpFtFj9ojDf2HaTDVE+/u
	nhJ5WAVageR2KRazJTUBN5mgbsTR/gYH0xHzzv5mNY0GcnaCj9XPP+TquVdy8V1ZtQqqWd6oJQj
	scVQ==
X-Gm-Gg: AZuq6aJsTD/w8wAjY6Lre2kjD3GgFxgxDx6a28/8rV9JEqqOwB03EOI5Cgm9pCEFFpb
	LTQjdxvTkYgBdLbqyyI+jERzsI1lisiptLC4LPbpPJwOESG/iiRWxEIwi9CJxoGGJUhFPdneuQi
	u+4rsWofZ99sKo9s420Hx7ifO8wCr3Rz6EQ5VxgZaw1tRlneuF3Irykx5IGf2cfVwEIJ9RYYjOs
	3fjGonDLJeS0Pg+KyLDkXuQQwTA64jUuHd4uuDHc2MOo59Dxz1o2df50lBJFlQkB0NF8VFfdwgE
	0qu2o6uWr09/9OFmTzogHB7pP8OvdqzuSBiAtn4ekWIE/Nnu3gDe/vA+zh61E16YFImQv+2UFBi
	G+iBnWQpsn/ajMw4mXnRjxzN5okejQ2BU+L9/Y/00hgp20o0c1e5EfzqtIerypLL1t5h7FkYYCt
	5piEIJ7Je5ijvo+BHJJdERe7HHUzHmWKdkDvc=
X-Received: by 2002:a05:620a:454c:b0:8ca:4438:b8ef with SMTP id af79cd13be357-8cb4c025c1bmr1178895185a.69.1771314137248;
        Mon, 16 Feb 2026 23:42:17 -0800 (PST)
X-Received: by 2002:a05:620a:454c:b0:8ca:4438:b8ef with SMTP id af79cd13be357-8cb4c025c1bmr1178891485a.69.1771314136799;
        Mon, 16 Feb 2026 23:42:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4fcfsm3692473e87.46.2026.02.16.23.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:42:16 -0800 (PST)
Date: Tue, 17 Feb 2026 09:42:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: lemans: add mdss1 display
 device nodes
Message-ID: <konkomahmiuuqn757wjpsxt722lcbzougoqyxhzaskqquuzbfi@unets5hlsw7k>
References: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
 <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MyBTYWx0ZWRfX7tR1dVdtpR9I
 yzhSkSSL9+dtVnp6rK1g2lTFsRr8IzfywzLwMh0GoDswm3buVHLdw228hzOVvsHCXW4qXCX0WS+
 /BktxnYpbeBuQ55VBpnvR7MMwodhWlUt1qO0thtcGEpT77Ed3alKb8HfI3VBBvg/HM5TB+7TkcL
 pO+U2ByjA9o15/0NfkHaefgtAh226sK34wKrmIqKpOf0ux+M9HzM6ekOTly7FRAlXTGemM8NWdQ
 HPNKcJMuavJKjw4R0A486+Dv9qom5hJOiBINoJufyAbCe1dFw6YRXeAJoMQ9PU+/+iVYzdgu2dU
 AWkZG1HzS3N8uujA1YT6DnBMsWJKzMQuujXxudp8lC09nN2TYuS0oyyP1zksKrogssChV3lOxjj
 L0RM6QEVXx86fNyF56+W7lE8VD+0Gq3YjiK5d6q9CTYtYULgYqvnUNclRHFhZIlSD7AOJPgxti1
 MgM/fAtdRxFy9Ne5+8g==
X-Proofpoint-ORIG-GUID: 3bJmUotvYALZ620aRQhuhZq7Oqh69z2u
X-Authority-Analysis: v=2.4 cv=BryQAIX5 c=1 sm=1 tr=0 ts=69941bda cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=SI5dRhP91uxaG1B2flAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3bJmUotvYALZ620aRQhuhZq7Oqh69z2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_234220_156356_E49871F4 
X-CRM114-Status: GOOD (  18.72  )
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

On Tue, Feb 17, 2026 at 12:44:19PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> 
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 315 ++++++++++++++++++++++++++-
>  1 file changed, 313 insertions(+), 2 deletions(-)
> 

> +
> +				mdss1_mdp_opp_table: opp-table {

The OPP table is the same as the one used by MDSS0. Please move the OPP
table one layer up and use it for both nodes.

> +					compatible = "operating-points-v2";
> +
> +					opp-375000000 {
> +						opp-hz = /bits/ 64 <375000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
> +
> +					opp-500000000 {
> +						opp-hz = /bits/ 64 <500000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +
> +					opp-575000000 {
> +						opp-hz = /bits/ 64 <575000000>;
> +						required-opps = <&rpmhpd_opp_turbo>;
> +					};
> +
> +					opp-650000000 {
> +						opp-hz = /bits/ 64 <650000000>;
> +						required-opps = <&rpmhpd_opp_turbo_l1>;
> +					};
> +				};
> +			};
> +

> +				mdss1_dp_opp_table: opp-table {

The same comment, use common OPP table.

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

> @@ -7055,13 +7366,13 @@ dispcc1: clock-controller@22100000 {
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK_A>,
>  				 <&sleep_clk>,
> -				 <0>, <0>, <0>, <0>,
> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
>  				 <0>, <0>, <0>, <0>;
>  			power-domains = <&rpmhpd SA8775P_MMCX>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> -			status = "disabled";

This needs to be explained in the commit messages.

>  		};
>  
>  		ethernet1: ethernet@23000000 {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

