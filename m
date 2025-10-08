Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAB1CCA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFb02Y25ke3gxp+QmVEaLQ1AZPsdmeNsL3BSvt29jbs=; b=le0gWrJa582wUsydcN9x1xjxEK
	F6t91EPFRNxBtailZQt03m0eCWotWN7y0OHuCtK7iXVFoDiGOU9mNIwTurKqNG7utQ2e70cwVq8Si
	8upkdatT2i/i3+Kcaz1MKjuylk5vpWbjv/xdNTZEv9Znd9KLPdhVjGMWpGzFOivm0sQNqckjdzrHR
	ollorcpXTSBNvI3eIjEBGydhMZlfweWbPy7gN1hqsoPZeCEKtVhhnCgpe+EV/ZfpVSJPy+MeM3bdF
	ooMhoFak9vkFjI57/praIHr2ySeDcGzIy7SdiQ8rmNoyZL6W0HvU157ia249tWyjyR4lodFpUduwX
	Jrw8qBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Tjx-00000003srN-3Oyu;
	Wed, 08 Oct 2025 12:57:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Tjv-00000003sqF-17Us
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 12:57:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890OaH011740
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 12:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zFb02Y25ke3gxp+QmVEaLQ1A
	ZPsdmeNsL3BSvt29jbs=; b=R9Pi6ndIzcQw/g6FVr/PqDlpIUnX8IvNePJVy5tV
	hcP69WQ80nsUC6IC6+pw1spvPz0gMSNkPQp1hxu0B8mFp7XQLvVu3k3IDFIwTwSs
	tHJv1vYiLieqDvd9EzyRlNkWdy8NZaFG5Nk+LHWc2PX7N/Vz4EytjqdtJUx7QhK7
	KVhePjy0kqS3I4S7ZuVdSs8LQJiMZfkBuynwpKBuQV9fldTR3E/ee/5teEZ130Zh
	tKgk9fkl+poGeF8HeY/CjgldsNdwoDV2zVf6CGdgWl2z/htqOM4Fw2Y54VGghsqD
	Zl2I8m2olY0Kzu7dayEe8SBd/5U88PPFYAof27k9Z7f3PQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpwdnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 12:57:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-78e30eaca8eso237195276d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 05:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928273; x=1760533073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFb02Y25ke3gxp+QmVEaLQ1AZPsdmeNsL3BSvt29jbs=;
        b=Aa8kzyRWYodIP+OkMfR1wWL6I0N4RBLjoxxwdHJPzT/GCbUI9NBPDAqkdF36zMhLC4
         YJu2x82rEyxlZ12ihWSRpDLkfj0JzwPVliNhBL65KfFeihFmsPK4G72PT23Re0MRdkzy
         dWcmtO6gXV8XgL5MkOxXnClXmVdIyXg7ATvjT06vFWuL0LAF64NpQAcmqu5oleMR0fJ8
         c7WyoASa6xxa3yvztSctbMHFoigwYo829BxFBGEwzUO/1IRB4C+iS9REEnyHxPWE/Qb6
         SIBGa3b3ZGOiPNWjD4A7xFKG80nSGJesfjNvPULhc8h34osPjYQ90kGA6swnDxHSiHJ4
         gG6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/lIT4TKOfiHjFQbiaXraonIVPSZC7J3e+0liUj40fSsWRsOkbq+j/+PhtdpyPwJwENZrEaSkBssnTqccUMH1r@lists.infradead.org
X-Gm-Message-State: AOJu0YzRg7/Bj+DBwDwNAdwBYHOEQk4OjC469ZLCkPiNYM2Y82bTTyeP
	kgIMDBVZnWo8JdKNKnDsyAs/VHmD6uSpTDlOdA4comoaQUsy5nPZlmSX50P+lpEZHwZvMSC+en/
	ibLMNQoMtyn52voaVWON9WHlxqO5HsaasdfwYmhL4dYgwdE1JXOadE29rFH1fgHiqMJV6PcLJb3
	1EzQ==
X-Gm-Gg: ASbGncsm029QJ2/2Ky+vuVH9u+ZagYpDqPgP00BaZYNubBuUY3Rj6WPIix5SHcCvyC9
	v+EDJUyjM/hL0zVhPP4wGRlSPQlUnw8Pl+1NzqM82YF+VWrzqBRh6ZL0f6dhrnnNO/dRYTdcunV
	lEjQ8ptYVY5DUeStKjFAjXbWxhdCQ42+911jMWXzmz2CWXOibx2oEMuGHHCQ6tdTblTdPTGsDW6
	wwDuBvuepmYqmwLwyP7EFF6CDZCQroF7Fn/DdLMAyAPcwlfNh9SV2kayCb5G3T0+l/TNY4WwcTQ
	vfxqKmdF/Y9crM/Ld8YU2rBCEkidkCM0AdRuvR+C0/hqYrmtzcOffMGuTrcR9gCUrBBL7F6CNCz
	FNVFqER18W8RzNg2C6GOZZ24ZNU6CCQQdB5Z9XTzgOV4Pktw5Yglk2V3xSA==
X-Received: by 2002:a05:622a:4c1b:b0:4b5:e7c3:1dee with SMTP id d75a77b69052e-4e6ead54342mr41671691cf.47.1759928273194;
        Wed, 08 Oct 2025 05:57:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV/5Su9ZdMKI4CWmNqq4+T6K2gUd3n5lsYdeglyyNSBPSQUQCzIjG40ACDqXMHlfDXvWtfUA==
X-Received: by 2002:a05:622a:4c1b:b0:4b5:e7c3:1dee with SMTP id d75a77b69052e-4e6ead54342mr41671141cf.47.1759928272409;
        Wed, 08 Oct 2025 05:57:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d263sm7204971e87.74.2025.10.08.05.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:57:51 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:57:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
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
Message-ID: <5ba7245mhdfa7ni6g4coaktg7fadkznft3s4ogulywwjujbj6i@gddfftavxvwd>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
 <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
 <b14ca601-56d8-4ecc-8813-b9b642646a0c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b14ca601-56d8-4ecc-8813-b9b642646a0c@oss.qualcomm.com>
X-Proofpoint-GUID: TD32ztsLWV9qCCmVrwYNDrk-BZAmVkxE
X-Proofpoint-ORIG-GUID: TD32ztsLWV9qCCmVrwYNDrk-BZAmVkxE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfXw24LTumvm7UC
 wgn2x6U2e0u6RNRTPq1XFxORkHwiemBNuMiYZmIzCgOyVGxUu545aVkXECPRNspdD3MLq2NocWa
 AIExUI+ganuE2qgX8t0MNxwiFr1wU4Erh5hkobhpRe59ca3Ki69MorQbSN61Fhefdtigjk1r1Za
 vvbD5rfmp7xhzbSbw0H+HScFilDEN3H6vxU3gUN8xx8JqjHJl0BijqchTK6M8vvllBggSco0KaZ
 MSgUuHRRps03MWjSf9V7tQDH2tTGoDynhONTTIYtDZyy57OsRWjjH4DBi/7W8WZOWR1or8P8mJ9
 /zzosppgvQ5DKTfgwgnC2p6AencA89IMcqV7pxBiK/Axl8QKAJHuBOP/vjcIxbbOXhmQQpLGWeG
 ZwUCtSOmilIcfpSpXzImFVgGzyk03w==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e65fd2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=UNeRqKPLT5YhSiDNm34A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_055755_310300_6740A86B 
X-CRM114-Status: GOOD (  21.09  )
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

On Wed, Oct 08, 2025 at 02:50:45PM +0200, Konrad Dybcio wrote:
> On 10/8/25 2:49 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 08, 2025 at 02:40:35PM +0200, Konrad Dybcio wrote:
> >> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> >>> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> >>> with their corresponding PHYs.
> >>>
> >>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +			mdss1_dp0: displayport-controller@22154000 {
> >>> +				compatible = "qcom,sa8775p-dp";
> >>> +
> >>> +				reg = <0x0 0x22154000 0x0 0x104>,
> >>
> >> sz = 0x200
> > 
> > Hmm, why? I think the memory map specifies these sizes.
> 
> Yeah and I went in line with the allocated region size (not last register)

And this goes against the practice used for DP controllers on other
platforms (or other DP controllers on this platform FWIW).

> 
> [...]
> 
> >>>  		dispcc1: clock-controller@22100000 {
> >>> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
> >>>  				 <&rpmhcc RPMH_CXO_CLK>,
> >>>  				 <&rpmhcc RPMH_CXO_CLK_A>,
> >>>  				 <&sleep_clk>,
> >>> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> >>> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
> >>>  				 <0>, <0>, <0>, <0>,
> >>
> >> You need to remove the same amount of zeroes that you added
> > 
> > Nice catch. Which means that somebody was sending untested patches.
> 
> It would work.. until someone tried to add DSI to the second row of zeroes
> instead of the first one

I meant tested against bindings.

-- 
With best wishes
Dmitry

