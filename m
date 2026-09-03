Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFE8C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=; b=zeVxBVa4+suRxHaBanXIfXQ3l1
	6U4d6ABa9o1a++zMxpyPM8PiatqkVv9Inns/JLkCCT++yUE0AkIfjoALQO8q8LVUUPbmMYpdS8mvH
	Z0ajALJZ+fzvyTOr+4bCiGiU9Dk5dGCrq4Hz2jaUj+X8NSm5m0FHvSxD5ICKHYf+4B+MhxMT8PKqD
	RMMBj6UEss5HA0sJwq3ltoStrJ62fs9k1zFO/HxZU4Ln/qQiOj++su/LTXJUKG2eCo0ociGpnKzZH
	JnXiQXW45LQB8CW2T3k7vjt3KHV6afsm3ZrQuEe3+ybAZ5RdwkZV5sVhpMS3FkMqWhy+NGHJ9BcHf
	ct+lgLDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CaF-00000000Oq1-49NE;
	Thu, 03 Sep 2026 18:54:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CaD-00000000OnQ-1O6x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:54:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3g9m1209743
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=; b=LDxQXeGlbB+zParA
	4JxeTWgUg4obq59z2T9jEIaY3sJqLOVnjcOZ5op30LxQgwucPzpW7H6GqETZJ4Nq
	V/RMxDDvTzTuINKMeFSWBzRs8fQUDiJUxt/T9310441FBwZfVZCoe5joc70zRfbW
	7OAVPgp6wGQDLsygXQpX1eDQwHazn3JiK8MPOllZhyt8PkFoAD35JF3cDm7/zqlP
	FGQpNXbFxOVzz0xoG6uYMKBBSNEGZuH+2BN4CBSjbCIKzp4fa+lmQBLS3hOEyseR
	qiM65+SBwSRYgUBgBNrFseN2Sa0sFg+IWnjSf22omtTmaBIG+wfOIfyVKs3uDPQ6
	yplvAQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p72e5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:54:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so159116a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461683; x=1789066483; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=;
        b=JyXRjhoYG+sJEZ9+MDlUHwu0F/bYWIoK+kkTrVAhw4jQkm+PDM7jjYnvQwpljd8VPM
         l7N9XLnuiKTOa1u0dpNo+ghx1RMMXYHFk9IpHXq6GZBguactr2yvStp2kvV4DZJae+R1
         e35Ayc63ONvpSQspWNXuCxw0qUIUAmufoEVVFWWXto/nw9yeOonUd2YzH3K6hO/Pi9Aq
         R1Qh5bFpXK0y+4lsxkDlIKODxcB/T31lEI5y0eJ1lLJRlJu82Vx6hQ7voZOb0ozBVb/E
         Vr3X0+D50kOCwsarJYzDda2mu8B5RRjDhRM/GY5eacl/uqV2G++xNprw6ndGNrBuzTPr
         H8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461683; x=1789066483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3fb9YsdSg+DwmlZQq76W2/Ut2yqDfurujMD1jRY9bls=;
        b=Qqf4/PRbFW0nkZyxJSIWq3psP1BeKCRHeJhZ725z5WWE9A2RpSPaVaodovzbn9usjp
         sPkZjF9iyu75e0hBoYmzPpcsDpeY+Parmxc4Vev78ZAbSWFG3lvTyk1BZXNjWokUOXd9
         T1Dk/rwNHLNynLcKkN0ZcmTL0qZvdgRCSa+uRCwXb3YdkKXGb7aK3ex6vUoAABzHTpM5
         yyhXhobNc8MdBEtLDDp/e8Ez/FbtXZtDYj6CkKZfnh9FMBf6xeeMC35Jvsc8Ulo8eLKb
         U6mEhVTRw98jpyvfpIHjMseV0iG8ahMLgGcPqWoTiTem3RmTtOKc4tR4eVxBExe5s4MM
         I7yA==
X-Forwarded-Encrypted: i=1; AKwUvBxx71w80CqRahQkJsxaQCngk6uFMEfmBM0/ehq5g52fATG0PnQyoWS2WL75d7WYdqJ9d5LGD6riEHG/ZTAXD5zm@lists.infradead.org
X-Gm-Message-State: AFuF++kEYe3pZ9aCGUYs/MeipkNkl23KOebF7WskW4faWXCs3HdJwBad
	DOHuEvx6J79nTwMoz6Rj9y7N3sw+7l9J7eeg3SWh+DY/KuY2QXSr+5Dndgx+r52KW2wxLYhchQ/
	/pnSfKZmfdH2dO66KyfXujOswMsofgdVKvx3OHM513KJbBrPfmtQicbdK7uLVMzLSq7fWj8dI7X
	MntQ==
X-Gm-Gg: AYBFou1L1tCTgIo1yz3ef9OzA4U++fsxU0J/14KlNcoV5dJJYAQfzGi6omb9rprVV8f
	Nufc+FFwjgcZxEMRZdoa1VuyeCWDH9xVsILVH92I/rgRs1Wxoz1jqEhtQIXRq/zDqGxUDuB0k1N
	+kmEC03Dcqev1Fk1vBm1oyQqZ1hX1XJ/HtSCeSTeYgBvXYex7TA5OV8XxONnEOEenlG6Xo0nd7g
	0RDJRz7mUT0rbnJmmsFR0sqCwyTEEj+EIOoCwh9bTqbDMUCrTM4SFZ9+KMI9Wyh0Hq6CroRp76q
	K2/OfGLKRHo3f2M0fFJaUlOpalGKskjSem19NIUjFmXTpNdD0zd5nyoT6EAJWYLf3Bij4nYzgIT
	J4K/Ql1wM+AXRmHVJPjvMvHHIfN94Vw==
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr723098a91.25.1788461683340;
        Thu, 03 Sep 2026 11:54:43 -0700 (PDT)
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr723030a91.25.1788461682819;
        Thu, 03 Sep 2026 11:54:42 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:42 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:48 +0530
Subject: [PATCH net-next 6/9] net: stmmac: qcom-ethqos: warn about legacy
 RGMII PHY modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-6-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1105;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=K+J5JXbqYwK3TUxpCoU6dPlVnyBExv1tcHHZpJs6rIE=;
 b=VDlMBVbP9rRPq/DX36zllF3huKy8nLST52QEJlSSp+jxj3Zs1EezJmpRt51v27kOytNJ7XBqv
 7jGNDwMby5uAoWl595g90dVdQe+h9jNOgpVxmQVVPMCnxoHZ/z8q+ZM
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: l-sx4XmQxLyMzq-ZeXiGufUxyA8OZhIs
X-Proofpoint-ORIG-GUID: l-sx4XmQxLyMzq-ZeXiGufUxyA8OZhIs
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a99c274 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IeZn-EEC65Et7LrU5-sA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX6IMzCrXBEgaq
 V5nVPINT4g3Ayi7Ajk6wfSXuQrvXOyqJTTipZkL3gXOKa+diLaGgNCe/8/5Glt7l9YaNfLwUYYm
 VJ+Iy79fP2u+5vLlD8ka+Lq7r+IjKoI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX0SzhMPAggbj7
 Wm6f03XScQanq1em0fbEU5h3JIiWU7ow0Bbmh1O8zL2LYXl3sT5h2dkN0MzvPPzgS+Lc7AZSlws
 R1ubsSjZ5V+kaK/Z+iDwROCT6vNWQ/V0rEBtJWd5RwbjgWRQx7AyeU/K3pMcyCRR4jWxwO6ptWb
 Ne4Zl07vD7spJSWis/48gC0YV27mDDz7pr9iuJzAfi/oMsRKc9K3eXyHhG8ZHft/A7ir7ZAyVwc
 Fk4prkzenC2pXddpAkczAGfWJjvC0VNdWzoiECLQg5mrQXYiSx7o5qfCSDzj6V9AASP08AqaKh2
 VKCGYXzTAqSAqBL8xEYjJh2bpuSrL42SR3zSHk5L7vUxiR+pOtADEUhYUXmGxr5TavFrQNOb8RR
 N599LUwSsfV3LuSFTT//t1mB9u9hwKvA1S8FRRA0TzjrvfeV+vP8/qdNS8zu5fVd7aROs9W3zCE
 iemMkoK10ZEPAM6pYYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115445_498088_A8C19E58 
X-CRM114-Status: GOOD (  14.91  )
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

The qcom-ethqos driver is moving towards using "rgmii-id" together
with PHY-provided delays. However, existing DTBs use "rgmii" and
"rgmii-txid" and must remain supported for backwards compatibility.

Warn when either of these legacy PHY modes is used to encourage users
to migrate to updated DTBs using "rgmii-id".

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 67738c1598c50ade22f2d548a6d66911c348af51..2ca2f03de30174c9771fdc517c0e21e3b392ad76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -554,6 +554,8 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 		return;
 	}
 
+	dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1


