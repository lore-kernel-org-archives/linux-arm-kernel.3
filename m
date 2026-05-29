Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BE7CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=; b=2Xdkk2Tj6jPL+Zby0BdrnsqFif
	AGIMh7zzfEMSomoHV9oTl6KDKIXHv/npD9Ha7Bqvlr5m9Kqc9eaOVcQC3lSkQpZzLq0SF9xsTLUKA
	Z1y9ENcjYUBrShba+hoRNyuKQoSdJjpPdn8K54t/xbpR5FnZ0c3Sp08qgF/qOkofiWnCAS4vr6dbt
	JwO5juZZwB+0fVM5B+BJG/t+2G8AhZm518wiqpJ1OJT+2acznaKdvwdUH/pVjK/rZJHrejYRZHaOs
	PXln7dke3B8Fkt1ZAj9/xBE1yWiAEYc19zLF95orky6g35LAfWRCpIOogvT8hwue0m2fTH5R7zI4e
	C4XOvmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0nJ-00000007y92-488X;
	Fri, 29 May 2026 17:14:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT0nG-00000007y8P-3whK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 17:14:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8ZZc3771660
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 17:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=; b=AxVbb1jmWn6aHqAD
	3m3DsXClFjd7myjwZOnFRTWa4dNFI+MtDEYGk3juTtH/ltD88vc4NnXJWWjpJF6o
	k37lYBJ+Uqh6frAhHx994cLmGJe7MZb0S8j8FM4Fho1eLwEIE7LAtDSoCDk6V5Sn
	/3JoIRcRouFWvm+Adc+2QgEU3TTUVt45Htxs1deRlYLVsmWJDSlB+yBE1d8EMTis
	hsRw2ENtbsQ/aEOcsThOIBlCz3YTIsd60NKhmQLW/LrtqeRsqxxyDHI6DZyiuuFh
	bnFDOA/pZl0u9j+1POMi9IFPkSUJtXFIb2ALMoTSXIR7XePNV9S0FLNs5JGQ9cmf
	XJnjtw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015c24e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 17:14:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf335549b8so3932535ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 10:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780074886; x=1780679686; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=;
        b=b2ceVlE8FnqPL1wL+KL1Evccm7wC0b7Sb8Kx/DsLHZPMMpUJlTE9WesdphZgrn2Fw9
         w0bnmxUz5ULm8Y5b34ggatB27qR3qT07qpjR5PmzJdEsGl8eUeqOZ8lC0qqjz76KP0UX
         lNO3m6F/xsjmGMkVlrjpFqDmgYh6YORm7+ZFGE6jvZPjGhkU4emZSY1xmZVyNna6/zD2
         Bg64aNmB82+AgMbW1ss3u/ZE1UwxZw2MNqhxLSQw1ZYq/E/QMgkwGxkDTco6HG3uVJks
         SftzaRJRWFUUHspvZqDrUKIQYfzaZ3yQrAhscfV1bKRXbO54TeYO3hLWlYxDveKIiGsQ
         SyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780074886; x=1780679686;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lJmWWWcIH+ma7IFx18m2vogfRXpnULCsTEE4DquBRew=;
        b=oR84cfYXkEQB2Ry8eHNz/zYJsh9Rtwil4BBapy/wpOIeW2MkDVRgtXcrt5yHm9QgOq
         FwCOVKLCmLbeJ3iDR4BerE67AxK9DYRk4KfNPEOVBZrdIrie/vpFFOhjYJZaz0Hq+qTD
         SzqtXAY049Oz8f6DyNtvuX0OYLkbElV+iAJ80rs6VULOOwiz8h3OaQ99Ygw0a1sKmN7e
         A7/yr+zmgRR1SIO182oc4Ac/7PeC1zqpCLXPU39GqAHt0X857P+Nh7USVuT8Ccv2XSsc
         lhqzy9KwobqStToOHZy+gwe2Nu/TVlNoFA0kjh7d9T3PSBb8NeHO4EQkF1bJXeRg0RUM
         7Xfg==
X-Forwarded-Encrypted: i=1; AFNElJ+PYA+b4UPsXgFPQVs+tOMrdhkASw2fA+QxgXAT8w6ng5o7VRBwPI8efuWLOtqEv4MV+0New/8DXRUphb5JTHas@lists.infradead.org
X-Gm-Message-State: AOJu0YzBz0p25aeu+1sT9vCCUqHjUYMWC4MN8lxxKA/3PB/k88COkvNH
	9ldPXE2SDzKV4HYNgkjd8sP9uKESOS1bFsTRwlrKas8teb/yQRYLSaUunwo67Y6oGlGpnAB2+dq
	izml/qCYhk2sKAyKMupBUhBXoXGBArgxvNdRGw1c1+IalrxsWUSwhitIeqmw1GicLLoq5xxoxqi
	eJhA==
X-Gm-Gg: Acq92OHFFsMQsYzQ7IxNtgPFARS20IiBdRXBN0DQlP0yH7sp6L6XUq+8PVZewHLmrUD
	4KuwQ8XotUERCi1BkSwP0T2xxOoAu8g914eu/rbhHwXayGB/8f4VkcTJMAie1Q1YRxb0VO5hSkW
	RR+FKJiaJ/Zrl10s+i8j7R/+S8E/q975745PXx3iUQEAeC5R4x9plvLgiKq4erCDOVUN3fF5M61
	SwAYqoiT1DjT94A4cdIEi6Z9OmDVJjgPIWVyS5kq+m3uY/uVn5pcRNpRtXDbTHd5tTczO6g/Ecd
	prTm02wAwLDcDkKj7l4D+hThwuOqYyZJwkuzmEyaNk5HFa1X+5loNezGQM2H6xnb23bYp4rhRe6
	4tbyLLuYZz9vEZWanr9jM3IsEFx546yb56cqr2ZXQ/sMROhXDxLh5Z/DhEpdl6cA=
X-Received: by 2002:a17:903:2450:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2bf368383aamr8593275ad.31.1780074885585;
        Fri, 29 May 2026 10:14:45 -0700 (PDT)
X-Received: by 2002:a17:903:2450:b0:2bc:a577:70c2 with SMTP id d9443c01a7336-2bf368383aamr8592825ad.31.1780074885113;
        Fri, 29 May 2026 10:14:45 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.224.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a00a53sm35627145ad.27.2026.05.29.10.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 10:14:44 -0700 (PDT)
Message-ID: <051b9597-873c-44ca-b7a5-29efa795406f@oss.qualcomm.com>
Date: Fri, 29 May 2026 22:44:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 8/8] arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add
 DT overlay
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-8-645d2c8c75a7@qti.qualcomm.com>
 <178000744162.4557.14613962845288279527.b4-reply@b4>
Content-Language: en-US
In-Reply-To: <178000744162.4557.14613962845288279527.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: c1sgF1yNL8WUTnSi9hZr8d9ULp7coi7v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3MSBTYWx0ZWRfX1WocCIzu4Urm
 1cnBHbS7tGhliZzebOXifAGBglZgTI3WxhhkLLeZgdJiRL+r8oppbSpbYsCxWickjr6W6qqB2Ra
 2zhT6mfuJ0j5bvrkNzZRk1go4jXoD7Ioul17XEfVpCZN2seO1mCwknSQkET8xzdcKTiEwTcpV5y
 rNfLeTe+x2lbg4/XmdwyTJ68fQxjS/H/SkNjchBFf7CQWETyS+ANz0J+zlxYWmgbtIVZjUKyLJR
 dRWgVxIlGLp8wWEisArMZ4d/QO7N1uG8+k+fiJK6epyKLq+AfYHdajWqlbTthe5z+5hYj21YGL1
 ITt1NuygOAGHTDNJ/YVIu/74PL82tnk3a6b8L7i5WtnaSxGSubJeSFiKxxkFEbadDNlLIPDqac8
 kRkjcfBPUc36qCsKsZJwByoFVXcv43O+7MKG0aOnQFaY7zuSbbwNmYgaPKwtaaImrgrdEdlX+QO
 X+D0NM4+hPlraWJa5dQ==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a19c986 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=tDSAgCU/rryVExTQDfsVjg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=nnX9c2Y5NtHo51HYM2EA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: c1sgF1yNL8WUTnSi9hZr8d9ULp7coi7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_101446_989862_C7CF8875 
X-CRM114-Status: GOOD (  13.43  )
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



On 29-05-2026 04:00, bod@kernel.org wrote:
>> +		dovdd-supply = <&pm8150_l15>;
> I don't have your schematic BUT where are the rest of the regulators.
> 
> If they are absent or powered by the daughter board, a comment in the patch
> would be warranted.
> 
> Same comment for previous patch.

/*
 * avdd and dvdd are supplied by on-board regulators on the IMX577
 * module from the connector's 3.3 V rail; they are not SoC-controlled.
 * dovdd is the only supply sourced from the SoC PMIC.
 */

Sure, I'll add this comment in v2.

