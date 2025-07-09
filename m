Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2E9C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uc92O1GGv7emWG1TYEn9fypVsBaY5TnEeVaY/0T7/w=; b=e6BEALsg0J9yoNdMuMTlD3p3Gf
	zqjjvV0gW6+OREXVmFSxDUVrVcJPP75xAee1JQHE4j9/WSbRVnAHXhjvE10frJrPCQC9SCE2GW5zI
	qW+M8aUe+Tsu3jqQ+IxwbcRoGKs8L153gUZmeY/eA7provHn+uMhN8149XDtjoMI+lX7d07+P+2vt
	xr3H4YEEgbG6qJum0/yHgY32DzrNyMp3xvwlLBM9oVIWfU9jZ/3JnhJ5FztJCfRZoiUooU/gkymUo
	+zVbykYkqmZSH+R9lLpzJqcvsfeORRcNFnutx/WZpMyjEHdlNmnHcRIdBpP2YOBLC8e/xDFAa+4br
	o/lS6t1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoV-00000009xz1-2OJO;
	Wed, 09 Jul 2025 21:58:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZZ8r-00000009VEJ-2qHk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 18:03:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CobA9016471
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Jul 2025 18:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uc92O1GGv7emWG1TYEn9fypVsBaY5TnEeVaY/0T7/w=; b=KnupimiL4EZalts1
	9iEjxmVspLViNkxnTUsyCodjfZClzaw3RAAZ2hh6QRgRGnyn1GoKdQZidsvNJHYN
	Z7/VxAuaKpUtt74ZD+sV0H64fNlFc5S0Yd/FPiazPMl/e0V7hoqjbc5cJLu2kySp
	7XUXkBuvInznLXZjQPSYeQDgGitwILYrSCJRWt//urOBqwyfdi8imRlHHWnrtTBo
	MeSHWjhAulRW7flXAk5sA6yGYoCPCxRjjtv0S25CDHWIJ6+uRWzW4mTr47k5zDpu
	9GsTKJHcr+xuVJte38F/oNEiHARwn1Tmmpzc1opgSA8fRa0kksABdaEGanDNpou6
	KHMHmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap228s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 18:03:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d094e04aa4so3567685a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 11:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752084216; x=1752689016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uc92O1GGv7emWG1TYEn9fypVsBaY5TnEeVaY/0T7/w=;
        b=vBA0bb/INAasubMOW22NIdWvS6el8L/x0ZUI2EbGxQglWF5+dGcul2NhbLKSa8ghQT
         py/GCMpCaTSL6RLmvOCfuidp+J5YkuEswjQgUhtVbU9R9ELOnXUpqHQRsYAxqBg7rsZy
         CpUtXFM9jayY8OjwMlbRB6nUgjtUmclEXl+3KpL3vmfAKQ8MhdvNjI2zhDWXKAjTTONq
         mY70RgzjwrSVoo1ThmJbYST+FOhU9tRlBELUMgzlke12MmJI22YQybstB3SoPuxH6k/E
         iyj0DDWicscUwoCF0oy4hk/2MQJutKfgKZv87B/gdaHUnZ09g+irAQf/JwJGm8Y0TW29
         pJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFv28UCv9nKg+oSRhWejFhw5hljAhoigvUJNyeWuersI6i8DSIOUTKIzUDovaMdAWczTjth7TWNh6bi7a19pV4@lists.infradead.org
X-Gm-Message-State: AOJu0YxdgOWyTJip3SnbJ9yYGgPmPq8Zz1n8jiJCBjGyCr+My/srmRmk
	xJHaMSues677AoVqXskuYHdcT9KuV21R5P8EbXv2CMMZW4s81Av3xMVqpDDEKRangK0lodUthYG
	3cbkLQSgVIk9T4kesGIJzyfMUIc5G92a6XREY6hhXXd7PFcPOI7my4Lr2nMFfvwcofPick0nRG8
	HvcQ==
X-Gm-Gg: ASbGncvKzJtUb28NCsa2JUH7gFRhKdwS+xVLraGxK99xfou4suKnDjbYfVg+h+WqGnJ
	oJAsKIHywiLoPw8Fo/ESI8A9Rfu564lD1vBgoI/LShjfuzRIVVG6pNxbQcsCL1ZnkGzX2IW6eCc
	VhjLjVwxfm+u9CLGViR4l+35Bn/naRRQgGFsiniN3C29Nq4z6DqET2O/GGowgbnZ4bRYniBnkCU
	cAHkixOqKlw+LnFO1J7T+bl3Ij6w+CwuKcon6nEczt6MXIB1C1z28CgpYjdgX8MbFYnN+wAbAtX
	TEGk9s07RlIwQLlVi/HGvmBBYW3DivU3fg5DpbilACa8Da8AFcglPLvtm/XUcqExI7LweyL+yLD
	K2s4=
X-Received: by 2002:a05:622a:1491:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a9e9db4837mr1963991cf.2.1752084214585;
        Wed, 09 Jul 2025 11:03:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT4JbzQDFlByDuD7hy/m9S00Zb2j1K9B+NMiIKO0svgqjP5RylRzZ8vUZfB5MYmmWt5DXtBg==
X-Received: by 2002:a05:622a:1491:b0:48a:80e5:72be with SMTP id d75a77b69052e-4a9e9db4837mr1963781cf.2.1752084214116;
        Wed, 09 Jul 2025 11:03:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c80c4sm8994918a12.75.2025.07.09.11.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 11:03:33 -0700 (PDT)
Message-ID: <68dfc6b7-1083-44dc-bdaf-4fc09e944671@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 20:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/12] pinctrl: qcom: mark the `gpio` and `egpio` pins
 function as non-strict functions
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-11-b6135149c0d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-11-b6135149c0d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686eaef8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XSwnDwznb6xmaXktW1IA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: paJjqZD6AjkykeUyELBMJ6H6Hr_FzrLo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDE2MyBTYWx0ZWRfX3HNBa2r9MNm9
 RaV6PlGHaz7GEdlBrTn9U3OHJ4j9xl6OJdWDKi+56eunUU2LN/dVmGibQ968sEWl4dmPpBaT+Gs
 ZMbUil5xrkUipIKH5YScsoJbtoHc/ovvboqjJHu+zBUm3hxSPkloKGJCPUDCAi9AV2kNyFF+Pxi
 fudws9NmAsZ5wGR+t3/I/Tp2YxlJyAS48gKy7UixQqXWDVDOxWtztbNItzXgyM+qb4e3t0mFJON
 M8RZ72NHOblDe57l9y2Lu+Dp97EQ0tDWsXF/hw+fY2ZHAYnseSJee8p67A+9BFk41mTISiDZ8tF
 ZiuEzjY5pB5+8iikcb3KUglUCPIs4tsI3TH0aLYItaiThQxyo8aeCHpw1Qdkzfz6B+YzE4NN5/B
 w2FVfrmMAraq4I7IZZYdqjwi+yZUkowCvZPRF4IDTkexSUOFiF34TkCDRUqulDICg5aHgqEV
X-Proofpoint-GUID: paJjqZD6AjkykeUyELBMJ6H6Hr_FzrLo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=904 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_110337_833130_5BB97A4A 
X-CRM114-Status: GOOD (  11.84  )
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

On 7/9/25 4:39 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Allow pins muxed to the "gpio" or "egpio" function to be requested as
> GPIOs even if pinmux_ops say the controller should be strict.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

heads up for +Luca, I'm not sure how your Milos addition will
stack up chronologically

Konrad

