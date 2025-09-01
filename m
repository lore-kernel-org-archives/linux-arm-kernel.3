Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F272CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAlnvbMmNT7cy5qH7wwaB4n/geslp9PTYb6i4MqxfhM=; b=pnNiFWh039UQ5nSBNms+L/5/tA
	yDghhwZq5/l97IMMGsuCdJ0b7LS62gcUQyubM9d4uMs7hD98ecnSsuHE8mUPhdstP9SVwpttdwulV
	Y3OZINKDxaRy5jCW21iOaavuxBkJ0b32nUD921y3lEEdhlh22K4eHsV2Jlk3qTI2jSfzv8GLRDlJ0
	iYnSZSDj3r3WpDDTbFt7+6iOJkzB6WpMn80+Sibum7ZgSuSUrf0tm9327OfJPmNnVtRKCFtZfY9hN
	oGk1+/WDnnLMyFbtswQM20ozRJGybKK9voT/SDI800scHVpfyUtjjEsBntspzYPVDHmUw6pPKqoFD
	hqvqlHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0Dd-0000000BdMF-0RBS;
	Mon, 01 Sep 2025 08:48:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszwF-0000000Ba6E-1Qw2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:30:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5817wf3c007944
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Sep 2025 08:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PAlnvbMmNT7cy5qH7wwaB4n/
	geslp9PTYb6i4MqxfhM=; b=VrBsvSuGp6hTuyiIvvci/n39wJlnQdFV8TWfsgRi
	KzqlDuhayFXbALYDzBkYwapUATBzgQs2DzFdB9im+gk/RyzeBPrhtlZ/N/dKVkEK
	5r5ez0Z4HgumEWbAJHU2pocxZj557+x1yFDtLQMmGKDisMUxSKLFKTgS8JOr1xq2
	h+G0IC7Or2h+LlfOIQoz34rpxS4s819dUqTBKVo34HahfsOGV/kAi1DyDethwxmu
	MQC3kzJH9AEjzyx2ZXu8uVFk3Cn9UjsesRygI5qBUp4EmNBNe89xUYWouSy9w4zB
	Er0RngvAy3pSprCskz1DRKgAhK2Dls5g1LutrZ5jpsUiqg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utfkbw24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 08:30:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-327b016a1f3so4266651a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715454; x=1757320254;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PAlnvbMmNT7cy5qH7wwaB4n/geslp9PTYb6i4MqxfhM=;
        b=uqMm1oTNYVS22hw1rvCJEj7nRiDUCfLOtv90WlPPtPTDmU4dnVQ0Thpwb0SDyuH+um
         8NLoefZPTuoF6FaRFrpxQPUjtDdoDLGSOow1ZbinrWY6iuICct7so6g4T8UmyL35vvSB
         BPwz7IUwkkLtn44plBVgLHZeMilg7SSczalSNiydEHzOGhCV4AWVxNlDqNli1k/Zj+XV
         /GvxbZPNnaOnc+n1g11MOwI5H4l64ovP+kF6rwRDX55kU5exV4djprxZZcvQg+z0Ywf4
         mcKEiHL/mVHZ4w2K9hB/xOVSDcq5ZE2yvVJ8+MdoixdqT/+z7xR4WAxPFny0Ukwh8Khg
         0bwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6YiGNBsQp0tz5QFUaPt4oohxZaOr1aXrlkI6uEPqqLHI87L0qOPzYLdZUkxxwuT3pGK3krB9/xG6N0KzDjgKV@lists.infradead.org
X-Gm-Message-State: AOJu0YxEZIKoXk52UlgmRZpmZgjdLEjMbQCMBrxG/f6od9fcfWXBa/7G
	sSf11u+ukcyayDgH6+oydtG8SRSoIYXAMMMoPVWiNV/JR1kuUve9vRfuuWLaDfu1TG0/9OAjwYP
	DAkePKfEj0SiKrhubhyYww1aDRQ1x6m/H062pW9LsaUr5xwUNRQRygwvjCvTEJObxPlIfG0VdLC
	4hOw==
X-Gm-Gg: ASbGncuae6VT8+ofPuMh1grdVWlngt6N0/dDU8X6T1cWqH+1kZKlok06eqZcPCrFbUA
	cHE1ACv2W0VZnOH3BDbCmSoTWLTynD3rW9PvBQyKtLw23RHzBm9p73tr2hZJu9xCsyM+MuNCPn6
	P16m/3hqh8pLxpFSZ7UzOMZHfgjKLOw1TfLZ3AUDi8QjU9WYljRyUl7hB1s2w3kRK/JMTnFB1k0
	aCJhQ7bQMvPolJr2YjVoLlhzrEIuN6tI1jtgEkZeaUEM5PRPKG3PbgDm7mfxdbdKPj8ZY/+M14G
	ZwGG2QusFHfv64gh4vhnrNiFcYrNAVT2EgSla9I5PwmSkEZTpO++dQjyCuJhoPy0hX5Rg1TkS9c
	H81eorX3D45rqKiicMy/CGPuMp1bs4iM7Sg==
X-Received: by 2002:a17:90b:3b46:b0:31f:2bbb:e6a8 with SMTP id 98e67ed59e1d1-3280d34bedfmr9411702a91.12.1756715453471;
        Mon, 01 Sep 2025 01:30:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEFLIh6cXUMrhl0nWYZjIF+ftbFIXMfmYoczlM+ivv4wmziz6mmeKwe5E6V4o0QqOwRn+XyQ==
X-Received: by 2002:a17:90b:3b46:b0:31f:2bbb:e6a8 with SMTP id 98e67ed59e1d1-3280d34bedfmr9411659a91.12.1756715452874;
        Mon, 01 Sep 2025 01:30:52 -0700 (PDT)
Received: from [10.133.33.247] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3296f871acbsm5626087a91.5.2025.09.01.01.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:30:52 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------Y1gY7oQI0ggObi7uDTnXfL60"
Message-ID: <b608b4b2-f850-4b49-be65-b2f4e3784dd5@oss.qualcomm.com>
Date: Mon, 1 Sep 2025 16:30:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] coresight-tnoc: Add runtime PM support for
 Interconnect TNOC
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250831-itnoc-v4-0-f0fb0ef822a5@oss.qualcomm.com>
 <20250831-itnoc-v4-3-f0fb0ef822a5@oss.qualcomm.com>
Content-Language: en-US
From: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20250831-itnoc-v4-3-f0fb0ef822a5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eaQ9f6EH c=1 sm=1 tr=0 ts=68b559be cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=yJojWOMRYYMA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=2_w7q_4OogOuaEAj4c4A:9 a=QEXdDO2ut3YA:10 a=pD-t-wKbIgpBmJTf4s8A:9
 a=Gcllsu8IzuiZ4xof:21 a=_W_S_7VecoQA:10 a=L03L2QfmqWoA:10 a=1WNtSb5ECZgA:10
 a=82JZpTc5bpwA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: YbUiQWQv7gzVdXlxvuvIzsCSMjWa6Xqy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MCBTYWx0ZWRfX+qFcwtsdLr7B
 n73JuI2DTiNYDZlcJqMsnWSiXNrxsJo2wbJXuB8mms6buYMG0LqIWzHtz4kBckzxi+ZPLpP9m2J
 zf5ePg+bm5JvWlNuy/we6lmrMOhjOE0m5DwD/LOiA7BVH47eS0lFJqi3y8Gh9zxk6uWdyXbNkfh
 1xFyAws6tfXahd4/pAjkfD+4SC4gqM9ddX4c/Vv9Cc1PhTEpGOHEPGy+NgaKcEdbHFGAHckEi6k
 2G1Gjg4rh+rPq7BAaEJUF1wkof7x9Xm/4aEY3198npTdo1AsZIu0BJAO3InKs8leMqWlQVrrM+3
 AaX7TyDLYHPM1sSqGKTPc0s+aAkb402W/CHvT7kuL/uc9wSAYlfML8fkpGk3Q9d/aGUXaOfykHI
 tLNCZsA3
X-Proofpoint-GUID: YbUiQWQv7gzVdXlxvuvIzsCSMjWa6Xqy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_013055_396525_A009FABE 
X-CRM114-Status: GOOD (  26.58  )
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

This is a multi-part message in MIME format.
--------------Y1gY7oQI0ggObi7uDTnXfL60
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/2025 2:58 PM, Yuanfang Zhang wrote:
> This patch adds runtime power management support for platform-based
> CoreSight Interconnect TNOC (ITNOC) devices. It introduces suspend and
> resume callbacks to manage the APB clock (`pclk`) during device runtime
> transitions.
> 
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tnoc.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> index 5be882300d79bc0173aa6a19d7da1d48c4aaca9c..2c5370497076536bfa868f0d80db775ef242968b 100644
> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -301,6 +301,28 @@ static void itnoc_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> +#ifdef CONFIG_PM
> +static int itnoc_runtime_suspend(struct device *dev)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(drvdata->pclk);
> +
> +	return 0;
> +}
> +
> +static int itnoc_runtime_resume(struct device *dev)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	return clk_prepare_enable(drvdata->pclk);
> +}
> +#endif
> +
> +static const struct dev_pm_ops itnoc_dev_pm_ops = {
> +	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
> +};
> +
>  static const struct of_device_id itnoc_of_match[] = {
>  	{ .compatible = "qcom,coresight-itnoc" },
>  	{}
> @@ -314,6 +336,7 @@ static struct platform_driver itnoc_driver = {
>  		.name = "coresight-itnoc",
>  		.of_match_table = itnoc_of_match,
>  		.suppress_bind_attrs = true,
> +		.pm = &itnoc_dev_pm_ops,
>  	},
>  };
>  
> 

missed Reviewed-by: Leo Yan <leo.yan@arm.com> tag.

thanks,
yuanfang.
--------------Y1gY7oQI0ggObi7uDTnXfL60
Content-Type: text/html; charset=UTF-8;
 name="https://lore.kernel.org/linux-arm-kernel/20250829084118.GG745921@e132581.arm.com/"
Content-Disposition: attachment;
 filename*0="https://lore.kernel.org/linux-arm-kernel/20250829084118.GG74";
 filename*1="5921@e132581.arm.com/"
Content-Location: https://lore.kernel.org/linux-arm-kernel/20250829084118.GG745921@e132581.arm.com/
Content-Transfer-Encoding: base64

PCFkb2N0eXBlIGh0bWw+PGh0bWwgbGFuZz0iZW4iPjxoZWFkPjx0aXRsZT5NYWtpbmcgc3Vy
ZSB5b3UmIzM5O3JlIG5vdCBhIGJvdCE8L3RpdGxlPjxsaW5rIHJlbD0ic3R5bGVzaGVldCIg
aHJlZj0iLy53aXRoaW4ud2Vic2l0ZS94L3hlc3MveGVzcy5taW4uY3NzP2NhY2hlYnVzdGVy
PTEuMjEuMyI+PG1ldGEgbmFtZT0idmlld3BvcnQiIGNvbnRlbnQ9IndpZHRoPWRldmljZS13
aWR0aCwgaW5pdGlhbC1zY2FsZT0xLjAiPjxtZXRhIG5hbWU9InJvYm90cyIgY29udGVudD0i
bm9pbmRleCxub2ZvbGxvdyI+PHN0eWxlPgogICAgICAgIGJvZHksCiAgICAgICAgaHRtbCB7
CiAgICAgICAgICAgIGhlaWdodDogMTAwJTsKICAgICAgICAgICAgZGlzcGxheTogZmxleDsK
ICAgICAgICAgICAganVzdGlmeS1jb250ZW50OiBjZW50ZXI7CiAgICAgICAgICAgIGFsaWdu
LWl0ZW1zOiBjZW50ZXI7CiAgICAgICAgICAgIG1hcmdpbi1sZWZ0OiBhdXRvOwogICAgICAg
ICAgICBtYXJnaW4tcmlnaHQ6IGF1dG87CiAgICAgICAgfQoKICAgICAgICAuY2VudGVyZWQt
ZGl2IHsKICAgICAgICAgICAgdGV4dC1hbGlnbjogY2VudGVyOwogICAgICAgIH0KCiAgICAg
ICAgI3N0YXR1cyB7CiAgICAgICAgICAgIGZvbnQtdmFyaWFudC1udW1lcmljOiB0YWJ1bGFy
LW51bXM7CiAgICAgICAgfQoKICAgICAgICAjcHJvZ3Jlc3MgewogICAgICAgICAgZGlzcGxh
eTogbm9uZTsKICAgICAgICAgIHdpZHRoOiA5MCU7CiAgICAgICAgICB3aWR0aDogbWluKDIw
cmVtLCA5MCUpOwogICAgICAgICAgaGVpZ2h0OiAycmVtOwogICAgICAgICAgYm9yZGVyLXJh
ZGl1czogMXJlbTsKICAgICAgICAgIG92ZXJmbG93OiBoaWRkZW47CiAgICAgICAgICBtYXJn
aW46IDFyZW0gMCAycmVtOwoJCQkJCW91dGxpbmUtb2Zmc2V0OiAycHg7CgkJCQkJb3V0bGlu
ZTogI2IxNjI4NiBzb2xpZCA0cHg7CgkJCQl9CgogICAgICAgIC5iYXItaW5uZXIgewogICAg
ICAgICAgICBiYWNrZ3JvdW5kLWNvbG9yOiAjYjE2Mjg2OwogICAgICAgICAgICBoZWlnaHQ6
IDEwMCU7CiAgICAgICAgICAgIHdpZHRoOiAwOwogICAgICAgICAgICB0cmFuc2l0aW9uOiB3
aWR0aCAwLjI1cyBlYXNlLWluOwogICAgICAgIH0KICAgIAk8L3N0eWxlPjxzY3JpcHQgaWQ9
ImFudWJpc192ZXJzaW9uIiB0eXBlPSJhcHBsaWNhdGlvbi9qc29uIj4iMS4yMS4zIgo8L3Nj
cmlwdD48c2NyaXB0IGlkPSJhbnViaXNfY2hhbGxlbmdlIiB0eXBlPSJhcHBsaWNhdGlvbi9q
c29uIj57InJ1bGVzIjp7ImFsZ29yaXRobSI6ImZhc3QiLCJkaWZmaWN1bHR5Ijo0LCJyZXBv
cnRfYXMiOjR9LCJjaGFsbGVuZ2UiOiJjY2VhN2Y3YzA0MmVkZjYzMmZjYzc1ZjFlNTMyYWNm
MGU3OGMxNTA5ODExYzM0YTA0ZjA3YzgwMTc4YmVjMjE4YmI4YWY4ZmI4NDk5OTU5MWE0ZWFh
MmEzOWI2YWIzZmE4NzQxMzEzNTRhZTIxNjNkZDBkY2ExMDA2ZmEzYTBlZWMxMjNkYWIzMWE3
NWY0YTc3ZTJlMzFjNmVjOTk5Yzg0MGE5NjMwZTcwYzM4OGJmMjM5NGQ2MjFmZjdlNmQ0ODZk
NTRmZjlkY2I2MjEzNmU1Y2U3ZmIxYzBjZGY2Mjk2OWVmM2E5Njg2MDAwZWEyZGUyY2YxNTI1
YTQ1ZGY1Mzg3OTVmOWQ5Y2E3YzU0NGM0NWViMGYxNzgzZDk5ZDk2Y2FiNzg0MGJlOTM4NmYx
YjM4Nzc5YmJjMWU2YzhhOGJjMzA1OTE1MzUxYWQxOTQ0MDdlNzBkOTZiYTExMzAyZTI2ZWVi
ZWQ0NmJiYzY4ZjEwOGI5NmY0YzFkNTg1MzI2ZWZmODYyMTc1N2U1NzJkMjhkZDBlOTczNmYz
NjkyZTA5M2NjNWNiZTk1ZDhiMGYzOWZlYmM1MjdmZTY1MTNhMmFjZGYzMGNhZGY2NWIzNjk0
ODE3MmVkMDAzZjJhNmQ1ZDVhNGQ4ZGQwYzFkNWRkYmExNTRmOTdhYmE2ODU1N2NmNCJ9Cjwv
c2NyaXB0PjxzY3JpcHQgaWQ9ImFudWJpc19iYXNlX3ByZWZpeCIgdHlwZT0iYXBwbGljYXRp
b24vanNvbiI+IiIKPC9zY3JpcHQ+PC9oZWFkPjxib2R5IGlkPSJ0b3AiPjxtYWluPjxoMSBp
ZD0idGl0bGUiIGNsYXNzPSJjZW50ZXJlZC1kaXYiPk1ha2luZyBzdXJlIHlvdSYjMzk7cmUg
bm90IGEgYm90ITwvaDE+PGRpdiBjbGFzcz0iY2VudGVyZWQtZGl2Ij48aW1nIGlkPSJpbWFn
ZSIgc3R5bGU9IndpZHRoOjEwMCU7bWF4LXdpZHRoOjI1NnB4OyIgc3JjPSIvLndpdGhpbi53
ZWJzaXRlL3gvY21kL2FudWJpcy9zdGF0aWMvaW1nL3BlbnNpdmUud2VicD9jYWNoZUJ1c3Rl
cj0xLjIxLjMiPiA8aW1nIHN0eWxlPSJkaXNwbGF5Om5vbmU7IiBzdHlsZT0id2lkdGg6MTAw
JTttYXgtd2lkdGg6MjU2cHg7IiBzcmM9Ii8ud2l0aGluLndlYnNpdGUveC9jbWQvYW51Ymlz
L3N0YXRpYy9pbWcvaGFwcHkud2VicD9jYWNoZUJ1c3Rlcj0xLjIxLjMiPjxwIGlkPSJzdGF0
dXMiPkxvYWRpbmcuLi48L3A+PHNjcmlwdCBhc3luYyB0eXBlPSJtb2R1bGUiIHNyYz0iLy53
aXRoaW4ud2Vic2l0ZS94L2NtZC9hbnViaXMvc3RhdGljL2pzL21haW4ubWpzP2NhY2hlQnVz
dGVyPTEuMjEuMyI+PC9zY3JpcHQ+PGRpdiBpZD0icHJvZ3Jlc3MiIHJvbGU9InByb2dyZXNz
YmFyIiBhcmlhLWxhYmVsbGVkYnk9InN0YXR1cyI+PGRpdiBjbGFzcz0iYmFyLWlubmVyIj48
L2Rpdj48L2Rpdj48ZGV0YWlscz48c3VtbWFyeT5XaHkgYW0gSSBzZWVpbmcgdGhpcz88L3N1
bW1hcnk+PHA+WW91IGFyZSBzZWVpbmcgdGhpcyBiZWNhdXNlIHRoZSBhZG1pbmlzdHJhdG9y
IG9mIHRoaXMgd2Vic2l0ZSBoYXMgc2V0IHVwIEFudWJpcyB0byBwcm90ZWN0IHRoZSBzZXJ2
ZXIgYWdhaW5zdCB0aGUgc2NvdXJnZSBvZiBBSSBjb21wYW5pZXMgYWdncmVzc2l2ZWx5IHNj
cmFwaW5nIHdlYnNpdGVzLiBUaGlzIGNhbiBhbmQgZG9lcyBjYXVzZSBkb3dudGltZSBmb3Ig
dGhlIHdlYnNpdGVzLCB3aGljaCBtYWtlcyB0aGVpciByZXNvdXJjZXMgaW5hY2Nlc3NpYmxl
IGZvciBldmVyeW9uZS48L3A+PHA+QW51YmlzIGlzIGEgY29tcHJvbWlzZS4gQW51YmlzIHVz
ZXMgYSBQcm9vZi1vZi1Xb3JrIHNjaGVtZSBpbiB0aGUgdmVpbiBvZiBIYXNoY2FzaCwgYSBw
cm9wb3NlZCBwcm9vZi1vZi13b3JrIHNjaGVtZSBmb3IgcmVkdWNpbmcgZW1haWwgc3BhbS4g
VGhlIGlkZWEgaXMgdGhhdCBhdCBpbmRpdmlkdWFsIHNjYWxlcyB0aGUgYWRkaXRpb25hbCBs
b2FkIGlzIGlnbm9yYWJsZSwgYnV0IGF0IG1hc3Mgc2NyYXBlciBsZXZlbHMgaXQgYWRkcyB1
cCBhbmQgbWFrZXMgc2NyYXBpbmcgbXVjaCBtb3JlIGV4cGVuc2l2ZS48L3A+PHA+VWx0aW1h
dGVseSwgdGhpcyBpcyBhIGhhY2sgd2hvc2UgcmVhbCBwdXJwb3NlIGlzIHRvIGdpdmUgYSAm
IzM0O2dvb2QgZW5vdWdoJiMzNDsgcGxhY2Vob2xkZXIgc29sdXRpb24gc28gdGhhdCBtb3Jl
IHRpbWUgY2FuIGJlIHNwZW50IG9uIGZpbmdlcnByaW50aW5nIGFuZCBpZGVudGlmeWluZyBo
ZWFkbGVzcyBicm93c2VycyAoRUc6IHZpYSBob3cgdGhleSBkbyBmb250IHJlbmRlcmluZykg
c28gdGhhdCB0aGUgY2hhbGxlbmdlIHByb29mIG9mIHdvcmsgcGFnZSBkb2VzbiYjMzk7dCBu
ZWVkIHRvIGJlIHByZXNlbnRlZCB0byB1c2VycyB0aGF0IGFyZSBtdWNoIG1vcmUgbGlrZWx5
IHRvIGJlIGxlZ2l0aW1hdGUuPC9wPjxwPlBsZWFzZSBub3RlIHRoYXQgQW51YmlzIHJlcXVp
cmVzIHRoZSB1c2Ugb2YgbW9kZXJuIEphdmFTY3JpcHQgZmVhdHVyZXMgdGhhdCBwbHVnaW5z
IGxpa2UgSlNoZWx0ZXIgd2lsbCBkaXNhYmxlLiBQbGVhc2UgZGlzYWJsZSBKU2hlbHRlciBv
ciBvdGhlciBzdWNoIHBsdWdpbnMgZm9yIHRoaXMgZG9tYWluLjwvcD48cD5UaGlzIHdlYnNp
dGUgaXMgcnVubmluZyBBbnViaXMgdmVyc2lvbiA8Y29kZT4xLjIxLjM8L2NvZGU+LjwvcD48
L2RldGFpbHM+PG5vc2NyaXB0PjxwPlNhZGx5LCB5b3UgbXVzdCBlbmFibGUgSmF2YVNjcmlw
dCB0byBnZXQgcGFzdCB0aGlzIGNoYWxsZW5nZS4gVGhpcyBpcyByZXF1aXJlZCBiZWNhdXNl
IEFJIGNvbXBhbmllcyBoYXZlIGNoYW5nZWQgdGhlIHNvY2lhbCBjb250cmFjdCBhcm91bmQg
aG93IHdlYnNpdGUgaG9zdGluZyB3b3Jrcy4gQSBuby1KUyBzb2x1dGlvbiBpcyBhIHdvcmst
aW4tcHJvZ3Jlc3MuPC9wPjwvbm9zY3JpcHQ+PGRpdiBpZD0idGVzdGFyZWEiPjwvZGl2Pjwv
ZGl2Pjxmb290ZXI+PGRpdiBjbGFzcz0iY2VudGVyZWQtZGl2Ij48cD5Qcm90ZWN0ZWQgYnkg
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL1RlY2hhcm9IUS9hbnViaXMiPkFudWJpczwv
YT4gRnJvbSA8YSBocmVmPSJodHRwczovL3RlY2hhcm8ubG9sIj5UZWNoYXJvPC9hPi4gTWFk
ZSB3aXRoIOKdpO+4jyBpbiDwn4eo8J+Hpi48L3A+PHA+TWFzY290IGRlc2lnbiBieSA8YSBo
cmVmPSJodHRwczovL2Jza3kuYXBwL3Byb2ZpbGUvY2VscGhhc2UuYnNreS5zb2NpYWwiPkNF
TFBIQVNFPC9hPi48L3A+PC9kaXY+PC9mb290ZXI+PC9tYWluPjwvYm9keT48L2h0bWw+

--------------Y1gY7oQI0ggObi7uDTnXfL60--

