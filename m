Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D98D4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bq3v2rgJLKiDEOsLmXv7bz0bBd5gBl7Lr8FAESkXElU=; b=E5pDHw1uZT6V3EdgBrxavX8c4k
	egLQ3QS0kKIusTF8mjFykgp+FU9qujQLoi0hiKanLdcj8l3MTEHWPsXy1Y+EwmC0Lxo3/i6P/YqfK
	y0GPAUGih6QP8rnjwjEdBxtIMniZEkgY5Fq+3oFXWYF2a/+x10bWfh/uUQVWwKPMB41+4UZ/XYv/o
	3bs47zz82W+7lWAG+qy0/sgWVXGnlr9f2LfPwV7c9oVey78o0BXVLzekJ1R4AoQgABeCAAScVyOJo
	SdUWzK3xU01X9Ajif7YLms/VJR69tuSocDhJVuJ9RH9vnP5HK70WqZPY+V79HsWOaVMefGOmY/uqp
	A/24Jf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXEX-00000000fyi-1GfB;
	Sun, 18 Jan 2026 18:10:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhXED-00000000fe0-2j2x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 18:10:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60IDQ9cX456045
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bq3v2rgJLKiDEOsLmXv7bz0bBd5gBl7Lr8FAESkXElU=; b=pgxM7ktrM3C6JNHs
	m+dptkkX0Qv+/1wvRYYLqNk06hFxp42qnRNeX85OydKUK3DfNxmAU/+bhQnSiBE9
	5jFqrFFliVJbtloeqx2ulbLwmsj6LGPdxK8mJ+AOtKFLJ7/FTvUM3lulmSMjMd7z
	jWAXVmGvZ0nJaOhf9+EEzpdpwW0K7ncgLn6+kabCTPUEQ0HRjC4remHm5WAf3orp
	HTpFcUGejLERS01PkijD3DH0btzRlLQ3/O0KkA2D5XV3RZav6SLqyQ/JX39LEy2v
	IApUg/r+kFOm+p4BLIsQHdC+oVN2T7Q62++87p+3q1J62nfSHmj2FUGeDuinLNoy
	mEignw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br3kh2mcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 18:10:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52fd4cca2so937724685a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 10:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768759820; x=1769364620; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq3v2rgJLKiDEOsLmXv7bz0bBd5gBl7Lr8FAESkXElU=;
        b=G+6BIvP79YJ60usiGuri/FC8EVm+QSX3e0xTZKgoTOoGz1hOYk8kBktF8fAKXoBhKg
         6+3T5xRJr7UkoUvM4R5V8sar+V7SJsxQ1ccADPRdaEa0ZqQrnHtdhebgVU+KNA1WY8Ds
         8q5LcUWF85BdsiXBiL1VdcYH1819MXEHRl2NLu6bVhc9+kbbyzqa6wO4EhjbnPo2aIX2
         tHifyJNR3rnZkfgSqOZDJIu3Zk2gWf5D+9er+zIteM1ZBlNSdarM4uttMfG7ho8hStEd
         9GPaGokmcB8xeN7LzmamxsIGO8iIk7oUv611P0Xa2fm7mVBYTr3FJ9MKOCuAQuEGLtdt
         P09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768759820; x=1769364620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bq3v2rgJLKiDEOsLmXv7bz0bBd5gBl7Lr8FAESkXElU=;
        b=MRujzz1O8uiflau6zGZiNvxK1mXflYcta7WF8hV0Ml/4xF4Od0aEVKravYC313DOPv
         bbJaMtc3YLeMEoJAJBh43mHTattqjJiqhE5pQ1yhpeer7HjLHXlxhBtwBslPk2hDr7yg
         AK27GHu13CJuaR76KQeU0imRwTsFfny8NEat/08GZwz2+rfmBItKgErNNmgqQQdVdlt2
         aUQExj5RmqNJWl3EbBt30gSfrvvW3im4CXgcPJeiBHsfF59QmQqW/Nu4gsbytbINeiJA
         O23/iI7xwT0EO/3N2MSn+JK83al7BFiWM6O6ksOW8sxzFob6xh9d24wgYGccWgdraZ+X
         i4BQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3phOwhC/DBxObFbx67D7Cn6vedt8RYry1wa/ON5KECrgn0SRyZNiiEEi9pid800E3Io//eBafW/qy38hTxOFC@lists.infradead.org
X-Gm-Message-State: AOJu0YwYwIdL4LTM/VGJtIMCS0IIt2hQQpnH9iiOoCcSb4NySrQ7YPly
	EShPu1Dz8FpjkL4urwpZseLyW/WpqP/gxqnhHEK6RjUEIg6FTGIP5qsFmRiTVZp9sHpL1LJKLb7
	W6oO7eCCs7HpcwEiM4GkOsXMQwU9UltH01wz4njuqqoR2yUGLdF59QVJKRBcxktxFvqtQIxmpPp
	GIHQ==
X-Gm-Gg: AY/fxX4AMLf/ly5RoYzNgfeZA2XlsuWyqT43+pgI1Yj1C5X+wZnncooh5XPIpa2Dogl
	qj2W/AzAJhr5GjPQXRGSXvHs5yWRWQK0Vta9JFSKhZdB06VeY0Cq2vrx56Q67BNtr003mFATUxU
	IiO0E++Qt00XXOL5UFAf6JKySXPUrnCNMnsAd/CuBWpV2p9O6qV2R1/rmNo+3hxre4mng6tzd1I
	gIjIhEU6+MM3dJ8xtkrOeMooH1OpkVjjE3kz0RaSTZM5L1zXeScMauHM3V/L6W+t6z9h7I+aRd7
	Kr5kUBVxc61b2sktU2kw4UjojhLQESwD4jllZNrfdsoC1v++56ASN/8zqkbuuAQjVFLqDFYCxCE
	4GmR04XkbFgQB4mi5cWI8I/TJukEfuSy4/g==
X-Received: by 2002:a05:620a:404d:b0:892:ca0f:fc21 with SMTP id af79cd13be357-8c6a671c788mr1272747885a.40.1768759820199;
        Sun, 18 Jan 2026 10:10:20 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:892:ca0f:fc21 with SMTP id af79cd13be357-8c6a671c788mr1272743485a.40.1768759819810;
        Sun, 18 Jan 2026 10:10:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe44b37sm62162085e9.12.2026.01.18.10.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 10:10:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 18 Jan 2026 19:09:31 +0100
Subject: [PATCH v2 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-pinctrl-cleanup-guard-v2-8-bd36f681bdc0@oss.qualcomm.com>
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Thierry Reding <treding@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1984;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zwqMNlVzyh5eJuxel4QxILb1w1jSHcI3ic8DyOkYYFI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpbSH023tp+pR8RcdVkgtrXrXPyyvJCiTJRQMKg
 Lvm/TsQPiKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaW0h9AAKCRDBN2bmhouD
 1wwNEACGkGa4R5iPxfciaNNGa26cpFVFOKNoQQ/zlFKjd9KdLdP3tK0fWadkQ6Hzg8vIuOQ0s/N
 v7S9aLNuDw74JQ3Y+27cgzgg2n/5allaBhi7p504JFNtRp9VuczJS9/aQzkHBhMBYb4qHa0hbMF
 5B40sNT0sLeOazx6g5oH7IJuwLknyQHZ5fbOnNm3S+Rhbjt4X0zszXGk6S5rQ6TaJx8wStEz2hJ
 +lC51VjrnH7jRwQZzX+zzilyHJ/l+HI120tg6qO3suf4O0SY/DtDfqx147BUPRdV/wmxLJ57ggf
 0TgH/14e1z7TwcuN6zs0miiAII0m2HYe/etu+gBd8fiBtv+uEcW1fdvtFo6xpRvM0cB+ToJ3epW
 J+WAhktebIvSeAt0KWbj0CP31V40a5j9h7uHmWaU7Hev8XkKhQb4BD1OrE9+7qS2Y9ZWqEa/b5O
 IHPpVLfe7pkjnOiOiy8BEgRkXThCYu6o3CyTClOaQRKzaR+YtzAPb+KL5GNuyB0Sj6wmRyqlRj0
 1cOaOus9EEY6i/l6k7smRdmdWfEuQRoG9OOvnXlrwxjA+kZXKGddz4ythESHN77jK5FCbFlL9gl
 yc4UG9zGjHjhRMHycAqi6bFpO7IHu1HO61URwtcZ3WxZe89GryobQ4tMqNi6WqrOhlLfDy6NcCX
 iSdKZI6W2hyvuow==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE1OSBTYWx0ZWRfX5IQPbw1n2ZBK
 6BGbXTdryTdpdvlIi5RYjby3jE0SOqie+caeBMXXWZ31EGac15RYQQfjAJ/Efzt5Ljd9svwjmuy
 LvAvb980XmsLyWDjhMEVPYBnitJ0JyT9YIaaaFPZdx6Ac+285Um03PVfQ6B9MVgjcRmw+TNhjgj
 mYg6joFFbj+Qb44eT3RoaX9hKsIQWUbcJc5C2wpQTIt+R7cnvy2e4MaR9iTGQq5Mkihlri1jac6
 mFWp+wN2kVhzNWnsDZwz9mxEhZRjmzYbtwOUHJartNfEXjeUp2+8pkMjTFZpoY3DmcKwaw1AtoU
 69i0xVHOmBD1u/uDta/tIwPl9t0SfxOqRGKI/K42+YOACTbj74Ne2cffXd2BR0ITs/Z44ayFyK6
 KWGDINITEV9tiiXSLKXrtzmTfj5FxuQ5SZydMiKxWMCok0eAeTor5rKayQtikC6OqZgY2P4+PKr
 ofi4ggjTukOvxseqa0w==
X-Proofpoint-ORIG-GUID: vWPwmK42CbkVOrgfybLMcwbbDRpUnvRa
X-Authority-Analysis: v=2.4 cv=JcyxbEKV c=1 sm=1 tr=0 ts=696d220d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=Ed5BEzkqmhObfCaRRI0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vWPwmK42CbkVOrgfybLMcwbbDRpUnvRa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601180159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_101021_757673_EF3E2F56 
X-CRM114-Status: GOOD (  14.82  )
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

Make the padctl functions a bit simpler by returning void instead of
always '0'.  The callers - phy init/exit - still need to return 0, but
these are smaller function without if/branching.

Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 49c5edeba87f..34a373f7e04d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -474,7 +474,7 @@ static const struct pinconf_ops tegra_xusb_padctl_pinconf_ops = {
 #endif
 };
 
-static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -501,10 +501,9 @@ static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
-static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -534,21 +533,24 @@ static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
 static int tegra_xusb_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_enable(padctl);
+	tegra_xusb_padctl_enable(padctl);
+
+	return 0;
 }
 
 static int tegra_xusb_phy_exit(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_disable(padctl);
+	tegra_xusb_padctl_disable(padctl);
+
+	return 0;
 }
 
 static int pcie_phy_power_on(struct phy *phy)

-- 
2.51.0


