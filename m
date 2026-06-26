Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AE8CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JL6QkyFsiaToiUkSApRBS0AsrnA+UtA0FCtB5uyugqQ=; b=3zySm3MEv2xqn5w7bzan3Ssplq
	48Ze9Mf6HSYvJpwlDsDBU55jfbrace7Gr2q6qBwPImpbWIg1QIqHTP+A5jxnZ4R6FEhnPaI6sVpeo
	op0Re+FNMZkpp7RaAoRQDuUWge9ZhhwctVYcwATxrN8n2tVs7sMIoM5iWxG4WKMloBVGbwZC0AJM8
	UA1MT2dQBNS3ChHvDlBtCqYwbTKFouJSP2CF9ldytw+4vNkR6TpBjulLvmcphuYURRFGHt6IgJarB
	BlcTrp/XRNIm/1I2gkX+eOsEoJ/ov+7f2HL1Py0d1aPKECQPUOO220RLH+ZKPGP+Z30l0hVhWSTzv
	SAXCkqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1TO-0000000Ak3s-3XAd;
	Fri, 26 Jun 2026 07:59:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1TM-0000000Ak37-3EXI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:59:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VZTe4129685
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 07:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JL6QkyFsiaToiUkSApRBS0AsrnA+UtA0FCtB5uyugqQ=; b=QQ3WcdOpy8FX1X3C
	ViS9CcO4FgYSgsCf+1zcQjsWxCxf6MSUyV6p9aGq4i5kW0FdTUFCBgpLq5H8pbAb
	v5ZtjlFgBJSgcD5cTzkSR2Cqwf7EPJrTOJt1v1sblWWVDdWlDyA8WEa/C44luVbQ
	VihaGly9is2RSCxRWhwONyTuV1L9z1UX5YWAQDJWroGfertabn5alKfsx4bIcX5g
	r3icvzCKCyPrkyiZe3G1b0Crw0pYaCUBCyygI5MfMUuUuEkjgJsaK8Tv4KxGmA/0
	UQdJzxuCVHE+qRAF5RMcMAA6btGmtwDusc6/7lc3jC3obEkIaWJHmoqKSIillsXS
	Na7hKQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1j1ngxve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 07:59:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92229624a71so133040185a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 00:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782460775; x=1783065575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JL6QkyFsiaToiUkSApRBS0AsrnA+UtA0FCtB5uyugqQ=;
        b=KOZArIrFOORtD1ogKd0WmsyCXk2NyrdOcf9C1ad7KEhGJ7xFt1FesnNG341YxnMu8O
         JCcb44cnvK83tyl8v2A7ehvbRMg5SmXt/tQDMK4X9CgqAHyj3FGdd1WMX85zbpl8RgvB
         mmwsT87aPqMcAF0ebs+NV/QGsMfyxjefq9b1dcNi72Yfg1aE1jUGqiXfLp0wjBmqTFAM
         ES/VYBGsR7BP7SRngzxbfGad/G2tflJv6o4Ncpo1CSXLafH8KDnW2TIuVNOHhZL0/7F2
         FVIdbZuemdA7HWyylZQ53d+vQBpT3DpDr5DFZd9sORJ9dz4kdBcGXC++ga7qHHRdECBq
         OZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782460775; x=1783065575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JL6QkyFsiaToiUkSApRBS0AsrnA+UtA0FCtB5uyugqQ=;
        b=hFicuMvX4JWYp5nJKlc7xWROzLhYMRIbLt8nRfTe4kXspoYx31SnKDxk47r/21Ku6i
         PEH/mfjuWrvgJcYeHerNbSw6ZE7Hpub3MwnFUk37YZejS4NNIvIhp7ueh0jc2ARR9xSB
         bOs5p7ygj5CKMUQfDMyAHDnguNSJHgTEu37uQrTXoiU9SzraGTxWNwMWZpVIwwfrIlMm
         HtwHPbxf6LBmHtp2NmsUEBjEOMd7/jVsQRcMjBwv1b5Y2ds9MOpDsKHnmZrE6MvKzrcM
         CFk3OI8xNzAxh28zu6MrYzGPO7VdVJkFbvQt6qN37QCCTXdkmU2dNxtMTSJIeaybAli3
         iUiw==
X-Forwarded-Encrypted: i=1; AFNElJ8v6sY4jy3eBN1Rd69hu1F1jJY4npvgSXXowZQFUQa5XEtZFMFPUWkoeWlnXrHk5qktAYJ6nG7gwF3s9Qr1RxSN@lists.infradead.org
X-Gm-Message-State: AOJu0YxHfYtsOOGbvVig3IUlPUsGAiGvNDOCKfdCiESxM9HNRLwytuBc
	9ydU1zcLWEWDioEKGgdGDuSxM4DGml8feA0sIDeXD/icgRC+zo/0SyXFOLxoTxZAdi3FvylZfMs
	EyxfIJPdakTEZqS8cPPd27MlvqBKeIvGF2LF1bX2ThpwnJ2eBdQy/KvO+KJSYdLm1bxXvCbwJCG
	X6zQ==
X-Gm-Gg: AfdE7cknxxWaAr8R6yq2Ho0a+PcQ0d2U7OQ66F3/ZdBStG3P/cYLXUBWZrDHO77btuz
	rCQu6YH5tb/2q7baysg8iGcVa23GFMKAzsYf9q+eViohBDttatZ4QYcXoyL0nVBdZ+fDKEK/S8W
	S6mDqNeyA78A31HgH1h1xI6VfKZ3P+WPWjuqj3IdsSok6zfDV3LtVK5OFLqFJ/y1EGJvecbcjGY
	SIjW7wGXjW2y6fHrObZU+Tg0fH18h0cZwuXO7JxSR2sLqjS4wvfewPg4mEjSVflMXSNgnPmx0A5
	LRG6ZTPbMex4LYrgsiUDA3Hgo2aEbXSdnywLvrAi388pCMWTtvd1ZocbWrJKgAPQXs03myyPhtz
	cNQebab5Ozry31qnrivsMKzJkGRKFQsMvKzQDdVs=
X-Received: by 2002:a05:620a:45a7:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-9293d1b5483mr919786185a.54.1782460775399;
        Fri, 26 Jun 2026 00:59:35 -0700 (PDT)
X-Received: by 2002:a05:620a:45a7:b0:8ee:eb50:4f51 with SMTP id af79cd13be357-9293d1b5483mr919780985a.54.1782460774858;
        Fri, 26 Jun 2026 00:59:34 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d8a4:9330:ebc2:b0c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9e77sm54432355e9.4.2026.06.26.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 00:59:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, afaerber@suse.com, mwalle@kernel.org,
        andriy.shevchenko@intel.com, tychang@realtek.com,
        Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com,
        stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: (subset) [PATCH v4 0/4] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Fri, 26 Jun 2026 09:59:29 +0200
Message-ID: <178246069898.6685.11577448681947659397.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622092335.1166876-1-eleanor.lin@realtek.com>
References: <20260622092335.1166876-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vDTstaey8g_wxG1abgLUQdPO9W9rUKsS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfX1yMDOmaE9TYG
 qGx8W4Z4ljM+S3favguSrQ7/domDwRbuSCdATyluVMiVrZm0jK3+76Bwg8Hh1YnK3Ss90zvav0W
 JF8m7la4ARi7cKZKqORPf2I6XSmW7FJLX06pD63ZisBUsXa8k0i6a/a+JziW0aN6f+gsV2aCfr+
 UeujMvhCFPW94EeL5+bmPbpJu9rdJRrcadqqkYtrOKf3E1pha6trv1TRxsS0i3iDB+0vI8ImIz4
 qfAiDIL67HXLdW0zqkSAMxeQtkTvBhIpT7u+Im6ZQ0UaB6R8yXboWiwoHSrLQlL9Isr03cvPVwb
 UWMzjHmGZVyIr8vhVTcM3zJDnTTswRzVos2UqrCEn2E8nNtKledTJKopzCVDZpxXon13h1MHmip
 u1XbZosj0cJ8OSHIn0aYF+Rc25Z4zBP92/SXTFA1IaLckBRIXidpxEzW9TLFM8CKk4BvGv1yC4q
 U3HhWVYq3qQ/adBOczQ==
X-Authority-Analysis: v=2.4 cv=W+cIkxWk c=1 sm=1 tr=0 ts=6a3e3168 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gmxu7H2YFhVDB807_QQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA2MiBTYWx0ZWRfX/3+bAlzQvreF
 GCI8cEnUEGNE+Grc8lMAYAaLZz2illMewtvVRzVtuNml3Ibxn7VBhLwDUgQc0cKZzLPFtomDj+y
 wG3+LTTXJyDO3SdfEc9iWBOZLolVrko=
X-Proofpoint-ORIG-GUID: vDTstaey8g_wxG1abgLUQdPO9W9rUKsS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_005936_836146_4F6A3F9C 
X-CRM114-Status: GOOD (  11.18  )
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


On Mon, 22 Jun 2026 17:23:31 +0800, Yu-Chun Lin wrote:
> This series adds GPIO support for the Realtek DHC RTD1625 SoC.
> 
> Unlike the existing driver (gpio-rtd.c) which uses shared bank registers,
> the RTD1625 features a per-pin register architecture where each GPIO line
> is managed by its own dedicated 32-bit control register. This distinct
> hardware design requires a new, separate driver.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
      https://git.kernel.org/brgl/c/8f32808e1530b2229e07695fb39c54fee910bd4a
[2/4] gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
      https://git.kernel.org/brgl/c/b5d23fcdb12972c522e96f90ab48be8a0d971b0e
[3/4] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
      https://git.kernel.org/brgl/c/a57e27c43b0315ee86c6896510d69be5257e093e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

