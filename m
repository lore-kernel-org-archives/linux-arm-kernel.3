Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F00C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ubat+z5QjnYmtaLIKT2fPs8gd+++aNLEi8AJBYOnLcY=; b=PQPzxj0c0egg/BSN1Dc1X/gn7O
	7thwEwQT2G3Vh4VmjA3BdRHjl6HXluf4i30qkWpjce0fz4ZxPasCTL3qRzvHGHJ0LGp/LslJCoshd
	D2LoXE75iJIYeKIt1pwmuFWaw5agESPQQpcKINZbKRhVs+7dedLYL3rDl4RCxuW6PQMjdlSGnmRGY
	mOPrqJ2mLPmJKg7fN7RHqXZhczPXorDekZZhkc+l3VLMRSjyV5Yyd2Pp+j3PeFyJHzYLG6MiEdgQJ
	DlWNE11YwlsO0JUETi2LQRC5+mjRwMpnACUrY7FzeKOQjL/CQ5X7iqCyt66DcEaBCk7wm9Jcd/Z1c
	benybTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUr-00000008yCc-09WG;
	Mon, 13 Jul 2026 11:06:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUf-00000008y4n-2R4y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:06:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DAqbTL507318
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ubat+z5QjnYmtaLIKT2fPs8gd+++aNLEi8AJBYOnLcY=; b=EDAGdw3eJHavUZd4
	kZEDTL4iHaq956dBAgvXAkkiWWOfRTEYZ+FAshmpXc1eIm4/MG6nHfwS1irzRFCQ
	XAlX0DO6j1gg+fsdnfV2ZCraIX9IuXIppNMmnlNmVZfk03YA08Io1PJulFnwrxTS
	R0hNBpY6h2O/0ael8DW5XFNoYbxlIXdh+oOCjrMzw1sTjtQiXTERcoQj/K/AW05N
	zP/EFXz244kR8ZGYLOSMc6tmv/2KGfrus7tsCXOuHhC4YP1hGFV/6sM2yzDv9Wdu
	vCHIKnso674+9ma/jZt0QnqfS6kmM95v3AIogQ3v5Xg9UAN8RF0JNPUU9Z3o2Zpq
	4swpYw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8h5uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:06:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso39255236d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940796; cv=none;
        d=google.com; s=arc-20260327;
        b=VFJ6rjSEBxw6lK7ObXtp2LN+AlY0ki+39tns66Ok/MIuVaItNYeg+fwJEoagWxAjDJ
         YHNbYozjfwKUxGOmq72PtMDLM7kHFzBA9Oc7SMv9JY9A+lqahUxUHI+3DuGYItnpx81n
         tGDz8U76sCC+QUeOqPtDEdk/HEUN57YigchCZ1LBM8mOKiG0YQqaDnKssc1nJyvxza/c
         d2dLcf4cfy/8VzgVkKsFrJAufX0b/tRarOGGKG7k2v3Adjdvm1yTiPSbetK+W6f+FqNa
         6og9pOGMf3rL4L9bCtg3omXWozrQfQu8hOEdvKVViZpY2dVdkDqX71O1iKieOzZ0rz74
         JvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ubat+z5QjnYmtaLIKT2fPs8gd+++aNLEi8AJBYOnLcY=;
        fh=D1wv/YGa1XH1/n0JQx39NQzlyNOQSeB4pcv8YZAu/BU=;
        b=KbtVmx5bKQoMYVN89WVvlohYjdOyusVN8zbSWZSyFMkyj96ucHovZQygDUbZs3CL2U
         uavn2q1HWkULj0h9r5c1io+Vkxpli1p8yN0kPP1Ip6B8l6WzB9J8p2fMzxouqOCmAWFv
         BGBfnoZBGbxsNS3pqBVdjGQRs3SJ8328eMmVicWsareV7wRYB3aGuMpQTAL3FoF9ayXT
         8HFx9UAR6fScjcOs0xE3J8xMZw/s6m+DRgoLXTaS6qta89lqC/PxOR+83H7+nRCKsJjE
         iV8btHG6nbNWpIobk7149uORdyoT3R/tCavRYgn2G0T2LJmuZhxAb6EOPezAFH4qZmJG
         RD4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940796; x=1784545596; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ubat+z5QjnYmtaLIKT2fPs8gd+++aNLEi8AJBYOnLcY=;
        b=JcvKNjMEvsajlrHPjceGrP9oOrL7gbJFyKYHSfy29x8okp7qjnGrM7bqTQubgD2L4i
         rkh2QlVFCHKLv1LV9xE0E7NBDCS1UDytnbI8a6XnUIwMCo7JMia8jT5/O9OSsDy15ewo
         LyOsbY8blWGoAbTCu9lxXAw/fiAzfC1xsWxwhvzNvn3YvWBZOvPJSiua91lNNrn6d2Kx
         o9X3u7bG2TFigev87fsX881yXiS10pem6qTTSVtb2WbFCCQ4WMb7PWeUQlJBDTkApftx
         W2lF6QLoayJ14X9JFNYiaRFaiEuEOonC4WZc5z5lXEevVC7sL0VphIDTN76kqq0FuD1N
         hhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940796; x=1784545596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ubat+z5QjnYmtaLIKT2fPs8gd+++aNLEi8AJBYOnLcY=;
        b=Zls9hQZKxDC5Kt1EJ5pwOtUA1HJ3/nKfG189yiPGEKKtZqWUwRpEhXj/zjbcF5sDHj
         LNry5VuKKnL3hyCAGBk03IRM426xEl2aQ+iqcyqwfVAZ8BFqB3jMulQiA3WtUioYLRZe
         3L6wOsLR1a1Qluml3UyfkSFKdeIX62gShb2uWAueccXSX0SaXFWe6mvSwY8TPtBJ+QsR
         fODjlYpEbe25qdZ2UCkSfkx02G4tlZkq6Hui6gds1CGBtl8+57J9zy4M2hzHWTFCrG4b
         Y/bq7fFE8+USdU4L3iNyVKkyuPNS8REqObuMTIqt2Qp5Eo/smJzSxAQ5l9Kpkg65dToZ
         FMwA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3ONdiDj1IBRh0FG+OWNJoV8a6fAX+9p2tz0tqcpsvLFifi1YwKYI5tC8EOdodoSQQ5O2cgARWpUYZsIAzZhBs@lists.infradead.org
X-Gm-Message-State: AOJu0YxLnm/ARZZpvdtjAz1Rhz/Aewi4j7KTlG5pS8EZRtH337ES2Qv4
	cdsEnbgJ/W/ul7BXOBEKvm7vVi2rr4XEaeosbgigDvUBEJyxvzB6+mUeYJ4y8nIrO9gFHBeKxsY
	rBZ8CxdeLxYYq8Zs5TYym3AK7brqxr2lfwZy8/k6PJz5iMn7nAIf8z4RhRpEflxd4rfNHAWoBc9
	pOydTgev7/T5vRYfdm/8wbJ8ovjYiTxhOXrmgu5t2iQdKkujpj0JTU
X-Gm-Gg: AfdE7ckQTf30dmyAF1mc5Cq5Do1LHKiX79T3FSrdYTyUnhEPEe6m7gW+RaRyq+BX78a
	j9WgUvTwC7jt3t9JlOCJhtfDgYBvOdqasjWpmWkZOYKRpMBu5n4CFWZP+l3/sk0Hgq1cyIPOImi
	dtJ5EAbX4x5ri4gY2vMz/sXH8MQdShw5BNsxeKYNbuYcRPW0WlYx5Zd2G7Ct9plwOvoADl
X-Received: by 2002:a05:6214:4c86:b0:8fd:b96d:195b with SMTP id 6a1803df08f44-902360add0amr136214436d6.15.1783940796130;
        Mon, 13 Jul 2026 04:06:36 -0700 (PDT)
X-Received: by 2002:a05:6214:4c86:b0:8fd:b96d:195b with SMTP id
 6a1803df08f44-902360add0amr136214106d6.15.1783940795720; Mon, 13 Jul 2026
 04:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260530204636.1115120-1-mcanal@igalia.com>
In-Reply-To: <20260530204636.1115120-1-mcanal@igalia.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:06:24 +0200
X-Gm-Features: AUfX_mzoo_GCCpmgP88Yj3-TYi906i2_TN-ZPhKg0bAnY7K4DQfnPcCJyPkqp1c
Message-ID: <CAPx+jO_oP7HP7bkd5SVmxA3x+ND-mCRT__8ALpy6mhufP8MtGQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: bcm: bcm2835-power: Raise ASB poll timeout to 100us
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>, linux-pm@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: QoeyXuWIks5rPtpFyghrSWLOf2hA2fuC
X-Proofpoint-ORIG-GUID: QoeyXuWIks5rPtpFyghrSWLOf2hA2fuC
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54c6bd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=V2sgnzSHAAAA:8 a=xiSneWFeW3Tcw-NpSFEA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX4Yhkvu6odQDA
 dIWnc1lTrHYB3qjimD7kblm29ugavPMqxjW9lVKStzlKEDSNBND/cjkiZOT1WI9uqKadjUu8Ajw
 qTUaJYDofzFjqtvoLKvRKrG2h1Ly7+A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX4RE+Mz1mmI4V
 H3X5aXIBeQJJvXAZ0AoGX1uNAEtgOYAc+QfXX36f5kNH4PDjYyae3O6+LLQTGMxOk2XjV34lyfl
 Fw5EAdpVAJ7bCrOv+irVT1BJzkvW68AAOAfbP54n7XoXkCHXMmhXMm8wPcc+HfAC/LajSdKVJYF
 i7JFqeQwOA430C1hU2YrrxsugYTwQDID3CwhSqqlGKt7AwYybP9FgqpdN8oIc4itGdX03VZJTzW
 QDGQY2MrDNFEUHIhI/fgSd/7kKh6Z1DX7lTB4D2iHI0O3koS66WHVe7UAsJ+F4fvX4B+bbe9Oeg
 XMnkO06qahHDMk+ui2GcHxYpl6EyP2zwJ0BaOqqhIZLuw+DtI3aKxjVrinWzu4Wv71xKW3x5nag
 TCYqWc69SaLnDPCyrZy28Ay+1Quge8ZTCrHMJ1Ku/GpxQB6Uk+orCMFW9ODY4yExfuPg6fkORZj
 bod+J5j3j0U3Tu0yRjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040637_674625_2B930559 
X-CRM114-Status: GOOD (  20.85  )
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

On Sat, May 30, 2026 at 10:46=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.co=
m> wrote:
>
> Commit 18605b1b936b ("pmdomain: bcm: bcm2835-power: Increase ASB control
> timeout") raised the ASB handshake polling budget from 1us to 5us.
> Surveying the pmdomain subsystem, 5us is still one of the smallest pollin=
g
> budgets by a wide margin. Comparable handshakes in other drivers use:
>
>   - 100us : starfive jh71xx-pmu, apple pmgr-pwrstate
>   - 1ms   : renesas rcar-sysc, rmobile-sysc (power-on)
>   - 10ms  : renesas rcar-gen4-sysc, sunxi sun55i-pck600
>   - 1s    : mediatek mtk-pm-domains, mtk-scpsys
>
> Raise the BCM2835 timeout to 100us, matching analogous drivers. 100us is
> still negligible relative to a power-domain transition and gives the V3D
> master ASB substantially more headroom to drain under heavy workloads,
> assuring us that the timeout is enough for any scenario.
>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/bcm/bcm2835-power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/=
bcm2835-power.c
> index b76d74e3849b..d507bb675e29 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -175,7 +175,7 @@ static int bcm2835_asb_control(struct bcm2835_power *=
power, u32 reg, bool enable
>         writel(PM_PASSWORD | val, base + reg);
>
>         if (readl_poll_timeout_atomic(base + reg, val,
> -                                     !!(val & ASB_ACK) !=3D enable, 0, 5=
))
> +                                     !!(val & ASB_ACK) !=3D enable, 0, 1=
00))
>                 return -ETIMEDOUT;
>
>         return 0;
> --
> 2.54.0
>

