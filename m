Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D48FC5905
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+P7CghlNIgjxycB/1qldY8eXMaIX8CflGPUmpKbNzU=; b=obsXVp4ZNuDJKM3C0+oW6pSINN
	/W65sGVHPJ5YVT6/vtHsrWaw2m5InZTWHQ0ysjcOAbiO/wxZHV25u6bHbzFWHr+NUHnhIKOwOLGw0
	tesPZl3IiKwlhzKmyveDKALOEqHjOoovwz+wulZWI8AocXhyPC7DEnDIqypmWbGQLnXM7VtyoPfUU
	gnsohjjP5vqa6xENhwxKMKViknGrFvwy0SDKFF6wG2y36MIe7zip3pdTRGKtLGDC4TIwRidquHYC0
	85akIxwKs/9v8JLFDyy4pipucSKBjfFfuwTLr0ke4Ab23DFOTOyX6tf74QFEUvwmQl1gSNGfGod7Z
	+8pN2D7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVRX-00000005XO9-0JrU;
	Thu, 26 Feb 2026 07:05:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVRU-00000005XNH-0Weo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:05:49 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VAvk350356
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+P7CghlNIgjxycB/1qldY8eXMaIX8CflGPUmpKbNzU=; b=cpSVHs9ObcHsKfAX
	3ggqKxAEXUPS1VD3qshQZ0rce0/Ew6L8IPvz9t5w4UaBOJI1vzlU6M8/T/FpTp9W
	sgHBIp6RGQQL0oYuASc1K1r5Ifq2e/jT8HbmgIPhNhxF3l9U8llkr/n9Y9Pp/FFG
	l+CaNPpRgdpkwqyKA/bMPHCQsdtWdsxSNZDu61bxcHRjSLfcRbeLzWmkPhvwci4q
	ShFWsBp9qM2MUlI9bAsIpcS2O1HfqpnPp1bDBjsHiaFvk7wdmVxdKCzHc5nrzU/E
	ses5Ly8RZ59i0kL6FFcn+6sRqnM5fTkFxWROQAiNJvBGcgohyjyWMS8yV70glr2m
	/XeO7Q==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54pa6a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:05:46 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-679862e4413so5632172eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 23:05:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772089546; cv=none;
        d=google.com; s=arc-20240605;
        b=jkdimMPHDKvihOrVltEMWvNJR3YkMKP3JQgU/rP1FRf0hhMUX2yU1QMOWCjtBSML7S
         vTfiWs4HxKjSjJbHLA1ZoX9nL5p937YwP0nXY3F6odm74BwZT/KHXqgWUaWcuMK/eDg6
         8btUi1ZkOZ1wje/UC/F8YpuxzOFA0v8oDl+bw30K+pjEnejXrmYVZVu2mE+yxBud6zAE
         LMqL8lXNMwuTgfDGh30UxJejfhINolHyXeoqmldJH0yM957t4Mj93ge7NbnuTDso90UZ
         YmtMj4CDElD26WdSo1pnGSl3xxKL7z64eAPeseUthEhq6kZNA6G+bkbQ6o3K6SR/WdC/
         NZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k+P7CghlNIgjxycB/1qldY8eXMaIX8CflGPUmpKbNzU=;
        fh=SXtAF5uSkAJH2qJEOfa58FJ32XdEYazmab25LTSe0uU=;
        b=cwViZGWOs+WujxhieJ85kRmpzn8P6fdtbbOE3xAEmF/7lRVeHXLOqFXQg1zR5rkyT6
         BHn2/Nb+KKt6vROxTZfouiOsWeQ/2NzpHBaBbJmVnhr7RhhgrXjGpFBkvGJKEMSVCEY+
         3d6ull2ULTEqMxAz0Mju0StxTKEeSozGPHbF25fFs1PbID2cBx6343sVzpmEWRJZKc6o
         7K5HK6Z+UKHLCishanA69JY1/huGPsH+cojuXPzyH6E5jTzOLdVrD8maMq7sggOjx+uO
         sab1MAI/XnnYeCG8PiosaqpHmpU4WmVAzfPv4ElxHcpLW13IPbDhP5qkLdwEndxOjJEp
         h2sg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772089546; x=1772694346; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+P7CghlNIgjxycB/1qldY8eXMaIX8CflGPUmpKbNzU=;
        b=iGi/1dyqCbpSoinXwKmrtfQnEWOlslLAvh7VDrisyxeG59NUGwv4VYtwYaJ6r/AfhI
         PyfHdYw4LryD93VWcDVfMIHm71nxQAKPmrP6W8BilPYa+OFSs1OuIDi8w+h/Hh8NGNrx
         Fx165gR5qI3sR+xqaNiPxDUUS/YD3mEWwr8Jmt1VyNi11yJAmv8lUdMxnE5STRxBkGwe
         EP83OoqOD95Ah/Ad6a1wqvNYQaPYn2H+TzLeH9BBx1EUF00/yWtREQ/I5yQew1GwXT/m
         e5o6FlpsKT4KEiyHN6XLd2qkUNYO8tGY5VWLCBYHginCb4YZ8d2stTeow9yXrlrPGGW/
         UKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089546; x=1772694346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k+P7CghlNIgjxycB/1qldY8eXMaIX8CflGPUmpKbNzU=;
        b=pwT/y4r7OSlly+4B93yZk8jGGzmAf9JNObODyo9n3UCQJWx2le/om00EkUj4kdGYC9
         r/6XazN4yrvFo2ODAshEX3RzovnrsrU9KOcrB0rlDSYi1tWHQc351u+dybQPec6szV6j
         72nCgWjOKVD0O0HByep/oiAizlvbYsMuaBCPj9jLR02v5ZabR3mgLZZ0b5kOiy790Gbn
         Jh0kW7ZDVbsbxzi2xgRwfs7ZdnrZXsvavYDn6mqK84CYpBFrbWlB8vFF2oKGTHh/R2DX
         8IJODCnqkChNhT0x7JLs3YRhl2HSb55JROkPUTdZ19vCLTsNYmqUbI8ES6D79Tg33NGo
         lyBA==
X-Forwarded-Encrypted: i=1; AJvYcCWGWcIOOWgnvSCXgWdejsoGvc7KMkJHXdAc05WxG+IuZDPHq42thCYlW1YCWCP4ByIBBhfbZwklOYR1ZQDpL9XE@lists.infradead.org
X-Gm-Message-State: AOJu0YyF+MRISuJJ01Q4s3F7V36i7ElfzPSHSGYaNNG6urzZ7OIhGKGY
	MwtY80knlewHGU3yM2zMz+JAoKq0X5xjLdIm0bASuqmo8cpRMcjP/s2RIk2F7aabChdrroJq7h3
	DOwKqDMIfzFRsYNrMVq6yceK/6xSUiX69TnBLVME5HOPJAycH/jfdP2I6gnltqWKLVDZ+PuqGIu
	ICLUAVFx6VNF48tZ+Pr6Gwn/b5Xx7Q75WBIMfNaQB2NlBTAOTnPKOM
X-Gm-Gg: ATEYQzzUnVc6+JjsAkdvBuVKdiDZHoXzRQOq+C6TzfqJfB5r5OGJcrfOGiJ2mzhuBTA
	BhLmUF598P4SLvwhnGhEKkmn1R2FaFzrUekvZKECVjf3cFqiMOOZXjdiBbBsakSf8eTU2Uf4NrA
	uAqOfsArIY9D7uKFHs+W5cIrRRXGj0YX385m/D6kATSmGD3kMu4v/ScxB5b/OeDhCqfqlPuSRk6
	TLL/SI=
X-Received: by 2002:a05:6820:1786:b0:677:4fc0:a852 with SMTP id 006d021491bc7-679f3d28624mr625349eaf.34.1772089546195;
        Wed, 25 Feb 2026 23:05:46 -0800 (PST)
X-Received: by 2002:a05:6820:1786:b0:677:4fc0:a852 with SMTP id
 006d021491bc7-679f3d28624mr625343eaf.34.1772089545831; Wed, 25 Feb 2026
 23:05:45 -0800 (PST)
MIME-Version: 1.0
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 12:35:34 +0530
X-Gm-Features: AaiRm51yZ89kZv0f4gE9xa9boBW5MZ_Co37QxpUC5GHdKH2lI624cxTwISy9vz0
Message-ID: <CA+Ht8=a_fw-u2PLEf1GY7qYLT945OaJ0LeW6K+X2SvSWLqsrXA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] ACPI: APEI: share GHES CPER helpers and add DT
 FFH provider
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry.Lamerov@arm.com, catalin.marinas@arm.com, bp@alien8.de,
        robh@kernel.org, rafael@kernel.org, will@kernel.org, conor@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2MiBTYWx0ZWRfX7w7XzPVWHRHN
 MLVohY2MYNFxQQUQ9Q5oO4218UGMWh78KW/4cBuVos2XIcBSlPep4ojcTMZc8/W2Zd4ssL2tnpI
 JxIRAe7yEl1ImsAk2in7OQJrIY2IctT8xER2mNJ8rMVNmxpKeZMUCzVTznHUNQm+T+M6t9j0HGc
 ooYcabKpxE1TAE9HAxGUsgfmdmBF+BeUwdtnXZQJgFeu4glpu30b27end0KS6K06iuEpiKYfYNv
 4PmHpyHuRKLG9c7pY8Vy6UakJ93AUHyM4BBjmRDc1/zvQr2kSa8oUz5mz5wO6hhbUaD02d1czwP
 d+dbNddpI/qjoxfdM2sjzDFQ2VcazDf+owpRgcxBR3vGLoGzx6mJq0p7qzbgMdJyfwhFdTcCzhl
 yfUOBbnH7/LAhgVllpzTNU8+A4ZRRebX4Exl5g4+LVqEXgG4t5CXOzv8TIhV4IXhmEdRd6soiJV
 Vuc5MySmg+gV8z1Rh8A==
X-Proofpoint-GUID: eR9hZcdd_yIdBNs3TaHy1ZCARM12OG5j
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=699ff0ca cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=2-EGK2xgfFmwblvCShkA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: eR9hZcdd_yIdBNs3TaHy1ZCARM12OG5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_230548_570513_B291CF2D 
X-CRM114-Status: GOOD (  21.51  )
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

On Fri, Feb 20, 2026 at 7:14=E2=80=AFPM Ahmed Tiba <ahmed.tiba@arm.com> wro=
te:
>
> This is v2 of the GHES refactor series. The goal is to reuse existing
> GHES CPER handling for non-ACPI platforms without changing the GHES
> flow or naming, and add a DT firmware-first CPER provider, while
> keeping the changes mechanical and reviewable.

It seems almost all the code is being moved from ghes.c to ghes_cper.c
in multiple patches. It is not making sense and looks like an
unnecessary churn.
What is that which can't be handled in a separate file for non-ACPI platfor=
ms?

>
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
> Changes in v2:
> - Dropped the proposed "estatus core" and kept GHES naming/flow intact
>   (per Borislav Petkov).
> - Re-sliced the series into smaller mechanical steps (per Mauro Carvalho =
Chehab).
> - Minor DT binding fixes based on Krzysztof Kozlowski's feedback.
> - Removed fixmap slot usage from the DT FFH driver (per Will Deacon).
>
> Series structure:
> - Patches 1-8 are mechanical moves only and do not change behavior.
> - Patch 9 wires the shared helpers back into GHES.
> - The DT firmware-first CPER buffer provider is added in the final patche=
s.
> - "ACPI: APEI: introduce GHES helper" is internal build glue only
>   and does not introduce a new user-visible configuration option.
>
> - Link to v1: https://lore.kernel.org/r/20251217112845.1814119-1-ahmed.ti=
ba@arm.com
>
> ---
> Ahmed Tiba (11):
>       ACPI: APEI: GHES: share macros via a private header
>       ACPI: APEI: GHES: add ghes_cper.o stub
>       ACPI: APEI: GHES: move CPER read helpers
>       ACPI: APEI: GHES: move GHESv2 ack and alloc helpers
>       ACPI: APEI: GHES: move estatus cache helpers
>       ACPI: APEI: GHES: move vendor record helpers
>       ACPI: APEI: GHES: move CXL CPER helpers
>       ACPI: APEI: introduce GHES helper
>       ACPI: APEI: share GHES CPER helpers
>       dt-bindings: firmware: add arm,ras-ffh
>       RAS: add DeviceTree firmware-first CPER provider
>
>  Documentation/admin-guide/RAS/main.rst             |   18 +
>  .../devicetree/bindings/firmware/arm,ras-ffh.yaml  |   71 ++
>  MAINTAINERS                                        |    6 +
>  drivers/Makefile                                   |    1 +
>  drivers/acpi/Kconfig                               |    4 +
>  drivers/acpi/apei/Kconfig                          |    1 +
>  drivers/acpi/apei/apei-internal.h                  |   10 +-
>  drivers/acpi/apei/ghes.c                           | 1024 +-------------=
-----
>  drivers/acpi/apei/ghes_cper.c                      | 1026 ++++++++++++++=
++++++
>  drivers/ras/Kconfig                                |   12 +
>  drivers/ras/Makefile                               |    1 +
>  drivers/ras/esource-dt.c                           |  264 +++++
>  include/acpi/ghes.h                                |   10 +-
>  include/acpi/ghes_cper.h                           |  143 +++
>  include/cxl/event.h                                |    2 +-
>  15 files changed, 1558 insertions(+), 1035 deletions(-)
> ---
> base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
> change-id: 20260220-topics-ahmtib01-ras_ffh_arm_internal_review-bfddc7fc7=
cab
>
> Best regards,
> --
> Ahmed Tiba <ahmed.tiba@arm.com>
>
>

