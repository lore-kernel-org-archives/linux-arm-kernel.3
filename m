Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09BECC6B30
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 23:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ReKVbNx+D5AMrmxj0HiDzNjMMNMqfQtzg8j7u13LE9k=; b=AceBa05zBuNNUMdUHDPM1ELwYD
	ZWU76B/qF7lA8GVN6logCt3dL/YR1WyD5nLhSwTobO3AKGvQdDIojjYE6MEF11MNKPBSWttQotyQ3
	b2LdkUFsP1tAxOfAYCHF5exAOoOaJqFeEgNVI/hDy+zb426O7ocbbJwXqxooQhbHjwT34HwShmlDz
	rBjDbN230NhbXxaW57pADH+S6738tmMbrVpZ33V8RiCUq9nRmt9D7dPr/sJIT99uuePvLSf64HrR0
	Byi1hvV7Z1gex4jtjfVacrVfcElApxgZ7TmF6lzuLidBz9WHM1LCTB90NtU3EC0+WDc3A8K4wYIs9
	oIsZWOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8g0-0000000GSmB-1gln;
	Wed, 14 Oct 2026 23:46:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8fx-0000000GSl5-2EFR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 23:46:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMXZVs644567
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 23:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ReKVbNx+D5AMrmxj0HiDzNjM
	MNMqfQtzg8j7u13LE9k=; b=O46HmpVJH9qI9Cc9w+33CO6yrWJ1EBw2T2z9pILQ
	Vh4AvXalBt4x0JsyiRg1RtPbCzoKDNZm+GzJRjwbIDX+gf2xYpNGMB+1mHxtzPk0
	P7/80k4m4HKkXINqmyQPdWn0BKSxPZUlVdjJpn8aChpLv5AFvvqlOV8PAop83o0y
	i46jyUhlJ/zq4LGG+MHe60GCNAclB56uAJUrgf6LRmaqJSJDYCsCrp2jqWto/hrP
	JO3HL0jp9VAEUNU+pQYgZdxCeExA36f6FabsbimVXTdpKslfgCJarrrr/8qXhwFJ
	vMTIP4UXyomjpEp7IAiuPUkjHOFKT74/8muEUeqSw6kidw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy86e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 23:46:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e46c120dfso127989885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 16:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021583; x=1792626383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ReKVbNx+D5AMrmxj0HiDzNjMMNMqfQtzg8j7u13LE9k=;
        b=bkVtlfBtCQDjoyssGrNIcRnwWFZ/SvA4Sj1fTMtjjuOd4PWyApCG6nN0i2paTUyUhQ
         BTAwYmEdxTOREp9pMZ8h4hJrLDd5zyFlA+eSnJXgynx6n4RO3sEgb6HeejwVjLQm5GYT
         EpFlGVKQUSR5mK3HD5qoe5QVJnQLESM0IELHimdoz9zlRw+iLEgXQb2mjzXZr4ZHMaIq
         pXuO+kfSY6s/GSdX5HPVKFGpWxP8vO9s42gWbR0fhaVGBW+L2zyHKfb9QhDKqxL/G3OB
         9ewWoC1x1PN+EdZHvE0HxfgwP1uHIQgBc/L+wb6FcnWHAXS3f00raCM4ut0ucIe0KXT4
         ToUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021583; x=1792626383;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ReKVbNx+D5AMrmxj0HiDzNjMMNMqfQtzg8j7u13LE9k=;
        b=HGWhBrvvg2e4X1/GLdm00gVeDrp6lKSdowjdIR2GPmag0ibnNFLi8oaV0ZKQjs71GN
         fbedxmZEAkjj6/9QqDR0bdRq56cB+5zDNTCBYFagT5vo/sn5vE82jT3+DOtjZHGUegb4
         52ZEDAfdrgSLdoNRDwhv+cs1942SU02BySdfLR5XvZOssNW3ofm+EqTPwt+J83wi7CLk
         xxlCFcqsxxLZLNvoQc+6CS+E58zyaxXQhPbBGyYX1VeadD1pypmH1QL2y29drmjXP+pC
         TAcO01I4PxIZuClKuxMFDiGaw3VakjmugM/W3LQq6noayfU5s5EEQk0S6Fw8xkqZe9fj
         GmAQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2DR45+YI4bTXue4pnG+tHK902drsiwt7zwzn2jsUmcypypk113lYRA+92oeI4wSgp+LGEimNeV5dc1vzejB9e@lists.infradead.org
X-Gm-Message-State: AFq9FYJJw+RAkJ6ib9id4+Kx/aAHGkvn/RG+xRhfiFmqjR+TVCpGbm5y
	JW8cIMOmQjMn+Fu9tKjIz3pusdNgpT2lxrbi6IqE+VpJznUKyoOqHjJL8vzG7rSqqbWeumVyxvh
	HF0m5zV6/ZIZGw0lz70T1OroxoQEQ2yf/Id8tlwH6WefEK+D+OIVv4qy19+Sp6LNkqT1JiHYJCH
	17Yw==
X-Gm-Gg: AYBFou0HEUGEDK8MkSeSW4c+AJJ0njjEf8FePrI9M2yRQ7+12bBnkxH5H4V1xH/AGEG
	Mgo495LFFvahJKKXKc/r28glQkxbp5ksEfOyRQT+dN+2Bzvb0fmojy4hOd1IkywRsaClqC+GgGs
	xFjbKQV21xKTnv9tr4H3nkk9VNagM4yRve2+KKY1XG7Iu6Z9pg3BOWSQiTP5K5kawI6bTPUtVIY
	8Cs9muBvlKiCjo5tiKQIWeLHo6SMmRlWCS1pHtTPhfw+edVV8LHF44T17vV1pJTM15LaLdXdzpm
	37Z76JI8VNqU4a7Jx/0T42hmg8u/7A4QIZcDEb73DkUeqDdZ8Bggo2ogFhhjP1fQHXgryTB4OpG
	PWqNcJzLQ2pROMsmLZThSH3S40FYm24REnlxW30Vb7+mE5QaLB+9JbAOxxljX0aqj6LW7raIqOn
	cfiA2Uv+97hMnL
X-Received: by 2002:a05:620a:4693:b0:93a:9ef5:d370 with SMTP id af79cd13be357-93ebd0be3d8mr2916450985a.1.1792021583028;
        Wed, 14 Oct 2026 16:46:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:93a:9ef5:d370 with SMTP id af79cd13be357-93ebd0be3d8mr2916446585a.1.1792021582503;
        Wed, 14 Oct 2026 16:46:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d90ce5sm957598e87.59.2026.10.14.16.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 1/4] dt-bindings: connector: Add DP AltMode VDO
 definitions
Message-ID: <otk44i4caul5k5dhqsprgmv4hr4jrvtpq2nhcyhgc7ngul5iyl@jmz2ebrwhcgc>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-1-b657c9b6e4c3@collabora.com>
X-Proofpoint-GUID: KMex5zCMHOoGvHcWv_ydbddUxuA-8Hna
X-Proofpoint-ORIG-GUID: KMex5zCMHOoGvHcWv_ydbddUxuA-8Hna
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX4MijV6nyTqe/
 0ExSbSdTJ1aImzwLRpQXOb3tI10JnPLct9SmipGDCS3rM9ICaValfWF39DOZoIXpp3sbh1I13oP
 2bBWXzW9aX1Tc5yOEaLkxwA9FsCD4as=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad01450 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=YnuTlg8LRq0IA_Y-aJEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX8PXtYxqwrJWE
 63hMzEGPsmpHF8MvcnH9nMjE53rw1UXh9VOIpMizuMIkSu/RXSd+xDkqlW0bt3pGWiV0Y5O3hEt
 bRJL/zJYFbXrptmXevYRaYRFz1YjbsN7oCdwoWZTjoGb9kjX6SMllEZSNd1mnnM4YzlitUPklXn
 cHlAiLimIR47iliIlYUxn0wOXoqVVgxT074u7U3Q1DZNiSCrqcVZt2HUvD2e1Bq1VzdarArQv4g
 HleapTNIUt7CwnQSmgALUkumTZBGQyI+GOFci2OP0eSxxPzh0QEDARTEvKDtsJUo8EEdqOERq+G
 249qws1QirlX6nYTFcPfCOfhc3WSxQC7PlZv9eSHUuhR1z3iy29qfXijqjPyHzxqyAwBQ7nQ5ow
 Hkk6u+YRUzMS/ITMxpjpmeo9sqWVfIaZBrX7gpm1P31VdxnoMAxHapges+cqt9zq1NADQQHWf48
 IWoarJu6FFe/kR+kYRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_164625_605659_6C2DD5EA 
X-CRM114-Status: GOOD (  17.92  )
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

On Wed, Oct 14, 2026 at 11:31:49PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> The typical USB-C DisplayPort AltMode capabilities for a down facing
> port (i.e. sending out video data) looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <0xff01>;
> 		vdo = <0x00001c46>;
> 	};
> };
> 
> Improve the readability by adding defines for the numbers, so that
> the above instead looks like this:
> 
> altmodes {
> 	displayport {
> 		svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
> 		vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
> 			      DP_CAP_UHBR_13_5_UNSUPPORTED,
> 			      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
> 			      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
> 			      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
> 	};
> };
> 
> The generated DT binary will stay unchanged.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  include/dt-bindings/usb/pd.h | 58 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

