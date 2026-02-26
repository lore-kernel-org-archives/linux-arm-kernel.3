Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4D4FC5904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PuwrpYHKTq+yUBpseafFLTw4rFPjcM9QQ+vB3eBHFCU=; b=rCTNUIqBNLE9Yyhs777NbX/uSZ
	OkQfiGCOZ/GcmCBdGM19HJ7DMil3gwNuJoctV575ITkVgq5FbVJII2vvvp+JcJz+w7mYAm5MZvRcx
	A9Sxbl4SVfcHkACNPjrSibuKA3DJXstP99Bo5LFcQDh6lFVXBerNARu/IWpCxWiTMyxb1cidjAPy0
	MBRs3kcLUvV6EDZP8tQr+FX+Hbz/dey+CS1Sn+RhMBNNTqUNoX1yPH/O58vsoBGjM5ZCib8fXlYVx
	X+j/M0rHWZ+vJx5j1QOaS3xgz1Sm/vkOMOzWVNubARZGydwWdE9d0iKA12OG68L7+QQSZ3khZtvQB
	e/gqz5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVNq-00000005X0d-3rxg;
	Thu, 26 Feb 2026 07:02:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVNp-00000005X0E-18ln
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:02:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VGGx3995286
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuwrpYHKTq+yUBpseafFLTw4rFPjcM9QQ+vB3eBHFCU=; b=gdta/EM5CvQGlG0K
	ut6mwjp8R1yuSSizLf5WFvAjSRpdaMukUrXqxJJes+U/SpXDCAE10KgwTLo+9ZiB
	NbLHwEMra7xF65M6dLb/5BO7zvqALTGPK2pakphfiLY9NHn5pcr0cP0+dI3DM8o6
	xACP7BVCih/hWaDHA2Q00eZJT/WzOyYcQ7lEdW4q4WFv42S7lObaOxmSqJP9MMo8
	tncgQtI7VfJg5pCCXTO37YVSdnHm0XEsCgGRTetRuTg7+0hiJyHteVEecZf1KHNU
	o82ZwnM7/3DuktbaVBSpo3qn+tdFL1PUTl0TBYmouZsnmZjSL2pSi5Lj1Bbf6FRX
	28R1ZA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj55st4c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:02:00 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-67999892f00so13658659eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 23:02:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772089320; cv=none;
        d=google.com; s=arc-20240605;
        b=lJJPKFGUEPhrI1jV56mFP/jSSZq4G+cUmZb1IMJavSh1iVGCbb/duBx9URIlXpTxU9
         42MJTK2HcKEKYeA1HdONklJYLdbOqbcn23ANAxOmguSvbd1RCw+TL43mfdEFFYpT93pP
         vtBiKELcUiOK6Yzm47Zb/3hVB/AtjQo35JJeBH6LRzeQgm5JFQJk0ECWBP+yxPcrYH2t
         VFD/W7wp6FjemKuImFRaphqMVsh3nFhK9YTylb8ynE3MYmprLx2AYTSMSpM8MlJD1boS
         F9Z+aIHYz5BdwVj6fQYKXSsZKuiR8uxJT05Xj/nyNU5LWSspCPx8Kk/Ge1KDH6v7+GBr
         d7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PuwrpYHKTq+yUBpseafFLTw4rFPjcM9QQ+vB3eBHFCU=;
        fh=nQKM6EoR4+QOjXkZj0zZs+GNDdqWTuAyYQt5PXfNlNk=;
        b=GDYFZE3BuepkvWNd3PEMXZ3WLhzRfagMLX74KYxj1a+2H623kmdrPmKJBEAIE6uO3i
         lL8oAkZm47tQc4gJKv5RMYkPpoUz6zeJe07OEc8dUyRc13xnF0yUndh0ax367jwYRwwZ
         OcSKp7jlKPOg1eNNBsUUzv+iEmUANwHIzfrOszWKIZTA9B3Y5yCAJuHesqthX/UNiSWR
         Efu54AJuiYsteVQbLqaurMAI6R7UeVPbk5RPtkVVWCXggEGQegFnJbZ/BN7hw+vPzVNu
         R65LwEwJBdcRsK+33OXVKYPzaZzBWXzC1zK47TNTbGt0+tt6KR8ZXzpsA6YgrZYSt4I4
         1y7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772089320; x=1772694120; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuwrpYHKTq+yUBpseafFLTw4rFPjcM9QQ+vB3eBHFCU=;
        b=PZnCPGUa0I3HOIFfn5jtZtAs58qFQFRnI0MRh83WgdKiqDwzq9a3nOSvDdHErZ78jj
         4et1b3szs4RUsNjzFUhBSDe4udiuEpEstk28pHQCQVsd41sURgg8cz33Ik8x3hhAN+Ev
         rWF9QRWyHa56yEMnpaDZnX+IKt2R1x2u0ys0eWxD8ynVNEvnAdx1F0nt6cpfe33zOodF
         pg2xuoyU673dhXAzxvSU3WXhWtCLQjQ7UJkSTChQpPDk5dFmUQFoO4vnviCfkd+eJkmf
         DAXU9fQ60tcNJRnHtbSBplrRw15VNkn+I8PgLQyIXWLX0HvGCgEvKEIVWnfChxKaxv52
         XdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089320; x=1772694120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PuwrpYHKTq+yUBpseafFLTw4rFPjcM9QQ+vB3eBHFCU=;
        b=WGVwYiOEM14NKTCy3Eg97gGYQHesZZ4fX88xtM7GRhGmAFf9ta9ua45uOIncOIqK0l
         LeZlscVaCfNlD6L4YIXjNDDVTzFvsd9sKOh4KrBJejXU4H9bRNbVJAMxZAeO10zJyv1X
         UdtCAEqMtIUJJia4VTU9KhY1xSf6lZfAOrFjvTBdHPbDGHY7oTwSK+PmiEhd3BrmM6jg
         jJ5wPYUu+uNOU9R3z56iIsqoh7S6UjnLFePnY/W1RrNe1dxcYEl5EKkjmtKp1hmattye
         MQKSYgD18705u4OjxoAyeN24jGTm+8+36IvKt7jvd/yFrrzV+T4cqaC5SuypkN1gUIVr
         iwJA==
X-Forwarded-Encrypted: i=1; AJvYcCX0yO8CuXmhXkjW9jmDnVwkk1jFI2n7o7Zmltwv2BMJ5X/IFvJtQZuUVSlHcf7OdqatJ5K7lJn0YLjbcR77icly@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf8R35nrDcoe+UBnn4z2qGkTKRH6q2D0xK7/LHtpX3HmD622uI
	ebgfMLe4uz0m/0jvX6IDNcQ3/9mUjV3TqjBqzPXMNTblcQU8/JHdP+JMEIdcoNPVRc6FebQIuZ8
	68iMts30xFg9MPN1EBNvE7S+NXRLtRhD7BQDuzRF2Xv6HO2lH1tNz/JxPjsU1J6nV3mp4omYMR2
	S0aQ0iXEmah5rYubFJ8JtSBHaZlPCAjLQuLInlzq0u/0snWmJCfD6r
X-Gm-Gg: ATEYQzzbqkDkbTvx+FWp6zwIkvSfPmgP3VB5lvwWjufgZK7WBUe3lXXrLBGkv2AYoJC
	czt9PXKTGXYL6jDdR0iXao5lLvTN5ePY8plihYKnOQ7UsS265KlIwN+8xY5M3VQZYZBgNxK52kQ
	MGlhvk8Iy+2hOhvih0Gvfur/IqQp6m28QIrKLO/LfXw01WTzMEJ7j7/ffADeef6aQjJ0QX9zOw5
	NUNARA=
X-Received: by 2002:a05:6820:1620:b0:662:ff03:c213 with SMTP id 006d021491bc7-679ef989c63mr1389654eaf.61.1772089319773;
        Wed, 25 Feb 2026 23:01:59 -0800 (PST)
X-Received: by 2002:a05:6820:1620:b0:662:ff03:c213 with SMTP id
 006d021491bc7-679ef989c63mr1389647eaf.61.1772089319185; Wed, 25 Feb 2026
 23:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
 <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-11-347fa2d7351b@arm.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-11-347fa2d7351b@arm.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 12:31:46 +0530
X-Gm-Features: AaiRm50IC1HsOl6QMRXAOVKf4_ryi0l229YCdeA9iFVtyFNBsgVnkGuVYYlysYg
Message-ID: <CA+Ht8=bj_5UDYmHrdp5s+1e3amO7ErPm-K28Wog2y3+j4PtjNw@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] RAS: add DeviceTree firmware-first CPER provider
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry.Lamerov@arm.com, catalin.marinas@arm.com, bp@alien8.de,
        robh@kernel.org, rafael@kernel.org, will@kernel.org, conor@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2MSBTYWx0ZWRfX8UxzOYFPNDcJ
 cmJrYLeO8l5AKvr1yRQdX9KPMUq3PxpixWSQsoSUFOUMkYuRN0WMoyga7RCz5MdMHdN9aE4uS49
 zEHL9CwNqmmYxIleW4CzA/Udly+1XkqUx4Wme3fM3pV0n64O060agzTWbdoB2mF9c4sSO8IAm7o
 2/rVq7TAXBV/8ntKBYYvQG6m1lsjwwn6+2YtZU0DDKj4gW5XAtsiFT3jew89vEILUWfOL3e8Vlh
 vyRhswXantObL/0gcaMKEVCtqjqi31wEzrYQxoeh8HI0dJkQQTkX6p4VOFHewk0m2FV0JYLJH1/
 3crMtm7aoZEM5knsKtZdvnos5EaHigrXNcuPzqutcUXDDPPKNk33vxPehkyL7N9hiAfIbyBdmas
 UqVaoOmKit9+CgSEv7gjlgDrSGfUeR0XjQttsFDUUN04STVdGE18cf534RKNjKiyb5YT6mPaWzy
 gG9pIjNCmOIAfLM02bA==
X-Proofpoint-GUID: 5CdAh49IWMlnKHNBZWNqJuOD0s5mljS0
X-Authority-Analysis: v=2.4 cv=JfGxbEKV c=1 sm=1 tr=0 ts=699fefe8 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8
 a=0_E0fn6IqdgZwImqbKcA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 5CdAh49IWMlnKHNBZWNqJuOD0s5mljS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_230201_323559_AB1A12C5 
X-CRM114-Status: GOOD (  36.53  )
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

On Fri, Feb 20, 2026 at 7:13=E2=80=AFPM Ahmed Tiba <ahmed.tiba@arm.com> wro=
te:
>
> Add a DeviceTree firmware-first CPER provider that reuses the shared
> GHES helpers, wire it into the RAS Kconfig/Makefile and document it in
> the admin guide. Update MAINTAINERS now that the driver exists.
>
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  Documentation/admin-guide/RAS/main.rst |  18 +++
>  MAINTAINERS                            |   1 +
>  drivers/acpi/apei/apei-internal.h      |  10 +-
>  drivers/acpi/apei/ghes_cper.c          |   2 +
>  drivers/ras/Kconfig                    |  12 ++
>  drivers/ras/Makefile                   |   1 +
>  drivers/ras/esource-dt.c               | 264 +++++++++++++++++++++++++++=
++++++
>  include/acpi/ghes_cper.h               |   9 ++
>  8 files changed, 308 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/admin-guide/RAS/main.rst b/Documentation/admin=
-guide/RAS/main.rst
> index 5a45db32c49b..4ffabaaeabb1 100644
> --- a/Documentation/admin-guide/RAS/main.rst
> +++ b/Documentation/admin-guide/RAS/main.rst
> @@ -205,6 +205,24 @@ Architecture (MCA)\ [#f3]_.
>  .. [#f3] For more details about the Machine Check Architecture (MCA),
>    please read Documentation/arch/x86/x86_64/machinecheck.rst at the Kern=
el tree.
>
> +Firmware-first CPER via DeviceTree
> +----------------------------------
> +
> +Some systems expose Common Platform Error Record (CPER) data
> +via DeviceTree instead of ACPI HEST tables.
> +Enable ``CONFIG_RAS_ESOURCE_DT`` to build the ``drivers/ras/esource-dt.c=
``
> +driver and describe the CPER error source buffer with the
> +``Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml`` binding.
> +The driver reuses the GHES CPER helper object in
> +``drivers/acpi/apei/ghes_cper.c`` so the logging, notifier chains, and
> +memory failure handling match the ACPI GHES behaviour even when
> +ACPI is disabled.
> +
> +Once a platform describes a firmware-first provider, both ACPI GHES and =
the
> +DeviceTree driver reuse the same code paths. This keeps the behaviour
> +consistent regardless of whether the error source is described via ACPI
> +tables or DeviceTree.
> +
>  EDAC - Error Detection And Correction
>  *************************************
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 47db7877b485..fa6113b482b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22031,6 +22031,7 @@ RAS ERROR STATUS
>  M:     Ahmed Tiba <ahmed.tiba@arm.com>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml
> +F:     drivers/ras/esource-dt.c
>
>  RAS INFRASTRUCTURE
>  M:     Tony Luck <tony.luck@intel.com>
> diff --git a/drivers/acpi/apei/apei-internal.h b/drivers/acpi/apei/apei-i=
nternal.h
> index 77c10a7a7a9f..c16ac541f15b 100644
> --- a/drivers/acpi/apei/apei-internal.h
> +++ b/drivers/acpi/apei/apei-internal.h
> @@ -8,6 +8,7 @@
>  #define APEI_INTERNAL_H
>
>  #include <linux/acpi.h>
> +#include <acpi/ghes_cper.h>
>
>  struct apei_exec_context;
>
> @@ -120,15 +121,6 @@ int apei_exec_collect_resources(struct apei_exec_con=
text *ctx,
>  struct dentry;
>  struct dentry *apei_get_debugfs_dir(void);
>
> -static inline u32 cper_estatus_len(struct acpi_hest_generic_status *esta=
tus)
> -{
> -       if (estatus->raw_data_length)
> -               return estatus->raw_data_offset + \
> -                       estatus->raw_data_length;
> -       else
> -               return sizeof(*estatus) + estatus->data_length;
> -}
> -
>  int apei_osc_setup(void);
>
>  int einj_get_available_error_type(u32 *type, int einj_action);
> diff --git a/drivers/acpi/apei/ghes_cper.c b/drivers/acpi/apei/ghes_cper.=
c
> index 29b790160e91..9b2d1b8cf9f4 100644
> --- a/drivers/acpi/apei/ghes_cper.c
> +++ b/drivers/acpi/apei/ghes_cper.c
> @@ -42,7 +42,9 @@
>  #include <asm/fixmap.h>
>  #include <asm/tlbflush.h>
>
> +#ifdef CONFIG_ACPI_APEI
>  #include "apei-internal.h"
> +#endif
>
>  ATOMIC_NOTIFIER_HEAD(ghes_report_chain);
>
> diff --git a/drivers/ras/Kconfig b/drivers/ras/Kconfig
> index fc4f4bb94a4c..ea6d96713020 100644
> --- a/drivers/ras/Kconfig
> +++ b/drivers/ras/Kconfig
> @@ -34,6 +34,18 @@ if RAS
>  source "arch/x86/ras/Kconfig"
>  source "drivers/ras/amd/atl/Kconfig"
>
> +config RAS_ESOURCE_DT
> +       bool "DeviceTree firmware-first CPER error source block provider"
> +       depends on OF
> +       depends on ARM64
> +       select GHES_CPER_HELPERS
> +       help
> +         Enable support for firmware-first Common Platform Error Record =
(CPER)
> +         error source block providers that are described via DeviceTree
> +         instead of ACPI HEST tables. The driver reuses the existing GHE=
S
> +         CPER helpers so the error processing matches the ACPI code path=
s,
> +         but it can be built even when ACPI is disabled.
> +
>  config RAS_FMPM
>         tristate "FRU Memory Poison Manager"
>         default m
> diff --git a/drivers/ras/Makefile b/drivers/ras/Makefile
> index 11f95d59d397..53558a1707b3 100644
> --- a/drivers/ras/Makefile
> +++ b/drivers/ras/Makefile
> @@ -2,6 +2,7 @@
>  obj-$(CONFIG_RAS)      +=3D ras.o
>  obj-$(CONFIG_DEBUG_FS) +=3D debugfs.o
>  obj-$(CONFIG_RAS_CEC)  +=3D cec.o
> +obj-$(CONFIG_RAS_ESOURCE_DT)   +=3D esource-dt.o
>
>  obj-$(CONFIG_RAS_FMPM) +=3D amd/fmpm.o
>  obj-y                  +=3D amd/atl/
> diff --git a/drivers/ras/esource-dt.c b/drivers/ras/esource-dt.c
> new file mode 100644
> index 000000000000..b575a2258536
> --- /dev/null
> +++ b/drivers/ras/esource-dt.c
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DeviceTree provider for firmware-first CPER error source block.
> + *
> + * This driver shares the GHES CPER helpers so we keep the reporting and
> + * notifier behaviour identical to ACPI GHES
> + *
> + * Copyright (C) 2025 ARM Ltd.
> + * Author: Ahmed Tiba <ahmed.tiba@arm.com>
> + */
> +
> +#include <linux/atomic.h>
> +#include <linux/bitops.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/panic.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <acpi/ghes.h>
> +#include <acpi/ghes_cper.h>
> +
> +static atomic_t ghes_ffh_source_ids =3D ATOMIC_INIT(0);
> +
> +struct ghes_ffh_ack {
> +       void __iomem *addr;
> +       u64 preserve;
> +       u64 set;
> +       u8 width;
> +       bool present;
> +};

Please don't use ffh. FFH stands for Fixed Feature Hardware. This is
making it confusing. As per ACPI specification, FFH can be used to
register read/write while handling errors.
I have started feeling that all this churn should be avoided. All the
GHES code is also being moved in the name of CPER helpers.

> +
> +struct ghes_ffh {
> +       struct device *dev;
> +       void __iomem *status;
> +       size_t status_len;
> +
> +       struct ghes_ffh_ack ack;
> +
> +       struct acpi_hest_generic *generic;
> +       struct acpi_hest_generic_status *estatus;
> +
> +       bool sync;
> +       int irq;
> +
> +       /* Serializes access to the firmware-owned buffer. */
> +       spinlock_t lock;
> +};
> +
> +static int ghes_ffh_init_pool(void)
> +{
> +       if (ghes_estatus_pool)
> +               return 0;
> +
> +       return ghes_estatus_pool_init(1);
> +}
> +
> +static int ghes_ffh_copy_status(struct ghes_ffh *ctx)
> +{
> +       memcpy_fromio(ctx->estatus, ctx->status, ctx->status_len);
> +       return 0;
> +}
> +
> +static void ghes_ffh_ack(struct ghes_ffh *ctx)
> +{
> +       u64 val;
> +
> +       if (!ctx->ack.present)
> +               return;
> +
> +       if (ctx->ack.width =3D=3D 64) {
> +               val =3D readq(ctx->ack.addr);
> +               val &=3D ctx->ack.preserve;
> +               val |=3D ctx->ack.set;
> +               writeq(val, ctx->ack.addr);
> +       } else {
> +               val =3D readl(ctx->ack.addr);
> +               val &=3D (u32)ctx->ack.preserve;
> +               val |=3D (u32)ctx->ack.set;
> +               writel(val, ctx->ack.addr);
> +       }
> +}
> +
> +static void ghes_ffh_fatal(struct ghes_ffh *ctx)
> +{
> +       __ghes_print_estatus(KERN_EMERG, ctx->generic, ctx->estatus);
> +       add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
> +       panic("GHES: fatal firmware-first CPER record from %s\n",
> +             dev_name(ctx->dev));
> +}
> +
> +static void ghes_ffh_process(struct ghes_ffh *ctx)
> +{
> +       unsigned long flags;
> +       int sev;
> +
> +       spin_lock_irqsave(&ctx->lock, flags);
> +
> +       if (ghes_ffh_copy_status(ctx))
> +               goto out;
> +
> +       sev =3D ghes_severity(ctx->estatus->error_severity);
> +       if (sev >=3D GHES_SEV_PANIC)
> +               ghes_ffh_fatal(ctx);
> +
> +       if (!ghes_estatus_cached(ctx->estatus)) {
> +               if (ghes_print_estatus(NULL, ctx->generic, ctx->estatus))
> +                       ghes_estatus_cache_add(ctx->generic, ctx->estatus=
);
> +       }
> +
> +       ghes_cper_handle_status(ctx->dev, ctx->generic, ctx->estatus, ctx=
->sync);
> +
> +       ghes_ffh_ack(ctx);
> +
> +out:
> +       spin_unlock_irqrestore(&ctx->lock, flags);
> +}
> +
> +static irqreturn_t ghes_ffh_irq(int irq, void *data)
> +{
> +       struct ghes_ffh *ctx =3D data;
> +
> +       ghes_ffh_process(ctx);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int ghes_ffh_init_ack(struct platform_device *pdev,
> +                            struct ghes_ffh *ctx)
> +{
> +       struct resource *res;
> +       size_t size;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +       if (!res)
> +               return 0;
> +
> +       ctx->ack.addr =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(ctx->ack.addr))
> +               return PTR_ERR(ctx->ack.addr);
> +
> +       size =3D resource_size(res);
> +       switch (size) {
> +       case 4:
> +               ctx->ack.width =3D 32;
> +               ctx->ack.preserve =3D ~0U;
> +               break;
> +       case 8:
> +               ctx->ack.width =3D 64;
> +               ctx->ack.preserve =3D ~0ULL;
> +               break;
> +       default:
> +               dev_err(&pdev->dev, "Unsupported ack resource size %zu\n"=
, size);
> +               return -EINVAL;
> +       }
> +
> +       ctx->ack.set =3D BIT_ULL(0);
> +       ctx->ack.present =3D true;
> +       return 0;
> +}
> +
> +static int ghes_ffh_probe(struct platform_device *pdev)
> +{
> +       struct ghes_ffh *ctx;
> +       struct resource *res;
> +       int rc;
> +
> +       ctx =3D devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&ctx->lock);
> +       ctx->dev =3D &pdev->dev;
> +       ctx->sync =3D of_property_read_bool(pdev->dev.of_node, "arm,sea-n=
otify");
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res) {
> +               dev_err(&pdev->dev, "status region missing\n");
> +               return -EINVAL;
> +       }
> +
> +       ctx->status_len =3D resource_size(res);
> +       if (!ctx->status_len) {
> +               dev_err(&pdev->dev, "Status region has zero length\n");
> +               return -EINVAL;
> +       }
> +
> +       ctx->status =3D devm_ioremap_resource(&pdev->dev, res);
> +       if (IS_ERR(ctx->status))
> +               return PTR_ERR(ctx->status);
> +
> +       rc =3D ghes_ffh_init_ack(pdev, ctx);
> +       if (rc)
> +               return rc;
> +
> +       rc =3D ghes_ffh_init_pool();
> +       if (rc)
> +               return rc;
> +
> +       ctx->estatus =3D devm_kzalloc(&pdev->dev, ctx->status_len, GFP_KE=
RNEL);
> +       if (!ctx->estatus)
> +               return -ENOMEM;
> +
> +       ctx->generic =3D devm_kzalloc(&pdev->dev, sizeof(*ctx->generic), =
GFP_KERNEL);
> +       if (!ctx->generic)
> +               return -ENOMEM;
> +
> +       ctx->generic->header.type =3D ACPI_HEST_TYPE_GENERIC_ERROR;
> +       ctx->generic->header.source_id =3D
> +               atomic_inc_return(&ghes_ffh_source_ids);
> +       ctx->generic->notify.type =3D ctx->sync ?
> +               ACPI_HEST_NOTIFY_SEA : ACPI_HEST_NOTIFY_EXTERNAL;
> +       ctx->generic->error_block_length =3D ctx->status_len;
> +
> +       ctx->irq =3D platform_get_irq_optional(pdev, 0);
> +       if (ctx->irq <=3D 0) {
> +               if (ctx->irq =3D=3D -EPROBE_DEFER)
> +                       return ctx->irq;
> +               dev_err(&pdev->dev, "interrupt is required (%d)\n", ctx->=
irq);
> +               return -EINVAL;
> +       }
> +
> +       rc =3D devm_request_threaded_irq(&pdev->dev, ctx->irq,
> +                                      NULL, ghes_ffh_irq,
> +                                      IRQF_ONESHOT,
> +                                      dev_name(&pdev->dev), ctx);
> +       if (rc)
> +               return rc;
> +
> +       platform_set_drvdata(pdev, ctx);
> +       dev_info(&pdev->dev, "Firmware-first CPER status provider (interr=
upt)\n");
> +       return 0;
> +}
> +
> +static void ghes_ffh_remove(struct platform_device *pdev)
> +{
> +}
> +
> +static const struct of_device_id ghes_ffh_of_match[] =3D {
> +       { .compatible =3D "arm,ras-ffh" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ghes_ffh_of_match);
> +
> +static struct platform_driver ghes_ffh_driver =3D {
> +       .driver =3D {
> +               .name =3D "esource-dt",
> +               .of_match_table =3D ghes_ffh_of_match,
> +       },
> +       .probe =3D ghes_ffh_probe,
> +       .remove =3D ghes_ffh_remove,
> +};
> +
> +module_platform_driver(ghes_ffh_driver);
> +
> +MODULE_AUTHOR("Ahmed Tiba <ahmed.tiba@arm.com>");
> +MODULE_DESCRIPTION("Firmware-first CPER provider for DeviceTree platform=
s");
> +MODULE_LICENSE("GPL");
> diff --git a/include/acpi/ghes_cper.h b/include/acpi/ghes_cper.h
> index f7c9fba62585..d43185c020ee 100644
> --- a/include/acpi/ghes_cper.h
> +++ b/include/acpi/ghes_cper.h
> @@ -75,6 +75,15 @@ static inline bool is_hest_sync_notify(struct ghes *gh=
es)
>         return notify_type =3D=3D ACPI_HEST_NOTIFY_SEA;
>  }
>
> +static inline u32 cper_estatus_len(struct acpi_hest_generic_status *esta=
tus)
> +{
> +       if (estatus->raw_data_length)
> +               return estatus->raw_data_offset + \
> +                       estatus->raw_data_length;
> +       else
> +               return sizeof(*estatus) + estatus->data_length;
> +}
> +
>  struct ghes_vendor_record_entry {
>         struct work_struct work;
>         int error_severity;
>
> --
> 2.43.0
>
>

