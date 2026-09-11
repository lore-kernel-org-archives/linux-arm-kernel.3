Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7413EC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 17:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPB9jOzHRtxTVRXGIwA8nn0Paav15K4HqTW5Cby2kBM=; b=djz3t9zRKGw1VWxkYGtTDt+OMh
	79Btp7YljIWLf8UPHmP9Th2n9h54jlYEQziYTTMmWEdcBri2cW0LbEgHUrvtSaJNP8Ry1ZFRezRUs
	QmDHCAT3mKYtnkgIZSHIHUqTESup+VUuCaT10Q4jZHGi4wmkdVc5e+io6mbG095u0Tu5y9SsKrwPe
	UBjjjP+Upz3o0oB+ND4uMSkNr1brIV09QxdpYvXkis14NYHJOZmvC+X5z1gbEvH3KsQLYji3aSJaW
	e3Z6lfe8O+kXJhKp0lQo+gqh2po62d1lwHoQpWiohStj9BQbBp8ByZnq1+M2Dkob7Bg321n0QCgOu
	tm1Iz+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x558I-0000000HMOZ-188Y;
	Fri, 11 Sep 2026 17:33:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x558G-0000000HMO1-1Ja8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 17:33:49 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWlXL1461965
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 17:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EPB9jOzHRtxTVRXGIwA8nn0Paav15K4HqTW5Cby2kBM=; b=cc/b+z6x51RqC4LR
	+sEC5aT9eXjCvmigj+mJVB7E4YMABRFH0qxeo8tng4VITpnJtyi2DTEFxcxdHtp+
	Z/TMZKgb7RUG9Ysd6wln2/M0fwunLiU9RH8GMf4K6kHDQmLUR/7HSLe2wMlUh4e7
	bPyyeWzllqme2cw0df9qRe3HWT/mzLgUvbSsapvB5zE/Ayo70PPEWsad+vxBJ9Ex
	DIHlg5TNaU1s4/WSLwdBaOp6LStNMUpL9Te1UJE7n1Xo2VIgdcOi15JY/UXkq1RG
	07kggEPNWEvfgkWR0yN5/brxtxfcss29TeSBJkkhyiAR9Sw7Ow3y2SfJdDbTLFiM
	DbY4wA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmp0dg1a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 17:33:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so2253623a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789148027; x=1789752827; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPB9jOzHRtxTVRXGIwA8nn0Paav15K4HqTW5Cby2kBM=;
        b=YWTZlQEj9IzUpqncrh5Q0bfcj5eEZtniQAXGVKxBQDW5DXiHuHFBWWLqMsk0d0i27o
         3hdtepYXd9cauufwG6U8F5GnFgRUL6CHUdAirm2Ziq0SkUE8w99vTI4UcBXW/cxh3OLp
         CogKiL97FurSI39WQZ+vwrRHHeCNu8ZV9GnDroEtnko63atvMcEMHRl/S1rX8CvfveEE
         DjpZE3vjc9xP486bDsbbkHfFth1tM3Imsyvkpl+pvKsKtkIyVqtjF2f+npHDkMLbHA3l
         qmsSDFifdvWnKj4Iq5SsPoHT7Bvc5VjaKjG/gvbuCFlq++X+NVtGCIW6PV1LGSCez6ko
         JCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148027; x=1789752827;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPB9jOzHRtxTVRXGIwA8nn0Paav15K4HqTW5Cby2kBM=;
        b=L81N+YK7VB2PRKMzIhHmBs61wP8fcaFjU8OHEPpYsRD+kLRvxh31xTNzHyPBJxL27t
         0e1RxbfUcewBj108XKGpzUcuEOdk3KuErHXrf74Nhh1VJpX46ybEsbc9nsdc4mtzY71U
         aG7p0omCDn0JRTlC8z6YbZAo8dc73HTQ0oID3lj2Xbbvq8pQRAzFageosHs2eYt1n7Wc
         NdJ5uv6jlZ3BPfpBpeT6TpSJnRjwlE41LMTn9jR7Qn7xPQryVVfvgpXe/7k73TuZCqVA
         +Nc0W3Sil2QlWz28c+DvQsqQCBJzaUDGJw3zIgl8ebEyiOQ13TSKp8ErS9fZkNQPse8x
         Ud9g==
X-Forwarded-Encrypted: i=1; AKwUvBwaYxyjezR7VCvKm9fdaZhsiROSWqd2F0o+9lpiXMeQdBSQrOdkW4s2KnNmExCNiZF5BTCRyrOaLuDHTGaObv3/@lists.infradead.org
X-Gm-Message-State: AFuF++lmr8v3LVIeuMu89osMiw5IELHJKhOju9sjzmHsUjfqX9/CtIuB
	Rj2A8IcXGERqJEwTPH3LGKk7Za3mKpSkG9tUhpin5U1NrJQt2K84u/TY5Jvy4jLI6sSsKer5jik
	YM42z218/HJBaKnhlvffCpW947myNfs8ohEFdXbUljkCQbHLVw7nXJy0VFGVwiUta4wVJ4jjTq0
	Q47w==
X-Gm-Gg: AYBFou2q5URq08rU9zTCYhpQfdew1+2N/LnlhtsHvnCe/2PaZdzf6uDg0jbtU9nXPa1
	13TzZ248mmjb5Iijmnu0/nCDxplS6RAgkBHGKwQvqfOlkV+rTVGgSUY80DG77BFTTG1maaKDIVr
	CCX8yPq8f2zFhQI0245dzsWaWP0NQ3IuCoekBQNapy9Hwx0VxK7zxJuqaljog2chY2rAMobIpAF
	OeyPDonZnkAIzMoBMCvLOItZSeourZ3NeSTTxJhhqaZu01LTPZ2d41FeUmA2SJQcLAUq4mGvutp
	VF0rLMXXljWMOwtlBQzD1LoaZzXALvE2uLY140JjIF5SZB1q2L8N3aqXZeCR1+7F8HoiKEK8qym
	bIzdDrKsTZ9KuX1oEEgDK/NhTmRCMpXkH
X-Received: by 2002:a17:90a:da8f:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39d9bbee490mr8584052a91.2.1789148026775;
        Fri, 11 Sep 2026 10:33:46 -0700 (PDT)
X-Received: by 2002:a17:90a:da8f:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39d9bbee490mr8583885a91.2.1789148024735;
        Fri, 11 Sep 2026 10:33:44 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.105.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98a58d23sm6853266a91.2.2026.09.11.10.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:33:44 -0700 (PDT)
Message-ID: <6c28e672-349c-49cb-892d-ec521b3004bf@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 23:03:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com>
 <177884a8-902f-49be-8fcb-b2bec3ec7d6c@oss.qualcomm.com>
 <CAPx+jO8bXn2F3cWz87Ozjrh00E+a_UWBrHeUViTEkTL87JHW9Q@mail.gmail.com>
 <0f5494c7-c3c1-4668-a09f-d8c43d1c58b9@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <0f5494c7-c3c1-4668-a09f-d8c43d1c58b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U7EHnuru c=1 sm=1 tr=0 ts=6aa43b7b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=KFINdI5Z0390/lZYonNNQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iiE2cmy92MJpIBaOhi4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: uw2B99iAiGaq6YM-9fwAlqMLPT-xiYth
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0NSBTYWx0ZWRfX7b2cGjdMq1RT
 lVdIFAcZZKDpmgIDI+hi9ohBd2umoqC7Jxt/qIRQR0FgYamiI1EbdGvtIXbZYDPUSFr4HUIdCAl
 z81wEkDGbCO2jWjki8/JB4sCdPPne2E=
X-Proofpoint-GUID: uw2B99iAiGaq6YM-9fwAlqMLPT-xiYth
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0NSBTYWx0ZWRfX1Og2gMMkxjMY
 QWXBCVS1N12jUUjmmQkzPGf36VO5aA//hesseorMGNwQfaJ+GPQa237p6g0/Ew5inH0rTRSoGHg
 8bzyo2vz4mGEe+6PF3vXq3Eam6YJFQ/Ck8maM458MlrwiJZTHLgR1ev+6i0noOiD6tDCQ6hQUKr
 nYNt6jnzimu7JV574PvrGhGDWPhBLyawmUMnKL2mc5oP1U3FsIKJxW7gAZMXYpWhEjTvA/1Ptya
 5cNhAffCOgST360YsTgibs0VXUzy2Y82UmbpFBaCxNsXuAJnPDJjzJlaQdn0UoZ6TQcNkzfkO+p
 RH6B0aN+U9nWIHgsr8cx8ST0THdes/koNhB2BADxafnJXaIuOYw42lr0bxPYub0lZpcL23BNPq6
 RrhVdb1jE397d2myRU8EgDgshlxvM4OWwtKy713v3xM3R04wVTv98E6YTKRMeGi9+i2BHhKd/yV
 ENBF6lGhb+ukoAkS1ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_103348_361615_5C0D15DA 
X-CRM114-Status: GOOD (  22.41  )
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

Hi Konrad,

On 04-09-2026 14:30, Konrad Dybcio wrote:
> On 9/4/26 9:56 AM, Ulf Hansson wrote:
>> On Tue, Sep 1, 2026 at 6:48 PM Praveen Talari
>> <praveen.talari@oss.qualcomm.com> wrote:
> [...]
>
>> So geni_se_clk_freq_match() is used by two consumer drivers today,
>> drivers/spi/spi-geni-qcom.c and drivers/tty/serial/qcom_geni_serial.c.
>>
>> Beyond the $subject series, there will be even more consumer drivers
>> that call these platform specific functions. As I said above, I don't
>> think this is moving things in the right direction.
>>
>> If this can't be solved with generic frameworks (clocks and OPP),
>> please clarify why so we can figure out a better way forward.
> The way I read it, isn't geni_se_clk_freq_match() more or less
> dev_pm_opp_find_freq_exact() called in a loop with an increasing
> divider?
Currently, geni_se_clk_freq_match() relies on clk_perf_tbl to
determine the source clock index and divider corresponding to
a requested frequency.

On Linux-managed platforms, clk_perf_tbl is populated by
geni_se_clk_tbl_get(), which enumerates the supported source
clock frequencies using clk_round_rate().

int geni_se_clk_freq_match(struct geni_se *se, unsigned long req_freq,
                unsigned int *index, unsigned long *res_freq,
                bool exact)
{
     [...]

     num_clk_levels = geni_se_clk_tbl_get(se, &tbl);
     if (num_clk_levels < 0)
         return num_clk_levels;
     [...]
     best_delta = ULONG_MAX;
     for (i = 0; i < num_clk_levels; i++) {
         divider = DIV_ROUND_UP(tbl[i], req_freq);
         new_delta = req_freq - tbl[i] / divider;
         if (new_delta < best_delta) {
             /* We have a new best! */
             *index = i;
             *res_freq = tbl[i];

             /* If the new best is exact then we're done */
             if (new_delta == 0)
                 return 0;

             /* Record how close we got */
             best_delta = new_delta;
         }
     }

[...]

     return 0;
}

On firmware-managed platforms, clk_perf_tbl is populated from
the performance-domain OPP table during domain attachment,
allowing geni_se_clk_freq_match() to operate on the same source
clock frequency information irrespective of how the underlying
resources are managed.

As a result, the frequency matching logic, including source
clock selection and divider calculation, remains common across
both Linux-managed and firmware-managed configurations, while
only the mechanism used to apply the selected rate differs.

Thanks,

Praveen Talari

>
> Konrad

