Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB14AFEC11B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AfWKzTwtokdQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=; b=XmxejeEPRcA6dXRmZZwRwOPCS3
	2hRt5vY7POrdQp4ZFT0S3fUqxfcIRbNCkURPYajC3kX6YwVmkkFCGwYhPs37lbZprFQ4ydIbUijeO
	WHbm5MZsFXy7riSfY6w3w70ZKDTOJ/EkXcDxOWaLAkzZ+9Ib57UcGc/NQ/LXsuEBKy7leSqEZ4PMK
	S5n6AwgcE2sCiGBbZZGCi51494C8A+Ta/UvYsjEb1y0cpF+9N5Jd95FRfqymZLVzf3d5Y/M41fAlv
	RVua5XWDbQtEkdEflaE66cErL66aJdibuInB89/HS/lNrkm4jR1IgBLURtfTeuTNTQhTwCEplPjDH
	Wsh67ePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M6o-00000003Djz-3Ice;
	Wed, 25 Mar 2026 11:09:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M6g-00000003DfA-3LkL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:09:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P5a0mc2076393
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 11:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1AfWKzTwtok
	dQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=; b=SdnTDT3ctcNcmQk3ma/BCd5+BJU
	AAGXaCFMIAgsSSIvbePj2oeG5CQHxMwTfYEVW8waM28g+P5X+lgl8me0bMgDk+vf
	WkpWSWsPT3yhZPfsi1s6agEDUFI+5/gMFQwK+1jD/3GJG0efqzey0XwhT4ZQUDgH
	G0Tn8rOutM8pDZe00LhM/8L04QoIv5iL3VRR8V6xjgedV8+JN+zgCslQjjH4d8g5
	mBpQHAr75hwr6Q8qlk+8rz4WTd24HoQ+dUQXZkCGsWNGaO0xj/1mFFKcd3RqRXwH
	tq6DlCBk4rKzAFnvl8rdWtB9VejZpiqB56W6ygxBuvpjS5YIOS5RuVrEmyQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41412ud4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 11:09:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50939597b85so294743321cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436941; x=1775041741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AfWKzTwtokdQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=;
        b=AXQGiGpGusPr1NY2XxHwm0GbcMPWDDpR0uMiTLHVhtseN7wTRgUZPV0f5ksUYuQQiA
         5xYz3vEZWMKfsbZuX+PwTB9D5gnI4vBOXhFwIVzT5GO4LFkgW4iVysk6EpcOwWa9bumM
         CPAND12raplJA2fnQJbncfa29eMz3KHzFduDhuEwmkRgEdUvpbSH2g3bwVblO6EV+5T8
         a+HCZ6dLoGPHNnQc5yXPytUvxaEGQAy777JQE68pTEECu8IV6jF1DtWGlwr610KUW7k3
         ksZKP8KLkLuKZ+OJ9qurk2WWN1/Vy4FseE6mjzu8JoUStIdHZs5YkWFbPeU4ukMBs0mk
         bcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436941; x=1775041741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1AfWKzTwtokdQrtj1TKAYLz/GFoKGs0JY+001MItkFQ=;
        b=Kwm5sfD0UjG7x5dya6jYreN18+fWcHzn1V0LS9TKJ6BtZ1XA/2/IwSatoU4KxwwtID
         FbRgKV3WjCsr+CqzO63ozDxuqPUV3b2HKGB14Pi+zN6u2L0IX41XeWJiWaIIOgkELaxQ
         ULAjY1RTHRY4Bpt3k4BcOxxUJdJvOqxrTNBclfQNwgW7vuW0dfUgB/VCxVq97DtNmNBI
         L0bEC5Ra08ooqJS23IR04iVedRWoIjt8OsGZx6IFbHh6PeOYJfzRxE9jzd3vG/u5bFid
         7ziRkhAwk1edPzf/pRX5IH7IbZ4b6ruo/JLk5vUSl0SRSDuELL00yuIYgOI06Qf8uM50
         tX0g==
X-Forwarded-Encrypted: i=1; AJvYcCWaV8slvb/HOit9UeymSWRQmWzOoOahMAceChkVAd8ajNCSrYlLxh7IjA0ZHmbsu3BW73zNZfcvepbSK/cgG87T@lists.infradead.org
X-Gm-Message-State: AOJu0YzT2aQiWoaqEvzmzmeDLG1ftf+FC95TRuggbVzEGhTdQv8nPHVC
	zTqSQVh8Vbmq/uj+M4Mi3/7g2EEBmnuMLXtnouiX01GPztZaXXE9UC4D6qugKq8dv7ouEDWLlAj
	N49QyvMAMBxdHwpp3MUQGXIrjBMD6SW1Uu0xLdhnbGEO6uOrOb8+yWTYfPQI7djO3ueTKv66euk
	Gl1w==
X-Gm-Gg: ATEYQzzOO7qesPEtC9O0LfW9Ynbpr2dxkAOHhMzKX9+XaJMY2yg8ZvuPglthDrk5ZLB
	Iwu4oi4Gw/lrBMwQneU6vVTE0sYZaLhH1q++oOCMaCKd9R0xYJS0ZOig7Ok2LKn9rwi3bDPfG+Y
	TAF2pfT9LqibFARsCOgmh8HUJ9rVzP0G73RkJdeHZUb03RsQMHjwJtJdhVheliYx3LD2bPQk74g
	l8kq7f9Sq5J9GJjH1AvfLhLJ5jGKM8b822K3DRomL33p8u8S8HVHzbMtTu6nHljVTd5IBLltWsa
	wYR5L1edGWYZtu6ZrbaqgI52+3z67r5Ei1vnJp4Wcb6jjnu/fFWrYmNFBi/KbUFoYkmmjHNY779
	vF+tto+0My+sCU3yEaj/0T2NgaZWMsOof81hG
X-Received: by 2002:a05:622a:41c6:b0:509:764:2efa with SMTP id d75a77b69052e-50b80e6a7d3mr29556351cf.59.1774436941357;
        Wed, 25 Mar 2026 04:09:01 -0700 (PDT)
X-Received: by 2002:a05:622a:41c6:b0:509:764:2efa with SMTP id d75a77b69052e-50b80e6a7d3mr29555851cf.59.1774436940763;
        Wed, 25 Mar 2026 04:09:00 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm47619447f8f.3.2026.03.25.04.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:08:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Kartik Agarwala <agarwala.kartik@gmail.com>,
        Maso Huang <maso.huang@mediatek.com>,
        Trevor Wu <trevor.wu@mediatek.com>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: mediatek: Adjust style of blocks placement
Date: Wed, 25 Mar 2026 12:08:51 +0100
Message-ID: <20260325110849.127051-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260325110849.127051-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260325110849.127051-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wdkRrMQejqveISkL2MxzQ/V+fR3t7RIyzxSBQp7r+1w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw8JEXkxKeo16S0aSwyAQP21odbjBYOyBed8EY
 /h19F+MUMiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPCRAAKCRDBN2bmhouD
 125vD/oD9fXoiFRcGa1yPFEthz/pVBn7++KkN8GbruINBqIbRX2H5ZSWD7m7hMqzWZiFRdm4Ebo
 My9Wgdv2M0Mubtm6RgMVDdaa9t2y9c+4n8Qz1q0B9KyNxwxBuQuBQYvdezYOHRDYXBSsCKeC7Xi
 qq5usz5cTNVfxKtVwnf85rpOClcYfTk7PxH4o+SxU3LePJdHF0KCTPlrGlx9hbb3Q/9lDArQWec
 qnanyJhBFCkRrTa2cHx6V1K8lhPjIMUk8yG9s/vq5chVpXR4kq1lmj2rk+Ht/GnwaA+qXfTnwkr
 7p0E0HZvC1/Qhmman/avtqrYPq/GxfcscilC3lRdoGGDH38YmIpv88Cj4hA2giLwdZzCbVd8U6M
 oSkyKv4QfC6CTwiKXes8tsm/0tvyaeynYqtQ+VKtqA5SEWPPdAtczvYBiwWL5zn8/efJ2oB9dqc
 hIjLglg2mTLHHhq63ykYm058FLWqAdAWSkkGu7jQJ0kRWRU5U4XV0l7F6MasgM26P8KNIXL2r33
 4/NzFv/cmQMalF3qKYPJrmEkrS5R8AYO9HW0Y561DZ6eo+tyHziEgr6HegIr2THB+1x9lAx8JF5
 n8HyTvh9ik5npRr2cEOFbCjAHiGARgyxFUqguGqB1X+4bQBwCCs/DhXSloC2xBm4KLfg6xd5enD 0mP0EzORS6NhEtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c3c24e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=tdU0VRo1b7d2wqM4LDkA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: NDGPLdiYOAUbWNRcOfi9mnziLDgU9oSJ
X-Proofpoint-ORIG-GUID: NDGPLdiYOAUbWNRcOfi9mnziLDgU9oSJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX3Shy5VKfqxFP
 My7ztUlkS4bnRsuqKLjRWVALe+/KymYA6gGtpr/tGSwZDmxcuA0hdd9Lcmr6FewrF3Bh5/yWel4
 dgCOJZ82AXRe72UZ6CFl0mIG3d3LO8xNN82xR3ZB6Zk2j++nk+BiCV+HGVZwWiSt7yds0elU/H6
 FmWdk8nD6V5uiVTdOFnNj9dSDQvmlqwKta3qktQa5VGOo/BoHGquVlChtNDYjf/8yiN/ng3M3oJ
 eaf2Z4lXBwClKQf2P6Rx+UGknHPvT0VUI7H571JfWabr2P3nXDki/4yNRf4YTTm4aLDMhZujzmt
 QzFHMEATz+vrDWtZGpVH8C4cJz5mYFL2GwTH9fGdCnnvs/foiAcUqlNY49ZP7fReWzBXrQ/4KGW
 Gq5/6pUA2ax3K74lW3YpxIapnFg/lwgTbQdXXTHxq+VEmHZjpHsqxsTzzJRS6krV9gO22QrGxLg
 MQ+9Z78WShjTgd5kK4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040902_835623_23014CC5 
X-CRM114-Status: GOOD (  14.72  )
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

Convention expressed in example-schema.yaml is to place
"unevaluatedProperties" part just before example.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml     | 4 ++--
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
index 09247ceea3f7..f21cad4bae15 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
@@ -36,14 +36,14 @@ properties:
     required:
       - sound-dai
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - audio-routing
   - platform
   - codec
 
+unevaluatedProperties: false
+
 examples:
   - |
     sound {
diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 7ba2ea2dfa0b..539de75eb20d 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -105,12 +105,12 @@ patternProperties:
     required:
       - link-name
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - mediatek,platform
 
+unevaluatedProperties: false
+
 examples:
   - |
     sound {
-- 
2.51.0


