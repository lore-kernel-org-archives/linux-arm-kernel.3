Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEECCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=; b=oVn9j78Aq2luyMGtSjmLP212gA
	Pt7mcvDOg34IJq92/oMWDHeM+Uc2bC1P1B986k7PUPgvIz+HMuAnRZy+LoPH7Wmlt77VEcsZ85pI6
	1Q99aMZHhHgHO7qM/p07X6I2UQV+l41kUq8ETYdyjGa9fbxIIxMv6ZJU+Rx2z9v/uMa4lBj8dugE7
	dmMi0a3nO5A3j2hJDL4fs5E+Kj7UYA334Qw+XDAjSJd+zVDEcLvCw9DXTD7pDho3ubsGpW53damRb
	SMgzzvwwVZNUGq4VaatLTVHBzBXUyR9KDmYJk6ueG3LIfcz9gqh1ypQ2Bfp3HAJpEsicC29tlOro1
	ABoNE6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Uk-00000004wmk-1xr8;
	Sat, 17 Oct 2026 16:42:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7Uh-00000004wjj-0WyB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:42:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGABIv1480699
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 16:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A5QXkyLgqve2yg7aR0QbgBy6
	tWTAd+S8xlmq02cu4VU=; b=lNhoZ5KmND8CPcI2ztJrmEz30rkXHlfA6ZXPZ/BF
	dIjaldaBjswQDQz152ahMBvv8elLhUYIikte8R33fvDM1XFYB4bJJwxbmkydvHs9
	eShIPCBWf8E5pwxIyBHGeuDQy6qdqbdVggs0w6DviKRSBV4mr+P3cTJTp4wdY74Z
	5KS3ymg6PgRQRKbX/+YVIu7Re+hZZAA+q5SytRzeNXF0f5SCG5w6ckx/tUicRxJW
	NwxJhIQeClRVZ0OtvWLuWHL0rqEzv6Gfy7aqB1TktkhdKtYwuruOrhAkDsgnYJJ5
	WmRvDQrRAWN6umuhYE7m35Y2hOg40tfgMs8wZ1wwrVlYWw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc13usay5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 16:42:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso1863185c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255369; x=1792860169; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=KHHRRs9D9rXxwuqStD72wm0lV8UbC9/+xsXoWFejfstpoY2ng3UpEUh4VTUJ6VUe5Z
         BVFqFQ1rtfv8Z1lSfwY+vwTYDVI6yf2+Sg2R+hcF+KYZ0+6fgKJpZ0oqWBzq57MiGSJ1
         cqYqakSV5AzsVKLRxZkOHPTGC9bqSNA1zFo5558/rG8jG+thrBwW9G7/skx0bop+zq/r
         Re4zS4R4wcpUkjYb8v5rrIWR4NdvhDUa+614Jvb3q017u+Nt3tSqHcHsXsk+Bilkra0t
         xEMoTBuoETFYF6Ng/RXrjxKCRYUILeBgzBifug5f46XooI/AMGekq287lDAlxtXb6tXp
         31Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255369; x=1792860169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5QXkyLgqve2yg7aR0QbgBy6tWTAd+S8xlmq02cu4VU=;
        b=A/0xFZ34nJq86Z+6zbx/gztCf8evwr+OzoNCa4WyGr2NE/sIZ61iz18kZD4lI/kZp/
         F03xJCxT1PM4nZBOnFyzYophNxZ6MI7yhx6tmfpJ9okHLRVOEufL58SQRypTO5sDqz3H
         NX3eU8D+otaTXYoZ1zvafHkVGYWbiyIavghc5tIWGiZZ/DZw9C5CaA3+pGuXxbnenn93
         ZJS3XVR7sExx1x+an9kK6CPeFCmiIrBDZpUST5qKOd24cpIC4juKgakTnhJ89RZ8e4eJ
         qV64+pPkoqfnTMSWaW+QBBQRncdEA2SGS1kW6KXFJZWW275gfIuF/njmRmDFVT3rfM9j
         9MxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgQBh3ikB1JWTPt8Q0vtzlIzR/mP8hh4nvzkD50vrds+lXZ4pUSGmL5fdBkLvpwhy8Pz1GZ/rqL8C0UsQggZRV@lists.infradead.org
X-Gm-Message-State: AFq9FYKEgEDJ9hfXa8CYUIAejxN3VkVhSau7hjtZar8mTxp8M7FUs+ns
	3457pLhdnSpBF8YOIbVLnHM89DEMkOFKroq4sjCXrqLCRtevgkuO+iLlbjocTVoof35Zocs2da4
	rvQuqyZ1R48ReDGCJ23y0ynFJuz+h8gcCm+bXkRKUtws887HguslRngqPN5EtDymKYxMSb7574C
	8ifQ==
X-Gm-Gg: AYBFou2F84dun1xuUwancXWlGC3hp3FQ3hpXybnxhaxlnCz48UKaZxAJzd3Pd81mb0v
	gth4ewhnCYikTWkucmaikD2eM8iELIQj+KNHgQ16ccAQDYL2VxAxQCCDJ5dcVuZLZnV0wN0aQ0O
	qBsEUpd8Y8AUod3nGRxw+ZM1vM735cbjVko9eodjGbCdDx3nBKdpl5UffIrfC71ndQ8JnsdF+e/
	XPT+Qx0jyRXyNM8hCy4/bWmQkfI9GPeYywWElDalWK/T5KonWHKO5s7AOD/zHb4VKZKl0NJaY6C
	i2yaFLWvR6Hsuo1hlbvyK54uHEeDgZoamJe71K8rGXN1vSYvtUvkjLoJu7ggB/xVlqEWhppgM2E
	OcWzGMTQx5w7CUA==
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689721c88.45.1792255368735;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
X-Received: by 2002:a05:7022:7e89:b0:14d:ef19:246f with SMTP id a92af1059eb24-18513e7b18emr4689692c88.45.1792255368055;
        Sat, 17 Oct 2026 09:42:48 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm15041602c88.5.2026.10.17.09.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:42:47 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:12:32 +0530
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
Subject: Re: [PATCH net-next v16 5/7] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Message-ID: <atOleDtybJde/UE8@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-5-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-GUID: Q48xsI5HKl_6ak8tYyAjQnLexS5v6jfF
X-Proofpoint-ORIG-GUID: Q48xsI5HKl_6ak8tYyAjQnLexS5v6jfF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX6oespeiS4gWG
 26XJTpo8et04nTx1cZ9LAHxFBkaf3VXx5VUcvC0EavfGz0M8268ceylZmba4gT68oDhPuv7RgSQ
 P1VOopQpVI/a2NJ3cIlrT3Haygo7BP8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NiBTYWx0ZWRfX8xnWt1CAUjIm
 Kvjk/BoWSKY5BQI3vp7WXGisnvJLn0fS/7X+eJ5iKsl0OP0AwlMG3f8Vzx4IkAzdoklylDNGt1d
 uMFOJ0udJEZRrEqJLFZ1n0VWZdyu5/3g9DJXMSo89oAkTXc5zqUTpX5vNmeZLwUda+6rQoRvYUT
 JnDEdHhw0pR2et7l1tR4+5VLwslq7azIUdcQ37UPdSBmUCs4BTpjXITjJOzYs46X6whS628IxJQ
 Dl0QIGPPnjmA8e+80AHFHAqkYVPpr487h3+Jt2RhglmCss5lFCxate7uYy6bVn7hO+oCHzft8s7
 E9fzKrjbmEPXYkbPMtrOdEWlQSqGFtVdUOGmWK8OOPWAs8lSOlC4tnjgof4KwkOaVhRYwYZ7kL2
 NQBSOs9aI2CW+Spy6dRjwr5g/oiM6//sIXGBDSdbsg9tcB/KH+cIqntWd6gdLUp7nPTZLM3CS33
 YRidaSGeaIMGdc84xIw==
X-Authority-Analysis: v=2.4 cv=SKzXx+vH c=1 sm=1 tr=0 ts=6ad3a589 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XX1oeNa5M8xgm1Jp0F0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_094251_284481_95474BFE 
X-CRM114-Status: GOOD (  14.54  )
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

On Wed, Oct 14, 2026 at 02:36:44PM +0200, Bartosz Golaszewski wrote:
> Instead of needlessly copying the fields of ethqos_emac_driver_data into
> struct qcom_ethqos, just use the address of the former as a reference.
> It's .rodata after all. This is done in order to avoid having either two
> calls to of_device_get_match_data() or having to extend the latter with
> another field when adding support for SCMI.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

After testing it on a couple of legacy non-SCMI boards, I did not find
any issues with this patch, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


