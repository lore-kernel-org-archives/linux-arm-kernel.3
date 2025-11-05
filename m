Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54797CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1p5yPFhjSMK/trdPZcnNN3WgSdZl8jXwKqYLsu5EBw=; b=YvCEh7aV5F/4+uJPsPb9iNRM1b
	pwR6EEDcCZFuov724f81TcIIr6tHeta5AvLRFJm3DhDIeosUga6xFdTUMHaPOATjU6t275hPz1wxD
	mWqZHb6X+ptzV2lAhtSnNp+qA2vBK6T96KNoGYhOJ66w+d9q97gD+6wZ+AjHmensh+bs4pW24J05C
	VEJhYWtlhD73SYWcJGOQfrlhz8TOuoNEVlOlQ9rIZuPGd1GT8B/PQ1Xm4f01gvn+rSnq0EJ/zCsbj
	cY+rBzcFkaYJo497W1l4Z0dJWTuE+flO7jaDBMhQ/rwzDJMQupSpcw6B0uBPwU0KYiJgC3SQWme8l
	R1mNJh5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGc1K-0000000DYs4-0G34;
	Wed, 05 Nov 2025 11:49:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGc1H-0000000DYrj-21Nw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 11:49:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A59AEfZ357437
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Nov 2025 11:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i1p5yPFhjSMK/trdPZcnNN3W
	gSdZl8jXwKqYLsu5EBw=; b=pnQFNcCKT8It91GGvLLP7GAM1mcHkGRieWjEr9Ol
	eXAGNBfliOOhU7LxoSKZ2nlenz05sB6hHg9il8FC2L283pOgAmZX3f72LJoaYg36
	Wg3gqzu6hsL2EO4MPdn8uPKATwKGB/aaUMqL8+ZKtmKDnnscdevy3TqXK4jvr39/
	UrxeLHgtGjy9j4qgE81mz7wT8RrZ+NNnvxB/YjenVzVT39Wa9iEZ//zoYRVuj87+
	DLeuefwiMc4YmfVP6fQF7BMqZwiRUUUefA45AXhNjZqRquYp+czJ9qhpqpQZ/hIK
	LXnQ0jOUbZwZQ4OCPvwMW/8jqd4n9ckzULX4bhAG7jJ9Og==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a83q5gdbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 11:49:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so54675241cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 03:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762343380; x=1762948180; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i1p5yPFhjSMK/trdPZcnNN3WgSdZl8jXwKqYLsu5EBw=;
        b=CkYEg2Dl+msSZOb4ls6Lv6A/tWq9Y5gyoKKY1AbOXmcfcaOMnxy8F4Wm+3HaJFlLLj
         JFF9em4ig6sLuEkYWJ0082azejuR0mk8O+P8rjXprt45yKS2M02r+YXTDGeZwIb1g2SA
         Oy21xt1oU4GJQ2bK33Dkog73zcfhCSY11Q/YbNV5Hh24MIYUHVbMzgqE/ZwhqM+xnS1w
         O+WHCHHO3dlEf1leCTxqeE9CLTLV8CwG81M+VsU4/mcDr78DCImgrrAknxIlw/O8rI6G
         ViWXsLGqI6YdpKKWgQUKXSV9Okxs6I03YBMiwlEJ3kfQLzy/35bPOG30/Vu6Jca/izds
         o4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762343380; x=1762948180;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1p5yPFhjSMK/trdPZcnNN3WgSdZl8jXwKqYLsu5EBw=;
        b=oheyjSqibWZ1klLFBbQDbT31xNZQdNiD3HFzJBZs4znzAt3BRfqTRtu5yOBaLZnRpt
         J3jLHB7TUMwLFiiTtRAAExyWgtAyPBsVk1S8n5HMSlDaDAHHNs1qzymrb4Jjp/X6x7hA
         AXCQZeJftJbmDek9SjnnF7c2gdK3EFIUV06lQGQRfRZaAS0z8DoMv4Lr3C9t26Mf2Jnc
         /V8NOdfDXL2asqGUVKcQZFNUTdETkj6WopCc64KdEbEUbGKxtnfVUt3YFPg5CJVC+XwS
         63S8ZM2luWjxdT2A7s0iLAd4Ybycv/fK/g5BbWcauXTL95MRtg/gQa9rUMU9qXHnuUe1
         TAuA==
X-Forwarded-Encrypted: i=1; AJvYcCVBYwddRLEzwyhuor9sdkqaa8C62OLwZuzOwV5SYT3j7abGCvm013IYjBd3c4vU5+HXAdpn0MBbJhtJjesmklOW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyos/Xi/NX5s367RrscVf0ukW6PNuoJwtsXNbQl76cVToqgi4Ut
	c8dTYXjq9xH7DUAxBt5dyeDjw50JKyXPujs3VP0kZMXEdsdmQ5Um3Xrc3/Q30JGMJEA0MHGjSJF
	hvVI5cnoWdF4CoKgPkFZqLv5dTn6wKWN5m06wVJHLOxcafX1t2MShPcy9/4byyzyIRppPSrzkld
	pwZkazNwqK1IrO
X-Gm-Gg: ASbGncuYB/W0NUBVqUtj8upFZclclnjqnh1+hkK8cCT2YyE5HkqVonYx5x3tGxignyn
	Q2SV8uaWFwMZL7toiItiucE1AZxPlS96gRQdlPVZrUYrBsi3E9iniulAFOfYlrS3hHgop32Vl7F
	aVTxQ89OS7zh4+zSOgO1T0hu2K3GYUukYA8YgDlMTxRJo6lI054bZ3WQrQbMcMpfmI8pKao1iz/
	vICIEhYx8sc4wm6767i3cvcqNSYlWaodCJyMBgTSQOy476pkl2PftRn4Keh1QiMg3fZL6V3aMXY
	yUAD54trJv94/KJILt+qhANZx8do8pm7xuy1VpFallVjmE5whyFzIlxlgDkyO7dEFRIQOnyEpou
	rXgBn64mVu+T/lw==
X-Received: by 2002:a05:622a:830f:b0:4ed:44a7:cf78 with SMTP id d75a77b69052e-4ed723a8f55mr30373931cf.34.1762343380196;
        Wed, 05 Nov 2025 03:49:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFviZmOscvu3WeDg7aLm2At05oLETpKTO0Bo+Vv4IMN5Nrz6eqob/nlu0UHv+XYfNOe61kkg==
X-Received: by 2002:a05:622a:830f:b0:4ed:44a7:cf78 with SMTP id d75a77b69052e-4ed723a8f55mr30373751cf.34.1762343379595;
        Wed, 05 Nov 2025 03:49:39 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4775cdc2d14sm44637865e9.1.2025.11.05.03.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:49:39 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
In-Reply-To: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com> (Sudeep
	Holla's message of "Fri, 17 Oct 2025 14:23:43 +0100")
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
Date: Wed, 05 Nov 2025 11:49:38 +0000
Message-ID: <87wm44aect.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9EpEEYtmXMBbYrEILB_k_Szdupq199pY
X-Proofpoint-GUID: 9EpEEYtmXMBbYrEILB_k_Szdupq199pY
X-Authority-Analysis: v=2.4 cv=YZKwJgRf c=1 sm=1 tr=0 ts=690b39d5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=XzXL5FNJrteVcywYxDQA:9 a=kacYvNCVWA4VmyqE58fU:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA4OCBTYWx0ZWRfX/RaXWcgTdg5B
 eJRmoV1RjRt6paHUtFUT/aQO1ujeqG5ovd3E887p6T/nxrZSs2SBRcC7050kUH+jehWg3Wa2gfw
 cR3c9b//iyK45rIHfimZwSBSDUMvIrQATOTFGQ2u0Lik7bVurQG8IR7pvW5UvxtsUnF09aTD6Lg
 hMWiE9hYIBkYw87wRd2WGPaf/vyiRVSBmcdiZ6Izstex+b5yf5quxHF9/esplef4MWpcQL6fa/W
 SeNUX0jNdRB6fc021qFG4GA/k+vrAOHekshHTAbWnr/SGP5Q0rP3ULVj3mIl9qhPqN1DT3dX6/i
 UAvmqJY5mtfAXdDYV1AK0SkucJlvv2HCq49XD4mcRdTslXKjtwwd58lOQWGfmICZNNnYmDoe40R
 wxNsNLY7ehNKCULXREKU5KaE9aWbBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_034943_546157_EC29F0EC 
X-CRM114-Status: GOOD (  24.80  )
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

> The SCMI can be utilized in systems using either the FDT or ACPI specification.
> While FDT-based systems can natively use SCMI, ACPI-based systems often
> need to abstract the functionality provided by SCMI under ASL methods.
> So far, there has been no need to support SCMI natively on ACPI systems.
>
> However, with the addition of a few new protocols such as Powercap and Telemetry,
> which lack abstractions in the ACPI specification, there is now a need to
> run SCMI natively for those use cases.
>
> This patch series introduces ACPI PCC transport support for the Arm SCMI
> framework, alongside several foundational refactors and enhancements to
> achieve firmware-node neutrality between Device Tree (DT) and ACPI systems.
>
> The key changes include:
>
> 1. ACPI/DT abstraction and fwnode transition
>
>    Converted the core SCMI code to use `fwnode_handle` instead of DT-specific
>    structures, ensuring seamless operation across both ACPI and DT
>    environments. All property lookups, child enumeration, and device
>    association paths have been updated accordingly.
>
> 2. Unified transport registration for ACPI and DT
>
>    Extended the SCMI transport driver macros to support ACPI match tables,
>    enabling transports to probe using ACPI device IDs while maintaining
>    backward compatibility with DT-only systems.
>
> 3. Protocol device initialization and refactoring
>
>    Refactored the protocol device creation and validation logic into a new
>    helper for improved readability and maintainability. Enhanced the
>    initialization logic to handle ACPI-based SCMI devices without explicit
>    child fwnodes.
>
> 4. Introduction of ACPI PCC transport
>
>    Added a new SCMI transport driver leveraging ACPI PCCT (Platform
>    Communications Channel Table) subspaces via the Linux PCC mailbox
>    framework. This enables SCMI communication over PCC on ACPI-based
>    platforms.
>
> Collectively, these changes lay the groundwork for robust SCMI operation on
> ACPI platforms, achieving near parity with DT systems where applicable,
> while enabling the new PCC transport path for firmware communication.

I was interested in taking a closer look at the patches here but they
have a dependency on support for the telemetry protocol patches. I get a
compile error.

I was wondering if you have a branch with the dependencies included. Are
the v1 telemetry support patches[0] the right version to be using?

Thanks,
Punit

[0] https://lore.kernel.org/all/20250925203554.482371-1-cristian.marussi@arm.com/


[...]

