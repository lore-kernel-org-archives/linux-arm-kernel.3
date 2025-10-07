Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9934CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVqmNkVuyqg9n+wG3FSRNwGdnQf4FyV3jtMEgH1StCc=; b=zIhaNhjStdLpUMqZyrjpA12jzP
	LlWMCeQfBf77nJ6lmCslc0L/cdg2bALsjEbrZCAoB7Gba14oyNCvLrRzMkn5qjY+iTnv956gusG/1
	kUVXA4emkv5gj+tYe1E1w3YR9EjjvC9t/lhuCZDT3UMnkXu23HLfRNosZ0C40knVJoqdeCOZQY9+Z
	Hr7caJbCQmfZ9vT56vjEidyckYR+PR61fCWyRWd9oa97CUxVzpFgFgZpwivJmbod5912YoPl29Xog
	vfN4aJcSqIrmo9KtscBeB1B6osKl/ar+2vAJkANhu87NtfjvDQwyJIuuSCQwGBJrqK8ikm4JvvHBA
	UHmzzsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64Yf-00000001ldz-03i3;
	Tue, 07 Oct 2025 10:04:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v64Yd-00000001ldT-22Om
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 10:04:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973DVPG013439
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Oct 2025 10:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UVqmNkVuyqg9n+wG3FSRNwGdnQf4FyV3jtMEgH1StCc=; b=kQzXMFq3dERTPmJR
	i3tyTvk7Qkt7984vJW+dXREFf6N0AEzJqZRFzLCx1jHzwMyGu7h4XDjnHv4Rxb9I
	YPFowLoQ8cwKkyQYS49ELr6a8eZQf9KIlJEwqlezEGztQPfABLJhh609toKvQ2Je
	XrZChq57p+bQtZdX8WbDTnmv3Pg/aEt4sbeCkrYFBbDYCs8Gi+4p1G3QHSAju9Je
	FRV6sZL/cgJIosLS0q2G5UdMKSCtmTNFxdrvluAMyDnTD4mg3PYlH+IbMvIjSrD+
	pHDh15VEWEVjz8evWxOg8yEXMhUeZABWg3h59UuBbEs4FW2ZzULmnrAu/GMpsnaS
	x650ig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49juy6xtg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 10:04:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e4b4e6f75fso17607701cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 03:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759831474; x=1760436274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVqmNkVuyqg9n+wG3FSRNwGdnQf4FyV3jtMEgH1StCc=;
        b=rkNkMUcPBbEWkVU/o0ONqVhmwLHmuI9bHAr7K55rvt86YEk33N8zGATNYhns+SewX8
         WpGiFEqwOE9I8t3q0JEZ4WX6Kec8j8s7UCjlk8nQhSvhy62t3PTrPbZAy3MFQfGUSg18
         gs6XFnPBZj8FsD/v7dMu6/11Z8WEN06tsBOK05OUHjq5JHTsqXXgEC6TdAjEyuPFXpwV
         OnwRZ1jEWPpeoYrWSBokZsZY9DFkzfJVotWQHPVp9Dqno3K1QqtCQK5DzGFpp4U/bKjC
         SJBHX2Zy2fz7e1Ao/ymGxGtv/5A+IGmXJWSqz4vgkxA0HpUBiQVMNjTj5BFg0WgDF/lK
         pkYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5s/ycwppU584DdnhEWZnl6E/OwBNrtFGCxAw+5sJhN9k3YkOR5cWXcOUWeOq60x7+5ZlZsO8q7/6OfW5LZrix@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9169NVCYl2x7rU3p3QvivCJrMBfTPVgLFS952atxgpa7yMTxe
	OchsSlKiD2UulpSVY3yWHv14TRHRnNGavPDznn6YiNO3US1O1042FO982fTt9zhz7CmmctKU/0z
	p30RUff7i8WpEhLjn2vabUyREACmyZsfFZ2GtyO2f/8jPP39WhDBw3UDI6aKfUe0Z+CoiFNhFfS
	yrKg==
X-Gm-Gg: ASbGncvEJjn3gs7OX0vT881PvZfChymTQSmdHyLvMDi0doi3Nis3HdKB+5zE7ImPbF1
	zLZ7UcuBB81lbOujNoU/iz9aOLi9HhAzuMM6S+dEWg3igOR3ervNvbX+BtN5B4FblZjgMvsLDiQ
	Y78Ie9nWRYDZxVc5P5eGCVuXQJgYgs5eLzyDkU/WZj3+xxS7//gMd7+/lvb/ibGGMPqVQN2A7Ch
	GD3yL2LzGbi8lnbq43nSkpo57yiDUw14js4LObONdVxJ6KACb+yw7RB09dPZMGuLCbrzVOh2Yq0
	F8eUIyyLy6WVOK24AB5xWLvXEyrmgiUjrCiqzAA7b+CP5xfxE7n8xxz9Zrm7setNt0aHQ1MuvQN
	jNAY4vdbCMK6VdKSOJnsa9TAbES0=
X-Received: by 2002:a05:622a:11cd:b0:4d8:85db:314 with SMTP id d75a77b69052e-4e576b0937emr121120151cf.11.1759831473648;
        Tue, 07 Oct 2025 03:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNIWw2SAUTUQLNb+7LVAsg57ghgAbUy9HBwlXY4iZKFwFCHllk7t4lrcnif05kVwqiugILGQ==
X-Received: by 2002:a05:622a:11cd:b0:4d8:85db:314 with SMTP id d75a77b69052e-4e576b0937emr121119701cf.11.1759831473052;
        Tue, 07 Oct 2025 03:04:33 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3b70aesm12333222a12.17.2025.10.07.03.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:04:32 -0700 (PDT)
Message-ID: <5a9a2ed9-9e95-4bb0-b5b9-e4e0edcfa8d8@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
To: alex@me.ssier.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007-m8-dts-additions-v1-4-53d7ab3594e7@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrITsb/g c=1 sm=1 tr=0 ts=68e4e5b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=8poMKPHdAAAA:8 a=2dNuJvzwNQBdB-WvFZIA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-GUID: r0un-akzPfRwL5Gohv2BLADv0kecnLAa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyOSBTYWx0ZWRfX2+dgkSko6Aeb
 Pp0CPkT9sOhETs0fhLqIo3hX06r2IVSWYEWpwt1RfMB5qTCAlyR7R6StU/zSULyvT1pFGTbxyN0
 6/MZXalObSeHMZfxsEzSVKZD/jVHeKSpdEOEIbUhNzcKYgokgVcJniWGnN84XtaBUiDnQyN22hf
 njrMu+/T1Rcj2fyCTGhm9umVND7RR7vCr0oGHt75OSAT5O1bLRsCqwV19CfUHeuBtcwFCm3F+G7
 w49W5DF6WqO0MncoRf4i5cnPXllHooRCQbjNsvjqx6FytEQtTVvYuw28qxyx4yNn6igJu/nKjnV
 fFDn+7YgTkcBCi234lK0+w3LVUIsyBqeORZcFKMjFbICbVEtanMUXRqBbmt9FbUadRTxV11E0h3
 Gk9SdGFHVGNY0rm8ok4+0UP7ZwTKXA==
X-Proofpoint-ORIG-GUID: r0un-akzPfRwL5Gohv2BLADv0kecnLAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_030435_644609_47D9909B 
X-CRM114-Status: GOOD (  16.04  )
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

On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
> From: Alexandre Messier <alex@me.ssier.org>
> 
> Add the touchscreen device node for the HTC One (M8).
> 
> Signed-off-by: Alexandre Messier <alex@me.ssier.org>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 36 +++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> index 36eb42f0f3d9..040a256f9465 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
> @@ -65,6 +65,35 @@ vreg_vph_pwr: vreg-vph-pwr {
>  	};
>  };
>  
> +&blsp1_i2c2 {
> +	clock-frequency = <384000>;

This is not a valid I2C frequency

You're looking for 100/400/1000 kHz

Konrad



