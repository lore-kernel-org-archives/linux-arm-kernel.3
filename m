Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCF6CD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=; b=V+wcQHQPLsa/09kV2WzkIHOY1K
	WaB6+h6IiDovI/gHe1WtsFkxMb6qNokkPX66W02mJ0QIHDsl7D+LrcT45Orux7IX1BF6QdooyxXC3
	udX5xZwyIew6PCLXNN2zUC4SG5EGz8P/UnnJe3FcXdKMCibk+3I33qlwDyy+CCJpcqiLjtqn0I9BC
	2itZRljaS9S/nVfECjvOywXsME4ScZa3xtW6eAgBUfNHfjY8l6ugjsPexv6M2hQyJfiKT+lw8dwwB
	5/6ycm7JEXK7DtFH9uuyZVRyxDw4/pOm5xUjiQIcrxPMk49kRt9fYv8cATl1TEHTuhOG+k1L85Kyh
	3PmLIh9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMit7-0000000G9gt-0lxq;
	Tue, 12 May 2026 08:54:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMit4-0000000G9ep-3Dq5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:54:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5AR862186406
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=; b=cSd8d3XWV6tPTnyY
	qeTlceQh9goZb/iweKamnT/yd5ZL0n3jZjYDEVbDg+Bqisdqp6/ktzd4zptsR7WX
	qMkF9ozCfzf/cb4QZtOOHkdiF8dF8R16kkALmwlc3e619hoHn+5qDFGWKx9vUKMN
	urEVDYVttdIUygxhT8Upp6DnvBFUNSBQSJfzSq4zKBzLpuXfOjLSMp2LZUAD6n/j
	D4FiygpORscdB312IbtEv6E/WC5HfsUPsDDmczybY45dHabjruXH0BLdx+6PV4BF
	MqLovMg3JFYnIqemGD6vZRNthdf8/LrXQWPxY6IIxrBgUSMeuWRN3t9BmOfRvEBe
	vs8DRQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0t8xb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:54:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso3312072b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778576085; x=1779180885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=;
        b=gVilAO3zOrsH/fvNTzMJ6CRq0JQ+oFM1rO5Y4pqlV0V6hxq1chEQMJAiNJIN1Yz1l8
         V5Bl8ycaqVv2CvHLcaoqZtLKno8xwEb+XJmZlLtF+i0FzDRc0budxgHRlXXsg2WOk32h
         Tgx/xHIWXC0XWOTjeFY4Rif16y+t2uYSqT1EyWTBMzuspKd36RDSZx1q9knVUkAI+dCb
         J3bDzpwRi1ahvdcc2qvkBaGEp51pvNxp6MpAR2JD1JxnsDjtMFlP0t4v6E9YuNlEJ7wL
         GSsMYR1IcLBD364zyDJiHsfB17Z6Y+TMsIiQhh7GmN/etNEJbWlnTOxzxDVb15jyX2V2
         ZXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576085; x=1779180885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLWgrOfEGpguXKvOHIvAbEuiwtFN3p+oEkvp4LurQ6k=;
        b=V0H+MF/6DvxR3u9tT86NJdDBDZ51zKvdiGbhpqtbftPBEQtuievnvpkRMD8XGMZEO8
         p/LS8Em+Hvdm61q4rsRpOOy/tcsv38BeJpjE05roVAcb2BpP77WD25inCu5oozbrpaxW
         bz4KH/NKjGggMbhhVbWQGlDhdbvzi0jEc20Jvd1A7E4DG77+19f3r6HZFr+5WJiVX8nz
         cB6IQjUktpszsmmIqjMoYRcysKwti6rs/9ih5HZACDqOotyCCU5myEXaaHDkI04ogNQr
         yYmUn1Fmqnvan2mVuAsb0I20+9Agu+EuhSQhXEAR8pLYZjTTiMR5Dk3JQ4lwom/SzW5Q
         j56g==
X-Forwarded-Encrypted: i=1; AFNElJ8SDL5D5ohM7s3FY6DuPbF8/rMDlKfhVPnDOnAvsd5XR8RYB6V7XXrlU4oelV4WQZFdUmTdhI89my2E5j8+rxUe@lists.infradead.org
X-Gm-Message-State: AOJu0YyILjlorpBBgYYaWuU15btG4DaMJ4U0HrQ17kuNGm+rMist9/p2
	wbt/RmfkoGSyFl8OMusI0bfPzCur7EyqGOdA6phBMBv/H1NDohtr5VB3TSfwQMuaOwFRa14/Y11
	kkwGki0gfwiW2eN8iT+R5C3bIwm2VHAzx4LIxpEakPDBPAEXuCVFoKhpaejAx83aWAjt9QErqgA
	X16Q==
X-Gm-Gg: Acq92OEYbKPLg1Eak30tSH7FWefk8NEIrkv29RHIoPQR56XhiAtfXdeNv6Kx+KUjqmp
	wftYq2aJ+hk75BQ9q1PNvLGr9Nfbxyt4e8s1udbfZ/NoQShU3Q32uNj/WuvbjP152NrEd/Vgbbp
	xwEKX4kYg2/E8G9Rsp97wz7j9jmOVlTcYIxXRNwwECu3OnzLbMjhhF+tzz2NcAEzhnWrWOVV8WZ
	5HZ7cNqURqTSAjeu75KG5dVkTCmjTezIh4gk6ZD7++geh/6einSsRtwbMgVHgDi5ZZyIrS8aVUs
	Y8Wci8nJtcfP+vhbxbxiz6ViYg9jIJ6DJNvWba+6kC73WAgg8tr+2EInUDAVtqXC6ENjfgWw28k
	qGciHBEJrZATHgv/5ufPU89qaVyrf1Rqs59giWqukUwbAtgPk
X-Received: by 2002:a05:6a00:4398:b0:82f:5a77:10e8 with SMTP id d2e1a72fcca58-83cf5848df4mr17235946b3a.20.1778576085449;
        Tue, 12 May 2026 01:54:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4398:b0:82f:5a77:10e8 with SMTP id d2e1a72fcca58-83cf5848df4mr17235900b3a.20.1778576084924;
        Tue, 12 May 2026 01:54:44 -0700 (PDT)
Received: from [10.217.217.99] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f03bsm23389781b3a.9.2026.05.12.01.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:54:44 -0700 (PDT)
Message-ID: <f17c3e4b-b0e4-46f1-90aa-99751cbc9348@oss.qualcomm.com>
Date: Tue, 12 May 2026 14:24:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] dt-bindings: clock: qcom: Add support for CAMCC
 for Eliza
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-3-bc0c6dd77bc5@oss.qualcomm.com>
 <20260410-hasty-pony-of-tempering-4f0a47@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260410-hasty-pony-of-tempering-4f0a47@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4OSBTYWx0ZWRfX9Hji+PtXle0F
 P+WEJpyJJqtPEPMirXKLYwRMdjTmClRAdsYiWMiqutCqt662T4dDMyk/bs2+1e+9r2ACTdofS4Q
 NAn4lM8XPww3OgvMwvTbTK4WAToj0qYVa/fij+656sJYtiScK925CvsguY3CjV6RvgS5Ae/40Mo
 ekrrYznj66w5ZlvtToJqfwFMDCKFMvBs956qMbTN5uHfYbcAS3ZHdm5iu20BNL1UQgtgMMwqjKD
 576fDiBeSwoLtWuoDikMTvhivBPXBFUcKW+audh+I7mK0H1DekxJ+EOim/EPoF9np3VsbBz3WHa
 1e20FrXur6nyfK7ZzIRsKJoIGWq/FcPKlhDHDbFfEFnykULdK9whdRipQse3TaZYsGO6MhRFzRq
 TMKofJOl7ga/EA9NTHaxnvVaN22GDNgpbTwk3qxJmpvq9rmEop42qTZWIm8W1YOl4TmAu4sPJJ7
 qRFzXB2UD8cChosyyaA==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a02ead6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=2Qn1I_tgzRFu8vZVKDwA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: VjF1hLyLRkq9rYo0n6hce43GOquP8lbA
X-Proofpoint-ORIG-GUID: VjF1hLyLRkq9rYo0n6hce43GOquP8lbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015446_828905_FEFFAEB2 
X-CRM114-Status: GOOD (  13.69  )
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



On 4/10/2026 1:17 PM, Krzysztof Kozlowski wrote:
> On Thu, Apr 09, 2026 at 11:40:44PM +0530, Taniya Das wrote:
>> Update the compatible and the bindings for CAMCC support on Eliza SoC.
> 
> I do not see any update here. Also, no improvements after v1 comments.

Sorry for missing that update the reason for Eliza not compatible with
Pakala. I will update the commit in the next patch.

-- 
Thanks,
Taniya Das


