Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C305C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=; b=Ap7o5O5+d8dI0WMrM/RswWaj8D
	sW1UCbSd8mJsXdvxYBgdab4bQVgtiPnd7mS0b4bL6csHEouiOmiHH6gtC9wUVzahmPHxC0Mn7mm1H
	RypajlNCBgr0rXbMuB7xs8AFUX4e+CTaIVzV3DjEQxPuzBu5BjMybcFrkDO6YCnN8diWbU6XSkVwF
	XayPlVBWSLD6D54PzVkN0bM/Zz+vSlYgbgICxgiWrkoHBxudvOSvDJOxkh2LzhZgrFJuscpESnHKr
	0AXQZt9qsxd1zPcJlyWPsHJccfu7ocESbgIRvALd5a7ReZJSFYh2ePBQjvFOy9RkcV7K33Ud0QiIb
	Ebm93sqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qgg-0000000CaBj-1a9d;
	Tue, 01 Sep 2026 15:46:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qgd-0000000Ca9z-14Y5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:46:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8Z7E2145885
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 15:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=; b=feYTI9+AXed/U2aQ
	urR4ihwgtlD6ItpFSuAQtQEVdpvW/fhqqnRBzvM8xzz9hcvZK3m3gA19/Y8/s6co
	STQk+LdhxM8bCRTz5CeG1xf4+1Bd0Osr3fH50gOkQlcSbZpzi/0FVSDyG9RFqoRU
	QUw1PuLsqUbMfpGZeJk/ZLXRdguuyBWlBZBv8zcKoazxEe8k7zD58ccU4eAl7dWl
	yHxtugvSRYVgOOAe2HecNQDneJIXfyWjML+QoJCW7tqM4OGxoiPEg5KoeZnhHu4Q
	/6rGV/R30g4y9ExEGzEwmxUS+9DNxqYesPbcPBJmpIFk1ud+YEDSKJQqXAG4FDsl
	Lp1Bzw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8uh44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 15:46:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1c62f0d60so5488a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788277570; cv=none;
        d=google.com; s=arc-20260327;
        b=FNnfrnw/r/ifg1k/vQj3VaFJW8mb8S5DGBctOO1MBKuPOx1OWLRg4ZN3NnEYBkZIGc
         xS1Mm0ygLMPuAPe6gq2iD1HTKlc/LdU3OEptDl3SNkztSw7GLunsZr5k1D/riDEMgStU
         rH9XJMk05SHpsNBY8rNGOdcGMbLyqskxEBnf25iUYWSjgCr/CF4LeC9EwDQ1/2rGS5sY
         P/FbqYJyvUN8qern4uUThabIzXJ87DwxvBdkrdJorE1mOx5QiyFjpGBF4zpiHfHopb2d
         JStsFwBtmGuCtQItxc2GCq5SvxzBrm7dsQJVA8G6bvh6l1j8KgPu2aQIUO67FKKkkNVx
         JkYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=;
        fh=UmyxPhQeRPw6x1uw6EX2lQfHkxTCdRX3ybQIdjC1iIs=;
        b=WFalRKXe9mmXA9eoN4kLdQWxzXtLZ+FBrHa19FQi0eHwJZuRDsMYQeGV18q6CN14vb
         A3ZYdp3xn14jfyV3GS755pI7QOs9PMZEq+X0VcEkAEafgFi20ZYltHPQQrm/QVHKp/Z6
         9B/tbtuADVLfeiYSxRZYCaRxiW/mt4cpOkE3UEb0mFGAs5rF+TBNKVYSs4kwC8Lvlz8r
         O6KyXQobm8H/Tf6urXb4L7Q6h1hcmQkjIgXJ21lRe21KUWkukyFJoziPSgCbpwY2aRwI
         v5JI3clkTkJ4OW41sGNXZze5hCayDENRe9FomkjKnLlWqH9wGgFwCh0h1SpUaYLUBCy4
         cC2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277570; x=1788882370; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=;
        b=hXAFZPOVtztJ1HgSLW+F8hs7gMjaiw77f97LBSmELmbNC8PDkHnJTQ2iNuKHCW7YFN
         0HW75OInjcGF6vi8HPvO+TYVcUMqnW/wUTWxVJTkUcNrzz7o34jt0BOoIK+A5ee6AkJ6
         wLGT6lt4TDee1Xc9EFu8VT6X1q/YqLEMOy/JFXto8S2adfVSmJIDBBXKhZAZ8SAeK1AK
         Ki7XhAHW4BfZ91GLxFjkLHnQQiZYlB3QPTc4rUltx4xpRYSA9VnyU/oLBbJpKnyRKCSr
         YmyGmod59v1tW9yuwH5+NzezGDKAGddkgEk8mA4+SCcxSjG/57fWnRLdCaAgT01YVisz
         qjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277570; x=1788882370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZesAiea/HD1vlRsrFj0Au2AyHXRN8QeZN3AWkJ1tr+4=;
        b=TD4aw+yS/zSw450bK0nUUp+j5IBm1rjvYmRTXfrlVzYF5qFyU+4O8zVpSAJq8nrylJ
         +fqvxiVQxAnt/V+xj/nAtBMRvIDAXCiozXeZHfDvy1AtKO5AwGBxjp01IJtzYI+Ze875
         7clvC92e1YHJIOhiWB8hFHISiv2mNUc5JOzSlnw3jiNqg5H1Qi+wmzv/Icu0fHNERtZy
         lKsigvC5Onc9Kmj8NuyABWRKaY95H2z4+Dh3cdyYel2HMEm4EsAeIyFXng6XCALbupGx
         i93inK1pDSdDIVtodS/k+VLURaSe0bIGoEQ3muVlu3YX/lEOEe7nW/tVu12ZQQEm+/aa
         ZxpA==
X-Forwarded-Encrypted: i=1; AHgh+Rr0rpD9p0qj5A0uJ/ROIwfQGQigq0sgedBYc/po4qw+7Ow61zFj1RT3UP2dnawupJxy5G9OHNupmdYXL94NwydH@lists.infradead.org
X-Gm-Message-State: AFuF++mR4qcpo5d+2KWxPpI0S3YbAJR68vkEwfZ3n/4Joy5IinoiRfIc
	uOBOn+4trY9f8hz1YZ0gibpWdOnQs/AtJXszz8LZUucKxTtinrggHA3dmPl5MtM5wDNRfcTCc3L
	d1v1aURQNEbrL/k+6wfxPYOF5mJE0GbbOxiIioho274XiJHkxQdIDJpAJuhaJwC0zWwuGM7cyev
	NBqjQaLl5XZdrmrblfD7Uz9xT35q/Qw7GMZ7pqlXsmB7Z6sgvqos3H
X-Gm-Gg: AR+sD12B/5pP0M17n7FwzcyCqncxuPTMLX9EEG+GmMt4QjYA1F0p11Txk0RqXnYHEEw
	aIbUCwlQrfwfaka0k6jV9CJYHtSmgoj+xj5Mv8hyS1YCHPDKjJAjEk9qr3FUDlwFVouWgM0x6g5
	/uSdsAvzNDdHIQoj8dWT6iRv5I2LS69keEThTo80spawN1YrfeXi5KAaz+BA==
X-Received: by 2002:a05:6a20:2d24:b0:3d3:af66:9f61 with SMTP id adf61e73a8af0-3d7b0858c0dmr13796020637.27.1788277569852;
        Tue, 01 Sep 2026 08:46:09 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d24:b0:3d3:af66:9f61 with SMTP id
 adf61e73a8af0-3d7b0858c0dmr13795922637.27.1788277569390; Tue, 01 Sep 2026
 08:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260821085222.140633-1-ansuelsmth@gmail.com>
In-Reply-To: <20260821085222.140633-1-ansuelsmth@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:45:57 +0200
X-Gm-Features: AcwNN1X-ZkG58Ju7YGsTebESlLv7OBivRQr4LICy-o3mSGUv_1-w5G-mpWoo6R8
Message-ID: <CAPx+jO_T3qLTYh3VORuPB7_caWXXOXy4XYfwXhT4THEjTghj4g@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: airoha: fix unselectable AIROHA_CPU_PM_DOMAIN kconfig
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96f342 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=95gA0qMHRU8tCJvgjbwA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfX5Mk9uvJBaU0e
 n2s/b1It3lOlC557rnPZrsxuu+Qf7DuLIdeUVYtF+yzUGtBx9fxPh8GtsGUIytU4S/N8atxu9W6
 Rc7RO1lcvoxF/gSX2xctVTf6OXFJaQzXlUgFcQ3u8UuR9vCHOsUpcTpQ3KzD8ocdwGN2gyv4a0k
 akwfr4aI8E6xfjQdaBICpNwnW173XQwYfnLvoSIAwOQ5J25SvOfaUux2szFRQMXOQwwyYdDBNl6
 bXUoPIjcB+2+KERA5+ahrJQTCAWDj/JfWbzCyg8LpcrxHB3DOMYOGh7K8Da5kA6732CyKYTmG3Z
 ds7A1Ob+djcTSaCkdNsTx+gZd1hwcj8SqFjjZe0vEub/VNOojlSFHVQQWtqx4ccf86/PeVSLKYu
 6CDDlvovHN+9THC7Ahol1Do5c5xasIQ3JCd1WJGYUz0DE2K4GZf7wedZMmEQEhyv0aYI3N0VLBN
 YxxjF+ikQPnDAj/LMMA==
X-Proofpoint-ORIG-GUID: G_6s4lhCOjFyas_vQ5e3unPD8BvqCCfG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzOSBTYWx0ZWRfXwIcaBbhAjEDa
 wjILInRVDevJBBBXzgCt95c52iZeZj3BmC6PuNQ/2Pzrq3AqmMlUGqvhOVdEziggVkw6UxEWmE7
 ZsatG5FXZhLMruoZFqths/NuNAT+1XM=
X-Proofpoint-GUID: G_6s4lhCOjFyas_vQ5e3unPD8BvqCCfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_084611_297264_C64384F3 
X-CRM114-Status: GOOD (  22.79  )
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

On Fri, Aug 21, 2026 at 10:52=E2=80=AFAM Christian Marangi <ansuelsmth@gmai=
l.com> wrote:
>
> The AIROHA_CPU_PM_DOMAIN config was wrongly guarded under the Mediatek PM
> Domains menu and was unselectable.
>
> Move it outside the menu so it's now visible and correctly selectable by
> default on Airoha SoC.
>
> Cc: stable@vger.kernel.org
> Fixes: 82e703dd438b ("pmdomain: airoha: Add Airoha CPU PM Domain support"=
)
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediate=
k/Kconfig
> index 8923e6516441..a2eb704a773c 100644
> --- a/drivers/pmdomain/mediatek/Kconfig
> +++ b/drivers/pmdomain/mediatek/Kconfig
> @@ -43,9 +43,12 @@ config MTK_MFG_PM_DOMAIN
>           This driver is required for the Mali GPU to work at all on MT81=
96 and
>           MT6991.
>
> +endmenu
> +
>  config AIROHA_CPU_PM_DOMAIN
>         tristate "Airoha CPU power domain"
>         default ARCH_AIROHA
> +       depends on ARCH_AIROHA || COMPILE_TEST
>         depends on HAVE_ARM_SMCCC
>         depends on PM
>         select PM_GENERIC_DOMAINS
> @@ -54,5 +57,3 @@ config AIROHA_CPU_PM_DOMAIN
>
>           CPU frequency and power is controlled by ATF with SMC command t=
o
>           set performance states.
> -
> -endmenu
> --
> 2.53.0
>

