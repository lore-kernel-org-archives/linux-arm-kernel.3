Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA4DCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=; b=gRlmDttKasGpL6VjttmDobACUa
	DEklTmfyX1fHy+tXVNBGe/9admT8bkt7aJITRaOaBeKmpUCQmQdiCSX2fteHD9TP+HoSoDRGal0zP
	3VvnIN5b+zrQvUHlrIJwBCIthYxBls28TJyIgwp8Pww24608yHvPImMLJw/J5C24ox9tbXGd3F12Q
	zAM7Q6xDu33mp8WHFj1Uh8Kn3lcLckSJNqaz13F3REkifCYE2OodDPPXBcunS2dDBMGp2AYQL7j14
	DgnTMF6LauXehqXeMOacTJpmpRhdLotKQlbSyynu4fiR5QX5V/7m7mR+mLnOKOy4M2weex6YdhMn3
	uJ9hBV8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7dm-00000004xhx-0mE3;
	Sat, 17 Oct 2026 16:52:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7dg-00000004xff-2iPA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:52:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA7g21521729
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 16:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwGr/VFcVBThPZuxD7wslr2Y
	PtoE5+81Oolo9GzuWu8=; b=ddkdEhfxlYdg0WsHZwg9YM05OnoCCx+IZFh7CpvA
	fZM4QzivJbpNpTR3Qtvrat7NqSk6ZsAwVBAwG3CoBTtAjfQGMNpWcuQ268iZAdGt
	b60a9SGpXkDLJ6ph+xnqDDr9mh0at3I1KPAALHtr+svlkjG7/Nu0r9dSvr1TPFdT
	ASyOqglJ2l2IcfKTLLF/bBQqY7QXhXz2vgiuIIoH98GsX7hItE+yHIikqJ9+b0XE
	900wrUHa54nqfofviVcxz0LDmr5v/J2R/i8OjdfSzkD3oOKAXZspDdj/WuXU8KkI
	nVOP8wkXAUnOP9wrXm5HU6qi64684cL5vBonmhbOSiPozg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1839bx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 16:52:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1333816eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255927; x=1792860727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=PTsrsF4/L79za26wwDOBUUUmkEtyFD3oZjQcnPYAq/7DbmAzwJqJOlvHdLPmEfOjA5
         dRdz1MdECnsA87aAz4n2on5QCzLZ80txRZtczzEliF/prreOo+ggLH35lCE6ILW8f58H
         AtsdifyrNMrcNMcd4Dc5pRLivejWt/r3RUjZdLmH0WF6n6Qo3MxcBZrRLhXccvHljDmW
         ZP1GaoEfG2VA5Rb+wd6J1lfu/Qoc+9PFUbD7Wl1Hy18k6Md9lRlSd3xYZ6gRmrAgDS++
         iuvphVl594dGn/SCJuZ16cn9rCc7cP8R6aRluP8SwufnrsSNdtkspIUqexbPcgoS0yX3
         S36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255927; x=1792860727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=mZfzVW3UitWAicmoYI15EEo4An0m+rzQQFFNqp5AFwq8rMzBNQQVrEwqRzy8ATK5T6
         rGGXrpHQjAxPAI2J/6pHg7YAxqnHIwl/COL6K1Tlz9sNHO2VLhfyPG4xcZl5F3kuUXdF
         0HkLgX1ZUlozSosUaLOF4oWAKY//vRHoT8sPJUNIOOiq5YIR1us1gI4U9zFVJQcPSGfV
         stzI/FRWoWIDW+LBS1TOoSE2vBEaLmaU500ifrKHJzDb4eRidd/Qa5t8nrmsTRQzsv+g
         FtQco/ZdFXUDo7DtLHgftg8R2Lbss9/F9lW34eSkysHIUjeaByJSFRiB1D2qeVAqQeAv
         yS7w==
X-Forwarded-Encrypted: i=1; AKwUvBySmdzHl+zOr8onKCW1yDuHlrUOPqBdkmbSqnvhEvRtKyVDmN13duHy7cuOj/JSAWSFFrEnP9pgo+j5YL9KwEty@lists.infradead.org
X-Gm-Message-State: AFq9FYKa6wl0lPwOgexVSfU2RQSE1QiXeVHvmwxWMj0oPu4podniHk+O
	7jWQQkme+JQaR97aTd2GqCzKqz5XAAIMVOhyl5XR6ZB13UBZJ2coE952JcjSq4c7QQ6XccUzRqs
	dSsjqA5E08ibGugSEwkn1L/QInBRiykZhvTLIzJNxlJJtP+MsVpI+J7pK+BRpYiPasBwzzfTrbI
	T1qA==
X-Gm-Gg: AYBFou0GswcWY4ncwjjxk4hFWr1S1qG4F8/zn6YNpEMdmHzA22MUeV2Kr5nQ97qK6WN
	JGOhwl2MPCTvC7b5CnJr2iCyO+UDSbX78k35+ZqdtjoCe8z7Z4dZLPsZVxk/qQ8m+k8gVaGokit
	Ld/19dBweX87PhdjRfjYUFkfimzwTWuccMI0fAnRMhdcTrKRc95zyZhcd7WLJobIjmbHTjwMTBm
	bGT6k3oojfw7+OLODb/CK0QkWUnXARdG94V7KKrfk1mpi+Vs4Ai5ej7vUUOhLvJFoEB8Ua0hmsz
	C9KBoZpCEYpwJJokwYrBKcvahwa0uCNCEjdPlh0d0zQSBERw6MfLhGtsW+kYHa0qBX54KL1Rybf
	ERCOkxKV7Xvcw
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246686eec.33.1792255927201;
        Sat, 17 Oct 2026 09:52:07 -0700 (PDT)
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246646eec.33.1792255926579;
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm16487376eec.9.2026.10.17.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:21:50 +0530
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
Subject: Re: [PATCH net-next v16 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Message-ID: <atOnpkct5QYK9VW1@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfXxwP71tsNrBbW
 Zs79mOrpyKPJKhv1wOGOfQo71JZf/NNEIh3Fi0C3jxu7D5fy01QiUbEc1l1j+KtQBtlRxcWlKgq
 Wx3JDwCoIczZNZ4TZw42KgWJOSweBew=
X-Proofpoint-GUID: DXqQaHXelGgNy8gzmcfPS8H5qkGzFLx6
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad3a7b8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rqvSfYwyKISaz1XZPbMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfX8BrOrU96rrp/
 cwlSKv/4+IfTbbYAvtRu/clVRm/e9WfqY9XYcIo/cToHDry/1wJuuUQacqteF0o/yS78PpUfTzE
 7Myk8asE1s6qxkaCXtmI+CUQ2H56tLOeLI64iT70wHmwoU+ikY9Lo2Mm5L+vpWC0+hXfqKiRzp8
 iutLAid25YSgxyJ8k2HAOG58TnRZFLuAP+hgZDisgTiN7e/CZMATeXKZEEYCOYJsIrhsA0hYmRB
 qFzJf6RUpwrfCJVyImmlUTZoOx1CrAMVL/EMEPKLSXcK7cDRsis/qQ4G/jl+9g69xTrD7ZSXeqi
 XbOItCRNeVp9fOHhUwcF6mm3rjGNxLvE5vDiTFxJPYXLRyKCBVjpFAjOo8qjybru51V7n9HKJCe
 Zwg1eXM56rOOsvN1tgh+VVXWMzRBKLCAtBpu+4rI62ZXrNLbtl1k+dtC89li9qTYbn4XfWH9DAE
 gbfJyP5TshrFnejHTWA==
X-Proofpoint-ORIG-GUID: DXqQaHXelGgNy8gzmcfPS8H5qkGzFLx6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_095208_696335_C77AB424 
X-CRM114-Status: GOOD (  12.60  )
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

On Wed, Oct 14, 2026 at 02:36:45PM +0200, Bartosz Golaszewski wrote:
> Ahead of adding support for firmware-controlled EMAC variants, extend
> the ethqos_emac_driver_data structure with a setup() callback, implement
> it for the existing models and move all operations not required in SCMI
> mode into it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


