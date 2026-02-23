Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08E1E98E10
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=; b=25df9tbJ/JRPG3Zk0rCkxAHwMv
	4shL+gs32ov5WBWHmb2mbP07DmDglZH/3EGf0g5kIVCVcLWhkXxy8leqoObpKwlUo/6/hWr3sXZ5B
	hyOEpzl3KmQsvbivYedPm/PotOubCG9E6a7wWnOGLFmCNfnk6eUm6oFtlADebklp2/R26bVoT7ztZ
	5/eUjufzvdTyOdDOJZu8dhdB1lmRYvUb6Gzc8yJ8wGDdO4JPvskXhgSwJc289UiK8AiSS7B6yLfRM
	UH9iQcsA/MKBwrUs+uoNNm+0APAyMc+TiV4hiRROvjZxWc1dgyRfX5YuEMvXl3FDrMLOKVRZNeH3U
	ECfqcEhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRty-0000000HUeT-1Os1;
	Mon, 23 Feb 2026 09:06:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuRtk-0000000HUOt-3ZHk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:06:38 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8Y3M71506503
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=; b=Ks9LgQaZ3rISUUiB
	UPhLyg/wvHNrMuQ5MWGAkiHx0iTOMmkXYe3Oz/aqmkvOAKX51jAY4jDR0H4ZoTL9
	u3f8F9FGGFVb7seJ0dt4qNmUb/HHrL36jZ2fKTHhNqsTIv6HNKltCodV5RFZRSoF
	IeGKpz/KS4ztmolA34vbLAiIibrhLpIcBlIHcGo9llC5ajpnrOWXzWr+PkFnC1b+
	9g6P/WEhspfqn4px8qqJ0cmtjRLXgrYitdoEVqVNtMcSPtixCMNKxHw/10/QXYY6
	hV+QRuOd+9Sl3vBXhlqaFfuKPPDX4cVO5T5OpDBDeiIGS9wYL+6vHU35jWCqbSw8
	9V6u8Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vum0jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:06:35 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896f96458f3so34893756d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 01:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837595; x=1772442395; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=e857EDgtt7zzYniMtEBzOTTpFSCiqGXm7YieEbJlD+YMWnfMTFID8R74Nck7wnLQi+
         rCvf+AJX42Uuo4t98OTQ14L3oAcpEvA1OYVMuXcFtBMpu8Qa+F/czS7swEsCIq/4ckq/
         KPMXkLLgXKzQTo+uVObkjp+2m7BF485j0fTUDDZ+hFBv00inSywF+qkiDhyLOTeob3DT
         iWK5LwfIx0ioJ57mPPf5hzUkJD/1Vp+mGQQyvSXTxHSdUJKNDmvCTOfcBPBdrJPkpXFp
         +ecX+Ont6CpQsozRTvqDHSLHitE6Xe9F1bAi/P6yrik+gKhNIlg/DSGM5d09JISLROsB
         nHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837595; x=1772442395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=SMQ7S/tDLh8SXAO+xDx6nERCLpj3A25CmaoWQIhsl1ccfveEqFRbT1U5+D+Nx/fKBM
         7uLz1ZhZ1jp0nfNoag32E4VuT/hJJA1oGVlNbBh23PS2xHS/ubCNYLkJNzKmJz1V5Nwb
         h4enQUBsaiRbxwhWppa9h/P6jWfzkxn7oa2sZ+UH0+tTuR0Co34Ek+dQcSM9N7cpZyzD
         wCiRKr4M4v0pd/Myr0r0YtgWvYFSqN9sg4lcr3grihXQjturoXwSILfHlp1k1vGML8FZ
         hhj34QvUIWwmY7++29PlCzCuHkiLeV906RQVqhXMxi7RfwCcGmPgIW+kQ1JfVMUahb4Q
         m9hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEnVPX45K4F1RndKvbqT8p9QB/Bysry1DIRnqZuQawmzNpcAgUbCUnu8mxn5bdDKZKEBbOuisZMNk03NFKqZM7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp8irlDiw/HObYnrtI6vHFojPf1Aw4+J7g5ybJG1rvw/0tdrEv
	UgtF0RnVdgXugFPZ9NPktrXg/7on/C+DROc9kblG7Cz7VqtIvm60dqgvJ4As6SOns55ODV7yqNd
	NQVyH8Oj5hm4ex9Tn2cw0LJ3Bd1Zdv0ksZ9pDrfe14yoBPxk8o9jA92vg9sBaateF0qKEXm+33J
	s6Ug==
X-Gm-Gg: AZuq6aLrNvdU62o2CjVRYnA2tqkozI0JyKcmF8s5UTZUFZjYbOJaGanB6vF9xm2ey13
	RtcGqg0PKWKwZnc0Zs/yqlanNXo6GnlO8EythrinEMTsa5cA7x93YFoeHa1PjXrWIHwZ0UVGK1Y
	nYQubMLqzmWXqZvXs3kEnCEvN+A1xraZwKa9Z5SnKR0B4GGCNiyJQ4J4CSfpA427PfCqG69ke6K
	BhKeSn0Kveaxg3ShC7Zyt6BCO6r8gLml3svB5Ceu1j645TLk9KWkgJPxTMC47i+CaNVFcE0CFvJ
	TmEA7lr/fp2Jsx2tJf3fZdRAYJDZjLRWbt1yzdQnNFev5KDmWsj0975ni2OWBGOFqs1c75EA1gb
	j4EIYe89o1+BrudrAdRJBEH2x13JaXE2YeVsi0nN/9K3OD+yh0dSW
X-Received: by 2002:a05:620a:d8d:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cb8c9e009cmr764191785a.15.1771837594975;
        Mon, 23 Feb 2026 01:06:34 -0800 (PST)
X-Received: by 2002:a05:620a:d8d:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cb8c9e009cmr764186885a.15.1771837594436;
        Mon, 23 Feb 2026 01:06:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:58 +0100
Subject: [PATCH v2 12/12] i2c: bcm2835: set device parent and of_node
 through the adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u9n9l0NVttKMXo8Cm/QnZobv6JruCHoppeN1fvpKWko=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh6jRDDYe/3k1buXIvSNZ0TnkcrKdAhpsYOn
 u3Iy5X2HQaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYegAKCRAFnS7L/zaE
 w/fxEACOqkkkfaqNDgIlMNMHdbLfBNUN+gmyyErH+9RBYgw21lotLXldvXjukuDR43t7iBhEwQ6
 v4RmssSTTIPx1IaBN8RKqSTKhl9DxJTZoQG/RWkex+IXlSU6aNk/eapEsQIS/ImmReGyQbGzaUC
 7BGuDxYIhXrvzKsSOw1FzEhWWbMSZ4mtTdk1CZeUrsOGpc4smvhI1+XwAzfjXYf65/NK5LMjc8l
 exdlUnuKLFmfZboiBNCo872Eq0XM7NQmb7eOa67A2jpyxL3X9WXj2R5d1/Fr5IMGeWkZdnRpjSj
 5NU+AHl99u6k9MDIpqfSEV1EeSM0vmqqL/8Ixa1LJa7BDu2RNTN42T2+jCzGg42h4AIkgCTP/dl
 l8qVhh3hgMSHhLhJM9H9kPZwlvkqzO1eLwurRNKpTgz5jOjqwmhiOYxEKoxyr8+0J5LD6n5NLYg
 ZSNAJM/fPknh9iPDrWlWBHqxOKOSrZnLL6HXgCJ42zZht03ftuKgxXbEtQOCU2LIHKaePurzFUH
 3cKffAKB4Yo8oDatXqW/WoQ00bR9iDb5ms+rU2bXP8WjcYq5y2u8vrw+bMM8L/ZuzYmrOzIgmO0
 +mvyxeWTLzka7zKtqqCtpQUs7kT8hJHPP/MEXSqM3WPFQz0WeLm45y/8qDGNiDy+7ahzeaOkzbr
 cwHccInIQJYdhYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c189b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=w6fcmXAubz_WdynIYoEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: c3oImktGy9xJJDWa4Dl0zUGABA0IOa7t
X-Proofpoint-ORIG-GUID: c3oImktGy9xJJDWa4Dl0zUGABA0IOa7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX2ShvpnQMv79U
 dAtP8Qbd2Um2qdmSFPocztHNh3F+/hpbRwfC7zLfCKTc7/JK23htdC7vLASfqRmBreISf4nI9Qn
 NGIGR+o5mWBeFNm2pnvtT86zArAaHFguX7sUZHKWNAkD/DNOaKM0FiIz7hDVEEuO3q9naSgiJCl
 QRy78886MtuDOZiAAHSGfvRX3ec7kZTSXVNX5xlFdbtZJl/mGSu5acghJnkgVNOaXrHpctBkEYl
 nDpa0XUAeH2wUfq16s/6fl+fkW5nQI9iX9Dm1Glnv/1WqG0umrxweZtGOpHedsjxoq9vZaTYxxu
 0pBJwO1wegwVB0ws9leTvetN4H6cjBhF0QJRieImT3v9dAIwQ4gzvU41AkmT13AvT2EWIiRJLYE
 tkcI+lVXtpDIBuflhejoXhW5Qqj6D2vEA4e8eKtKVqasu76fpNTmut9mgfeLmVE8Wne0U1CAKh3
 Hf78m0u+oKTDYDorPkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_010637_036786_5981507F 
X-CRM114-Status: GOOD (  16.18  )
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

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-bcm2835.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 0d7e2654a534e92a529f27fdc049812359678522..4f7e4a178b33fdd172657cc625a34018b18f88ca 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -474,8 +474,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
 		 of_node_full_name(pdev->dev.of_node));
 	adap->algo = &bcm2835_i2c_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->quirks = of_device_get_match_data(&pdev->dev);
 
 	/*

-- 
2.47.3


