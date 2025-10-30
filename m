Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC70CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZB9HUn7Y3yeet14Pr5P9kSObdDDgoJccQktdlZcIJM=; b=uzyz6k7nJ/CHtoOBST5smNbO+d
	Z2nV5S8BF3lyvNimHgtlCOthrvDCoxlEYz94T9DRRJRAbfitk66EFWkpxunSUU5AkJ7ygV1Emmuak
	fWqxtgM3RD6ICOIzCMMX2FtsDQtY65MacGJ8JB6y97L5x/pSvPQeU1urfqoEkIXULf7p7qW9pU02T
	lmXnEVmQWJEFaEz3t4s2KwuNZkEQM9KfRE0Cbkkfer2hAzCEnIJXs+EXzZk2WHeR76TF057rBK6aQ
	IOpgHh7uE1hPoRnk8RAFX5GA7OQGrl8g8bmv1PTRxJeHjyWaNrMPAfYJj4aogiMJftRl2DFi7XWY1
	wD/1fNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPOX-00000003uOj-3mwz;
	Thu, 30 Oct 2025 09:56:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPOV-00000003uNf-0VIS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:56:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7atLt1693359
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 09:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eZB9HUn7Y3yeet14Pr5P9kSO
	bdDDgoJccQktdlZcIJM=; b=lke02PP8ShDcsMh5V8vn/IlY/phnMoSm6DL2feeT
	L3TmOI+9lyqQT8yp6RcNpAlK5kfv75Y68Cau8Dq3VSNw9/fHa2TL1Ogy2qMIE7eB
	vPXHkeedoKErqcRUIUnRIYthF++B3fKHK928agAqAzdqnXwCI2xlNNz1zg4Ry7+C
	j3PDxOdO0IihO4/45QGZ0N8CycxBwyHrNR2+7Xed4M2RFQy1cNd6Ejw28avLCghU
	JJks/inWACHMOMQoaSPXfjIRYkVNevFw8SFIHrQMhW5g3rjq+GSr/DKXndRpUFOG
	kb2VUyljVA1UDVJUOp+vpuvsa+gLG/gVwroyJe3ocJGrBw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv1vq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 09:56:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fbaso7926995ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761818193; x=1762422993; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZB9HUn7Y3yeet14Pr5P9kSObdDDgoJccQktdlZcIJM=;
        b=e0ykTriNDhNPIRbAVvwzPIZ7z1zuqP4PpOg0ChtecL4CX31RG8lR3ETECjyCsvpTWr
         XLDip06dAYOVKojfHxCz4ggmoviF10nztFgcSBLkO7gTgdORe+u5QfJT9znFoVHK9mm+
         M6AzkuiJWV2WE7Eh28UENy3Jk3V+V1oGX1Bb591eEfyjKH3XsHJsiwhXuHoNkAJgi4Fn
         i6vz10+DIYi7a37w5C7nOVg0YtQCTdxRKrUXHYfCNSrSZkDgJLSe0YlFk/V8ZMIWXDBp
         lUMryIGNOxMds9ZllhuLp7jb+jJVBIpo1dZ8K0VcLQ5HhAcPIiWOjKqMvWnoLUR6fyZ9
         8mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818193; x=1762422993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZB9HUn7Y3yeet14Pr5P9kSObdDDgoJccQktdlZcIJM=;
        b=UaqnDNoZAinfghMZ4Wvptvu00wG14pXFodKGEhyRZDKVpK27aG+mDVVuNJ9FUMJxQ3
         AbU/NzeHXgnBeLlPoC4xArl9VcF0CFNjEHDJty5AZ8g8Z2CG4XrY4S/6Q9S01oNse/TJ
         L/hj2Cjzp6P2G+ag3UW4hLWc8AFFDryKDaAvWp97izp3NeH7PD46+1Oe8LZhDVdeCSBt
         BbSbx3Y25M/9iJnGZEsfZKETyKl+Wc8qH5zq1Fm3QYHlitZJSl/Y83cYpM55lz/Mt+aZ
         FgdJr6lhr7sn2oMsyB8xpDwxADdXYtgcMUC+txL/iOmsxxfhvcN03m2aJjeWmRD4B1LY
         ErvA==
X-Forwarded-Encrypted: i=1; AJvYcCWNFY2+HtkO6emvV0v0ejQuwvrDlHFyglxDKM59UfMa7LgH+qW/FFhvb8Bf5eKoTheubxDXc9izA5WsR4Eff9pK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0xivBV3rCtgoyMeQ0AIdBE3QBWJRi9NMIg+AlvgsPZBqXB/f8
	H5Flddb+0HQatZr+fOxI1w45Ayx4O97Yn+9y+rs56v/k2VW4lJ0lDvmtx7FHt75Wo1PGi4KhAZ3
	ctR430VS7ds5AM4ZfYc65y+QBtjJP79p3VhBUlW1dtIyCeqXHMToR155NU5eMwSrOAzXBcQoH2H
	xqjA==
X-Gm-Gg: ASbGncskHKsByLF5x2fORnnTsSYAMvTlr2DUNv5O2XEBiXNYPgiejT/MjllsLXxDfXX
	YLKS+pEjT/BU30oSNDYysGzl5UgfUXlnqbAGvJFLKtQo47MjFF7yQ3ih58DXxiJecBJA3yzAGRb
	SOLTQJH2hFyT2HxgMSpiwGpOpeQ64WKTu0ri7Uivc4suQjDl3yUoMLya7KmCZMPc5We0F70xKOH
	4LNVflCw+K6Hz2HBtC+uCRxiD2+hyr7WE7YXSCq2dtAMcSZ1COzaB/MAdLGkkfMfOxjJG+KWuFh
	ApCZ0HIdQKky4hYOi8/9ghxjLnbjK8/rKZ4DK45QxQ3WGymAlfPRjeS+ltDAZ9pIiUG0GQ8+yIP
	JdI+FEF++DPea
X-Received: by 2002:a17:902:f610:b0:24c:965a:f94d with SMTP id d9443c01a7336-294deee4d1cmr75107165ad.46.1761818192844;
        Thu, 30 Oct 2025 02:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2pXZ7cZHIBfeTvJZ9UTRYJGapckxL928FafPCFjdaoQizWWG6Hm16UWtFXWraP2nuOKNJTA==
X-Received: by 2002:a17:902:f610:b0:24c:965a:f94d with SMTP id d9443c01a7336-294deee4d1cmr75106445ad.46.1761818191892;
        Thu, 30 Oct 2025 02:56:31 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-294eeb94d63sm22841075ad.5.2025.10.30.02.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:56:31 -0700 (PDT)
Date: Thu, 30 Oct 2025 15:26:25 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
Message-ID: <aQM2Sfdu2NqnEB86@oss.qualcomm.com>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
X-Proofpoint-GUID: GCQNzsPooZTjR_aGKhAnfRnIKzaUjYPQ
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=69033651 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=YjBZYspd3xVaAZo-ivoA:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: GCQNzsPooZTjR_aGKhAnfRnIKzaUjYPQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4MCBTYWx0ZWRfX+m/LFzuqd7MW
 5wNp0frSR/H0/aam7afTUPxU4I940N4dAnVO5VJ6QBm/ojcj2Mh6OB9558BgsJZS1nmRhO/JJIb
 89/Sa96kcOtjISmqawFd0MLDnIyrUuDZdbSRCDvmyZRESNIZ3ELpdBBonHsdJ5sgEXoUaktDZJb
 9I7NUxK4icYhvJFpM2u+wLg8tCZy3GIX0Hg/Doks9z8Fk9iSL0AIfLkOepYzneIcQfGgluhAOtg
 l6VCafNxYeptvBf6oSdh2oGbdPlkQWyEo7CYb3QScK4wyL3rHqxEC4HkXGL3SwBTkIgNWKxBtXC
 sQVLUuMdrVz6TxztFnooZJsQKAdxcCXhs2jXPMof7sYeN9R0eQf0U38tX1QODbiaOP+yQ8V5Rhi
 R1r2k84C3XKS6KjI7o27zM67iTqQkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_025635_175096_6EB438B0 
X-CRM114-Status: GOOD (  22.70  )
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

On Wed, Oct 29, 2025 at 10:18:36AM +0000, Russell King (Oracle) wrote:
> When operating in "SGMII" mode (Cisco SGMII or 2500BASE-X), qcom-ethqos
> modifies the MAC control register in its ethqos_configure_sgmii()
> function, which is only called from one path:
> 
> stmmac_mac_link_up()
> +- reads MAC_CTRL_REG
> +- masks out priv->hw->link.speed_mask
> +- sets bits according to speed (2500, 1000, 100, 10) from priv->hw.link.speed*
> +- ethqos_fix_mac_speed()
> |  +- qcom_ethqos_set_sgmii_loopback(false)
> |  +- ethqos_update_link_clk(speed)
> |  `- ethqos_configure(speed)
> |     `- ethqos_configure_sgmii(speed)
> |        +- reads MAC_CTRL_REG,
> |        +- configures PS/FES bits according to speed
> |        `- writes MAC_CTRL_REG as the last operation
> +- sets duplex bit(s)
> +- stmmac_mac_flow_ctrl()
> +- writes MAC_CTRL_REG if changed from original read
> ...
> 
> As can be seen, the modification of the control register that
> stmmac_mac_link_up() overwrites the changes that ethqos_fix_mac_speed()
> does to the register. This makes ethqos_configure_sgmii()'s
> modification questionable at best.
> 
> Analysing the values written, GMAC4 sets the speed bits as:
> speed_mask = GMAC_CONFIG_FES | GMAC_CONFIG_PS
> speed2500 = GMAC_CONFIG_FES                     B14=1 B15=0
> speed1000 = 0                                   B14=0 B15=0
> speed100 = GMAC_CONFIG_FES | GMAC_CONFIG_PS     B14=1 B15=1
> speed10 = GMAC_CONFIG_PS                        B14=0 B15=1
> 
> Whereas ethqos_configure_sgmii():
> 2500: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> 1000: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> 100: sets ETHQOS_MAC_CTRL_PORT_SEL |            B14=1 B15=1
>           ETHQOS_MAC_CTRL_SPEED_MODE
> 10: sets ETHQOS_MAC_CTRL_PORT_SEL               B14=0 B15=1
>     clears ETHQOS_MAC_CTRL_SPEED_MODE
> 
> Thus, they appear to be doing very similar, with the exception of the
> FES bit (bit 14) for 1G and 2.5G speeds.

Makes sense.

> 
> Given that stmmac_mac_link_up() will write the MAC_CTRL_REG after
> ethqos_configure_sgmii(), remove the unnecessary update in the
> glue driver's ethqos_configure_sgmii() method, simplifying the code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Ayaan, please can you also test this patch? I believe that this
> code is unnecessary as per the analysis in the commit message.
> Thanks.
> 
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
>

Tested on top of net-next on the Qualcomm QCS9100 Ride R3 board and
found no issues, so:

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


