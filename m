Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA11CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 05:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcqLN3W0mBzYaprM7xFw8O08UixThBS1YjcY7/7xA3o=; b=mBfHd4Dg/nBxM/csjwIGnszbHx
	wnUY13D15luAxpbf8ef7Z2QkQ6a4oCg2vXdl1czpXzwk5swbaT5cAslERsFE3NibXFdRyaf2vzreg
	I5lihXEyKomSjvvercH1rC8mgckNv1beELXvEwjHkOrGgrjRUNe21C8VmKE+uF1+P3xzMBTWdCAlM
	DTL2C/5hejTJldNuIMRgiLP8CRS87gFJTpUHnUn2e7vHpM26CUafnjO//Ty5Tz4RzLwREuYEyV/fk
	6bQt4iASpWcd1goLU8WnbECInprqnyqGdg+BvOrWlMmmY8UZ74CMPiHuMp+lHjyvumpnjimIvCj4c
	Kist0OcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDn0-0000000GqZF-2WsW;
	Thu, 15 Oct 2026 05:14:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHDmy-0000000GqYs-1z49
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 05:14:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENPgQg1682834
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcqLN3W0mBzYaprM7xFw8O08UixThBS1YjcY7/7xA3o=; b=ieuOe3H44msy/Bs1
	oOmfp5ipRKg8d1FKAnX1CyjOCaOJxhVqSnC7p2iDR/IHpMg+FSLfeGrhBL0LVGJK
	CGPxxWrd3dAWSd7d/l0qG6XvNWGjvCE82Fr8hxAuG7YoUqWI1VhCPx7CTVy8h0li
	ttaxt3ZqpgolJI6D1a8jT5GKSU6+wDmplSAm8iuWi75m6iy+kob4vjZCO04yvFsH
	Pex0/sz3UYcy7xKGdizYa4bTi9RmN0svWEt/PV2DRkMiLZwVSuE8pHk/EjEXNJLY
	HLmewteVIE0a1mex3L7r67sjq+w8xBoJmwnqt4V0jtQ8mJiyRqj7JzSpIU15CBDX
	1IhEbA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb02rk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:13:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3515266f6eeso3145391eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 22:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792041239; x=1792646039; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcqLN3W0mBzYaprM7xFw8O08UixThBS1YjcY7/7xA3o=;
        b=LCgc6fzCBIvjWnOEP9/bAVSzpYnIgwaqoixc2FikAPQoriDlkaIC0cpHFBIpGbHcqc
         ZlOqtqxGBdb+qavlwKJ1GsHUU3LpuqUiVlfM33lCKz08l5WRzdp6+NzaZL25U1DS0fbT
         FwXsVknNOKiZqU+y649cPP5F3jLjyN8FnB7b+nq/lxfwtVB6IK6bxkWZ8YfS3G370YjH
         E3yFPEe/Plo/xa9vgOXfNYTe78iOglPfQ91ARaeJznXPlE+h9pQGZYEBkZmHIEfMwDnU
         Twz5P+Q4kGo1dWsOiTpQ+d8zsIP3JCW6gylc/H6obxbdOYhucPPGb7B4uDJqRupLaNq6
         urWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041239; x=1792646039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcqLN3W0mBzYaprM7xFw8O08UixThBS1YjcY7/7xA3o=;
        b=P3PGXeSIjAB5klOZnfj0khsjcUo/IJWNs6LOqB2GUnY4Mpxz4j+JAZEgWNxHg1B9BK
         biZthh6DlD6HFT5BMhL/pHuXJBLoiMOrRgRPY9Ut2fRK0N4X2GVDIgyR0fvr8Yre0DJw
         tPpb+qObMXLf6yn4DFBIvgdY9Ii+r3bTNNpuwbTucIkFgWL8bQCV8QpBoL8DO2HxA+do
         PP7SLX4YqZZCG7rVgXgaHR5xi8elHPptBOC13gWCPJUnJVgiYt6peCdZ1T0pKhwXjL1O
         +XFsVl+IfRVOg4zFXvtTlJNLZhy9Fy93R8kD93Wa0n27CJhOqEc8DcLn5M+ugYNvqPBr
         UICg==
X-Forwarded-Encrypted: i=1; AKwUvBzHkDrO7wADZ2Pc2WgIAVHpkbGH4hukwH12/sOrTXzN9ud9kH4OV//DuEEi8XQIIp2awGikHBL+4wh9jWGETAbl@lists.infradead.org
X-Gm-Message-State: AFq9FYJbNYJsESG+bu16YnmP2YIFysx90EfV/aoe2TQDX9/KTtO17dFt
	61mqAMtccXx1HJRsMj6/tcnBU0e8/bWZ9GnbYwnZ6eaTh5i7U3HTy6WVaFnOYGKARHy8kbOKZro
	boQVZF3M815r+bHqTxmHU822FeZzRNXfFWXZBVy198L1ukmutUbju13lvfeeTnJ94gXFUWxhJa3
	m0hg==
X-Gm-Gg: AYBFou3171q6BbaYv5Tj/TIFUDpqmBDgn0MQVTKH+3l3JwMcgIQsqm3PdJUBuveG8Wu
	cZ3DLrzGJOr4HKslUt9sy7pSTOiOw5ZBoysAr8SlAMZ1DFFMJnA809Aop1xZavZf6c6p3aIC3fM
	sS0iIo2Q43TA8nvAkm0VsAhrGdAFMA5rtf4SD/X5RnEQNOqE/CASjYyuL7OlwhEz/XLwEADt5RY
	8/XWv8rZd7ES79yKiy28O6HopF0jmu/4JI5yddv1wJlRUZKOizjPssDzNduK/Z1UYDoFJmoF+Y+
	ReWjo+t1KDFuUGKTtJ8nn18ay8FGNswgvsO+h4braXBXx5nREkq+ERK72xY+X8M6MP1V1qx8f74
	+HPcuL9B7ONyR23vgXN0ndq8c4s465Qy/
X-Received: by 2002:a05:693c:2289:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-3537e0788bemr33213620eec.14.1792041238997;
        Wed, 14 Oct 2026 22:13:58 -0700 (PDT)
X-Received: by 2002:a05:693c:2289:b0:34b:5ab2:e200 with SMTP id 5a478bee46e88-3537e0788bemr33213570eec.14.1792041238403;
        Wed, 14 Oct 2026 22:13:58 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm62494806eec.21.2026.10.14.22.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 22:13:57 -0700 (PDT)
Message-ID: <d7f782f8-56ed-41ba-8d01-5eb235f873d1@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:43:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad06117 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QlY0LIaGgR1dm1rbm6YA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfXwu58RU/eQpz4
 FdWHNpZahhdYFZr43rRNUOSBBYrAO/NFi45yOO0sWpEJTEfReiF+ch5DfyPyOvUGR7xg1O+CMn5
 6129QDQwrSM4KZZ6ThiOK955OAtJxZ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMCBTYWx0ZWRfXzAT+0ZNJroG7
 nMMDA6Ab5N5yu+v/peT0PLs0AYikKkl4XJIxKwME6zrEUeGj3cHBUBiG7VtsVG6LdzeKG5gtOkG
 vOYZerZ+YrApv/KBfXDv9MT2rfz7jqtiJckqvNYpwj0Nq4X1idHzzl8P0nZEV+H3LY4s9hJ5SJD
 i6qOzkKapugWxxfAsehsWYEAAPgLdyI1JCPDQ8iH1DA3mNuhBHUQaW1x8rdJKnw6x6ZJpP0LUYy
 qPgUuNVM5Q8hh79zfFyV7oD00/jeYPWrQHTewIp8lxzsGGZIJQGVFs/c3Emif0s1PR+mgU3bAlR
 ZdcOKcco0V+EIkYhyD15AgHJvR2mP4ou4JjBM380yaLZ8CgY+XNX+FzJHimYrugwYnneR82ipWn
 5V3sXBPH67NDIKtiuYauO+HS/ewuVxt39lxX1uXBsTorqzIXZVi70KaIDzoQRN8HCuvTH/6nvpk
 KaYJC4jaTstuhwUiBjw==
X-Proofpoint-ORIG-GUID: d7Gon17UkvXZTdkrPnvgCDpmbzyusb68
X-Proofpoint-GUID: d7Gon17UkvXZTdkrPnvgCDpmbzyusb68
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_221400_531165_D1AF1B26 
X-CRM114-Status: GOOD (  13.95  )
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



On 8/27/2026 11:29 PM, Praveen Talari wrote:
> On the SA8255P platform there is no Linux clock handler for the SE
> source clock, so the driver has no way to compute the divider needed
> for a requested baud rate. To work around this, firmware instead
> exposes the SE HW supported source clock frequencies as OPPs on the
> perf domain device.
> 
> geni_se_domain_attach() now populates clk_perf_tbl from
> the performance-domain OPP table, allowing firmware-managed
> platforms to use geni_se_clk_freq_match().
> 
> Call geni_serial_set_rate() unconditionally from
> qcom_geni_serial_set_termios(), and use geni_se_set_rate() instead of
> dev_pm_opp_set_rate() so clock programming is handled centrally by
> the GENI core, independent of the underlying clock-control mechanism.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

