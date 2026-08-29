Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A2EC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo3E/nh92M=; b=fCG9LXcItydNPrBgfr02ccXtub
	rsnlks+u6dOYM1NK6xOF9oZsk3IvPr8Io9Ujb6uLcZgpfNKeFcoQanFAxleMFrF1HfmZbTf49kSHE
	4kK4HCzp7YTnn3efcXvND7jgRwwe/v8tRP+KoLv2s8MfZHJD0LFVFR/LrskRitZBR6rwkpaVcgkXs
	3OfxqJ357iHJoWbEW7/ueNLKCPWfKw7YGRvKBLCpQn37AtulYDci3oEeEeSme3iLk14191KXIYJ6J
	Quse0QRKHb7z6Mdj0TJP3ovUJXtUmAM//HcSfXvu65nkc1DKYVnJl7Tbb6DbqqkkpRhHe7VzrxPX8
	PaK1qmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0OwF-00000007Gxd-4AKG;
	Sat, 29 Aug 2026 19:42:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0OwD-00000007Gvl-2SdA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:42:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TIGx5V1416797
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo
	3E/nh92M=; b=WeU391y3EN2EAeWizyqkPS9VYRMrMaNbiAj1iZtZQ8YwMfV6c+g
	tmWEAHFuozPD53FpbZrgWQZ5R9Zkrr4Aa1gtPEbnNSuLuScG7MQtnYnRjJavOaOf
	haOqeJdQCWRelvArqRENAKjM/6+DMPEi89oPoqLxWIf9SLzNupzGSOpVeF/rcStZ
	hf/EYrqJM1O5XcLILqDeZHPHjtGrKKNz+kcioyAqGUWN38e5xQYSNSuEiI9H9O8o
	Cl6P1HsI7idBTp0cl68SJdbHTy23TjxkTAjHrpkEfa/MwobotvqRlWhLhqsxCQ2V
	B0a8mk2eeF7Bgq3Chi04iLHOpERke/5Do+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbrkgsgvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:42:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso43869831cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032520; x=1788637320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo3E/nh92M=;
        b=b+FnQgZU8oxv4NAuzy3U2vUP6r5m4ObYxALT3mOZbOQhjY2yLWyczNIPeaFhOUdA6H
         9x1KEVwHaRzyioi4H3EaR3IcqWGe+JavLaC3wGChaa/e59RYHAnx9ECZgydrMaJJ2qI4
         CKYR5YTTQPd4GFEs53Od9lYKi3ahsCnk19LUyKoyUj6U0cE3/Ge0GULIEBDYMFG9p1Ak
         N+5Dawans3LS76buSXqNfUIavLs0bwZS3rCHZJcpxZdHsJpC0fQcf8sjS8feirWAcgOl
         Ppxxi4/cVo+t6XE7DwRE1RsdQR9lOaSnNSZfdzfAr33x90GAxZvNIRKeLuJ21R2FYH3x
         KaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032520; x=1788637320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UE0sMOBybnNkYtc0us0FNHcXyb+U+7zgcvo3E/nh92M=;
        b=HHdnLl7t69o+A6So4vFIvL2kSyRbBDu+UZZRIul1RI6WMck6j7oqA1ESzDLjtUK8z7
         24VUXj+1dIJjQW2NIPfC/LWK1cfGV5MHvH78cSBRFLXeBD18QrQc/oTEgqE4TO8pmauJ
         D4/gbZkww+xUWJDVWEfX62JkXgWkTWK+IUsNnG8Mgo58BRCrOJGJH7DO3pkKjsCBE4Jz
         DT/Ax1/H/9XjvDGUiVrwyyrWMxxtgPxVfA14TX2EZ5zJlRDkgq0UehR1Jv9zKP2rflZa
         OeuxEpyABdtdjjYksR8oepcpc/Fau7/cs3jm8fwbLIoM7uWODJwQYP2P3WvxMPW05ZqS
         wKyw==
X-Forwarded-Encrypted: i=1; AHgh+Rrm9RtyHNFvpFXixaxycW6enGMP1/hSX88dUpyMNh8xAUWjUVTmTWOhteHNeOYER+AicYCRolea8Y8HMcWO5/x3@lists.infradead.org
X-Gm-Message-State: AFuF++kOtqefutjbma+x1U25oqwW57Fxp+4Z4eYKkK4LTBj0G9hfa89A
	NbsiOAtF325HODrzF0RG2teYbUn/akF7pU125QmQxlOY0oOne8ZZp3iiLiWbrLeanLEsn5EEE25
	3S9E1XdO9FQUhlgdMeRruojkxC+lpJXow1z9/uM3fngTWxTBu2UAoYaO+ItNNbXPrB3vFSDmLd2
	hV0A==
X-Gm-Gg: AR+sD112yO80/4Fp+WWVRFJzJt2vWkQi+RztAmxBG+K0rgGaCKXuPH9lsvfOKU+FwFa
	3+ThajpW07c8qObW/rje0TFpQ1ID6l/hAj4Ct1WXE5H9B2r5GYaknz0t+3dmOfK2Cv2aBQjJF2g
	+cwh05Qvp/DLxov0p7WcDC8fHleEggPwkAHOcs/5XoHD3wT2ldyMcz9/sCAr2VuIhNKFRu91Awd
	crJzZrdfEhOzJDc3cswXJ/PMkqDEnYsA4fP7bcFPinHKUP8PH/jEXzuY269qKSPmWMhChtBjp5L
	2Hm/djAqL0yuATXqLPUQx0YhCryzIKKbCsXuYjc1dPTKQPxKoESQ1GhAEkQjJlTvncvHBquIl5/
	Yu5ZSIcvjO1GVxTQ=
X-Received: by 2002:a05:622a:858b:b0:52f:b9ad:9dc1 with SMTP id d75a77b69052e-52fb9adaa2fmr158668491cf.20.1788032520082;
        Sat, 29 Aug 2026 12:42:00 -0700 (PDT)
X-Received: by 2002:a05:622a:858b:b0:52f:b9ad:9dc1 with SMTP id d75a77b69052e-52fb9adaa2fmr158668181cf.20.1788032519645;
        Sat, 29 Aug 2026 12:41:59 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cc9497b3esm109116615e9.5.2026.08.29.12.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ASoC: dt-bindings: imx-audmux: Replace tabs with spaces
Date: Sat, 29 Aug 2026 21:41:55 +0200
Message-ID: <20260829194154.108191-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1317; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=w66JHtaqYu6BtNB8TaZPdSDZZgYslAu8moQz0zGwRD0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzYDrucOEqKbgwzMI9GFk+bfUoET/OAaI0FuE
 1AwPwDyxwmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM2AwAKCRDBN2bmhouD
 1yTxD/wKCcZV032FBhJ4DJlVj52zDbEY6vtEQN1S4V9nAb0+kVofU2g7A6V3jNORq72dYl2DOJn
 3PSXvU01Q9j8UAWFG3w/tsec32sPcJCr6jSq9KH3RZwujUqV9JQGgnNLCrblhLe/D7/FLiQqMxM
 sRgXNWFUza8+56/+Yp4tz2nkkkbN4Urx00SaVxdeu+CBAtB4GsE4vtDdx8OJ/B6mt4/jvJ3b2cU
 RVYz7quvNf8Jq1bI7a9Tx7l6SfFrJ8kspS+K6VboYo58UAtxsQ8r+dnuYMf+jrC9Hqk18QiSqnM
 l8FfbDE9EmNt0wh5uTsD/k/KgwBNzMW574Pkbg8bREwntzgSl2+jtxFA3jC3KGDSWH8bm4Du+iv
 TiLa3FDw1UIVExBtxTv1WtmQ/dKUF9dy5rTZPnjzYRp0iqottMCyK45pGv4bRMnC4/f+/gihsZY
 M/0h4BeZzJWe5K1kHF1mHXYU93Ag2u+stShAyjLkfKjgoI6G1q/Juv23mTiv+6sQhZggHSp4Osh
 v7skbiV9MZZV0SeAxhHo1dzNLKHcazp1GIE6JLgCXo45NdxiCxx9sOLfeCPR0M+ejE485U6c467
 RqEfFbtJcuaro89VgPDDLEN9V0zZNFkX6PDHCpREw+5GyKf8VoS1XbxECY9aVh/kbQQFHP4jOfM jHVBKmsQ9gUpG0Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX3IvEmcWSAL74
 8DUQQlypRZpBghi7TT7BwgiVZAr2NGHFGKpJVGJn+TexETpIb2xzV67G6IU3MApPTd9eFjXw9SQ
 ZXB0QyVgR6wIeYL4WgTCJtLf0iUmqGft4w9cZE5+yyCRMb5ZCaXXdjya3hKNGveVYW2FKsVIAul
 1jUyiJIUdfTHzqKz1QK1zVSdbNAVb8iQJuDb+KWJuPpkAC/FP7GUDe7eliO33RPX4GhjEKHaEr2
 +O5nMcoybMuCdgYZUjOxv14Fy3u0wLn9yQLraHtTCqdytmKsfct9crzHma1HCt6xhYatOzTtiuS
 YLrQdDYWQCbPj1Jo2knHSTHnhqpMxIGlHy+XMzreTMcQZtXLo+WZii64kVCdaw5m92TCPd+XDhs
 nLUPznRbwIkm4JqsErEajYEzqq0xrxuBZhixEQVOgZrDn99y7fPRPg746hx7SaaChmWtXqTtI9T
 HT4BAGy1b+aR5dKBzQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXxO7CGcitgMKx
 a9XogD7kW1h3DBYOl0TOqP0YiYAwOMjVzv6jw6JtSoO+0mETXfu2ldQOamLjbdiWJel5b3131ON
 eSHpoiZqTOu3Sw4Y1MPZwGIuABFoy3M=
X-Proofpoint-ORIG-GUID: raeL1HhuPj-CxPeZhMzxFsfkbnoELVUE
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a933608 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=i9mLyMywaSABm-nTGLoA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: raeL1HhuPj-CxPeZhMzxFsfkbnoELVUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124201_632120_A055783B 
X-CRM114-Status: GOOD (  12.56  )
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

YAML files do not use spaces, even within the values in DTS.  No
functional change, although dt-style-check will warn about it
("[tab-in-yaml] tab character not allowed in DTS example").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/imx-audmux.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audmux.yaml b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
index dab45c310670..501af1add3c1 100644
--- a/Documentation/devicetree/bindings/sound/imx-audmux.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audmux.yaml
@@ -101,10 +101,10 @@ examples:
         mux-ssi1 {
             fsl,audmux-port = <0>;
             fsl,port-config = <
-                IMX_AUDMUX_V2_PTCR_SYN		0
-                IMX_AUDMUX_V2_PTCR_TFSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TCSEL(2)	0
-                IMX_AUDMUX_V2_PTCR_TFSDIR	0
+                IMX_AUDMUX_V2_PTCR_SYN      0
+                IMX_AUDMUX_V2_PTCR_TFSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TCSEL(2) 0
+                IMX_AUDMUX_V2_PTCR_TFSDIR   0
                 IMX_AUDMUX_V2_PTCR_TCLKDIR      IMX_AUDMUX_V2_PDCR_RXDSEL(2)
               >;
         };
-- 
2.53.0


