Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E115C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 16:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d45tURx3XWs+kAyjHrk/klKfMYkvuvpPKIkNMmnC9Pk=; b=qNIY17j2ESHo36s5xoTEDfkfgz
	53JH3g39h64xb2yy7Z/Po1bYoCpP+FtgtnZ0zagU++OT0B+Qzwfw4lrdBPOI6U5Fn6o8bIIy4d+wU
	PDs5okdWQbqRmYjGNGWejZo8ejUg1dPuZbzEJreDpP8eeJMkOK+dZZBlQMCTdRaeKTT2YLzx8SUsZ
	RJH1APnkv6vLJvCwpu+1EzGfW4MIEU5Vh78f5fZvXrrNBfLLknjYwxLd1IZ52PasCqqC60W6lIz/L
	msxX2ieCUQmxgF5OdvIXxoTiAwsayPGMhspD56hYx789isEmKFO7EBsMfroQj9yKrPxCFgKSYEaLR
	wIW6WuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOVD-00000003RD9-0Tt9;
	Mon, 27 Jul 2026 16:48:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOVA-00000003RBx-2mrO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 16:48:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm9Su3823624
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 16:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d45tURx3XWs+kAyjHrk/klKfMYkvuvpPKIkNMmnC9Pk=; b=QwXc30K8UvMnTrI+
	wYvzNBzzz6mmhTFlIJVxbpP1n+zDceDpbcl8AU/4CxteUn+Qj2krzqq6ts++mRT2
	JzAt22YA10tB+FQbNEU0OW00pc2GOFJmjNik52NhF0fmP5o5FxhtQkmhFhJYjbKm
	yAgqJeXmA0JFjRbEcHmzqkftWSlZoR7LFP0eaExFvA4PPkWXKCj67Yw7d21YnTGs
	G/YN7dYPUr4iIdzKIHifrdqrDn5X0Muy+A479uT1stnrMcvTyny//I+LfsLB659H
	cPWefnrowLmiISioa1brd9OtuH+FcEIUoSWdhGmM2Urg7u0wVUO95j6rYhkQKib4
	KwyuwQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbswjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 16:48:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-520a00c7a03so52341631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 09:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785170907; cv=none;
        d=google.com; s=arc-20260327;
        b=SJoDsRkVtV7eOhMJrRl4lKcmKbs5F+HZFMQYaYBjYlXjrOpZKMPOJ/FxHFg8VDAQ82
         czKYVpETTCYDRr6Wnqs7ktGjwmvYblrhIs+cWV9Ei3h0uXae81hu7uH/tHNFJIyjvjte
         eTNwz+V38kNeKQvNY8SgkRSbB8oZgDg0clzzfrHtQ3PHfd27MONORNlpJzGScxCmc3nY
         lmHj8iB0TTSh29Wj2rGyPz5IdodB9zu708RRHJ9362MSGZ4Cn560b7mUGavsiWSJAThT
         JcEyKPbincInGFUJvf0zTcEJvqCZLKmPkSKoct2XNPuy8YF0QqqYelQ+pHJvbTHXBjxD
         HMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d45tURx3XWs+kAyjHrk/klKfMYkvuvpPKIkNMmnC9Pk=;
        fh=9UeYf9ggPCtuFP/ge2i6NE0KktLjHXyh5YJKB8h7wlM=;
        b=WrlAhfoLFzv2jZGqnNaHWijdWKFDmTmxpYbI9VTp92CDLuZ7CiYeKrb6qeO9pTbUTD
         Al1qrXE+1HYAVRiPKD3syqps40sCBFyQ/TNQW4sbUHR7YibVlF9njBDaFxn/ILR9KVAk
         cVqlD1IQp0LoPLGbTo4WSab/vr8/5pJv652FOoSWhtLFmSxQEvmL5vaW3rM0x792PRrQ
         0xt7PBLKsALFecqh0qbuoxcSsq14sJb9aROTlg5BtPO21NacXl+w1C2AoW8NF14ZWAjp
         3hehLkgu6W8jf31n2Swehss8utj4IbLHUgrGmgFJ13dBexiFy+v/ipDtr6UQmeIbffqU
         GThw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785170907; x=1785775707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d45tURx3XWs+kAyjHrk/klKfMYkvuvpPKIkNMmnC9Pk=;
        b=cZ7HodI1mPwJ3UYFEXnK7HiRFW3AOY9yErq2bCSCMwrjDWTOfOUCbWAF9EXvosbHOf
         6LUNIwRQkz1A/psSvJx/is/Bgsmy8Vb16BTcFLwniynTENom+Bi2y7MR4OlhYYxPrima
         3sEcqQp00tyS6O2hF2bAfyyGxVwcEbO6EtfvZ2wfZdOt1GYbxrpMH0FRrKDqtL0ycJkH
         5MfhoO14Xfwy031WO64FHWj9cH2KJdon+gIUOlihIyylDuwHwUS1Ir+oUst3Wcq02Br/
         rzGqFgFDR2eZDGgTMjgIID7B+rCaCKry2f663NBIAIJEndqT+Qe6IBa1FgPGBd7ZnqEh
         2WFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170907; x=1785775707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d45tURx3XWs+kAyjHrk/klKfMYkvuvpPKIkNMmnC9Pk=;
        b=ppomNlnni8dEZwCKT7i/uPkBPQaVhcNtSbYzwgtQWHTPNos9uu17Z1A7QfGVgH8KV+
         EgjiJva8lZrazSR7Nd0d8W/Tk4bD504txPKfYjWEuD27pzQEy7BbvzRSr5fF2wTQAvVd
         ZZyo5oNiho3ZCCsgUWGc4sn09g7CGqZs1Kp2Hd0BoWJPA1+UdSx0xCQomKzLz1HDf9L4
         Ig4hIxK8go6mCxzfsMmuF2bzj5EQZrc3bF5HRFuJmALwP8FEq0hITJ/sM2QVT/QtFL85
         1f/wfrntBP0Hj/LBAnGok0aNsZRMQ8F1tOcVCgf3PWK9gHIEMjjfFNjJZZKqMWKikCSW
         KeeA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8X1I0xYxTKQVSaAaHlulXF1JKPuqXOkZ/2waQnoqgLm1LxD15hgbuY5RsSRF295jwP9v3cYjpmecZeL55I8DP@lists.infradead.org
X-Gm-Message-State: AOJu0YxralLBt3VsLAYlgQIZyMS8iYqebDuah7dnx9Xs+t6R/qL1I5dG
	cEtFBgRjYTWkd5+HvZU7VmBJcPEKYCJLxZ5tpoCYs8Nx7MOELPZARpyjwyBgPidwX7z4FesM1oF
	whTYRsUmfhNhlIJm20r1+0J4PDCgL6gAL8Pd52tUgjWPi0B39Gf7rYqimZdIuSLQZqm0EcRyEJD
	BnnyQ9GMy09bioxlZgRP9iaAEE442f8Miwap4phD+a/492hzAgJYyV
X-Gm-Gg: AR+sD11VCQheWWEaURxGTqhkRdUTGao/LfWzOGHUugJect9IuZSbeAEWF5uEAfrLCMm
	eXhksKwoFZLeIkgaHWt5f8HfkI9GgrAXapp6+yZ1JdA+l55pYbuKCDaS8RcRbLR3CAtB1K6bIqv
	ifb2hFnnD+b3BhZ3Ur+CCRjndDMmSGBhdayVoc3Go8dJyWtgVZKl7KTXtssQ==
X-Received: by 2002:a05:622a:8b:b0:51a:8835:58cb with SMTP id d75a77b69052e-529a86b1bf3mr107887081cf.54.1785170907040;
        Mon, 27 Jul 2026 09:48:27 -0700 (PDT)
X-Received: by 2002:a05:622a:8b:b0:51a:8835:58cb with SMTP id
 d75a77b69052e-529a86b1bf3mr107886821cf.54.1785170906641; Mon, 27 Jul 2026
 09:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
 <CAPx+jO-1_ZpYcnPtoYxRn5vv34tiP7TXnjKZ3SaWkEzdeTfXpA@mail.gmail.com> <3130633c-fbff-4b1a-a127-bd4eb678c3f6@collabora.com>
In-Reply-To: <3130633c-fbff-4b1a-a127-bd4eb678c3f6@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 18:48:14 +0200
X-Gm-Features: AUfX_mwYyJK7opquw-Zgrx7ikepnD3P77x7E8vkOGtJWpCSQCzJtEQPkLeMKHN0
Message-ID: <CAPx+jO9-b_XyhS_CtX1ZFiH96WMYjjcvOEcO6u6CLEZq61rpaw@mail.gmail.com>
Subject: Re: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 2AHu4kEnIsk-aNI1Vy9PqwxEI-_96rbq
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a678bdc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QX4gbG5DAAAA:8 a=gHq1O5mURKo0xi8WsWsA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1NSBTYWx0ZWRfXxcosylgY+njU
 eU/Ia3dXjixkx4aRXiomvN+VmVs4yGtFpeuEP8eorJ9ldrJuV61DibcDDd997DQoNHSbdpW2ndU
 4FX+VL3DToFpTI8Bt92n8cYt7gzR7Js=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1NSBTYWx0ZWRfX8sP1giYTrGuT
 USnOMBDy27mgvoPMzhaV+aL3qp1pBIe8fue1jo5EX1x1USt6ziTjW5NOZ8aYyB1KFK2kZ7E6/TH
 yYDjhibrXswj67wmkRamUWqouuvY6V1g6FnhT+xWE1Gmdyb24q3xVJPoxzNis1yQoJdys8NWzFg
 pHsNYNzfkE7S4MKRsPdyoTlF5TBb74KY1Ilgqos+/2NvrxW80pB6agJ0DfqPgHaBCnexLJ9N07y
 OCaihRc9dFoYHxe8ymoMFxphuVmTJZ5G7I5lqdtga7683QVb3FvGL9KTbTdnD5JU7MqsvAgy5O5
 fXlNFzm1UAg+TAEkcRVy0gHWxPZJg7s9Mo3+NaxNSomfT4YQws4AkrCHMgRaNs/1hILGiQbvIsv
 GSRxNO++kgHIdVJ2Okv/iwicAoea65ggjMV8UUIOofn8B3Y4ziTRW54LIGS+87rQSWyFZ+Nl1ne
 aG7m7rP6PzX7WEooIBg==
X-Proofpoint-GUID: 2AHu4kEnIsk-aNI1Vy9PqwxEI-_96rbq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_094828_707560_ABAA4F12 
X-CRM114-Status: GOOD (  36.65  )
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

On Mon, Jul 27, 2026 at 1:04=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/24/26 17:01, Ulf Hansson wrote:
> > On Wed, Jul 22, 2026 at 3:28=E2=80=AFPM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> Depending on firmware, part of the MFG domains may be left ON at boot
> >> leaving only some MFG cores powered, to let the ACP to prefetch the GP=
U
> >> region when the display controller is brought up. This doesn't play we=
ll
> >> with an eventual delay in probing Panfrost when the display controller=
 is
> >> fully set up, as that would make genpd's sync_state() to power off the
> >> domain while ACP tries to prefetch: this is causing an AXI stall,
> >> effectively freezing the AP indefinitely. In order to prevent this fro=
m
> >
> > I haven't made any detailed investigation, but to me, it sounds like
> > there is a missing consumer somewhere.
> >
> > Should the ACP/panfrost devices be a consumer of the MFG domains as
> > well? Or perhaps, if the ACP/panfrost should rely on the display
> > controller to be probed and powered-on, to be able to probe?
> >
>
> This is about how the bootloader is leaving the display controller, the A=
CP,
> and the MFG registers before booting the kernel.

Right.

>
> The kernel drivers themselves will reset this weird state when the HW get=
s
> to full probe so there won't be any more issue(s) from that point onwards=
.
>
> Actually, there would be A LOT to say about this, but I'll be very brief.=
..
>
> Basically, before booting the kernel, the bootloader is leaving a half-as=
sed
> setup to potentially support continuous splash functionality, but without=
 it
> being actually used on the device(s) that we're talking about here...

So does that mean that the print in scpsys_add_one_domain() ("A
default off power domain has been ON") gets printed for these PM
domains?

If so, perhaps it would be better to turn off the PM domains (if
possible) before registering them with genpd?

>
> Again, I should put a remark on every word of that last paragraph, but th=
is
> is the gist of it.
>
> If you're curious or need more information, of course I can expand a bit,
> there's no secret involved here, it's just that I'm avoiding to write a w=
all
> of text around that...
>
> P.S.: We've been discussing that internally and chasing this issue for mo=
nths
> before deciding to "solve" it like this.

Huh, I see, thanks for sharing.

I think it would be nice to clarify a little bit more in the commit
message, as it all kind of indicates to me that there is a missing
consumer or that a parent needs to be runtime resumed before a child
is probed.

Or another way of looking at it, that perhaps makes better sense.
Based on your latest information, it seems like the PM domain isn't
really fully powered-on by the bootloader, but still we are telling
genpd that it is, leading to an inconsistent state and errors.

[...]

Kind regards
Uffe

