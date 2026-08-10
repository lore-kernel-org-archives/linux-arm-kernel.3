Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB96C5AE5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=; b=WaQB5IjkpVRWePCfVxrtteBfGq
	3GvrWIEagLQarTwlx1YpFgXteUPRru+/unljF0Z8R90i5OhpFAJgXXyRO+8CcDgA4Ob8SCo0Y5Gzb
	XTKbw5YlSG34+CP6CIeZrdJKsy4Lev8iP886ItY6A1AlJBWNpZZzF/Dm813fhAe7fV9UdjZl4kPI6
	AIWOL5PKQs4LCtDGJXy8f2iRok2lnwgcamJw25wGsnHV0KCHhICA737HUn2rM4QdXMlUgIYJtuWYU
	awe7/jKPC1+iQtpdQaRJLvSpVGjsabhtfmgWLSlHoBoK0cG0su0OHgTNAu6x1xmPB1WV/iTXF/1Me
	lr3U0A4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNfY-0000000BYbB-3xWV;
	Mon, 10 Aug 2026 10:55:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNfV-0000000BYXR-1Pyf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:55:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SDKW1119428
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 10:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=; b=AgdRiiberGOg55TN
	bPt69zq6B8zegVZPLUoLLcCMzJ11uypxFljHA/ObNfcKDg12Duhm7J9DINSktu2W
	QoQIRENx/PSgRcfz3+pxdTRVYEcR+uS9FmAFaTcbrV12TIqTL9UoiZRst8CvpPXV
	bxT+MvmHJZ/voLcXoVboAxLUV9mL1ybQPKC4mW2l/DBC5W25ht++Z7dRhC7xxHgn
	Ao+t1DEZ5k7G8o8Vc6TE5Z4PZSVU63bF+U9WoR500KWpbVWFEKe03muGCEg9jhgt
	Kq3nNrkrBV7ufy08V4RDFUnxi9wZU/KokRbLiP1HqNrjrSRmU7SiF8W6itZamYun
	xJcfsw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6s501-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 10:55:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-907c59bd73bso32507916d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 03:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786359343; x=1786964143; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=;
        b=KE1PEaTX5q2lgasfqTHqNuthTQWgt6ik23jn1SlrRY/r8YWwpeLAOpyvBKS5AjeqBo
         UbcvL1oO//DRXeSRjDxQYuhT6rJ45QPZutO0+GCR1qGS8WQCtP3ONiA+N5kRP6nlHQog
         JA0MDj8l7yTCw4a7hXRpHPShsXKdDo2OLc++fcLzG2TgEmOUkQfB+VIkOlOCjKBKNn3b
         wEk8+117wn6pwc15DYjvjSuH9Um8HKWgGImxbebl2mToDEw/Ddo+4kokROX4bfAizbBU
         wMxqqolJgck9oPSNCAnO1qfMraR4BnxsF64S8H9vg9tJ7xM4VAvjOZGEvk6Y3SBviMQW
         tm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359343; x=1786964143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJ24BqAEJPwzbl6qff074FZZsCu3Ipow58eas1iNjro=;
        b=o/F5eFCrxaRgEScmCHL840ptdm7La88hINJU48PUBKfD9WIAp2h0dvqfB5pW1wWUUN
         fq71ZOPX0dcszHvzXUOlItGXWG3Pc8dio6oD0Iisdoe06ggTwMKoEoB/Fc/8RQ8XdDHY
         5HFRlcAhJ/kVt+H9Vsh/A0pSiC8K2jLED6n6B1Xe5IjJIgCP9Whf/M4+8TGrTN9hvGzo
         sfbZBHAVvocbVopN7RqYmUJFIvo2riHyj2mdcPuO4ZNmvfu0+jf4kXfp2BCb0FZvzjCj
         kgfyHodRYR+Kq38I4fqJejm2sMWMAg9NSb7mF7WgS77goFaQkJ3vAO6woekFr4I00BL0
         m/bA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+E36aD3SyePgGVVEpmLT0FD6hTNcEDyelhpdFF4oAQGYZQmwG01Mll9pmD5jnKg2UBC9S2yHIod5Om2KBREOC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpbv0EwoqJsG2brmP9ZZxbj5szPcqK6AiuDwp3GDouhud8xMsZ
	jkrVLmI+qKIh2QQnpsbzdObtswYTshg54nQNvobBmdn/+P4VXnFgM/5k+JO82hFEAhJln/cDkQN
	Erc27TEfm6I+tNyXLRLuFW+SIORJMumXRJvR1iq9d4TQ4mn98Pj363rBP99CUG3TqdIyclQlQ+q
	In8Q==
X-Gm-Gg: AR+sD13lbMyvKC7DJWnS4BPdyOzhcVheJllLhKHvv3av0Yj/flwZeIhos00n35VLg3s
	ttUFV9R+/wB/Wyw0P4RJgDtmV8Lly95TALaWONzhxPUXb1hHPqOVf398UHNfzOecVF7RiwhvWcn
	T8Ivi2FWglf9ls2iv9DTOJYAz2azjbOEblShLfffNJUudG5SKWfvOuhPVBic8m/EH2qkyV9pF4T
	62VrEOuSBrmaPm2/bBohUeEEPbmXcb+//lph/Nyczc+o5B+CSmGY2d6d265fOrbylo2rzYzN60j
	t8FFPbKaNiZhxZkQtUVYYhRvC/uAW4VFt5g9k3hZw7H4f5ykTXwb/+DWpcSqtB1nmRIe1buxE4f
	G/w344HBI59a/NLG9L19Mzhy6GAw+
X-Received: by 2002:a05:622a:17c4:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52d0b298380mr320953831cf.40.1786359343493;
        Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
X-Received: by 2002:a05:622a:17c4:b0:51c:1fa1:80da with SMTP id d75a77b69052e-52d0b298380mr320953581cf.40.1786359343166;
        Mon, 10 Aug 2026 03:55:43 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfa2:33ac:2282:82ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdbe02esm196322575e9.1.2026.08.10.03.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:55:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpio: Use IRQ trigger mask helpers
Date: Mon, 10 Aug 2026 12:55:39 +0200
Message-ID: <178635933666.24478.15558797954868182509.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
References: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5NSBTYWx0ZWRfX2WY2ITmj9hKH
 McdlEkTrHgYc72dev/Fd52QrPtZIxaDBLqBaCoU+lFtK4J6zWu/NlbEXNtUPFPjrRvL9upcHNw2
 CYDy7e13pj1DeqJ2W1lOeya2/7s3U6s=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79ae30 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qRw7KHR_QVJorHy5iXwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5NSBTYWx0ZWRfX9gQ/CWkpVTAQ
 +eX8FJzhYg4XU7Ocfwk0mmuLYqLuEb6HvGGf6IulmQrX31hHVJrOY/rnR6W0pJd57YVccxjq6jJ
 k3+i+lCJcuwmRWU4HYREDkZbczupISqzyn+90nhdPpDVa0TnLdO9DSiZqVa2hggNNolcZOFlUx/
 zfSvfjH3pz3fQnGCmuDTB0cnjQ/5l+QQWQtDT6sm3nY393gCEaU+4+nJ3IIkyh+2Pp3JhooRUzv
 1Cbo2RpcdKzqGeH7vekHLyw7tZrdmbxmte1DL/ro2fcGGK3Y8AEbaK+v66BHAVcNp/9lsNpAksy
 wnfa1NsBUhZA9VU1NUhdWsR7Rc27Fs0wbgmUzW8iUsrsjqkcPHJhkPBddi7FJ3iqGNvoShgpSV8
 1lGKDKWpFKGt9w5uqUgs+lyF0JptcU9JFBAtAz2WG9WAK9Zotx5TiOBR15eS0tsH4a4qra+Qrl0
 X5pKp/nfS/dNhjXtH6w==
X-Proofpoint-GUID: 27v6muDXJRCjYtVrRf8GL2A9oLwTqtNr
X-Proofpoint-ORIG-GUID: 27v6muDXJRCjYtVrRf8GL2A9oLwTqtNr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_035545_485799_435FB924 
X-CRM114-Status: GOOD (  10.90  )
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


On Sun, 02 Aug 2026 19:40:35 +0530, Maulik Shah wrote:
> Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
> trigger type combinations in irqchip callbacks.
> 
> No functional change intended.
> 
> 

Applied, thanks!

[1/1] gpio: Use IRQ trigger mask helpers
      https://git.kernel.org/brgl/c/338c551bcd62ff4f97ff02359baf9d6f7f1f9fda

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

