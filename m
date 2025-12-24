Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B57BE75452
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XwDMAVWQZPLsI1sS5NXBRncjTne3brdgriHnrD1ui2g=; b=zIj5tfumpfxBKMiaZViyarxhZk
	kBc5Eh4R24Oxv8gA3foL+a1kBC3x0lw6d2Ctqpjae1HBQP6As5h3Yuj5WWQjn9etTFbk20Rs0Csxi
	r6YzLKbzMAt/FoHhe4sjM1mFHp8ZMa1lCiyqm7g4SveR1ZkNFhouRoUef8FZTyKE7LE2Ylmkj3I/u
	Io/LkT4psbjzph3KBud3p0SUseCCzLSQucHRbDo86qQfPmBikN/YWKh1CxpbLYS/pRkNrt92JxxOG
	TYHAHv4qWlbqZJ2PaJ1Wk/FlqR0TTG7s80OhMEz0zunxjMtRQQL+kzNaPUGA8gf6FIvCvhNJ2uyYd
	2CkBzWLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYOE6-0000000Gnit-41dj;
	Wed, 24 Dec 2025 12:44:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYODy-0000000GneF-3ulh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 12:44:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO91KWU700446
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XwDMAVWQZPL
	sI1sS5NXBRncjTne3brdgriHnrD1ui2g=; b=dqxA+GV/rkc5VhB6myTFDMUB/GY
	uAbaUL8/N1kydDU7ffMX2BU+dlIlVyshSsNxnTAzICsyNJJmDboko6yxNsHzDOUc
	sAZDfvWrmMH7/2IikMAi9owFAuXndXWh4Xiwc20IvT3zIAzxNWGfEo8zUTsxV+8x
	VtZHsSsCeyeAN1TryMUx3Y/Ndxkweg4RFeltzhSPtYt69BZuwrLN87+wjy6HhAQ0
	Ue0gjkAXdcJ6Qka1VST2LIeFQSYGsM7WLxRC6uqzQGkCVabGg9/XcP37WvFYMRfX
	ldIbIlY6f1ztsO++OHUv9N0P1XL6v/jYsjuEfeSPBSuqpFOz7tUq1ck7WgQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7juqgn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 12:44:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74ab4172so138593481cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 04:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580257; x=1767185057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwDMAVWQZPLsI1sS5NXBRncjTne3brdgriHnrD1ui2g=;
        b=EYAaXvQ1yS8Xpm1wgknE1M+xUkjvX5M8tRTamfRKD+26IRgn70/Vr0h95R8YnPqSd7
         PIVGSZYYWQamIpcwb8Ol3jFduYzJm1oQ8XerkX48aRMtZtZpfpaE3tWoHLygOZw/D8GZ
         Of8iSEcZgtsZlrJBiSJvhHhH8en9LBZZSDykvn7VmW6/e3kFUZN+kM989o1W3N6ms6Qf
         3r2KZQEw5anlC7BwmQxc6jQhw4Pa8KC5hLpohkrEqbLkvdqAnRWyQcIXTK7eWYTOw0ti
         8eDMZwQNH1gIWNhklki4qyUeUpTUf+H2hbuEpvQqqo2n3lpkd7RLRaT+XO1or45eDXZX
         ul7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580257; x=1767185057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XwDMAVWQZPLsI1sS5NXBRncjTne3brdgriHnrD1ui2g=;
        b=FXCd7ax9NWq39HexJ73AJFEnFm+AAFMmHL7B9HacA78vf4QOG0h0bdIAEr4brQc3xl
         ohlLMbcJXOCUQBn4+00fppeqsHsQPLzpM6zeVy3hGkUy9k+U0ra76aIcDES7adyU3WD0
         WBeRjBJoalkBCQme+yceDKIj3keTSHupz3GHg3HH8Zevek/mbCurWSIQteeaWvYsOsPl
         XeveXFjjq1fcOj7/G4GB3gWPFVkjNQdN6wyQJ3ORF3eKqNBNWqfltMxhuxQw7/JhpvFQ
         H2tQppn0wIE+mmjT/mP3ezW8D6gdGcZni0Da6luA3dWQnN7WRMzcBHnDznOhx/qL+Fgr
         3ZPA==
X-Forwarded-Encrypted: i=1; AJvYcCUYxxjSdtsgwkGyeq33amI/8NdLQjwN4VcS6wCDI1nZ/sqdfWt2+dbuMpObbUY40gm/KT52LBWiCFo0JjSYqv1K@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcc08zYYuIzD+RfOyhMFbpSRi3rD7JGolCDscXeIuTPXCtavmq
	DgBHWgxRRtBYNmLwJRfSPS1V4IWIqc+Nmqx8KhGkdKjoncf6od3KegySsz/eUOkFQSGGeYN4l4k
	CpN//H+ZoD8VYNGhV/hM6qE3rAkRTfw4kLkCiKLMLntgQjCp1FNRhMSqlzGwHlv7EHrq2zrTMZt
	+w2Q==
X-Gm-Gg: AY/fxX4FhTRroMKjicC2ObHsQ0AZ5DTmb20YFp+NsdwszCgcc2SSa/qesrWLUL/EN58
	VNSW8TNJGJLpUG6Yfxv5EtFi1l7B8Tl6oznmkhoyKJf3wyE/Xvm1YYpd3csA7d9F7ad2z6yOa+v
	8K5Feaj2FxEMv8RHTl6MfN/KHR6QfoLhg+aQy8WY6dMPpE4DR8zVv52qHxH4WjyKauFk8vGW2Xz
	jPtmKECWkT1hnZYTs/tJG0caQOOa15AAgA0eP5z/j+gZJQjIFal3SokpPywzRv1ab43SuDHx7/D
	wvlANTdpC3TW+OPdaJwUtun3t7PHYc0IyLjxhe3jzLqU51Q/YBD8t8VryatIde9oSJDprF6iqQn
	eX0NuVbpmAQ/ELaJqkB9JozlaEmyVxpe7HPmUf4KBeyHLBaRx3kHdvpjbomk5t6WjPGsp8A==
X-Received: by 2002:a05:622a:578e:b0:4ee:278c:bde7 with SMTP id d75a77b69052e-4f4abd1c37cmr241696871cf.23.1766580257259;
        Wed, 24 Dec 2025 04:44:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQsrxYLgVYVborec/UqKUOFogNSAh9agcb0z7QoRP/7+Nr+7itTQ8LnBat5QNl7LHwl+pLjA==
X-Received: by 2002:a05:622a:578e:b0:4ee:278c:bde7 with SMTP id d75a77b69052e-4f4abd1c37cmr241696601cf.23.1766580256899;
        Wed, 24 Dec 2025 04:44:16 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm17049203a12.34.2025.12.24.04.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] phy: core: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:09 +0100
Message-ID: <20251224124407.208354-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ff6qdOZjoCBTn1TA60Yo0C5n/L273TXJ0BR/Wu/HAKg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AYVn99ItkzmuljyaB3Qxn+eI/v55ZapOafq
 3uK823nW6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgGAAKCRDBN2bmhouD
 1xSrD/4gkWzI15LqAW0wgK8pcxMbLEJXRORMilaiM0UfCmlhOWKuoVcEheRCnAes4+TldZXysBd
 IrhuZKJTMIAhzG9yy6Ibw6Y7EAPvlo5VIszQOfC7vMqltZcUd0dgjGjFhuyE9BG7o0bbTRBVrE3
 ymz5E0QrpUx6gWTbBegzdX3BrIJ/8Xqzyofm4pflhVbM+9RDD5GBjVjTIVsoHWTKUYgFW+bptBM
 3Yt/4kciBY0PSMacU0TQumoTX95Bj1I9gkoRlhTIMywAM39IUXwMbjzjA+wuL9oLaAdqI0QnOKK
 a0/4l2oVbHI4PftnYKH1wLHLzOaHkmvs8O3A7xIUed9aj7L06jJ3J61sqkM26J2e6F0uW32x+pv
 vtVBRr/d7gTrYEKPq99Bz2PsUK1jEfPh7yutVZw5FjHoYiCBbvsg/9S6DklN4BJ3keqnasyxKTJ
 cfVGjgQMvaQo5CykKfu3HGPGGUXK/BiV38QD6J9/PxYs4wUKRTsmayZc2eDY2llVUOrIZ+QeaCu
 aPitAi4cSTuRlssceHNG/ogzJm23CR3oaS0VR5gxJ6LjOfsyfSiZOH5nO7yiJzPr5NQjUO0FQuG
 ZDy2CLgZaJyq6Fzzqu1u1r4Mj+fMC5T3zEUGwtey5a5+IKy6pK9dGPv0o9xGGp/7tpqLdJezVpg KzpkmvXcC+ehTRg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX0We8agbGXoR3
 +xt52pR65+A3IMr3dUBQAIclznorZDn1iNgBG6wUN5xwYgqmPygPiPE+z0gXzeJQVTUH7ryFBvq
 LeuvDqya8CwnbXWvF3/H1+iZkX/3speY66CmJgCrVFBCDLW3FAVRbr8F6XtahB7aWwzSFynHr7w
 ylPk+G/3iHwPdAJA2iXeerpbFpDozASrlFI5mibMQerSBNbpS6dBlgY3NKppXXDjg0sUq7h+mPi
 oWs2WzDA6OQHioZpBP5afb2/vtEyON0MD1PAJhVPU9wGP0bKNsyb75nTCElbhjUEV/8iWg1CKIW
 zNEwaRA2ppkbvY48ajmsRWb9xq9iq3SyoYqtveOTOT62XtZDasg0fbA2jITgMo95eTK4LWAQYM9
 XBvxtQwR6YPux23gDsWDmBxYlhn+3VPFZIzd2DR5VMEOS5l/d2++n+n3hiej+cFgG7mPnOFQQ1U
 jD2jLRFjHrD2NsjlTYg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694be021 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8TZc5ORpoUYqJhTIvu4A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: QZSCt10JikjcPq0Tddlzm8PgDmvA9_Cv
X-Proofpoint-ORIG-GUID: QZSCt10JikjcPq0Tddlzm8PgDmvA9_Cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_044420_262999_16972405 
X-CRM114-Status: GOOD (  14.62  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/phy-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 8d227890a345..d57c9525fa38 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -138,17 +138,14 @@ static struct phy *phy_find(struct device *dev, const char *con_id)
 static struct phy_provider *of_phy_provider_lookup(struct device_node *node)
 {
 	struct phy_provider *phy_provider;
-	struct device_node *child;
 
 	list_for_each_entry(phy_provider, &phy_provider_list, list) {
 		if (phy_provider->dev->of_node == node)
 			return phy_provider;
 
-		for_each_child_of_node(phy_provider->children, child)
-			if (child == node) {
-				of_node_put(child);
+		for_each_child_of_node_scoped(phy_provider->children, child)
+			if (child == node)
 				return phy_provider;
-			}
 	}
 
 	return ERR_PTR(-EPROBE_DEFER);
-- 
2.51.0


