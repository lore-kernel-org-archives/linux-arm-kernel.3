Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF05CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 06:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=; b=F0/o96WR6sdfLKtzUUkNjvspaE
	r45ULy+NB7WGxpmt7Rx1GhE90coJG3NARdE+vInazUbnWng4MAUC2HsgXei6G0RUKUqM2Fp1t2FU9
	Vh1LCTVW4/D5m3GRWWZXuPe+Vd8OVnYQDNbDLJwRKRx5DW+Ngj6/9Zm2zRTf7v/hcp9uAwb91iKnT
	4bUbVSLENvt8cRs2udiCOGfcuC0G8XoeopVswmvvTtJXiqGeXrGxF29QvlW+yGikRmPeH6VjC/trn
	R0vU819qPZX1IDiNNk9eqiFzfbzOhnj0kUQO4ghTwgqpcM+j8sUYsDtoEYRJHbUf1txWisTZ9P6Ip
	zPDjMAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwOP-0000000AE4f-1FQs;
	Mon, 01 Jun 2026 06:44:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwOM-0000000AE49-3aI8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 06:44:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64VLuoZi2882669
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Jun 2026 06:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=; b=TU+FSvQT2edVb55V
	Nry2/mRwkVZb3mVd0wwM8wR76ihIHoEdAZZZN7x2kdQ+f3VcBMXjPd8oYnfluC0a
	1k75n5F1ZRr7SOwbZHq6JmarRR7aklFuF2kSLc/IheXzjgYP88mGh3cNgu8kpTWh
	5Y2vrsnXYghJOpKYstVqahN++SwR6/8WsESZaELCZKdGL0oqp9+rNdfBnIKGzmDt
	ObopznuiINieCCxjglsyKI56RT3hRYPqapeYDL2QKwuOj/6Y2ChquD2/QKeRWOPz
	FsZKQer/yYRTOULRB5xkWUT2dU22XXio/Y2y4ekSrqqzD0a6PBB3Hxzgjg92weoX
	yiVOjQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efq7fe898-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 06:44:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c854c4b740cso3300222a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 23:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780296292; x=1780901092; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=;
        b=IrDALCOFhmIPcWHJPdR9pi+i4HsXhTbTYDd2KnQ6FPz62UyRIuqbPj8pacUHDVOcjT
         Vr2llMpUtrD3jJ37FTWA8VRzgHXYtLyHkhc+iu7HrRYCriyfLNRXk++fZ//1i4lK7TJl
         5vGIVD6X2JQpqD20GSwdi9oVmBT2O1/JyurrX/wQ3XB6huwBHcj9XXLn2hkGdjDTlBVZ
         0YDJMhk14fjilwVe8adjqpTKe1O49XDIQov1fXdIcv4zYfwSoKkEJyp2bVXTAY/0K0BD
         2fauLNYdFOe5RZEq+Ulu9+uP2ezQXjwMS4U8/bWpXoKVK2JucnX8pEqI/7ObFL8JTnIt
         EJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296292; x=1780901092;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YReajiWcbAxJMnTTWrrh4k4vj1KQ9dbj1wfAMi1XLpA=;
        b=buiNZTRvpAK1zBKZuhEECqnY1EdeU7LBilczw9M9J3LhwpIBQylE8oTp2Cij/BCjpC
         gj2i3lwZhp7o9C060zzI1Dn4sRS/EcYWGM2vtjyOfCgF/m++Lt10eUZOY/9J7er1c/Z1
         jbSsTPVPpXlcgormpquXs3FkRqeyTC47EEFQt647bBNZdQ9eMFgy1PUoztaEOtb4dvlj
         tA8OAYHY83FNAR6c/8C1339tbEivDF5zkH+YJWM/LuHQf/j138MH8bntQmGpLQIJ/jeZ
         9ELKvU9zhJQX24GFCoDLqb7QgJUWH/zm6maxw/Ovd/fl6zxsd+nFJ7SXsZ1jcRtdw3yB
         7Dxw==
X-Forwarded-Encrypted: i=1; AFNElJ9l6uv7nWAUClL9n6+h1xzaHZ4FvhYgUIig+B0jCYIq6xR4xeaptL8vaiEuQvaDjRbc3+5CJ2H0XL6/Pl8Ei/4t@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjp5yGz8hYJ1diMpkOMorefPLPQi7OZUoyll0jM0/Ge0cPlL9D
	7XLjPPMWjva+ka3tRaDc6JNy4Bd7kjtcGZ1e9CTW7gCloNsmvHookYCDGug9Vtrpy1AY2NiaEG5
	pYippspOHt98OPj8CJzNbgu9GqQ3dNpbQ+gCfkdwS5upe4ZVVs29ViVZ3UL/AEF3uLfAnU31wuo
	LTuw==
X-Gm-Gg: Acq92OHC3IHogkP8kp2lV9VUK3r26RsJAWJo7C34/dlNvtQyt35xq8rB/AVB496g3NK
	/YPcDgMa2JBlB7TCk3sy5B84i0ofo90T8cvbpKwj6XaLrZYPJ2DwWw9q++GIOAjWUh+W1RAVeq+
	XVU6Ttti1y2YpfKJdPeCv1NJyyYBGRvGOu3+skSwBUimW2k8qpXnqo3cvrDaWYBCWX3mep0XJN0
	SfDEm5Q4Eib8lx+xkYyrkNJITVm/wwc4sjzavzkQXH1aTEfLJOLA2rjIC7V64lMCzJ6HfX5sf8c
	Wext+JPkyVY1tif0x8KajANuM1e/ABH40k6QiYoxVsb1/bPmOLWgslubKJhoYsThcKxz/SNKJL0
	A2Xo9FbHASgiG4QtEut/NRa92mjFi6otg972q96LikCbGCVX94KzLczpSSIcoLw==
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr9977795637.17.1780296292504;
        Sun, 31 May 2026 23:44:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:1c8f:b0:39b:8dcb:f37d with SMTP id adf61e73a8af0-3b427eb0f6cmr9977746637.17.1780296291949;
        Sun, 31 May 2026 23:44:51 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423ea48bccsm4142372b3a.13.2026.05.31.23.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:44:51 -0700 (PDT)
Message-ID: <145b763d-49f1-4412-95de-76c22a81a728@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 12:14:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 1/8] dt-bindings: media: qcom: Add Shikra CAMSS compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
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
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-1-645d2c8c75a7@qti.qualcomm.com>
 <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
Content-Language: en-US
In-Reply-To: <20260530-lorikeet-of-strongest-honeydew-fd9b16@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Y4DwUoHq6ZRy9qFP0kui0A5nA-xdIiYG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA2NSBTYWx0ZWRfX+xmPjfu18Je7
 in92ZJa4p4Je7BmRtErPdBoJM/gL9pb+hf4XpikxuNckAa/kwPhFBXx12Gu+QaXaQWHxPYQ1rZh
 YH67euLF+HQkQHswYe0IP4bCdMjUC/dM4flku2IxQteAJeFj/YmZX7EzDkFzVHbYrK2spf6eyd5
 OzXBmFE7CS1DhjkTOorsfPmQnprZuVcORkX5WfRvkk5MQY6V5+PSsrXIJ47R07SyVgQq++ol1uR
 sgXaDrYZ5aeuslmHeX62SqhxQIhTw7/flJC3ZZtcaO/HHZwZbCGNFG623uibbMwwEetLPZxyarU
 6ukU+Nw3xhOIef6clO56f5Miyl6RKbYKtx53ohVl8sCxcG+mKGtXDyhXISe3B/z3RZYs20r/BK/
 9l4A/uOtuaA7eMSqmFFJIG7VRXcSSkzCn5ozLAPfwG2loVZ9gLnaYUhLMvPwUcEsMCHY3inObh4
 eSVlCbwjaFDwy5iy+Lg==
X-Proofpoint-GUID: Y4DwUoHq6ZRy9qFP0kui0A5nA-xdIiYG
X-Authority-Analysis: v=2.4 cv=XqzK/1F9 c=1 sm=1 tr=0 ts=6a1d2a65 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6icYdhiYefjo0O0wKhgA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_234455_013760_0AE7AFD9 
X-CRM114-Status: GOOD (  11.74  )
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



On 30-05-2026 17:04, Krzysztof Kozlowski wrote:
>>    iommus:
>> +    minItems: 1
> No. Same feedback as before - you need to describe now the items if you
> claim that there is distinction. I already pointed this out to Qualcomm
> at least two or three times.

Thanks for the review. will fix it in v2 by adding per-item
descriptions under iommus.

Regards,
Nihal

