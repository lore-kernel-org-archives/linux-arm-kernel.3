Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FA1D2F002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJmDDECkW3iXsL3g4I3qEOxha59jVBDs+hiTdIwu23k=; b=Ucslc3a2Bv/S9ib3IqW4fZvYxG
	zNfB7fJm/Qd0dlAHdXvCYWt4tdmSEzLriJRILKrtM5Wwf6aOUeWOAoIXzo3y5DuKdqGGQgbNsUdxv
	1g0gnrMTqBL/RMlWUXJejwe62VOmXmjXth3Yq2xB8ZOKB7P5XJDO9cB9Zo5YknugAvj2oOJy9WiC7
	5LsCO5cSSQLEKZun87unY9eQ0GWGyhVYVNBTORGqYUidPUTirmmMeslgDupDdoPBWEBRqiu5rIyh9
	RaNrhaK6u+SwPaaBlxWXltf4G5u849D4ojmBBXWfoTrk6Rw0r4pINSW7SORL/QXs/jB8I/61K9CAg
	xwH0aFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhq3-0000000EC3E-3Eoa;
	Tue, 27 Jan 2026 12:06:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhpt-0000000EC1B-1SRE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:06:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBwwt71793628
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 12:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oJmDDECkW3iXsL3g4I3qEOxh
	a59jVBDs+hiTdIwu23k=; b=SFCOd1M44pt3IzqJIWZy8H8I/QoiF7NXN0rgT0ia
	B19mlTG+dl4OUrVUz+NXmZkqvKzSH2Fy3/oQD+kZqHrZnwT/VkWrDinTkbzmE9N4
	YN/6CH3qZXc7sLY6wDnxZMMpwUbpoQOXpE0OJJ0mQIgoYkVavb9Ro6QrJhqTa8/f
	BtArQZVv9m3PyvBX9f7eu7HNoyjTIkDkjvxpexz8b61aHAmo2eufC1MIrq9/1mDB
	+fR1BvhXvb/Q2Q6Sa1IKodpPpKIjNik88CcAuBXTSBkKa+zINxdheG7EgkxMWIGo
	Yvlttka2K2gQdZXxgdXi/wn6Lf75pJ+xV3BjyoVHuJNj4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxg93jfgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 12:06:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-353c9d644b0so1655655a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 04:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769515579; x=1770120379; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJmDDECkW3iXsL3g4I3qEOxha59jVBDs+hiTdIwu23k=;
        b=D0qmsqh9D8thkI370q6L4LW3spK0NqpBYl0B1O5VJreiWCtaz59aJ8fC5CEGZAaqno
         +42tFtszWoA8MFhfNloJxl17TB2TCmqNZApQu1+dIHozYrrHYYTnRADYSsf1lrREC4Jh
         lV3Tg4HWRvs6UzsX2U4uHbLm+zp1VNLNWrnKP8gLTVhXjtuZMbdZ1As4EoiTyhqf400T
         Zd1zDodUDq3YVhnGUC6WhioYOC0JxTXZSlYMTOJyX+fL8/NXRor8wNIADNJNmzxLmmcq
         27S5RHiB1NVXAO3ZA8aMp8ix3/cki07VfqKoPjxqqr6DZI19S3C1jUQ8bMOGV5GlGE3X
         /FgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515579; x=1770120379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJmDDECkW3iXsL3g4I3qEOxha59jVBDs+hiTdIwu23k=;
        b=xI4/cOprzGNgXZ7piQyMlcB5kArxv3gVRwnlkItTKCwor9FqfMdHvQArLF8/AJrPDz
         Qx4og++rv3D5mTwiDGwlKxUO7HL75qXfOGYsDsoFIgERkKL3e2R/m6QI2VladktudE6N
         Ui7mE1z38xxSHXA25qlvAGn8mIx/GyPbRKPh+5XxO34/XqdBEyFCmrYRBXST3TXaSjgU
         3wfTnurXYuFl0lGDNN/zm4mGH4y952Y1Z3eCTNWJb8NfgW9gDcbUq2qC1S/sCD4WJT0e
         roWABauS9VTcShFNvDM3ErNvlU7KgarUACwA1KPLoXz7nXIDwxxIKSwmEHm+DUo3+b3U
         O+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVG5xjoMhoW1DvTl9o0yZVu5vaM9bzu54XaHB/92sLgKEQDHSTfMgSEeAooKOU7Z2+ku/uAiKJhNHleCW/dZiy2@lists.infradead.org
X-Gm-Message-State: AOJu0YzMDEclhPO1ovPFlV8dhByiF5a+eEpckJ9G6DfPjM85Nwd+Y81e
	JQxtOrTYYScC3CtJ/dPvAjbTe/Oud8PBOGVqVyZLdQ1AEsmROXvaZQYOcYsMnFTmvS7+rHAYK1r
	mpctjrMfWrXCRRvjOMqHKr1a5//3vYMWFsgwaSyZglf3dEG7/YcKOEqDWwXZKpQbhTgC+Gh8WJ/
	uAOQ==
X-Gm-Gg: AZuq6aLWPN1YGKiILabbHU9UQIhpRuEe2IYDmni/sg2SDfj1TSD0m8NwjhaG5blxeAf
	HI0Ip5GC9qA3EiUnO4munak+0GIDnfiG3BthVukGGW4HNQUQGQEZgJ+zoKejIDrnjDD3Wqz3SSY
	EoicVrKfto6/7nrUe01aHkM0Y0VF73lBMQYsRzJihOpUfKENN7f9WIGK2OwX5R47Z7g/rb1DrC3
	u0pwABAlDsLa04RfDQVdCEAzFLb4miI2YMrxE/GFk4Ay1yi9x2828W22C1YjUV09otkT1ym0QvQ
	eR18dNlTF9BRR9z31NXbjL3mXWTLY9GKusDQm6izX/4+hsOS7QAtTLkLgRpeyK26xuZwGnMgrl2
	0nycdeVsywDcQ8gILwHsUKmg=
X-Received: by 2002:a17:90b:2dc9:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-353fecc66admr1463644a91.3.1769515578701;
        Tue, 27 Jan 2026 04:06:18 -0800 (PST)
X-Received: by 2002:a17:90b:2dc9:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-353fecc66admr1463627a91.3.1769515578192;
        Tue, 27 Jan 2026 04:06:18 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61292bdsm2411832a91.6.2026.01.27.04.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:06:17 -0800 (PST)
Date: Tue, 27 Jan 2026 17:36:11 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 01/14] net: stmmac: qcom-ethqos: remove
 mac_base
Message-ID: <aXiqM+rYK/QCy6DW@oss.qualcomm.com>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <E1vjDr1-00000005fQ3-2rcn@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vjDr1-00000005fQ3-2rcn@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OCBTYWx0ZWRfX+JhPfQwgPbud
 /ZLPG2qUFJkiI3SwglnDuDpnS7IK+Ua7JPR1ZaSWnqEAJuy6CprH9kZw2jJkWCKT04GkWP58ibB
 +DX9XEIwsRPV2G7QNxhNX3PY1kSdRrIKZm+pQ+ESXSjteRdbdSffMdDfozLzwxkj5J1PkVSYEJ9
 D6AGaFmDKHQ+T5uzhFIbIzCQo5sQqiYgeFI06bAOyN0lyPegP6zYBmORTIrQyRHMh4aBIzQ1E/J
 vQeM+ZZwEOC9hegcj6lgpjj8V7kmTvACEFK1bwXyRMA7sx4ptnv0ADRvU7d585E/JFahepP8zzk
 PI7qPg9N14AQhjCv6AW+8RTKK6c1wThBCn6RBhm+s0B7aQ4C7dKgASnSuBKAnqwdLt+Ie+Si/1x
 iBXC2QYCUmNYX0ERVkZUVWfu20bEHb2uM2A3uwMYc3+3+y4+q47aFSyh0i2TOY6gVA/zCZQWUi+
 jicwOVUASSv6tVEgPHg==
X-Authority-Analysis: v=2.4 cv=Uc1ciaSN c=1 sm=1 tr=0 ts=6978aa3b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=2f8CEio2oMm2juszzV8A:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: QHYrXn6J6LdkL1cCvQVc9FezYhO0U7KR
X-Proofpoint-GUID: QHYrXn6J6LdkL1cCvQVc9FezYhO0U7KR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_040623_461925_1674F490 
X-CRM114-Status: GOOD (  20.57  )
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

On Fri, Jan 23, 2026 at 09:53:23AM +0000, Russell King (Oracle) wrote:
> In commit 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
> modification"), ethqos->mac_base is only written, never read. Let's
> remove it.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 0826a7bd32ff..869f924f3cde 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -100,7 +100,6 @@ struct ethqos_emac_driver_data {
>  struct qcom_ethqos {
>  	struct platform_device *pdev;
>  	void __iomem *rgmii_base;
> -	void __iomem *mac_base;
>  	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
>  
>  	unsigned int link_clk_rate;
> @@ -772,8 +771,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
>  				     "Failed to map rgmii resource\n");
>  
> -	ethqos->mac_base = stmmac_res.addr;
> -
>  	data = of_device_get_match_data(dev);
>  	ethqos->por = data->por;
>  	ethqos->num_por = data->num_por;
> -- 
> 2.47.3
> 

Validated this patch on the QCS9100 Ride R3 board, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

