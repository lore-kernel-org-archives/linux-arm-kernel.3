Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F614D12694
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 11:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFJKTwjHiAis4wfTQBy6AYXPEaNWvPiC5x9VaYm8ow4=; b=oLFR5ZIBcScMKkRhYNhpC3AHon
	HelYxOorf8H9jflMysRJo25qFfFkUHbpejom9WhChKHynP9UICNa8BB9OxTJETmFFgitgZ3kS9vDO
	WsXB/Tpow14dW7sLU8au8LMjgon0b4qPwDLTldIzBMsoKxJBM7S4EFbpmHe1FYdhUAOGHpfThHI78
	TLjfUEWqSmFr3HAHvTw6MJcqN4DcDGKJykGPUzWNS0BvrcEZviBzYFPISuCDdNsU1v7imYJyX+ViT
	9CqryLsdFh/M3/A7KT0aotYd+JniAKbcAhFI2B7yB+WNTA1bch9KQzMKEvvIRtVN33WXv6rET0khd
	0bLdA3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkef-00000006TqT-2Vvk;
	Wed, 03 Dec 2025 11:04:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkec-00000006Tq1-2Zhg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 11:04:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39Q1GA1969544
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Dec 2025 11:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UFJKTwjHiAis4wfTQBy6AYXP
	EaNWvPiC5x9VaYm8ow4=; b=Gg00H11qipOHcrB7keAw49wsoP8Cp9Tq3ogmFR4a
	e7sRK6abkd/3G4Wvt9I4RlnZCc/rh6mIbkLkPIfALL7Y1ZgN40NGW9PvnxAM3bJn
	MKeoLUUXOqL7BaFpvRqbWpV2lFpANC8zp0Ry4/Uea9w9yTJHVLc3dUGqMarZZHXU
	XpLBU8gfXCagKknovJommArBx7SS/YSjDLrh9vmlryIcFehDVFANyg9RvZsDTvhe
	QCwSPYrhwfoO8BGJzqzt/cRjVZ5sULdrNevaL1kQgao9N/CTOoGwKD6XLDdQiVr6
	FPlU907ZZ6avMMWNS3oMxptbo0riAC2tFDvp4UVjSBhzTA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjjs0bf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 11:04:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b30b6abb7bso1257134885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 03:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764759851; x=1765364651; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFJKTwjHiAis4wfTQBy6AYXPEaNWvPiC5x9VaYm8ow4=;
        b=Jvpa9VJVlZ3LYMBfipfJZ6oK21yZWHOe5FXxU2xUySvrWu5tx4ac+VmUkTbdbcE3aU
         CPHBRFeW3gPFoFtFqeIe5xOeTTSb0nEoRcgGBsA7dNpTO0+rKpL8Oer7m9s3mEBX03Ie
         FEuvr7ekLda0VLZ2/rb9CXpPTFoLyQ4iOD97Z9oVB/5iRgQHf2qSkr32jZNyEzimgi5I
         GVs4jTpnIR+fkqiNNT/zyZym+b0uLLCVjrJtB3/syM+qWjnOSL58H7BmwVqc9ncXpVEa
         19x1LTxzVGVGzua9+0pI8dRf8eT1eQocf3wQhFriwfVckyfOVr+4GJpiASG/akPWs1rp
         5AWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764759851; x=1765364651;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UFJKTwjHiAis4wfTQBy6AYXPEaNWvPiC5x9VaYm8ow4=;
        b=AugHDYIE+G5HT4KpPQZslRZhcC55xNUmaB82WZbh6jfHuOccVU+bcKGOZ5VDMtsiW9
         uwJ+is0kiR5AGS5ujWPmIi6XKunaMwD3la8mUkkyUtEHOJFj+zmoJVfa/fP1tGTWAPHL
         XCDQwJaqRxDG1s3O/6/zGs9ZgUsVRteRAceJyH9zpakyekl2l+/uv3v1Asopr5qtYp4e
         Azj1VQ8uSdXGmD/SlFtmxvhR2CH/gzAwgYldj4KAuKvx9iMyYAiDtw25WJlXiY03k3Qj
         tA6tsLUzcbED6AYjAq41We8jzTOqW7xhr5BbRKx3pLd4vLV3QJmghuoOjgLhM249/ykM
         424w==
X-Forwarded-Encrypted: i=1; AJvYcCXEn4ZslxDnWIsy5pdPUBSEzf85BNrpK8c0NyN1EFeKy25kwBO+I2TI2Few2odORgQhTNtL29PDXsjb/76sBBO1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzudues4P63NuPXGFk/zobtBbIgtbmiXZ81Z0PNyz5JY0yTMq0
	iotVnTcnwzIKRuSbkryvig1NkUcAu5TqF0kk6AWx8evO0gM6v1YG3ysFOIHtUZsgyQxG398oaao
	uGJy+6Hv3OQbhGe2ZGo5EJDCotNGtockeFWGF5OcTYTv8+kI3RRaozE8gNcI5Zo0JFTcomfC8Pc
	h6tw==
X-Gm-Gg: ASbGncvpAxn/7VuZiD9evglv2HNT9pEx1VER2VWkztGhaiTye07k4+UtgaeD7byejTF
	ZsNhl0xzLpaB+HlSG2OrVxuD+lJzdQuk7GhdAl0juxbyvsD3Zaxjzli5PlBBhMJUdtlFqIe/R65
	PmpHGTNjoHy8l4XMSAJwApOmXuRnH8MwkV7ajWJ4S3de7fg8sRvu3qlMGnDP2G7dew8LSe1sxTe
	JDG8BV1ao3aFERTyvzTeeUnPeqONUnxHjiUr3upjFmTh49eY+88Q3nSiDtsBE5hFwXvRvD0ZemA
	fRshh2mohh4jrFX1UBoFHUQrBNXdAQpreZy5ySlQ9VG5g9wzyHDgZv9arPKTZ8bBn8a815fkKEv
	Gfc3r79sXeRAhQyOvoN/4u3jO
X-Received: by 2002:a05:620a:44d4:b0:8b1:fde4:59ee with SMTP id af79cd13be357-8b5e763d0aemr234587285a.85.1764759851350;
        Wed, 03 Dec 2025 03:04:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNbWJbzcy/B+fJSd0ZSuNTdWoH8tv96dKu+U9fsX4anpstqGkK1k1pN4CLnfJoddBVt0Y8gw==
X-Received: by 2002:a05:620a:44d4:b0:8b1:fde4:59ee with SMTP id af79cd13be357-8b5e763d0aemr234581985a.85.1764759850885;
        Wed, 03 Dec 2025 03:04:10 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1cac995esm37331534f8f.43.2025.12.03.03.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 03:04:10 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
        Cristian Marussi
 <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
In-Reply-To: <20251126-camouflaged-delightful-cuckoo-ddeac8@sudeepholla>
	(Sudeep Holla's message of "Wed, 26 Nov 2025 14:31:30 +0000")
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
	<87wm44aect.fsf@stealth>
	<20251126-camouflaged-delightful-cuckoo-ddeac8@sudeepholla>
Date: Wed, 03 Dec 2025 11:04:09 +0000
Message-ID: <877bv3n7x2.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: sNoCLhM5QZXd6WiFw6usIRtaoHl68taf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA4NyBTYWx0ZWRfXwlJijfI6D+04
 KMN7G6V+4pOFY+6AqSF/JmRK36y/WtgJ9uQlu9K8Rc0+efEnraL6XdTTozygpodtLcptQxntSml
 OqgUx2usxeGLGHb7r9iG0pinx5aU1QTt9V1jawklcoR5REVmYd9Kx+aUzPMzOvHSjs8AXo/9a7C
 WFkjUirkUJ7biBdnGC4ICjVqebbijDfn34irx05zpAvtpTw53E55TWAGrWwLP7pH2mEQo4OO+O/
 Sk+GVjHB9Nl6FGiJ5OXt1tPfrNuUFp8S2KR/Adlsek2cCiESj2zWVIgJeqk8iSI7SY8+JTpiN4V
 cdLosLarq7PWfck68lrtodVfC5tcyCXTbpjbnzzPX0+DmJYxXb+qtYUotJvbpN4n5HRZ1GWp31e
 vah1wgHejRWnrZwJUzGgxFV9T+jeXw==
X-Proofpoint-GUID: sNoCLhM5QZXd6WiFw6usIRtaoHl68taf
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6930192c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8
 a=Wh0JOPiwVpfDxFduUbEA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_030414_799150_9BF28FEB 
X-CRM114-Status: GOOD (  31.51  )
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

Hi Sudeep,

Sudeep Holla <sudeep.holla@arm.com> writes:

> On Wed, Nov 05, 2025 at 11:49:38AM +0000, Punit Agrawal wrote:
>> Hi Sudeep,
>> 
>> Sudeep Holla <sudeep.holla@arm.com> writes:
>> 
>> > The SCMI can be utilized in systems using either the FDT or ACPI specification.
>> > While FDT-based systems can natively use SCMI, ACPI-based systems often
>> > need to abstract the functionality provided by SCMI under ASL methods.
>> > So far, there has been no need to support SCMI natively on ACPI systems.
>> >
>> > However, with the addition of a few new protocols such as Powercap and Telemetry,
>> > which lack abstractions in the ACPI specification, there is now a need to
>> > run SCMI natively for those use cases.
>> >
>> > This patch series introduces ACPI PCC transport support for the Arm SCMI
>> > framework, alongside several foundational refactors and enhancements to
>> > achieve firmware-node neutrality between Device Tree (DT) and ACPI systems.
>> >
>> > The key changes include:
>> >
>> > 1. ACPI/DT abstraction and fwnode transition
>> >
>> >    Converted the core SCMI code to use `fwnode_handle` instead of DT-specific
>> >    structures, ensuring seamless operation across both ACPI and DT
>> >    environments. All property lookups, child enumeration, and device
>> >    association paths have been updated accordingly.
>> >
>> > 2. Unified transport registration for ACPI and DT
>> >
>> >    Extended the SCMI transport driver macros to support ACPI match tables,
>> >    enabling transports to probe using ACPI device IDs while maintaining
>> >    backward compatibility with DT-only systems.
>> >
>> > 3. Protocol device initialization and refactoring
>> >
>> >    Refactored the protocol device creation and validation logic into a new
>> >    helper for improved readability and maintainability. Enhanced the
>> >    initialization logic to handle ACPI-based SCMI devices without explicit
>> >    child fwnodes.
>> >
>> > 4. Introduction of ACPI PCC transport
>> >
>> >    Added a new SCMI transport driver leveraging ACPI PCCT (Platform
>> >    Communications Channel Table) subspaces via the Linux PCC mailbox
>> >    framework. This enables SCMI communication over PCC on ACPI-based
>> >    platforms.
>> >
>> > Collectively, these changes lay the groundwork for robust SCMI operation on
>> > ACPI platforms, achieving near parity with DT systems where applicable,
>> > while enabling the new PCC transport path for firmware communication.
>> 
>> I was interested in taking a closer look at the patches here but they
>> have a dependency on support for the telemetry protocol patches. I get a
>> compile error.
>> 
>> I was wondering if you have a branch with the dependencies included. Are
>> the v1 telemetry support patches[0] the right version to be using?
>>
>
> I can create one but that is not strictly necessary. As mentioned in the
> cover letter, the only dependency is on value of SCMI_PROTOCOL_TELEMETRY
> ins `scmi_std_protocol` enumeration. Just add one and you must be able to
> compile the series independent of Cristian series.

Thanks, I managed to get the patches building. Looking forward to the
series progressing. If possible, do keep me in the loop for future
updates.

