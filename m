Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B71C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=; b=4deUVp2oFgUI/nP+kfXkSlybG6
	gOuptPInnCM3nAuAnJ9RJYGEAnihF5+tsO8Tyalu7qh0AuWc9cHVOMvBU4t95OMLcZlY9J062o3Fe
	o+sceo6TluwAE9hrI3IfdmM2yFghQvh9xozE8VcUzmdyIR2kMR5N6ncy+ouV2PIXC75yZV2FWGoF5
	v/CPzs9dx1WdBRRLixn+O5oiyVIQl560HHKDTM1EIOIe4xCiCtKGcQMGzFGih0G2YFbN4NRDSZmAr
	7VBozPJR26zcRE7lz3lrw9DGoPHMvTueGvrRU70B/zkfO+HSFgmkTNXFX71NTfuc3GLj18pH/BJ1v
	YLNr+JFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmJW-0000000D5G1-2r2L;
	Mon, 06 Jul 2026 16:36:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmJR-0000000D5DW-3TKL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:36:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFCF3762339
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 16:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=; b=A+kE9elW43k3JhEE
	wG5rxbGyVqiu2EJsjUp4w8h255fyh8Sp7V1w75SG1Ng9NMOdpwAOQmFB8YKd5QjU
	d7HSNSGLcZaVU7dC713562ldZ6524HIU9eTjCknQ3KlIdtBzkUwj4nGhH9tCg6Ro
	rmCpvpmSDucwm88BxcOV+oGsUYlUaOFo0KNIwnZJ1O/wvfe1FeYeLcl9poOZwNmL
	RqZYuT469qkFJg9EG1djaMfkTW0CTmzC6c19Z7jY7BAgY7gfmOju+N2koDZjgUhw
	WLyE+QaDhqQvpN6lbTAdalxfKEI9w0iWF56xBTM87k5N2fLk4qexXlL8+o07U2Ys
	f5UTEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxthd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 16:36:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e9c0c4492so74575785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783355812; x=1783960612; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
        b=jCoU48MXhq7/TjxXKHnuDlr9obii4E5CUuecXC2a7/BL95D+21ZMg5DuXMMAualqSz
         vQ7ajBbNrYvzleX6d8hb8HP6BfO5qACnq8qHCgVdJ5bHvYLqOAfgCafNJEz3AiY9sKQp
         rxQtz9s9lJ0dmzyY0iLps4wlD1LF5yoKrU9hn3WOafxatMiUT/Ibboui6abZaWrvxP87
         Zkbp2t/XTv993xH4tRxXV6Iz0kT5CB4vmVHPaVACKKuOpqslf+YqSQGfaM0ZIdBk0+dT
         r44dgN31J3Jx2ICnUwxDfhVW0Bg5WAsN7TcPikDOfsLJIvUZ6LDbnfEl6jMVIJ5roScJ
         z2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783355812; x=1783960612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXxzqxUWNYvCFmZrt/ZzFvpveO7OkWrcSL3lLSJY/ys=;
        b=ZYjE57uq5XDM8F0bw6G3wkTeUhMEgzP/vPBa3JQlVP8gcNb6o74tLyZl7Z6jlSAFJD
         1YPvwyAIHOzHyVA9weiazl6zLCxf8Imnuc0U/eC9YmcuBAe4K5Z8rV84cEXHbTSpRkgj
         UgIh2f3Ay7gRxb01yygJ42zIibluCgltQd39WhkSOBXjA21V6vzEr16OZrD9fApH3+Kq
         E8FCIo2T5HO/jG6OAhxwJbHJ8IcvsBWFnzy5Uo8xsCGiHP4s18tHcJtSiFevZFfwDyZQ
         THGseqPOLPwZTRdtKxH/WtYZ0H5L2ZLIAm8fAyGfX2HVXSKWktUKBSS6EJsUOqRDR/0S
         xGTg==
X-Forwarded-Encrypted: i=1; AHgh+RrySxratcRMUb72+IpAOi0wzxCn6wUup5bycBPxRAykrcgoKg8+jXaYbrAucXQ6T4kDwZpG5rH4rLFDwmq3hUvk@lists.infradead.org
X-Gm-Message-State: AOJu0YyMXRqZVq6WFAitVC26LqCBe/kjEjG+LN+pilY0uvIeYJMqSlvz
	tHrY+ItCZqNyFrHCUoxAMZBM6E9mUmk3jkP0ncsA7aBKELR6TTReFCr/V8kHJ7rLA47AZoTUA7f
	UpNruJA2dk+50pMmfM2WAatht4jSh7JYD7yaKUY4i2eCvYNDrz9PilHGbvn79UdAFDhMRToQ5HT
	qCXQ==
X-Gm-Gg: AfdE7clt1CJ0d9f+Kta0X7UaJEPHofE/J6gm5xHuCjHikXojXiOEL4nC89ibwXKeJBP
	zL9UNVK8D9KeF1gIomkvUJ1/aheBV4psOFlp/ZPRstNZR346LQsvCCzpMwiboEtm+8oQi+KZvb9
	Z5tHXFE/FQvSLgABzHnPX0hngSUxWgBKj+miTMsImvvs7WukCwZMjQXC81ITKIhIJu9VdiNI/vS
	kfyz0XyFVzDi97/rSAmkg33Wo+rnUenuqi9TzxH3ZYKoKjw7tP0YgpDN3z8GrrWDUIi/G1at51q
	6jUaEeWBfccCJTsURDIwC3Lw1IEQhvEVUPbKZ5jPe2CO1r0gcP6l6rpInaz9CIbpZZdPpLDNr1q
	IFqmEnQ9Kwvm11Arms15PEf7+1V8r3kpay84=
X-Received: by 2002:a05:622a:7:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c4bdd7802mr101176381cf.3.1783355812349;
        Mon, 06 Jul 2026 09:36:52 -0700 (PDT)
X-Received: by 2002:a05:622a:7:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-51c4bdd7802mr101176081cf.3.1783355811741;
        Mon, 06 Jul 2026 09:36:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4588sm4668489a12.7.2026.07.06.09.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:36:50 -0700 (PDT)
Message-ID: <7cfbc3dc-c1c7-4e4d-afe4-67a25084f607@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] phy: qcom: qmp-combo: Correct pre-emphasis table for
 QMP v4 DP PHYs
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-7-37e2ee8df9da@proton.me>
 <4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com>
 <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a203e5e-5d16-400d-a507-8b68df8eb017@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ig8ZxtIQIerzl5ddCxpGgAJg7LvgSfFp
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bd9a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=F-ycRNR0_AuAsNl2EYwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2OCBTYWx0ZWRfX7pec1WHQB9r+
 26IpOhg+BPWJ+Ap27T8ztOWqUoIg5sKK1qFlgYxvrHgX8I1jTGhJqb872IoOBs2rYjpkD/uEa0+
 2Rd/aJDfevjSqq6SKvXDzzaLMUCrbMQ=
X-Proofpoint-GUID: ig8ZxtIQIerzl5ddCxpGgAJg7LvgSfFp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2OCBTYWx0ZWRfX5br839ihGhXp
 ZvOSk6Jez2ZUGK7kIg+xpLhE4vAxSGedFmUFwaLbDnboTPXeaGIMCKTQACUMtD/4zOfOakUQ8/3
 XSFywqMUUVmb2KMdrtCJfqcVucaoT1raCoRuhK243N9qgM5fObOJIpPZe0jOYAF8kiVsdmUI/Vx
 JnIiMg3QfaUkjiMYYpwbKjn7sj9krXW245y45gDXIg49EmStpSYjIr7iqtJuttvcJwyjQuVd14a
 js6XTXOFUNpu3uDsC1fLIMwhxy+dP8dFEV8pI7tq8iA2cPpv60MNi5v/io2CffJJENC3PBHnV+p
 GEMXVtk6MYOVKpUbqjTAZwrTkU6wPV171BSNQFDNgQNg2QY3RLoFVQcQqD5vY5BpFx5PnQv5UFw
 E3BoUgS0Wh6rtmoprLFXQf/8aKN6xJTcoBPdigj3j/SIaMTqqvk1zWvSmvNcfxHwSl1drDrzHGo
 UyviLxftiofJ8TfAtgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_093653_895174_39D47E78 
X-CRM114-Status: GOOD (  11.28  )
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

On 7/6/26 4:44 PM, Esteban Urrutia wrote:
> On 6/23/26 7:36 AM, Konrad Dybcio wrote:
>> It seems like 8350/8450 should be using what this driver calls
>> v5 tables, with this fixup:
> Any updates on this?

Dmitry, could you take a look at my findings?

https://lore.kernel.org/linux-arm-msm/4635a665-f605-4647-810d-c9d83a271a86@oss.qualcomm.com/

Konrad

