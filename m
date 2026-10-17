Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8369CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=; b=NTljtoG26NVDzHLEN2mxH/l/aW
	HECi9jTjXpEnuE6u8EggaIj9hgMIq7JnCsQxBphF3iE8lZKEdvIJDjY+AzGOB4rHSSsQyw2NQmtgT
	oFIMNTzv4JyrlbJJD38C89TUDcAimeUJ0pN9sfjmP1Of9/ITZbET7slqRKUfqpIPZNLZKWsMdmLr/
	JPF9Jd814gtuKp9rL08g1yyayJtH0NE59E6bmY5d5ECtZ0Otzd9nugXmGsZ4oDi5M9y7VO5zN7xUn
	oVJ6nC8Y49aSHkYvrb3FFjkFglFAKRr17dZGA3IEi1v3wRQqiSTlp2mbsxXnPQ9OovarwHadrP6aA
	+0w0i8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7RX-00000004wMq-2K7K;
	Sat, 17 Oct 2026 16:39:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7RS-00000004wKI-1tbY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:39:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA2hl2032723
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 16:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hz4iIDuDhHEcy2mIuGeKuord
	9GLsrFZT6JV2X218PUA=; b=iqcI3njCDzM4e7mRHLw+YV3xmeKx13qdpNpYLO1c
	uKuJcnhcRz3rtqo+XqDGeMCZv2dURNY8sE4Up/wSPorj21shN+H4P4PvOUiE1k4f
	HrKJsV+TXCcL1K6rMrtrXUEtT4Vlu4w4TsY7ngl01CsdTZz1rKlYemGVmnu3eNHV
	+HjThJ6ViFeCJyAVpyHQYmZUV+RGbosOkNtCwmXNHB6OUn0sulMIxvCNKMz7qg71
	VvhPs8OoWfwTc1Wwi9VbA8nr0EEah65QxY+qlhZZrIAZfY7QJDXrV6PujpiUFd11
	LA1oKqK2zNAXkDqjMldYzsbUJ7V6A2GAOrlTldaC5GhPdA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxhbuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 16:39:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3580c07911eso2499290eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255169; x=1792859969; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=RuJUir1fnVTh5H1yAGGieW6wB08WfLyhR1mTdG1Ei9s9DqTGND9AVwevAAJ298Yg5u
         Y52ZhCbqCYcodprdTWuljCkKcmtCP4JjSbKir7MjqsLHdQ7JNeB0kJ1CjUE0qOHL1NPE
         wdEu76cgyxVw9iIdze3LVerzJhK4dhxT/HV7TuY4oDESJVVo4N1z2/lMU5bVudSgm+ms
         wQlkoTYCVgvV4C8VvMz+AeuFhsDH+PNMDRV8ggctbsXSPd47JOWmKETIH17PCIAZ+QUT
         a+0Vo/wzOmvizL3LE87fHo+4bIU6KlgMmDXntwcffvkPXOA4WGUruJeogPpbDPKuy/zp
         L8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255169; x=1792859969;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz4iIDuDhHEcy2mIuGeKuord9GLsrFZT6JV2X218PUA=;
        b=WKtyV18oKmjNtulgdYHDCXsPeBZPrrS+Mmn7ZWx+EhCQzaYQFI2bewbFoD1QGldiah
         0KZftFruThiNiPwWr8Ih/u2eJU1TAh8hOWRGbf7ya06cyr/mzF2L5FPpa6WiD9CYQiHY
         HjefeFhPaIOOuvZQf2L3I6w0PbJ3CAITEBgrFczCuUEPuflFAGadnCFGmmTsUlEezerh
         4k/138IESS8eaf7fIf+vIRN6meHxoRJFmtal1LEaFN/nfcnR2+5sqqnvJ9Zb2bbqnVsR
         OK5pKIZ4eBEIYDGe+m89pNOBRikZhCnEcCLZQKJ/vBMJoM5BMZKXvLrCJN2kRnudojaR
         FFKA==
X-Forwarded-Encrypted: i=1; AKwUvBzPwdExsaXI31mwRETU8CfmXada0OVJaL9SzPHGQJ2wLM3bc9w7ep3QLdi3mh0a6WOnYxhEXN31CDuWOCjD+HnL@lists.infradead.org
X-Gm-Message-State: AFq9FYIqPhjPCr0pMu7XDMSbgfH+ouJKgrcfYvD1IggEFULCXCfsKc2/
	JWcZOY+bI/SriHj21WhPfjlvk3KDIGcXUPVF2nR6/A/HGsfzSAB/kiTirmexa/fyKoaCwTYZqp8
	Pa9UKhqhPzdA7j6ajELFCFEBY1SGnrL5y8gdL6GOARcLqBh37sPHuyWvyfR9jTyCU2qG/5mcgms
	I6EQ==
X-Gm-Gg: AYBFou2HZMKn/FRk3YuTTFTbBhLuqQAty0g4x4/kEKtqu7vPIVH9l/c/6acd/nC9S/E
	K++l/xQofKFN7VcEgs2ga24vVz+5mlSvMk73omsTZzLB1ewjq1LlDk8b0vX6/89vgd4EStVf2d1
	X3bgl5iMDpD/brXp6VLjNQOugyv+0T6FVOKzvZ11xbGc5SMsGFQMNufHOcDu4KNhNGt/oAIfmL/
	DRlVSnc4HF6B4ZpH9tGZYhweZHsFIF3e3WdOWW+fl6WZ8/bXt6JDMi1P5LAHueXu1GFZZ1yzJVG
	KSkGumRpCYgsl5wW2sydA0/G70hjyVIutizmBH5gZknfX+LtFbLzaWj42hfAuaj+WwioWRrsyXe
	dnRnkgoE+aYBb
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4630029eec.32.1792255168406;
        Sat, 17 Oct 2026 09:39:28 -0700 (PDT)
X-Received: by 2002:a05:7300:2406:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-361a254da08mr4629905eec.32.1792255166648;
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17691508eec.7.2026.10.17.09.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:39:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:09:10 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 4/7] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Message-ID: <atOkrubiz/V7aFiu@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-4-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfXypLxDQmcxEHx
 MzeFpv/BYLtoc8DuQYOEtxCt+Nf7mAMkv3wkTvC0QADqB7A63ubtDxvheUt1THdEdOF4x3/aoC/
 RfmXHid4XtuQXIpwSTaixBv9Rwg1M8A=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad3a4c1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=K33ZUWoUxhUzfzW7EYwA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX8fa3EyZFwEg1
 BGBfIFxEtnhJwfy7RTJNsWzkf+Qej+8t2N8EFrS7v7skcasGxdnRQ6tutr94Iu78j95PwtMOtjY
 73HrPdhTOxfdOZq/ojui6lsICuJ2iK7Or+RGFAKFbk2Usi35Ie/C92th2OqwkeT+PovQ2uRVYbq
 V9i5b7xoziitTvC5yI565BrTVbA2g5Q/4Q1WOD+RlrFxNrFOIQPUnL07oMj1E+cfeeIEREIjVx3
 tdCAmudU5tfq4PHI7XIpwYry+gZfF+OTAwh6kDbKNdpQ77SlpCr+HIP3rfBVZvA/yVeRJF1efSF
 4r2kzqpg9vU/i122eBB93knteHkerVWou+KHtXL+PQfTXL6RKIKFKQ5+H+bPVuPZSYuIOriRuCX
 xrFO9/0dpMSdEN/jY9VkBBrxGLBxIABMYPy37fZRdSz00TDd+dw+eM9cckwqEyQD3fY/ZT7qyDw
 VYwtFlEfUWy+n480o9Q==
X-Proofpoint-ORIG-GUID: Zi3Infl0xxqG8bWfWjmIiU-HHNb-wr2M
X-Proofpoint-GUID: Zi3Infl0xxqG8bWfWjmIiU-HHNb-wr2M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_093930_598561_1D5A3FC4 
X-CRM114-Status: GOOD (  20.55  )
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

On Wed, Oct 14, 2026 at 02:36:43PM +0200, Bartosz Golaszewski wrote:
> ethqos->phy_mode is read by serdes_powerup() and
> qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
> wrapper for the correct interface. It is set once at probe from the DT
> phy-mode property and never updated.
> 
> phylink resolves the actual runtime interface and passes it to the
> mac_finish() callback. On platforms that only ever operate at one speed
> these two values are always the same, but when the interface changes
> at runtime - for example switching between SGMII and 2500BASE-X - the
> stored value becomes stale. The next serdes_powerup() call, on
> a subsequent link cycle, then reinitializes the SerDes to the wrong mode.
> 
> Update ethqos->phy_mode from the interface argument in
> ethqos_mac_finish_serdes() so that it always reflects the last
> resolved interface.
> 
> With that, we now update the phy_mode to the runtime-resolved interface,
> so any subsequent resume with a 1G SGMII link skips the loopback setup
> and the DMA reset hangs. To remedy this, extend the guard to include
> PHY_INTERFACE_MODE_SGMII.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

I am not sure but should this have a Fixes: tag?

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


