Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2327CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wg/7kWgNR7muYHxsUG9a2q2VRHHh9+CGyvHpauJHDg=; b=jsnFcGpRjaHcFetkXWNox2/oEp
	2j+Ovcm6GrYkhfnw/xl/wPVlvgpGx3sXFdOUst70MgTjQP+vFdEF2xE4JzGSaUwp8lFXZrTrPkncB
	yP+m/b1ydSIgXVl9TuyYGcfrMV4AzDdhQ0x1zxNQoSh9Foqdt9czyK9+nKuolbkn2Rs1b84FCYxMV
	mG6FiKdgUdIQIzVHek/HcyLJ4L6TPb3MXNcmyVtMKloVRys5jM1P/1QJo+QMXYBu/hEtMtJabsSE+
	gmsMUFoFaKPli6mR1z7NkImcZdjFXWxX4ZYtf9h79najejUmwjlwBg90QR/n3AFp2CCP0M9cF2ib1
	a4YJX2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUidK-0000000Emx8-2pvx;
	Wed, 03 Jun 2026 10:15:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUidH-0000000Emvq-2bXG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:15:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RHFo1200009
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 10:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wg/7kWgNR7muYHxsUG9a2q2VRHHh9+CGyvHpauJHDg=; b=MpFPzKKzt+MaSdEO
	wRr6hsr77rQQQjcUU4dDxlAAo0B7obT5CxiZ4wO0Xl5V9tlU/5J65c/PJXaicNCI
	nYYDlCmrQ5KTqnZALPv4QvOhpT0qECxQ5JiOTQkfexerrqFeO9EKpUqQTzbxCM99
	r1axIFFcYeIBYLXJxpcNfkn0pvt5rGQzfR2d68Cw/vdNLZ+GGOu2r0lu2TewtY89
	7jegl/ERFNHAF2636p+zAWafNnBoKKKxegxfNH94CXskEylj6eNcOyKLO28WgCq/
	+rQkSJ/8NAF5fP5RdyMDLIDuLbauIkdIRnrF6Fh6fk+yNLWRn4nJjmjltHHrsDfk
	B8vHbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw1gqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 10:15:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157d38ab37so218799285a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 03:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481730; cv=none;
        d=google.com; s=arc-20240605;
        b=UFTZAli2VavHXKjIhj2PMRaY3SVZL1SOk+u4MC7l3D4jcCIY++0erWIObSqbrv3Tks
         LE7m0nVGR5foiVL/dOfbzXNcdnRBz+eL8DN4CgGOLSeX02skb09f2ozJWdVJVCeZGZBu
         og4Qy4WIPdTUzvYRaekhuNFildcd9AtdtgBQRef15UoXW6bfIjrm1FRg93IUsCr8kh1w
         v8NAWgumV5mZ/U1cH0LARsLKr0EM9Hy9xddMqKYUsIaPACdFeIi5hTtDQPvbNjDSOHAD
         tgR6IaGogTsFd9vft6AmbvLeh2twRQNV7+A/SQyqFWeItwu1bjjumWsXZLaE8s6n9Dk+
         5aww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wg/7kWgNR7muYHxsUG9a2q2VRHHh9+CGyvHpauJHDg=;
        fh=GKvsMpbkVzMsDdGDtGn4HwwTE8vDQUwVI1Z2OciPS/Y=;
        b=ElUswG28CaD7cjlFIXSg1Gk9/eeROImC2CdPbZU9euCQpQTn/fTSEbyjfqAnLjIg3s
         T0KEwo5DXLq2Ke0CVncJIQtkEMicCpKDaUlCdol/prJsuK0ewG4hw2rFtcsPsKi5z/2G
         lJujHwQL3xQ6BQGFn9YmFspQ8l8QFWFxR88Xw1l/N77Hlw/DJowBItyHk8WNZU498Ffc
         dPqcpz2l6wzSvaUuWwfB4FWvSs7RsASphi/KeOk+9/zuJI4h2TmKvT9bGg/RMR9X/CaI
         /uJFsruWH3mkKgorrTtTuW42Z6SgEg0hTBtMbpD4GEsUanNX3NuzAG2PzaoW9JgIkBj/
         Jghw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481730; x=1781086530; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wg/7kWgNR7muYHxsUG9a2q2VRHHh9+CGyvHpauJHDg=;
        b=Ob9BDoXVBj5yZmjaMgI44xhunBW7PXaz1PTjYYkXDQiqneGSeyoTXZopPLoaVKisVu
         vVUtrFa4bMOHzbQeRBVSV4/43iqrR+iwIDv5LZXXVBqkU2cvew66Gv4AEwTR+lMvNXCX
         biDRjZPL2GX9vymNuVlXQ2noumoUHRsUK6AK3J9FItt14Z4SwW5n9gguZvxB54AG13qM
         txBbuOOQcjlxeh0QCOgClW5wZTT5H88q8X7m0GGOGAtEWVSu1oRDt1AaFNq0p16GGMUt
         KimM7JQ4mQfuAZ9MN30bxn71hUs9CMN+A9bnkX6dZpp4Nuo+UK6EvysZqavOn0p8bxT3
         dEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481730; x=1781086530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wg/7kWgNR7muYHxsUG9a2q2VRHHh9+CGyvHpauJHDg=;
        b=MdN+fPlEIRSqX4GYjlBSJcfpH+GIDlR/v6Mwa+ExuhmL8bddx9AVW476e1FngNynaC
         Iyyo0e6Y8LVpf3FYxOCNVwds7w+qYv3ThvTvxuuN2LMHUopnu070eR+Fjy4peYAeK7Ec
         8LlUIY/IocnEHPX3de8RujbbLdwEr4pjSS1uptFYveZ/Mf6s5qI85f4iJAzOPWX7LHm+
         Rw6o00a9BRzsFlxRtf8ff8l9k7hOqRG3XXZQyyTmX0AbiCCXyLwyMwuOX3Fr0Fg078S8
         LX6v4ZGiCH5p/NAKHcIHiiwxlCCOtmIfSJhwD4BT3g7CbWOq5IyAB0PsVmJOq6VZ39yW
         aU5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/z7UalgtSS+yqqaBprXIncQvzvSEYttS4CjM59T4vyp3HsmyWZxrXOP/2VdZyezU5cC/GybfIb/x3CAXxyJIij@lists.infradead.org
X-Gm-Message-State: AOJu0YwieBsW8aKBQQ0TKeHHrCxDNAGtKoFfmXEyZv5+614Z12pUTdPi
	uWkxFy7nM7RpNMGE27ahESiFUu6GHtZ2Lavh2xS156M+Xf3io0lTyxsd5DXvqjIZCZGKYZkUh9L
	AdswjI2g2bfzyC8JbbnVeR57asdwGTZUC0LdCURmy1eIMSkDqNwGyQPdyDMC7/QMcJn/59z5R9v
	9NvyC10UUn3Y73hx9QOGLtUJt427UEpOUjepaQ0D5rJiXy7tr5beDG
X-Gm-Gg: Acq92OFkz7mLckkt2eb458gwRQWefRqCYA7lFLq8kcq9PVZco1gm/7LFPwmLunKEX98
	JgFlD1jPzxGKU8l3fGlC64bmVCugSZUH1EigElVoiVKiONZSkwLUTKT8yrKznNKTRdaziT+fCDg
	NAMLnDs7Tm+BR8fkS1z6uuo5G49QDbBDK3QbOslU5Oz743wlI+/IY9vsDjFmElAMi4D1kAHKQLa
	G9R4TsQIlVImG88
X-Received: by 2002:a05:620a:a0da:10b0:915:8f08:5fa7 with SMTP id af79cd13be357-9158f086487mr166585285a.52.1780481729770;
        Wed, 03 Jun 2026 03:15:29 -0700 (PDT)
X-Received: by 2002:a05:620a:a0da:10b0:915:8f08:5fa7 with SMTP id
 af79cd13be357-9158f086487mr166581085a.52.1780481729302; Wed, 03 Jun 2026
 03:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-wkup-constraint-v1-1-0a4bce791b29@ti.com>
In-Reply-To: <20260506-wkup-constraint-v1-1-0a4bce791b29@ti.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:17 +0200
X-Gm-Features: AVHnY4KtGB2TT-BqNW-Fcf-Dph8doazFYHWPd16dxkZfhVyve8a1Cpv5v5zMIwA
Message-ID: <CAPx+jO_LeGn-bKpfHwp1gkeb8czb7nEQgdcoUeHc1Dj6BgvFOQ@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: ti_sci: add wakeup constraint to parent devices
 of wakeup source
To: Kendall Willis <k-willis@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        tomi.valkeinen@ideasonboard.com, sebin.francis@ti.com, devarsht@ti.com,
        vigneshr@ti.com, vishalm@ti.com, vitor.soares@toradex.com,
        ivitro@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: SOTJ3krxXoc4qEJHMiaWc4A-G3p0IUez
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a1ffec2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=sozttTNsAAAA:8
 a=m8ToADvmAAAA:8 a=VlitpaJNd95OzUvVioQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfXzgFisEcH0R9j
 JsZJgg/+XWm85sqm9ro2apmKE/X0LZYRCwIeo3zMANbyGkgJdBJbANpctNlWAFc/UGR7o6j8id0
 Ktj8iJYNg5seQiRKK3zws2RwEdS3tijPCI2BCOZ/sLXyjiNyeXLbQY6CO8ot/suHXSzQLzmz8By
 Pz1HLMj9zqrXsz25ZYFRYaRWOnKBA+HIELHDD98K74aTNY4h0ssk0j9czsEe3rCCQA1XUMjXV/b
 CdEr3Trh2gr8OKhejW5DKa6bXJsxSQqDnKR7dfzNgoU+ZS6Njp9jt0hEncAwlezm+E+z+syqjIf
 tOEgpbwsF068ClGjt05jtrowQYPa7lwoo46XDbWnuPQepOmJyWiKLJ92tSEGWsxc+39TfaLQP1L
 I8zyNAfwcgA3VAjvg2+6onS0u8NR/9e0Px9aSrF0UyKQDczQqn5H4xmD+ymNWxK1t2SM2QJrrYR
 tFAKQ4Ch6KeVBE+R8Dg==
X-Proofpoint-GUID: SOTJ3krxXoc4qEJHMiaWc4A-G3p0IUez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_031531_791878_22CC50B5 
X-CRM114-Status: GOOD (  21.34  )
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

On Thu, May 7, 2026 at 5:16=E2=80=AFAM Kendall Willis <k-willis@ti.com> wro=
te:
>
> Set wakeup constraint for any device in a wakeup path. All parent devices
> of a wakeup device should not be turned off during suspend. This ensures
> the wakeup device is kept on while the system is suspended.
>
> Cc: stable@vger.kernel.org
> Fixes: 9d8aa0dd3be4 ("pmdomain: ti_sci: add wakeup constraint management"=
)
> Reported-by: Vitor Soares <vitor.soares@toradex.com>
> Closes: https://lore.kernel.org/linux-pm/c0fe43a2339c802e9ce5900092cd530a=
2ba17a6b.camel@gmail.com/
> Signed-off-by: Kendall Willis <k-willis@ti.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/ti/ti_sci_pm_domains.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/ti/ti_sci_pm_domains.c b/drivers/pmdomain/t=
i/ti_sci_pm_domains.c
> index 18d33bc35dee1b3bf6107af1e414db377d515199..949e4115f930b93b18216fde4=
6131b5c8931c9aa 100644
> --- a/drivers/pmdomain/ti/ti_sci_pm_domains.c
> +++ b/drivers/pmdomain/ti/ti_sci_pm_domains.c
> @@ -86,7 +86,7 @@ static inline void ti_sci_pd_set_wkup_constraint(struct=
 device *dev)
>         const struct ti_sci_handle *ti_sci =3D pd->parent->ti_sci;
>         int ret;
>
> -       if (device_may_wakeup(dev)) {
> +       if (device_may_wakeup(dev) || device_wakeup_path(dev)) {
>                 /*
>                  * If device can wakeup using IO daisy chain wakeups,
>                  * we do not want to set a constraint.
>
> ---
> base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> change-id: 20260506-wkup-constraint-9b0261b04df1
>
> Best regards,
> --
> Kendall Willis <k-willis@ti.com>

