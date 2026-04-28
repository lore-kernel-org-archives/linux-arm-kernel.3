Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659D5FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zYoXgcN5YmYoiapw5cl2FOxLA24GcaGELbu3+TT+7I=; b=vr0ZXzDPqGln7gGPCluDqaMlU5
	aQy1OwOcJzU8Z9YL5tqnavMgBVYg4rVhP1pzaSOEOxhqZiLwWZ5MEQSJrvjjQi7GsKGVTqgu5hs24
	KdTuK7U2TYSaQWfGfPOwGJHZ7u1DV/wy9Zwk74tTOsnpPl9XsCSJf6fFyc7woQXri7so+gwLfZDgJ
	QCpaJ2LKof0DFK+6yLUXHzzVbupAz0r873wQpmynTTRKHxrlCpcqfuj1UdLgEC62OPb8bayJZ1OYN
	iZYuMPE1UJQG01hUbzLdjLE8jCwirX2G3PLgKJr7FgPqk0UklRVjkwjEjzDtUlrlj9fC8fy2JUdp8
	6I8dKa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlI4-00000001vpm-1Cka;
	Tue, 28 Apr 2026 16:28:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlI1-00000001vpO-1FDQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:28:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFslhj682662
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 16:28:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0zYoXgcN5YmYoiapw5cl2FOxLA24GcaGELbu3+TT+7I=; b=deOiAsRSWPgxHeMc
	bY5h+d++hfvjFrQZVAHuEzfsF2GppwuUNK1ra9pnFULXPsOebAWenv78v/piTnrY
	cf7pbq1ReqIjRQ4MsuombIJoYgXWnC5sp1wZjuQ6Ek+azMQh0lArmZP4mb8WqD/+
	l6Kxm5kCXhOO6yLFvy5/+E2cu53VH6F5Az+QJUSvUj6uiNLlfdLO0ovAQDmKfKyb
	BnTnb9hkIFPRdxXTUFZRwjIqrHI9IfyzbIwRHekb8TvbMQWypx/Y1refLpo3HTda
	a0+QNgacip+8mLUzLAr6CUhPc6AW6mFpo7QX7f7sLrTeEWOv73yQkcR6ODjTcgZG
	ox0Z3g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtdmbmh9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 16:28:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso6528086b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 09:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777393680; x=1777998480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zYoXgcN5YmYoiapw5cl2FOxLA24GcaGELbu3+TT+7I=;
        b=Ntip1qQl1dJed3RkM3eN6yBCkjIhlNRvehEi2iymTdj9KzWqalZO6i7dxSxmQ+N+dN
         Ih4RQLV5yIC8hzBLwc1XauF5WhtI5WLcLzOwzv32zu0+e2oTtwvmGKthZzWFVwQc0kIh
         IrliTgHJmUZ/25lF3CNLOSq84GOrZaEmMKbsJuCP60S1ZLk/Sf56PsXlymJAGbELKLWr
         3ZbYniy85POEi3WTbT9Fr9h5jYKXahsEJ1Cu4t8mh/O9+cOuxskkgedmNIOCUbz0LRpf
         1zJFUc/VT7B/bn88pehSX7xOQunsfnxWXyp+DFpzL6eO6h/5rDNqqx4qYhwfGvpcjhP3
         dygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777393680; x=1777998480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zYoXgcN5YmYoiapw5cl2FOxLA24GcaGELbu3+TT+7I=;
        b=QwIH03z6/CpZOKgOBg12YwSKd0jo+rG/Jy91+eM1dKwZhO/ykPVY78LdlrAKRLSoTr
         KWGXgvsHlUWMltIeIy4ki6PwJvFa/tkqnY00BGKUWnw+T72vySzghhwp+uZGszLFCNC4
         GWnexK54zIUHoX9ofS3NfoT0kvXW8vkdh7811p9Z+EEvO8tbMsj1dBKPANZJh6UNcjzM
         TEZbP0PUfAgrYYNiZ6CmeWVaYAVQZCd8KXaxhifxjslhL0hyAahD01ot5K0vhIbH1HRN
         ngMh69VWO14seieSkLyqTyi5bsoIN2V0JzAoscbU/UvuvTD9O+EdaHxLFfuq9Zs9vzEJ
         MnUw==
X-Forwarded-Encrypted: i=1; AFNElJ8t8b52C+SMLaKoTs3detVPzF0HBMV0zjJpKr9FLxwiq8lgyVLs2qIAf5piAjGqr8kwl3Q+il8wBA4KP906Mb0B@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0a3LnkiUj6k1j9R90plD03mvVILINtKLl2uBo06hd9pmPift+
	8lLgfky0g6tBiqpU4dAnlKqhXi9LZX2TXNxSVPNDZIwZr8ir1HXXCeAWB6Hubw7F7ncev+dWKyg
	WZltblQL4uob/akBb+WZF8aX2fA+VLGt8O/nB9cEqOlpcYch3olQGMX/NT2F9lOqx0EoI/SgtyJ
	7B4w==
X-Gm-Gg: AeBDievcVUPsrk34W24U6FV6S+fU4Q2Yxc75pV7Tvrn8sl5G32XH0JPMEoctGSTPzoD
	jRFtu7DRlOVpO4x0k5YBZkB6OczghyolzN7cj1KWglmj5qRo8WFzASeAQR2K7B1a87l10jkUrUn
	kT9sE452kzkPU/XP8g0Cyj2gMozEVK/nqrOj8Nd+fTEdhIVSh6dPs7xcO3DohxyRpggAQaDqQSA
	jjYrVNpIsEOekzNK8pOKCSFMtodJqOKbBhbUDB4cwShjW/PoORZSzNzkDCZF0IqWYB36cR08XT2
	VWL/QZ6NZtlNXiwP/+FBsjjINiXv4yWQxdr7RwsVo6v5mwgrm3wy2Orgl/9dhcN3XmGD3pfDALH
	7HE3QvDvTe/SZRWgyvJ2HwmbJcq5an+Ngy8/Yfpz14c4xWYp6Xs4/e9yVMSqcqP1Vgv4Z
X-Received: by 2002:a05:6a00:4b0c:b0:82c:db50:ef77 with SMTP id d2e1a72fcca58-834ddc950c7mr3689717b3a.49.1777393679334;
        Tue, 28 Apr 2026 09:27:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:4b0c:b0:82c:db50:ef77 with SMTP id d2e1a72fcca58-834ddc950c7mr3689676b3a.49.1777393678617;
        Tue, 28 Apr 2026 09:27:58 -0700 (PDT)
Received: from [192.168.29.31] ([49.43.227.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf69297sm2893898b3a.47.2026.04.28.09.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:27:58 -0700 (PDT)
Message-ID: <b3c36404-64ae-4a10-b955-ee5b2321b7ed@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:57:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 04/13] firmware: psci: Introduce command-based with
 magic
To: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-4-dcf937775e73@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-4-dcf937775e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZQbDxjxtlwycNgWvC-UBAv9UMg-uC9PR
X-Authority-Analysis: v=2.4 cv=PcrPQChd c=1 sm=1 tr=0 ts=69f0e010 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Gpg95E5bJKK5C7oRfY2+2w==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=219khkIK2FHepI9fHIMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: ZQbDxjxtlwycNgWvC-UBAv9UMg-uC9PR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1OCBTYWx0ZWRfX3KRekUG0gI+E
 MvxWRZdT2QTbDF2edF+tI9wYM7gVxS73qnrEMkcKUHAkInZumWH756u8P7pD5kSm8qtchg9WnsU
 biFOKw4Cq4fexFLnIM87amOK4HXw1cIA0jlkCKCNi8NgyuTM+/FtUfcgrsjlUcbgugRO+/SpMDU
 j+mcMSxF5hMevOf3jEpeLVr8Lmg2D6FwXIG8E8PukjxQ75qI8lnz7b/2hTdi0oHGsgWIgLUw8Tp
 WQGMJeVYnbWaxbHvnjXJRYzn0hCyG8xD+P+k+ivtVnC/HapGJYNgZ5ijogn4X/e6J2Bxg00G6IO
 pJoN5QnlWuxAKOX8rn+T5ZwBG4+M09KZdDjs5B+Uffm4Pu4dNsaPIgTK150zrAs2H6OVnpmaL2d
 dWsDTTI/aRKF8wBJTe6eEVCZ7ax408q3+dKHmLviAkEnqRpOUvEjP5V3RF44X1hZDwaQsVXT3VA
 llCrJ1nWb7caiu7FlRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_092801_365383_555F516D 
X-CRM114-Status: GOOD (  38.58  )
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

Correction in commit subject - firmware: psci: Introduce command-based 
resets

On 27-04-2026 23:04, Shivendra Pratap wrote:
> PSCI currently supports only two resets - SYSTEM_RESET and SYSTEM_RESET2
> ARCH WARM reset. The reset patch is selected based on the Linux
> reboot_mode variable. The PSCI specification now includes SYSTEM_RESET2
> for vendor-specific resets but there's no mechanism to issue these
> through psci_sys_reset().
> 
> Add a command-based reset mechanism that allows external drivers to set
> the psci reset command via a exported psci_set_reset_cmd() function.
> 
> Define predefined reset_types - PSCI_RESET_TYPE_SYSTEM_RESET to map to
> SYSTEM_RESET, and PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM to map to
> SYSTEM_RESET2 arch warm reset. Interpret zero cmd_reset_type, for
> predefined reset-command selection via cmd_cookie. For non-zero
> cmd_reset_type, check for valid vendor_reset_type and set the psci
> reset_command and cookie accordingly.
> 
> Disable PSCI command-based reset by default and treat invalid reset
> commands as no‑op. psci_sys_reset() follows its original flow based on
> reboot_mode until a reset command is explicitly set by
> psci_set_reset_cmd().  In the device reset flow, psci_set_reset_cmd() is
> called in reboot_notifier phase and the device reset happens in
> psci_sys_reset() which is called later in the restart_notifier phase. If
> a kernel panic occurs in between these two phases, the reboot should
> take its original flow based on the value of reboot_mode. Disable the
> command-based reset in such case.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>   drivers/firmware/psci/psci.c | 75 ++++++++++++++++++++++++++++++++++++++++++--
>   include/linux/psci.h         | 19 +++++++++++
>   2 files changed, 92 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22d6e7e0f06420e8478a2b0ec2fe6f..cb37c39e2b4b1d99f0080f6a5cd6c92a070beda8 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -51,6 +51,16 @@ static int resident_cpu = -1;
>   struct psci_operations psci_ops;
>   static enum arm_smccc_conduit psci_conduit = SMCCC_CONDUIT_NONE;
>   
> +/*
> + * Encoded reset command:
> + * bits[63:32] = cookie
> + * bits[31:0]  = reset_type
> + */
> +static u64 reset_cmd;
> +
> +#define PSCI_RESET_TYPE(reset_cmd)	((u32)(reset_cmd))
> +#define PSCI_RESET_COOKIE(reset_cmd)	((u32)((reset_cmd) >> 32))
> +
>   bool psci_tos_resident_on(int cpu)
>   {
>   	return cpu == resident_cpu;
> @@ -80,6 +90,35 @@ static u32 psci_cpu_suspend_feature;
>   static bool psci_system_reset2_supported;
>   static bool psci_system_off2_hibernate_supported;
>   
> +static u32 psci_fn_from_cookie(u32 cookie)
> +{
> +	switch (cookie) {
> +	case PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM:
> +		if (psci_system_reset2_supported)
> +			return PSCI_FN_NATIVE(1_1, SYSTEM_RESET2);
> +		return 0;
> +	case PSCI_RESET_TYPE_SYSTEM_RESET:
> +		return PSCI_0_2_FN_SYSTEM_RESET;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +/** psci_set_reset_cmd() - Configure reset request for psci_sys_reset()
> + * @psci_reset_cmd: reset command encoded as cookie[63:32] | reset_type[31:0]
> + *
> + * Save reset command.
> + */
> +void psci_set_reset_cmd(u64 psci_reset_cmd)
> +{
> +	reset_cmd = psci_reset_cmd;
> +}
> +
> +bool psci_has_system_reset2_support(void)
> +{
> +	return psci_system_reset2_supported;
> +}
> +
>   static inline bool psci_has_ext_power_state(void)
>   {
>   	return psci_cpu_suspend_feature &
> @@ -306,8 +345,24 @@ static int get_set_conduit_method(const struct device_node *np)
>   	return 0;
>   }
>   
> -static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> -			  void *data)
> +static void psci_handle_reset_cmd(void)
> +{
> +	u32 psci_sys_reset_fn;
> +
> +	if ((reset_cmd & BIT_ULL(31)) && psci_system_reset2_supported) {
> +		/* PSCI SYSTEM_RESET2 Vendor-specific reset */
> +		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> +			       PSCI_RESET_TYPE(reset_cmd),
> +			       PSCI_RESET_COOKIE(reset_cmd), 0);
> +	} else {
> +		/* cookie part of the reset_cmd decides ARCH WARM RESET vs SYSTEM_RESET */
> +		psci_sys_reset_fn = psci_fn_from_cookie(PSCI_RESET_COOKIE(reset_cmd));
> +		if (!PSCI_RESET_TYPE(reset_cmd) && psci_sys_reset_fn)
> +			invoke_psci_fn(psci_sys_reset_fn, 0, 0, 0);
> +	}
> +}
> +
> +static void psci_handle_reboot_mode(void)
>   {
>   	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
>   	    psci_system_reset2_supported) {
> @@ -320,6 +375,22 @@ static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
>   	} else {
>   		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
>   	}
> +}
> +
> +static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> +			  void *data)
> +{
> +	/*
> +	 * Command-based resets are configured at the reboot_notifier phase.
> +	 * If a kernel panic occurs between the reboot_notifier and this final
> +	 * reset, ignore the command-based reset and let reboot_mode drive the
> +	 * reset flow.
> +	 * If reset_cmd is zero, there is no command to handle.
> +	 */
> +	if (reset_cmd && !panic_in_progress())
> +		psci_handle_reset_cmd();
> +	else
> +		psci_handle_reboot_mode();
>   
>   	return NOTIFY_DONE;
>   }
> diff --git a/include/linux/psci.h b/include/linux/psci.h
> index 4ca0060a3fc42ba1ca751c7862fb4ad8dda35a4c..c2458291a3faf5ac89b1528dae2c9b805a2dd075 100644
> --- a/include/linux/psci.h
> +++ b/include/linux/psci.h
> @@ -21,6 +21,21 @@ bool psci_power_state_is_valid(u32 state);
>   int psci_set_osi_mode(bool enable);
>   bool psci_has_osi_support(void);
>   
> +/**
> + * enum psci_reset_type	-	PSCI_RESET_TYPE for SYSTEM_RESET.
> + * @PSCI_RESET_TYPE_SYSTEM_RESET: Standard SYSTEM_RESET command.
> + * @PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM: SYSTEM_RESET2 architectural warm reset.
> + *
> + * These enum values map PSCI_RESET_TYPE_SYSTEM_* constants to reset strings
> + * issued from user space. When user space requests a reset, the cookie
> + * carries one of these values, and the PSCI reset path translates it into
> + * the appropriate PSCI system reset call.
> + */
> +enum psci_reset_type {
> +	PSCI_RESET_TYPE_SYSTEM_RESET = 1,
> +	PSCI_RESET_TYPE_SYSTEM_RESET2_ARCH_WARM,
> +};
> +
>   struct psci_operations {
>   	u32 (*get_version)(void);
>   	int (*cpu_suspend)(u32 state, unsigned long entry_point);
> @@ -45,8 +60,12 @@ struct psci_0_1_function_ids get_psci_0_1_function_ids(void);
>   
>   #if defined(CONFIG_ARM_PSCI_FW)
>   int __init psci_dt_init(void);
> +void psci_set_reset_cmd(u64 psci_reset_cmd);
> +bool psci_has_system_reset2_support(void);
>   #else
>   static inline int psci_dt_init(void) { return 0; }
> +static inline void psci_set_reset_cmd(u64 psci_reset_cmd) { }
> +static inline bool psci_has_system_reset2_support(void) { return false; }
>   #endif
>   
>   #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)
> 


