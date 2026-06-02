Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9503CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkIXV4vwPm6C3ZiF9q66clWGzHoKyEfJVyhB0Lu09Tk=; b=Iv3VGcF8OFy9mntF29XLXimxTA
	doPyYacuqmAYVAmmrdQeWyzggRORL2PbvgvyppLUKkUuGm+ug7l8Pk002SfddyyoeRvEEN0XYGOue
	aDfV9oczRgtntl24E64FPWxw2H6lsrIPkqUxYZmq186ApzrqJFnVv/iynRy9JA7fwyRzMVaNYTaD+
	TzLiINzCLlaMeFJmkpiXeJp5MDdXE+vuAgms0Q8eK3BY8NlvY9vddm989CITJ2TCFxVokOXKESvys
	ngNaPN002ihPCUw6fgSte5hXYkXx2IxVoyRQEIFWgeS8bAy48H6f5sfnfG6xYbfG5YdxyAoIag5pK
	U0MY7cxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWMF-0000000Dnxp-3OnC;
	Tue, 02 Jun 2026 21:09:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWMB-0000000Dnw2-3Zid
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 21:09:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652GvGt71937441
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Jun 2026 21:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkIXV4vwPm6C3ZiF9q66clWGzHoKyEfJVyhB0Lu09Tk=; b=k5kPv9HfnQHBaM2D
	9trDxCOY3rpRAJ8HnKK2a3pXchjDIHY++OnqXdxBbRGKZGqnTODdeH7ZcUVS2w7k
	iRAHUFdzscyWfUT4HaSWh6SICTiJql0d9RXBal12p0MdZ6YVHYKy0muv6taafpjr
	EwJkAZCY9XCvndhRpxdkqMNmWHkNP02l0y2GEWDGzsipLpq0muaGr71Djzz+J303
	GScODQDuGtJvLOQ0JFDrXNYeE3kJRdm4tHnZxAQ31jZgKdffUiq+yn4xqxI/IPYu
	7G87PuGDcCHpAMhhYdU/Y4rDWyahujB/degzUAz6x+8efvK1HonAUGkJxBV/R+JG
	uEE9vg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehqubm2vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 21:09:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174e8642f5so62610181cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 14:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780434542; x=1781039342; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UkIXV4vwPm6C3ZiF9q66clWGzHoKyEfJVyhB0Lu09Tk=;
        b=a4JsRsgd7uS6MO+VW6yS2n/no7nOMK961hOmCsntJuEPxdwi4kV5rkDjYf//4EczsU
         +qaQn32dNahlt7vwHf1STIeZOXIJC9aTD/etWKPWBZ2Cq16Bp7IVWnIPUIerUtst1usQ
         gTHtD70cfxxuQ0hUiUuNO1C2dk1/JIntNhYFAKXyTE2vDtXG83+A/EwPEUAq8qnuBVDE
         Xi9nKMD2zDhAvltjxa2E8zpls7iBKqljgwV3ujydXLhK4BnGHaURUyrpO0YG7T0PuGe1
         GjXqI5REvYsG2BvyMehlz1nDFfsrC5YSnDl3i2y0wI/HjsFg4pnoRaxCRHKgrJEwEcp7
         ON1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780434542; x=1781039342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkIXV4vwPm6C3ZiF9q66clWGzHoKyEfJVyhB0Lu09Tk=;
        b=Vg+7+CMQBgpgQFRi2lskOF1V/FkssddIhB6Zy1xDtg/vIT1wfJzCUmKFfXjnlaGeZD
         Hwa5rHp0rqHbhOG8cEzaQEWD7Zzu8RYoR8A/4hsc4Sk1yLLl61u6ZvWDV/kCEa1Zo3ou
         dH7xpkt4xIoEL2xZ9rIbgUPlyd9Ai7Ip73ibKYfCQsxn3wpk3YbG/Q3aBK+eNbxysAPU
         kZ9d5hvy/7n4T4BHSGblDdlTg3UALVx53UCG+X8OdaoscUgoykjwj6vBq0FGK+wgi9GH
         gx/aEQ6slmNsDmFqkJNjUTY3sflsy1LV3lAQh04VBj6XpjFbW+WUcwBKGqSe5HJ/bqPG
         dbXQ==
X-Forwarded-Encrypted: i=1; AFNElJ89qCCTuw4RHg97D214hgN2Ww8l60tyM9SE38X4Frh5/GIPqyog4LE/MQppthuzW2pZ1DnXgmNcKZe+q8KpoyB9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw34yRk3/3URwFW6Eo17L9GLP8GVByY3QiS9iYk1nkZBwtPr+L
	u/B8g8ufncTo9Hc3d6hYCMS9B2+3Z8AOxiA0p1MVAFxX/th0U54rk9l1q0r2sOYwFKfq0y64bv1
	kYrSVtI+zBdx2W0VhAyZubY4cloXUA++nvdpK5kxES5UYXVAj2On92WLm288oWrNW4a2JRdSN1L
	/fYg==
X-Gm-Gg: Acq92OFkFK3v+0YkSos45kl+yokXzKU/gbCjnBhM935XXj5qxibHgKmrJ0yv3OMaRYZ
	UiS4dgk1rMCDF0WWl2+D4BNhO1BpyuIxz7bEdptIrLHLURTGerOFyVdAx20oLzh+u1xlo3QqMRz
	a1bMSE2tAk2To43UJu6D6GfRJlGRm4BKYaeZvaDd+p2dQ2gyciPQ4lsRZPesrfrGlVuuRzlz6d/
	UiuHff1Jasz3nA8Z0CLIoeLjobpoAd9jfXG/AWTjSf6UQDhm8/xc4up9fjEh18Uo/F+p4zSLACV
	+VkjLGDf6jhVP4xlr1UcLy5cAh3lbY2rEucF1Gm2wPuKQ60kjfrzL0KcG33/ofW0hQUeydJoN26
	BbxpkbVjYcoBxyaWtCBU2MB0TUz0DKNf7b+XD/ZEwpstvXGPoiXUiYuFPiG3577bHsukNn0uII1
	F/
X-Received: by 2002:a05:622a:552:b0:516:e31a:1a6d with SMTP id d75a77b69052e-517787a4754mr12505241cf.54.1780434542263;
        Tue, 02 Jun 2026 14:09:02 -0700 (PDT)
X-Received: by 2002:a05:622a:552:b0:516:e31a:1a6d with SMTP id d75a77b69052e-517787a4754mr12504821cf.54.1780434541857;
        Tue, 02 Jun 2026 14:09:01 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b614c5easm1957675e9.29.2026.06.02.14.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:09:01 -0700 (PDT)
Message-ID: <f5118303-d7ea-402e-84d6-794d6860f992@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 23:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thermal: amlogic: add missing dependency on MESON_SM
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IkZur-Xk3DRaTbq_pGMgUM4iJLRNnDCn
X-Proofpoint-GUID: IkZur-Xk3DRaTbq_pGMgUM4iJLRNnDCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIwNSBTYWx0ZWRfX374fUkQBCn0m
 r+pwL0D99rpgKAFmCNT2Q38xKiucN3547fWOx5lw49b7ub3QU2/tgngLy9XJiRitiCieRTz+3yw
 6zDA2P5ZKX0P/Paalba5ErjOJjQ/sbDf09GFefOhMy6i4sQHiTDyCUlerx+SzljHWtFBf8RPNaE
 rLxTLhdKxQ4nCZXo8fE5jrj3b7yPz5RLc1v3JzZqUP7ZTO3cfl/IhoPGT7lYNcpzulcXfHGBCC2
 PKvgbba95qIP7x3uMYnIcmKm+PGl9BFJM1i4R9v+/KbUdZBXCotlx4Px16mUMXMSxqz8zwg9Dwu
 SVy1RbLBkP0S7tTmQD77tY8XCDXma5uPJDVgbVT4Q1D6Lh/b87dUP64KLFQJi1w5Wvj3WiRkuoQ
 74QDgE++eoBcDKh15Uy01c6Wgo89HGDlYcj9reUKhj9gQQNwrpjIVuwFactFWZYY7tCJCuzgScQ
 MoFKROsAFFXKcCZrSRg==
X-Authority-Analysis: v=2.4 cv=FcoHAp+6 c=1 sm=1 tr=0 ts=6a1f466e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=ChcGN87QxgZRVD74oVwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_140904_005814_92D3C1DF 
X-CRM114-Status: GOOD (  13.24  )
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

On 6/2/26 16:19, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The amlogic thermal driver calls meson_sm_get() and
> meson_sm_get_thermal_calib() which are exported by the meson_sm
> driver. Without CONFIG_MESON_SM enabled, the build fails with
> undefined references to these symbols.
> 
> Add a proper Kconfig dependency on MESON_SM instead of relying on
> stub functions, which makes the dependency explicit and prevents
> invalid configurations.
> 
> Closes: https://lore.kernel.org/oe-kbuild-all/202605291530.en7aGn7w-lkp@intel.com/
> Reported-by: Mark Brown <broonie@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---

Applied, thanks

