Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=; b=pQ6jFPxJZLx7MKq/xJYYJx+ldJ
	nrGyvXJqsZQlh9UkQOzCWCnsnnObF5fGrNhW/ELF+lDjXC8aOvae9cksGZ2OWoERxFFJ6BcOl/KvQ
	R7TemLEYwkJ3TJFEtEiEyMa8Xdn4ryvQaesMP9YzmxKie5ADz7QoAGdaCbtS5bp17dj065vjE/I1f
	ASGXCHLPz5CWxq42OULN7bhZRw7lAK/HY2JhADhqdedJg1P8Q3Lv/oKXpn+rMb4cQ4upH3zmlD1q2
	qGMGtUBLoUlb8kECEl7IrdVc4H4BgQqY7dM+A3t8YlC1dVGVFP2IuQyOKqWb0LuUUsq48RWCTN30e
	KyQ52iuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoi5-00000002XXA-1yco;
	Thu, 09 Jul 2026 13:22:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whoi2-00000002XWK-2Psy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:22:36 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNUrX1672689
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 13:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=; b=HZXyUgE1qC2tTxRp
	aKFjpzhADqnvoEYITa97oc8yIkKnR+u1JIv4X7kGA/xylW8TlrprK1/2n8gdizjn
	SqH6jPS1A9ReZFi16fvqt33+8ne6u2f/p2fdCB2rCf69CfO4WPiN4AFhWCw4SMEy
	cJsCeKJSH821riMGaTH/p4VLM5HXOpFQ+eVb/sjejyChlxAvmpk4sdu12Vcc6dvF
	gFvgbcnYNwDO6PfzaVWqKHj723a2NHziHTrsWt4uyDE20o2iHI2zRSAgeKtsWPNa
	kcQpyQq1kwEn2+gkIMVOtBitJZjAkvamN9Jg/p3DsQwSblzKleKve345xTfFeE2B
	2sGVjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqscf4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 13:22:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so16639811cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783603352; x=1784208152; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=;
        b=AJXtR4kzX+zilL/XZySUH9WMZNRKhYwC5zOc/UajN9W3b5Tw0NmLV1QUDZiYQKqqJi
         bGtbG+lf/ojeyLBGBX3CzjoWWi3/ec+SkadD4cuBPsehrFJUHmD5Kzn1sIOG2Yb6mgNI
         72D+jq1Qg9M+iTNnm4shFbB8uTezqFw+EET+LruxQVAy5WibZsEgnz8U6XBaM/6SFfaN
         koif6Vp8MYdvt0HIhqR7kwMccub3EHVPx4cQw89h7v+dMF3sWaxyrnmw1Kg7DZp+4ENq
         iCY4dCrYjGovHg13wvt0Dh6zLRL+lVBkVPNzuQveS7v3bXmpQKfaDTJApka3Az9qqH+m
         HwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603352; x=1784208152;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZ+qHHzBylMVPbNyXJjbWGadj0AyzM1uOWGl2xsnB+8=;
        b=AQCNYg5TQo7G+IKeTlgs+h2zRQ/xqMF35iOzkKLSz1TbK4yeLMYyFaW8guSZe+/eRl
         sJ07k2FfC3M4LQXzGaLarCXy7MTqnj0bHOy9ovwsFooKpZE+h1Y4bAQjJWkRuhMDDcaC
         hMCixA3Qt7mebYvBSPtNOyhbZS9jiy52d3miIOEMYW/MpgNz9x5rzLnF6ZAynvySkSap
         zSLltrZSmQFIRMFhHphmEL8601FDyEUGj6RecwAiwG6xYej6KrjTPJQWBT41IKwtuUDO
         xwAnSVGVqruVEOGtXpx0LaiC2vOS9XAcRmgLp3GgHkGxlqy0vTwYv2GHS7gBNXa5RL/v
         Ro3A==
X-Forwarded-Encrypted: i=1; AHgh+Rr2hjNPaG+4lmIWRRENwtgnMYzkkf7qsZutnF8mFLr64l4GbAy4qSyHmiV4keHhJPbd0k46NV2c2iQ+0TWNcwYQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwiGF4DFAUI8uCyp5qmkjmxLXS7GOUFe/tS8+OH464gyQRyaFuq
	YkxAEcZjb6Txq7LZi3TUS2pbVa8F7rAXNpbQwMQKFFuvdK/SVhha/15zHPJhSejDiiqvx1V+T42
	uKLR40zgiIWxNXQkrP7noVP4ziLFgk/MlZ7OapeeHb+TuFTg1KJH8XObQUriKHl5LJr9CKalGmN
	BRiA==
X-Gm-Gg: AfdE7ckIcPR5WfP6awGg1B8Sf0dEiLhtg0iH9tMJNNK2ZbJOoG5sima2sjaC07GMWed
	2V6r2GYgGXjRCjoAXD41Hhn/X19NDm9wHCip7gPnu2LiQacGa0nGMiTALpEI17Wqngaj4idrFmm
	m85TNtMgpjsjtcIg9s/nz8aQbE+FygBkGWGcfqnx1La+ydejoxS0EATvHA2CqB9icSM0lmw5L7W
	NTDx6ZycSMJeD48jfrhjRwrHFqAUWD++7kJHNgc2a2YZRq5AcRKIgBoBWy6ANw6hvDSgFhziXRz
	zl3tk3TABvGkmObfBCuuve5NsNmcM4olspgm2Q8naHm7kuV4iZ5C/926+b3OYcuRpaQUql1h2F4
	MAKnqg7FQG2LNN0hRxIAiGXWPekSdflD2KU/Ih6n5velvtuh0vd5boNgWnOcVtAcS8QM7wnGnKa
	75nXnToL2K2vfwzexHmOpdY7D9FaJsxtLHyoaIwHoudtAHJ2YuJgo1PbCCQBzeuqpiXlr/PoRsu
	smPKQ==
X-Received: by 2002:a05:622a:a887:b0:51a:8c86:bd48 with SMTP id d75a77b69052e-51c8b40894emr78889461cf.69.1783603351868;
        Thu, 09 Jul 2026 06:22:31 -0700 (PDT)
X-Received: by 2002:a05:622a:a887:b0:51a:8c86:bd48 with SMTP id d75a77b69052e-51c8b40894emr78888871cf.69.1783603351343;
        Thu, 09 Jul 2026 06:22:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15bb51af39sm388139066b.29.2026.07.09.06.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 06:22:30 -0700 (PDT)
Message-ID: <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 15:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
        Jyoti Bhayana <jbhayana@google.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX/6GhCTxcfCsG
 Lryzwvalipy9+GHipGSYwq4tjcNlSzQjbPh27q6mN4ByZ033zPmCYiWp2wbQy2Hf4Ho8TZBBro3
 Y3Rhr3jixYJKjkdd3EwGOHfVPRfRveU=
X-Proofpoint-GUID: zJM24wM9LLr82N8KVynP4jciLwUq5Dq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMCBTYWx0ZWRfX7jjdFj/foShX
 t7PiGmKwWHwsoI2L4g0Kp7CSrFxV9aaSHQuHsArgqGacijDxv80hurOlYJGFxub6oVPQAwbt/f/
 ygnXuC949B+drq7g/SoTi5x1IhTXKuj97RBm0apVOFR8ZLj30XQiloQKR6HVSpqCceQT+my96YX
 3fWchZOaV2QuQpuoAEBxGcL8PWSIzuA+7g8Bp+JjfAov8uuR6YMvME0vAq3wBHSjHg2Tp+WA1Ta
 io46FeKejh//umOuzi19G974MIQANJz9nvbB1kvNvh87wSDlLcWXS7+2UY7SxxNQsL0KJRm7DVc
 +OX+cRcCHxFZ/bpJ4ySEI/q5jUdqNqP5JRAg+U19ske8w41Z80BlWpGAhv99e6oyLrsDFL7hO6v
 qzfZveCp0O0IKTMnmSI+DkwhieVxfpqcY4Lp0hF7bya99adPLIq3ySNgKNACVTFrnKElzgPA65q
 ldfph1rEwk2yAA9t1vA==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4fa098 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=fQniT2RDnAzmI7G1ES4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: zJM24wM9LLr82N8KVynP4jciLwUq5Dq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_062234_735380_EBABCCA5 
X-CRM114-Status: GOOD (  30.10  )
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

Hi,

On 9-Jul-26 12:10, Sudeep Holla wrote:
> On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 18-Jun-26 17:56, Bjorn Andersson wrote:
>>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
>>> modules, but they are then not automatically loaded. Rework the SCMI
>>> device table alias support to make modpost consume the information from
>>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
>>> this information, if known. Also add a protocol-based alias to also
>>> trigger driver loading when only the SCMI protocol id is known.
>>>
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
>>
>> So I just gave this a test spin and unfortunately it does not work.
>>
>> The problem with Fedora's kernel-config / setup is that the
>> request_module() from patch 2/2 runs from the initramfs, but
>> the scmi_cpufreq module is only available in the rootfs.
>>
>> It does work if I explictly add the scmi_cpufreq module to
>> the initramfs, then it does get autoloaded.
>>
>> We really need some place to put a uevent sysfs attr which then
>> gets replayed when udev is restarted from the rootfs and then
>> re-reads all the uevent files as part of its coldplug
>> enumeration.
>>
> 
> I don't have much knowledge on uevent to provide any suggestions/help.
> But isn't this a generic requirement ? I mean you could have modules
> install on the rootfs and not all of them are packed in initramfs ?
> Just wondering if that works for other modules, we can examine how
> do they work and what are we missing ?

scmi is special because the actual devices under /sys/bus/scmi/devices
only get created when the module with the driver is loaded because
of some funtion/id mapping requiring info from the driver.

Patch 2/2 tries to work around this by loading all scmi drivers matching
the scmi protocol which is known at bus enumeration time, but this only
works if the actual scmi driver is in the initramfs because this done
through directly calling modprobe() from the kernel which does not
get "replayed" when switching to the real rootfs.

And no /sys/bus/scmi/devices/xxx device means no
/sys/bus/scmi/devices/xxx/modalias nor /sys/bus/scmi/devices/xxx/uevent
which udev uses for coldplug (hotplug event replay) when switching to
the real root.

The cleanest way to fix this from a how things are supposed to work
according to the generic kernel device-model design is to get rid of
the creation of the devices being delayed. Which may mean moving some
static mapping tables from the driver into the scmi core. I'm not
familiar enough with the scmi bus code to be sure.

Regards,

Hans


> 



