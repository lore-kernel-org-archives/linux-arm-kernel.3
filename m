Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D7BC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 08:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNg75FzP8x+6eRQp9BTSIYfThyHkdt1BwBxUEEnz554=; b=vhHsWbtJM2i9IMcubQJxCP5oin
	3iMFEYGveFxBNdUNs437cshEvbTKUieR77Sxq4ixdeHZZ6iYWmprnKUKMJnBK4/AEryeBHUO7T2Yh
	cMOAozeV2eBplsT0JbpcubLJSEALYxM6xnDtE4wPr1bygo25ny29Vf7k7XCfWYCraYktmmjKMKeiL
	0txeTQjNP/WxH11hOBbc8IrWDGN7aRYJ70h7iqNK0ixrFBdGHy5BMdhfZbwPmuLAMWH59pen/g7ue
	fIUxel2CHJO446AE8kEWw+ct+HG4qJiFCvOeNwa3gS5lbgiiMMEfUSRIH0Og2NJ2lhafoFu0mc3aM
	PnYozl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4du-0000000FfzP-46qi;
	Wed, 12 Aug 2026 08:48:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4dq-0000000Ffyk-2330
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 08:48:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YNpc3210290
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNg75FzP8x+6eRQp9BTSIYfThyHkdt1BwBxUEEnz554=; b=XXHks6oqYJ+EeKkV
	55jKxrTcb0fM2EL259VAfdpGRrUDsjptXtZNqWfmydVLmqDunffqnRIacl5Hcl/y
	D+ITz8LwbURWAu/JQ7hFV8mHTbL67AoypjHy+uLhTdtfYagHgNqMs3PawxdNtvLQ
	BHHhl12NQsEd0n6ckgsjQwWUZie+r7r6FTZQx2Dh/JweIsbpdGaK65LXqRaPnaC1
	y4XLEENHCCUdAUl2IlD3ienrmCTpPDykUu4/QqDufVmEUEx2AnE/SButJ8TthTyN
	U6QgVYTGQn/Prn5uccrtSuPl7UbFbrQL4ex/Q9pXcbOSMvuPGmgo0pSdKKIYOySF
	W4+LLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1gymf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:48:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-529ae8e96e8so5839641cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 01:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786524532; x=1787129332; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNg75FzP8x+6eRQp9BTSIYfThyHkdt1BwBxUEEnz554=;
        b=UGhDnPoMl/utTkB47RXdIfSZLZIoAeCTS+Tfuq7RKR5fLHJX90+Y1eJ+azWXBfQByx
         obid2sKXLNz+2I3XpnusbYfZzz6HKT7XBseS0lxF1iSRVC/nJva82oGn4wlPJ8KlPoVH
         rp2zGQ6vJqXgCstf+aRgKZkD3Hg4aI++uqHBauFLlhLxBvCZOISFMyhcsE/MB3wIL8UY
         3v6WR6g20oshXmTeMwPAC5pOYieVkWdU1naV92GgJN75oVDIgYZPuJiZ4Z/T7aGUfFDM
         AD0hWTLsFI6OzW90UkDtSliP9m66a2enw69KDTDFcRuNE2/f9k3fxP9NFTpC75CxICVD
         IF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524532; x=1787129332;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNg75FzP8x+6eRQp9BTSIYfThyHkdt1BwBxUEEnz554=;
        b=ONLjdRYLPWOKO1aTCHOGP0ec314QnvasH9XgXfNoUtYspSuMbmqVgwK4m3OXDUYMpz
         NBDbsB10wp9GaoN4MEcgHR9IU3oWu54J/zPMlvdh5EdpCKgKGzaEQb7UEPLumRiSukwr
         XmkWAuwArjBGNqB8DLP2qKgTyD2L6WziPbt93B8vo1kdDQk/OntWE9LjcbNEe57R/0eQ
         ATM2e/ubRJuIvmx0nzygvOkpCNr33IJuogjUaSDgpB5xQE/oLiJT4GXANNEB1h9OE0n9
         jzX7m3Ct7sIMYVmAWoNymZUP1nbGFiM8g+xKX1N6esU9oJQ3nZBHtcGgtgw3xC+mOxZD
         6JOg==
X-Forwarded-Encrypted: i=1; AHgh+RoADLvarIRoLgC78vYFd5Qc5A9YRGHpcA1peQvPUk54Q7bBs4pAW2dOmxwdjC9LiEEl5+SoTvb//AVhYHDQE7RT@lists.infradead.org
X-Gm-Message-State: AOJu0YwVDqqjebdxjdvfAzRZgk5uEZXLjmNEXv3lyZ5L+w3mPNfkgBLo
	I7kFILP5Mh3XfT09zdIBL+gWkFFrUGb8s2Qgslm9pUXgVGI12UJ5sIJpYmQcMScWsOMZDBDWcJ6
	K74lW/CFITNXPqHDt0FaItUq1erCsdmkkWS259CvXYz2S2VqLf1v2fJrZKbjUbaWW0CeqPrrlbl
	QzVA==
X-Gm-Gg: AR+sD12HFdhaEbZjvHFzzvPeNrYRa+5qT48LJ1VJOsXDktpbXe7sFXicHUAr6jvHA6X
	gsZTL3IUySS4NQYmwblaziUQnVH46Bq4Y/jyK9cMZXtaLmvl7plVFJwdR4HAo7PrrvUgx1czzpI
	RWxaJ64H77aCdmEVf3IuLsJuN3lW/LzgHD4J/qeQCcK/SJftNMEXM2AM03BY6t+YycgDOvt6igc
	thxdEa61etcn3bKiVsm/wO9qzMLKK21K5vIgkDvjF+475QQfOoHgCoMYXJqkS3dlSfHrbO3heUm
	VuTExkRlUjyySHfKQJMY94hBcg4Q+JxNhHsvdvTakOYOoNETVsoUTUCYdUFFOOEySqNT4kCwCWB
	APMMEZS1MePSYeWpG9IMy3nyqmPxKcA==
X-Received: by 2002:a05:622a:590f:b0:51c:1a4c:3c9f with SMTP id d75a77b69052e-52d646a2a09mr26880521cf.4.1786524531945;
        Wed, 12 Aug 2026 01:48:51 -0700 (PDT)
X-Received: by 2002:a05:622a:590f:b0:51c:1a4c:3c9f with SMTP id d75a77b69052e-52d646a2a09mr26880151cf.4.1786524531408;
        Wed, 12 Aug 2026 01:48:51 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150c057f0sm5437384f8f.9.2026.08.12.01.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 01:48:50 -0700 (PDT)
Message-ID: <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: Yu-Chun Lin <eleanor.lin@realtek.com>, mturquette@baylibre.com,
        sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com,
        afaerber@suse.com, jyanchou@realtek.com, bmasney@redhat.com
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
        cy.huang@realtek.com, stanley_chang@realtek.com
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260812020009.3480538-2-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QARxv9gn6eSWIUjoJuLNeqW3M-XkZZhO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA2OSBTYWx0ZWRfX/fG6Se9u6UvW
 QhRSZ+NmWGlCLdq/D2XdU4R45yYRQDYdFLy2waIlLyjIvMwPZZtvTRc4LTI7Vw/f8Q740ABhm5y
 nd03WXAMzFKgr129UIB9ohH5H2tzYNEcbWIn4rmgQjvDi5FcutWhpUjU/cvPrS3BckqTJjnvkVN
 K/FYCg9dqC0prMa4L1Rc8CbnRgIzXmxDqnzGTiFMs2aEGAL/IRBldj+Oxvo5X0+iPIJj9S8Lj8J
 xZEAVhhfBBjM6VpW8mU81GCe9pbHMxJ5H20TrWh2C07mUnsrsVT9qGGgboresLPIYOJz16mZSYw
 1zfaq4oQF+vDxp2W2yIAloh7QEizo7ydjkYLEAyP1F0EAKfEJiMgGkkqOCbAY3wnsCK2d86cLCK
 Q3TMyH+rooDpq1kKNIKdqrJ9caXhzVJk5UK4mpho8YoD1H1U2bmLzmcqkl15/xHAyB9WtviyrUy
 aD+lxfnvMGwMP2K7alQ==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c3374 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=n9Sqmae0AAAA:8 a=EUspDBNiAAAA:8 a=iM2GKElL5x5HzuFTWzkA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-GUID: QARxv9gn6eSWIUjoJuLNeqW3M-XkZZhO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA2OSBTYWx0ZWRfXwAzPKxNiUKyd
 ah0e9CWUUGumJIIkoS38Z16rlMnd6Iq/Nb+w0eU0biPh4lxDZvUKLodTJ7hZH2gZSAjTGqVf0FS
 UnVUHdAnNiWVdd3cwJCQCJbf2wYp1Ws=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_014854_671386_CA8BE95F 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

On 12/08/2026 03:59, Yu-Chun Lin wrote:
> Add DT binding schema for Realtek RTD1625 clock and reset controller
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

How my tag could appear here?

Look:
https://lore.kernel.org/lkml/20260324025332.3416977-2-eleanor.lin@realtek.com/

> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Who added my tag? What is the actual flow of this patch?

Best regards,
Krzysztof

