Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B40C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 12:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=; b=1KtTGQeNGYTQAuMARufaraupQP
	pM88BKVdF1JeW7OoyLQFC8bZUJYc8fBAT6TZtbMFtJhBnv37DlAOEvyjZbhUYULBXctumGe3aajfy
	ipVQ63Q7U5meYh7AeYHLvaftK/r+pTHhOWWWhxwxeqp9/GDh3WgISGDy+dEr3ebJT1TvOwpbuE+wH
	48woZqad/z6P4vaIp9jbv2i8uCC/1ktVLgu7MIxmZwGHeAXD1bbiRIHc4pir/8QUKZIZWufuV+Bz8
	xEnmulCTqfAQrXmjL4Twmbh+rTak1uqXvWW3Pa6MOMZPb0XUNcyh24E1gS+P0waPv4IbYoRgoHQOG
	ocEHrjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ6Z-00000007wll-2XNf;
	Tue, 18 Aug 2026 12:39:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwJ6X-00000007wl5-0hmw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 12:39:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABH1i2057011
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 12:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=; b=pKBb45U2+vnbALE9
	T9REZMDBdt+HZXDwcf9E7+VxNpU742Dw18fHiDUUwG/3JchFbQ3htS/1AikzeoW5
	dIe/7TPcQUOP0GoZXw2ChP73kt/2ELTfCvLGgf/NBRoNd3kejD1Wyix/hi0j10IW
	P98CwsFJ6EgJYUfT4ouAohgAmQWVCeKXeVwXVx1nXUNGgAStVis0dzBgfdpiKcLe
	LS6nfgtcjqD6PDo1j/H8ZcIVvYtCJZlQvoguDX1HgPmAwtNSuCYI8NUCnIFbuqGV
	CmW0ZcNWGDwQ4zR0WJGBw4Ee2oi2g0oW0/WoAmwn3nBPMMxhm2cf1m/X56PIxFcI
	YhuYYQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4frmt3vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 12:39:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9349ba88188so118182085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056784; x=1787661584; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=;
        b=Ab8vE06XNvJ59Aj1J9HjsK1s39mync9gORu/cEPSnE0G2rftgPOW9yh7QUw9EYjXZG
         f+aSpeFrIEKkJYirfUKM2iczx/QKiSMdCGzknwsDYH88RF3P105rcV4qf0VxjwWfa33x
         XHfazqVxqV1w5Ys4MXjYcj7Jjhi5Hu+X6RY+kdfTnats+xYETdWs2ONQKlD5rhtjxaJR
         yujI72Nt2terpT7Ew22GvcNRzJV4EHmErLljVdnY1IiQqSKCB6Y6CLyIA5GqMrN6mryo
         NifudS+gYN0Oj4LBiwKNFqiC4/ub6iPIsFDGnepvmJ7QrhpSsoYaPrQGnqXZVgzn8AG1
         C1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056784; x=1787661584;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Q34BQFriJoqeny7dSzYRpbECgzeFeOr1DQ9vplIGuI=;
        b=R8rFAbFabqIham4LoNbI84lCaKwgYAdbm2P0C4/AiQPTBBOJ0SBR/1U2OD1uDSZYZ4
         27zcqQrxfRNWCBrwaAzUp+zrR1k3YqPtnHNLGGfr+0fcbuZ5/PrdzB8HxzFe8mOIIe3N
         daNebk72D1LKjyUH1QhMowDRh6G1kxJyoLGqmXzNoaVwyfhrdSsdbW12I3iGuV3dljxg
         q/6nhspBf3WbWbij9cC4I0OJ5T2/P9Uan1pE2qdw35MUe77ewMkeDtNc4+StKrAUrVO/
         Q2G1oTZHSA268nA576Q7k1TrGZ3yMZZ5vyufHzswM9jCm/P+M0MLdSiwz9N74WoID2he
         7ZkQ==
X-Forwarded-Encrypted: i=1; AHgh+RotjQ49qEKCe17mUImADMkQvRJjIUOMcGV8bde2jZpFDFfXOUY8KvE6sxAu8FJNuey/bf2Hapr6Rf/o1Q006+6C@lists.infradead.org
X-Gm-Message-State: AOJu0YxHRYJzB/anOXfIPwUUglcF1oajMLWMCVR9CStyRxqFq1ZtIH2v
	VWEykzyyX/+o06U/VBsH0lg4BANwiFlam6Fr9vQcNtwzAgc3n7/qmqdXP/7GS8R94MrKXw6YcC7
	/TjTmsuVbz8hQIVPi1uj0QftL75aCvyVSjThCha+syWQqtwD+XjBjutp7DHTEMaGac+mz+2ZYZG
	seWg==
X-Gm-Gg: AR+sD10vccI4E6gq+pP/Gmad6l1VhZDmsMiiBBdh2XivfJKqGdN12gJgg78xiEq9ej4
	x4VEY4FLwEsbKdLqzNwtViaRRQOxaFLpEX9A7rv/BtR0yUrWiOX52w/xW4qja2U/Sgnf3f2iADg
	wqdDyeFQUeicB1XRR7kvp7f+0TXcluO+WxadsDLnMGzingCuvrg8DQ7lQctQdWFjQ1ZRdGm8Sq8
	6Rx6lrn7LQno8GvYBHPGt3Vi2gAIXYk/S2B2+OWb90emrSK0oNlRCUdlPW3Q/Kr1xNI93wYRTXv
	CwWRN++xOZJ/IEwp9IKMepVQoxJVQrGVYXjJoyqc8ALshqOmfikto6MVeV/IKTqvOHydnKf50HE
	ArmxeMsOGCtBAYgHHhoXh+Tba
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2353626285a.4.1787056783609;
        Tue, 18 Aug 2026 05:39:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1a04:b0:92e:6485:f640 with SMTP id af79cd13be357-936d261aab1mr2353623485a.4.1787056783103;
        Tue, 18 Aug 2026 05:39:43 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2187c83829sm123750166b.41.2026.08.18.05.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:39:42 -0700 (PDT)
Message-ID: <950bb08f-201e-45d5-9695-5c55e1e61c16@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V
 output supply
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260812-rubikpi-next-20260615-v3-0-06e21232d8e4@thundersoft.com>
 <20260812-rubikpi-next-20260615-v3-1-06e21232d8e4@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-rubikpi-next-20260615-v3-1-06e21232d8e4@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfXy+U5oy61Ax3M
 yxyF8pVCgcugu/fB2RD2g1XuXa6EjtjxkmI3qXxEjekCF5+VhiwwlscP9h7Igp3J1uwwwrzSPQZ
 mxJLuSiDVrpL7F+Nna5Ak7uaIkRLVGYSD7MnSE4cBoop+4n1xP+YP6WMVPnAm6/TbKzqBnjuWPm
 7ZiAFx39F93Idltb+bdVxhE072CBK8uDBZp4vLbFj9MQRNJYrOiUHVc/jVb89/RPPE0dMt49szk
 vPhGiTex5DGFDQHruEVMCQvh2OY/VVIIozIKUgpgAptFTtXqov8FDs5dP6RhH8G4m8ZD788ObzL
 +8GqJMgDYdsSi1DLg/ppy40ocn4MnDJZVof/DlxMMTbr/73l4XW4sGqAdGrqGRoYHRzzS2fmdcp
 DH5S10yWScnsh6ad+cwJcwVPYy7u2mZ9mr6eZzHw6wdCNQn+A5xSyHpIl9QjcuRx0RR+QvmNtLl
 fjQnTU4KlY8kDWTzHIg==
X-Proofpoint-GUID: MsuVC8aH2UCLX5ldn_Jq4f6J5RpmVhu4
X-Proofpoint-ORIG-GUID: MsuVC8aH2UCLX5ldn_Jq4f6J5RpmVhu4
X-Authority-Analysis: v=2.4 cv=GtlyPE1C c=1 sm=1 tr=0 ts=6a845290 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=Wdb1h0LgAAAA:8 a=EUspDBNiAAAA:8 a=XGAgDj9QmdH_QUsWaD0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX5KJXB8UunM1e
 Q7H+Nr7XxtNlwwIaOr1NqaOmm38gQqsZEWgfilWXvFnSMsiPbsxHXBAT9Qy0nljuP8IbvywOnTQ
 pRI6eR3CRPV2aRwmKFZgvOcCjgWMAzE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_053945_215699_4BA967C3 
X-CRM114-Status: GOOD (  11.02  )
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

On 8/12/26 4:22 AM, Hongyang Zhao wrote:
> Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
> supplies the two camera connectors and the 40-pin expansion header.
> 
> Keep the rail enabled because expansion-header consumers are not
> represented in the Device Tree.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

