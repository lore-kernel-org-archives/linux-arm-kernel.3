Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A67E9B340
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 09:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6jOJObGif+AjqE5JDhjeGjidEdY5Ro/frDr8d26S0E=; b=WvQBEpqpDywkMYOwIp9UndzHhz
	2DvtMINDT0HmC5WgHK2z+WEsJo6ILnJlgXF1yvtS3vLzQhd4cHUkMgbUdOkTJBx3ueqrZ/s04/zJD
	KKOrw3HyWrfxXaaUylIjpAoDrkYEAyEv4giKuq7Oa0h4jWpoQfdGouQcH/rEQsjzaRwaWa29DTf3R
	PywcOocO07f33TsfR96x1W1n+nHebdJQoVvtuZfOJYJOR9BPghzhy7nCowgGXgwxutcQ5g6OLRh/f
	K4twvYrSh7cuNkdQoObL3ihnKaRnoi+4H9RULXKQVec15RJF9atKfc6ajD50UGFPqwwWGCBoaE10E
	9hXEPfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzna-0000000Cc10-0aUJ;
	Mon, 02 Mar 2026 09:42:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwznW-0000000Cbzm-2qei
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 09:42:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228FhWg2302941
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 09:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W6jOJObGif+AjqE5JDhjeGjidEdY5Ro/frDr8d26S0E=; b=fYj9KSB87OeUp/bv
	+E63bflbXLsiYJsL3T1MyfNiM4h30Ablp0wDf1GWP1iRc69yVgvtxDUCbEXyRb/w
	mJ+PrfnUB5eS/1xzvTpz33E2sRfCfC2IBt0QoI9zg9x815i/ofUouDlu1PFchACL
	EE0+qECGftsbfQ/4ce8iJhQ0cgkF3N7UvGgtbaAFkkp1udJyj/RAhz1jQCeNd3DG
	0tgaHDTkLrrK/qr7+tJceYaBZWHXNqztRvBI/mdfgUbJTyoZ23pCryez3GxrmXuC
	TPZ+SX7/r1zFY58FObxVlr3pEOjeN9UQt79OY7XOAGRfLTVQz2AWjP2JT+k2vNaZ
	D1+qcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd50pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 09:42:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3fae6f60so4012945485a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 01:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772444561; x=1773049361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6jOJObGif+AjqE5JDhjeGjidEdY5Ro/frDr8d26S0E=;
        b=Ry6tmX76L0zSa6DSLfXeD1rHgPLhiMlyK7umzXEa7SqR4/A/cJURdVSEhuBUEFCoIy
         vzLT6XM27G5XNHZNa8FIdHuNNinbW63ixzXtGhEuiFRfcQsL+uTsD4CkTHulQZl5Rn60
         JgEAYKoyX9kosNW4Mant7k5eHfeSk1FeCEATVyAj6ojn1UjrSUyFXGEkQcoqQsL7lR04
         rHZXrn8VcJuAiZCwhvRcv40Xom1cRtLYCnas83KMbJFaeDbryfoeTwMoxBqWHN0CsTas
         RbwvXqSGo2xEznXnNBM+UOp7KdmUGYIpXR04daLIYGyNfdlQiKCE2KTMt3WLh5uRP6wY
         anMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444561; x=1773049361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W6jOJObGif+AjqE5JDhjeGjidEdY5Ro/frDr8d26S0E=;
        b=V8St2echBZuq1wANN2diddTSr7U4SWfeqfnMG6zSTEo/BsaLAQPI+Id7pb7V50FkXA
         yWInEh2NAJc7F6xr29t/9CVJwLP7VHggB6eXgzfEkoXUZwu3eyvak4cwQOirLGDusU5P
         L7nFFJ9xI+z0KMimjIsgxqxZWyrkDFr5vK8ktsQZliF379H8FOjcsyVYlgPASV/AKk2t
         WvQZBN+K0CM9W1wv3tDHPjI7aJ7PhvOjaHgAlbU/bb67FOxnpghtIcmRbVtsZ3f1bMJf
         7cTrHvAf3rseaEUOKCc/JxXSe25LI+fVtU0fxVUDgxdhfXTnAyXZUxrxUt5G1fGStedA
         2PEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsVe0uoQgU26f7z99BuqyXbx2QXuhp0p5g720UoZflFeQ9XzorhZL2/JncQ2DuTsDb1Vzq6CvaCZ72atGTRCfL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0SqVPWuTfjrrfE3BLgw5IZZ2c9jEIG/g7Jdsqg0wQ1xIuwNxu
	XDGZwUGE6QSjvcsOQjJJu6wBrTd1JUE52g/E7Km2l87ESwYpVA5t6QOOxIcR3jJdY0CQImZ7kiB
	jL1hoee1hwCJ74n9eKYcR+oCQkDfULFpcqRPuxAkd4W7OfQTQizBvGpKp7bBmNnPGo/SHxJ5mh7
	ALmw==
X-Gm-Gg: ATEYQzzXchH0tNBRURIQ0EoiWV7u5XWPClJ7u379AoA/o2dkF4e2O+RqLeNTxqW8qgR
	NA1ScHERwfK3gkI6wsrVAeOeHAjLRPf0MKUsY3FRMbbpCc60pxYGFDuEghEvcDCkjiBnVGWIcRg
	jH7fJkSTKMMs3qAcK6wPISk/RIJkIKFl/4tf9JPLW4LHqxYH1qvZoIxy7bZyqzGUhspvnSyTeSk
	I670S2Uhz9R4ZSn41ULaM9SRf7tIAU4U5RkybG3FWZoSY+sDsnHFXKwKYnwR3KqNzJwjVi2N0/L
	gDqjnw2CeuN+s+8bpnxh5JlMK/bL4+AH4oUSPqNRH7Asymll9OOnwHp7teUWlyGvXepgbiiISQK
	r1KrKiizMlzSb8EHKSqsd0xxOMPeDq7Z2nKFjBW5wL7w/GDo/OQ==
X-Received: by 2002:a05:620a:f05:b0:8ca:370a:3ac4 with SMTP id af79cd13be357-8cbbf366b1amr1806677185a.12.1772444560642;
        Mon, 02 Mar 2026 01:42:40 -0800 (PST)
X-Received: by 2002:a05:620a:f05:b0:8ca:370a:3ac4 with SMTP id af79cd13be357-8cbbf366b1amr1806675985a.12.1772444560194;
        Mon, 02 Mar 2026 01:42:40 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:31b0:507f:9cb:f026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c35910f1sm228176655e9.2.2026.03.02.01.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:42:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: nomadik: repair some kernel-doc comments
Date: Mon,  2 Mar 2026 10:42:37 +0100
Message-ID: <177244450137.15436.4249127441499124623.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260301014811.3133250-1-rdunlap@infradead.org>
References: <20260301014811.3133250-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0LyoX44gOFfYV55eE7BnGnev_ixVs0KR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4MCBTYWx0ZWRfX4XNNvn76je0F
 qxnE/KO9aF4/UDYLjUnxuMK+lrEfSz+L0SWGokwfjHoiEn/fplW5DiDhR+zpVPSNRkoWnsaXnGs
 N4tkjwp+wHv5N1hricmuWvb2Y5TRnoPei2aJFBgcyDLgXcKzrpyVuYCC3XLibUs74yzRTJGOmn6
 HvkRTf99BpCXGRSC0VdBrqxESChYG40CVlpdsO2fYhZVfnYbNHahiajxRK0IBJHerlTLSbbJ2hF
 NARx5k6Tqci1WQj2f5vmhOC67D/OPdP9p/zMOR5ZSVz3V69Z3XRj9O8Kb1zoaIPbaTSSQTRG84c
 3kLcQsaoDGuijCROHxDXaxhGrUnz0ycGMF5Qi5WoYRyJ4rGjrZsUzwWSakVqWs6KQ5bm4Kx1WbQ
 RATwoa84j7uz1Gu3AHL6H9d4H2qABBVGiPtMQ0WCrhCtnW+/1iqxog4XIkHqNjOGhd2tgyxYgi1
 D2F96qDPnCnXVBrdwfQ==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a55b91 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VXDCgYNSHkTYBlPD57wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0LyoX44gOFfYV55eE7BnGnev_ixVs0KR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_014242_835905_95635189 
X-CRM114-Status: GOOD (  14.93  )
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


On Sat, 28 Feb 2026 17:48:11 -0800, Randy Dunlap wrote:
> Avoid these kernel-doc warnings by:
> - adding short descriptions for enums
> - using correct (matching) struct names in kernel-doc short descriptions
> - using the correct struct member name for @nfunctions
> 
> Warning: include/linux/gpio/gpio-nomadik.h:116 missing initial short
>  description on line: * enum prcm_gpiocr_reg_index
> Warning: include/linux/gpio/gpio-nomadik.h:125 missing initial short
>  description on line: * enum prcm_gpiocr_altcx_index
> Warning: include/linux/gpio/gpio-nomadik.h:146 expecting prototype for
>  struct prcm_gpio_altcx. Prototype was for struct prcm_gpiocr_altcx instead
> Warning: include/linux/gpio/gpio-nomadik.h:156 expecting prototype for
>  struct prcm_gpio_altcx_pin_desc. Prototype was for
>  struct prcm_gpiocr_altcx_pin_desc instead
> Warning: include/linux/gpio/gpio-nomadik.h:212 struct member 'nfunctions'
>  not described in 'nmk_pinctrl_soc_data'
> 
> [...]

Randy: please use scripts/get_maintainer.pl or b4. I don't always go through
all the patches on the mailing list - I expect to be Cc'ed explicitly.

Queued for fixes.

[1/1] gpio: nomadik: repair some kernel-doc comments
      https://git.kernel.org/brgl/c/189645ba9cd9c1eed45151aacaae4347c1eb86a7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

