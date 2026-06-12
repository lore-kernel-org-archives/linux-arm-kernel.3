Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ED7CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 04:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=; b=O8jaOXH1DjbIwpSHB9Fgp0rQXK
	+eRLM5Fu+bg+EuA0ROqAHMSAciCQw0Zvee+WhwUYFeSAGyCID/GSnP41z+etXL1eVfFyohyHU/VzT
	X8OIXX15S8FiF/wnNDFu19kWownda+NDHgI7v+pLdz+nd2GxqPopuNBLLAOgwgyPYsBR7hp7mL+NL
	6M81iyBC+qitDR6QB9BnK/NKnPgbBjOi4L/BXfs3B3Tmk8BYwVGqMHas5y/kX1EyafuqKs8WKFKxD
	IQunrVdKW5hDN0h1rNq9nRUytyciBBjQ7JagFeeeRh7BopNa+nD9+XJM3vM8GFc8YEOofv4LzA6kC
	I1MsjvHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtW2-0000000ALKj-310h;
	Fri, 12 Jun 2026 04:29:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtW0-0000000ALKN-17o6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 04:29:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C3BqcP2451680
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 04:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=; b=jeNuPdkj9czCH5HS
	Qt/sYulB+z5oP1QJXs2uwCW5tjaz1/QC5zHG5zG/ouxsZMCgo/zFXi5AMzUI3kaW
	Tidbokmz2FhKgBRrloIaek3XOLVs7HFbdvIXr5LV0klebXwQGtgh0aTznMcRZGLS
	Jzq0L+adYfkhdzni7WrAvoqtkjqCH99MkXju/iRzPwC9CWQb9b/0v72h5jnz+TfN
	UJ977nI/ixrn2D59bRs1M8aPtdcCWQoKMKn3RO7lfc/ZZgPJSfHk2yX3a3aCWalI
	F2hyK1MP99EXqPY1s5hngemSs068soo91mr755/CwLObP3U31/5bGydZVkEjfuOi
	ZI/3Lg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xchvw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 04:29:05 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f424d5bso476731b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 21:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781238544; x=1781843344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=;
        b=Le3Va8DGblTnxU/eP1/Bq8d8Dj1p4sFEgdJ9SiFFZlt29a2IimzVh6RAHKN73oaCP5
         ukB8Yof3hTullvxAupqxZ7XXfLm2wCZ1ppgQBF6415/n+KcJxBAUSDdiIIwhrSN8Mg9h
         e0a4whXKxRMz9SaoIxpEgch9qjKsP51eLyRTjHeiXVzb4vnpcn54tNRVLI5KKjW1dmhq
         j7MKi6SqSX37T94yqE4eiVGyfcGqKwOtNTx2ZMzLH34cFCRoebfwms0z7shn8lhFrJns
         6/s0L6M793ATjHTV9g91z+trDU3/azh+EzlX9YYJ6if8qAiTBL36Ph2k0fUZ/eGQboCZ
         zliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781238544; x=1781843344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SmNdWicmYA/hCWOfkYARYqJaGdXG2iYDvY8C9/rp4bw=;
        b=NDRmCd6uDu35dLAbKzIpzpt27opOM1U8Xp2x4qfYPU8zEyKmUMwURTQSDVNqIQWBH3
         Ei+rT2C66wPzn3U9ZyL8oClbD+60rOb4BxizwTJEPn4+raAb1it9lFP2FPjPVJoE41FC
         5EfzoyItQyIkv8AIFQl64YXDlhDpvzpMc9FMVbJVUnXGb2WYPu6NredrFVXrGQVzJQ6j
         33Xmu1c8jq9i7vghFg2VKvh6NzKLxvsgE5zZYCYPNpKs3WfAa7DZSqrba9tzQycHNFqU
         XaR5Ma70Bj/YeAVcCzicOYlYKdXHbIotujl7JezOMkT3o+AZIkZAe38njNkQ6egGJqXW
         lHWg==
X-Forwarded-Encrypted: i=1; AFNElJ8PABKgC/L25heEnKB9/UFD4CBw8ZSLMyEmGY+lcTrPoqXDEeJhNG/RVlt47VJuQy5RngZyS2KISPCPXESbTwB1@lists.infradead.org
X-Gm-Message-State: AOJu0YwkaTwRuycw43PFYBXrtR/W2CVmItTN0k+CEZ9n3xWoh+IQsgfg
	Qrc8QN2N8jdRrnLqPJmieuXNd791ZMlzuQBS6afG2Az5ikLSof9NSjsn/IZZRR4V7pCxWFq81tD
	VD7Xt1+nThR09Y5etQk6uln8+PyXOguUb8WjGl004haaOig5EPGsCVC+yphZheNIhtnKyxs53d1
	qOIRTZoIR/Ww==
X-Gm-Gg: Acq92OENQU6i+3oOQ+b/XaqQe9hCbDTsk62DdSVcFg+dV9LGRbWjMSjqQ8HhaI5Wi4w
	Rs0nrToIlWkNsbS90Ht3gr79FJcugtE+qteLUrgtkDwjAtbbtbQXSApgaycD+VELmud5YJcdoQ8
	uRtHMJrP3m7E0GU/nZY3IDpgWUUORtrERag0SkavPeOW7a1XdgrK5+SuPyQh7UEIdfnk7t+aQhh
	DwEeKKGPA99Xff3KYZvPXYQgKEP3+m+4UL/UnYplOcxAqxGfY5x1nSaDgk6u1PYzqV88hb7YUo4
	D1FZkjVsatCOttgMUwGFdymmXOzxkJd1eTHIcb75WZxSdnsZ7KmerS+L61+jSRZTxndsMkDVVd+
	2P8+jSADy2qvXgW6xM/XFOVFUkYJ8lroUsarY9KiNxlTIWXCSgUE=
X-Received: by 2002:a05:6a00:22d1:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-8434ce0e251mr1229404b3a.31.1781238544383;
        Thu, 11 Jun 2026 21:29:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d1:b0:842:6a3b:60d1 with SMTP id d2e1a72fcca58-8434ce0e251mr1229378b3a.31.1781238543954;
        Thu, 11 Jun 2026 21:29:03 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afd50e6sm711452b3a.30.2026.06.11.21.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 21:29:03 -0700 (PDT)
Message-ID: <ce7a9067-bde1-4989-81ce-c5663a20ad32@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 09:58:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
 <20260608-reliable-vivid-stork-f4ea6c@quoll>
 <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <ab1055a2-6916-4083-a360-62eb15171fe3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAzNyBTYWx0ZWRfXw51ZZvz5Rd+V
 i32lHzBqCAMgFxgz2vqysS9QBLx2i2t9WtNt6DwxXNmA+3fjVpAn/0zHMH1cV1yE/99CdgQPBQq
 mk4AF5yuh3N7K78YK3nNRdgloDMl4DMO0cB6oUlRqTD5uFajzCXHT2E2Fbcv431WuRf9Vr0gksa
 MhgqCV9z+VADzN8r1O2Pb3AaFqFbxt+5flMqOtsQzwuc2q5hfpkuepYOxxo3WjMv6dd7Op2Ip+L
 zPx9Ugu6hlpPLbJC863xLizwIWQCbvDLRPBfAGt5U8hy4XBR4Bqs+4lqZSNrFP0ZfMwYn9GclCG
 cZpC+424Vcbj9zzmVXTit/8HDnvvYNbb1oZwUIoL92RpK2RDDS+zOOSNVRvzdHK9SG+KKyWLZsW
 0G3rnOLgBJu55i51NKAQLXhsvoRzixHvy10ckTQq6vv4IzGjlGGwcDeoBxRMZBIuEadqDVbr3b/
 gP++TCQTkNUTwg7cPjQ==
X-Proofpoint-GUID: MyQxsUGHAvu0vADD8xEHDaN9jnVxwJOI
X-Proofpoint-ORIG-GUID: MyQxsUGHAvu0vADD8xEHDaN9jnVxwJOI
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2b8b11 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=RuEr1PiGI7RNW/QBahnYvg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OmvEUramPnncoLCXQdkA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAzNyBTYWx0ZWRfX32G4SJw5tMVV
 39GhJfACS069ytH4tbySUMk4xnegOLQHgsEou0S1B9lbIRsgMOl7qUnAT069+/gr+FrKUEJESh8
 Gc5Yk5SnR4QWwwLgo1erB38GD9pw8Xo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_212908_443137_8AAB4014 
X-CRM114-Status: GOOD (  11.63  )
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



On 11-06-2026 20:06, Bryan O'Donoghue wrote:
> 
> @Nihal.
> 
> If this is the only change you get asked to make, I will just fix this up on application for you. There's no need to v3 the series for this.

Thank you for offering to fix this up on application.
That works for me!

--
Regards,
Nihal Kumar Gupta

