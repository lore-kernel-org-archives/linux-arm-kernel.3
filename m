Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60613CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 04:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ius7qSkqzXV/plY/PfxR7AWeMN4ainKUgEjXPW/93NE=; b=Q+/0eYflgbzzP1HYMsyCG9KX8/
	HSph88NPvO/Glpdv+x6dNKVj768FMB7OiQbTQpkYOoOHxIBJiBi2AOhCRt/5hbyCUQWzUV+X7iVyR
	LOWzHfTj79TyUE9ijbxrVjoFxmZFhGYEd/Mis12XrjzpNeNWgOU0qnHI/czAp/vNLY/7tZx8vGC3r
	6DFe9L7zglPjXrrdpENimYGn2WTJNyFwpI684J67GT7rAwrbphSAUf47ELgAYAXqx1MZYEtVPnQyK
	qAzQMhUG6GMHYtp24JIvgIMcvks6kjoN1xLwfaNOBwG5s3/QCy8+SxRuL2qySqnyA3ctM3CqbqxDD
	S7s1zGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyud-0000000DZgz-0y4Z;
	Mon, 15 Jun 2026 04:27:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYyua-0000000DZgc-0Ak7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 04:27:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kInk3224521
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 04:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ius7qSkqzXV/plY/PfxR7AWe
	MN4ainKUgEjXPW/93NE=; b=mcdVhBPbSKzQTqHys85yFccY/q1MdqJ6b4igU7DM
	RsQVUFzjWaEDez45O/afLn/nED+puAwousbBXTdh0ZGnVKUhUh8WkYqT6TVh9PK7
	BsrkRIuTk4MYRuiKAUAzm4FuJs7kAr/H8eMt2cjJnbck9DuGouPGuxDP5i3SAG6p
	7bxs5Sxfseek8aNwedw38AJW93R7bI3oOxU8+Y+tgd8ga9nWmnE82xgJllnkn9jM
	VP2a/G6taB+giFNN5sJJd4/KHlqxw0YeE7+RDcH42DlWxYAFuCEaCRZPvRWon4kD
	RMx1b/Tr3/RaYwK0X7w3RGg6gPFr5kmmmjdvdp4hAJYnSg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7u5fe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 04:26:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c272e532so30504735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 21:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781497618; x=1782102418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ius7qSkqzXV/plY/PfxR7AWeMN4ainKUgEjXPW/93NE=;
        b=QLJT8ytEUfyTtNYv8eSAmZJmbZVOMxOueaKTZjQmyQbkotJDylZNga7MTmNiXvX/hI
         KIQB7O9QYXZ7lYw/x2G+2+1Fe9pzPXSOo+IdIEVPqGqKvi4sLyxyEc1LWA5acsDPLepO
         MwRjSUp6u4PN0vdtNDTRRDn/pZaKP379D3kw+2J0gutgEi2YjqU+lsmDrKS04NBe8udK
         v1skC6Rd5DMEsOvuXsyup42r/OgEP0qTrM5K1Wf8SA4ML1yfv+haHfXTZbPFI7uGWF+d
         Q0wUoCvNM9az8WS5Jai0upePCTYsUMKb8Bzx7JXOgwga4Iamg8GBqbtK68tD9YUroOdi
         e6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781497618; x=1782102418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ius7qSkqzXV/plY/PfxR7AWeMN4ainKUgEjXPW/93NE=;
        b=QuAc6COJQZngZTIAmoe8n7zCl4zp3tfp9q+wDi0ni16RIor0lvD2NcvxY9dKgPjbIQ
         0YrW3KbFJY2BhGkcZyYi2tUI87mlSq0mCB0kHpnO387NcSSsRK/RD0REiIgltt/sNZKc
         p5xRISgBVh4lczJk8vhzXFPJaKOD4kHd/1QsFfLM/hpdF/bJkGwv5flrnBBVS2gSDB9x
         WZCEbfgvb2roEwPXYhGrFnGa3XUd3eWi0M8vIVD2vAB5zuaR4PRO9VUjeIOV7xCCZ5Af
         sfp8lGK4RQmoQ+6efJWUnsELmV8HwTrHg+4Fg6OkN5WOn9SnO9kbGFqJg8KmlgNP0t/u
         vwWA==
X-Forwarded-Encrypted: i=1; AFNElJ/JdfixfhqqeTOMLYD6AC4sx8fgDR8lMV7fk4CopyIYqxq8A5pHO374TBTb3Ii3yEKDv+eqMs+mCZttoa6wSeCm@lists.infradead.org
X-Gm-Message-State: AOJu0YyevkcIyMZClkRLsrJ9+T916sw84IXHfdGss9t0r5ZPcxs1uhl+
	SU74G/n599SUccAJ7sokbB5C+SE3ZIZ5j4mIeIhWhIRcWwfVrC6wj7LKRMghq2dm/Ifwr8M3SbY
	svbGX+tHJU2+F7QrRoTqLW38+j769eJeF39KwOnctNhz9LUUsRVFO0D2ZuNjWr0XFBxV3mF3IIg
	+wtA==
X-Gm-Gg: Acq92OHUyHqtl4skVHR04AgNLVd8Dyyzq4z4E4OmE0RlaL1IZzX1yiM6TFNl+8QBA4F
	RxoPcvlPTsSqYUAJ/1Mc9qpQqGdiGN2vDtpzvHTcVpDkKFmS1UKPbXX7TaazE6h/F4owwbIqj4u
	/mPsYpDpLTarl/uy6ipNyRKkiVRdqXj++fbtvDnbY6HkTnJb3azAQISiDIrhqMKyG+3XjRJG15G
	/1nN54nS8frgQzbRBgyRYUV0h3fD8zh7qn4636dJxVkDpLTQ7R03Zu/A/G9+z2MeU29HmU+OE9r
	mYBK5QK6SPPMCYjQDBsvClN+oP/yfgT0X8UQ1jPC+aHH97/lvThAXWE1TbAwXXjKf9QuH8ED1uw
	J506o+Q2cLYEBacCvrLzeU0ufx4DlSr0O7/4=
X-Received: by 2002:a17:902:da8c:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c664148a6fmr98607125ad.1.1781497617753;
        Sun, 14 Jun 2026 21:26:57 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2ba:7881:948d with SMTP id d9443c01a7336-2c664148a6fmr98606755ad.1.1781497617294;
        Sun, 14 Jun 2026 21:26:57 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac80asm77208425ad.39.2026.06.14.21.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 21:26:56 -0700 (PDT)
Date: Mon, 15 Jun 2026 09:56:49 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 6/9] arm64: dts: qcom: shikra: Add ethernet nodes
Message-ID: <ai9/CWh9oRpYvHfA@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-shikra_ethernet-v1-6-f0f4a1d19929@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=F8BnsKhN c=1 sm=1 tr=0 ts=6a2f7f12 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ppQq2EeoAVl_dUmsFbgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: SjE1326Ix5SSvRpUt-bWowLMMS5kRMsg
X-Proofpoint-ORIG-GUID: SjE1326Ix5SSvRpUt-bWowLMMS5kRMsg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA0MSBTYWx0ZWRfX7WplSDcFl5Dq
 0Nnr+A3VARypyI3vPiDxnkfFAfVMt0n0JKwynrsXfJyMR0cRDnS8binu9phWZy3IWPIbET3Xk1F
 Pml9Gob0JI/FK5FldtfWHK2/jq+2dxkLeiyHaao7QSlRs2cea58pjWf3wCgtN2FsKiZyhdA+dAa
 GcXkC0MhKknS+qlEO6E/WVj5Xu1V4RMpynKfu4YvDRrIGl0UEizyZGixH6JRZoV4vaUXudhjv08
 24Qbo9BkH38U3eHx1YSe9bxEV5vIHgGb+bGctxscSCIxEYPL7ym1tGaTj+U16xN0UXvHgbwjImZ
 v7KfejVdrM6CGJXOXt9l0XI9DgqWIqdS5Ls8R3OVhUrQoEIT/NYYwzE7dk4tll5kBJ1zgcocmMy
 BJMvM59wkZ0kgggcRdCjeJDlEf5BJlmazuqlCmSLn91X1YecbfvqS6dUN6xO0Qt7GE07hy746d5
 nc0qyTMXmIGjhNdLJvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA0MSBTYWx0ZWRfX3eI2eFPhl8CE
 dFFOPXldSY6x+6fGgEdaQPjR4UxF3D4TrsbsogioH02E0T3arxs6Yjm3+oHGj6k6nMn34DWNjks
 Y2KIXdt063X44tZtBmOpe3eZcVA9KU8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_212700_203248_2D11B051 
X-CRM114-Status: GOOD (  12.85  )
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

On Fri, Jun 12, 2026 at 12:07:02AM +0530, Mohd Ayaan Anwar wrote:
> +			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
> +				 <&gcc GCC_EMAC0_AHB_CLK>,
> +				 <&gcc GCC_EMAC0_PTP_CLK>,
> +				 <&gcc GCC_EMAC0_RGMII_CLK>,
> +				 <&gcc GCC_EMAC0_AXI_CLK>,
> +				 <&gcc GCC_EMAC0_AXI_SYS_NOC_CLK>,
> +				 <&gcc GCC_PCIE_TILE_AXI_SYS_NOC_CLK>;
> +			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii",
> +				      "axi", "axi-noc", "pcie-tile-axi-noc";
> +

I now realize that having GCC_EMAC0_AXI_CLK for both "stmmaceth" and
"axi" clocks is probably wrong. I will remove "axi" and have the glue
driver enable and set rates for "stmmaceth", "axi-noc" and
"pcie-tile-axi-noc" to ungate DDR access.

	Ayaan

