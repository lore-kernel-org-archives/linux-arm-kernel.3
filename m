Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E735103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkpG/HvumoM7VSFgVTUWwXsnalVqOMe13PJD+6yY5a0=; b=mx6h06/rmfDyVH89ov/hXPt+xB
	puHooNt+p6RINAoXUPoScBCxjIRzJ4O6cQxpeZ3tYo76aAshMfQ2Z/bZjwZNDfaelfSMEdXIFxBBz
	fRV7UvH/JyMAFrwe4CNbgfV2d7YqtbvKprreVeXHkKoEK8mH+ryRUVA5rYlzsrzuDGwEvgV1T1qBY
	UTHbxboPLftZPrcGcdbKeaqJey3JIJsVc+aLlofUrjpGnDcoIY/AU+/sBY9ujSYAX9f+zQKmzlbtT
	zVhfCdozD4y45kUb3IdZt4iVJ5omAzV3vTRcSz4pWmMugZHxozu1QgMW9/yjqVLc9wYTAc2xTK9hk
	kF3rMLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t0L-00000008jou-0s0E;
	Wed, 18 Mar 2026 15:40:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t09-00000008jhC-17u8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:40:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFX7vT4088320
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkpG/HvumoM7VSFgVTUWwXsnalVqOMe13PJD+6yY5a0=; b=gHZwafK2fqZe6A1A
	RenqkFxqrnvaEhxyKxg8553lSwzrvh4ndksR1PpSdRB9VMQVi6gHgo2i2QsbDJVQ
	dIeIku9M+snfI8KcbK4CggJ4nkO5ti7dZly5zp+29zd35Nuf7G2qsrFDPhVf2YZH
	4dg6nILB2kXxAHAeKOjkfgd5wdj26o3t4GGE6MO5nzx8TuD6DNRUwZYqzyG2u47Z
	RNTabnOowhP5r7FzITN6rF3gW0ZdIbVqwNg/eRP9le5x4/LPNRp7uYmRb5vVf29R
	RpXT+FgadWUF2MvS73fjNwASSI8s4GGYBfw7sSO2Zt2ab9Pvk6Dgg+TKJ3EOlKL6
	gNJIPg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cypwr25hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 15:40:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090e08dcfcso144561801cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773848404; x=1774453204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkpG/HvumoM7VSFgVTUWwXsnalVqOMe13PJD+6yY5a0=;
        b=VB5kYawoxsE7BKUAy8lu8Tq/eId9S5MZlVTI9vLO7vWeGPdpq3IkokqW0/dKZbEgQK
         XQ/P1wz430dZvAVp9COXtVkURyridPsmXQBlOopxpaXC+kjsb5O5uNJ8ub/CuqqXMqBn
         POBiacaStX6qat0/2j+VkBQ5LKE0+srw0BPNiHGlG7X86gSMqk7N6b4ApPuLgvnFVwBT
         8fAmi+PO8JcGlpfBYzI5Eh76lUqFpZOAR6i5MawPhQTcSlKUb9ORHcwY/KrRiPqW3lTT
         0jVqnjF9UD7P7yrmRLrEov5e+dIze97By4X1OcagqerRqtHPXUQHe9Z1UadNCGPm4pew
         apew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848404; x=1774453204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UkpG/HvumoM7VSFgVTUWwXsnalVqOMe13PJD+6yY5a0=;
        b=VHO4+7OUdteosonMqHROYvIII0iuAKvRJUUCXQSECftn85AHmR57XULUr2FphZqqLz
         OVV4JPgEtq8obOPRAFI1XF1icRYNUx7hu2GnLZVQ2VDBheeJhCkUxbMgQMk5ivKsVDHa
         Jfh42FZ7OfhsnHHkYB8W/KiRSpYxMxWPL27rjvL4/yG1VOWAc0A/+3WHNOPTcn7feQ2m
         iD6H0UG5GElN08zpjoybnVbdKLZmBM0TaRbaPODXveGx2DwcBhLeUL6LPH7R3elIMSa/
         zJPyuA+CIlooUrOleoG0ReaMVHgL+/Zw2jJs451v4+x+UjZdT2EsSym9ZRADlTUBxemF
         Am3g==
X-Forwarded-Encrypted: i=1; AJvYcCUUngp9jITQM9R4oysJP3bWkyXTOJdpOtV7BuaOAs72ETRoa8m/AhN89S0O5+T81pIFkklClfc1RaM4/XVj7GJA@lists.infradead.org
X-Gm-Message-State: AOJu0YxEZiPTA1qYIMqOJ3S8Sm6NecU924pUeR/spSNZwre4SMCoC5fW
	x44ElLI+J9cKdTY22CFdT/azXa4HmmULF6nISg8lAWF0hOL1JtZwtOkKjKIiwTF76wSMv8MGACn
	eCt4fA04umDtOSWIZPdwPurdynycayeV+iGyiIkAxFz+iF6x1enVm0HRD45+VqEmyVgeEimsbCP
	1Lcw==
X-Gm-Gg: ATEYQzym+OuD+tgtU+jnuQ1lh9C1e37NVTCQQJPtu+pLx+uhU681laKvdGcnLAVWqzX
	0xMYf0BL7ROsYuLuYzx95iO6xX6FT0VwOU+5y7bL0ZsHCqZND5FznNm0Ft3pjVb0m0mpQoWfQQ2
	R3TKkuEn8DJUOR5l/SCXSUGMpPM622/HPefw5obooACoASbu+cSjCHKaActf3u3O1C0v7vKreH8
	gmLuP2bqr+dvPUStLW2egn2L2D0wuAYv8QwFMpRA7Wlu4QuwO/wfDs1Eg3wQTpcV4+jGVIBwx71
	Jk+pjBO64cAHFc6ejTtcSRTMYBSJWFNElQLJPqxtds13NU1jzZLRG519kiK4dhumtiPJIdMDREq
	KgTKBU/DXWkt5Tbxqu7f/0eKWaVk=
X-Received: by 2002:ac8:5f4a:0:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b148c2951mr48098391cf.48.1773848403678;
        Wed, 18 Mar 2026 08:40:03 -0700 (PDT)
X-Received: by 2002:ac8:5f4a:0:b0:503:2c16:c1f5 with SMTP id d75a77b69052e-50b148c2951mr48097811cf.48.1773848403049;
        Wed, 18 Mar 2026 08:40:03 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9227560f8f.21.2026.03.18.08.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:40:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, stefan.eichenberger@toradex.com,
        Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH RESEND] clk: imx: imx8-acm: fix flags for acm clocks
Date: Wed, 18 Mar 2026 17:39:35 +0200
Message-ID: <177384710706.3709943.8065144215162763896.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260212085750.3253187-1-shengjiu.wang@nxp.com>
References: <20260212085750.3253187-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bIcb4f+Z c=1 sm=1 tr=0 ts=69bac754 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mEXvEbR-UhZ5DZ4btVcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: tS4-fALwXo6iyrfSV9GPSSSetgi0vEko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMiBTYWx0ZWRfX54VTf5Phf2Fy
 gKNKxk7sUxAge6ayAGEnaAe9Nhwc4SbGsQaCudgZxYt13PQR25T5FROv5PmVxhBpHDrccUbfCeu
 xi0V8DsDfBN/chNVzUt8ulgG4KEl8iuGGrXZck05d7dMqrC2h3DLTjbHFxWTSQkYB951wV1sNZo
 Y2U7RENJhe+BnaECpLt7XQngg/tgmbuZR/phLvuC78sJwiAQZ1FpSjgLOlthxeVs1KsgSHoamgx
 afhgv1z4Ri3CcjX+PIwm1zfph+o5JzJtVvuz+fHhJwA9qSAtKuVLLLjV8BEdPzYyxH+xnZVZWDI
 Gs6kiE+AX/a82vZr1cpFF6sFBezZ6St1Ebs1kO47eTwEuEVAPobmJeKVJJnRQZODECQV1fzuI5+
 vmrYx5FWeGlYv+y2Kuf9/vnki144AQF3CIqTInoV1umyYr08/ugEXZfmfbomb2A6tI8Uk7jgUVR
 wejQQYDj5tvTMQrB8Nw==
X-Proofpoint-GUID: tS4-fALwXo6iyrfSV9GPSSSetgi0vEko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_084005_325796_06C19E35 
X-CRM114-Status: GOOD (  12.55  )
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


On Thu, 12 Feb 2026 16:57:50 +0800, Shengjiu Wang wrote:
> Currently, the flags for the ACM clocks are set to 0. This configuration
> causes the fsl-sai audio driver to fail when attempting to set the
> sysclk, returning an EINVAL error. The following error messages
> highlight the issue:
> fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8-acm: fix flags for acm clocks
      commit: 01898eb94e4e7b70b6e89f874494cc18f4954e1b

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

