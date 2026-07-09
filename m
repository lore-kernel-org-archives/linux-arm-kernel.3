Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928DFC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=; b=FVzjZR/Or1pkY8UBrxf+iNJSRy
	TmekG4N4Xoevlt1O3RBNJjkjAm6Z29KZ7H1B6efVmhOejz1KCt64vstLypiTSjL3XdX2z8fZ3WdRG
	CoHN3nHkPM6BSVpJ+G9+xuXtzb+UK+gHGseCZjegAlHd8aA7ylIWKWPtV5RAsaI8AN1KdNC2xzJSK
	BP6/VftQnI5pw7am5LuEZFSkgNumMLZ+HxyemsINSFuf0Qwgo6L1DrREuj+R+6RnAFj+HQhwlyVN9
	/kmsw/61hdoTnm/OXMQAmAhDalaNpv4ojufGB7vl+7vKT/+s6RZhg1s4cHZj4G3G26R0eiAQ86+rH
	i6+a29jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWq-00000001eTy-1tbc;
	Thu, 09 Jul 2026 08:54:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkUn-00000001aSt-3yXm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:52:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6696180s892148
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 08:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=; b=Vzmdtsv4Src4CMvg
	+mFiVwhDKpcjFXB+283QlPlKGH7IQKguo85jTg+HFc3wFGFSuuFLnxHQD9qv13PT
	7S/sayDY1+nx3mQ+hrAmpfkiafgteB8eT/y1X7YqJ+Eba5l+mKRfu78/Ot+e4G0l
	EhYIj072MvUflHuGCsTuuAjTg9QPrN2PiP8PCLjsPtjtqSZPvSc7kU0DnOE0ve+K
	Qq48+7qHO0c6pa/Qvx74sBAV2AN0fhnLy5O6H80paJOOaM4aoupOkuMRcTkk/itQ
	bnQYmf71v/cDQDxbjQ4xbE3vJX/+XYZFx1EUV5VsL/gdRSaIpkx/6CXvCjuAEvU/
	amWFRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9urvtqmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 08:52:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cce14a21faso14653375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587156; x=1784191956; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=;
        b=FC5hqmntml6I1mW5LCwzHtTQUEE92aNlEyHYiiFG/hWeqT/zpyQuZMtOZvmfoCNKKP
         nGAr3RzCiqe6JxIziP5DfaKGTq5+X3tzgfam9aESYsqDn7JIYrxeiDuyGDfghp2hWj8w
         npSGyBi5tVj6v+adT8zdtL7gvCH95woSbeI+zh5qyaSejwzqq/eiuAOfdLTZ0+lCYA3K
         uJhxRn3zbJFNi/yMW4VEQOAmDvdbJLLRFkVMt9r940w5N6Ua6nDxAng6OABNPOVGaW7D
         WNTP2KYar6UFQtqbkPFDaYHQwiZ02Vt6RMvLmL7HJ/wwD+vK/Rvbq4WoVRRY1/eL56Qn
         cQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587156; x=1784191956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Voq3Sg1/b718gexVzD9pZPvNMxe2Vpa+Z96N1Vl0ne0=;
        b=SJ1C65b58o5cdL6L4JqoSVD5DEnCsl1/8Q5Zx0kuNtZOjsUvvodpCPnVKh1e1W7722
         saMqWuxD5cgWWb9FYcKFAqwFF+Y6d3Y+532A7o1tMdWghpxHic7Q/7AFK0YZ424UH4c9
         CX19C8xN+Hn7R2+kgz83eQ7uCj4tANEaikC9aqRGqs5wAUcjI6jlS2jZR4cS96nNvU7V
         2MBewv8OWb+HZcQSr7vI5k5FblI1L4o3xp6XRxXyyAGyR9DRuDk8gULacvEcrfXG1Q2t
         trGHqVxysUwPCUXOH2ON9YZSjosP/Huxetod6Z06QZ64hfNc5JAE/Zzz0x8ZcWpFSE8k
         BQiA==
X-Forwarded-Encrypted: i=1; AHgh+RrI0EOHGz9JfYtJMzeYiz7MvXc9zeiiA2binwCD3IklG98B4ojFnv3eLKtiENmrt+w5k15O/3dVkVuKq/dGB70H@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr6G7cX2+0meneryC9wvuJJYZjSxWBtxN6uisauYqtZ4jYzQyo
	BQOfDZx4pbCcXE1cA560z/0JGIBAfaFIZYEIm+lnhbk3Q5gYnvnPW+k9p5O/6uItXMqnwOKtsgS
	fPy96sNzyk9J/nPNR9kAjHysaJmJG3LZPS/AquPWT7V0mF0uCCx0AWLpPCERMZJOdhoY0y9XAaN
	zX7w==
X-Gm-Gg: AfdE7clhIdF9ZnHqOMWafWso/DmvrEKVoaSJZMhliQcIJxJBASBnRGjN+Nktw744310
	mgQlRoFUmW33z9rYn31fOhbOZxtvEuDxre68yuvh4dCBXuIae8mSEPCRrwYYxaNCms1xQ7OsthJ
	iIvDOEQB/E6WpjhbPyRPCKZTiNQoK2i0Laa7UuuSxaLZI8VvT28gTBAeZRGCltSXl7NVJT2lvIl
	oXvrVpzWrDT2qm+oc7gLyBhMuY+++XjkLgL54CyFm0odU6J4JSz7fbI5on5eZR0GJoR1ILG00eR
	oXX65bHqkvLLw0OPKTbnvuqanVrEfKV+SFVIvca13k/aRqljpJt8KtfulTxf6s9HZZwJpyAIlTP
	a+sIoLI28Ym4L7H+CJZamzI6/EjVAcNupTSIsUtvtCI4=
X-Received: by 2002:a17:902:d2c1:b0:2c9:b2c1:1401 with SMTP id d9443c01a7336-2cdd8a16112mr22278305ad.5.1783587155483;
        Thu, 09 Jul 2026 01:52:35 -0700 (PDT)
X-Received: by 2002:a17:902:d2c1:b0:2c9:b2c1:1401 with SMTP id d9443c01a7336-2cdd8a16112mr22277765ad.5.1783587154710;
        Thu, 09 Jul 2026 01:52:34 -0700 (PDT)
Received: from [10.92.212.146] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d946sm40530765ad.66.2026.07.09.01.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:52:33 -0700 (PDT)
Message-ID: <5eecf3a0-b608-4057-b400-236f6952b380@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:22:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] tty: serial: propagate errors from uart_ops.pm
 callback
To: Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
 <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <9320a573-ebf8-459b-a313-3a8b73a6180b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX/aeWAoRRSYd8
 Wi8OY8Bd4IBWXLC5XPnbizQ+tP/1Nonhzp+A1bsimmebHwYB0iGHntnhPn2Lb6/daGmJR8hD+Mf
 fqj6Dg9X4I879S/aBk+n8iLyYu2VP9I=
X-Proofpoint-GUID: IhISgHDCY48DGEIWlcUL8uDjfv-0FV-2
X-Proofpoint-ORIG-GUID: IhISgHDCY48DGEIWlcUL8uDjfv-0FV-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX9O4715GLJPcc
 sd9uJ9auQljo+akCQQcW1ONvlmQz5chqEvZFY0MxiuwzXkSYO9Vmpz1O76//k3bVydNYd9Ghh61
 0K1ZKTrZpJ/kHvMzwANlPXcMHkqWkM98YQ1lB4j9UhdBrNVhr/1wHPv4Z/3CQTspSCrDWpwZj5L
 YLqseM1OkSdDTf/Awgj6cqjJ9MqkGmWEwEZ7kvGaBJ74j5+/lCPjw9lM0jPMKXHwCVwj2IQbZvP
 dUvy/K2dTFXc0q9dvMhEuuyj1DW0PpWMesnYQ7Oep4cNOAwNG3Pg9rWjYeb5m2AOTExqkDSOX80
 7tJz73xFyJejS23CTZ9GhIi4pcEez73/DqhZB+k0r4wVPALBgIShkRAXV+cH/iA28PSQEh8l7Xi
 CRwcvT/tQ9xsDBybvSLONPrFoVAOWptk2+BBOj16O+ehLjcXbwcyEYBAebd291kHopL+qWE/JVG
 y81uxM4ngMvrK+WboZw==
X-Authority-Analysis: v=2.4 cv=H43rBeYi c=1 sm=1 tr=0 ts=6a4f6154 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=yxy72PdV_TLAuk9cO2cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_015238_135793_37701221 
X-CRM114-Status: GOOD (  25.89  )
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

HI Jiri

On 09-07-2026 12:23, Jiri Slaby wrote:
> On 09. 07. 26, 8:25, Praveen Talari wrote:
>> The uart_ops.pm callback has been declared void since its introduction,
>> which means any error from a driver's power management implementation is
>> silently discarded by uart_change_pm(). Beyond losing the error
>> information, uart_change_pm() unconditionally updates state->pm_state
>> even when the underlying hardware transition failed. This causes the
>> serial core to track a power state that does not reflect reality:
>> subsequent calls to uart_change_pm() see the stale cached state as
>> matching the requested state and skip the callback entirely, leaving the
>> hardware permanently stuck with no further recovery attempt.
>>
>> On modern platforms where the .pm callback performs real work —
>> enabling clock trees, interacting with runtime PM, asserting voltage
>> regulators — this is a correctness gap. Failures are invisible to the
>> PM framework, the port proceeds to call ops->startup() on potentially
>> unpowered hardware, and suspend/resume errors are hidden from the core
>> that needs to handle them.
>>
>> This series fixes the problem in four steps:
>>
>>    Patch 1 changes the uart_ops.pm callback signature from void to int,
>>    updates uart_change_pm() to propagate errors and only commit
>>    state->pm_state on success, and handles the return value at every
>>    call site in serial_core.c with appropriate policy per context
>>    (propagate, log, or skip-on-failure).
>
> So does this break build without the below applied? IOW: breaks 
> bisectability?

You are right, patch 1 alone breaks the build since the driver 
implementations are still void until patches 2–4. The series as 
structured is not bisect-safe.

Do you have any suggestions on how to fix this issue?

>
>>    Patch 2 updates the 8250 driver family: serial8250_do_pm() and
>>    serial8250_pm() are updated to return int (with the exported symbol
>>    declaration updated in serial_8250.h), and the 8250 sub-driver
>>    pm callbacks are updated to return 0.
>>
>>    Patch 3 updates the remaining non-8250 serial drivers. All .pm
>>    implementations are updated to return 0. The sh-sci forward
>>    declaration shared with rsci is also updated.
>>
>>    Patch 4 updates arch-level implementations: SA1100 (assabet, h3xxx),
>>    OMAP1/ams-delta (modem_pm, now propagates regulator errors), and
>>    MIPS/Alchemy (alchemy_8250_pm).
>>
>> All existing .pm implementations return 0, so there is no functional
>> change for any current driver. The series purely adds the infrastructure
>> for drivers to report errors going forward, with the serial core ready
>> to handle them correctly.
>
> OK, now I miss the rationale behind the patchset. Neither there is a 
> possible code path to actually test this?
The rationale is that qcom_geni_serial_pm() calls 
pm_runtime_resume_and_get() which can fail, but its return value is 
currently discarded because the callback is void. Patch 6 in this series 
is the concrete user: it makes qcom_geni_serial_pm() propagate the 
pm_runtime_resume_and_get() error so that a failure to resume the UART 
power domain is visible at uart_port_startup() time rather than silently 
proceeding to call ops->startup() on an unpowered port.

A code path to test: on qcom platforms with CONFIG_SERIAL_QCOM_GENI 
enabled, if pm_runtime_resume_and_get() fails during 
uart_configure_port() or uart_port_startup(), the error now propagates 
to the caller instead of being dropped. The test case from development 
was injecting a failure in qcom_geni_serial_pm() and observing that 
uart_add_one_port() returns an error rather than proceeding silently.

Thanks,

Praveen Talari

>
> thanks,

