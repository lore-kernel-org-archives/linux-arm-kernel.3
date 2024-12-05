Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64543E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 20:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhonhl3f0KVfqrEwEvN9gKCp13rZK3mo8Db29qGWI2A=; b=yP071j0lTaRfjlV4bgpGtgu1+t
	NgJZgII4A31y1373710MljOSqM4FfczX67Ed15+AJTM9YGasvN610zQvz+hf8IjoZF1Av90BZmrMk
	sf7weCPCm06TuiaVvaJ9JEezx+2tTgMezDuzW0gW8MBdhHmogEBahiWD9v+4wvN8sbeNFCchGrTIT
	BTBLehxwFSNAr8a61TmSXv5cU+CuH7j8u5zmXuCMMl9eZ2lcc2flWG23NssuHIgmf/ebhEvlLiCOO
	V9NbWfJcvxONUZ7SXmSVmm5KTXe6fclfOM4UKC+Rnw4n8LeKWwTXIwU9eJUwZT7EHajgHzpfMRHVv
	5HQ9U9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIZg-0000000HK8B-3gXE;
	Thu, 05 Dec 2024 20:35:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIYe-0000000HJyW-1lYC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 20:34:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5JhhQv018614
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Dec 2024 20:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhonhl3f0KVfqrEwEvN9gKCp13rZK3mo8Db29qGWI2A=; b=kj3ZAhfypRzfgpnN
	KO6tCY6mxpbXS4AlC5hD/3RaSK0IAG7HsKrnchao5kIcbpzRzBqpj4klLk2G1Z1V
	K/Vwi96yx3kn2XDIUspq0JV2c2I7OqWlE+pQfGLyBq15Hb4IdeNgXUg8uowNaFLF
	I20MESd2g3Tv9I4VxlLEmEjT8fIbUm0906ArdIuKfCq139TCR1+PiTvlJ/46mwl5
	20R6y/HYP/LuAVda72wUAjyTVpJEvv/smrltTBPVW1/ladSC4smBxpfjAoWd2oKK
	Vqvci9tXGzb1IaETS444IWeuVer72hb67jUYXgfys9GeINVbCI3072B6G1Tcjy2c
	9ghHsw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8r39e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 20:34:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d887d2f283so3379566d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 12:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733430882; x=1734035682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhonhl3f0KVfqrEwEvN9gKCp13rZK3mo8Db29qGWI2A=;
        b=vgoM8K93k3PElo1MiOwAldTaB7DbVlTgkMR5rMTjUQehv3n9sdJ6kbPhGGOy+Exubs
         SMPZdzkV5S+msqzuSTO7RKDOcTlOMHkwJ5faciXLkEMd4Wabc3y/iw4E82Ay3jM32uzF
         z+KfHA5sMEsRm1dLJETZ+niWtoF8KgAGNAixxNc/qWdWDERYLM1R+30RnqfiUVBa8JtE
         siufY4k9QfhBbW5xtSvK9oV/0zm5ixwfOtEbLpiAGnbg1vlCJOfQEryfJgJDRokStcy4
         2D7P/5+BBzB/K9gsLUFj8h1itALKsIo9Khd6NQzSa+IvvJnFKR3fD+lIt/x4s2Zs4s6/
         WauQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrWELgbXtdOO9T2kH9u0dfb3GqNn3sWbzu/JJ/K7Jk765Oi/8SlX4fpfD6bWCoMmT3sa+5B8bOY5WpglP2k+Wa@lists.infradead.org
X-Gm-Message-State: AOJu0YwPvq0E+UGxZDNkY014oM3octHQgyadgV70Cjknpdsz6Z9OXLWw
	d89o0d8+8spnpFTJfHwYd4Aq3IOI+JEWzDfACWA92LWuAxeZ6CrdvRD+KtH44tM2gN0+G85QztQ
	P/3HuouYMzsmraYpAIFni7et4eWYPiQXHvoH4MrzJoqWPNW7WYwERqL8PjJQwUp39RJdRbMe28w
	==
X-Gm-Gg: ASbGncs2LJ/8eCmvYku4PhbPn0GE+oHpEm0TECQ9N1tImEmwXmraQZy/TEevjvtsjIm
	2KsXevs5FPh21NFHKBtMUSyHn9E94ly2XEboHR+el6sBLSlLAqKFbRc9OsjkVyHozrTJtwzlRGD
	QfW/jmjrAipiVwTIOaW0tXFyAg7H6TJSOt9kUBkSPplOVeuU3KmsM2rmAI+Tr/OYe4uB452H839
	dbbxpZzLDp/blfQ18bOUTn452qvvJMcSTNZKVVNG4xF5zHjYyeswN0G/SansZk8VdHMlNpZxgeD
	ag/j6HHinhgzjLd9uUx0YJ5Lu0QHCAw=
X-Received: by 2002:a05:620a:45a4:b0:7a9:aa70:1cea with SMTP id af79cd13be357-7b6bcadba57mr36640285a.5.1733430882194;
        Thu, 05 Dec 2024 12:34:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoQNFpq0a9qMSUr93HSZrZQJ/cvywQ6beoPoUJWV+eA6Tq4C/Pu7PVHFFrF0k1p0C00Rq2gw==
X-Received: by 2002:a05:620a:45a4:b0:7a9:aa70:1cea with SMTP id af79cd13be357-7b6bcadba57mr36637985a.5.1733430881826;
        Thu, 05 Dec 2024 12:34:41 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e5c5d4sm137138066b.7.2024.12.05.12.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 12:34:41 -0800 (PST)
Message-ID: <72add0ff-db2a-44f8-b4af-0b5fe5f65f20@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 21:34:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on pre-SYSTEM_SUSPEND
 PSCI impls
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <CAPDyKFpGrw+vOs=-TxfChBeORjzkpaL_iVB08MtmaC4sFNKzcg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAPDyKFpGrw+vOs=-TxfChBeORjzkpaL_iVB08MtmaC4sFNKzcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QK0aW24siqVtCLwpH_D603mX4z0XIXTQ
X-Proofpoint-GUID: QK0aW24siqVtCLwpH_D603mX4z0XIXTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412050152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_123444_583411_46095CF4 
X-CRM114-Status: GOOD (  31.70  )
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

On 14.11.2024 4:30 PM, Ulf Hansson wrote:
> On Mon, 28 Oct 2024 at 15:24, Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
>> CPU_SUSPEND instead. Inform Linux about that.
>> Please see the commit messages for a more detailed explanation.
>>
>> This is effectively a more educated follow-up to [1].
>>
>> The ultimate goal is to stop making Linux think that certain states
>> only concern cores/clusters, and consequently setting
>> pm_set_suspend/resume_via_firmware(), so that client drivers (such as
>> NVMe, see related discussion over at [2]) can make informed decisions
>> about assuming the power state of the device they govern.
> 
> In my opinion, this is not really the correct way to do it. Using
> pm_set_suspend/resume_via_firmware() works fine for x86/ACPI, but not
> for PSCI like this. Let me elaborate. If the NVMe storage device is
> sharing the same power-rail as the CPU cluster, then yes we should use
> PSCI to control it. But is that really the case? If so, there are in
> principle two ways forward to deal with this correctly.
> 
> 1) If PSCI OSI mode is being used, the corresponding NVMe storage
> device should be hooked up to the CPU PM cluster domain via genpd and
> controlled as any other devices sharing the cluster-rail. In this way,
> genpd together with the cpuidle-psci-domain can decide whether it's
> okay to turn off the cluster. I believe this is the preferred way, but
> 2) would work fine too.
> 
> 2) If PSCI PC mode is being used, a separate channel/interface to the
> FW (like SCMI or rpmh in the QC case), should inform the FW whether
> NVMe needs the power to it. This information should then be taken into
> account by the PSCI FW when it decides what low-power-state to enter,
> which ultimately means whether the cluster-rail can be turned off or
> not.

This assumes PSCI only governs the CPU power rail. But what I'd
guesstimate is that in most implementations if system-level suspend is
there at all (no matter through which call), as per the spec, it at
least also projects onto the DDR power state (like in this i.mx
impl here [1]), or some uncore peripherals (like in Tegra's case with
some secure element being toggled at [2])

> Assuming PSCI OSI mode is used here. Then if 1) doesn't work for you,
> please elaborate on why, so we can help to make it work, as it should.

On Qualcomm platforms, RPMh is the central authority when it comes
to power governance, but by design, the CPUs must be off (and with a
specific magic cookie) for the RPMh hardware to consider powering off
very power hungry parts of the system, such as general i/o rails.

So again, PSCI must be fed a specific value for the rest of the hw
to react. The "S2RAM state" isn't really a cpuidle state, because
it doesn't differ from many shallower states as far as the cpu/cluster
are concerned. If that all isn't in place, the platform never actually
enters any "real" sleep state, other than "CPU and some controllable
IP blocks are runtime-suspended".

This effectively is very close to what ACPI+x86 do - there's a
co-processor/firmware that does a lot of things behind your back and
all you can do is *ask* it to change some handwavily-defined P/Cstate
that affects a huge chunk of silicon.

Konrad

[1] https://github.com/nxp-imx/imx-atf/blob/lf_v2.6/plat/imx/imx8m/imx8mp/imx8mp_lpa_psci.c#L474
[2] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/nvidia/tegra/soc/t210/plat_psci_handlers.c#L214


