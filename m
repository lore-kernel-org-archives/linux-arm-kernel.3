Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF707CCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gHWSTOXAK11dHbhFaZJD674H5cswRRHK4YqORV+tgJk=; b=TdOcz+QRW/FiEcSwFa454P+XMA
	kJe2//a3Qoc2hIEs3Sw9qiA8bD7R6zeEGN5c+adutNqrCFpcv7q5Kpobs6GSd3SLrz7LJfZNUocEY
	FbXdtOCzLgyzU3EMNMaMdUzo+UPQOgqSSkagdjircaTItC58PTwWB2DNA9qcDMqcVfg0wO9pm0Etz
	/FlHFbsmB2E4XR12vwTd9apfDRUGKh5ulmDZmra7naV06naTtl06Piox4kJUOBm1BsKk3I3IRxLER
	aqLYvCmzr1N+INKP2UlRydwHuQ0qAn79/p6Hm50HLH9JfGwESYLx7rNGgvTkgpZ+gkcd9JbISUbcU
	MOL9Njbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlyo-00000007Kdu-48Vg;
	Mon, 19 Oct 2026 11:56:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlym-00000007KdY-20UB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:56:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OmhF1348084
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 11:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHWSTOXAK11dHbhFaZJD674H5cswRRHK4YqORV+tgJk=; b=I64/bdITvizEuBN7
	CN6iaKcaYuqx6Oc1kMybp5O8icKXh1vS84CEeRJb5p9lmR0WkKNDxPbhepyYdyR8
	BKsakfc0d0HawUpzZ7SaxejVnakOxBVMLKfD73oW0Yb+j17ITn7pMDXiKL+MB0EN
	osmkEbgC9lsuHyt/LCZrGfewtsSbh1wIbgvKOW8XvlePaGJEtRsOuIme52By48Sf
	4yTcaS3TBUy5Tpz1PXKeKZVHTLtHfU3XHPvN4lKiqphniohqJ0ZxTvplDl1Z6qJp
	qhs4Sbg9FK6Y3h3PfIAPmIxn/n+nwVFzVC3Pj+ly+HxvAAdEFbBvTDgI2debwBAr
	NmeUqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rgwm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 11:56:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533758f24f4so3561281cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410995; x=1793015795; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHWSTOXAK11dHbhFaZJD674H5cswRRHK4YqORV+tgJk=;
        b=NQNTKOaVjKlZlc8dl1MeOhYCx4WryOKm8cqqfThkRbDh+XZ4mdjAegtZvHvbtMDkhj
         zKxb0TzMm0Hzb0PPjnpC/ns0e6VezRuei9Pdai8l8pccpqE1ln/firIwKHPF2jLDPESt
         CXb/eB0MrHyTw4zV9+ntm3MWcCBGU6EtumdLwbRhzLUvoUj/hp9TwRArKoSbTAcCk2+C
         LlKB9X8vMnZKKYnSaMo8PaTnt/LGdprAkHoP8Z6UTFOjZJ5EraqyGaLLgVbmFMdKAeP7
         sS4ybeMywAGboP91j1nfgvSH7aNCWjhwKH81aoftGROW2iwWz1Ds3Yq4N1ARC26ZyNhl
         2qEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410995; x=1793015795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gHWSTOXAK11dHbhFaZJD674H5cswRRHK4YqORV+tgJk=;
        b=LVBJD+TZ2gn0Re/mLEV82wn5sHfm564S276ipbqScPm7tcpvkJGetxVmTVYegIe3Tx
         jLTibpgzj6MMo7LW3oCWCK8vWTqWEUFUD82brjERXBoekd2ciEZlRNkYQbjfyRFZLUk8
         fk/i6HbWkRB0XoSfW3XA9g9zN3z3nu7+PSeFto3FTZBY6ITVphknvkXuypdSAsTWyt19
         Je38ajjaeANd7mXd6GBsm6nNReh+E+B9R05EGJjeH7T/vmQyVw5j3QFq4LYhLNr+FbDD
         uXHblA4Zk8PndeXJNqABya1JuS95Wbq08T8xj8USjrKjnvS5iYq1ZRDa8U5bg8Au4WNu
         3qEw==
X-Forwarded-Encrypted: i=1; AKwUvBz7heJrpWCuOe+4lebvc0txctQs4NbJJgl4J6ZXRg0Z4nK80xFgC1HzFgmzj6gKdKqj6QO71980xvhoao7sa6yU@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+j/BwaxzQ7YTR31UIZT03pWKqU/SIenKByeiRzz1u4pU3w8rd
	O0hy6ByWcEjnnubZNRU+LEiHD97gk+JNKwE4uNJTTIY7JFzOkUBLlLWb7VmWrhR/UKbmLQhXXcK
	0g/CEFDv243vZ2Ai6yes7BQtQsyl4AnoITiwTSC33ofVXQIDLmw9JIt66j+X63t32RD7TjTCCmd
	DssA==
X-Gm-Gg: AYBFou3Ofn0HTeRA4smzbpWTim5aLuLO4CHIEXzQD9VQ2Sjrv7C9UNX/aLBQnFW3uiS
	WAuDjJXzSuePSw/j4wFS1bg415qvSu9fCyLzLK+PVpjiTOiYgqx0sdlaOsRxYphzFXr7BNBsjAu
	k0CA4MlImRX/Ofl+uQRFP8ZgATlJ75ERL0pFqIRc5Wv8mROxqgiuWG2m5X/qT0a9c4SZCcp16ii
	yuTFe3WXg8yaSBpo9hmshawtwIclxsJA35jBFcfy+ALUxP+QjqHj5OinUAs4WOMoYNr6cslCFxt
	S6ioru8eo4qYBzyw1VYR9ag1JdH481eu8wEiFcXfc0aS1fWV+vjYl1+Xp/0MnBpF2KEnKdmOkJK
	ZoPF5c+STCZbN2ABaMsfFTw==
X-Received: by 2002:ac8:5a8b:0:b0:536:61d4:cc80 with SMTP id d75a77b69052e-53661d51a96mr77425571cf.5.1792410994827;
        Mon, 19 Oct 2026 04:56:34 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:536:61d4:cc80 with SMTP id d75a77b69052e-53661d51a96mr77425281cf.5.1792410994368;
        Mon, 19 Oct 2026 04:56:34 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ca52esm366595366b.38.2026.10.19.04.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:56:33 -0700 (PDT)
Message-ID: <b833f6f9-5729-4936-8c5b-cd42d32c5198@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 13:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] irqchip/irq-qcom-mpm: Program wakeup timer when
 CPU cluster goes to LPM
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-5-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZDose7uDvIS80YfnklnY9fQKCmpHA21p
X-Proofpoint-GUID: ZDose7uDvIS80YfnklnY9fQKCmpHA21p
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad60573 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rqCDwAl6iYQHjBXnP38A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfX0byXM2Jo81dP
 echVuRy+JDEitFQeo6XG+a126KSn0s+k2L3BB830iSwZ3KIN+CO7W3nyHx2vK0N1xy40aQuxq03
 d1qIwQeu1yecRE8SQomQC6QQZu39pPJbN1RVqE/tIItQE9W9mmVVnk7ySh0w0sBe+WvW2LDdMlx
 3CGAPbAyg8SsfAEYD/hIjaFJxsw45p3lgpUJa83RDVsg9tPFMNOwcnI3ltVr8oWc8k94HlGhztX
 kvSGOsBXHqdOvkLWDrrtoPKtgaMOUKb9iDyDQdkCF+83A4RMFK/v395vem6MDt9WuvBjfIGOw3f
 ukSh57oiADXaLrn5wTWoobeNpcc1iPFdDdQHo/2beAu2s4GBosM39C5s6ItUjLDfyOMTQUEDyM1
 Rlb3agdX+QsY9v7zmuFjG6Wa5Yo/epiRRPCbjvxJ1aocStUxS3HWm9eI90ycHh/uSFAt6ptprGr
 sNj76CQOT5eIqTPOVpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NyBTYWx0ZWRfX8pgwA58+yh88
 6CvNfIwrJYbzchaZWyoe/Wnn+nv9GSJgtUvdPFntoHa1YArtugfvyM1tmb9ktOELwiGgUzQG6fM
 YhmDQ89WDfUrTnQ3zLs14TsXHTdZG/E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_045636_524605_B5F387D2 
X-CRM114-Status: GOOD (  16.95  )
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

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> The next wakeup timer value needs to be set in MPM timer as the arch timer
> interrupt can not wakeup the SoC if after the deepest CPUidle states the
> SoC also enters deepest low power state.
> 
> To wakeup the SoC in such scenarios the earliest wakeup time is set in MPM
> timer and the Resource Power Manager (RPM processor) takes care of setting
> the timer in HW.
> 
> Add MPM timer programming when CPU cluster enters power collapse.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +static void mpm_write_next_wakeup(struct qcom_mpm_priv *priv)
> +{
> +	ktime_t now, wakeup = KTIME_MAX;
> +	u64 wakeup_us, wakeup_cycles = ~0;
> +	u32 lo, hi;
> +
> +	/* Set highest time when system (timekeeping) is suspended */
> +	if (system_state == SYSTEM_SUSPEND)
> +		goto exit;
> +
> +	/* Find the relative wakeup in kernel time scale */
> +	wakeup = dev_pm_genpd_get_next_hrtimer(priv->dev);

This returns KTIME_MAX after the DT patches in this series are merged
(because there's no power_domain that the MPM hangs off of anymore)

Konrad

