Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB56CC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVlz6wozUNJU7Ozc0pFD8STVyfYjHeBzDGHFKBRICIM=; b=LCx3/06q4oQgpYQInzZx3/yaFv
	uEZfSNtF9adRUxpUDR/1bu6T8CGmTnDP7wroNmymBNHiLgbbh9RCDo7w9hf5nrDJNw2nbFK3mESFd
	MX4bWXh1/ZVHs+MiQkaYD1Ym0sS48zkXRRLK1uaHPs9LWBGrAIv7PNiIhCeDJAUqkhxxHI7lmVMcF
	PJO1PV6nZgn9rvLepAiCq7/cbupS8ykxEuY/JVPU8l4DYLCcsM/IFsySXTCh+J6Y7kNMr6gZttatF
	ZizuDer/vkhlh8A6zWE74yysnrMtXJF/RkLfCbpGTC8hYOiDl83PbPOlV2LfGw+hxWWH7ZUV2AZK3
	WwafNtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Igq-00000007bLZ-2my0;
	Wed, 23 Sep 2026 08:50:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Igj-00000007bHi-43Ck
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:50:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JMf22003952
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVlz6wozUNJU7Ozc0pFD8STVyfYjHeBzDGHFKBRICIM=; b=gum4gTJdGnvbTqQj
	VnGZ48CvO5dXwaN703L4zRE+4OtxCXP5YLO9HxLDqbQqTpRsEzXa2GmXaZ43lhVS
	n+OKqyo+WE/T88KyggyHH+qNqi2dQVtHMHc+pizRqRZsvuYBer0Ht6ZtOc+cCjvP
	HNyGX4cKRPFjoAEVbmnwlwX/SMjRCzt+A7/LKtFh+7FiflXxbMoUMVERD7da0luG
	sp1Sp96ptBTmKOsZFaVb37aZVxVyoCL5lvAk7iceuIj5P4yKTsooBB9nNRB3o7y+
	Qma7KtaxD5RsFujeiUtayu16T088CgsnEIKghjg5R2hakTAnVU0UJ+0EUtQ1cMKh
	Bd0+6w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec4h65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:50:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-870ec29b035so248410b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:50:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790153449; cv=none;
        d=google.com; s=arc-20260327;
        b=gbwsHocx0cHyqhefzprRj3uJoelMIh95aBkaTZKiAqooC3l+oME5dqfJhi2IKDW4l8
         gv0oyybOYYd36SN10AfZqjBBcA8gp3ZQh8iRGs71+ZbkvAN2x99bXI3p4xznQ8k6sUF4
         5Qivfv4lCjSc7j13Z3pqA2cOthh3GOiiRuaem/9bRY8PIqZ7cr2w0sRK+0L8VZaZ6aWC
         IDGGb4Tm66r4jVArNFJ7FrgAxOwpUnHCHJD0s9kcLlIHVlxf7hoAVGCCfCkVrP6vMdLJ
         LBl/0eVHFVijuyVbE5W3z80sjpa0dXg4vNp7CK//EYd1D+SVE05A57dsf5aUsgshQT51
         U57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jVlz6wozUNJU7Ozc0pFD8STVyfYjHeBzDGHFKBRICIM=;
        fh=QG/sWLokjOH+CVOH3YRdTDA53vHjvp/LPpSzKQUWW1Y=;
        b=AmmhIbneHqXdoVnsLnVCqN9sOI/v5aJ1oAFAlvahnzoCkOtlAYiFS+/kVRhEtrfmtS
         CDu3SJNXpJXzCeYAylMoCB9CVYz2+IyKjA2O52hBdwl+X73OQmpo0qCdBGCEXII//yCc
         gpxiOZ0/TMSEmCR81uPOJN0vbJ7cJmCm9tnyyYZ2EEp4xQ1tmJ9oiqIYkIhexwlgm8AG
         Pm7l0OES4QEeVzS3Pz2u9a8LUm0rnc1LNDT9AzeVDTbQQg8hUIVSap1hFv97DuY5qOlU
         Zk5++0FcX88+PQWzt3QJsG+F0j3D1q7PWUs/ymwVlI6UpObf/fYqH9Nnjhonk8nIfTZJ
         MrIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790153449; x=1790758249; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jVlz6wozUNJU7Ozc0pFD8STVyfYjHeBzDGHFKBRICIM=;
        b=FGgm6uadODQ95MBTHDWE9UNLuM07HQ79IEQnl4PQPsX2wE3ybZ2q2UyAu5ACDp7iO5
         Ha29BwXMQHXAT/0wmwrun88o8B6M8ETttIgRf7VDuAVHDNpbeRDVuOKJMeEvm7lmxjFK
         MzL5g2YDQ/S467UFzZZ1Ori+eKqqaeoJRlL618OO2Ns83M5b12fvsgcVppH/+3BjY2eZ
         fITfyE7LfNzOMhlSLeF/HWY8ps/CPLu84jRiG5QuowrQdmnrhUHvXDwn+T0tya9HMGaX
         E7EAh9iTIvCStUw3+XkOmkna9aTFFv2QhODFcgQJkRLeO3JzsdRRV9JJEWwk3A2SQ5Yo
         GgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790153449; x=1790758249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVlz6wozUNJU7Ozc0pFD8STVyfYjHeBzDGHFKBRICIM=;
        b=RRF2PcWyk+P86Ec7yDyYj4HLjqibjO+jo/mzHBptKMGFXZxDWjcNEkmoaOZJ3Kgelu
         YXJZu4t5U7dmoCBRCX9ApsxNPU9d/RdyUxv/m+pURXjVZ192HRTZsOyfYs6TwoLepBzC
         epBdldMru2sXiva6Jbu/KmOQuLxVw5NSQRCnbJo6ut8WkYXAg6wd1Mv5SrmrZIq97v2V
         m+E8UWyMYcieOLmSYJaA4vbCvBFnNsvDlG0iTt0rw0i7IV1sUiKdu1pEmnMUhKjJCEh8
         HEZFwDYmUjkqG9CuIoFR7RgHbd805qRQgbPdqJ29jH6UDiOYXrvb9tFsk6C2T6a9FQmM
         EIzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzR1N4bEaqbDOa7q9rh1o1wxzGCO0OP4EF+etvzsXOHPf6AAj3mbID00jz7ng8h+j6vBCvGS+QfUG/iMcagD4fQ@lists.infradead.org
X-Gm-Message-State: AFuF++ns+UG/oesKkNBLQ4Wpyf84RGAjCPL5MCHMlykUeg09CWWP9ncS
	lFsxNSx/nXdtrHRYne4bdegxK5nroa4nNAoceJVkDfvmdwCx+JsItGZjD19y4Wf3li/wGwPzefU
	mMrbCz0F5aI8t5Gl7sEDOKKkzyvREs4QXXJfxHZpYl8L63vloW1yCPWuPmRxyw6iE4Tx533aO/b
	FSqgo22kwKlM4ixxf2p1yYXDl5R78LbNvLpGxFz7D4NOszIPym783H
X-Gm-Gg: AYBFou2PVCwQhZMCidq0JcpEnwfwhL2Rk0ZDVOUSThB97fFsxEc7nBUaJtlWstf7jzg
	OCZ4Hm2OJVJbudT2knSA8jM9ef77bAYPXsn4eAKLvMWyYqNrWr0APvFh2zI1oVw182WnMfeaNGB
	Q/C3xrZte70CWHVMaxLh/gwwNBbnabZdC0jdV4wWA8o1KURyOJQ92zqMerD53cReHsNgTd
X-Received: by 2002:a05:6a00:2e9e:b0:874:706d:9629 with SMTP id d2e1a72fcca58-87d1b6a89bdmr1526872b3a.27.1790153448522;
        Wed, 23 Sep 2026 01:50:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9e:b0:874:706d:9629 with SMTP id
 d2e1a72fcca58-87d1b6a89bdmr1526838b3a.27.1790153447969; Wed, 23 Sep 2026
 01:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:50:36 +0800
X-Gm-Features: AcwNN1UGyeerkYZHrx1isWt7YiSI0LmE8lI6EzIuvsSU-2kHZ8m2Q4mcnuwVcxA
Message-ID: <CAFkd8hsUzJEsDYjGSM3tsJzzwByuEkA+G4k1c75uYD-y5qU3iA@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
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
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX64Ej54ihRa9A
 0L/VITfHj3/vKGYwmcSLFOHN9dyAG1jjK83EJxCykfs5f36RL/2JduIKw0+KF4jD8PoEQnCUqJV
 BVZN09dKq+m3qYQTj56zFaVpFCzCifGcQpzPMsUKlDCJ7Aajagc3QgIMoNm0RDeKm3xCtsyXhZG
 kCtwkPXsR3KGhVYVylMmWQj4dmT9Wyfiuo7A9KquMtuf2MtF5gVdie311hjhXVHkuiLMFWaPEZH
 XrJR4RFJKW22YpeRe8m33hIRxOG4uCQZC26pKG+9ArFx23KfMqsrZ1qHnaU3FfQxtwW4eE38V1Q
 SPK3nRvzzcYUjZBJsbUzTiyNvzwUO5k6VxlNZytpsqBpCsuvMMdWrW9y4neFxPVUJMgdIHOj7WJ
 Nsgn4VdSf8r/Bj9wc0palNcht+gytAzxF+x/bYq/UuU3iAt5UVYJKJKboSGJ3w9CUtXDDKHJzB7
 jju+JjvsI0kBs+9GwZg==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab392e9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=Gcu-WNPWmvmYkCXGu7wA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 6h8JJBPCJVrTE4_EKpDYNHor3mkNGGaL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX3nKbNkOEspRS
 pT5DcvAUtqp6doYGVYrpetyWWJSKifHEyI+KzooYOYBIT0hoQ8JoV3o9ekx4OlL6erz0HYVB+cC
 rj7FWG8Pv++g2YAtj5/EKN485HiNKuc=
X-Proofpoint-ORIG-GUID: 6h8JJBPCJVrTE4_EKpDYNHor3mkNGGaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_015050_030856_DEC291AE 
X-CRM114-Status: GOOD (  36.96  )
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

On Wed, Sep 23, 2026 at 9:08=E2=80=AFAM Mohd Ayaan Anwar
<mohd.anwar@oss.qualcomm.com> wrote:
>
> Hi,
>
> This is an early RFC which adds the XPCS and ETHQOS plumbing required
> to enable 10 Gigabit Ethernet on the Qualcomm Nord SoC. This is the
> first time USXGMII together with an external PCS is being supported by
> the dwmac-qcom-ethqos driver.
>
> This platform was somewhat tricky to work on, with several new pieces
> having to come together across the MAC, XPCS and SerDes layers. Any
> feedback would be appreciated, particularly around the XPCS modelling
> and the generic stmmac register-layout changes.
>
> The overall hardware path looks like this:
>
>   +------------------+      +------------------+      +------------------=
+      +------------------+
>   |    DW25GMAC      | ---> |  Synopsys XPCS   | ---> | QCOM SGMII PHY   =
| =3D=3D=3D> | Ext PHY / Switch |
>   | + QCOM ETHQOS    |      | + QCOM wrapper   |      |    (SerDes)      =
|      | USX/10GBASE-R    |
>   +------------------+      +------------------+      +------------------=
+      +------------------+
>
> The series can be broadly divided into two areas:
>
> 1. Qualcomm XPCS support
>
> Nord integrates a Synopsys DesignWare XPCS, but exposes the PCS,
> PMA/PMD and MII MMD register regions through separate direct-MMIO
> windows instead of the standard contiguous or indirect XPCS mappings.
> Patches 1 through 5 add the binding, generic platform register-access
> hooks, the Qualcomm MMD-to-MMIO translation, and the runtime-PM handling
> needed for the CSR clock.
>
> The XPCS also uses Clause 37 control and status for USXGMII, while the
> generic XPCS support currently handles USXGMII using Clause 73. Patch 2
> adds the required Clause 37 USXGMII configuration and link-state path.
>
> Using a small Qualcomm-specific access layer around the existing XPCS
> core was the most straightforward way I could find to model this IP.
> The core already uses synthetic IDs for the NXP integrations and has
> vendor-specific hooks for other XPCS implementations, so this series
> follows a similar approach. I am very much open to suggestions if there
> is a cleaner way to represent the non-standard register mapping.
>
> 2. DW25GMAC and Qualcomm ETHQOS support
>
> Patches 6 through 9 add the Nord ETHQOS binding and driver support. The
> Nord integration has sparse, platform-specific MTL queue and DMA channel
> addresses, as well as a relocated timestamp register bank. The series
> therefore adds optional XGMAC register-layout data while preserving the
> standard layout for existing platforms.
>
> The ETHQOS driver then selects the XPCS provided through pcs-handle and
> adds the Nord wrapper programming required for USXGMII, including the
> EEE clock vote needed for PCS link-up and the platform-specific SerDes
> loopback control.
>
> This series has an obvious dependency on Jitendra Vegiraju's DW25GMAC
> work:
> https://lore.kernel.org/netdev/20260402213629.1996133-1-jitendra.vegiraju=
@broadcom.com/
>
> I understand that a v10 of that series is planned. While bringing up
> Nord, I also needed a few fixes on top of the DW25GMAC series. Those are
> not included here; I will share them separately with Jitendra in case
> they are useful for the next revision.
>
> Testing:
> Initial testing was done on the Nord Ride SX platform, where both
> Ethernet ports connect to the on-board MV-Q6223 switch using fixed-link
> USXGMII at 10 Gbps. The testing tree included the DW25GMAC dependency
> and the additional fixups mentioned above.
>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> Mohd Ayaan Anwar (9):
>       dt-bindings: net: pcs: add Qualcomm Nord XPCS
>       net: pcs: xpcs: add USXGMII Clause 37 autoneg support
>       net: pcs: xpcs: add custom platform register accessors
>       net: pcs: xpcs: add Qualcomm Nord platform support
>       net: pcs: xpcs: initialize runtime PM as suspended
>       dt-bindings: net: qcom,ethqos: add Qualcomm Nord
>       net: stmmac: support custom XGMAC register layouts
>       net: stmmac: qcom-ethqos: support external PCS
>       net: stmmac: qcom-ethqos: add Qualcomm Nord support
>
>  .../devicetree/bindings/net/pcs/snps,dw-xpcs.yaml  |  17 +++
>  .../devicetree/bindings/net/qcom,ethqos.yaml       |  57 ++++++--
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   2 +
>  drivers/net/ethernet/stmicro/stmmac/common.h       |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 162 +++++++++++++++=
+++++-
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  94 ++++++++----
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  34 +++--
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 128 +++++++++------=
-
>  drivers/net/ethernet/stmicro/stmmac/hwif.c         |   5 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |   5 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c   |  15 +-
>  drivers/net/pcs/Makefile                           |   3 +-
>  drivers/net/pcs/pcs-xpcs-plat.c                    |  47 +++++-
>  drivers/net/pcs/pcs-xpcs-qcom.c                    |  86 +++++++++++
>  drivers/net/pcs/pcs-xpcs-qcom.h                    |  16 ++
>  drivers/net/pcs/pcs-xpcs.c                         | 126 +++++++++++++++=
+
>  drivers/net/pcs/pcs-xpcs.h                         |  15 ++
>  include/linux/pcs/pcs-xpcs.h                       |   2 +
>  include/linux/stmmac.h                             |  11 ++
>  20 files changed, 707 insertions(+), 121 deletions(-)
> ---
> base-commit: 6598456d72e48d779445bfec8f72114747f8b8d7
> change-id: 20260923-qcom_xpcs_nord_emac-bf296eb48e4b
>
> Best regards,
> --
> Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>

Good Job, Mohd

Tested-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

Tested on both IQ10 RRD and Ride

Full test patch is in the git
https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23

