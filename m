Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C42C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmDiEXxACfljywIFz1W9JSRHmKR6p36Yja9EDW/O9BQ=; b=mIfilwvAiT49j0LaCVI8Xsv0fM
	XuDZUyMloiQfHQB6mRlHfHDpSSKoFlEn1KE5PvBTBdq0G7E7SRzUk4PlpQIMHTyrsMd/RYziqoNO9
	7qg+ZhkPSt4++hFsrcHOxLG5Mtf6/oHXjTDYJb4/ZRqvqp5PFM1kmKKM97BxiJ9TZqrbjAd46xd6y
	kYOpeVG1TJNPi4hohdOm/Knx6Zgz4AY+FAad3cT2w6Lsmn3X1TSBVTP6X7tZugbuY9bhQSqeI/Vxh
	geYbp3btJqenkPWXqEh+VkIw2+XERvETXaCS6WEQykJ8iQwnlp4iKEQYW/0xTshDetJYRZ/Ern5ZF
	5PZKQw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI8x-00000002Q2m-34Hw;
	Mon, 27 Jul 2026 10:01:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI8w-00000002Q1A-0f0v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 10:01:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R9X3eo3646586
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 10:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KmDiEXxACfljywIFz1W9JSRHmKR6p36Yja9EDW/O9BQ=; b=chWU9KHW7HHUtuwi
	ckvJe60dImllbKRrEXpmMbo43YJLOwI6raHkUQD+DgAlCs6stQKakPt8Ji7/+xt8
	pUi9OZPOBY10f61PgprMwz3cRIxeWuad4Ip1Fell9knLu6U5KMIOnHDRV4XF8k+g
	zDxgz0SvApLDoFIzh2s1jnhFj6oAyxjCfgQg+mf+sNcMy/SwGahJ7goATVTbU+8z
	pKvxnxCtzHii4tkT3y//ITKDoMpqG35gjDeDwGh3hV6YvAXuAHwSDQLlRIntkgva
	hmbzqaOitfFQg6cDCQTGQg/NJUuVhkRV/flLziRJBj2/AqVFm8u0DbGVKqIpbABQ
	ooAPsg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4c607jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 10:01:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e97889ac8aso32076706d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 03:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785146464; cv=none;
        d=google.com; s=arc-20260327;
        b=qnzlNchDLZnC/ov9rAOrNHIFWZsBZv7qifzyre0DswOYvM39sdMAvWlvwmFywI4Q62
         a7CXxbYvRi0AWXzS95WggUNPG1wPFzlg+WYnWOG/zNet0IVdXDqj46UOu5iz7m2Mca4O
         I5rZxPs9+TF0YoGknUq06HWAA8s5iesYZ7nYfViO7/Q+N4dwWwX/AYzCfr3HNCIB0M/N
         W42vT4rGxppQWI0psHNK8Dm6Aiu3aoMRAqXNvynwleStDIoIyM4EUhjHI7BeR3niACSR
         EhovOnlOmioi0oRTEnuExq5hA2JnQ2qqWcLcJK8S2MZUEswmQ6Uuva1PkYx45Wdlqa09
         VMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KmDiEXxACfljywIFz1W9JSRHmKR6p36Yja9EDW/O9BQ=;
        fh=8tHqRaa9Eo3ZyHU1VC4j+ffdi4i7AtUapBceRghY4Cg=;
        b=Cq4f8wADJF9ktHPW6tA3w8CqDsgj9+Wxu0NEn122RcdmIZiF7HWrOmYX/HaMEquDIq
         KO/ouoBOQq1tYr/K48t93iGsots244cGk8SPp5AZshF7y0ziTyDnQyWv56pLzy4bYFTe
         z4z9XC9O1Gw6KnGAxHpRYctP+U1xbuRQREZ9WYlnfCorYXG9cbu+7Qhxp2gH3oxr/cTP
         xZpAMDysK0fXvTkm/HEuIliERB/s8RTaQiEAEMv8/ti5XBn82TJcCsFh8QmAr19Gl0b4
         quHaIw9M5fU0f8JCjncnfAy/Asq+aeQ0UVeXV6gMop/Djx6Zd73eH52AQH7gr/pZQSj7
         hcWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785146464; x=1785751264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmDiEXxACfljywIFz1W9JSRHmKR6p36Yja9EDW/O9BQ=;
        b=aUMQQlaSl+DMOtFWaqnHerp8ssW03uZooD5KuLn2Rak1gEm2FQWFZvMg/sktsRA0Vb
         YOMWrHiuQ9OeOeTRmr8H6UsB99Kr+716SUL00gX24narpCKUSaOmK8ZiIK+rskHCyH6I
         wZzaQju6MjiDOrFzLbv6zXdLJPo+xzTuT1OkSnKv1o9SZn2zXnB9yGr5K7fdbKmC/GM9
         /GppNqNY4/bL+F89K58w0cy0C2yevpc74jtVekY0fPj/lnBvdWP+7ipjW9kehPB+aUbs
         0ajsB7IaxdZEfeVFZmRxxGVkDEFMayeoTgB76zTDuU34i4W3VeGE/FM/vCDT+pLCvjCn
         CVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785146464; x=1785751264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmDiEXxACfljywIFz1W9JSRHmKR6p36Yja9EDW/O9BQ=;
        b=tEFj7hy/B0rl3M1E/u3DFK9LtHedxDwM9qoSq4csYBOyMiUIz4FdCVlCjQoPEQyztX
         j3iVZ06wtw/nP66Ij8zkG7dzoy9mzyJxzxR6ckUK/85Nxz1DRDq8n66TSOGS93C8Bh/f
         fgt6+IG6pndRiFQAlUn8DTkPyIMTW8gi4o84RYJad/pX3U06xKIxWt7ff1V244CKFQtj
         iz+SmyGc0UDIHzHTcNgxht38A1PKsMKVoEMKcg73h02JlcAbRn4uGcBJTxfHLVzUjgRc
         vbewlmd/r7UULgBKmpvzfW90xPjxAHmLd+B6MslwvTWeNvaAeRyXATM4ShGNvihEOhuu
         o/MQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdJV3btkKzaXFYbtOFD7AN0amRQKGKpV03hDzZCMtgH72oh3UyLZ+FEyHHvD5YnKdjKSAz1zj2eCLRFQC8t25S@lists.infradead.org
X-Gm-Message-State: AOJu0YzmknGqJWereWw1+23TrLLFMClk9gIA3f0fGiAVofyTDFCiD5aP
	BLfk6QXWcnA0I7D79NCsDGwufe0Hvt+Ix/ztgiyUTBpJwWiWGXJEt4F5Eup2z0FI8ZlcWL7C4Cv
	mrWw/1ryIrLdtMS6skoW/xQAr19VlqEMoKS8rhD9edFn9PZ5MkjsDvAv6vcohKTapJ9TRimkb1Y
	Hy8NNbhhHvZUozRnb6zCroEg0jvDttnlQTvQ9Xyxv3XROsbk6lNsKI
X-Gm-Gg: AR+sD11FM0RZORToQdJkS4vjMXRzPkM/N4I+46CZ4onVM2uvfAH7zjIU+Ch7SJ921s/
	B7yfxDtSkoJrBVTjJ/nW4t2tVtstJta1Y3RjIt0D6W4Yw82HLjn7pyI4yaaHtV0YRgwcRdh/xNV
	QZB/4VnVG/74IZZjdrBmo6lDcaTcihntcaFfbCZnS8QZJWJ7Px10fNdM1Dfw==
X-Received: by 2002:a05:6214:5a09:b0:8e8:b302:8afb with SMTP id 6a1803df08f44-907ec5e5c77mr86121056d6.0.1785146463812;
        Mon, 27 Jul 2026 03:01:03 -0700 (PDT)
X-Received: by 2002:a05:6214:5a09:b0:8e8:b302:8afb with SMTP id
 6a1803df08f44-907ec5e5c77mr86120416d6.0.1785146463265; Mon, 27 Jul 2026
 03:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260708092038.741308-1-lgs201920130244@gmail.com>
In-Reply-To: <20260708092038.741308-1-lgs201920130244@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 12:00:49 +0200
X-Gm-Features: AUfX_mxRMxe0tuzgdBvzQ99tJNh8MEcfgARzgUQyUvcrVWwi5yEYYKrgP-hzda4
Message-ID: <CAPx+jO-fnCyJqKz6sZR=y4=-CWLicrT5gvw6xqoecJk_dimGMw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: fix remaining %pOF after of_node_put()
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
        Irving-CH Lin <irving-ch.lin@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>, Adam Ford <aford173@gmail.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a672c60 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=R5A58VEcyW3-00s9QQ4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX1j7SAsZYjlqj
 bJfXAtETcNZ7ThfR9X6/CK2nRaA5876IkdezksL5vT6eM7S6fqCgvNrtUtqX6G1YzCwQJS241p9
 5E+Ugu/Wz00AG/5BFjg584M8zL2bBUo=
X-Proofpoint-ORIG-GUID: mdtORatLZmk6P-G9ghWHPyccQ81h0XV4
X-Proofpoint-GUID: mdtORatLZmk6P-G9ghWHPyccQ81h0XV4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5NyBTYWx0ZWRfX1ufX4SsWcMJM
 yoJUQO4tT6absFfNRorVRgMEuD9hFLOGe03W0GtJEq6ebx9j9/wQdoRgLeYNd2MuSj6+cwKIMpC
 XX5+lS/BjQ+FVBhPbm4M/t+OufSDCF0cTQ2BSuVpDDd0oWin9/SnaCXL3BYnw1L5xX+WZTyJoVC
 mXJTJll6ZYz+U8SMKNDQYhyDa4WixjBTMIb7eQKwtqEMfkqs9WnIKdG/6LMqjDOiHEosc0AeB2Z
 UAt5iBaGLzsUhP4z2ckZdQj98ELjTHzgjN91nJ2CZVqTwQSB+TK+2ZzRTq3Kl9KgCgXgBj5h4ar
 FwbP0aV1QFHq6udUPrH8FFAjHUl0/vI2m5xKSTNCgRm8W3T/N4tQ/HiTU3417gRcRf05OP6kT6U
 lvVMU+YvxpMyeFYJUhtCNKczkq47ApdCwjJYObXkQXUyltDNerUbohF4J/ASlbdswZZe/FqiFBu
 T0WdpknIs5JhKWo8uwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_030106_206832_D117F695 
X-CRM114-Status: GOOD (  23.21  )
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

On Wed, Jul 8, 2026 at 11:23=E2=80=AFAM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:
>
> scpsys_get_bus_protection_legacy() looks up several legacy bus
> protection regmaps from device-tree nodes.
>
> Two error paths put the device node before checking whether the regmap
> lookup failed, but still pass that node to dev_err_probe() with %pOF on
> failure. If of_node_put() drops the last reference, the later %pOF
> formatting can dereference a freed device node.
>
> Keep the node reference until after the error message has been emitted in
> the infracfg and SMI lookup paths. Also drop the SMI node before
> returning when the SMI phandle is missing.
>
> Fixes: c29345fa5f66 ("pmdomain: mediatek: Refactor bus protection regmaps=
 retrieval")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 22 +++++++++++++++-------
>  1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index e1cfd4223473..f877d6694dd5 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1032,12 +1032,15 @@ static int scpsys_get_bus_protection_legacy(struc=
t device *dev, struct scpsys *s
>         node =3D of_find_node_with_property(np, "mediatek,infracfg");
>         if (node) {
>                 regmap[0] =3D syscon_regmap_lookup_by_phandle(node, "medi=
atek,infracfg");
> -               of_node_put(node);
>                 num_regmaps++;
> -               if (IS_ERR(regmap[0]))
> -                       return dev_err_probe(dev, PTR_ERR(regmap[0]),
> +               if (IS_ERR(regmap[0])) {
> +                       ret =3D dev_err_probe(dev, PTR_ERR(regmap[0]),
>                                              "%pOF: failed to get infracf=
g regmap\n",
>                                              node);
> +                       of_node_put(node);
> +                       return ret;
> +               }
> +               of_node_put(node);
>         } else {
>                 regmap[0] =3D NULL;
>         }
> @@ -1046,17 +1049,22 @@ static int scpsys_get_bus_protection_legacy(struc=
t device *dev, struct scpsys *s
>         node =3D of_find_node_with_property(np, "mediatek,smi");
>         if (node) {
>                 smi_np =3D of_parse_phandle(node, "mediatek,smi", 0);
> -               of_node_put(node);
> -               if (!smi_np)
> +               if (!smi_np) {
> +                       of_node_put(node);
>                         return -ENODEV;
> +               }
>
>                 regmap[1] =3D device_node_to_regmap(smi_np);
>                 num_regmaps++;
>                 of_node_put(smi_np);
> -               if (IS_ERR(regmap[1]))
> -                       return dev_err_probe(dev, PTR_ERR(regmap[1]),
> +               if (IS_ERR(regmap[1])) {
> +                       ret =3D dev_err_probe(dev, PTR_ERR(regmap[1]),
>                                              "%pOF: failed to get SMI reg=
map\n",
>                                              node);
> +                       of_node_put(node);
> +                       return ret;
> +               }
> +               of_node_put(node);
>         } else {
>                 regmap[1] =3D NULL;
>         }
> --
> 2.43.0
>

