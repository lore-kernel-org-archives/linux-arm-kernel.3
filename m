Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A4AC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UU3OPZ+AZXcwBF+ykx1YfK6Z7ZZ5v6mM/Pmv+b1riFA=; b=Dq3wCaDOnbKAFP2p03N8WheU73
	sEX3ysq4UQI6LpC+YdugrX9QhGIjfpnVWQZdvP958VGG8z+RxevYJ3dUiV1UjETrJz7t1esg9CKy6
	MdLpsekA2miYv9+9NhuohfOfcFLXg7R5AuDMVh7Y2D8UimcN6xSz/5ToXtgDEWKAZ0jNc7op9M1KU
	I5qtK1/H46LRHgyYFPSaXtOhgwXwMrjVmyujswqncqKAyNPs1a/83eHC4Xlu/wAFiW1Bg5iOa7uPP
	BLi7tma0RY3G1iaaWGJX/6hmBbltzMJvZhFXMf3yn2kJElgU7J/Hxh8CVTsvTF7BM0tfqmjehfWVA
	ibBl3NWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FkV-0000000C4Pz-0c9J;
	Thu, 17 Sep 2026 17:18:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FkS-0000000C4PP-2IAY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:18:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH629S1640505
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UU3OPZ+AZXcwBF+ykx1YfK6Z
	7ZZ5v6mM/Pmv+b1riFA=; b=YudlXxSMbVq1R/3U+hw0kCNdYy6DO5XxrXM66HYC
	eUxrlmQryFDx1VW/AMcLRuUorMWLDwcYkHz2JgXJtOYXT0SnhUROWP+gbSG9nzLQ
	UmSmuetkRbCqUqZqO1hoRPRnNpjtKOlTep8dsEQQXIfztW+YAABQmNAq6psXU67K
	k4HfRon9RnjzSDkjKsRcudzzSvpgi4gKLPdHMOYuohzZQ2D+iKCVTJlf6ATa9Zmm
	IiNg56w8fXBpgyIQYO/uvX9NwJ20KbtcGDOafBluYlIHZmtivJGe/t0y14bvukbt
	gJG34CRLYpDFgBhIYiwBJqKyfPwqGVj+KfRiy3jyKur6Mw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0th95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:18:11 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so1174311a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789665490; x=1790270290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UU3OPZ+AZXcwBF+ykx1YfK6Z7ZZ5v6mM/Pmv+b1riFA=;
        b=gP5XFBM3e4aZf0OXavgui5o00PMTTnwgMFi77Z74wWljGvQIJAW4IVPK1eTWxTa9ws
         j3W2JOtaoE0OmTnDfncUKascOJmtW8prldsTirdwHfxOsf74dOG7ntdptrDMxr9/smCR
         VGB2pM/CySEAG59P9sDr4nWAcyU7/2lN4a36ecyE0/FjsVwaBJPZBgRKrg/DY31sERRy
         NF9VxiPGreCex4TH+9WhaRUAfOFv9jv36/dGmhVOeT2Z8vAMU3t0wUL/PuUlboCA8JtJ
         0P4NnV3RxdOZJzCxrE8qKZLzPPOEO5Kuw5y0/8WjGz8sfQYcnIJD4M2sIjHWJvK3XXZJ
         NSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665490; x=1790270290;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UU3OPZ+AZXcwBF+ykx1YfK6Z7ZZ5v6mM/Pmv+b1riFA=;
        b=k4dHWOHP1t7UOVnmeR+nF6Ejk7/BJUl+Ix6hCzK+yGZKbX2HStROPHodtZ5yaHD4sq
         0HFMynwbQ9VM2QnEM3YH+Ji9rIoDmV4kgDLfNiOcdVlOSDmpFsMzVA/JygyOIjXA5M7q
         JJ7xcylBard+w0+8P3yl0/Cc5elFrF7ZB6jg9Ykh9MTFwDTz+A135aH3wtcxdnf/JKS5
         1QTkSuNGEWw3YaTUuz7Jqa6mB21t5ZfqDNnxZKgAEX6UwZ8bLz4/+IeAYM0AjdJGRh7n
         xdXSmMgpyzy9B7vHT7NeUq9Fgd0kutAaEo1B7DAYyYtU4S4OidZPxm6bliIbfY3mhUHB
         bIhA==
X-Forwarded-Encrypted: i=1; AKwUvBxvjUIkpyGIekp+DmAnA0rVeBq853A8ua2oNN8gTBWDz7ZBmjHTif+7DPM31DD5dHNGieJlq2id3JFpEdTKbGH+@lists.infradead.org
X-Gm-Message-State: AFuF++kyyrqQ3FURnPOT8r9tob6BTToPN96ChHOQt0sqV1Yvt9xmIYoh
	3BlcITkW3e6YLYV849IN21YIL8Tigu1XoKqWj0MMGiLyRcpmqCsMQYqB2Uqkt2wBbek2G5vGv2n
	uPneBRbkV179zGaqgWaONub/FPkZR4yV29o/KVrsYBbBuxKQveuARHBN33+knMstftfrXnM3eaU
	Cbiw==
X-Gm-Gg: AYBFou2FneDid5NpxTkgRKs5mQfY0T8zhJYOR8h6S13UCA9sG7yuk5rXdEC5j0bGYZP
	tb0hE5PhtfStGvP5Gb+CAHC9Mf/cwYeMq9kVemIsWUnc5w4Zu4D4zjyNgQSA4olYRY0D9dYwfWc
	RReF7rJ3ymEeY9gjT3lq7PNgxfJY42ibQKCkZD05+L/QtnLHxlypJ5DuDd20sW+bCo5qCZUnTSS
	nTtWFpGXcPuJb41AyWNUer0LMKjGMRhrxVZtZzOXWo1glhvw8RlctrF2/+R/bYh0/MHA1nMakP1
	V51deMdaHxBtdilMO6POKmq9nT7q3DhC61miehThskRMXAgzldbm5pphivDMzu1W4yIKQYnGgxE
	DEOoc7awz5cydUw==
X-Received: by 2002:a17:90b:4c0d:b0:39e:464d:ebc3 with SMTP id 98e67ed59e1d1-39e464df3a0mr4120347a91.12.1789665490364;
        Thu, 17 Sep 2026 10:18:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0d:b0:39e:464d:ebc3 with SMTP id 98e67ed59e1d1-39e464df3a0mr4120256a91.12.1789665489670;
        Thu, 17 Sep 2026 10:18:09 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35df6112sm6159114a91.7.2026.09.17.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:18:09 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:47:59 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 8/9] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
Message-ID: <aqwgx/ZpgKG/7Sw7@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-8-bbe3389d0652@oss.qualcomm.com>
 <aqGp1D6ySJpTK1fB@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqGp1D6ySJpTK1fB@lore-desk>
X-Proofpoint-ORIG-GUID: 8zbXDasqGJozDyXdJPqH04O_SXDT63GI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0NiBTYWx0ZWRfXyCvUQWZ18AMV
 P+snftzaiVVF81nLhY/QY+uKM7OPyvJFLKTA4Tpcor3Wdar1Zve5LyzPeBWjLGgXY1nsENmbSKx
 Mfp42TD1BEmjM1ZHjXHmT/UuLMX0Tc0=
X-Proofpoint-GUID: 8zbXDasqGJozDyXdJPqH04O_SXDT63GI
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aac20d3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=oHFBo8UbpOLoADWG0oYA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0NiBTYWx0ZWRfX6FkCa0NhbZLS
 DZlu4xClOCiTRQlvNscq46pAIzKX0xOl3gusry7n45ChOX8jqJQBirahm28sDZCMqJdhM83yyiw
 bsOIUrqV2c5XeqGeDQh0HaCpHkxzOs55Ng08d2ulLSJijl58SUzJYyFvN9iOIK2pQSaPuo46uu2
 AetxJx28envPyiy5XYovnA0isLbpVpfzt88X6xK+X+pXB8U6RQHeW2J/hcHHe08ry7UtSzuCwrT
 /QaHm2BEGFUrYaSFG80qvQuwfSY6Vxol/Z7QUrc5TEy1qYqasGM2uKuZ5AtshURxGwwoneY7NSd
 YSYp5xZ1G+paK318gFL61/8Ow1DbTPfeXxqLrtdFpikB9178LjMyR7uU13Flvh+srzAFrCLOuiR
 syuYMMy1UA7jPl0dGfztz9ygQx7HmTNfA5LQxKT3cCZLoZnyOvIHl9w6/mSS2aW6JjnjZalsehk
 HaaDS5HOHGlcC/Jjmgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170246
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_101812_703435_62FB9183 
X-CRM114-Status: GOOD (  21.60  )
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

Hi Lorenzo,

On Wed, Sep 09, 2026 at 08:47:48PM +0200, Lorenzo Bianconi wrote:
> >  	if (enabled) {
> > +		if (ethqos->num_noc_clks) {
> > +			ret = dev_pm_opp_set_rate(&ethqos->pdev->dev,
> > +						  ethqos->noc_clk_rates[0]);
> 
> assuming the first clock is always an OPP device seems a bit fragile to me.
> Can we find a way to enforce it? (e.g. have a dedicated clk_bulk_data struct
> for it).
> 

As Konrad also pointed out in patch 9, the opp table support needs to be
fixed. I will fix it for v3.

> >  static int qcom_ethqos_probe(struct platform_device *pdev)
> >  {
> >  	struct device_node *np = pdev->dev.of_node;
> > @@ -795,6 +895,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> >  	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
> >  	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
> >  
> > +	if (data->num_noc_clks) {
> 
> I guess you can drop this check since it is already done in
> qcom_ethqos_init_noc_clks(), right?
> 

Yes, this can be removed.

	Ayaan



