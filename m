Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECCDC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=; b=KE77dm2rkd9m0ie13NesNBwzQB
	diHgaePKkWO64e71B9F6wyizpgG/+anXsXoif3zk1GN4C3XJx528UoGuYjMEIqfB0rFwkPWgp+h+9
	RuGVH1P+gSvmfQD+srNa8CtnMC2uabrYaYqFl7ADa91yiFAwFNg2r9dXq0cT2oR+sL5QcOEsUKjkM
	UEjV4CFnnswfbiVwMxmOPsOI6YYb3F06otTZMzjDU2WRo+Yb0BIj1kFrCBg43hPY9KqOomqKEMvlG
	h6gVyOGoR6e6FJ5XvXhHykCYUcCtnw+0t3vLblWIDUIIS+ZR4ZwzDnQjedKHHvmx/yE63MZ/dx+G5
	+Y3wptZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94AQ-00000006BC3-124v;
	Tue, 22 Sep 2026 17:20:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94AN-00000006BB6-437Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:20:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjmTQ3952751
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 17:20:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=; b=aLH/+QUrcKEdduB1
	g8hbwD/QG3Lz6Kv7wEz87IGYoHZhTkAbB+/26So2s4RjiWefqzBQ8ViVSPuVHA+X
	D96kFcu/jpSnnrhxwl37TbM/ebJsDd0HVHzNDafxcwS7wFd95Q2LRCOYzYr6pcro
	6ECt0jJZZSIf+t2R2J8+tJY6jJB2Sqly0Zycd2EFNzVbKhsqdy/oy+TL++8Gluev
	fedAW/8OoClqepQgz5usalXYgcRRulEOLllXxid86JjbG0rmHNsllFjzMQ9R1IsR
	6NK0wU4G1Px7lqTyZjqH96UXE1vMloDa5dcNEK3v131c79bjfkiXemDUqbKjbio1
	2dsWIw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqbtv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 17:20:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc51591102fso201342a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790097625; x=1790702425; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=;
        b=EqS94YI5vmuwN36p8KOuytQ94XwtxdHUzdRw6oUVoY0PqpMxfza8bVYp02tzr14+SW
         SC0zx8/M06+k1mbB4NpzQYRukjLgDEr7MR0rAgBzMxQCA9s5d6xtbNkvL6NKjwKCv2Gw
         RfeMC/BQrtXhnlUwdIw35P+2L2vTLVGfZXtR7vnl1knaYKgldJyyxdJZ3whyisul/N+j
         z3Ftj7O1RBf/tu6NKKWksxFgxF7KapSxC0rl8db4ftbFS1rXcW53/K0GnJVfU1SyM54R
         OmSsD6Tn36mrzcDVMisXdEEOD8vXRaOdSTHgO+xemdoYZZal0fVq5AKxD9e4eBHYdFlw
         x5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097625; x=1790702425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHqvINvN9nNOcc9oXioULCP99cwRQ6NA5NU863Z+Bug=;
        b=M/X/WDivl7C6nXxUHfq7lChNKb+I3d6z5yGN/flUztyG4CgdOX9K7R1SgBJq8gz6tB
         XTdrMgd6NWb5QbeF7vg1dxULNMZuOAb+uDm/6OIFubDDDhRRFQk2AGHK4q2lj2yjgOXi
         beRuu6fwRMXp2oiiB3TG/XUb2RTrxB7UfXgKcg6bGPJb5OPVcOkViFXJhLQOuN36nYml
         Up+SAAStDc1/VXXhYIzAaRkCZ3+fX0mPTcKRlNRdvQ81lNGKXnTPToJM4cIawQQ7OC0S
         7giBsT85ljuNdsWCYuNZOuVEtxWiw+gxYdBbVlRuouUPjkyC+GPb/rzCIq8z0TGQf4PW
         8S2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxpgVK4IR63h9vr2ilC4cxdDUhAz+ldYIWJ9MtrF5dlctAFVvRoJKCOydfB8zIvHeCKC6SQbH9Pc+eZ+/+T3Vm0@lists.infradead.org
X-Gm-Message-State: AFuF++lUUh8YFfVGRR2vOE+QxiCn3dRB/dLra3gKIRUI4OCdSjTGuDuX
	Pmb4gcmC9vSiwxH9bqHZxZCI0fmqr+7ob+c2JUJKog3vQLBJ2ShuJdjGV3qsZV4eFwF/lhEvKiS
	GTztNetSRH6YncwGnDpxZ2BgRYiA1UYeglpO8ehMxCO3UMnbXy4hquLA9hdfepx9BevbDRAfYDU
	1nxg==
X-Gm-Gg: AYBFou1QmRXqEU5eNIAjJ4w1U36gPFa4QxEK8eQefQ7pEVc5xdPgzpgydzkeDXgkhNs
	71z4IfChCMsq54/56Krw0hoe4DG4i4XkGobKUSn7+t7I86ZQNyYUmfvyWiBUFrCgoHQujJWEfKm
	stcAuBI907NgLEKGfayGZSaYQgZN1ZXaRACygbynR2PU6Ec6asSfcqnRd+UQzl4Dpo0rPjjsKyr
	5cc+Jo4/kKJrUpkz1N7eAhfF4AJ9ckR756cO557JWwPE2P4Rx4CAvnC0qYz7HklJG8pu5SbqB1u
	ir7qcFY2urgyWUVdbTYGH1n4JZ2OEm+sqjWXL3MZMrG3YMgQm8c+gb3Fe3dfubDoWREzSIgwNRw
	Jv4uo5sfRvwrR80zU9bKjQR5topVEaw==
X-Received: by 2002:a05:6a20:3d95:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3ddf8278bdamr129782637.38.1790097625317;
        Tue, 22 Sep 2026 10:20:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d95:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3ddf8278bdamr129761637.38.1790097624786;
        Tue, 22 Sep 2026 10:20:24 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.227.249])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc756a1d386sm1295837a12.10.2026.09.22.10.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:20:23 -0700 (PDT)
Message-ID: <39ac1f45-057f-418f-bfce-917d968eb495@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:50:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
 <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <ff798c31-48ef-4882-8ca7-5b4c8bdcf9a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2p3qY40K9nk8xCkvIUSVkQ6cKP-a6JLn
X-Proofpoint-GUID: 2p3qY40K9nk8xCkvIUSVkQ6cKP-a6JLn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1NCBTYWx0ZWRfX324/zjGNz11+
 IpQXDglz7QC2FA2a7rwMSp+XAgUKJ9nHy3c3US+Dyt0CQNTOcgSnjYc3wS4HEmTPabBL8VXlSE4
 wrJKj2/Oa1vI1Zl0ufPvCZKsJvdyt3U=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab2b8da cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ISK6p04Y8w1qFYbiysbuaQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=sGt-zapad3vFaLHLuqkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1NCBTYWx0ZWRfX36qqiKB/zPQo
 ICPiG7RqBK+x1t45tmKRujzlIQbWVIQThUubIq2WqiBdTP1ZxWMXTGKb4dkpOJboCgHIHm7Gtfd
 rtjuGQafXSosGxlBFwsRhH8mHTS1qwiWXQ/bIqPEciVJtjOyMO4cvIp9/dteE+m1nLK+PuzVUPl
 WYKiuZ6u7yboIYw7aymdMkOFnCIb1wj1hyzqJR50FUd+wFRHoxVvGODFvvphqxHYIE/Svgw4Nrj
 Z6Gv5tAlbNPJ8IysPic7b4hvpUZ9QvNmYEqqDad5PCMSrPcvBmOYrj053H/Su6VUlSpd2OZ+dd5
 0zZGQWvt03hGM5QNZ5BHIC0QL3jb7HZQEVD96EIUfQLXPTHX+XczmRxdo2UEYRKVVVTDY30+vjK
 1tE8pDJR/jiVITgbCrrJsTOdeymHFK+5WyQhuhfX7XS64Rdj2jBkfzs1BFrYuLVm5DZdK3anwrC
 2u2txEkTBcy0ls14T1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_102028_129656_98D87C73 
X-CRM114-Status: GOOD (  11.76  )
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



On 22-09-2026 21:23, Konrad Dybcio wrote:
>> <&imx577_ep1>;
>> +			};
> Please realign this vs the hamoa series - define a port in the SoC
> DTSI and reference it here
> 
> https://lore.kernel.org/linux-arm-msm/20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org/
ACK

---
Regards,
Nihal Kumar Gupta

