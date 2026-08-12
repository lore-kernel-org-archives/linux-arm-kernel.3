Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FBBC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSWCi66YE8ErYbSgjBsfYJ+A2/hYpl117IJirU0vLro=; b=1gCcRBWlj2ZXV/F7ITYvcwEknJ
	NV4us+MdtM9VvHwRs7XDgOoMahS3gJwNhoArgowBlWykweSlGzQpkdtBXXDwo06UMWifVgS0NWOaP
	xu1pD8Pea6Mqhy++OsWQ5Xj/N3Oqbniq9HLjN9owGkcbVTG9OMvh4kEm8SlFsQ9is1CYGq5SGAvIs
	//piWXJTYkxn7hVmSkmOzv8LAPOKugEY5jPNkJNDfCQOyQgJhoYF//uHskdBtR7JSx+1Qz+DGDa1e
	OMO6GkHPd27DMf6mXnNzASf5R0XyE1+wy85O0i9jgLnh1BVSFNRnORC3yJ0qOiBx8jFXQLXU7XGoM
	/iITs5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5aI-0000000FoMu-0Lp2;
	Wed, 12 Aug 2026 09:49:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5aD-0000000FoLK-02XE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:49:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C9gE612211806
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSWCi66YE8ErYbSgjBsfYJ+A2/hYpl117IJirU0vLro=; b=B5kcRMBRxZ4oleDp
	4qtfimQechtTailYt75vgJtuARqnyhjMLbWsDJUEgnmxlACNM1tV9BT/W5jdzkIK
	qTo8UG4vTzsffQkTppnTFCvWwV7v3wa7tPeZQEMVL/kWVb8kr9XTUPgDiEvbxh0b
	ZM2v3H5GGKN42KrIq7fZHOfF5AwvgovELcPDtim3s+a9NtodtjkyDQnkJLiO19NZ
	hNiELf66VxnaVHvr8Wc3j1E7OAXGcCqvobbQx/73yczsnEC6meLHH1/n92GQ+YgQ
	08YWxuaIvTzZ7THFyFtk8LLy2QXiTIUOMtaOILIPrNRY6s6NZhPiPDnDh2x9hF6b
	13Wt7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hfw17g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:49:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso14007181cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 02:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786528151; x=1787132951; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSWCi66YE8ErYbSgjBsfYJ+A2/hYpl117IJirU0vLro=;
        b=ABbmyXZkD4mK1hW2mtLg54YBQvR5bvW/zA+Ns+eBnuPkqBH/1C9Z+zTh8ZtEdQo9GM
         C5lvrmf9uuUrMJwHgyqM9fA+TiwageNkGgYEpRi+YPUIKe/HQ4xAFTyvO6dDYX5U9c3I
         uexjliHFmbT2DfPFrEI008MzMTinlzZwSrGcVAJCbzzwI9JgcWZzPuc5Zv3VUDxlKJOF
         UJINh3VTq5QQEbpwvQpPK+S8x6VeZESjuNUXwfv6BhAYdlY3ytBqQ+L9jBLpxWhio2ww
         N2lxAedScZ3yHW7+6Kpt+idjgN7dauCJJSdPilFI4Z+nGdFQ2Q39Ot30J28qunyxMwQU
         oV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528151; x=1787132951;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSWCi66YE8ErYbSgjBsfYJ+A2/hYpl117IJirU0vLro=;
        b=JmGS+eAd+BjTY+GyOYbpcz/4jbdRPW5jY+TBzmzanZhAMvydugipVMY5LbxtXhJ6T0
         zhP3BnP/UDVy+UAUIJzGW1g6CR6JGfpfmIDcHDqE1+pEIdXpjY/jSLaoHhG99JPJrTi3
         P5npivKF2Z+bGnlft0jHh4uAB4aLbjkSMkN+pcOV5Xp7EflMQn9K7xR4RWbXrWG1yb3o
         NYSM6WJN2jBjK1+9zTLOmoQfsKL61rczOkOjVKYjew9uPk0uHybR1Mv0dkjN52O5Igj1
         d4sqk441j4vK2mjSgaOsOw+185JZLuXnFuFMN+YU8i++0Eqq7BCotCWjRw5GKgh9A20w
         Fe0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rop6/doVRtDwdgkrKjoAGw43dcnCKqp3MC4pVmplpFv/UWTE3asehi8Rrz+7baGWI2FXInoWb4lG8XkJL3Gz+OX@lists.infradead.org
X-Gm-Message-State: AOJu0YwQWxQv12UGXr0mJcKt4qBWWRF1in754j4/EV4N7+1MfGaK0ZWr
	QF7BtoAPwerkHZ9GPC4/uVfWKs1INyBfFO3l7yOl6M8eXOvXz7jDmu1pRkz5/j7XxaCanoH/7Ra
	Zi29gWl9+KKI0/WYM8aO1eaWk5CNEW+FUKC/wcaKWUZAA/cda3FKR4TR9nFtTs3iFI6FcJcoWZr
	dFtA==
X-Gm-Gg: AR+sD12x+XBVOOIag7d3MWQIQ6nj1KkrLKQmawSSYLjgYhFapGTwrQElMqqg5qewP3k
	5ZIDaSba9/Snylwf7SywXOiLIMaQHqTmi1GvlgK/iAAPtaEQOd6eKpc1gF817nw5kazDKQxiMJL
	6uz4Gj0aF8oPnNwQLeY+g6td+WyFNsZx0TsOcp3dFtxaBW2mjyJ4zdk2EHqrAeYduncDcbhqw+v
	c64dDaihvT+h7lD3S9tze6kTEbYGQMH4VLP98HITbiF7id35TsoF7IPMI29L0hO6bjENaBVsR9F
	83+Z2EdYAeHrIe4OW4d23Heelasz0NII8htbPi4KtixGIxG9u/tY+Rt+tWsP+jYss9bMA6DxmH5
	DcxL+OYi3gr1xbrC8isdkcNjS2oZexw==
X-Received: by 2002:a05:622a:1a8c:b0:51c:1590:8e13 with SMTP id d75a77b69052e-52d646b45bbmr24962031cf.4.1786528151295;
        Wed, 12 Aug 2026 02:49:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8c:b0:51c:1590:8e13 with SMTP id d75a77b69052e-52d646b45bbmr24961791cf.4.1786528150895;
        Wed, 12 Aug 2026 02:49:10 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d709dfsm5950355f8f.35.2026.08.12.02.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:49:09 -0700 (PDT)
Message-ID: <d55ed65c-b066-47aa-b285-c9582894b84f@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:49:04 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fd254ec8d59a4ed3b4ea157b866ce798@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3NyBTYWx0ZWRfXybSjnA9gAQWk
 PWNqGJMoNVX5ujMP253MeHNNL7UR6Ow5oeZOTM1DYGkxh9/2UIpcGSYjM85XcEZp3WSCBZ6sUpp
 4QdieeiWnrJMdv3JQjW1vquBzNSUAwc=
X-Proofpoint-GUID: whDCatVJSZZJuTLA9O7PU-Nv85aZyvTq
X-Authority-Analysis: v=2.4 cv=fpDsol4f c=1 sm=1 tr=0 ts=6a7c4197 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n9Sqmae0AAAA:8 a=WMIDViIH5NI-YaAP1ZcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: whDCatVJSZZJuTLA9O7PU-Nv85aZyvTq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3NyBTYWx0ZWRfXyDEgy4k5VBjN
 08j3vKw/SSuRr6gD38MkySnln3yjy5a1jtWsmkN77aFjAFSEd7/Nt3v6aHCmf4cf215ORzMKtXS
 r/NdlsIEeE5+k8nMjHI6IHHY/5mw3gWth40pA0/aUJLPgBgtEU3j+TnJWO0sGK24UmWGvYqD4mk
 9J2IZYd7GBLMnhwC9kAbuBp3WMcp3mV992NZx8A8QoYOelHuGqzi6Ht2YTQy1MfJOXru1AS5xvE
 TGcb2zwpFCJ/cU6uQxg53Jxp4KOsgylcXWKgzBOXqDEwcI4W465we2zY1v2mFd5MuMh/F2FokOp
 8MvEXw9RSNXc9IQlM2QBBEFfdHMWxlz7WGOAYOZhlQpGArs21OeUJzrF2d0AksFXhplexq4uMNc
 73vl0ZGtbw6ghCZd+jH8VF9Wq3TBnP1hsNCPWFaKa9GkefPW4IHSzJgAFUEZ0rQF84IsFA7tFUA
 aEhPoTz149C9Ed2thwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_024913_182479_3BED8E21 
X-CRM114-Status: GOOD (  12.92  )
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

On 12/08/2026 11:41, Yu-Chun Lin [林祐君] wrote:
> Hi Krzysztof,
> 
>> On 12/08/2026 03:59, Yu-Chun Lin wrote:
>>> Add DT binding schema for Realtek RTD1625 clock and reset controller
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> How my tag could appear here?
>>
>> Look:
>> https://lore.kernel.org/lkml/20260324025332.3416977-2-eleanor.lin@realtek.c
>> om/
>>
>>> Co-developed-by: Cheng-Yu Lee <cylee12@realtek.com>
>>> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
>>> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
>>
>> Who added my tag? What is the actual flow of this patch?
>>
> 
> You gave your Reviewed-by tag in v5. However, after that, Stephon provided
> additional feedback. In v6, I modified the patch based on Stephon's
> comments and made some other changes. Furthermore, I added the clock ID
> 144 in v11.

So how my tag could appear before Cheng-Yu Lee signed off the patch?

Best regards,
Krzysztof

