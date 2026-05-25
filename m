Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EF4CD5BC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 06:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nflQI87m0NpjbiVb4vx6MvwkK+5xuXrtzoNAWuqcxo4=; b=KS2327lMMnN+3+rGSbdA5Lf57e
	ZXYt0l5ppLx5bSZGjF5osSxWAP3aYLbxJyWpf4MWZVh/5XwvC+IJc7m0G9E2/08PprDg7Tuvfxhlw
	/dtboQG03GSoUdxiZqMTO58OLkkvlJs+CMjiu7T3l6dXOuWhK3tzJe9FK+ZVT//uhayOswjahyLG0
	JxTi466pnilZkhI4G2XVE9e2+kso65H1UGuzZiA9X14ijwWaSxSu3tuJpIG6u3uKlcfbZ0SqePz74
	Ce/aptOh2J02C8OAjifDKwlnqV2y8RH1CuEcraJQ9fWC8wZH7wKXEbMBdHfonsszvpHr6yyIm1EPO
	CnnfErEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRNuX-0000000GKIe-3JM1;
	Mon, 25 May 2026 05:31:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRNuU-0000000GKI6-1P70
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 05:31:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ON6B68419389
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 05:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nflQI87m0NpjbiVb4vx6MvwkK+5xuXrtzoNAWuqcxo4=; b=mrnidYhyVHk/r4CW
	uWJV4XEZohM6XYWyYSPlnNKiztNL3kEpw8M26kONxWLi6sqLTzOyhCgre35GYzI3
	bpDu0cx8o+X6AMzvnkHjcvFOgF60zzUBk2uIs/ox/IBZH4pAZ07+ntm/vOLhIC2A
	nZ2eUc++wk7BwUynwix/TfV4iEywx8tc4zTdAK6UlmromSUjKDDEGJZJIJb3w8cs
	LokZZhp94443QaZcSsBPmFhTOg9Sm7o7NL2IMLMfnO5T5L1JzDFVclIhs1g0ZaET
	WVB3jdCPhnJya6s4DIq8JHGjN70+aQ5zMRJfbOU1V9WIjx2bf3BkGC9jvFHJBtXE
	irIm1w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb386n86x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 05:31:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so4465578b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 22:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779687087; x=1780291887; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nflQI87m0NpjbiVb4vx6MvwkK+5xuXrtzoNAWuqcxo4=;
        b=JhdX9pUm3oAjnofLmVUsL0AVzF4QUHMPSSCeuzf1aOAvA8g6IaSqZRF3q6DDlC6J/5
         4AvnHA2/yLAjcldBN3/h/4R+r8tnMam8d7cftFcGqQORC2YWnsdsP2KptEwKHBGrLDTF
         88KlWkn1IDbXaZG2hLkiSj7vRAgifFMxcScNeaWXbEIB/eXEvFn6fxWTcXwxEM0md81n
         669XIN/X+yfCKYWSqxttD2GsswGbyZ3NSJGH3vU5qj2aFrioqOr9eFRuzVBn1dkPHJdP
         NszyTCw2bt+nQOgJQawJavOQtOzYTansrfpVnjuMjnHfpbgk5zOTQvDLui9nzpff5dCZ
         NA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779687087; x=1780291887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nflQI87m0NpjbiVb4vx6MvwkK+5xuXrtzoNAWuqcxo4=;
        b=lSy9oUI8NOAFsVrN/wZoQ978QOsq6E+NwpfuOPLFRZjN1v66ymnTTwKAz1VNDq1bjM
         4RNEmpRLM+2UjesdHYF2wYWrp0+Bl8u/Pm86DfBdawGyW7KYpkFuCpZQbdWl7E4kAuLW
         LPqM3N3G9jOBFoMdjLc807qvaECZjxla1nnDltsW7mvv8Wsk4AztiBvncnkjM6lqsU+i
         OsXkSCVd0DBlT9qGUfZDWxfiuFMy+iyT7JFGluCcAG7CucT4O6ERgJSwsuIdZ/TyfMlT
         ES7kQDi5c9YJK8tlMJQ90qpx9IpJZQssk3OdFt03JH3iDO7WJxSg3xfMb5+zVO7fjsEA
         elHg==
X-Forwarded-Encrypted: i=1; AFNElJ8+/ZFfrhahCDYH4X2N+7EM9rzExmJhWu8XCNx77B/SqEDzvnBiDK5A2KdsOK8aTIo8FLLQoAVGVYJJ5MEAO14y@lists.infradead.org
X-Gm-Message-State: AOJu0YzcricWhwH461d28s6S3vc2kY0cfUBeu24vLfgGvbjwd2dbE16W
	6gblHbOxRuSB8Oy9SLZwaL/OjbOR3l1SrWxS4bl+aaisSdJ/TPmegbyBq55JCzUAPwNYp8HuArH
	NTtJgw40GfB6IIcFRywR8452nuB7voG0Eiy/7GkjCAsQTR3TU6cu0zl0igmXZ95QLHzwNXFiBuT
	YEqQ==
X-Gm-Gg: Acq92OHHL2RxGo+NhOSA3minJAgCEleeFF0t8MU2JZGo9MrlaNnPv2Mtl4CVuaj7hRY
	KyOWmgLLqk/l+sqQgvLX4Z/hVNWkZzXEbzsD7roY1xV+HpStJuVMsbx3orc1kSG89UxB0r6IDby
	8NpTx6HlIs01SBTl3B/eZghLc0sMiZsq/I/ezJEBRNBqrF8Iup1OGLl/ag+yHYpGhqo/TBxJmGP
	960vVg4FFVkwHwvAiOGBGsdklJJFjFAwMyzhv1HfbVJJKyELj2CB9pCoJYbtiiYFybEFpLRMwPD
	p0O391kwld2Rh2/8/0avoGYuff3gfAuEjZDy0/cQDx/7pmLhksxGSE+RQaMHxnYbFLnm1er05YG
	pBJevajaEEga9d0dknRFdyhYLeCkNYcSTHSOGRrHD0NcMeoY33JfJig==
X-Received: by 2002:a05:6a00:3a17:b0:838:127d:a168 with SMTP id d2e1a72fcca58-8415f17bdefmr12189662b3a.17.1779687087036;
        Sun, 24 May 2026 22:31:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a17:b0:838:127d:a168 with SMTP id d2e1a72fcca58-8415f17bdefmr12189626b3a.17.1779687086548;
        Sun, 24 May 2026 22:31:26 -0700 (PDT)
Received: from [10.92.183.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm8175618b3a.5.2026.05.24.22.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 22:31:26 -0700 (PDT)
Message-ID: <16ae5bf1-6124-4644-9e54-4fe45aa1041c@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:01:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: imx-lpi2c: mark I2C adapter when hardware is
 powered down
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>, aisheng.dong@nxp.com,
        andi.shyti@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, carlos.song@nxp.com
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260525031450.3183421-1-carlos.song@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260525031450.3183421-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pqrfn7nVYU_kZmdKy3Fs7rlDfc_o1o33
X-Proofpoint-GUID: pqrfn7nVYU_kZmdKy3Fs7rlDfc_o1o33
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA1MiBTYWx0ZWRfX2RLjjfjgVOL+
 lVjm9gUGN7l8pIpqAhdEn8G0Io2ow8qU+EBGA+uhRLjsBmd1z54GBcnxs2cwxnazVj7lg10broE
 kSSih7TCqGwc/P4ZyFqJguJPRd5JxRuJAC89u7vWHgGR+1n1G4JeOj1SmWgyiruB5YPIFXinMHh
 LkHbW1EnwVDDW8YFsx5rxc3iZHjBgBl1/cvdHK1/uDdZY5DOocb5GIzUAmg9s1wDE7YDTmCB49/
 gBTTpFTz4ecXHteg9A4kuVnr4htNYcHXFdC1zXzboe4BAwpPyGYw7FvXQAfVqclmXDL8NXS629b
 sgmzfy6g/Dk2k95dPwampmgt/xuQqLjj9NNNzeLe3d5oIVPK1liJrPd3ZrT3Tl1yvM8fPm20vB0
 d7r2lOaaVcfbolkQmfHFI/oFqSTTKSTm5jAW7LAexgBAMVLHGG0dMPcCp6ei8SYZ1qdTP1y5yGU
 k4/2233hEFX87HrrEBA==
X-Authority-Analysis: v=2.4 cv=PJY/P/qC c=1 sm=1 tr=0 ts=6a13deb0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=elOLNqXY3ezWbv45m3UA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_223130_502131_D07F79E2 
X-CRM114-Status: GOOD (  15.50  )
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



On 5/25/2026 8:44 AM, Carlos Song (OSS) wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> On some i.MX platforms, certain I2C client drivers keep a periodic
> workqueue which continues to trigger I2C transfers.
> 
> During system suspend/resume, there exists a time window between:
>    - suspend_noirq and the system entering suspend
>    - the system starting to resume and resume_noirq
> 
> In this window, the I2C controller resources such as clock and pinctrl
> may already be disabled or not yet restored.
> 
> If a workqueue triggers an I2C transfer in this period, the driver
> attempts to access I2C registers while the hardware resources are
> unavailable, which may lead to system hang.
> 
> Mark the I2C adapter as suspended during noirq suspend and block new
> transfers until resume, ensuring that I2C transfers are only issued
> when hardware resources are available.
> 
> Fixes: 1ee867e465c1 ("i2c: imx-lpi2c: add target mode support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>

