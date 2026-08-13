Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFD3C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/X3MXsM/dairYaaME96ocNJ4mUaNzFuA4QB/JQX6YLQ=; b=fDySH40abGyKB9pNiUx6efnQEP
	N5PyaLBfVN59g005i3LBFyDeR3/OFKO1vKjkTGlTv6K9i/s9j24q3PvbUR2skF5CwCl8hRSsR4ydx
	gY3VKI9GZSJv5Nli+KEbbFpMHCHG++HLRvMTJeYPXVPCIRVT4YobhbLm11htY1V2ahL9g9PcIi8+e
	PyeVOUzeiUeuQRBcgiZNFcltwPAwe6OThodWxL97aDC/Li9BO8iTKpqLaDvVAMFH02J+dDRRPUvTb
	HSjK/yPDprSBACqlK0msZGKiGc0ekgxRFEbWOXNSdtDT6x6sF4HMieFmw4GjZoE6H/Pt4GUdldLRr
	0BdLMM8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVoq-00000000mtM-2QR8;
	Thu, 13 Aug 2026 13:50:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVop-00000000msa-0hdk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:50:04 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DCJxj32414590
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 13:50:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X3MXsM/dairYaaME96ocNJ4mUaNzFuA4QB/JQX6YLQ=; b=gK8aR75TGBV1NARB
	X9u8BUMlQPPa464ekNYPTRsOi5lFq2v3SlCdm7sOhKxqQY9wEcy2SVXTEgq/b0/r
	lxS5/6pXlKIdWsJ/ESVmicLg3RRjr2pLuCjNI5fwx4eQfpFKwJqCiZ+vJ4yMA4UY
	Fvab9T6Lw6hvpNzx2j9jZC4huZQBIGJBfXPsir1rpx0JGJxR028yZL322iUIIkUn
	E4t+Pwz0DrrfdMHBQWbdEe1LL8UpiQpV0SB+3dNLjQZwkZIH/sgX+PggXehlddAT
	sUIQJRzCCOyDlLZFXr/nonIdRiTjlarYE7XsaQijBLHGrfFfi6SiFEYxN6y+ywcm
	aVhzSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g143htr9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 13:50:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so14108891cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786629001; x=1787233801; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/X3MXsM/dairYaaME96ocNJ4mUaNzFuA4QB/JQX6YLQ=;
        b=KTigoZVATBtdctDGJQ31HppUzlITYIpOF/okNV65LhIrVrgirDGf0J63ZC+aGajmaY
         D5b0PV9nkNKN3D3H3Giv0OJRth/bs8lbCKixaHES8hqFNZ6m56Pr+9kL8ge/0NwjoCXK
         KLE9QBFG8EzRNje7Zp8Q15IYeAJ4fxg8hrgfHng67UNP1VcJHM8bV7K01r/aucge8tmg
         X11nAU5gDXl0j8X0RssMEwGoQrerYBo/5lunwbHnsN7tct5nOOUmqV95s3e2dr/UUXTv
         CXQ4Vsv6G3BZlJyvKbiethoE6AUn2Sw6ECRASBVpMzd4BkGXD4cln6WroB5Gz/vE0MVe
         7zBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629001; x=1787233801;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/X3MXsM/dairYaaME96ocNJ4mUaNzFuA4QB/JQX6YLQ=;
        b=QjMRdDqsdXGRFbaBwwJHTIVBsO7xt+wwuHOK2OYDl8LNoKaR8UPXqgWnNjexkg7APq
         FbJdP4Mhqyci0uYs0V5VBX8kNlMW+/IDYJZB8giksddFYIYi+0OG75Smb6ntnGJHe0UT
         V5nKAAX/thPMSHfT9b1kKazLnVjAv1dz//OOkysXK99ugw1PtXtRJDUUMAC8Knv1YF0o
         uD0eSl6ijviGci5xXA4e/cC2s4s+k6bZdBbS4LBj1B2j639TBaYgkmu8ebKpZRd81jdh
         9X8PTK5tqdi0EIlNRc8Ahz+E/YobBUi5bSaVn93/YMgnmc2VH+UA9aRm3lD9cP1dOt6D
         i/+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoitRz98scuLolAlgEXwvnNXoR/FdoPLdPCvS4+rw/zR5tqHl1sQ69S8Soa4cGx+fGIIabDdKjjBfC8j4tQgNYP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfn9npWVL7XplaosuyO/Lz/QfTbh+oxEqcEHeUjlCrs5PfQ3rh
	emqZV6O46YPAKqD45rd9mpXxvUbmMipQuPTvtIzpEY585ggmqlL/j8tNli2h/NohFNf58Q431PB
	V4DhPS1D4ta46pvP4QvN6C8gBueSQd88KLLaH7x7R1b7spBn+7rFXK7qu29/ByvDC9VtnZ6IiZ9
	ra1Q==
X-Gm-Gg: AR+sD111scqEHvhC+Ym6qqzhYg9CiLzL0HaAzgQHOVGdvyXwzBmed+akLALU0yxsq4R
	8yFbD/vSOWaKYFd6rc5U1aOORp+HREc/KEu22M15/fkSKu9Hn5zSwg5XIzRvV8MmItHzJFBxpJJ
	QQ43fA2EAuYJrG9lxMt2qMRSM6CP2o4Lhuaen0nuBHncVMw8CIu+BAgV+wat9VOYdNesiintYLj
	tW8Mfl/+LdxLHmU8RgrXCjmnZ6kgTOdjrkyVZd2948lW1MSkCR5W7Fmn8Pcvs55+2+sI5RkpBZd
	LelzcH5qkSYRoJAh75HEBScFZak4jEOPNC7zmyks0q5syxSXBmCCcUI247Z0+ZjBEfwbeWhcZ+L
	3fHqrjepUJMRCUs7/Rbxig0rhLiPh
X-Received: by 2002:a05:622a:228f:b0:51b:fb82:67d1 with SMTP id d75a77b69052e-52d73db0571mr67684341cf.20.1786629000754;
        Thu, 13 Aug 2026 06:50:00 -0700 (PDT)
X-Received: by 2002:a05:622a:228f:b0:51b:fb82:67d1 with SMTP id d75a77b69052e-52d73db0571mr67683491cf.20.1786629000255;
        Thu, 13 Aug 2026 06:50:00 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5612b8sm5585491f8f.1.2026.08.13.06.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 06:49:59 -0700 (PDT)
Message-ID: <d4bc85da-c02b-4655-817f-34af6d8762e8@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/11] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
To: =?UTF-8?B?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        =?UTF-8?B?RWRnYXIgTGVlIFvmnY7mib/oq61d?= <cylee12@realtek.com>,
        "afaerber@suse.com" <afaerber@suse.com>,
        =?UTF-8?B?SnlhbiBDaG91IFvlkajoirflrold?= <jyanchou@realtek.com>,
        "bmasney@redhat.com" <bmasney@redhat.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
        =?UTF-8?B?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
        =?UTF-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
        =?UTF-8?B?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-2-eleanor.lin@realtek.com>
 <313b74fd-1a5f-4e1b-a4e2-a537f7939fad@oss.qualcomm.com>
 <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
 <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
 <e2c90bd25e654e0f9ce1aea6e0b4f74d@realtek.com>
 <e5a838f3-609e-48b9-aca6-a25fe5453cd8@oss.qualcomm.com>
 <2c6ddfeba0074866b4bd2d4276ec4508@realtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2c6ddfeba0074866b4bd2d4276ec4508@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R5oz39RX c=1 sm=1 tr=0 ts=6a7dcb89 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jDsTJrNZ6oklJcrCIzIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA5OCBTYWx0ZWRfX0rvG3frtqh36
 K9zJQa8uO1BpPKAY6Ysau+lTDkYdBv/m4jkY62EwDLpKu5pzxXMhfrPCIFqIVi0dJw8bROuCfDz
 daRynncnZW1Yhg19gRlCbzjDZqLnh1Siloh8hHO0Ttfnw5B1bg2q+h828bRZvo/Up2tzY2gUeP0
 0EsAbIURe9B51LLckfkkKCPVkyDVPB414zVCIXrBIZVNfABXkmQuQnW0C5si/9EGQ5qfmnhb0wL
 bb4z+Iokl6dYSewq0qNnBN+3Zqi06dlNYmpsrVuTBQDg7pOaWujWh6/EjF1CsCL8UYFZqmz4sfv
 fw05bEIAitKFyoC28Trk4lMDTJIR/QhQZFUGleCFwXqMsu8AbG3ssNGj6QH5AZPQ3yKnbYbGox/
 7PRLGo8dml/zInxCEyaEIDLmZnxeJoPqusdK16zdV2/Bzwp2B+tze9co3+aanGaz+Jg8rWcUEI6
 TGrEACzFKtEeQQ6RQ2A==
X-Proofpoint-GUID: F1YE2ZUCQUJQBPjNF1--mBf4qZF9HXLG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA5OCBTYWx0ZWRfXwgqEg/S0XziT
 hgSTRh13bDsFsO+qK8asfaKlN6mV3C96I4zh5OEq/3cGW/k67tR7I7v+pbgJSPhy5kno0zLSJ8d
 8bDzlluI0JOEDrIcQEtmDVrZkEqdJwo=
X-Proofpoint-ORIG-GUID: F1YE2ZUCQUJQBPjNF1--mBf4qZF9HXLG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_065003_202420_2AE85AF2 
X-CRM114-Status: GOOD (  16.70  )
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

On 13/08/2026 14:27, Yu-Chun Lin [林祐君] wrote:
>> And in any case you should use b4 since it would do the correct thing.
>> All patch submissions are supposed to use b4, so you don't make trivial
>> process mistakes.
>>
> 
> Thank you for the explanation. I'll learn how to use b4.
> 
> Just to be sure I get it right: should I keep your tag and move it between
> my Co-developed-by and Signed-off-by, or should I drop it?
> 
> Also, to make sure I follow the correct process and understand the clock
> maintainer's preference: Should I send a v14 to fix the tag, or is it
> possible for the clock maintainer to help amend this if there are no other
> changes?

You can keep the tag, but move it before your SoB.

Best regards,
Krzysztof

