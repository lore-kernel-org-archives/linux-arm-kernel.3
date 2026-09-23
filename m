Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DB6C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xj0mccvKNn0pviVnxdEuVe3fDON1/8tF2k7K30UJRGU=; b=un5sNP9XbMJywvDNaV0oBxEhWb
	4Lsg7BMqT84CYDefJWNgQ94DkmfYR6HBX+DwtzsGl48GY/OXW2UHwA+hJ1RiLz5oh7oRCaHVAlj7i
	UNSy/LWMF7CLuO7jObOtZSwIVUcxQcdNTOROmPoov4rkeN7hjAeUmPiaAaaTJZ3jHZcjKDvSMuTL2
	XMP9o/8O5NXVIxkVtFQio5jRfY0sGT22itCA8mZsDSlgj3siO+r5VoWbpZ4yUug9LhXdgBB1W45sH
	ZsgJiZ4iIG2JUg+stmt5dAiFjLIpED/fnrzBFR8EBaQMPbMhyijdB8uN+UtVtt61wsuS+0UNqsAHj
	0Z1q3KoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ogp-00000008eV6-3F34;
	Wed, 23 Sep 2026 15:15:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ogk-00000008eNV-0GeU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 15:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xj0mccvKNn0pviVnxdEuVe3fDON1/8tF2k7K30UJRGU=; b=RqxKuR/s5lAStm++IX1bocRfjZ
	43lPQ56cAWqb3anirZDgYtt49rg1TEHYtCdkx/y/JUShRvq6aacg4FhVgCbNHNdAeJNzByqo6PDL8
	Yeisu6sBZ6AWyQRZouADgw24tv4i6bI6XmUPyyr66mWj++neNfoY9QDtRcX7nEMzB3G49NYz3jd0I
	AJ1VDcqF4nytUYbG5eJnmfct1WGgZP6EybHZRxRlS3dChceiTJaKFU5l29VAbeUSmfo75TsMxkO9L
	ub2p4d9hY80yCjj7O8n9oi3mf/gatc38KgJzm/qjKvx+0iT6eXW68PdRlhdPytNtexN7NnIitcLA8
	05HMC7VQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Ogg-0000000Eub4-1z2E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:15:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKgOh322188
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 15:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xj0mccvKNn0pviVnxdEuVe3fDON1/8tF2k7K30UJRGU=; b=NN8CNaPTfOpiFEop
	n8URo5AQ2ALwSHQN9u0X418+dOBkkGcWz+jYyCRXprYRIuo8UrgTAs8CDvr+NBxl
	RQr6Scl41pjC4n0PHEc8thCKAb8ZGBTcI3o/zcxxMyA+QuTpC4h40J/U9hwNz1hm
	P5s2Fqqx8y8N/EcFWAiupEu7Dn6sDGzf2u6KK6XZRvCQh6bn12TFZX2c1CTdMjf2
	+ClB9LKj5I6LtmPa2eGDEbOrZAlcIY2ns6yZP5HdvXG/rbnPTroGilhp6UcWU+2M
	gSz+FfkGaDjumV5LA/xntQDxlLvExjkw+H7Z6QI3Wq4o33ksEZE4aR8U2W0foG0E
	7SPaXQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsghbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 15:15:08 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bbd01d56ecso331479e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790176507; x=1790781307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xj0mccvKNn0pviVnxdEuVe3fDON1/8tF2k7K30UJRGU=;
        b=BWJaJStXy54PSqln40Ww2txFlkomOuH50Iut1uIH5adBuYoliiHWYwfhoNqGkRDNG0
         U8wc2bE3Are65y0QZLeYrLD6ZSvw4pw05BjxkkYntTYOGJ/QFHEitPiQyrgvgfaerhx1
         pubhnOfLOQadj/BIOnqkCmKPjozfDdJ+2EZmLs+sL0BYYpkFMVAwvNOCR9Ojkbk20OMO
         lKU0fgzsq2q5mOsXXm/tIdAxWd2WAjb7kk+pfIieSE80bL2fD9PQX4HJIlpYC+gMbqhn
         NWsNVIPivxhVbJXqEaknW/8ZKScQ8MukQv9Iy0dZyt9WVc4185HeC4lMbewr6wfDLgwX
         gtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176507; x=1790781307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xj0mccvKNn0pviVnxdEuVe3fDON1/8tF2k7K30UJRGU=;
        b=sMCfCHGPmi005U7zkhAoOkM7uzYefhDmJpE6zrTGsos4g45x+AoW+74ZWYoAPTUQa7
         H1ByzoI+dSigDZ9rEgefpUwBYlctLz+DsV9Z57+8wuhcFtKuyc6vds67JZ3L3LXo4L1j
         8VsHH7sMuoTOrApLV4RvvByg9IxUSfGhhz/MncBALLQmj8YSXMjiCgdqnhvxzuddByih
         Swn+ebyyN6f6P1u1W45oMLM8oFkcgyf9j1jr8I/pTDCRXJYOlRdiELvxLyIMVZdhQgEI
         NYiFTfZ4Vr/n4be7K1tl6RflH05/Cc7didviElM8kvUUix1ojUDKjpMSNd4OFZ1t+9VV
         S3gg==
X-Forwarded-Encrypted: i=1; AKwUvBw+zBRtARTCDfFjT2sd18o3a19hOK3+hOpVxgSzaeNL4vnmuwbSCjEtrPyN7b13SIyKmc6VcVR1RGNHpwj55pGs@lists.infradead.org
X-Gm-Message-State: AFuF++ktA0k6dnGahbBBGnzQbILt6W3hrH2VfMj1TIG04FEXj4lnfiGZ
	1SUqGJ7dLj5/x/aGcjQJLZ++ENZ2kii9ql8TpsvAveFrJHBYQ2SnG4PaQ32SnQz6fTDk4mdKTBb
	Hr9BbHicn+BSpYsUtmzSLpsYIuO+7KAFgpLS52cawBSKPpyQcbM1HrGU9MFgzxmZy0ob5ATs8KJ
	OWKw==
X-Gm-Gg: AYBFou11dhghGC16AmrMqlB6oVSM7p4pDPROiYSI5UBM0cOfVHTdIVKYf314zoyM0GP
	PD2pWwSACFtMvC/nHt6BfyswtlJcLRjTYRxeH9mABQ9dyqmbpyon3HBWOxio1FOjI3CCluXqO9M
	m3COCkpOmr+f4GOmzs3hGsgv+Q1TR4uDCZpr3qUhdTuNpL9WsTy0Jjoybr3cdyrUOfSKGZiVC2x
	wNH7XG2qCoDQ88/la06h2YoY63eOiBKkmlBTrl0CtuzbjgHOCqR441KsqthgduBG5mkPNkS9UMg
	CMSoNMoEzA2EZtve63muPYldmEaYky1I7Zan0U8Uofs2GROAp4XqyiB1IskQYXMIdVleXmCHACB
	yvwzAgZc2NrCJsF0AOAoGIDhTvOwG
X-Received: by 2002:a05:6122:d05:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9f15812c5mr3190905e0c.3.1790176507470;
        Wed, 23 Sep 2026 08:15:07 -0700 (PDT)
X-Received: by 2002:a05:6122:d05:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9f15812c5mr3190813e0c.3.1790176506963;
        Wed, 23 Sep 2026 08:15:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4054fsm55126325e9.3.2026.09.23.08.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:15:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 17:14:37 +0200
Subject: [PATCH net-next v15 3/9] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom-sa8255p-emac-v15-3-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5757;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TlgBDo4CwygzWEjQZEhYE3/3YK10nMbGDzkCYOHa/3U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqs+zlfNPxniZcJQqe2XT4lWR1GwlzlbP0FETj1
 0NqYOIMLp6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarPs5QAKCRAFnS7L/zaE
 w37OD/4iP8Vr0/A7z3QYtEX+FzmgTeqK7MO4collgQRU3lACtd5vP0/FbK7Ki2C9i2wii1hLEHW
 Rmk7qpR6g8XDi+T21xCiqWVcQuTeHyFPaTE14UuzeNauX4Pq0b7SHP5o3GFnfoJqtgWZ0MHpPp6
 sMqKl2eGlF1WgVJKcO2j53CCHiTv6JDDdpNsWljY1dxBsuPsBMNNfr27AZOMIb+7jJXvHUfXKCX
 mTLWLGO1l1Tci6MCnjbmb66N7SE0Iz+gRbJJhLWFXpAaoNnImvfwsGcDviU1PAt/kb8Np+Ae44m
 iPZpCoIulfpV3owPtLWFY8elDN5yKmP2t/rbQ8mVVm67fh1Z78A5W6X/WTKTxDD1d0iv0VTfdn8
 6bgCtKhyayLLpcqvZpzOnafCPLARG1vy6SDlNBoMW5u4fjzR37wjHq06dh3e1FCgtYcYurIWNpu
 dJKUNbB1PjAOnSRoLYLnlFQz3Zq6IGhiuxieJQkMgAIt1dCEUN10LoVtdE+7UmJsanrG1eRQz+L
 ld0r0tbMYgGJN3nWM17DS9LtDRvcddkePHMwKJwpmyHx92nb5tXEOnNJq3kKA6mBxbYooA4a+A6
 y9tKAzVKxUbkf+JB310tb6uma8kDy4X3rUa4iP3AuvgugQ8bvkKQVegfdnFGe52Pzin9WNtdK/K
 xLrkBahNn3bnf8g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX8s+GHdTXUBXN
 ulSsS5XtNBXmMOvn/a53+QlwqhomVlG3UNqnqI4xMvU7COgRGz99FJmU+zp8U4zFGFYf8TPMx7F
 aGnGUq/rpPukTdhUlAO8dB2hkfbAUXLY7M86T937w3//TcR88lgfvPAdmQb6EEUxqcAX8jFL/WB
 Nx1ciGwQg4KH0ynZV4NgVYz08C28JwEN4IjQCl6m0uJ8Wy9vdla6g+C+ZkwRLrSP7aKWuYFlSJK
 S5scd22vYlHj1ZeLJpVP9JxjFrPm51iXN3GD0D2eRcrK8KFg6+fLU3xj6p6RGsK/FMfDP/sQXgD
 rmjges5TfNcuS1NxjA3GHR6EYPUDwHFEUJiNCDpXktMgIbkR6Frth6keYe7fpSdPmA0Kt5o6TVm
 yu66Ch97lnwyladJesT43sCmCMgqvZJxMWFMrxAlAGYrci8sWIcxdpmcwjmxArUgFKhJImYS+uX
 HQQZcGmSjTcsj8aErrQ==
X-Proofpoint-GUID: 2wr35GBjdEQe32honzbTJ08eVK4x7UoV
X-Proofpoint-ORIG-GUID: 2wr35GBjdEQe32honzbTJ08eVK4x7UoV
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3ecfc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=_Lfrdvl5uC9KR1EAoRcA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MCBTYWx0ZWRfX42c8LytN6JZz
 g9ZhnM0wtof5dolt+/oL9rhUekdflTEBilQgmAC2qP1bYvU7zfsMX/t7iBts17cy6k1ngflWnbf
 HPjDrv+Zjb3Wu4lKh5D0KsywrI8Nzvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_161510_931852_28B4FE03 
X-CRM114-Status: GOOD (  25.30  )
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

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  10 +++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 117 +++++++++++++++++++++++++
 3 files changed, 128 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index d910a5d1a1ac3ad77599e72c3f4a3b2aebd02dbf..915859ffc95b58504cb3671e8a3d866d9b305c9e 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -242,3 +242,13 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on PM_GENERIC_DOMAINS
+	select GENERIC_PHY
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 8bf887d58ee4a65687216dd91a6592da7941ace2..4972009b217e39ad3d19300e5b7dede4e88feca4 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -26,3 +26,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..c726a414eb6a41fe6937b0c73ed5cfe3bd0115cd
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/device-id/of.h>
+#include <linux/ethtool.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct device *dev = phy->dev.parent;
+	unsigned int perf_state;
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	perf_state = (submode == PHY_INTERFACE_MODE_2500BASEX) ?
+		     SPEED_2500 : SPEED_1000;
+
+	return dev_pm_genpd_set_performance_state(dev, perf_state);
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_reset_perf_state(void *data)
+{
+	struct device *dev = data;
+
+	dev_pm_genpd_set_performance_state(dev, 0);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_reset_perf_state, dev);
+	if (ret)
+		return ret;
+
+	/*
+	 * Enable runtime PM on the provider before creating the PHY so that the
+	 * PHY core enables runtime PM on the PHY device too. The single SCMI
+	 * power domain has already been attached to this device by the driver
+	 * core, so runtime PM votes propagate to firmware through the genpd
+	 * device link. No register or clock access is done here - firmware owns
+	 * the SerDes.
+	 */
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3


