Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DCEF013F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i72EfdgJ7doLImzDWatjm2GnnkPEZNv7sHePPRX+J+A=; b=mFKDnglb/UGG2luHZeJQwsvC1T
	mW03wUeiWxZAsnhRAil+b74MvHIvgymKl4kTRgTAEj2iNoKgEgEqkHKeqcdZ/QrtPnKm2ks62Khlb
	TMCsfz9+32jL0dD8UKiX+rGBfabKynwYTg2lsKRpEvAebn6FzKIYo5x7BtuUbqf7mfd7RH9Zx+5dp
	2FzpsS/KHNrXlaXxPCACTMA1vSYRgdk6i04TXOXzqhvidg5E1owwlkT2oyb14B7shUJK3bUGwXn60
	Q/ZFgeJg5CViuyPZIoWYeVIqbJR+uQVEjKiGZ7nFTdhVZe8/Cc2lIf2jWOHvLdDxnlM0b5BNr32Dp
	SlG3jJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23z9-00000003blx-2DhH;
	Mon, 16 Mar 2026 09:11:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23z7-00000003bla-1WVi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 09:11:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64gHf663080
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i72EfdgJ7doLImzDWatjm2GnnkPEZNv7sHePPRX+J+A=; b=CWfJIxdn7icUCxum
	1Uo1mlsWgJOsUfxnavJTE9oKSTrDTMVTrSI5u8SPiPfdZrXVOdsvcJ59HAH8WSQg
	y4gvt86Dt6P7LBcZsdu0ojBD+8Ik6jPpTjEF5JMWHiV7tx26E7zaUDSbVpvbmFvO
	J7niurtpXHJ3VuTeOdz4v+jSY02CPsPKRhCYAtvBo+YEyE8vJaMQvbKVPkSNrxnL
	W7l7ROrpAc2qeO3W3hpqqbkDej0UnDO7yXDygEQWCwsFtTCEYEqgLZnMjEqTnRQD
	Owmxo0+Fu5KuaYCmPWFVVrJRFkh7JYSGjdf4GOop6mBqQK/Zul9lPsW2Q2yF9Drv
	7vIdaQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043mxth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:11:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd767c51efso487135085a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773652294; x=1774257094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i72EfdgJ7doLImzDWatjm2GnnkPEZNv7sHePPRX+J+A=;
        b=QON1OAEq2/OCSxgbMWc5U8ToyXs2pjpY+7vEYXPp8mFuXO1cWV5qptg857EFPKY1aB
         HU/NBaqAjVdNxJgwhqLhCuLi9YPQauR7/feuP8JZpbtQFVxLpx4FcplPnaU366TkDBd0
         d2RrkrdbNj9uz01FBsw6KR5R0mQxJyULj565CrIexB2upXSDoi79PWhBDmxuknsenAGK
         k+bYrWDJmN+YN+7diqJllnI7046uKpTQELauVDlLcMzrskWL54iTQNatHpPII6p5erAK
         IUnf3mZQTAD5oVnQuQwcQCpvV9aa0+5DjH/q8yOtSfOK7U9vH0sZgf6ea8MufeF41b0l
         LUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652294; x=1774257094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i72EfdgJ7doLImzDWatjm2GnnkPEZNv7sHePPRX+J+A=;
        b=EutyflH9Rokp7fm8P4DL4AxLd7bgc9IdPDreweWS7x+eZf27iB/3fclH9L5UX2UDsT
         AyuvSunyifwHGj5yzezJtajTesqXCilCeXHenglqhgozsWUGGXp7gN12WKYqvMO7Wt9j
         SK2OJ2/nJXfu7RSFYrs6uH0cVvmPvl8l6eIcwPOSLb0EtIcBMmXrlkGEf0Vnw0Jrmja4
         cKscXK05mKzJdoXdzH4F7GRVftk5G/8IXkGaGl8tJW/11S+QcWhho6u6Q61CptQbk8y3
         aoHjWGwAzowI4yuCYnUC6B6J5dgSe2zSvhliaYvSlZnDBiUAcymYRx20aQb0QIR7SOOS
         1lrg==
X-Forwarded-Encrypted: i=1; AJvYcCUDLF9yhhwwYvthR+gOdLDJakPvjCltJO4yT5s8SQJUJFiXGum83+Z0S9XGOhp/G6eofXsr+w7NS/qGWv7EiWMt@lists.infradead.org
X-Gm-Message-State: AOJu0YwPxpnvJ+VPr55hQnozJTR7/v1cVYEUuEkwIDJyAL8MfaiwWsUK
	eS/cj4uF60+RQ2AIY7vF6PTRc79K7o7Ns+5x+kSKWqKVd82VOblRmENgcwtQHqRIWHtXAeyyZYv
	hLXnGRBApjmTz9tHtH1f+I4M3dME59qywTCXldqkqbjgDuRhohoWQWXYNXk4KTrZ+4GCJW4h0OI
	9eUA==
X-Gm-Gg: ATEYQzxS+5VA+z2Olf5b+fjJiePtjV5vBX3f435LvA37QY46facXVNvcZsRqRXqJ694
	JP4TZ5YpQ7OX4pWX/fFFsIp5VCpm1TSiJkm4laAmQ+7+EvRlz76hrfWOzsqMNvyaGm3w45Vhm9H
	lZPT1C4x/Vxna75PWqIsK2daCoWzd2tkTgU+p1yZD62DR3f80roCCZJuNW9EhVq5HTun8lPMVwV
	wUTSJWhdi6uZlXP+SqLCPeTQUunxhvxYWfqy7iZ1hgvR4Ef2T6TOiVCvK9gdB3QLtxGOjZgZXB3
	ob+lcuff+LpWSRoupO7I3qtlKxzGAgUvYADRl7SbxuN/RoBg1yxUEbGcaKT47u6OJVHp1DJ5XxK
	8bndShJVoaOUAJDYccVEiKBsi04ri1DSqX51Wh6RhFndrv4eC2YQ=
X-Received: by 2002:a05:620a:44ca:b0:8cd:79f2:dc50 with SMTP id af79cd13be357-8cdb57aa4a8mr1434710585a.0.1773652294427;
        Mon, 16 Mar 2026 02:11:34 -0700 (PDT)
X-Received: by 2002:a05:620a:44ca:b0:8cd:79f2:dc50 with SMTP id af79cd13be357-8cdb57aa4a8mr1434705685a.0.1773652293841;
        Mon, 16 Mar 2026 02:11:33 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ba9e:e504:fb0b:f1f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b468cf785sm2932198f8f.12.2026.03.16.02.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:11:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Frank Rowand <frowand.list@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-doc@vger.kernel.org,
        stable@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/6] gpiolib: unify gpio-hog code
Date: Mon, 16 Mar 2026 10:11:20 +0100
Message-ID: <177365228183.54363.13735316568548509348.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
References: <20260309-gpio-hog-fwnode-v2-0-4e61f3dbf06a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MCBTYWx0ZWRfX6UvfAHfx/PsA
 9Z93GZam+0yJ2Zr2cc0NzgZRd2BUXqNPCcklRFn9v/dSXx8piGuXxv47FUHzRFbjYhF60zPK0JD
 Q6B/CmQdeI2wpRLjhvKUHxX1Y1jRexkJ0HxfpcoMAFKDD92B7kFjuHRcUf3eRgL3gsYDLcjmnou
 HvO4tgWezwtyuaXJniClPCiGOAjZla2HeUuOXTE3VRR6CRVUUax6uAz6p+2sCteCMlMlO446206
 heO4Msc8n7jaRFOFRzOF8AOt/gCKCcV4w1t6555J7ERYTHG1VD0lJAzt5mYQaoI61I3DX9NP4ns
 5aUFR/o3JBsn/g6/oZByBxWe9OjrwD82vlrlldnvSF9Uagkqae+N0YMvCHVaSnOX4oya05lq+LP
 iamWtTlAxpyQOppilh+rKPUa4PYgfL5mQ8jDvc7wc2c7DuxLmGypADETNkEIPKzEnYHozoxYVuw
 WVwb80+AXflcdT3f1nQ==
X-Proofpoint-GUID: Q7jDClzr1wxsKcmaP2L0wyukiYbNOm5K
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b7c948 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jtPpctr3BKvZZnv9HkwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Q7jDClzr1wxsKcmaP2L0wyukiYbNOm5K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_021137_460488_E5197E86 
X-CRM114-Status: GOOD (  15.94  )
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


On Mon, 09 Mar 2026 13:42:36 +0100, Bartosz Golaszewski wrote:
> GPIO hogs are handled separately in three places: for OF, ACPI and
> machine lookup. In addition hogs cannot be set up using software nodes.
> A lot of that code is actually redundant and - except for some special
> handling of OF nodes - can be unified in one place.
> 
> This series moves hogging into GPIO core and bases it on fwnode API
> (with a single helper from OF to translate devicetree properties into
> lookup flags), converts the two remaining users of machine hogs to using
> software node approach and removes machine hog support entirely. In
> addition, there's a patch extending the configurability of gpio-sim now
> that it uses software nodes for hogs.
> 
> [...]

Applied, thanks!

[1/6] gpio: of: clear OF_POPULATED on hog nodes in remove path
      https://git.kernel.org/brgl/c/bbee90e750262bfb406d66dc65c46d616d2b6673
[2/6] gpio: move hogs into GPIO core
      https://git.kernel.org/brgl/c/d1d564ec4992945db853303dc2978256bce8c0b4
[3/6] gpio: sim: use fwnode-based GPIO hogs
      https://git.kernel.org/brgl/c/5cfbd0eb784f19436b5d5a9a7e0dca862619739a
[4/6] ARM: omap1: ams-delta: convert GPIO hogs to using firmware nodes
      https://git.kernel.org/brgl/c/e627fc9fad93d59765dd16adac1b2a9bf68d7523
[5/6] gpio: remove machine hogs
      https://git.kernel.org/brgl/c/dea046e7f46f2357124a465e058c92cac3e351c5
[6/6] gpio: sim: allow to define the active-low setting of a simulated hog
      https://git.kernel.org/brgl/c/696e9ba9a3da3d919d08a1abf05c9288311858f1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

