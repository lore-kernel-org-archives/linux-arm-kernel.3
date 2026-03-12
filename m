Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80565106ACE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+72H9EwpwHIiHMhfY/D+/DjdblPYpP/OetfHmb8NBZc=; b=r39D3vURBlbAopu0QUb6UjAjNA
	oyHLvm7sUKf5pYPjGY1+xarvyMj0zolLk43AV4Z1vYJXATypXkC7/9efN+ORcVTUEr0NGfmX00Oy1
	FIHIr8BG40kYFniwwVryOvIazbMhjfCjwR3pzN84nwFkfMc7ltgmEGTfnCCY4wJUKzNTkVSthsNuo
	23tEWHWNOMpb3MJCb/qWPGw/84Jxc8ZwUSvky7Yz2grbRouiE+L7LfWbVXZUNrPE3IgfEAU0P8vBy
	QSg+h619O2cDF22JDc67YzqBNWuhUndfH1PymgIMNKOEtxegkLJG3xuCFASKcNNNCEYqi2KYYyrlx
	Zozk5zig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lhB-0000000F61b-1JPi;
	Thu, 12 Mar 2026 19:27:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lh8-0000000F60t-2M1z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:27:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAQa4h1757894
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+72H9EwpwHIiHMhfY/D+/DjdblPYpP/OetfHmb8NBZc=; b=pF+KY7thp3KFqlGw
	gw/5pbZ6oezTF/1/T6bOCslrD2bFU4oKBK7hFMNjDLrj3UEERoMzsdiBZWTcDr2f
	n5BcsJhFHRWfPAW/t+OQALZGQh+IRjyxSemCUgEfc8YQpLbLM5gTkqvNAb0IQpj6
	3jZRoB3ISjyAQiO4GWpSgAAegLsr0GCPki4WL5AfJpXpRr3q4yoBjVm1OLvxAG7p
	5FeL7VXRGBoDFi8wLFTqs1ADFQxJS76d1fmFZyOK1er9hFH8uj8eJplHiJ2bnEVe
	OBDG2etJ8DSgQqg7JgGVZKTgwE3fM3jAbDTGQlrjeluOPSTQlvI8jNGudlZBPjq5
	I3e7bQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53ka9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 19:27:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd773dd409so238381285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 12:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773343661; x=1773948461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+72H9EwpwHIiHMhfY/D+/DjdblPYpP/OetfHmb8NBZc=;
        b=BbSYb6oUu4IxURZn8PCMoj5AGrJXs4aLAR9ADK6IM1XdeJ3v4BecP738rk6rBc1PFE
         KtGMHAngEoqZ5IuQOjPw2b5m6yPGPnJGvJFq43ANQN0AOShsTJaX+IpHOnGU9wrfi3EV
         YB88gD3mSUW+BXj3a09Ti5ScHqJ84tB1+bgB1CSoL/jd9NySVqktriyZWuQJvusZh+YO
         PeQdWCtnS+y6iKdpim3AVyGPvTHNDHqKB0gL1+dPYT2bjCSM54+IpOSdL5/fiX7NGAzR
         bCPlBScKplBaPyA1cB9QlfpaL2IzqgqFZ2pcKY4+gjCHufbUGcE0O+kyUwaEKquCfzK1
         K0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343661; x=1773948461;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+72H9EwpwHIiHMhfY/D+/DjdblPYpP/OetfHmb8NBZc=;
        b=AaqKm7s5gZmLyMUiuK4jXt857TLesKaH88zJ25nUZAxs4yS08MnUsTYBi8LNmWXz2R
         Koij3GGkKh+GowOLWO8a9oAOjwSPDuj26sPkn6yHdmKU3SGAQHTiWFN2MFCyt52r1vya
         F7G4piHoRNUCScEMEFe1szvB66Ak2JRE6F5gJTlgs+zdtfRMARKQlSxgtrBVmkGFKeWO
         ApR4hClE1VLKP+90y7NnErSDKsx+friCstYTFFHRDPG3YNh48oNvWxJ1QUCtzWipOods
         i/4U8vLvKRF3RxsFeMxTVN3i/tUMmO5W1bR0CGLvtw7OPeVml/RtFknQN8bWU34YdKO5
         LEVw==
X-Forwarded-Encrypted: i=1; AJvYcCWKOBuL8G4fohQO3xz/JEVcZpYyakoPxbyGZNdixHJIkv/hyb0KfyXG+OCl9xE2t+t9YNaD/ug1eSEvfsu1+n8j@lists.infradead.org
X-Gm-Message-State: AOJu0YzDirnwuz8bG00EeWg55ZMQAxqpdQI7fBUvjThn7Zp/4L6tsF5y
	iGUTJltT7zW0i3sJmQfFgvKiXl4Z7PmEKFOJRQDkkXCSnMTWCMZICjyOkM6d+glJiiJcDBHSwWY
	9GDUc7giyYGD3b3QZ5lTYQB3OG3LnbXfX2Q/Dofzt9Vlu05lPD9dTx2l6TD/CZCguL0fBUZIWbK
	szxQ==
X-Gm-Gg: ATEYQzzdXXNXy5dbZdzUbjzNyKJBAI39rywp/FuoQsC/wajldpd7t/uogCMrFv88hJO
	40UKagpVI8Ctopxy4Iy91zk9/mC2aJVMMY4cItYvPfYdP2vc0O7BLfaZCeVvv6MLHoLoZyFkSjA
	XlnH4NBJoXndeRWU85tuV2HjFZLb/sSG54hZ+79gi/XQcvjeeV105dpXZIbAD5Yd/Pb0QOPq3ET
	HPgg8Sj11g/ILMLFQk6cp+/BkXvCRnQaZqYZzjIiK7hOEqLq0VRlt22xB4XzovhM8SgfuWDjZM6
	RNPFVUwLON23cNBaLQtMzjduizOuELuvsgRk2YXzeDxVM2sfL3KUwgw2MofmVy3ZFKB1PZOFhTE
	YlQvYXs8eQN7GgJ3hqFPBGOx5+2QdVJeKCiz3u1QKbRzTWctR
X-Received: by 2002:a05:620a:4609:b0:8cd:b33a:9c0c with SMTP id af79cd13be357-8cdb5b05d3emr141743885a.48.1773343660839;
        Thu, 12 Mar 2026 12:27:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:8cd:b33a:9c0c with SMTP id af79cd13be357-8cdb5b05d3emr141740685a.48.1773343660386;
        Thu, 12 Mar 2026 12:27:40 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de47966sm146845666b.17.2026.03.12.12.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 12:27:39 -0700 (PDT)
Message-ID: <9caf255d-834f-4407-afd8-7eae9c0f3cb6@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 20:27:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] ARM: dts: imx6q: Use undeprecated reset-gpios
 and drop reset-gpio-active-high
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
 <20260312-dts-snps-reset-gpios-v2-11-0d5040eb4a1e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260312-dts-snps-reset-gpios-v2-11-0d5040eb4a1e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b313ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=0uu5XC-UX1W2kQo5SVEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1OCBTYWx0ZWRfX8LNeeONk7odB
 87CxXQb2lsg8GNrqY/2hsSnFgVJW7rr5w5wTFxb2qCrwKDwEJW5+acUIa08rKAidpuWsaRcUV6Y
 ePC4FnagwBcTYs5I6qcjSVUqg9Ms4XVyXszIc3RcAVwx+0Npo/rkqssbWkMpzM5cm9sl2H2s+rU
 QtLMX/Oj6MTJY5ohFPjurprGqjVQ9escNZuBHC6EqPsjdhNQZRQfta6Ay3bfh/0jnHbr/rwWcJJ
 nDGbJkGxzFX3KgtR7vnngDvAobn4xULjkiDnq1h0iAtesJOgMVWiOYun0ZoFo306BxL4RnCRrBs
 +WtMErpHXSOq3F7t9HkoFkZ6Jf4QtXoDsbo5ldXqHpm2bpRJ3gJgR/Qgt0B0ctzguIMhKmkMo2h
 RTbunVUUw3rRvYw1nBT59S7yAc/1bOIUs3UEuYXIAp5iGtUVI6+ZAjZTZGSkgaChRyGE1lqLMzy
 YmI1Vo0W7jRO6dhRNPg==
X-Proofpoint-GUID: DRoqcIy7-HWIrkrcD41Be-ec5z0huCmz
X-Proofpoint-ORIG-GUID: DRoqcIy7-HWIrkrcD41Be-ec5z0huCmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_122742_747932_A69BCDFA 
X-CRM114-Status: GOOD (  15.67  )
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

On 12/03/2026 20:17, Krzysztof Kozlowski wrote:
> Freescale i.MX6 PCIe host controller bindings, through referenced
> snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
> like Linux kernel did for a long time.  Use the preferred form over
> "reset-gpio" which is deprecated since commit 42694f9f6407
> ("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.
> 
> Linux kernel already properly parses GPIO active level from phandle
> arguments, thus we can also drop "reset-gpio-active-high".
> 
> However this change will impact U-Boot, because it only parses
> "reset-gpio" property for imx6q amd imx6sq.  Intention is to update
> U-Boot to work with newer DTS, but any other out of tree user of this
> DTS which did not implement undeprecated "reset-gpios" will be affected
> as well.  There was plenty of time for these projects to switch to
> undeprecated "reset-gpios", though.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

U-Boot patch:
lore.kernel.org/r/20260312192605.131132-1-krzysztof.kozlowski@oss.qualcomm.com

Best regards,
Krzysztof

