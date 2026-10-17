Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3242CCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AR3F248zW2l1oh2ByOU133KAOQzd3pYgIfSBxic3/p4=; b=eqIy7oumtwS8ESLZf/xsC3X084
	BUFJoe4jJR1ew7sI43vvdH1z1VI6yqSuYg/buEaVtuTJlvm4ipn5AHE/4TsyUoHEazFGofLA6wNdt
	u2AoVV5s7Q/UsRyRWCgu1a0UYT2BR0vHVSfJGrLdi7mI//KTzOeDTAsjxintaed5HdNtgoXFauv6w
	ERgTk9fsfXo6Lw0jg05II3kxRK2LRl0Bzm/dLcj7qoBGKPPpFrwrh2lacWZnwHAJeiLAaaidJ5AGq
	lDOjMhi6pWcOp6WNDCo+/1zi58nD99wHaDsVC3yHTgY08yU3SOXSwfxBzBaWaeK10kV8GRF6nfDuc
	6AzEpjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI6uE-00000004uLn-1UvZ;
	Sat, 17 Oct 2026 16:05:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI6uB-00000004uLF-1J9Y
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 16:05:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HDEtkQ1676161
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 16:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AR3F248zW2l1oh2ByOU133KA
	OQzd3pYgIfSBxic3/p4=; b=K+MQVgGMAR++3JL59vtKO35/QBMDqreoBx3tzLjP
	kPCxZ7ljpfI7e6P8Wkkp9wdvvD0XL/2SG7fI+HwnwV26VMptBlnuZn5D3fieEI+X
	Cn0blykevVvToWUZSe7AXsC83ntesfyirD/OU/LmfIYR73UYb8BQ1aQG/9sMlBAn
	ju77XoxXRQMHI+ty4JJXd2tMll3AJjbEQ8cUx3m83zuS/cOYKst8jev6OgoDn4+p
	SAj+wpjkv3KCrXFL961cyiCvQRh9aDORYYC1F3A5LP72IGIqxyyfJJcejegtjZOE
	c7eDHmgBE5NN6vo8ervECxtKcKgZCBH2aFAzqmCBjcreNg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxh9sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 16:05:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso2335840eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792253105; x=1792857905; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AR3F248zW2l1oh2ByOU133KAOQzd3pYgIfSBxic3/p4=;
        b=d5NdgS16ynhBSpih1+0u3bmSpsYVrNI/Q5n2pKQUQCLS8Fno0JiAmnZ84BQp1Og9yE
         pyvd8Io2akC685pN6c5fwqpn9ZZjk2UiZ/BMVPMixIOFzWb1tyCvQzP80plV0fjeJ5N1
         dRGRx+9b6jE5vJhnqpPuIHhMdlEdCCPCTL9ruQVrIpwSthmZbRSqe5x0oeYt4y4ms3hY
         3dG7cMemkNlBkjWIfrIbHVezX+zcWeLDtnF6zMrO701KAENLEh/Yarid7MtRh4O/a8Ln
         Px/hE2rFiXk73r/6diGkFyaIXfyOmTuY8+lvFWL3xrc4nDLquAFFRdxm3Gjjw8pF4cVz
         pUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792253105; x=1792857905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR3F248zW2l1oh2ByOU133KAOQzd3pYgIfSBxic3/p4=;
        b=BsYouwCgU532B199oK+nu3i4xZoZ5OsMa2lK50LyYS9N9Qr+42bST9bSsXIvIBRxcL
         g7+67S7ATY/05FlXvy1phNzyoBfM6MjlOZNkbw1qn8bWSO4yP0jPi2up2let34AZtZiy
         I5/LSdBq9LC9bE4x8uXGnwCTQBL6y7VK+dYVdBwwraUoOwsUy74YmDN51J5muHUNrUgs
         K3IvNQ/oc346/qNiFhgkbjm3WpsUVVcAOPF6yNtAWfh697GCTF4s0jH6TRHvmAl19Suj
         lomZGZfuAV4PdnwJBEfvYWiB5kjogevkCOZLhmgCMy3FpR2hOY7/zySDJ+f2HFdpBw67
         LfLw==
X-Forwarded-Encrypted: i=1; AKwUvBxxIHDreGRQVc1DQLgEFKqAf4xSPEvAAeFsljJmAdPldZftouPYkqqriToy8CnNCoXkCtN3Us63sHM3Y9M4K4uO@lists.infradead.org
X-Gm-Message-State: AFq9FYJkENqVY7JwegOmyXR70JE0gYzJyl5DduAet82mCIzloMqtcaVL
	Lgf3X9SnVg0CfPrg1am2Y8Fhgnswbp5Krt8n2t3zDAH260CUju3JsRINqEFV2+2WxO2NZzJwsL2
	6nQW6guvcXmgkvQ+GRzyawIb5TgBh4jJUMsMdD/x7fbB8tACujEIsIhULc2u7VlUvscwOCtig8E
	jLb4A8/KcZZw==
X-Gm-Gg: AYBFou3BNvrDs96PcShXUgheTZVfDGO+ZVQQKtaGQTunsba9yzmQRAthcpJImCoS3fG
	zGJSSYqFNW99dRozifM4wv1j2xOgpLIhTm5ePxJMh5Pl3M4pVlLXmR2DWf3IlyCEsAxSxtvwwQ1
	CAnMvQwz/ZRZYsUdZ6m1on9AKk5fkexYYUhwW4cLcGuPDYmMkB7XZIorsEpsWwotWD8oqXyaR8R
	nYUy7nxyhZ+D6E0d1ZhVSu642mDAvCybZxtkjSFS4OYsdUkWBnbxHxMfFlBeZ4y3nbGS4LlLlj3
	LFXFmLxvi3BurragviU6KmsNEHvDud70QZG5YiNi4FNagYIeNCqvGVdHnMzG0suSA3BurNK39cM
	wGOUuVMOget6lsA==
X-Received: by 2002:a05:693c:415a:20b0:361:aca0:522b with SMTP id 5a478bee46e88-361aca053bcmr4384797eec.11.1792253104786;
        Sat, 17 Oct 2026 09:05:04 -0700 (PDT)
X-Received: by 2002:a05:693c:415a:20b0:361:aca0:522b with SMTP id 5a478bee46e88-361aca053bcmr4384739eec.11.1792253104117;
        Sat, 17 Oct 2026 09:05:04 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm29199920eec.28.2026.10.17.09.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:05:03 -0700 (PDT)
Date: Sat, 17 Oct 2026 21:34:53 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v3 4/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
Message-ID: <atOcpTqukIRILloe@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
 <20261017-shikra_ethernet-v3-4-26a8beb44b8f@oss.qualcomm.com>
 <17aea8bf-490f-4006-880f-1999aed1df59@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17aea8bf-490f-4006-880f-1999aed1df59@lunn.ch>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NCBTYWx0ZWRfX9VcD7PFKuF9P
 nWhZwyNS/Jp2q9noJuFKb/Y96s+GyWbaNo5yQzV6Pt3w88MFFTxBwTISkCmU/Uo/RWkwbqixd2g
 36vaAHlf2ti6DOLw9cNcPatiYGWu2Xw=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad39cb1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=2_h2fYecv1F4Ojg9QoMA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NCBTYWx0ZWRfX+KnrfDFcJMc2
 S+R5v76AOwISMX4Y7Hkz8bzLqQDQRNAF6QuWysGoR9gV6Hptq3ANOZpSAj9XSRfSROnjyO8hr4Y
 p70c6bAIVbGAEvWDA21FkcQNZooQF7m6XZSsPIInFRCQd56/m0iTddtnLD5HMeYWcLF3HDZZcNq
 wAyHA0EDA4W5MZY2HKb345IjAnl1RV8ys92kY5uNAujXlmiQBsSR6o/sfgzrKPDmuHEVfaI6nuE
 2UB73FJWkbLymn/00St2XMpXxljJM5GujYgDs7syNUblnP3ukvSkl7PguKZZGPn9dw1fssz2DGt
 PKIg45/D1kMDlEiZuo5hqBAmW1bQCBH9B8W6FBX9j0PAyPX5zgszCLuwWyh1kB7Gz668kJnHeTT
 WZ7j/Vm5FEF8/Q1gAZH02FoZ1TXRc4eXGi68EwXTwX+UDxvCTuUzk62R6ZORx5+j8c7HFCbeLX/
 1CByg+AJgjtgsVMEJTQ==
X-Proofpoint-ORIG-GUID: OYW7SIwk5srTMiVZ2--_RkFB1mdLoRRH
X-Proofpoint-GUID: OYW7SIwk5srTMiVZ2--_RkFB1mdLoRRH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_090507_480192_B37F404A 
X-CRM114-Status: GOOD (  22.32  )
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

On Sat, Oct 17, 2026 at 04:00:27PM +0200, Andrew Lunn wrote:
> On Sat, Oct 17, 2026 at 03:15:15PM +0530, Mohd Ayaan Anwar wrote:
> > When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
> > the MAC must not add its own. The driver currently falls through to the
> > generic DLL initialisation path which programs it to add a delay.
> > 
> > Power down the DLL and set DDR bypass mode for RGMII_ID, then program
> > the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. Also fix
> > ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
> > 100M/10M, and remove RGMII_ID from the phase-shift suppression in
> > ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.
> 
> How many different boards have you tested this on? How confident are
> you there will not be regressions?
> 

Apart from the new compatible, I have tested this on three different
board designs of the QCS615 SoC. The EMAC on it is identical to the
"qcom,qcs404-ethqos" version. Two of the boards have the Microchip
KSZ9031 PHY while the third has the TI DP83867 PHY.

> Since you are adding a new compatible "qcom,shikra-ethqos", you could
> limit the change in behaviour to just this.
> 

That sounds like a better idea. I will restrict the new sequence to just
"qcom,shikra-ethqos" and "qcom,qcs404-ethqos" using something like
data->phy_managed_delays = true. I will change the warning patch to also
check for this boolean, so any users of "qcom,qcs404-ethqos" can be
notified.

The two other RGMII designs ("qcom,qcs404-ethqos" and
"qcom,sc8280xp-ethqos") can continue using the legacy flow.

	Ayaan


