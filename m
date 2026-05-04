Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC4DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 03:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiZ8ZehJHOgAnZPUtOhC/yoFNONpm3oh1RebvCBkpKY=; b=3anOMP1U6qgrItNeGRmoA2vAFo
	9wLZYTGtSKgAV1wtNhyDmqe5l3xMCbU/dFJ0+sJTxHmA2JexB7RU2sEuX15iC7FMvJzol65c3+RSf
	i5gMxlonQgiJZ66GZkP8ZL19b2mPmXm6q4tEgkJWGn45QTSOMyZ5CZL90wPRa/ejciu8jGtMVMbS9
	Uqzx7L4nyqkMwdX8HHXDPQ/h9k6h97RTHFeC++jFoKUyv3XyrVxMV2fmb+MmNxwnV+itnQrlwO2vU
	ZbpbaIt0KGN4Pfvam4OJGFm8Pm3iMG1Oc6JHAdnuthGJqCFtWZCBV7JHjUrm9xz9Q7mDmK2ww3REB
	PnMK8pnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJk7t-0000000CGKM-1TA7;
	Mon, 04 May 2026 03:37:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJk7q-0000000CGJq-0NzU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 03:37:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 643AirOR1184971
	for <linux-arm-kernel@lists.infradead.org>; Mon, 4 May 2026 03:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RiZ8ZehJHOgAnZPUtOhC/yoFNONpm3oh1RebvCBkpKY=; b=KCS8Y5SmYxUC30M1
	aqpNDzduiNY6aSVBKCaoi9O1IfwNdu1iznSJ+9MzyEQIADutO42fRiWjzmC8ynz0
	5yWm54y2bIi4btq4TH3+GYVqv6ioY7HYao6HgzXtpzg+ruBerC6msAELWz8Q6PaG
	qUVAGj318pxH1mF2qNxLa9A7/CK0WHzkHmgYMV5ssGwuWBf2OVUz6SbRdtlt8BzH
	9loQUB0xfAckuTOC6t4qwoWz0+BSPtfFGP0qu9jl6ztHnDR9Fc6dN4QbN0hjPOEh
	hPkGZKNl6IhjPWVNMjjSJjhfkZNrwpASaP6x959cWcWQLgRDBnvA7f0milTPXM9Q
	uFqviw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw6mpccen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 03:37:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so3656696b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 20:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777865859; x=1778470659; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RiZ8ZehJHOgAnZPUtOhC/yoFNONpm3oh1RebvCBkpKY=;
        b=JsQNB8T+KBdnU8GK5ipMcg5P674LfQOREDebqXyPgwv82EvMazTg8r0p6YfPXxvYdW
         SDeZLeuWmxMwGuav98vyi4z93Mx+6yH72IJf5V2HJrRJ/2zRhL67vb+xs5KByyjw/GW1
         TCzvog5BOqcw4KcK6Hr+bbwDxJG/U0YQ2Ybqj/HgLWSSRjmU2aSaf46iGzKdf4icVIvM
         3taBZqPCR0+8CGX2hmPoTEOWcUzlvpIDvZVCdMvtBBR0QScs9j2yypGQMzSfxdqy5SX+
         giOTEc/GaNwfHhfTJpAm/2sScFDVF9Bswu3ozMCtoVp25v84UMZ0yq30gqjB+HLdTdH3
         lldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777865859; x=1778470659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RiZ8ZehJHOgAnZPUtOhC/yoFNONpm3oh1RebvCBkpKY=;
        b=B+TiJc1PTLtFXKGOPpv0VTxd4tT0NPrAj2aJ+I9wnzKrnnxcjFMHu9CSdxCrBm8VrJ
         pTRjridaBvgG7geBUAv9P8f9C6dR97oIy8HL/IPu7K+aCv1G7VLZn7bzLjEyxOeJlAm6
         91oUBaxChaHvDSIEnqIozUrmlIz9QnGBtqxAaFVQJRU1+W2203GZ/HZyltZuiNIaF5Wr
         cq6EXbg97WNV6coFFT1FBWDfS87dRa1xBZqjLMv0EKRA2vvY9wYWT8HSKgH/A9wLw6Lh
         DkJkjmPNCRHm1GjqDX9CgBb7j9Lpi+bo6HhKWytOTYixTBPgMsS1L9sVC8GivaP/agyi
         ePtw==
X-Forwarded-Encrypted: i=1; AFNElJ9+bOgp4xR/cMW7P9Dj8eiAc0NDobdfqX7wumRcDOb60RLKXGgkFgQeCVeQTK5pQiTXegz8FNpm1PIM0zUOLjbJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzzrxnmbmF5byMokAEN4tsmgfVLq0Mr/roJAa6Mk2uo8jgyyDyo
	32b+a6ZvwTaDf0VIe94oE4ojijUF3tbC99voKDHzKkzVG26IbEYRtcaOShqzQIsIsRBRQnNkBhV
	VuY98deoZ6VH0TZjPIx1lLJj3iq3C5dIM28IwMgL2mbKQ0O1u3o1V6M9CgTiABXIL0aM2CJJsfN
	9ocQ==
X-Gm-Gg: AeBDies0MXZrWx13BG5h0loZVEI/8AToD8Ng9VuFVNIfP+hxVIxUs9Fv8NPJZ8oapqt
	tfXNaZCTd6OHighStCf13W3RIo+cdmzrTjDuqFM75bhXLVcDVveCc0hCCUu3EJf6bio3+Txhd5/
	Ne9vxROo/QzX/SWgBpmjRqpHGEesgUvEq4i2d2/GFAezy9xZVc8P+NjqFQukV5X8QewKoafxstY
	9IvMm5IzMtEK08+Ia3klmnvQ7fMynFEySsmOSx024AE9GNxayffAAzWl8Kw6+glMmHUHOoJkx35
	65S1npaO2zkA6S0AS30Eeh3eYQDxSjde2705/rFfVDVCc25dPa31X1aMZy3wBPoZYAqzgRcqjaR
	thRMgblvoF2Ktu6ke5bEBrCvq2cUE98aizTY3+fB9rJjnwWLnm7bXEGqnW+Obi5ulpA==
X-Received: by 2002:a05:6a00:bd84:b0:82f:39df:dd54 with SMTP id d2e1a72fcca58-834fff00167mr13681838b3a.8.1777865859259;
        Sun, 03 May 2026 20:37:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd84:b0:82f:39df:dd54 with SMTP id d2e1a72fcca58-834fff00167mr13681818b3a.8.1777865858697;
        Sun, 03 May 2026 20:37:38 -0700 (PDT)
Received: from [10.92.193.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158bcb99sm11045688b3a.25.2026.05.03.20.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 20:37:38 -0700 (PDT)
Message-ID: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
Date: Mon, 4 May 2026 09:07:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PCI: qcom: Add D3cold support
To: Steev Klimaszewski <threeway@gmail.com>
Cc: bhelgaas@google.com, bjorn.andersson@oss.qualcomm.com,
        jingoohan1@gmail.com, jonathanh@nvidia.com, kwilczynski@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org,
        will@kernel.org
References: <20260429-d3cold-v5-0-89e9735b9df6@oss.qualcomm.com>
 <20260503203008.287559-1-threeway@gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260503203008.287559-1-threeway@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H6rrBeYi c=1 sm=1 tr=0 ts=69f81484 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wWH99FW7VD-f-Ch3qS4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDAzNCBTYWx0ZWRfX4cjxVdWrc0UZ
 h3VvICkpUIVhvU7D9DuSrCrTnxX+vHI9KOuLRqRhiKjh9tGt64ANSFD6hhRAoPeDLnC9+PpVjhy
 8tVwpysHZf/GuvQNMnsLHkyIJ5xXWuKFlsBgTZr7SMtG3EXHKIzbLSO+sZDqDFKXdh7Lv/53xkm
 01FjdIVn7EXbikeUWCm8gc4lSlPZcEEGuEyarZR50zHW/L1dHCVGyQ+9iicVmni3OwA8Lumzy24
 iyvaPtkJxGN11+5hAGK1k+3PTdOn3ArdQ3brDvzmlJo/jf/nf4WNxtk1gGVjVCKhjp17XBZUSQu
 39J7f5UBkFTUwYzmiSnZK1PWNN5Q1erB+owC/ECksSdbXpIxPDpPOOUEemDb3sSJHvB2fh2J7M8
 Ile/tjwYsSJbf5+VrOSXun5D/mwDihrtICaF+JPi/YF3YSQigLVuj1p93r16Q0xDCwJrCP6Iqk8
 E9KBrGGY8IHVgFjAJKA==
X-Proofpoint-GUID: Z9yzIOonBf6qndsrSovChrwYIgO_P_0F
X-Proofpoint-ORIG-GUID: Z9yzIOonBf6qndsrSovChrwYIgO_P_0F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_01,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_203742_282581_984AE08C 
X-CRM114-Status: GOOD (  24.44  )
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



On 5/4/2026 2:00 AM, Steev Klimaszewski wrote:
> Hi Krishna,
>
>> This series adds support for putting Qualcomm PCIe host bridges into D3cold
>> when downstream conditions allow it, and introduces a small common helper
>> to determine D3cold eligibility based on endpoint state.
>> On Qualcomm platforms, PCIe host controllers are currently kept powered
>> even when there are no active endpoints (i.e. all endpoints are already in
>> PCI_D3hot). This prevents the SoC from entering deeper low‑power states
>> such as CXPC.
>> While PCIe D3cold support exists in the PCI core, host controller drivers
>> lack a common mechanism to determine whether it is safe to power off the
>> host bridge without breaking active devices or wakeup functionality.
>> As a result, controllers either avoid entering D3cold or depend on rough,
>> driver‑specific workarounds.
>> This series addresses that gap.
>> 1. Introduces pci_host_common_can_enter_d3cold(), a helper that determines
>>    whether a host bridge may enter D3cold based on downstream PCIe endpoint
>>    state. The helper permits D3cold only when all *active* endpoints are
>>    already in PCI_D3hot, and any wakeup‑enabled endpoint supports PME
>>    from D3cold.
>> 2. Updates the Designware PCIe host driver to use this helper in the
>>    suspend_noirq() path, replacing the existing heuristic that blocked
>>    D3cold whenever L1 ASPM was enabled.
>> 3. Enables D3cold support for Qualcomm PCIe controllers by wiring them into
>>    the DesignWare common suspend/resume flow and explicitly powering down
>>    controller resources when all endpoints are in D3hot.
>> The immediate outcome of this series is that Qualcomm PCIe host bridges can
>> enter D3cold when all endpoints are in D3hot.
>> This is a necessary but not sufficient step toward unblocking CXPC. With
>> this series applied, CXPC can be achieved on systems with no attached NVMe
>> devices. Support for NVMe‑attached systems requires additional changes
>> in NVMe driver, which are being worked on separately.
>> Tested on:
>>   - Qualcomm Lemans EVK, Monaco & sc7280 platforms.
>> Validation steps:
>>   - Boot without NVMe attach:
>>       * PCIe host enters D3cold during suspend
>>       * SoC is able to reach CXPC provided other drivers also remove
>> 	their votes as part of suspend.
> I have been testing this patchset with Mani's patchset that is supposed to be
> related to NVMe on the Thinkpad X13s found at:
>
> https://lore.kernel.org/all/20260414-l1ss-fix-v1-0-adbb4555b5ab@oss.qualcomm.com/
>
> v4 of this patchset *boots* along with Mani's patchset, however, v5 does not,
> and unfortunately, the machine does not seem to get to a point where I can even
> get logs from it.  Do you know what I might be missing?  I have *not* attempted
> to remove the nvme drive and boot off USB to test it.
This series, will not have any impact on the boot, this series comes in to the
picture only in case
of suspend and resume. can you share your platform details and kernel you are
booting with.

- Krishna Chaitanya.
>
> -- steev


