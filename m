Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205CCCD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 08:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=; b=dSDWFHEJrc7yP2CwmvDQKhmtDA
	aI/vBQ66D8n2J+zoNWAqvdgSsQiku9e8nPG6z/6qTzppolnR4Cectl5lw4rOBDDZVKoR9ABop1g+Y
	3gH74hAIEEOa7IiqALGrSycU3Ol+gE98g04pICuuttTia9Moge83Vv187B0dqFR0glGDA2qC9hkgr
	B1AUaeLv6gRru4ILBfOII7zHptFKNXtCqx8pLh9ZwLiG1tX9dO+7WDNJFS6x82s12Egxokv5WSjPX
	xhLHSt94lo0Hq5xDpFs8VR24HJTLli2ns5Bk45ZARGwEq6zZ4jyCg9uJino7Mpg8QlNpewDamwKIZ
	tiJWbPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiqt-0000000G8ji-1WX0;
	Tue, 12 May 2026 08:52:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMiqq-0000000G8iw-2W1K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 08:52:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C416ZH1882439
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=; b=f8+gyyVut5AKopKd
	mSeXPq9Nj3PlBCRZf7BuZy45g7tkwBcu/Rq6OQys8VzEF6OFTqbVtKIcVhLgxW9P
	eukcMCqtmgcuwSEts7+PvyJ8uXDBzzPYvA663cDrguDJ4EJ+lJW3XHRoF3NuE6cq
	fR8BiSXabb8G1rqPKdV7vYN9MsXzv3FdipovBoj2BBnrFYHrBDNUf05y8pBpQLmR
	42DuQ1iwcSxDchhp7pDxWYqaNBb7t1UJTZ4f1oMmS/2BkbabNIkUhSaCDJBZSbb5
	q3Fky4FA9DfuySLnEjo3qd6zxuCKjMXFTD6AmB509wRhvkr69uKLIbXovteDkg0T
	y4opew==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2a0kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:52:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so3292797a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778575945; x=1779180745; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=;
        b=AeB1xw26ZKK+5pfgJAw+FabWh9hoIq6R/5ELlmGrjyyVZI6AI/FoT9hNQhAv4D5RTh
         W5Wx4oJ0VzASl4OvLUyCl5iYq5fKjo7Ajxu1eSuRVcgJmGnyHhOS684daLNQuL95lCTS
         hjrCf3dL/54eD9rlaVUmWXzwuH0/PizZrELpBePQhBVi7JypgDcAXf5JlYrCBgVzrXaS
         4GjXzH4lrMyQEZ3EaEkJsUWL4cBTBzstzAe1CGwVKtoJNnhV4rqC9W45Botrwg0IlxZH
         XGi9KP6GEzCTnh/pv2osPtLzzL4Fsf4OagLZ71vd8Pa0Hk/jEnQMvRPP0tLL2h7srOt6
         6hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778575945; x=1779180745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=;
        b=nh74UWrCARJuI1PPTemUYa2b+tFLgg63BIRhC+z6E8voZA4WGTLVtBMZEsEY/3zs5X
         7E2ZfScRr8HS5T2xs0op/VYgGap5XCaHPPGD3VLAEAqEtd//QY2VxQqkgZxYHKUF0xkZ
         uvXHQpWcfUwSkl1hgFz1P/frcAcz9XGCGqsF9QjQVL7/20Q2aYaqL50CViho5PMbQGm4
         zzciJsU/FDw/rXK283x92qy27XFbrrVUccUJoWKnQOlu3OCNasEG/8bHyN/bT9aahxWd
         KBgzT+5D0AjARmmnWTqzZgAiWVFuhwoY82Gk/526Mn4QqOpiCIcAJChFtXWWeKjEp6RR
         KdXA==
X-Forwarded-Encrypted: i=1; AFNElJ/Osla1yaV5R9eKpS+vVux7Aa64c9fGbHfFw0RJt7V9/ba+VvVdN0rVtF/0ipiqkleC4BNpEvmEkqUS8TUG+4Hb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6Xy0vH//BvzN6KbEelK3VxHuMnIxTjH5o9N2fnOc71t2MY9yh
	1gKzq6Bxb7w4EZuirHITmHG/ch0UULRNHdLJ5hLRT+ybND4na9D2XREXsZ06FUHPAwF8bEraxkb
	okXUvfkCPmbJ3divLghvTl4NSpw7fhjc7bN7U3hlwVOUf1f7lQo6pIj1GdsmkjDdSrxUQQ6juxE
	okbA==
X-Gm-Gg: Acq92OE+Y7TWyZrdInZzA/ojvRU5Iak+wgIefN+GFzxV6ipaAWMGk8/WcQH2QevPC7L
	Xmm0EhTWZxj6NiLZFFNgoFtzdhfvqC9N2fVpiPuropsBCnDDH4ae1oS50Kqccn2qqlGvjG12VFc
	pqVbZBVUQwUiPQf7JNvPNs5pdZC8evAULFs3uvNaAcSuRMqP/jcg1N3v4QzGqWHKWvPYkD5fcB7
	g1Pdu9GHjkEvZK/J7c6vdVpbnqvxcL7Hma+0FDz+wwaSGEhNmu/nMKOSDsILb13UFewELiI9ij3
	L5Up7/C2XLmL0eyafJEz8LT2Lbppcm7glS251BJ/xGK75h6j0ASyZ3gdQlZlJS4+N259Q2scywk
	KtzUTnD5kvx+s+vMF7lzxShFKhGLZ4qHaQ1mH+mJHdBee66tH
X-Received: by 2002:a05:6a20:258f:b0:3a3:21db:8ecb with SMTP id adf61e73a8af0-3acd4280430mr3012135637.14.1778575945174;
        Tue, 12 May 2026 01:52:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:258f:b0:3a3:21db:8ecb with SMTP id adf61e73a8af0-3acd4280430mr3012121637.14.1778575944726;
        Tue, 12 May 2026 01:52:24 -0700 (PDT)
Received: from [10.217.217.99] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688e2esm11432629a12.8.2026.05.12.01.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:52:24 -0700 (PDT)
Message-ID: <f649f4a8-df16-4fed-b1ca-4362680252a4@oss.qualcomm.com>
Date: Tue, 12 May 2026 14:22:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
 <Z8a4y73p6MgF8gQkVtottkgG2Ok8-Vhm8zzckWEbiU_DUO84x2VlwPt-VBL2g0utw3ZwZK0aUvI4ev-p_YRGoQ==@protonmail.internalid>
 <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
 <b280ad04-d4ae-4904-9e99-3d057e3d221b@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <b280ad04-d4ae-4904-9e99-3d057e3d221b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JY3Ba7TwUM5vEg5Ed9AvUQUb-xtzxzf2
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a02ea4a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UOnGL9-HqUUrvkLjBzwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: JY3Ba7TwUM5vEg5Ed9AvUQUb-xtzxzf2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4OSBTYWx0ZWRfX66/FY7xP+hFa
 9YXzkOFox4bbgq4uJ954Q6I+Q1twYhLeY1mmWK60cngEa34G3SmLi9xbwtIuP+OqlpxD4c9Ipl7
 xsCNgDWT//zIsP3ks6V6iaZ6/hC5DjolQPQ+LlZpawqrjWj1KlnuszI0OlcmTzxl8LCzZijHxq+
 vYItzp/MSJd6uUZBQc4kqrJaVwWGkIvgkrPlt1MI8Z5fkHfc2/rcCSxppArawnMb0wFd/VOvTWg
 40zekMcEs/eUKLqT0XTC/ZEfFIwbF5Ln5sDk6/xzekZBNdebzyctiYc1BxycJiFoFBOAbxm19Ix
 1xZwmL+7eFe+Yl+KEI08IJN0Q92NulYkPRVav/kRm8IrzbfvrDbrl+GJeMQ/A03ndiE3zWmLqUl
 1JWnarzJF5YfKSWGSJ3NBkc0sIHulfvtord+VDVmcPVYLSTmwcB+lpzKQSiHlqAcglgrGP4uTLt
 4O20Mqo0kHr+UGAWjlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_015228_752165_3F031FFD 
X-CRM114-Status: GOOD (  17.87  )
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



On 4/10/2026 1:56 PM, Bryan O'Donoghue wrote:
> On 10/04/2026 04:55, Taniya Das wrote:
>>> Why do these two controllers have no power-domains ?
>> Bryan, on Eliza the videocc and camcc are connected on CX and MXA.
> 
> Shouldn't you at least have:
> 
> power-domains = <&rpmhpd RPMHPD_CX> ?
> 
> And even
> 
> power-domains = <&rpmhpd RPMHPD_MX>,
>                 <&rpmhpd RPMHPD_CX>;
> power-domain-names = "mx",
>                      "cx";
> 
> Konrad's suggestion to me was that MXA should have a vote in my CSIPHY
> series I think he and Jagadeesh discussed it but I'm not sure if they
> _concluded_ what was the right thing to do.
> 
> Right now I'm representing the dependency. MXA is always on ... and
> there's nothing to do voting for it @ MX ?
> 

The clock controller drivers only request the minimum operating level
for the power domains. Since the cx and mx rails are already at the
minimum operating level when APPS is active, explicit voting for these
power domains is not required from camcc.

-- 
Thanks,
Taniya Das


