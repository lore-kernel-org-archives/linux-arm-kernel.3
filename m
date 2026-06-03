Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF7DCD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=; b=hiCFnFhBAqWRju4MhcVCVI5w83
	QAtPmaOzhGRREBN7XCJqC85OQR369WX8I/yNVca5YJwF6mB9z85GTUwg+x29FGSQ6wnmmzpqPOBhp
	Tqh90Un7ZqqyWkKtT0HdnxXMXLjlf4Ac5m5xJndTnMykILzXJkIUBKb70DlkFvGLOyKwxbw/PLdRx
	f1uGdnAk5TAH8oMZFEJMAVLz7tV8nUU527bIy9sVkwN2x/lU1kQ9aUaLKgWyjYMou+hq72zB5zSb7
	xg/w3aUbJli2PMZUexeGlEyWrDakjazMmF+itUVpg+eLDpyjqDIaSpNBclwuguBXCicMfkf82pwlU
	u/F/NvGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUidb-0000000En6b-0sfp;
	Wed, 03 Jun 2026 10:15:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUidZ-0000000En5L-2Lya
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 10:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=; b=Nhf2G1DrBaGtPfdnMc7+jr4kbB
	y6KnlkzaiyPt18rcsUSepNAgtAxpywQYMVRbuD/P2Fn+iTHqYGdTwMCCukTKKWRQLZ5fZBTtXD6Re
	kE4qbYfty9bjvsRTw350dJxe7kLHADtcPt4q7fMgHbylEO+bcI1IkpSlj8xjkTsCFTPJQS6kFbCbR
	9dO0KhmYZBnHhJB0xqVConVaqGe9HnRgckwtxSHsyudjoOIHRPZunzkaYEVzeCUy3KZl6nJxST2JG
	V+Bw10xy5qUQ9XubiWTBwt2zN5X+teAiSto2ma6c9XjXmVj/qkyptOCXQNP852Nbdiw9lyM7iFigv
	9KaTtGpQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUidV-0000000BobB-2hO1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:15:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vRPR2368045
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 10:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=; b=ezZXX1CR+YtOZz1Z
	EOzYTWtnYE5XMPNmnIHFU6HWZOln5nXjTVeLEdaSfNqD9IzhIwA35OfIubwcMLDv
	fqTyH0HPv8F9Cg1uO7kDWXWB59TxQUDjzWVysY00DuGKoHDxZMvj1JsEewvK3q8u
	GqCmqRtnHXeYnF4oJgI1AdoBhsqybwfvKHa3iMtwHIYt8SQ0QkQJQPPcCukeIk5s
	FisxP35gj5LleJgpaez6U3rBC/QGCO4eg7E7Y60rF8d7cB0nLn213R75e3TpiZRc
	klv2vHlop8PV9Clvl94XhjSFPlNfdrk0jxUdE4WVtj7jEDjOgwn5LVanphErilbL
	z2IZkw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gg2eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 10:15:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517615db531so13820541cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 03:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481744; cv=none;
        d=google.com; s=arc-20240605;
        b=i3N4dAbGU89PIjW1esqH5M6jd+qM3BWbb7H5viGE5IXU0yMMiuEuc4KU6c2O0aMp4S
         dyOEhX68lCmSfn5V7o1ND8BfTnQES0dqEsKz0a9en4FUtPYRUWpnKBNu6n0/aiaw0FmF
         tJ6q2Pf2zOJ4G6m09ibWoOVLvakOC62DW/zgW6LWocznLhAy+CmojtcsX4tGq3V0ykWj
         jlHB/DJvGF7AjvR4WjhurbwDPYeC4UYLS1+4m7F8+ukRvXQwWQfy+ZB6vhSvF2J4klt4
         Ht4L/FxWOdZh/xV5/8snQoaEC/M3dWNSv+/KyLQBQPR6ktIChjE0qfe2gfOhq9ShTaRQ
         iFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=;
        fh=t0ulIzj/D+uQhk0cO7b57/KegSLY27zha26bnGpaODs=;
        b=LRt8qvCGOYoZKAjl0yW3vtQSuJSjAtaQVuRNZ+/2sMqLFBhqcp9O0Wn9bnJAJkumDx
         3q6eQJC2YA7fMoqSrK027kJQkpOdh+pOU0bb8+iYI+S9iBcogQ60bBK+XVznPd3BkDQh
         pWpMmXm/MHSuGauS8ntyltXIgPQvQwVFRAEjE55CfWqGWsbLDKB6bUd7XfuTyrr4LpZn
         HsF1zaaBDPutseKgeskqgouP8b+d9r7NxjD3tQlJHbsa/5W0uRHvoYVvktndKwiVaxV9
         imHA18EhhzlDZdBxgy36E454dFyTs19rBT1UFVl0IOLQpFbSnHlg6+wyMofeBfgUgVSm
         rBKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481744; x=1781086544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=;
        b=Das/oSR6OOMSR+lEeH3+xJcp4MyLH1Bgsy6ncaUOKGJ4dFurCnl0uPIxr13u8kfkz6
         oaHco21Nt0YyqLGF96vr+MyTno2OaYliJSNNCVEDQRcmq+/9JTRyKvjypNfKhf2Q5S7V
         hnLvBid+ZzLoS1K2ebRQIc0c40+h9gneOUKL7sfFpyfLn692m+YYkji6jk/z2BJndlAP
         j+SZ3/TDtvg09lzGY3xQTCAtVTaYv+GCV7dBSQP0HJft48NzOmyrE7/koIZI1WVMvPxN
         Obr9SgMABVuF93T+duywdvc0L08yR6C7I6ZW0qAc789KWQQPoBHBPISvvUBldgK1oLGx
         TwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481744; x=1781086544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4g1x/DzNmKp7+EQtmsRUP0hUBgY5haHotigrNnUfOxc=;
        b=tRxJJgMSA28Kli+8vMiWOSc77NCM3RQebDl9VO9PJe42guDaTtjoRzctus76eczLCI
         pFR/TbUB/CnJe0S5lE6NCXnEHigXO1aCAukFiNaoyw9r5uLdA6xfpMit6ky5MNP/fr5w
         YJSg2vZMLVMJcqO/40Czd73EZJjIxl7Wc1Bbs55hAvcN11PGuflejF0kTl7f/TkF/Xek
         X4c4OCENCTEA9YaMRS1goG4AYLobeSLKUNC8O3QQzrN5yC6d/XePt3UfpeFOrtgQVes9
         WCBWJx27w0gm+ANKSF9t1cIwd5fqN8sKDuhGzFFmtz8klXfOUr293Z39lfTWVpbEtLWh
         aA0Q==
X-Forwarded-Encrypted: i=1; AFNElJ/wx+JF+uf8VlQV4/yrDAKTzbjRy/7o3maIIMWVrZcFiXuz2rs4h/sM2Z2iG+E1vt2nqs0XpFlL33FDnpyA92nI@lists.infradead.org
X-Gm-Message-State: AOJu0YyL5UL0AqzlWP+1LoXPwM6v/y+Ima6h+4UQ6SJ3wqGNHLpX4oU9
	Pp/uN256lr89QJxq44pSEkGyonc+4KNe5Ur+9WIz5gbhhKJrNvmMCt2Lq4mYFpD+RyomWeXiqRK
	Nz1aVnrqIFlZWUHQSXFMb+1mE3BI4V3tUFdyfxTg+27VUrV9/mrhPEdGuhL919T6ZnQsM/0gBcN
	4FIB5feJZo/5eiNEPu64+S5vPnTXEY+M+fNLymXrUTzh6Aev76F9GZ
X-Gm-Gg: Acq92OEDPYhxhDqFmuzbbElc+0cQEejEzvUlUqPjh9OoxgiygIrmM4SkYD2ZBapdeBO
	ngTddrACRq3Ie5cr8+iJB9poj557t94ehOEmwnYLWvdTJ8yWYx1hJjnkDQWvwV9AvOVyGEIwik+
	dfrhPS0DzCZs7swRSu7iloU2pN0/5Ss/G2+6p7Zut/VWWzUyzH85otFDF1wD5XEW8fdUDHhIW6F
	3rklJYeb6GJ2x2W
X-Received: by 2002:a05:622a:8d12:b0:516:d66e:7b1f with SMTP id d75a77b69052e-51778705ddamr35756721cf.31.1780481743696;
        Wed, 03 Jun 2026 03:15:43 -0700 (PDT)
X-Received: by 2002:a05:622a:8d12:b0:516:d66e:7b1f with SMTP id
 d75a77b69052e-51778705ddamr35756461cf.31.1780481743337; Wed, 03 Jun 2026
 03:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202455.136618-1-rosenp@gmail.com>
In-Reply-To: <20260528202455.136618-1-rosenp@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:32 +0200
X-Gm-Features: AVHnY4KtDx-pa93XzpTaccSbjUaGmCNCCMJjyEwZU8dcHZlGEEBgW87g_qR9iag
Message-ID: <CAPx+jO_4Es8x77Jv3Lf0E0zWjFpaoCaVKwWMPkQLHzaPf0G+bg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: mfg: move __packed after struct name
 to fix kernel-doc
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-pm@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX+Eb6dDyIff3A
 tSv4euFYcY1O7NYlgAVFwFWG4y49WE58rGR5+r6zku8XNKIEmlboCe2ojlhLpiISNHxkjNs9Quu
 cOz66A00uyEOTXGNdPkMf9V1iKF2KILwe25Dvu2XvcJJadG1qFLs0yPfrf60Ge/WEHxHJQ7b2yM
 AgcRE+4Rwf6hA1ZWAG+hZCtytuAEpXjHOZsp0Hsf1j1y0VDxpZBoGdQh9fZagmIBuPVP8LnaGmT
 xylSVUY7CFL8SgPLSyxgJjMegf7/v46+Tw3mOeCCsX5U+uCzn5tWs/mrVxA/WoBAy0NRqMJ+kgl
 RMXk+pGPPv7DD+oIdtQQLGl9DxxzAonmAagoZuRVBEEBhr1ewAzSgL50RJQTAbJTKJ68Ygek/ZD
 7kPlBLNPzBLBZd5aRESZMm5eyTKohcyEbncbacboA1zGqiH2HAVWuFDWpyAqYT/idFzzkrQlREH
 XPAxLCpteZ94Nzt+XnA==
X-Proofpoint-GUID: WsrfzTzc_v7oeAK6XUOSyigqCSnqAEUt
X-Proofpoint-ORIG-GUID: WsrfzTzc_v7oeAK6XUOSyigqCSnqAEUt
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a1ffed0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=0t7_9_tBnCl6T0_iKv8A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_111545_962627_1DF70BD9 
X-CRM114-Status: GOOD (  18.63  )
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

On Thu, May 28, 2026 at 10:25=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> The kernel-doc parser cannot parse 'struct __packed mtk_mfg_opp_entry {'.
> Move __packed to the closing brace, which is the more common kernel style=
.
>
> Assisted-by: Opencode:Big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdom=
ain/mediatek/mtk-mfg-pmdomain.c
> index 3ce6fb74dd53..53bdab66cf15 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -236,14 +236,14 @@ struct __packed mtk_mfg_ipi_sleep_msg {
>   *
>   * This struct is part of the ABI with the EB firmware. Do not change it=
.
>   */
> -struct __packed mtk_mfg_opp_entry {
> +struct mtk_mfg_opp_entry {
>         __le32 freq_khz;
>         __le32 voltage_core;
>         __le32 voltage_sram;
>         __le32 posdiv;
>         __le32 voltage_margin;
>         __le32 power_mw;
> -};
> +} __packed;
>
>  struct mtk_mfg_mbox {
>         struct mbox_client cl;
> --
> 2.54.0
>

