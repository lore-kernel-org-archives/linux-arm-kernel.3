Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C06C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=; b=hfybJvqnGiAYHArk+26iGYxe6K
	5Gz8/YUcPqVm86NwbO2Tq2GhhaDbqvf6jew5CIEg76RJcyhN0yc+zWUOYDMLoWQ9pKNgvy1mB6dzh
	nzQn4HU0Oz2KaYzmp/OVwPIJW+1Z2lYD0K3ruTvbqRF5/G+3f+JhWUmG0iq3oHcgsRVymmMkXECt2
	h+w3LuIT1DswMSe21UnlEVsikPoK11cKogHaqyyfAi3UeU58NiSaJMCyxlByqr0gZ1hT66FlcLiGM
	Kp8oXNRoKybDZ8E4bHyF+lwCpm+yc0OtPfREa30qi+R59bBXTVZb8nQaYLvsPe9jiON8H6YjFnxIb
	f7VNbm3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj2Q-0000000CX0U-31As;
	Mon, 06 Jul 2026 13:07:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj2O-0000000CWyx-2Owk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:07:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJfn369083
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 13:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=; b=QbOWvfYYxMOrrPp8
	bcZMRh5+gVIjxIia+4jGtN2gxG6/HBu+g2SD5G4FQiPmmCaZXxIuaxA17qiHd9FY
	JRMWrQCauBJjo0JgYhxypmj3yRmPWA3hDSD9tWsz7XIR77upkB0J+SsOrzvCRmhJ
	SlhobXzeowDnyvqIfgf3DuDSC53V6bKAf64nWQ23M4oSk6D2Sjdxakos63QbA+bL
	2J5WHHhpOPLcZl3/ruCBunw/xfgrnU+PPFzcdVn/iZHkW4+P/wKT8Vs1Me9IJjl6
	XFMYCfVPI2bjhGBGcfAnSVRSd5uhcnTaLDixCEPfrrm0/fYPG0BruYyAhcDWPjj2
	XVvYLQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9969s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 13:07:03 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd6a5aa467so82259e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343223; x=1783948023; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=;
        b=c/ys1T+ZP0QQ3RWJJvGyI9xNto+3ghTRLMXACmtkEJfVA8lvSu/vLKEjBiDYwH45xE
         i6SGPbfOuUXA1Zfp7HpcXFyFlNSCfXmxintTCgbwH0LA1Nwf/ru4l9eMkkIwcYQgibK7
         t+ju06kwk+mzCGD1qTmKfEW4hSlkwMbXPQW366pRLSdWHrFgtFVn4kCNyKo44yiCiCv7
         Tcnf+zt868XI5mGLVWSAi6LK84bIRYriamdH2/3wWsqQAIt3+RVHphXbRqz1aaQZU3wm
         FDSwqJ29yx79g+Ir6TKLz0yjcFm6obBBZriUthHT1ugr2skLxUZGChWmg9s24Axl8Hk+
         H9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343223; x=1783948023;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aJEqe/aUkEC3wO10Vna7LP2Zs+q/5u3K1GL2ugMtcM=;
        b=AiFA6tI6h8up8s0FYQ9A//goj1Vq116EWnDMuOFcmWM5esa/iThMEtIJyTJSS36s9r
         7giKOa5fqzyO3xoFfDl0anpvR+lUtuLHQLKZQo5nyngqJlA3RbjtG7ZM0aAGwMCbf3il
         GmFxVX9AKAV7fAPRc3RNfRw/g+psTW7v4RRh+XzNZJdo2R7MgPsLUB0WIu/L0WBzex3y
         0LFTxlCNZP2IE4165JLrVq6pU5uhG1DkxpDB5zX59bc0HKDkYHlbK9Y8r4A6KTqEdrfh
         aGL/KEfspYNZ0ltl/mGqvMMDzC5iyU5NW/namjavreIkInZ87ydxLobUm00ZYZ+IiP7m
         kyTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpo9ZH+zjZS6CFj+vM2LHTR8dZ/UX2LOg7yMMX9ZnZo21xds0LKgpd7DOu3Z88xlFJPAQX5ijnGiwzv3s5Puqs5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy9wunQEYU56hUlvqvX6C5t9+UiwFzyJCZjkjOOuma71zHhJjY
	hiQ5gLigl+EhdW7xBe8x3gHLdM7+JKhjxTWYUShieSCrLwqMgYEDCqrDFqV36ltse5eQ8lDoTWL
	DDbS3z/E4bORv+J9xpnAg5HF9CIBMljMPI1mM/DYTMOXokINepGPONMOGoQExleKaJPAOCsmfMC
	C/NQ==
X-Gm-Gg: AfdE7cljt0jkR4ajSEiPOcM49HcI6yd3uu6/oa1GaMZSCZWd0L4zyPzfl1uJavsTqs0
	ku/JIJ6Js7Esqz0AodnDYXvxduq6ayqKR6cA7gDD++99ytFljFZGhddEreXgjp4BAXMyFRywdak
	kspvGI05ZR3FkUzrkoBYe+M4jOSpMw62aoDEal9F+gb/lfLoMOgWhOruYW2Ypm++4BU2saP7JWh
	JqTjjoM0GATWzdsTbt+2pCb3hhnCDLaMMgzm+GYG6vHxACB7OrjXhOkPB+4k8e7j+Ipjp2G5Btp
	aajNvAsWZftiY7cObjqtXirCAgjG9DAP7/2TkVy+wjrLsRshmmyoDBXPOMPZI0PULNGCboVoRBd
	OPlKhwrgFzCF55Zys8GVuTm/T8iE0LNPpCZA=
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1233247137.7.1783343222818;
        Mon, 06 Jul 2026 06:07:02 -0700 (PDT)
X-Received: by 2002:a05:6102:1625:b0:740:178:770f with SMTP id ada2fe7eead31-742079e8eb2mr1233219137.7.1783343222369;
        Mon, 06 Jul 2026 06:07:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19db05ecsm3945114a12.28.2026.07.06.06.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:07:01 -0700 (PDT)
Message-ID: <a1542303-8a71-4387-8651-fc4f127fdfb1@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
 <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
 <197684ce-e0c0-41ee-ae1b-c9b31a7f6411@oss.qualcomm.com>
 <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7eaa8b9a-ba8b-4d07-92c4-3a965ad58708@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0msL4PAFtHyY4ltN6n7jvYIHil5aKhi_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfXxRcWIctGN9UU
 j3lpI9CDs3GYczKdwZMIiGH3aYsMTR+1KHfg9knxrpJc4rCA27qbj/BiiQ4TQYRxExilKGVzQsj
 AjQkcxQJNgQMtZeJUzkguxYzT0khk8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfX5GfpMi6/uFeb
 KnqkOK54isRfWlXsmgPwnWqsYzYrLKtiOL5+Ogn3ZZhV6aGutZZ2z4fZnFeuo+dslTMetaOQI/A
 D7nC5Ylgb+n1mwdWVGWW4UZPD3lQdwpy31SCUwBF6cvvkNNmmOf8USqWv6pacmMBZMhHgEBSCoq
 zCf+zXs/tdouA0pu3KXTIHZ9DFu6JFZvITWl+ek7eKjMjbxqclB02U31WyHPU+2Jz47GqRzRVA2
 ngsCi6dH0uRbgFTC2YuNHwzk06pgO7wcH4vhUr7krCga4aGlhPRQzoct01onahoDuO1MwSVg4M9
 PMh3EtrPBwiPBogpbs2RXSBPbMfDlfpBlmcnm3xsB/3GjqmLrxNee+q9K5HMxRlCfiFxKKH66bu
 PdwnDvRgRKJ9Q4exsQ2bzlbXb5AucN2ChPhTiiyrzjOdg7wY5KxSWaeO/AQFI57rrDLBoet/c15
 4V+DhHMgnxY7DNts27w==
X-Proofpoint-GUID: 0msL4PAFtHyY4ltN6n7jvYIHil5aKhi_
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4ba877 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uHYfjYNGAha-st8cwW0A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_060704_740048_09B02919 
X-CRM114-Status: GOOD (  17.51  )
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

On 7/6/26 7:28 AM, Taniya Das wrote:
> 
> 
> On 6/30/2026 7:39 PM, Konrad Dybcio wrote:
>> On 6/9/26 5:02 PM, Taniya Das wrote:
>>> Add the device nodes for the multimedia clock controllers (cambistmclkcc,
>>> camcc, videocc, gpucc) for Qualcomm Eliza SoC.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>>> ---
>>
>> Almost all of these nodes lack power-domains, meaning the
>> aggregated performance state requests will not be translated
>> into RPMH requests
>>
> 
> Konrad, all the clock controllers are on CX, similar to Milos and does
> not have any special voltage requirement for the clock controller.
> It is okay to not map the power domains here.

I don't like repeating this every two weeks, but each consumer core
may need a specific corner for operating at a given frequency and 
the way that is conveyed upstream is via a hierarchical structure of
pmdomains, where the root of the tree is provided by the rpmhpd
driver

If the connection here is lacking, every requirement specific in the
OPP table or in the IP node via required-opps goes to /dev/null and
RPMH may do something between aggregating to a lower state (because
there's some other node voting on it by pure coincidence) or shutting
the rail off (because there's no votes whatshoever)

Konrad

