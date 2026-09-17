Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302C5C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOIfBhA40d1n8PGVV7JnUyBrJvf/oegeKL4mbK8Sj08=; b=T5ZoszlldgAo1GtTbSlQE9zAzk
	rP6wZaegiGV0xHYN7rftGzI3ZYB9GyjGdDowN6rO5cSAeBt7N2zC6np9zQlDELJhkRNXXIi1kQwe9
	pZaqIsS36vueExIqDamvQCZVBb5AnHpeAAD/nRFZ0UIPEkJ/hBSnYswcUfrgrFxu/IUR81c6aK4By
	TVZ/FIpsEwHIWdy66VDY9HeaiQxYXZo2++mCftraLOzvSKMqZjMCyQa6jI9DhDe665H8y8Q0dnQgy
	vCsCl9qFhfXzrf18EvqUD0JjXBNjMcOrn/z8m6/QDaTqlR6L1UD6f3YxwB3egq0Khz/+ogcPzkQVe
	yd+n8FaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FdK-0000000C3VT-3CG8;
	Thu, 17 Sep 2026 17:10:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FdI-0000000C3V7-3HSa
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Sep 2026 17:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UOIfBhA40d1n8PGVV7JnUyBrJvf/oegeKL4mbK8Sj08=; b=YkLAD0O4Q/ecUkpdKUuY8okaAm
	KJcmpLCEUpKM+mvjEN9Okg4THxzN9L/6Nya1JK3aBq6cCHvOegzDHrU8DsyYwvSxwlTB06J9NWBOG
	/K3SBkzOPDTsajvEpcTL+qgieatosIKuK8M/9Gaz/sSDkx6xJeGlPq4dhfs33umdAE7uhMBi8v5Tz
	5ioJ6QzmWIh6WKhJ4jRNQxtGJYlKKI8aWzzYZIiH9HGnx9uzFsX8YCcOan/FljPfkMpLZ7AjPjxsx
	cxZFeeC+BtOytd9k87lEYE6aRE2eBScwf4wKsyxZw0YzRbmfsMsO4gqrqqpxOiTm7BS2w5/QJGwKn
	mYW19Z9w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7FdF-000000095pZ-1hPU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:10:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH63Xp1640538
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOIfBhA40d1n8PGVV7JnUyBrJvf/oegeKL4mbK8Sj08=; b=ADMf4+X0VvIg4+cY
	qhFgvhbSF2+YOJgeDEkgfW/y63HwFyW4u4joRNohoaYUKHcjP56NMONMo9PKl/Dn
	btkNJjvOGRR2bIz+jYyJJerhy5I11WW39CxkcAzs5RRsrRWUS95QNE5BqJidIgEA
	vZIou+/eNHJT5XqVWIETRD4oAbGGwIZRUSLTRRhm3zJP6dJQXQclNGxW8Np3stCI
	Z8a34uWaEhytiLJZdqAOxjbBv2OlcXEf1xUTkn5eFYeS0f5Tdb9fwcVLJ5kl4s2+
	M6KBOvQpjwm0buH2Gu6ogijiIy4swqB5cUwJtmigVVBJnzTA/vVXdrL1pYm5Gd4f
	EBkeNg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0tg32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:10:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so2431298a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789665040; x=1790269840; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UOIfBhA40d1n8PGVV7JnUyBrJvf/oegeKL4mbK8Sj08=;
        b=CJrMT9IbalzzRXQJ0n3hNtKQ3V/XV5vzbgL0E+ZvUNdlC1Bjy/7/yH4Dd5WFoD0pqC
         4FcD9jpzzCU7PAb+tV906/mUcAe8zoh/iPpHiFG/DwZkruRbsRsWYxR9iTNFuZ31CK3r
         GtUPo+FE5O9pUJdp4vNAIbWNOT+ocr1DPsJb7xZUREMinzGkXhoAzTZVWMeTw5hyging
         g93ttHr3ZJ7Gzomx51VCuWxD7H82dQ/CM4mwPO2KaiW1IhvwtUhEDDv+oR6815WyZXdE
         VWSkfvWW6WYKtVpXaHwSwE3lE0Mfxo33BzW6cQA39WZ7OGMmjMN7R27uLFobyJzlKcBd
         v/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789665040; x=1790269840;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UOIfBhA40d1n8PGVV7JnUyBrJvf/oegeKL4mbK8Sj08=;
        b=LlBv2DJkiqqBz8M4ogwhjMo3UZAL4TlHxbAPjgAwOxuGYRwp4zmmxoDpu8Mi7PmnSL
         ppMGRzm305jLRxQaIz9POobtacimnX1sp/gB43KfNLLzXXOWZSdJ2sGcgaLN8FWZAv1H
         3GH3OFcBNmRapU9VpJBpTAxDzonpRzhHrGz4ThgkigWytV6qB8/TdPnGitNpFZKJtgKU
         hZlfPICNFL8be4FeL6A7eiUg0tC7YM8X0x0TdHffsN5C4XmeTdGzgW1ZK5VnU+/vCbdE
         bg9T+4uxGvWgXMQPX/ichhZ6bfCIqwQclypfNdloY7nFlGWshUurf/G38KJGt4niSQiy
         2uag==
X-Forwarded-Encrypted: i=1; AKwUvBzt6zI+MwMsIj1hu3eHW5EYBQ2pkMOoxfQkMtatF8jU52/k3EYc+s/DObi2vXHmF0NJTwrFmi3MZky5ep9sD/za@lists.infradead.org
X-Gm-Message-State: AFuF++m4lSW15ycdyFlZ3QaSYTkqGMzW0SfKY93krA7WA9+PHkZOdnDU
	WxsycP9V9aJYMe9klA4fG426NzB0f/kB8kV38B9+mQ54ITCAMST/gYqf1oQ3AiivtU6E7TqP3zO
	OtC3DzIA37Xrgn9rXnNoTuLv4iJBvyXyMn449i7jsPsjiue+7PhsAxCJmMxJEQtkh6JIIigAmf7
	5adA==
X-Gm-Gg: AYBFou2rmSkHJjdxCUidWq2M4isOCYXyC/ggcG4AqkXpU9oNM8ZtksDhKYuvm11/lgE
	CUjCQnjPY25mbVvDOC94qn6w2y1O5yzNyS2b/Psi8ct9s3l0kZrv7QIbSjUilu5xJygDmvbJT/o
	GSwWfIDYGD8mvFrB7Q5ptgxn3kzMNvgm6g4iH3NJw7Cb23ykXzdLdFSAqAEqCxkPwHd8CrBmf60
	vMRpLXNUT6trLSD4BIwAlRzq13y+5Lvx9N7sJaV1SktdTl/Hljf1b+4wYsP+xiDkr6wgbbpz57v
	Azsl/eRyxCqaYFqx95m9Up069KBqOISSVhbLmf1xKMExiO00P+bB0HpED5T1yqgKZpPCqWWbzS0
	wDqnREdYEkS0b
X-Received: by 2002:a17:90b:4f81:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39e1e4e354cmr15686542a91.22.1789665039948;
        Thu, 17 Sep 2026 10:10:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4f81:b0:39d:febe:7460 with SMTP id 98e67ed59e1d1-39e1e4e354cmr15686474a91.22.1789665039322;
        Thu, 17 Sep 2026 10:10:39 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35df479fsm6065347a91.6.2026.09.17.10.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:10:38 -0700 (PDT)
Date: Thu, 17 Sep 2026 22:40:29 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch,
        hkallweit1@gmail.com, linux@armlinux.org.uk, richardcochran@gmail.com,
        andersson@kernel.org, konradybcio@kernel.org,
        alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
        joabreu@synopsys.com, maxime.chevallier@bootlin.com,
        mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 6/9] net: stmmac: qcom-ethqos: warn about
 legacy RGMII PHY modes
Message-ID: <aqwfBZmJehXB8d8U@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-6-bbe3389d0652@oss.qualcomm.com>
 <178912591683.219967.17377991068527504766@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <178912591683.219967.17377991068527504766@kernel.org>
X-Proofpoint-ORIG-GUID: TPh-IlLGja93_tmDOV3jVQ1Z-Q_1Iq_5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI0NSBTYWx0ZWRfX9zHLTiBvcZkz
 4+Kxbtevo725kLIGJUgyGXvSi44GLAuL88Ubh1mv/HLm5vIhMr47EklEdyiJv9Z2+dTRw+6hxzp
 lCxfbYeDoZDWZmorla91kM6j2MdkVPI=
X-Proofpoint-GUID: TPh-IlLGja93_tmDOV3jVQ1Z-Q_1Iq_5
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aac1f11 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=bzSRg-MVb8Bu9kwduOYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI0NSBTYWx0ZWRfX8d/TXndr4ESe
 t2FcCeGhvVUZWXGicvqyAxRnKn38oRZtP/CFCJ1/jNIPIG1igI5b/LplhY0UrrSUuX5hvPOw6ay
 WGSteKjH6ujUGdvlDzcVxcQub4UsAPbXvcjRbE6rPDiwrhwPORZ6vtGIMbYo0HUyhTEviZ8OYbw
 eNq70nq16eEnb9sOkAqYNpxBGTmRSWdoY97/mpKUWE7ThHfLwjwspg0iT6LD3fxWl5HFFWBQ8AT
 sDw+wxrWXRS8uySbDe1ocJ9NeMP90nIwBeQjshlI7P0vSOHmYvxFxoGSTqXFiWZPK6+C8uvSddp
 nyLHB/WFj+eg+OlHgc4A5s9oSRKDTU7vcnFx1YZMA9IuGg10TiE7rHYiGLZT3isBaIdN21Qr+NO
 Is+G9nRLPPZVfRK48BUxiCB10OIotGdPYfeCP1TUhqIf021MFbeNrIFQe12fNj3Nyx21W6lzg0I
 SvqmsxlE+GRGXabKdAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_181045_719556_D35DA0D7 
X-CRM114-Status: GOOD (  32.51  )
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

On Fri, Sep 11, 2026 at 11:25:16AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> - [Medium] Unactionable boot-time warning on every in-tree qcom ethqos
>   platform: the new dev_warn() in qcom_ethqos_probe() (dwmac-qcom-…
> - [Low] Commit message / code mismatch: the changelog of "net: stmmac:
>   qcom-ethqos: warn about legacy RGMII PHY modes" states that "existing…
> 
> --
> 
> net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes
> 
> This adds a probe-time dev_warn() in qcom_ethqos_probe() when the ethernet
> node uses one of the older RGMII phy-mode values, suggesting a move to
> "rgmii-id" with PHY-provided delays.  PHY_INTERFACE_MODE_RGMII_ID is split
> out of the shared case group so that it does not warn.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > index 53fb9de4d92c7..a92bf4a6a2dbd 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> > @@ -764,9 +764,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
> >  	ethqos->phy_mode = plat_dat->phy_interface;
> >  	switch (ethqos->phy_mode) {
> >  	case PHY_INTERFACE_MODE_RGMII:
> > -	case PHY_INTERFACE_MODE_RGMII_ID:
> >  	case PHY_INTERFACE_MODE_RGMII_RXID:
> >  	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
> 
> [Severity: Low]
> The changelog says:
> 
>     However, existing DTBs use "rgmii" and "rgmii-txid" and must remain
>     supported for backwards compatibility.
> 
>     Warn when either of these legacy PHY modes is used [...]
> 
> but the warning in qcom_ethqos_probe() is attached to a group of three case
> labels, so PHY_INTERFACE_MODE_RGMII_RXID also warns.
> 
> Is "rgmii-rxid" intended to be declared legacy as well?  The driver does
> treat these modes differently, for example in ethqos_rgmii_macro_init():
> 
> 	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> 		phase_shift = 0;
> 	else
> 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> 
> so which phy-modes are being deprecated seems worth stating exactly in the
> commit message.

I will make this clearer in v3 that all non RGMII-ID modes are being
deprecated.

> 
> [Severity: Medium]
> Is there an upstream DTB that this warning can point people at?  No in-tree
> device tree for this driver uses "rgmii-id", and this series does not touch
> arch/ at all, so every in-tree board hits the new warning on each probe:
> 
>   arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts	phy-mode = "rgmii";
>   arch/arm64/boot/dts/qcom/sa8155p-adp.dts	phy-mode = "rgmii";
>   arch/arm64/boot/dts/qcom/sa8540p-ride.dts	phy-mode = "rgmii-txid";  (both MACs)
> 
> The binding example in Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> also still uses:
> 
>       phy-mode = "rgmii";
> 
> and the binding carries no phy-mode deprecation note, so the documented ABI
> still recommends what the driver now calls legacy.
> 
> Converting those device trees is also the only way the advocated
> PHY-provided-delay path gets exercised, since ethqos_set_clk_tx_rate() stops
> doubling the link clock only for PHY_INTERFACE_MODE_RGMII_ID.  Would it make
> sense to convert the in-tree DTs (and the binding example/text) in the same
> series, or to hold off on the warning until a migration target exists?
> 
> > +		fallthrough;
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> >  		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
> >  		break;
> >  	case PHY_INTERFACE_MODE_2500BASEX:
> 

The plan is to convert the current DTs to use "rgmii-id" after this
patch series.

	Ayaan

