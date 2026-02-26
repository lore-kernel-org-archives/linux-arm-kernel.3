Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E599BFC5904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLrxoSzHXhl2Gv/xx7gH4l/8foTy6gK4EWkBQXv8dA4=; b=nsNTCEawJvQPqeuiDcB8Hb1p8e
	8zwlEV4bMuqtD6qDVIQ1fRxmQrPOMM7WUCX6naszbZo5g8mdlTQSMbe6mWjTJ8trMeQJgN2TuyMEC
	pbao7MoHDfiUsVuZPxfz2p8pPT4c6x031utE/VC9iULyfvmpmDEZ5h9ojbQ5oFaX+FS0q3RCA2UvZ
	kh22nMtM5iddnFUS+GFplQyUh602amnqvstq2np+cN8xcm9/Y3nRsIXu/68IlcmcLMtJ5GN2QM52k
	0A8mcMTgjni+8p8Ks1szr2YA4t5NIOqQEME3L18GHRuMI7/89820OgwJxSzjI8r7zX+J20xkRI/gI
	k9FlMSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVPg-00000005X8F-1jIh;
	Thu, 26 Feb 2026 07:03:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvVPd-00000005X7u-38Vs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:03:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4V7bn350081
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JLrxoSzHXhl2Gv/xx7gH4l/8foTy6gK4EWkBQXv8dA4=; b=TrZTwkZXN766VfzU
	hYO0BPsx6HaB+y4L7w1N10XXNN5xC8M5OOpnnrqH92Yx/hRuCyH57kfpar8/EEkO
	cWr5Ykehbq1TWs6G3mRRzo1MWfo4HGZrCJw4TpARl3Kxw/fsN/VaME5USFGpflaJ
	zjWknEgJlJaukFg4uyard+HSjUusbeR1D/tWyMX0N+gbt3hPyI+AGx8OpC1m9OWM
	gGrs0vqALkamusCakiWoWBqOufdD5zGmMuKZeXVht+6Ka8Q4BuunojTCIkg+/tEG
	JuQDNlsiBeBBrbZy6iQ+4Dya6yvi4qebfsnFyvlk0p6oEz9wei3XASTqpRYvMYBe
	+xp/FA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54pa641-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 07:03:52 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-679c6ef1538so12699489eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 23:03:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772089432; cv=none;
        d=google.com; s=arc-20240605;
        b=UImB/3uOMJLxH1z5IRCl5tCPbBfxFEgUQ8s1S6ydo6YUyuBSKFaNjOV+4M5e/AyKF/
         Vf1ak+7tojMz7i4BcQ/jk3x5QPbPkQAjJSVWZ+6irEUzV0NtaPZ8/E1HsItxGS0ep01I
         BZg2nu8+MeqgnRPPUBJpUzuI4iEb9NEsXeiqvr/5fSErDGV9Kkyc/gsSOu0h1PDkIHXX
         4nD5yETfOw2FRrdNZLwzzWcGYYffxRMjTcc4UaYelcvVS8HV1efdDx7nCp3CGLk+O4pn
         jDXdRZUL78NfFUUka5zv4Cbx3c2tEwseAmQSvbhdpamVU8JqktPdXAtyIHDqNDQ/4goS
         IZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JLrxoSzHXhl2Gv/xx7gH4l/8foTy6gK4EWkBQXv8dA4=;
        fh=4VHOrail+BzHyUkQ9pbxjYc8KNwQHpEI9mtv9DwxZws=;
        b=iTUG0vNrSxtILya5T8ITBlrCljFX7sF2SGEhu2UEHgmJfvZKC8gwGRq8FZoJYNnI1X
         gGcibYSSGeDqD4kjd3TRttZGMqZth+HJWdlSsO8GyqqFr+xijW20hBZLduEgEpsiI/bT
         cmqTKIbtw4yF1MQwUbOFv5fLEoGtW/IYm6M0+jMWBZ7DNWrE9SjKwuS74Rt7dQdKpGW6
         CwSykLdYb/rsXbr5PBzrCesOqRUvJvJwU8UQyX1Vw9oce5bL0w0RHKd+NjeL2OywfhIb
         5mqTrs/4O0QoudV3q29QkzZ/RT3/ZEsD/5/XbqwmsCKfHapUrL+ABYzeFfm35NrKG2rI
         CP5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772089432; x=1772694232; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLrxoSzHXhl2Gv/xx7gH4l/8foTy6gK4EWkBQXv8dA4=;
        b=X1yUS81iV6JbeVlXGJjxLCH4mcYeMsAEcOucJxTgiLMjnmo4osrxy549uQtyTZ2x7e
         /Qjsh4JpKAtU98fDIdyc1QPUsrqkEhq7QHOcgYHN0imkteO82WH400J/ndzC0kJ+PMUG
         zwDxb8qFWahh0CIQ9oIsFTN6xmLugURnqmqlXSvoRYzNRAcBWZizGbKXaeoXEqbznb/g
         npzl/ORJ4qZQgRAoHy5x8DqOWmvQIUpGiRDWqyZBfM8dEjnHjthticOISYp2rhB8lCiO
         0Rvfncfj9ReSpVsiU21gLpir1u/wPF8NkqDd1T9hZY3QECtvzGLsZboXCxIqQIzRRmdW
         G5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089432; x=1772694232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JLrxoSzHXhl2Gv/xx7gH4l/8foTy6gK4EWkBQXv8dA4=;
        b=w5cDx7MvQRle8o9E++WGcHNcK75rPy4E1m2CBe1YNr/Oz8sVpS7T8JnfDjRmSPIG94
         B+dFySXTPV1M/9xJt16QbCsxl6vpc+BkEMFOD1AUvb2rNfWrS7JbtOkPkI2lmQCdE35o
         P8tHsLGDZ2DZoKCZ0pL1jhYZDlXeFQIeTisiOy2BTAG9hfXkSJxKGDK/LMh+pZLdwzk3
         88lDrYBa2pcUOZNs3M5kx9mTVqGJccxVEjlcsCd3nB/DgWZ7u135sw21O/cI2g89C/V/
         u9pTHrDddUV4N7JNjPZc0mPshuipg6thYvxyBIU7aH43dt1oMoo/kIK717nHJ+f/lGX7
         RH3g==
X-Forwarded-Encrypted: i=1; AJvYcCXCVT8EM9Lc5NAoyoOl+6ZF7mOn3GOk2R3F7V82F4KMKaOWIH78WgQZDzSSxkY52SnKHETNo5Tl5aBLU6X7kb/t@lists.infradead.org
X-Gm-Message-State: AOJu0YxCMvcC7vGboOxVdMH9CODKpAu0n63rtnP1nC3tnLTd7xVXdwzT
	UgbzXQ6uPrpQJnOilDOOp95SlUV7eC2i0UIeDSFkl2FSrJ02P70bjXjBSGEEHNgu5aqcJs5lq2/
	1ErCf07PIKa4A1OMYxhcZHnu9yiOX+NbPQX/PNPzmE1Gx6tsNARaBgHbDDNDxS4aOKU82ACA6xU
	T26yoPaNIQJBFupUVfHZkDtpranB9weLktY2wQ1wpPKbSoJuEYyao5
X-Gm-Gg: ATEYQzy+CLH3jQR2xKZKi3WgIuVgFV8Ka0l+F8wxG9wumsEzyrAjs8ROoUJP2j989bq
	tNbGCtue/oJ0I8XWLCTyji/do2/tbjFUMxiZSCfkRFL0FYHJ4O3EAdzcJ0LMdCHrH8zJHDVc3O7
	G9aPGbp+wyIaj0yTcQu79//BsXNbmLG504AvuU3hvQoEnCUKlEzyxV2OBVwU8L8s9Oid0XLpAlf
	SQOyAk=
X-Received: by 2002:a05:6820:3092:b0:679:e7b2:9fc7 with SMTP id 006d021491bc7-679e7b2a0cdmr3151070eaf.7.1772089432077;
        Wed, 25 Feb 2026 23:03:52 -0800 (PST)
X-Received: by 2002:a05:6820:3092:b0:679:e7b2:9fc7 with SMTP id
 006d021491bc7-679e7b2a0cdmr3151054eaf.7.1772089431697; Wed, 25 Feb 2026
 23:03:51 -0800 (PST)
MIME-Version: 1.0
References: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-0-347fa2d7351b@arm.com>
 <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-10-347fa2d7351b@arm.com>
In-Reply-To: <20260220-topics-ahmtib01-ras_ffh_arm_internal_review-v2-10-347fa2d7351b@arm.com>
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 12:33:40 +0530
X-Gm-Features: AaiRm51FKm_5e4UXBRvPixo-zTWKoFuxZQdWEORZL7vufbjHjGKj8isrvlHHmUg
Message-ID: <CA+Ht8=ZSUGF9KQqy=yZ56kEDwsv3TvS6rLcMD85iwDxwOr3rpQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] dt-bindings: firmware: add arm,ras-ffh
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry.Lamerov@arm.com, catalin.marinas@arm.com, bp@alien8.de,
        robh@kernel.org, rafael@kernel.org, will@kernel.org, conor@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        krzk+dt@kernel.org, Michael.Zhao2@arm.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA2MiBTYWx0ZWRfX3Zro4mNJ4EMG
 OdIcK4TpuUSXHQ+uNOA7Mix6L4E5Z0LfwejDGxux4hf2qFJkSM44c2MfAAR/ZrdBAP6vxT2jH3T
 gGTcKa0netqvVbVdHwnR4FBhi7Frm3emhl6Fy0Vn1aQcSz5AKGePXdOf+/GGztwu9NUM7drSomb
 X1fXSMPEBoOui5hQWcBvme3Shs9lhf077Uens3g2RWI3WbKNdbcotwvlxrf2nnsQWcnXEsF/F2c
 CFasrobINgOtvlz1ISvYYQ1nDKaVqlbex11Y/WNHBJOa6ZFngL8f6ePm1Ayybri+bO0UC5RPseA
 aaagfcKV7UoeDcHlMsxM49a3T2I7l1ieqPqgXpPGHOXLXsSIwidL8KlLGFS9g0jmqbrskI5B2zZ
 7uZII5tdQ1i15mPH9jvvEXLVHtUIbMNWoDVpveZVdJzkwuta1DgWguq43TVh5xS7Kcj0/0Ns1oH
 /GhutDLprCUI/XAzDkg==
X-Proofpoint-GUID: MZ7XtTvFL90txR_Nolr2tZFV8kj9JKrx
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=699ff058 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=is6-GLeS1cJyDfTUaQYA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: MZ7XtTvFL90txR_Nolr2tZFV8kj9JKrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_230353_924634_B6DE613C 
X-CRM114-Status: GOOD (  23.98  )
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

On Fri, Feb 20, 2026 at 7:15=E2=80=AFPM Ahmed Tiba <ahmed.tiba@arm.com> wro=
te:
>
> Describe the DeviceTree node that exposes the Arm firmware-first handler
> CPER provider and hook the file into MAINTAINERS so the binding has an
> owner.
>
> Signed-off-by: Ahmed Tiba <ahmed.tiba@arm.com>
> ---
>  .../devicetree/bindings/firmware/arm,ras-ffh.yaml  | 71 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 76 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml =
b/Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml
> new file mode 100644
> index 000000000000..eccbaaf45885
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/firmware/arm,ras-ffh.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Arm Firmware-First Handler (FFH) CPER provider

Please don't called it FFH. FFH stands for Fixed Feature Hardware and
ACPI uses it at multiple places. It is causing confusion.
> +
> +maintainers:
> +  - Ahmed Tiba <ahmed.tiba@arm.com>
> +
> +description: |
> +  Arm Reliability, Availability and Serviceability (RAS) firmware can ex=
pose
> +  a firmware-first handler (FFH) that provides UEFI CPER Generic Error S=
tatus
> +  blocks directly via DeviceTree. The firmware owns the CPER buffer
> +  and notifies the OS through an interrupt.
> +
> +properties:
> +  compatible:
> +    const: arm,ras-ffh
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description:
> +          CPER Generic Error Status block exposed by firmware
> +      - description:
> +          Optional 32- or 64-bit doorbell register used on platforms
> +          where firmware needs an explicit "ack" handshake before overwr=
iting
> +          the CPER buffer. Firmware watches bit 0 and expects the OS to =
set it
> +          once the current status block has been consumed.
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      Interrupt used to signal that a new status record is ready.
> +
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Optional phandle to the reserved-memory entry that backs the statu=
s
> +      buffer so firmware and the OS use the same carved-out region.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    reserved-memory {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +      ras_cper_buffer: cper@fe800000 {
> +        reg =3D <0x0 0xfe800000 0x0 0x1000>;
> +        no-map;
> +      };
> +    };
> +
> +    error-handler@fe800000 {
> +      compatible =3D "arm,ras-ffh";
> +      reg =3D <0xfe800000 0x1000>,
> +            <0xfe810000 0x4>;
> +      memory-region =3D <&ras_cper_buffer>;
> +      interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8d8a5c41597..47db7877b485 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22027,6 +22027,11 @@ M:     Alexandre Bounine <alex.bou9@gmail.com>
>  S:     Maintained
>  F:     drivers/rapidio/
>
> +RAS ERROR STATUS
> +M:     Ahmed Tiba <ahmed.tiba@arm.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/firmware/arm,ras-ffh.yaml
> +
>  RAS INFRASTRUCTURE
>  M:     Tony Luck <tony.luck@intel.com>
>  M:     Borislav Petkov <bp@alien8.de>
>
> --
> 2.43.0
>
>

