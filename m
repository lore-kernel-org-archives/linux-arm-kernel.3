Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C7EC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fu8B/rAcYwnZH6HwVWb262VzxFDwFSC5SL+b8Idx7l8=; b=HHufdzlwnXJOYbcTURfw83naTZ
	t3zQ2DDpxHViWFfXGXFbS794iSWjalshHHSUSFNw2m5UarQ6flMmnGUA21Cx1e+Oy9TSVSAUIt1k+
	hDDY86IE2TjW0Q3tGwkSu8L//FoyQZAFuDCxNPWTpaKnUIHI/mBszirJHuZk0YJrHKAX5MQfjdd7Q
	r0NvPrqmZ/DlatWc6YD1gMZns6HlpKToqwutIrGsfPlDPp7RHY8ErluRAlHfKEO02ogrD5ef7065c
	I86nfmZUkqNIVir1an5DHk+/GVk+Mf19UOjcWyyr7EarHXupZWolWT7diCUpvRa1zAO0PlfElbSTL
	JfMmKIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlowf-00000006xWv-0mRb;
	Mon, 20 Jul 2026 14:26:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlowc-00000006xVb-0gqQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:26:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqR6f2745334
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fu8B/rAcYwnZH6HwVWb262VzxFDwFSC5SL+b8Idx7l8=; b=AdAz0nkdh2cXqYbh
	I6xlqidMkwcIT46nOcXUuBJqGHYLNsV1wigP7Hsf2owQ4zRh3BURnwpJlMo6Obwb
	Y27YmmBAKcU45LLSPOhAhLTG2jvFHYfKdtZ6g6l6N10KACkY41cu6OF6UMJcJVLN
	W1hMK6VQTekTh7GjoXnGhcxzjmOrsZsnoHwHanI+1cFcZ74gbYAT9A84JOZrZbPj
	DN3d21Ho7WUon5JNiNGOC70o5LRrTDFdE44cD6Yz58I0rc/yr4x1NyLfq3vMidXf
	nyg9Ol/CguhD1BuFmGK5JlAjBUjDMilyBk7UsiDw0volFkLkLDdch7nskjko4EO+
	7Opszw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2f8nme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 14:26:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9771482e074so1878914241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784557568; x=1785162368; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fu8B/rAcYwnZH6HwVWb262VzxFDwFSC5SL+b8Idx7l8=;
        b=SfP4LeSNSFhtvcGaLKP9rz9t65vmf+no6pkoZfnEGY+TrUIr3JzHkgC7C/zxQ5Cjj1
         92zKPUD6/1bVrp3pFOty3B3ACgh7WHdUZI2nNZNs9rNr62Hps4XS5id+nE03NRmEJGna
         bPTpY7T0rCcylI1i0H/Ik564zbP7kHirVm3fL8LHiGkBcpxkFG6kGVzr9YqwAyosJ5O0
         ig3MqmFLP99NraWDAbwdVPna01QUIEB9d53FoaUrynS8ZxNyph7u193sndm//xZhp/L2
         WmhbfX3b8oHyAo14cGV2+XQROHj9KyEvePgcyJMnzdqkg2jaxKMWjBgbxIKqcD9ucjvL
         WZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557568; x=1785162368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fu8B/rAcYwnZH6HwVWb262VzxFDwFSC5SL+b8Idx7l8=;
        b=F90prt8M7gPJWdjaQrcsS+cZ/dicy8B7XdRWmeNnE+cV1WHjPZPlFQlQGT2MmngPps
         Vrl42P/Wl+xiwlGkjILcLtQYfI+HaTVGpQDH5G8E0kev8JEQv0JWSSRHM1wHNrCtfcBU
         tc8OPKJSjCdJWeRI13V/oSELpAE3xY+PmQDVfOMKna7V12KQgu/2Hye6Ncyk7izgr7FI
         LxyupJ48SGCn1pdcDs1kMqRbjU4sTOIVETC1VtD6t154uH9/vFSSPGsZr/ZFmibn8Az0
         M378hzP/GvgIFJDQIdyhsqq/5c8m/d9gxTAf+WOG+RCMOk2aR7DCgvOTUT2lS6wordpz
         gUOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJ9AvmzmMs9pESNdb5Sza6vm1Ic+snSIhGPE3liDXprJtifpRYwBxhkQg9MyXr8BZcPhDgP3kj0nSUGstD2z6S@lists.infradead.org
X-Gm-Message-State: AOJu0YwpDwVZe7XrqbgBCa0r6LPldry0w6fdLzDCOZkjuLmsbA/WHPhC
	fLnyVtzFSmrPH9h4oignYSNuCUTf3hIHlV0vFfXNvhXeHjeA0aRxM4Aa1C8YJ3kDUDXkVOfnDNh
	wZnc5HoGcZE3iNsUjhB0cPXJDbR62s1anzl7rLUJiXPnqMXKDlyVYquBx1gf/Anjt/fQKQkoyOG
	GjmQ==
X-Gm-Gg: AfdE7clFVTGHVCLUa6epqxQ+VUhX+lxMZxY8qoIkaT0D1WpwUl7hhaIRvbmm3U6alpD
	koBtiiMegPn1c0NIL3MNd+k+Vr61iyCSDCR7GygImlSfoLVVarKrsfDx0vXHHx8cWVUqMELV3HE
	jz5mnIqG5BKXjInfG8ktAL9Vt0jF6nY6DAT53fMenVdBApZ9ElY4Cgj7Bs6He5HWkxmVOlOoAva
	sZRzb5/CmsWmGMjaABkHQW78yv2OZ09sfrzK6GnxI078DK1Jww56duMmGDDSj8uCCe86SaMOvr5
	MfN8gt7oGOAZeCDH3kCXMzMQnubKfoFAjGGtn16C1X7LKNyTdM8pl0x42Uu6NJ8Qq6aoLVtWIS2
	9y4YNBGlZbc5z3qnxzUsc5vyQsUNs5f7T003Hj2slars6NZkntrgemBI7Ex6vfLfc5n1LwNcSFs
	4YIWVfbOsPLtUHbg==
X-Received: by 2002:a05:6102:1487:b0:729:affa:70fd with SMTP id ada2fe7eead31-747534bf4b0mr3897218137.8.1784557568537;
        Mon, 20 Jul 2026 07:26:08 -0700 (PDT)
X-Received: by 2002:a05:6102:1487:b0:729:affa:70fd with SMTP id ada2fe7eead31-747534bf4b0mr3897201137.8.1784557568057;
        Mon, 20 Jul 2026 07:26:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39eb5019d29sm17048581fa.36.2026.07.20.07.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:26:06 -0700 (PDT)
Date: Mon, 20 Jul 2026 17:26:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
        Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thomas =?iso-8859-1?Q?Niederpr=FCm?= <dubito@online.de>,
        Simon Wright <simon@symple.nz>
Subject: Re: [PATCH v4 6/8] phy: rockchip: samsung-hdptx: Drop
 restrict_rate_change handling
Message-ID: <al4v_A7Cz2NBEakL@umbar.lan>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-6-ce5e1d456cda@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260612-hdptx-clk-fixes-v4-6-ce5e1d456cda@collabora.com>
X-Proofpoint-ORIG-GUID: 4Q6SQZvnIKnuYd-IE_JrIPy52Catu3yn
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5e3001 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=J6eIceq14uCgUkEHA5QA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=zZCYzV9kfG8A:10 a=TOPH6uDL9cOC6tEoww4z:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE2MCBTYWx0ZWRfX6syj5nNvjETt
 jSKYR0s86sgtxx7KiufiRQNjFADKyn/s/KSS7WtA99WeB1FjSdM/MpkFPw2e9QH3aj6T53lbQs7
 VQXroTQU45v1bMqZOcYoxFhlTGkiCnw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE2MCBTYWx0ZWRfX3wXk62evgnGo
 e6VZYqgR8vV3E41kqqMjVOETvcdxSDxWUaFlK3L2SvGlsrLY9v7gS8szg+/xmJurP5KKbb8D8IS
 CLL3sO2Opf1h4SNFdoh7kcZsZrbvHcr3iMnl1s7JPB8v0wqCVWPaFgqkKgNFAPUk36G5sk3oOpC
 OJ8evDgFZeK1ZjtV0mgvr/MLY0xtU+m3rMMJz35ObF4DyeRB800n7TzhV7MI0XC2uogXTtgf4UR
 X11ihX/Vw6tKkoJNozs4m0A2t+/Z1NPfGeEqh99FHbh+I4JhX2ovZPohNkYwSwDuZjVctuKDR/q
 480AcmWjmRBieaGbPUWjypcuA6BOIm6cfK9/2s4wTwHepjjXUr69mFHNPFZaqJfP4UpjrWI9bJC
 XRsIYix87pFMTrKgnASpxyn4Hp/KFt9FVMsxWb5GsbCZnJ3erKCc6uE+hsUhn33zi4DJSWe6btt
 IxIWYvSlMk6VYW8b5LQ==
X-Proofpoint-GUID: 4Q6SQZvnIKnuYd-IE_JrIPy52Catu3yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_072610_316905_E18231FC 
X-CRM114-Status: GOOD (  14.96  )
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

On Fri, Jun 12, 2026 at 02:45:25AM +0300, Cristian Ciocaltea wrote:
> Since commit 6efbd0f46dd8 ("phy: rockchip: samsung-hdptx: Restrict
> altering TMDS char rate via CCF"), adjusting the rate via the Common
> Clock Framework API has been disallowed.
> 
> To avoid breaking existing users until switching to the PHY config API,
> it introduced a temporary exception to the rule, controlled via the
> 'restrict_rate_change' flag.
> 
> As the API transition completed, remove the now deprecated exception
> logic.
> 
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 42 +++++------------------
>  1 file changed, 8 insertions(+), 34 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

