Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8615C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=; b=Jux++37waG0NGs6/NwE6b1s7Ur
	p9MEN3Tukyh/YForb+XMew34V7GvlQYDu7vxI65W2GzY2elGuR0GydvJCMZLgr8aGEAp+6nt+UGj1
	CztOfsKIByf8TDR7h0wq54L4PfybDlUdm3Snstssa115ucij7qg6UaIWuW99DBHvd0U0QIAgumwO6
	eqIAHyLVTWbz+b6UbGsE3NehtNfnPQZIWbK8kdh/KAkUb3Y4gQ4w/02fwirsk2qH6fdDd1h6LDCWF
	k87tTRl8IBe8Q+iVIWF1VVaWxtZG6srh9CYSr8TXOkhLvw+crwlS4GuGBwPG3nyTuIPkLAaxzuIpX
	RZTwrGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbN-00000009N1t-1DLT;
	Mon, 13 Jul 2026 13:21:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGbL-00000009Mxz-2u3s
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 13:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=; b=fTo96wAZjRr5MG8qRxB6KeTkhn
	BEws8CAyy+ZzcCQTtmrnLXBjscF43oUlapIWNWrpOf8b2fI6TdrupUExorx2sZoGewvu+qxYX0lc9
	6Xowo6mhEqNb3xvAVa3G8S/riQ3rbvSiF2VMnIxofEfYyepyfCizdzGgKi8jweCQ5cqjZMVvnd8AZ
	nxFjnovnNpHTmQsCKFE6AkEqbLyE0GrZSpv7f+heJcyQCwg1W1YEKpYfF3I/4kRPyrELO8OQVl9DY
	dladQpaVuUTg4JAHoq+gmOz13QasD0SeGwKl79XJYjluiMl6GoxvpXD+8Cd9Vs8nda53A3GZ0iUzq
	c7S2e14g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjGbF-0000000BdYG-1eje
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:21:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCFJvO1506632
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=; b=LuHB2LndYAhekP/j
	qqI6yQ1IIvHllU+v/KZAuCsz8E37eSBJ/bOgI8R9w1HloRsQVR/lusbYFphVuRQM
	ncaLznaaOZ+jeHtIqKrsrzK5JCqgTsSRyhCO9cXFZgwr9o6k33sw7mmJQNrb8F7R
	EC4ky7JImgq3CLSrmd3sZh6HesP8U9IIKPPhXIVLimSmDCbIAaSlKexL3PW2Gt1C
	hNXMwOBmK4v7ZEV+ILuRuT4iStzoti5NGJ4uK+4650V8aLn42qktRa1uUbwOZImt
	XTpbLooToXh5GCa7hlWSVWrwLEgxHPy75kUR40ZOGYkjWYalZ4Im/4G8MWbtq+ES
	FVA8Ng==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda0utm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:21:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso30889971cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948889; x=1784553689; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
        b=E13itL0l+9lkkD1FqccmgUCHygvmPE1dzl6F6rsrKU1vevcNLasgbX+q+foMIGubXe
         DFChxt5N++5Y+6Iav+50Th5//hkZGqRAEox7q7PPPHXc2E8zOnYw01Kxcgkr+liOpxO2
         PbI34l7DCCF6kZjBTLHQ+S9cJKqXmjRb+KBP0dtTKnFUSmW/Mxems7gv2Z/NWmfqWSGb
         d8jlIB0amRQPUmnKCqI+TcRy/S2GvB303mS8U/jrFkoScb+0kXp4/0ATXkvRwzr4NWzl
         r3meV96PnqXi1JhomXOk2hSssXyH3UNtRE7aKgTXpQ5lAjh10KMjWuMjQ7Cdr/sd5uIw
         /czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948889; x=1784553689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
        b=YNgugoQ+xVRbAOI75NbT/pUGDaxA73rYKZg+KArwlyu8hTv18PlolIFQjWy+WH0mQv
         AQglSsy0xK8sc9eLEcT5cq6nEhP4s9wFv0c3jdR74CfsczSutmUZITYd6mMmSOA+I1fk
         T2wlOtOdprro+MO2p8oImRMrBPkYX91s39THtu/yUbHSiKEw9F8OG5DDMDKE0BeG1YGI
         PY7PeVk7/o7lo9Zl9oZJe/mVwfHAc1pJq/xTmuoamkaQv3OmZqFmReRvDfSj2Caqii66
         r2T6Dhp8/wtZXSLrI0qE3hwgH+MXyT0PnVQmhJdXBn/xuNz0Sp/7vp2xdgUce/oEat0+
         zPeg==
X-Forwarded-Encrypted: i=1; AHgh+RoA8adfV6A3Idhv5E0ZJF3lDN0D9/hswPrZn0DCzyKeN9aAqqCDJVJJgswSDMSp+vniPSOO5IEh1HCm2nLIAOLU@lists.infradead.org
X-Gm-Message-State: AOJu0YyshGDo65cJ3/IL84Tyui2Pc30VLnGdmqhihS7NkTu/rhyF17t1
	dNiCd80siNg2MNxMOGX5gue8uMv2kCSbVhFoEMm1egfI/A+tnZ9alV8F7X4tXFXSAlpdfKpXZ3R
	tRlZ0dm/vw4jsZZ2wdCFJEijcBlnnnaZGfqzNxmtqjRCO5FKZj/OUINWqxz42paK/eJLddXmEZF
	OJyg==
X-Gm-Gg: AfdE7ck6y4zZ+fWdYTByHzXtCy9j4vspeuCdGlxzz4CoFYoyTo/AXy60RaTkVNprJOr
	BqRtvPOwAubhoKUyMx/fRanTq5a8WiwU5gLwf8a9C/FIkze0lCGOzJobyG2ISz/wN+VZSCMCNs2
	Nk1UrZnu/SPRXMmFmfp/aNhCqCkZbtegx/jrUqWJ7yopgV67YVbAzWhrnLrW29m48X99CjC0Kb4
	xmjXG0rZUGn4n6enJA7kNojyqcYtjA2biuHzMpa0T9IIQGG8fqjSldkvgz8L5X8w6xsjv2ZOu1t
	8CV7gTfHDbuYlxTakhLhJkrUCdho1wmJhzISgFBhPc0lOek6l8XQPqpCKRX0I2N7ABRZmWJYsym
	9B4/IKENRPHD5ERLem52BRyOtkRouS+18WOeYUQpi
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-51caa0bb46fmr141764111cf.19.1783948889483;
        Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-51caa0bb46fmr141763741cf.19.1783948889084;
        Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:35 +0200
Subject: [PATCH net-next v13 06/10] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NA70xnk/UNTcZEimYYDwGN/0JGIaZCh/H15cO1NUAsU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY5/+vs2/qf6ixq4/oND2Zx6UG66WUho2k1N
 BESE3IZZ9yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOQAKCRAFnS7L/zaE
 w287D/9ZdNDg6JWXdurG/2dzivQeLaVo/7EtsCSyerxef3uIlCFZXmkGtM9e5iwQwgajmvVUCn3
 JTuk3xBjg+Z1rKC1kB/R3MjBD8PhEW+E+xtyv0ZfJ0dLazOINtSW3GAlW8X8jCLTZTcdvwEFdzY
 KIC9IY/wiiZ8QSRR+AhHjb5oF9P7v6JqeoqmJjeOZtJfRdnWMv3WpoIwpkP7GEtoICT4ADSsMVw
 dZ7DKd/klrXJmNHOgxtCE3Sa/tiWHW37EyzPjzFDFIJcWktXMWkFucKsCab66xmA8dxOPc8oZCa
 J1xm+gim/rKwzek+BM1739EJ5i9AauUDha1WT5QrTL9P5+3SvZ4zNLwhomOEKkLoZghbp6Pbepc
 XYhKBRQQM4vu1cZJi7F5bb9E4ACR+buWVjXcCeDZANXlHHtlPmOHekz+wJ3Ua1YStpgBkEAzKk2
 dFiek2jbRDX7KFBUTDPBTBIRkqzc+Y7sXl/CwPYbMw8Afeddl8kY4dpRvzG29iFvQmjSVwHcAbe
 Lgkz6aIJy20PcDerwJKefrtBj6Uri6D3O1qhz/Z+7KvVbnD2CZq6zoC940lmSPJUt47jeAh1VDn
 Uu5E/R4SosFE1DGpvef7KgKjGkKrEm7yAWoep/YaYStb2OwTec/khkzbk+W6+0EYIeUbC+syBv2
 3gGFk01Yg1NAiWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX70X23Aiii6O6
 c91cXEgxJwrm9C22vcF7v2sr+1D8bg9cXIJX2/J9UlCyWOwuhCCM7i/LAp2unioqjWa96aYuQdg
 MVYZoQvpHnAhKWMAgTuF9R/X1/8x3DA=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54e65a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=fYsbkC7JaC8eFfGKQicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: xF4jFTSqOxbFmzW7QJRFqLkwApflXvW5
X-Proofpoint-ORIG-GUID: xF4jFTSqOxbFmzW7QJRFqLkwApflXvW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX1w5Evflf67sS
 6aXxd5c/dDVVNQhSKa9W5cUKbaiy7YZlt0sQ/SLtB9htB1hG9oNi3fWn2XihyEXtrk5z6dSC/li
 nGuqs9dvhLvedZ+9mHmzUEGg+s+OpF3JzY2ZZKQCQh1lu8IrZsviZMIFj0mTqt+PS7HdM1KXaud
 dG9/PHmesxY9WVABRwO47QNrAEuNPgLJ00FeTrDR5sSs8xbctXq+rx+ABGRICWd2Z6rIwRpk/he
 uul9RZNZwb/hOo/ueWd40E+ZzLk0u8YWE2lYqOq0Ix5+ARUNCFOdEdd9s9UQkuAFKuIbFMHr5yZ
 YW0XtPNYG6xpfSKk8Og/7DXCZc/LZbUpLZ0bN44+nhGHU/LrFK2PkpNSmLI8TLt07vQt1z2S/en
 AeNjDUChyZg0T4hFmWv5NFxLt6Xje2E+2dyblRd5jDW4Up12kCvqvkFXK5gDeFlcef4nJA/QbLW
 i/li6xArXgyxGLaT0nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_142133_773987_7B82BE53 
X-CRM114-Status: GOOD (  18.50  )
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

ethqos->phy_mode is read by serdes_powerup() and
qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
wrapper for the correct interface. It is set once at probe from the DT
phy-mode property and never updated.

phylink resolves the actual runtime interface and passes it to the
mac_finish() callback. On platforms that only ever operate at one speed
these two values are always the same, but when the interface changes
at runtime - for example switching between SGMII and 2500BASE-X — the
stored value becomes stale. The next serdes_powerup() call, on
a subsequent link cycle, then reinitialises the SerDes to the wrong mode.

Update ethqos->phy_mode from the interface argument in
ethqos_mac_finish_serdes() so that it always reflects the last
resolved interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 47b70b5e706f221c01f1c0ae3b1acafae6641165..9d19203ae4bd7dc17aca068f5eb88ff830e4e906 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -632,6 +632,12 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	struct qcom_ethqos *ethqos = priv;
 	int ret = 0;
 
+	/* The interface mode is only known once phylink has resolved it and
+	 * may change at runtime, so keep it in sync for later
+	 * serdes_powerup()/serdes_powerdown() calls.
+	 */
+	ethqos->phy_mode = interface;
+
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||

-- 
2.47.3


