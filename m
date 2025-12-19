Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6217ED78786
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bdVHcop5XYNpYgY2yr+3FkdwW8jh3IpYWt3xSgH8iKA=; b=otN1UD+RzaEb2O
	9WWPcMUnP1wh0fpGFgM9jzCkWv0NpEp2ODhI3sHGae5i4xCHrK6VR4g0osEw0hgtPBt+M/A257IZu
	neyp307WBKpabrBM1V4Z7EqzOQz3gz4Tl9uToGliTvyFIMXSz9u8/hCLyyH82Wii566qsjfKDK/Ha
	AOT3w7lnhuh+7psgaT6swKzoqlBsEgkp7392GQa+nj2cCyaczph1SmbhtxX/Kt29iItdlGeonNasP
	5oAhPAKD7hf1xW466lRTZLEe0Az9RHtg1sj6bAUAgbJLpUx401lJMecOI0Rzy5l54Q/NlN51pvGIG
	sONoQUVi+yNAcUpoXqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbaQ-0000000APtQ-1zHJ;
	Fri, 19 Dec 2025 14:36:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbaH-0000000APnG-1xXr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:36:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBbIX21771762
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bdVHcop5XYNpYgY2yr+3Fk
	dwW8jh3IpYWt3xSgH8iKA=; b=H8MbEeMcDR3OAyNCv7ZbaT2jGgjxnspKFvfma+
	vScLZ9gcIKUB6mzGCGSe+SxrLuEEDnIbhO1DoJYyP7+dNsiltp4LXZv/n9omciUp
	pypqg41B//O4+bkm7RqZbiq86vn0gkxpau8mlREVwrUfL9IDtwx2A4oFyE7L43Im
	JlMVs3ZcmKnE8+hCLCoWOBwuMHZ0MQWhQ37xONF7dIS6FmijR3ekq0KhWEB3zyoi
	UIe94lKxvqPbtGJDSj8vKtJBOSVbxN6fow7n9s1gDjJt2X4sul/5TfpErnoUeCwP
	tJrAxrFfXlH1yNXXRiCjiyRZcIQB/eWgFOKuxJHxPpCZ8NnA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bjy5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:35:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2f8e7d8dso43438996d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766154956; x=1766759756; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdVHcop5XYNpYgY2yr+3FkdwW8jh3IpYWt3xSgH8iKA=;
        b=Az+5IPGX6XPi9lJn4Z2cxNXhuh3PNpK24MQZUYD+BniJtxDTD69oeYrtzmtbkLrD0T
         jbANhnJTQWRiMBLDDAtQfYy0ZBGgYvNP1GbUBVJsAVH4keGIrfrVyuKOAvhhlwwJFOVv
         4zSeD4ivmlfEcCFHCh4Fxr1Zoxyz6CJGvU8b7nu3bcRF79mxyuUfrWrBy6kStW9+6/M4
         LFdy/VO9xRaYBAHrvJgHTHsgXt5nxJFYL5i6OZnOVmNlhGYOdUG4p996oeXdPksuTRLt
         4Y1yhkWXn92IvFEvJ0XoEaVdvBfOC6Yx3zTbqBsCgvY3yLZf1yS+sMuu/cy4LzRS7OgY
         zq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154956; x=1766759756;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdVHcop5XYNpYgY2yr+3FkdwW8jh3IpYWt3xSgH8iKA=;
        b=ZqJKuM71sJtoNMRqJ23soaN4gRZNo9mSxorEym9hRwcBqdjxJ2Vj6FvHGcRSotTHE3
         VHNx5PtjNeMOjI2LZBdeVWyg0R8iRxunNS7+N7fzA8MUNEuYGAtmDRRoroERHT4HZayE
         dOZn7ANag+2vEQifbhY0Z+SG5JtYWTwPkez8GBGsQkooc6RGkaliZAMZew2zDz2zktYh
         ttVP0huPWrEaRXk9Tqo3RyRXItb8juHSwu5MM2TG73Q3tibzM0w+Aq1X4jcX+QApn4Jj
         8axCDLg7e3AuV4VbRPfNvwKExydHiv+g1v/jDmgKXvFUREMvng6P8Rqt78MMRZDTaN3z
         Tb5g==
X-Forwarded-Encrypted: i=1; AJvYcCVs3vHYWoaGsdhWeORJZL6Ut4Hm61sH94l1BiW8wUWUZg1e9nZt7j1ldJlhlYatcFYSpDwBI2qLaYZECDkLZokU@lists.infradead.org
X-Gm-Message-State: AOJu0YwHjngobQJAXIUCpvkDfZGqLYSUh6aM8FHkIRb9xtnWsP460uVm
	X62zgLR/zExcRR9oiMqeE9gSXdEeLEGhfz0lpxpu+kr+WDXnB2NHJpn9eM9bKAluctHPnvZCCql
	LpFrnab4W45VUmrhpMQFIZNR0Se2RiJcfJQN+iYTvrjHiyLVbrodUYxbAUk7gPTPaa8rHK6cp+b
	+nCg==
X-Gm-Gg: AY/fxX7YbcxPEUlzotJuT0H0PSmAezWauzuu5bLfWIPIhmtyd37LC6Z+xPrBp5cd0nI
	TARu8oSabFL8Z2SXNGMW8P24E/fbAlBq4kiOEYyoNH2R9g8Pw/KBa9L6n2IFF+XyKtc/JcuuTIi
	0o4arnN9vemr6VTjieE2Ne3p6VyO7CYWIN4B63Abl0vNvnYJY2QkzQ9lCfaWRXPAidWzm/kD+/T
	p1zzsmGNmpW6YqO9qSsh1azEYvuvGG2q/wVdZnRY3qC7mKsyxMFHs9UdqyvZGzX8FN+vssfRaXf
	5uYlwBZ9n8lRACQYGYxZKv7ioqMTsDMy4lAu1g3ADbDCajK7S917Cq3VIBvYi5MEV6BAE9xb9zS
	Aa7EVSddcgHT4g4+oZ2BOPgDRguUgsMDi6jLd5wmanbz09+oOyYrNYlIz3Y9+EXaGU5to
X-Received: by 2002:ac8:5d08:0:b0:4ed:ba76:a008 with SMTP id d75a77b69052e-4f4abdb4c88mr38662941cf.73.1766154955446;
        Fri, 19 Dec 2025 06:35:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEffbFxw8X7dSObyQoz5slOTM2CgBwKcXa5e7U5F4RvPeNF54VvXGRIgsWbtWtrOWj00iptUQ==
X-Received: by 2002:ac8:5d08:0:b0:4ed:ba76:a008 with SMTP id d75a77b69052e-4f4abdb4c88mr38662351cf.73.1766154954913;
        Fri, 19 Dec 2025 06:35:54 -0800 (PST)
Received: from [127.0.1.1] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab7f86sm245145966b.17.2025.12.19.06.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 06:35:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/5] iio: adc: Simplify with dev_err_probe
Date: Fri, 19 Dec 2025 15:31:49 +0100
Message-Id: <20251219-iio-dev-err-probe-v1-0-bd0fbc83c8a0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANVhRWkC/x3MQQqAIBBA0avErBtQU6iuEi0yp5pNyggShHdPW
 r7F/y9kEqYMc/eCUOHM8W7QfQf7td0nIYdmMMo4bfSEzBEDFSQRTBI9oZv8oJXdx2A9tC4JHfz
 8z2Wt9QO2tb1AYwAAAA==
X-Change-ID: 20251219-iio-dev-err-probe-59b3104c8d4b
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yDoEuSqPknkwVP0vazPsHzAq74kjVOByu3+rGhvA4Fg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpRWLDVzK3BklVItpqweq/1miLacOG2Cpj1HQRt
 qYMIHAS116JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUViwwAKCRDBN2bmhouD
 1472EACOzRsssmSeIC4dDsW9cdUyuX/1DfAEF31eNrw1wC0pyBMfIWJNnL2LSlQaWhLMVwkDaRx
 Q6qs5PZ+m5HSWN0c9B1IYnCaBdkg9i1tYfZx91zD3cFo8C3sFJ4cHai7H7f0h5OmhvOyZ8FxR0l
 al06ryQgbWCkyk9k/tWLHL+q2IAlhtfGuCtZ0+fD5kpkZLoVtbbKrTKNwlVTaY+cXWQF4BIIyDV
 AMV/sIPce94hEHphyKJlCqioXya+WMGdqumincCRkLKMIeFBE/peXUw5dYNkajIMJM6xU8axA9R
 lR5qS6Vd9zzuiKbtXRwkUBxu6Iv1eQsH449ypPIU4urZxHPbWefEF8x+KFqIL8jM9LWWev1CAwJ
 uVo9yYZ46EPZiYJe+xWkunZymrftSRkCkihcfalicTpVtRcgFWH13sIFqP9XK+0nlXJ4AXngRjp
 4hS92gmbRS6+yzCsyH9TqRxujuDbowBSxua62u0DdBeX3T47ruoQmDUCcaEPA/SKd3HLoYtpSCU
 SGunXOmPp04MuDM//S4PdHiyTXk7EzNoF6JXSrC7AjaZoEuWbadPnfJGv0EEIJLHvzKkLDByrgB
 RtS/oL0QhQ6zURKrKaZrsnxmBVjr09C/uqHNhnmkj7XmZNMFWZ7b1G8b5QH0AjIGARciWoIiza4
 zNl2KZibzhmH4ZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Erxz3no4cteFaXIgB5voxgYnGIaBEZrD
X-Proofpoint-ORIG-GUID: Erxz3no4cteFaXIgB5voxgYnGIaBEZrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMiBTYWx0ZWRfX3g9ZGhY1u5cO
 3URxxVTjFioX58Yw9x6PpigaHgsHbebSrAYqe2kX+/ydlzxfkv8sfalK+YhSqYOwYGRlxf09UeM
 sRRYNYztOuFQLjFQn00+IKzxpphJ4PqQYCAAlPHCS3b998izAYehWBKXGee+cyh4tn6r7klrrto
 j0KqB1gUrkTW39APVsZiIBf6wXRuxw9znQ/XDqiQiWAfuOb+ni3nJqA0OlOdXxFd36/cI1jRGTO
 mQR/ijj+zv/gJBRCEIvlYni2oSAhw54whO798f5HU6/xs8XI5995jGgeFEfgmj2AMwSrlBMnULX
 oalQlkg8QEiWgsJd7fcv+cW2jNsWjEY73K/o+YsFCP1zcWLPDc2m1t3iasW+dT0HFNaoODhGm1b
 W7hgBJjZkuOCkzdm1ElCUP6P1lHf1MWfWKtDfXPb66LL3krb2SYO5b3/nM0uk3a7/TSetb2Sn17
 t25kJr9QdmalZqNue8A==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=694562cc cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGHnGGPHKRB7WeD4iHgA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_063558_741644_B94F44C2 
X-CRM114-Status: GOOD (  10.11  )
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

Use dev_err_probe() to make error code handling simpler and handle
deferred probe nicely (avoid spamming logs).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (5):
      iio: adc: aspeed: Simplify with dev_err_probe
      iio: adc: exynos: Simplify with dev_err_probe
      iio: adc: qcom-spmi-rradc: Simplify with dev_err_probe
      iio: adc: rockchip: Simplify with dev_err_probe
      iio: adc: sc27xx: Simplify with dev_err_probe

 drivers/iio/adc/aspeed_adc.c      |  9 ++++---
 drivers/iio/adc/exynos_adc.c      | 29 ++++++++---------------
 drivers/iio/adc/qcom-spmi-rradc.c | 20 ++++++----------
 drivers/iio/adc/rockchip_saradc.c | 13 ++++-------
 drivers/iio/adc/sc27xx_adc.c      | 49 ++++++++++++++-------------------------
 5 files changed, 43 insertions(+), 77 deletions(-)
---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-iio-dev-err-probe-59b3104c8d4b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


