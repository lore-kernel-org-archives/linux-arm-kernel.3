Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60F1C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=; b=Kb1gJb663fM2gX80bHfCdN0a5W
	iti8Wh1o7wPM01SJHHe71G0qaEDsU8QTiPlwaG7QOEZvRpGK1RUAAyw98ZvxcfAEsyZn8GtvOd6EL
	9qe3pu1Bq2jxw4ItPlI4ldrp0YaskbBE4mK5it8aOIvCtiLlrv7GZk0+cylI9SF9djyN4EEw70SLc
	cb5F4Ww4HOJtrv+ch0kSnnJEAMr7ei84q2YR3qgUxHE0YOXQl8223Uas8Bec//3apuKOmcA1VKAnv
	uaErTiuV8OC3+9KZPGiX7FddvxKeE3brPFKFDTIcRYIVqvCDhtbdmDUpViE/mabqSPQi4x8Xk4Bgb
	TMqNDqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lsp-00000008Dbq-14kB;
	Wed, 23 Sep 2026 12:15:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lsd-00000008DXA-2snu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:15:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVEo2466594
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=; b=maPiW759OLPqwFnm
	rgKFC2fZdUAWP+Ph+dcaVvKLIbdMUF6nH6PNJ12PrxUR5gGzTjBKq961SGsumfcV
	3vc8ep4kZG/Nd/5KfofJhZ4iXDaySDasw++0GxYZdW8FQAvyBuFw2wCo+i66h+tV
	dS58l1OfoZf0JaHQC/sorWCffZIRVrdYLZmLhqyT9V/Ql1XzLnyXYWrlIE0Eh+Wb
	8aB07/9Yk6UPT5TXlpbg5If3AgP6Wr2w77KzF89c06/fXDrgMAyhxBLR+vH/WwhE
	rYQPcLW7m3SibC6vAuYm8nMIjQxetSio/sr4MDE4VH9WR3lvUzudeaAJuYDaSAts
	UwcLyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c3x3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 12:15:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso10021135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790165718; cv=none;
        d=google.com; s=arc-20260327;
        b=KQMzBB0BqGOdFr9nKbI1icK0ybNIuxOYEjojbuJo6EYjx8H48yaKeAgUi0dgT50KzA
         9m0SuRir8Q4JCRDLiJaEnaLkbdaZQwpBR0OolUNcL3LD5C+xIwDT6VGNhPqVv7i3uxY2
         2iFBIHrb/IABfLVe2gsV6/qeKSMDIyviR3k5Oa0ZfZE3VpBXrw5OnLMdAp1tTGvax5AD
         CEjIlyldVb+gV8iYw6OtzW5PbW1VzWEbXDyb4VfDq1M9DxuD2Vw3s/GnrlTeYwzmj8Yf
         X9LOG3Vj2x4iqr9ims65tx6DK60WLYKPq9A+G8qSxGmO07pz2ewzTiG4uPROUwe9ZNIW
         5zYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=;
        fh=YMF3rs81WvnBFi887MzZM8ARDvThQkpu+StyE8J5ozI=;
        b=QE8YMbnUiJWqUAFkKLUnj6YrVtc+SY4EjMmqqoMe8VBlIyGKnfpByHKl6wvIg28vB1
         9ER+N2plg+yargLy/kLcTZXUdkf90AfSmYjO9JucRNzSj3bsYnuIAYFfP6MqhecouWLw
         wDEuurUkLOdowfejKOT13KBK7MXhXcOLygqNL9LGoyaLGi5fZXeMPjjMNHXWdpKS14bT
         9oaaFPRAbFZxyAcVRyRvy59F/DFdNKbLI0qBDMMYaexKtFRkiQed5wJRBCQfV8GY3irJ
         M2eC6ULMgunLFdEUcP3/ydAXcWahHeMzqChHVQSPLIQk9gKHev6+UZgG0HgAWl3oKhf8
         c5iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790165718; x=1790770518; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=;
        b=diZR+2z4FulOL5TNDuFElGFYrhA6hjVUmp0E+KFK4QVqRjodJfXZ23VGez5J0skJq3
         8ZztSqAvw1K4wqAAYBMzBrGr6wEC9wy8ZuLFqGid3LsIMkzXUvD6wryoIc6XDla20mhe
         UK5M1MztkjkLvl9hB5JDkHdVCMvXtpHpp4ajUWB4gS0QsxyF/YwC4zqFTKYMOT7E5PUr
         j6mIq4lcG4Aa95jRTYwfJKamaFEPIuyukXmnQ04wCAEDVnF+3eSl7rPkT7qLaJAdXuj/
         4+J+wHyQCQDCsL90Wy3c5bAVz7aBCMa8i8P2hzlz7m64LLzg96frnAsapfbnfYUL6EhQ
         S3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165718; x=1790770518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lUmDDWZK3rMPUgUEQOwwdE/8Cn8EPco7KHNc8Hry+5A=;
        b=JAchwAF19wcKx7iXFdGusStyRTiiEN8pAvjs3Rqf4+OWlMztU0ziZef41vtxrLTBLA
         TfQ5K1LrTA3eY2WUm2sCfnQ2Fm2+TDKM2wLv68AEd7JpyGgegDFSxWh6UTBmRBIWyVVz
         Fd7vT1pX4csFCf/z7glGVOjUkT9ClFq59RjGDmHBtnlmvJbhnTqoZUBvXbK1qWGW440O
         oUtiYbPEIDcscXQcwIfuLFbs/loliuZ7I8H24/Z1/4E2H9yDiE6Y8OJ5r5hqCjCZ9vVp
         zSCDQlHGn2HqEamXS7cNAAERCdquMGbI1F4RTBOiwzBN3HH120UFXWus7+XA566xv9ut
         9lmA==
X-Forwarded-Encrypted: i=1; AKwUvBwtugkVihS5dAqbbGP7lm+/PBqm8TSf3OZbWXYx8xeYKcqUQvRjXLTrMeRYvJ4wFAGltAjLbxlI2Zpc1X5PjqrX@lists.infradead.org
X-Gm-Message-State: AFuF++lc+fW8aedxSsWHHrnDLtJPidFlRo/VktvsnHI0fAnNVvgZwxts
	H2ihqMr6tkxfIB6HPEzK56iPD80/SOoA6fBp8CBUxtiDD22cXGg348FnJIe71JBXYnciOxYWfzU
	j2P6388+1hyuSEzZ1ailv6n2VUrheP4sr/CwECbmX9Qa5WJNurosoO5AbnQ0G6goXrQ3/O0P53h
	QrC7qV48p1Yuxe8fYRrz0iEqdFcswUrWFwHBsQvHWq5VfTlaAeDpBZ
X-Gm-Gg: AYBFou0xpGMUJfvCHmEHyGWOYOtrIPwngGSQxLowobK/RfgoMFI9YHdTgow1Ee8lh/M
	LjtdKS9xm9cuxXLpLW9UDhw5qaCYB2qYV1mHZUZM/D/gCbkUPV1aJYcAoMvWqAIMqXzAfiSAioi
	PnNK8Tt9neVS5nnnhAFDRSGfF0bg7wHXGR45TcUe3VAJkSZqJUBhJGqjpfK7qd6CC9H6Ra
X-Received: by 2002:a17:902:d592:b0:2dd:c0ff:e728 with SMTP id d9443c01a7336-2df69de4665mr19055535ad.58.1790165717499;
        Wed, 23 Sep 2026 05:15:17 -0700 (PDT)
X-Received: by 2002:a17:902:d592:b0:2dd:c0ff:e728 with SMTP id
 d9443c01a7336-2df69de4665mr19055275ad.58.1790165716824; Wed, 23 Sep 2026
 05:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-imx8mp-blk-ctrl-v3-1-c86b0a9d4781@oss.nxp.com>
In-Reply-To: <20260921-imx8mp-blk-ctrl-v3-1-c86b0a9d4781@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:15:04 +0200
X-Gm-Features: AcwNN1UBYWIvEZGdzMW9jD4AZ2JktIkSu9xe9i_PSGoqpxzPUfaA-MSKhDFG4Xg
Message-ID: <CAPx+jO_kZp5tRknB6xB5v3Prv=xLU0x=H8VBy9uTdarGHmxgoQ@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx8m-blk-ctrl: Serialize power on/off
 across sibling domains
To: Ming Qian <ming.qian@oss.nxp.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Zhou Peng <eagle.zhou@nxp.com>, Xiahong Bao <xiahong.bao@nxp.com>,
        Ming Zhou <ming.zhou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: PCwjhRTxdTOoArdMRsk1exnCbM3I9S1G
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfXw7UnRD4QqjA/
 Liuw8gBA/8m4EGcc7VpLN9kGtiEQGat2ep+C7KxZZdFqQv0gfg6FHmJgA5sNlzCtfG0d+xVzmH6
 CxIJiRQP8U7uW0k0Mh7mD+oOwYK96cw=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3c2d6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=L-I4Vr5n3LcoRG0ZONIA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: PCwjhRTxdTOoArdMRsk1exnCbM3I9S1G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OCBTYWx0ZWRfX/ZpTFoy4kATB
 ir+5D3Fpf7CYMytblVg0eZ8qpG2dfkfiVA2Np3rKCPB4UBM1y7OJhHc3drLRGZZ5ahtLzyLt7ou
 ptIz51rOJjFdfUVnptnKWn3GjutR8Ez2Y88+mYKoddH1UbQnL+0swd+7tB3+qrhAh4Ga5UQaB7Z
 UkEcn7XVDfHyj9S2r662xqtgYTH7DvtBoKlK5MJH3qc3VtfDk8rbuSBv/HdVa6Lg309k9h7oiO+
 Z/786Kmq/NtJCUZGY1JunGfJ+C/eyDQwGkOkBsPkqPXmRoe36pBkK+0dLA4zFuLNPhODIvb3SCg
 1jw4+vCIpWmKB5AENPWbsBb9RDwr2EFM4g1hqiaaNasi4h1X6Ka7qodO4h/pfscMNCmHwO6ev7l
 s/bUKdIY8IAreg5m7g8b3M+J+6SPDbcImr3XROhiRKjeIcZOVFhy9C8pctGYuy6B+eMHXBCR7RT
 4pGmldHPnCn9QgUQf1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_051519_844982_9B6AC94C 
X-CRM114-Status: GOOD (  40.31  )
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

On Mon, Sep 21, 2026 at 12:03=E2=80=AFPM Ming Qian <ming.qian@oss.nxp.com> =
wrote:
>
> On i.MX8MP the VPU blk-ctrl exposes G1, G2 and VC8000E as three separate
> genpds, each serialized only by its own genpd lock, so their power_on and
> power_off callbacks can run concurrently on SMP.
>
> The sequences are not independent: they share the VPUMIX bus domain, the
> VPU_NOC and the ADB400 handshake. On power up the GPC cannot ack-verify
> the ADB400 handshake - the ack only completes once blk-ctrl sets the bus
> clk-en bit - so it just waits a fixed delay instead of polling hskack. A
> sibling transition landing inside another domain's reset window disturbs
> that shared clock and handshake timing, the victim's reset does not take
> effect, and its block registers read back all zeros: the decoder times
> out or the encoder fails its format check.
>
> Serialize the blk-ctrl reset sequence with a per-blk-ctrl mutex; the
> driver deliberately avoids a genpd hierarchy, so the genpd core gives no
> cross-sibling serialization.

I recall I had a closer look at the code and the DTSes, trying to
understand why we need to avoid using a hierarchical power-domain
layout, while in fact there is one.

>
> Fixes: a1a5f15f7f6c ("soc: imx: imx8m-blk-ctrl: add i.MX8MP VPU blk ctrl"=
)
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

As the fix is simple this time, I have applied it for fixes and added
a stable tag, thanks!

Long term wise, I am wondering if we should try to move to a proper
genpd parent/child domain configuration instead.

Kind regards
Uffe


> ---
> Problem:
> On i.MX8MP, running the VC8000E encoder and the G1/G2 decoders
> concurrently rarely and non-deterministically leaves a VPU stuck in
> reset: its block registers read back all zeros. A decoder then times out
> or the encoder fails its format check.
>
> Root cause:
> The VPU blk-ctrl exposes G1, G2 and VC8000E as three separate genpds,
> serialized only by the per-genpd lock, so on SMP their power_on/power_off
> callbacks can run concurrently. The sequences share the VPUMIX bus
> domain, the VPU_NOC and the ADB400 handshake. On power up the GPC does
> not ack-verify the ADB400 handshake - the ack only completes once
> blk-ctrl sets the bus clk-en bit - so it just waits a fixed delay. A
> sibling transition landing inside another domain's reset window disturbs
> that shared clock and handshake timing, the victim's reset fails to take
> effect, and its block is left in reset with registers reading zero.
>
> Fix:
> Serialize the blk-ctrl reset sequence with a per-blk-ctrl mutex, so a
> sibling domain cannot run its sequence while another is inside its reset
> window. The driver deliberately avoids a genpd hierarchy, so the genpd
> core provides no cross-sibling serialization.
>
> Test:
> i.MX8MP, Android 6.18 kernel, concurrent H.264 decode and encode. Without
> this patch the failure reproduces within one to two hours. With it the
> same test ran overnight, over 14 hours, without a single occurrence.
> ---
> Changes in v3:
> - Go back to guard(mutex) in power_on()/power_off(): the goto chain only
>   jumps forward to do tear-down work, so it does not break scope-based
>   cleanup (Frank Li).
> - Link to v2: https://patch.msgid.link/20260917-imx8mp-blk-ctrl-v2-1-81d2=
9e907a5d@oss.nxp.com
>
> Changes in v2:
> - Replace guard(mutex) with explicit mutex_lock()/mutex_unlock():
>   power_on() already unwinds errors with goto, and cleanup.h asks not to
>   mix goto and scope-based cleanup in one function (sashiko-bot).
> - Shorten the commit message to the essentials and move the detailed
>   hardware analysis into this cover letter (Frank Li).
> - Link to v1: https://patch.msgid.link/20260915-imx8mp-blk-ctrl-v1-1-b3b4=
e6e7e676@oss.nxp.com
>
> To: Ulf Hansson <ulfh@kernel.org>
> To: Frank Li <Frank.Li@nxp.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Peng Fan <peng.fan@nxp.com>
> Cc: linux-pm@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 479789009c7f..f8105e87ea3c 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -15,6 +15,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/clk.h>
> +#include <linux/mutex.h>
>
>  #include <dt-bindings/power/imx8mm-power.h>
>  #include <dt-bindings/power/imx8mn-power.h>
> @@ -34,6 +35,12 @@ struct imx8m_blk_ctrl {
>         struct regmap *regmap;
>         struct imx8m_blk_ctrl_domain *domains;
>         struct genpd_onecell_data onecell_data;
> +       /*
> +        * Serializes the blk-ctrl reset/clock sequence across sibling do=
mains;
> +        * their transitions interact through the shared VPUMIX bus domai=
n,
> +        * VPU_NOC and the not-ack-verified ADB400 handshake (ERR050531).
> +        */
> +       struct mutex power_lock;
>  };
>
>  struct imx8m_blk_ctrl_domain_data {
> @@ -98,6 +105,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_d=
omain *genpd)
>         struct imx8m_blk_ctrl *bc =3D domain->bc;
>         int ret;
>
> +       guard(mutex)(&bc->power_lock);
> +
>         /* make sure bus domain is awake */
>         ret =3D pm_runtime_get_sync(bc->bus_power_dev);
>         if (ret < 0) {
> @@ -164,6 +173,8 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm=
_domain *genpd)
>         const struct imx8m_blk_ctrl_domain_data *data =3D domain->data;
>         struct imx8m_blk_ctrl *bc =3D domain->bc;
>
> +       guard(mutex)(&bc->power_lock);
> +
>         /* put devices into reset and disable clocks */
>         if (data->mipi_phy_rst_mask)
>                 regmap_clear_bits(bc->regmap, BLK_MIPI_RESET_DIV, data->m=
ipi_phy_rst_mask);
> @@ -202,6 +213,10 @@ static int imx8m_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>
>         bc->dev =3D dev;
>
> +       ret =3D devm_mutex_init(dev, &bc->power_lock);
> +       if (ret)
> +               return ret;
> +
>         bc_data =3D of_device_get_match_data(dev);
>
>         base =3D devm_platform_ioremap_resource(pdev, 0);
>
> ---
> base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
> change-id: 20260911-imx8mp-blk-ctrl-c46f26783073
>

