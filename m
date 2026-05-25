Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11219CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1c/8HKj+BHzZE5YaarXghzDZQ9RCYcyLQSuiliCSSg8=; b=PU8hNGn6YJm0RFyp2nlRGd6BmM
	3+vY5wL7NAWbCKDUbRq9kv8f43aiBOCmM2pPSewDY3pQB4LYNfv7yJjqENGySC+O9XRACZ8lTuHnI
	sNFApadpzcJbYUMaVD6YCeP3O27BPlYPXWzTTBJEUynEvAccdqnE/Hu4OfyzLF51etI67TVhc0rIG
	SvfL6SMA/vwJBSXHO0qMr/PSff9MjlQC8PL0I3Iu3Cw0ZvOnzZu+RQdtP+iS5xSWACv0F8xWhpHkr
	x9ictZCABy2afOS/ld32DDLkMY0bqTMfl2jx8llmX+a3ok7EAGGRNZpxA+TbqV4yXm8sxNqhvZwH5
	ssIyhvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTFv-0000000H3RN-3VnD;
	Mon, 25 May 2026 11:13:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRTFp-0000000H3MH-3Ylc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 11:13:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P81hOi1707573
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1c/8HKj+BHzZE5YaarXghzDZ
	Q9RCYcyLQSuiliCSSg8=; b=i5Gfb5//OFq2kUm54IF3leCGsAoRElFaOmqzTqHE
	4LdtnZmd/ImQSr30gS/SNbn+Dp/cUywi/+Mf7K1rMAcXzU1A7HLlx5cIpHhLn9pC
	JxGVl5a5sMslXTuiuyjFswNF1MZkMPGekUGZ+1QV+e1CtTprcBICJyMDHB29wlFV
	ZJUyLUt6oS1tVc6U5N7svrc/Aly3z8dgck8ZM7OR4t98HW9rAWStQsJrBGby+qog
	XimCGYGLkeFSXEg/Tk5FoqKe2If2mthXyPGkHsDv2DULtWBp1YThMgS3n3DijFHU
	Uyrhsq6iuadSl0OqK4daKp4OPCxaFv2BvA/dRaq7Er6cFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb3txpdhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:13:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516ceea1984so77573181cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 04:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779707632; x=1780312432; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1c/8HKj+BHzZE5YaarXghzDZQ9RCYcyLQSuiliCSSg8=;
        b=ZiQ13GBtMGdYsc0jqRfOWM/2yTJwIlHcHNEEoX7Kk/6jDXLjh/bCbsp0U5tNufH4uF
         AMUodZpzGqslUGeCKWdoiugL+H0UdbBmuCTITbBLQBwmJdXoTu+ORAjhYDo12z0Ub19j
         0WtEWUIsx4x8Wxfv3DyXXQnOLbcledXRW+uwiBDp+XNjflwJWTvi6bs0YPZm/9nEAIBI
         YENfKPCngDU3fhaqTqzwDT/oiTenXHGPlIc4NLz+TG3qneUMgW9iHKkFD4aVyLg8M/ok
         olHQ9lQfvAmpeBO2OTl1ZyY82gyTnxBeeddIyssXqhAO2Y9nSeLdNn9UBZ2tgVOAh7MD
         enAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779707632; x=1780312432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1c/8HKj+BHzZE5YaarXghzDZQ9RCYcyLQSuiliCSSg8=;
        b=YCfQQUpMPRJBDmntupM9pPVUCychnstwoyDO0iidlrDLSOnupE8Wez+NpoekjDiozZ
         Mce2SV1H9RDujXW2P+nMXDJdD3vhagEP7g6thMEM+b6Z9FkZCHHvH3/F/pnJSNKq7/ZL
         dxko0Lv0APuHRcqVCtVrcF7vS3SE1+kitBiaK5SdGVKL/4hKPMA7R6a8qjtY4YZhcKPk
         7/qMfKbcZWOkzm2S1HnOrYz8za3JgW7e3DmWITRYMiZTx9LQ/shltdgYi2PV6022zrm8
         qTgS60aXfWs7sNW5OcTg6LhNoLBRd0rgERIUDZpbxvdl5HEkE7pzphLEkCKaBYiE5eDE
         ioWg==
X-Forwarded-Encrypted: i=1; AFNElJ/Uld7LRAXS56uhfbuF7UzGZZGERjLSllYg5bNSZSV9SZHOyjq2lRh99XaWH4toVa1nTZv6yvOTOJkVhU+W/3Tn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6wXDHN5ct3fY4Gg84Cd+tty5NqZqYDvHB4CZZOGEYDLldSlpS
	IgMmSo7WZsZNamzmqmtjJQWUUGeTc0Et4PvbDMWRqZOUqK9WJSUQsUbpwk3rn9nTbRjoMnt+Bw5
	uWT7osPlHmpokuynBs5Ez1/Z+jjnnUhEZ8jd8k7IsyDnpVFwZAB0xn/oBhO0jMNziaqidXkmdiP
	rPNEd6ubRxhMdY
X-Gm-Gg: Acq92OFpUd1B7Xs6zOODCHnewnhGd98btCPjBRdbOLMp9UO6jR7H3+ZydqJcsDLoMmq
	prVTJaWwXgj5x/8uHaGZ0Ont0vdd7s1fmTeRQaQ/i941/FxY7OCkomf+VwlYTAK7fhoypeHxTef
	n4XO9o0EIYuUzhyKe5Brg2YmDxqWcnLILGwMby7FBBo+Fm/tYODyqNh2a8iow45yMwGardkjHOw
	OUL3lhEIA3AzctTicFyIjXUgbxae1kzvNSnOWd9BGVKJ68NmJ3UYvyaA/J4KhYahUevUqJ6vc1K
	4nGSV2lYwkUT8QtjEr04kxz2yaHWWu/JmGDqFvO8vzAJRnNiE3LH2ZfLLNjy1zppcl3MkS/ie7g
	XHAh0AAS/P86ExF9WaoYv1Ddl+4X3/EIEZdqovvmrWhyb2HcQUcco9HR/bALOqmzj2bZehlJ1Yb
	tE37dtiBUL6F6n1yck7p9iU1TECxL1r0q5jlM=
X-Received: by 2002:a05:622a:2513:b0:516:d4b1:48cd with SMTP id d75a77b69052e-516d4b14c3amr180285761cf.2.1779707632296;
        Mon, 25 May 2026 04:13:52 -0700 (PDT)
X-Received: by 2002:a05:622a:2513:b0:516:d4b1:48cd with SMTP id d75a77b69052e-516d4b14c3amr180285331cf.2.1779707631854;
        Mon, 25 May 2026 04:13:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dca7853esm22973391fa.14.2026.05.25.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 04:13:50 -0700 (PDT)
Date: Mon, 25 May 2026 14:13:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Message-ID: <u42lv62h7ps35zwqzxxmk727rmnd4ql4zmhb65q4bkjfwhi4f2@ihis7lc7zm62>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
 <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDExNSBTYWx0ZWRfX0Db11cXmQssC
 WHOT82EXUMxlk0LpWLVsbjZSQLEq1ygogCOuJFm+2iH3zbrgcMhh7pJ/S597/K7xmGehWFsdbIY
 a9x5EK95uWkUvyVQyKrTJ5UB4QLta+FuXoOCKcO7q7YlFZPiGN2hntXwpRhNdsanFoszo50z4DM
 phs2Gexg4D1H101je2xcAvPWNlixF2NJgxEybwbQiW+MFSGnKUPQZ0byVg3HeVIu85sdAsNtPw6
 g50Lpga5s4JMjvgNS7SFSUGSjc1N/gLZ12pyIiS/UwBTRUMWvnPkoq1Rh2LLre7Q0Dr5RrkKjk/
 dsOay5wD4mQg7IeTfMf9XQgsyQdTNdJv1XpOMeKMwwSw1yvt3lM3OXkNoBzcy/p5EQ7Kja6IBEt
 Zw075SPJpXyqtuyUAh2942L87yD9OZzctIlbZ9MKbmlP4EJtfkikXZ/CjrvRGAPR08lPYzzdyps
 +WEnqwEQ8TY2VPSOWsg==
X-Proofpoint-GUID: m5yKd8JpXVIy28Ipd2BwwrEcjHbyRUTC
X-Proofpoint-ORIG-GUID: m5yKd8JpXVIy28Ipd2BwwrEcjHbyRUTC
X-Authority-Analysis: v=2.4 cv=MetcfZ/f c=1 sm=1 tr=0 ts=6a142ef0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=h40nfcmH4B8cT1TSTS0A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_041354_023835_94C912CF 
X-CRM114-Status: GOOD (  14.08  )
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

On Mon, May 25, 2026 at 04:16:09PM +0530, Taniya Das wrote:
> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

