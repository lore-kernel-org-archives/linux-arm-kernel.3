Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932F2C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 04:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+XQZtMktBy7ekGjf4/plKpxlv6MDb59qUzxqeoByG0=; b=hLIWNEoWGMz8xvJEDcM7U4LuyY
	UfGHX2HoebkP+J/jUCRgyEQyumRQC3639p9MrP0ceHJHwxXxi1eC4wOcICES57nDzyVQG3u7TJEcD
	kKTWJrprHlFX/JLjkFLfx53l/dUJNA2/rA5FBrN1Tc1jjxuB/Vi9JVgr29grLQmsJDW8gX7GpeAas
	DtIe8vf1x9S1oy+6DCnFnu6fLFp+0stKxpEpavs2hMCoKZLHGKnxkqXiYCDB3nQTzdm/ReSC42YqL
	fD/k+gIqs08alLjK5CBcbUYqs3FMmNL7EBXl5f6rH7i8Qka+xx5NfvZT8l7M8A38WxbZaVnqoFrWD
	8Yni9iIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyiLQ-0000000075w-1rAR;
	Tue, 25 Aug 2026 04:01:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyiLN-0000000075B-3KFD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 04:01:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P3vjDj1149120
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 04:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+XQZtMktBy7ekGjf4/plKpxlv6MDb59qUzxqeoByG0=; b=CIKC2iN1ZReAWWl4
	16vuxGWUUJO4xlufvERdBG5vjw/2gSxGqmXPC3TO7qRE01rxoNS3b0E6F0UWkQ2K
	QckfiY4rR5jXrMqy40XdPryMBVmLBSUaL1UuSGjLWV3KIy/uz/xZtAAgmhlzp45M
	HK6JULyoHkGuMBOxSZabRJxkrGFdjLMMe7TdnLRgD8zBLP2vm4w7v9ancNLyWVLl
	TgxoTUwWMI3dGtzARP2pFInlrRH+smkBhuxm1CGTOAzZXx0kht45IKSJhqTpbV9S
	zVl47i3TaNETzacmw0QpARosk1k2JHFISAAOM+BmBeD6LzEjWK1uqsXsKcydMsBX
	GhzTgg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvr09e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 04:01:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848860def2cso4613360b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 21:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787630459; x=1788235259; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+XQZtMktBy7ekGjf4/plKpxlv6MDb59qUzxqeoByG0=;
        b=Gd2bM+p1lK78HMa9Qex34IQVOTLTjcjEayzex3jSLv7bRlFo9WmUvsMJc+SeJScZ5S
         U6/Myjks6pi/JEX9I3Y7oqLhpQGjFxBVxGUoRLI/HH16arZWTE3HKxyv525OnlhCg66L
         GPlCdjrold/Uptp33WbP/VrFJp9dkcqo0E9uGTNxPuEmLJ+nont9s0XvYr0X+gKBrL6c
         LQXB152uJkSWIEUqH/Bz/U4QnM6HNFa2p0KBxyGvxaMjMTR9lEcMju38EwMYcG0Cbcia
         1jxD4lEkLodulHKMF6kvDmvDUoHNO2Xq7OJyVtCkgBDKp0dbiLFQ3qm8xJgCReJkubzN
         mZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787630459; x=1788235259;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+XQZtMktBy7ekGjf4/plKpxlv6MDb59qUzxqeoByG0=;
        b=Yvh3FcMcsNjW/sGSGsAZb4qxFqC8u6BwoyONyVeOES8kfUSrU30LZ5VuK4+jVp1uY/
         MfqPqPgSdCLGwHN2OzWSZzTaRERBPY5TF9pogZcWppjxwDmH8JFVwWGh2L72YopvUu38
         CQ84tfEvZpTTITrxkBToHeAq0bwifVu9Qxe4nA/dTQeyOCjRdFsNi88hNv8Wa22sBfxU
         xBVr4muBs5Eqxgsk6lczw4WyChBgQlbY3lhJFb2JnxUqG9NG7z+TQNp3V0mshK5+L5lA
         siKswc10VvZXh0pniieH8n4qd/aGrZ8XVD+kTulPpPCAbOqbfTEdQFJXf531Wv4BomsX
         mw7g==
X-Forwarded-Encrypted: i=1; AHgh+Rqiwfg16fR4GGPYjLbD/kImCplODxK5ukt3jHoy9pOh1OwgPMfO7chdweNCrNgnk022c3tGEi+mT1pBEqIHsIP/@lists.infradead.org
X-Gm-Message-State: AFuF++mnyjIJI4PcaKl06WR9QlSKEJ6nnoIH8GXr9opWO3GD/E7GUm1t
	teCUrpqfzqGOzLuz9W7WlcqJI994njCMCkwlpmzP+P1hXPUmqzk4ci6OA0JQ38qn3p/Dia2DOqx
	z/VizKn1f59sjeAxJ/PuFgny3cMXUVIjJ4zl1h0EMy9/DGPebKk27miWXJ7CIiOV9vzLD6s8oG1
	F19w==
X-Gm-Gg: AR+sD11WhAcvX6tieaF4PTFk/8FCs5+dn+qfsuoI0JTBQzFdKoZrWM+Wd01QyApKJk7
	LQoOh5CoeNEi7qBkcx7urMTTC7LWhivq+yiZ+7bDLLEC4WlalfrCyxJAc4qophXEZfI6tJjJWjo
	0WNxFAa/vupSdmkQ28HczUJdCMO1Kh/j6rYVl5anLppJd5MKGu1ZVbvasUbj6WJ05Kaq7n7kE3e
	YPwDYnRhfY2iSkamnXGLpQVi8WYXtyPc75b8eT7rdyMfvGOY2ACum2jLPgcjqaqqcl42UFwI/+I
	8LmE6ZIX33/TrT1ZziEUlfxFwxH3M4HyL8FcXRWJyosvs5n4aqzZOtfBMDr0rha6CqLGNcPPyid
	jEE+OkWOqpCpjk1v2GxAItdQZHa+uBC0=
X-Received: by 2002:a05:6a00:4c13:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8520b98be69mr40252190b3a.8.1787630459239;
        Mon, 24 Aug 2026 21:00:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c13:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-8520b98be69mr40252038b3a.8.1787630458620;
        Mon, 24 Aug 2026 21:00:58 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f1638aesm2534359b3a.57.2026.08.24.21.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 21:00:58 -0700 (PDT)
Message-ID: <17735f83-fd07-4fad-97a3-727cfbeabbcb@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 09:30:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] serial: qcom-geni: Use geni_se_set_rate() for source
 clock configuration
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
 <4e0d636a-7975-4711-8070-6f71957b754e@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <4e0d636a-7975-4711-8070-6f71957b754e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAzMSBTYWx0ZWRfXwfCSIGaxqXe1
 +sQ1Yd1ciEJJw/xwQ9HusKtEeLEFO6REz6wBuWgsnydb7YhdRs0hhu5qodnUb4ImH+pkw/ba2Xj
 iw8MDK2uO+gh5LBew/fLaO3mY047rqx+sjEKCuE+7uC9isP9Ir2sW2KqpDFrtrSBtq+k5C4W62K
 V5PJRjmwHNa31Hm2UpnVxkvl3RHi77whTeBcM0Rgnxh4OXgwOIR2z8Str6nBcIpgw0A28y9iENQ
 0d35u7hUUPQ1wGqXXinDHrtzujkS5kfrVJa/ycWSBcD2crkluam1CEHOXxbBGvagNED9hACPIh2
 VO1T+pWHq9s2Ej180oIyZ4Xu0w6rDssYfWt+NU3QyvlE/pu0PQP3rWP3Cv3W4PwV7X9azsJtG4F
 YBsAZVa0B1EMmDW9sPHt4FAg2JUi1j/GkyoKp6OSAUjd4h3LUUeWxHACs7m+MWnxKVgElx8Uh4z
 l2hdZJn3G5adnEnm22w==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d137c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gztmCChag-4to_nYmxUA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAzMSBTYWx0ZWRfXwKwCfR450mtC
 f5K6NmRbdEC25dfBnI/q3RkgJqRKOozEYT+qgQqVq+tWYpN+/aEmIWRluY8EFKt2h4bVg6GtYdZ
 Sx+X4mRmFIl7mKS3vIcVkolQIhDhZFw=
X-Proofpoint-ORIG-GUID: jldCZSVFx-VJ_SjLsB_jyi_uJ0qkaMf1
X-Proofpoint-GUID: jldCZSVFx-VJ_SjLsB_jyi_uJ0qkaMf1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_210101_978982_F5CA7735 
X-CRM114-Status: GOOD (  16.38  )
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

HI Konrad,

On 24-08-2026 20:35, Konrad Dybcio wrote:
> On 8/4/26 9:57 PM, Praveen Talari wrote:
>> The driver calls dev_pm_opp_set_rate() directly on uport->dev to apply
>> the computed source clock frequency, and dispatches baud rate handling
>> through a per-variant dev_data->set_rate() callback that either
>> recalculates the clock divider (Linux clock managed path) or selects
>> a performance level via geni_se_set_perf_level() (SA8255P firmware
>> managed path).
> [...]
>
>> +	geni_se_set_rate(&port->se, 0);
> This ends up calling dev_pm_opp_set_rate(0) [i see this is an existing
> bug in geni_se_resources_deactivate()], which removes the power vote,
> but does nothing to the clock (neither set_rate nor disable_unprepare),
> which will crash the platform
>
> Both of these calls (new and existing) should be removed. Clocks will
> be disabled by geni_se_clks_off() in geni_se_resources_deactivate().
>
> Then, we should do dev_pm_set_opp(se->dev, NULL) *after* they are off
> to remove any trailing OPP resources (i.e. icc votes defined in the OPP
> table in our case)
So, if I understand correctly, the expected sequence is:

1. Disable the clocks.

2. Remove the OPP/performance resources.


Thanks,

Praveen Talari

>
> Konrad

