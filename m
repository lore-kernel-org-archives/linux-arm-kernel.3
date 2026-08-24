Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33208C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDK2q8jEQBsx6u42K6XSBrp2/fHnP/dHMqcLRjUxZpE=; b=umqs+MH+EOuEHKyI4ufatZauo+
	/KwOAgM1DEr9i2t9/MBKUctzs7S/4mfZE0RenXUUZjrIOhw3NaWIW9VnLQGFZr+BHIWJBJ5ZZRRgy
	aEanbcihdnnUkwjyVAvF2D+8GGb0DE5UeuYo/NfaEfXYb9U/0MfLgJKugrcTafFB2oZMB0rVdyxLX
	fWauKApldwU8//HUVawYNxgo2MQlFizr9irYJWJ7hLzg7/KPrwMJgKvNUZU9G69mZome9sEIhAa4Q
	mMLclm1KWR59Tqaq5zoDtm3QibxIfIpVB3uM3LlgwF55swlteTWXFmfF80Z96UKLf6kpBgdjVvWAg
	5PPnk5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyT2f-0000000GWyD-2ygg;
	Mon, 24 Aug 2026 11:40:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyT2d-0000000GWxn-37KM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:40:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMhvY2846094
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDK2q8jEQBsx6u42K6XSBrp2/fHnP/dHMqcLRjUxZpE=; b=UiL9HoP7JETaWO9z
	e3x7AoLwcfNEXuvmrFHr1Ou5cX2s+rI0wEizv/+AhhMcRizfBM3ADmbtZCadAwWN
	Y4D5AGkCYlieTuu6TWI2SslAl4WYCu+5g5jQrVSOWkAeuHwKtyXfdFNw6J6QygKG
	R7BZ+GRcDhFJV7F2ad44ZMOMutZO52Col7FVrsflYKCPGYybDNICli3UAKe3PFUi
	mbaI4v0eRMj4idoLkBHHXjfYwf03SqeLMyFaM164aCTf24uSTzIHAd0MLnkZ5j3T
	9e9/M5y+H8S03lqspb6085u305g61F5NIMrW01PEjKXrL8YStGt6O1GGybq9zsnZ
	xbAekw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7jfkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 11:40:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84a67b16217so5780530b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 04:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787571638; x=1788176438; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDK2q8jEQBsx6u42K6XSBrp2/fHnP/dHMqcLRjUxZpE=;
        b=Xlbr4RUGZbM21X/czOsZZ1IvsGJjPW9H1ihVHxrmaOOlqlTtVODGFdk6UV9vYYRth/
         khqoJMx9FkRQMW7KZUFYHjsqgnD/mRv9D3v6oMzK+l8WhYaHIeXxaOO+JLHFs5lKTdSC
         5n5OcYjnZuGBaYy3UXWkeJ7O5QsAyonlbNyU7rlk3KKe82mJYOxXpEHaZhxBwh0hujbK
         nuMNvJzWmlC4+MmtTEsXVj8Kc9auW/Il2OBzJoggEzlw9wXxokMTA5dO3FkH0+tiMK9J
         I5Nana+4MCZiqGkxcHkEUi2sUz/DcWj5No6ETHSRjGzrkA+231KSLRGuOvgxHmGnDD2y
         c9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787571638; x=1788176438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDK2q8jEQBsx6u42K6XSBrp2/fHnP/dHMqcLRjUxZpE=;
        b=c9Kj1L+I+3eUNBIpGS9OQqEiC5p3Irg3W4wf9rqHKRMTJLZ3qx1O1pLmljaz8l5mgm
         2vFVN+wHVbLosZBf20appDkgwn1WWO8My2DP5QNiq4vu0lHV10H7Y8OwfF55yv3hJ4ch
         r6IsuxIYwn+3rcX+6nGp8m1T1lsSYuQ0ewk8yot3VlBgYKCS3Sjvs6tNM6VNoP7AkUzV
         n8SbeqWS1TIhUzMpRfZNjY9ZR4jDGCpBDGNFkyc4igJT/BbpJvWHxdM99zAjwOAXI0eb
         KuRQLGmYND5oE/CfUzPdOSAM5SpAMj3ITLqKNJ1YBqNOlJ34w8AD+QIq3fYdgnL4BCDm
         3E0A==
X-Forwarded-Encrypted: i=1; AHgh+Rr39uKgd/4ImL6uXzlEklMo3LoxW5m5uZoReP9TMWJjHJnO3dJA4WUllE+Cu92lUzZzgQt5cSAw+gH89UlQovhP@lists.infradead.org
X-Gm-Message-State: AFuF++kKZRPsyHEr52iPVLTdfygMuPIRiJirJ7vO88F1Xb0SzYAoA7bq
	gDpzghJiXIyVIjQXiZ8QIO3Tw27dJsu1tLR00dn0UEetK+ekxrzEE3JRUHPfe5g0R7t7XVP7IHf
	EVwjqwg3AAqQOnSGQ9PQtAGfNzC28DlBDZMrqFPNwJNfeYsIgZLiLe/crwTau+RT09a8VScxZ7u
	L26A==
X-Gm-Gg: AR+sD139xO92FDDt8D8gFbgjyrYceZVd24KJDRiOrS6IF1NkJejUeTN26b/1sA8ZE2k
	W5Oa5dZT6AxqJwvFw+q2EUVLPN0e4rQEg4TaszmU5Cp7VF057JLlCyaP4cun7vN2XSvnoltrV5u
	Gfuv4pJKDZ5EbNdmMVGm6sg8+uerjUQj9eO/os+xjNKl0zl/fQ34T2KUHvbNKbCHfE157ZkLFvd
	2bg99W4fsTo02jYZ0xa9dkD3nUOeEdTBoVwBdOyYuoRfsMUYGvBKWrwklK3i4H69tQdJWXyUw9v
	Irv7ydqyuqcoEoInfnveuF61dbhTG4sU4oWR7UwMCJdSS9iB3nGsRmqLRKz9UodhmOqcRvYNUvQ
	pHKKO1404kPmODqwwq7cDppWMsyELuaXEZ3o=
X-Received: by 2002:a05:6a00:194b:b0:852:d5:d0ca with SMTP id d2e1a72fcca58-8520be70013mr25620811b3a.9.1787571638291;
        Mon, 24 Aug 2026 04:40:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:194b:b0:852:d5:d0ca with SMTP id d2e1a72fcca58-8520be70013mr25620717b3a.9.1787571637790;
        Mon, 24 Aug 2026 04:40:37 -0700 (PDT)
Received: from [10.217.218.158] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f14a418sm1883825b3a.47.2026.08.24.04.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 04:40:37 -0700 (PDT)
Message-ID: <e8856a22-0060-4720-9d8f-ee3b7498f46b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 17:10:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] serial: qcom-geni: Use geni_se_set_rate() for source
 clock configuration
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
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-4-61171ab1cdce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c2db7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=2-yugF7U08GihXn5wV8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5NyBTYWx0ZWRfX+2T20ZX8JeCa
 y7SEcaCYH3hnKGcfQx6C1FtTGg8LHdmbtmGkDlXIh6NQod+cNhWae32F9spXRz4J9CZ/p+RIq4J
 OURDOW4sGBfsqtbeTES9lf0Z9UXWlxo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5NyBTYWx0ZWRfX4YJj5/E2SW/M
 +HyECJWxrK0w5FYXc8O+D8D7jBFXf4dj+AlhjT6ngPG5RKrWR4atMtSZtiprc8HN/pFVI66ONZH
 MSz/0+w29uTle99nagKMDGTJDuLUNro6StLyJ6MO5x9EpuDJ68RPIOom5N+STsJI2Swxp1cx3nM
 2RNIfugqNM9JKFGMZ31dlQwcbWbPPlNmMCQJqCk1xRK6FJG67/Qj37McztMRTtuiI+Z6o0SHnQS
 QuWSETrmGVx3N9lkpOd+sbtB/Rze0HMagD20+NfJjvduPTOVCMMyZczCxSn56zvrKoy1hCKVstR
 4I0MtPDYTY6RZrEydVZlUR3n47vve3/pijZQMXl9TbNcZ0daYTBfPSPDW7aPggHh67gV5+mwi+H
 9VVcJGgu6pH4f/i5LSb6mTQ0F6PuJ18YEbG/3xHYdm0ItNICmghF+7UUXfZpDbOWLitx7OuScTl
 Pjw+dHJSYmq71EJKBcQ==
X-Proofpoint-ORIG-GUID: uoVGaD1gNdPaitnKIt-oKFwOgbxB9QN5
X-Proofpoint-GUID: uoVGaD1gNdPaitnKIt-oKFwOgbxB9QN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_044039_852248_D31CEF16 
X-CRM114-Status: GOOD (  19.35  )
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


On 8/5/2026 1:27 AM, Praveen Talari wrote:
> The driver calls dev_pm_opp_set_rate() directly on uport->dev to apply
> the computed source clock frequency, and dispatches baud rate handling
> through a per-variant dev_data->set_rate() callback that either
> recalculates the clock divider (Linux clock managed path) or selects
> a performance level via geni_se_set_perf_level() (SA8255P firmware
> managed path).
> 
> Now that geni_se_domain_attach() populates se->clk_perf_tbl from the
> perf domain's OPP table, geni_se_clk_freq_match() can resolve a source
> clock frequency and divider on the SA8255P path the same way it
> already does for the Linux clock managed path. This removes the need
> for a separate perf-level based set_rate implementation, so
> geni_serial_set_rate() can be called unconditionally and
> dev_data->set_rate can be dropped.
> 
> Switch to calling geni_serial_set_rate() directly from
> qcom_geni_serial_set_termios(), and use geni_se_set_rate() in place of
> dev_pm_opp_set_rate() so the frequency is applied to the correct
> device (the perf domain device on the firmware managed path, or
> uport->dev otherwise) without the driver needing to know which
> resources_init variant is in use. Remove the now-unused set_rate field
> from struct qcom_geni_device_data and its per-variant initializers.
> 

This commit message seems quite long and repeats the rationale few times:
1. removes need for perf-level based set_rate
2. call geni_serial_set_rate unconditionally
3. use geni_se_set_rate instead of dev_pm_opp_set_rate

Review, if below makes sense, tried to shorten it.

geni_se_set_rate() now abstracts source clock programming for both
clock-managed and SCMI/perf-domain managed GENI instances.

Use geni_serial_set_rate() unconditionally from
qcom_geni_serial_set_termios() and remove the per-variant set_rate()
callback. This allows the UART driver to configure source clocks
without needing to know whether resources are managed through Linux
clocks or the SA8255P firmware-controlled performance domain.


> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

