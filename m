Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D9CE9A035
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QmuUCEZrBFNgSu7w6yY93qGdfCy2AGpXr9u+0yhsQM=; b=3MGuokxGvrD+5rUd9O+sgJu24V
	Ca+kpemQyFK9+IaiRB9TnGNbXZiGeV1vBZl9cjesnTaX1ncVdAwOC8A0SvOuklZJXsi+S7Q9qB8xc
	c7oFAds7WUeM5kW6/usmnyzf41O63IjFIrH1ro6Uheo37NVxRofopa+90u7ZNvRQSfyAHN3y+TQu7
	U3xDUjTjgqEEJCdWWZmmCWuttINDgM9vkSe7GsCS/n6+ISxFf4f+mmlYSBwsQLCe21FSaBxA1BeuR
	u9GmsXg1LHEgg33zRKHnBwaKzjqKqhnSv/PMqIikv0gL82jbimo/lYvz1irTfiWohmFOTG2l9E2WG
	34BuaS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPwo-00000008jUF-161X;
	Tue, 17 Feb 2026 18:37:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPwm-00000008jTZ-0tVp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:37:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HAvjtE850154
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1QmuUCEZrBFNgSu7w6yY93qG
	dfCy2AGpXr9u+0yhsQM=; b=dFB0OLP/P2Zw+1rUZLCk+oVjBbPLZfNVad5hyE30
	3eyHyd594rlb+oaHi0wm3ZIT2iPUdiV/Kn1AzykObKvntO5Et9uTUkDTfMz4YGsC
	hC7sUFSRE5FVE0ZhHQlP1NrT7TD+Y3dBzCGNcMqx5E3eQgKjd3KVh6OHmKN9Pf2n
	tDSkPmxLGeNfuUh5NyYs4pt0AeXPWzQ9DH6SALarPo14S98LmrUqi5xwBlPdEUe8
	k3SRvDf9AAL/7qq5iRt8o4gdOHSeS0V8laEZS+30ov6ggr+YZmoaQHEbA3Tdfhh9
	UhGrYkpQPsoHnT2Fmr8uXt/9Dw2A3TFWtNCav7JwRIgDMg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrufv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:37:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a784b2234dso249730545ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353438; x=1771958238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1QmuUCEZrBFNgSu7w6yY93qGdfCy2AGpXr9u+0yhsQM=;
        b=fxc2dLJlA1TWxc8186Cbxvw/5LMPpdVKdxB1IIwC72Ki7bkz2f0w5haNDAhvb5r0UP
         P5+1liQtS4d/K8L2Cvy9sstp8PZq46kGWKa06erPhaj+1JZvAy3CLltPObGYdfW2dB+6
         AklMIIGt+87HVA/UaO9K+/9Bm1wfwCCpGnKAJy5X1xSU49LgzWJYZ4UU+1SdHKxEa4Dx
         C+spIsRGxtsdfmkK9oJ5xdh2WKcBlDm9hFAEbpRNfEF/li3L/38U1zLVW/PQ5BrTdPNj
         w6EC5cyorQANSlFv3hTV/m2FJqVH7BnQB1vMb2M+6SLB9sD31QF0tC+vmUFKsu709AyI
         vshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353438; x=1771958238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QmuUCEZrBFNgSu7w6yY93qGdfCy2AGpXr9u+0yhsQM=;
        b=H9fvYLvNqsyfpCKZpV/6AfqQcsX934d4hW6CVTtDNr73UJlxteKizmjRCf1cIdTkNl
         CCM9zBUhKLyrUn6W6HJ1gV72S3za9WNorJLc4BP8hN9tzRqbnUVpAs5u7suc+13ps9mD
         EcEIfg/hkEQup42jd+Xh70+BKb5G9JrzQaJ85hz3V/IreDh1JLuFxAA2jt2uoIlardrN
         PdrqfNLVrUMqaNXuDD6rcrlqF+38JGUsACmpc/w1WjR3QC5OthZwjUUtG0SeRbBwwwoK
         vKPRNh3Th9+PD0+pPfmAYz+lcDUeD6OvIJFDBBmqXD5YCaThU0vY9iUVHTw1iZDPCaUO
         Ujaw==
X-Forwarded-Encrypted: i=1; AJvYcCUocdqJy1i6KG0g+cpXGX7AE3+t0AkEdtTpeMu5gBhr6Wr1aVFDb3zKluhi0FhL6bs2wMigyVV9fhjluRaRpMA7@lists.infradead.org
X-Gm-Message-State: AOJu0YxJQs3J63hgHfAa9ShnJgj3pqdEOETiTNwUcvz4hL+VTaM09tmy
	hArDx2eN/cmAodaP7fXL9nwGDgILd0TWxmoeargevFRp1fj1/jI1QbGZ5pg0QgN9/avs8lvMy28
	fKpvmi/27EuOLBqVexlbDCCmAb4ZgUBuu0Z0k75ar9nfdDLRb2jVPzcgHpDOAQeonj5O1/Pet40
	bpNA==
X-Gm-Gg: AZuq6aI73O5TSHPe+fZ1W6eBRCpctG26jDwcJPjUi1J0c/+z+kh2rbjrv78FkeQD7Ri
	kArtOHi0SBnCY4GtMDHGykZRd4LbUbH8uxeRqT8WjpXEgrgPlh7uUubtjHsoWthCqj4dezjZC+7
	kQL+Sp9YaXnBdQvH8y+pgqLME8j9vIy2n6v034ntqOoUEUkHmsE2vRW7BjhlaFqwgsvK2MehtoS
	wenvE84hYObcSM66uhlPOTnVInIhB1pMM22ZsPVijVWiCct0PgiDFavGIa+SFjvHwpgoVjF3mJc
	tX9HnZx3VqGxa0n7yIw167ZPfkPKRVwWAoRA+LMB1ggZdoNq/O+TNJjBBT99jR3HfXenZC4QmRs
	dUGarYnv4galdpgVQragZwpXLVvX2Zlst48k=
X-Received: by 2002:a17:902:fc4f:b0:2a9:6414:71a4 with SMTP id d9443c01a7336-2ab505146femr151882715ad.16.1771353437882;
        Tue, 17 Feb 2026 10:37:17 -0800 (PST)
X-Received: by 2002:a17:902:fc4f:b0:2a9:6414:71a4 with SMTP id d9443c01a7336-2ab505146femr151882425ad.16.1771353437289;
        Tue, 17 Feb 2026 10:37:17 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a738220sm110424095ad.37.2026.02.17.10.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:37:16 -0800 (PST)
Date: Wed, 18 Feb 2026 00:07:10 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 4/9] net: stmmac: qcom-ethqos: move
 qcom_ethqos_set_sgmii_loopback() up
Message-ID: <aZS1ViyPMUmk/+IH@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPB-000000093mT-1lwv@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKPB-000000093mT-1lwv@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994b55e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=PQJxtWgwoR3tQ6wQTWQA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX3JCRu2Km0PAR
 9Kz1mSyTVAEg/EgfE2meLt1Ic/RJ9KKJMfHB+lUJEOGhA18SEsz08agNjEJWvOHEB2W3Pk1Y7+D
 O3E+zUanSwuPpzp6NgMz+ExwubMxsRn4JCKFkdueTvxmyVHw9FGZ6UjX4appoEABGJtxB3sre7D
 KZo+BXRQ/VnpMHVya92Cv8F8+RGLlo7ojlm9L+6C5XF64ZkI7NHRXcNWtk6vCkjB92wyChicpdy
 ETRcGFwoBHP4g4qpNJ2urxt2gn+Inkuv6I0wDfLNktgWTLLuT438diTa8b0vhGl4oMMLbOO/lA4
 J8w0WIHHxbjbeNoipIebNkGvQQsQSLpDE0+oQMTwNIDlKIr4hLVEn9UkopGRdHmPXRTwtX0Oya0
 CGzNUhkIFzo26rx2b0BoDHty9By12hMQPRE2yN0oHnNDvQ81m79aLEitJpkt5HhJm4YLrN1fcR7
 f+TcQsSSUMVIPFkH4Nw==
X-Proofpoint-ORIG-GUID: -yBkyQtGBOuG0bI60hGXVZ7XQF6v5-yM
X-Proofpoint-GUID: -yBkyQtGBOuG0bI60hGXVZ7XQF6v5-yM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_103720_369895_5C695630 
X-CRM114-Status: GOOD (  13.68  )
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

On Thu, Feb 12, 2026 at 12:18:01AM +0000, Russell King (Oracle) wrote:
> ethqos_set_func_clk_en() configures both SGMII loopback and the RGMII
> functional clock setting. qcom_ethqos_set_sgmii_loopback() is only
> called from within ethqos_set_func_clk_en(), and checks for
> PHY_INTERFACE_MODE_2500BASEX.
> 
> Move qcom_ethqos_set_sgmii_loopback() to the callers of
> ethqos_set_func_clk_en() except for ethqos_configure_rgmii() where we
> know that ethqos->phy_mode will not be PHY_INTERFACE_MODE_2500BASEX.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

