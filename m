Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470AFC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAMOM7rvhCYgMuIw3HT4H/aOfsEkoZQ5Aqu4Fze2AEU=; b=YVp0szWGW6PLbYWXTpoz6gyMIL
	ku4xlqjB/wF4Ab1/ztTm212e8PXeej7A3yW27fNgf1GyFAY+dy6PyXsWpGVV6ZUUFWF6HpVYkvw19
	rwzp8Iq/mh78QPQB7KlPhjO6PW17kmTI5SENLtWqWR/yORLuKu8XFFyF75ybdk52rE2CFSjLCut+V
	/XIOqExaxW9663u6DUbrdA7htw/LqMQZylnU4wsT9R3lOkYaGUZX2kaUlWK6pVPb0neLrJ37chk5A
	7iQAobSbeQA76odOTUT+of2jpKy3Y0s8rIbdXOBU6c1qogTvsJq4zZytdqlBNDZjWxbp/NEYaa7T6
	A16akDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNmg-00000003fib-1Tqz;
	Tue, 04 Mar 2025 08:37:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNky-00000003fKz-43Ml
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:36:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NX6Hb017225
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Mar 2025 08:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XAMOM7rvhCYgMuIw3HT4H/aO
	fsEkoZQ5Aqu4Fze2AEU=; b=jvUG1PgGOVC5kQ7DsFZlnFb43l5Lntg0lg8RuOxb
	xcqIawn1FrIoBG2AnX09O/3fL80pZ7MzN2EBN15To8lm2KF9O6jjFMDcQUkgd42i
	Qik8A8DLDoHf/jnBB/22laPT7G7F5l7ewrhymH/V2AW/e5UbL36g2yo/aU/kAZsZ
	uF5bKgXUxjfjUHsD21qMr/s6gr/D5xDAlg7aaVsUvbiO398Nn3WVCBC8W6iU+J8l
	gnpMM7NpuJYhfj3Ko+GiYNzQWxk3d9O+gmDP2xztPaQ1fnJvUot74YZXyF4VzDjd
	te7Dq0Mtfn7c1ZOOSx5z+k1jiAdwXAuFrUVroUqgP2o2Pw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6th815-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 08:36:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8b876f694so58000426d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 00:36:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077362; x=1741682162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAMOM7rvhCYgMuIw3HT4H/aOfsEkoZQ5Aqu4Fze2AEU=;
        b=XFKbNxMLerqhe3PNLVfosJvOtFzEd4o3QuQRdFLpTpgWYcYYnMvCICOZrgA6ikjeY0
         9W6HzirKQlOWubMCUJxXRDlV4jFbQeonEUM4bVy1ilLrbTNrnDvLZqod5h+t37xtaTMR
         NUNsLArGqdpF+T96CndpLG0+2OW5qf9ZME81RSygIPiIn11yVrD4y4SpOcpSFFP5EV5a
         67N9TnhVho7V6Y9PD5MZR6M0k2UvYLVChvAlYurlBSs8Aw4h+tOXhcfxyU3VMRM9gklu
         VJnOfbUUp+tk+utphlmlt5dG+qEvwUggDjtFg2uwTKk5KIll4vPNHxeOxQJQD9fDl7Rg
         qaKg==
X-Forwarded-Encrypted: i=1; AJvYcCXw2/HO1LenHajlhG58sdY06rSd5K6Ltz+DO8YMpEgI+f2l9pgVjU3xEvT7hFEKOb5DD6cSUJr/6RTh6yH+ZEEA@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+3+WL5UdNVEOdyCQevm858OcY62+uScolQ0a+e8CLWhIKxJ0b
	vssNeK5miSxAsuQs21nWr/OW3BHmZ0m2YHLG19auDWpm9Js/hd2CZJpO++RB11UErexqPA4Wp/Z
	zsMs4IKa+josDcEiZRYqJxGcHsxRhehsAa0d5BjJAjcDifjQFpLhLDlWbkKsbJkrVhPSy3SfQE1
	7wyu198tZo
X-Gm-Gg: ASbGnctRydY/IooWSNaBNLifsOC0MkHu5Rgx37vLtXQtEJLh4AcVqVSw7RMtblzOw/N
	0JDu31jzw5fiTan6a1fUdl0BOZgPF6wfIMyLytIgOK6QE6LLsaA1Mb5wsWeLp3wVzz2G7nBhwON
	AoDDONaEoRK6gMXzbZ1MXdNQJZvisQLk13EbcJmsr3zUoYxx1E3L454hf9K+yGPnElQV/kgu7b0
	pman0aE3wEOc2zNj4fzmUxbFBOS932Gnc84EEeo8ECieMBPy1e6boyF5ysaj1/0Wi1KmLWlQVrr
	w3sOpXnIdrmO1/PT12As0Cmin3daPQp98hARIwgtdEM3LkIY
X-Received: by 2002:ad4:5ba3:0:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6e8a0c87592mr237230166d6.3.1741077362662;
        Tue, 04 Mar 2025 00:36:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYTjjYAGqBjSa8LYcj6moKGc25A1v1rHHnj0+thRYs3Enml4DGKp4CuJXYuuPTy+m3iTBSkg==
X-Received: by 2002:ad4:5ba3:0:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6e8a0c87592mr237230006d6.3.1741077362372;
        Tue, 04 Mar 2025 00:36:02 -0800 (PST)
Received: from trex (54.red-79-144-194.dynamicip.rima-tde.net. [79.144.194.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796051sm17265067f8f.12.2025.03.04.00.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:36:01 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Tue, 4 Mar 2025 09:36:00 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v14 2/2] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
Message-ID: <Z8a7cMmxJuHIhgjo@trex>
References: <20250208225143.2868279-1-quic_vikramsa@quicinc.com>
 <20250208225143.2868279-3-quic_vikramsa@quicinc.com>
 <ca8e6569-b466-4f83-83af-38c51891d395@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca8e6569-b466-4f83-83af-38c51891d395@kernel.org>
X-Authority-Analysis: v=2.4 cv=PMb1+eqC c=1 sm=1 tr=0 ts=67c6bb74 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=cl0az7d0LwC7qAhl51RXhA==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=-c0S-HA5VnWDXXpzp3AA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: Y9NcChXUYnmaZzXv3qly5xEhPtkIZ09U
X-Proofpoint-GUID: Y9NcChXUYnmaZzXv3qly5xEhPtkIZ09U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=858
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_003605_010357_B5EBE612 
X-CRM114-Status: GOOD (  15.96  )
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

On 03/03/25 18:13:20, Krzysztof Kozlowski wrote:
> On 08/02/2025 23:51, Vikram Sharma wrote:
> > The Vision Mezzanine for the Qualcomm RB3 Gen 2 ships with an imx577
> > camera sensor. Enable IMX577 on the vision mezzanine.
> > 
> > An example media-ctl pipeline for the imx577 is:
> > 
> > media-ctl --reset
> > media-ctl -V '"imx577 '17-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> 
> AFAIU, camss does not support SRGGB10, but only SRGGB10P.
> 
> Based on tests reported on IRC I think this might not have been tested
> correctly.

I acquired SRGGB10P (10 bit packed) frames from the camera despite the
pipeline being set to SRGGB10 (16 bit) samples.

so something does not add up.

> 
> Best regards,
> Krzysztof

