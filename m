Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44867C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yyISHBDW6HtabJ1pV9A/MMaSyWcRa8ODURQFtJ8g18=; b=vnnSj5NwzSY0n7pmouHT1WKd+J
	x32mJ1/xyys7DQ69ltxInMF0iqmITxFgnZCg5j/Uy0e3JrD7ji6LqzTPM630SMRVnsp+b6LuJV85N
	7eRx5Q3BBxTNsdVZDab6sQ0HVowSnp+dT8QJxO716Z8oGzg8Fi7l/UpiiL1tCfozmLAdHEGo/KQot
	ERbFSR5JQQXb0Ti7AL+tScDdsrdzEjhuJSaD7zFiGkVPFLFkdg0Eu385UGQv4IZIblRtP+9gYgzVa
	s+vssSTCVBrNSnmId4ExJ5Wmfj3P2rBi8RhNr0fKNVREaPfG7FvLlkFLd80wNouTh6Ib7N7npIPhy
	NOrogPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkFu-00000006Iit-1NS2;
	Mon, 20 Jul 2026 09:25:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkFn-00000006Ifx-1I5Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:25:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YEp12043804
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7yyISHBDW6HtabJ1pV9A/MMaSyWcRa8ODURQFtJ8g18=; b=Q+znHmvoeBFyZJiz
	uYyIo/u7JSU0yCc9yH/0dG9iBQoOzXGKf66qCX2LGTIH8vdhy6poPAKixz8wCUAV
	KTDo6Z/e0bN22d29hD6Ab5TbhyJYi5NSEcD7bDAXdKeg9Xnal8iSk2Ya6g8f/epE
	jPxQkaPvzUqHBJP7vM/totBYHOKQbJVgV6CI5Oo7y35sP3etT0a3C78UR+VUw8ZP
	XkUpepdM3SVL86oMT7rcUZ9K5pBGNh2uIHqe+KjQ0UiVsZPCkcQv2OTj5kNSvgOE
	gL/r4U8CuOzJa1KacsHYz6LQoZYRoab5n1oX2yg9p7uj2/RMt9fkip3uLlLNXMdj
	9MTabg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcggtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:25:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a87ef9713so47536451cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539538; x=1785144338; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yyISHBDW6HtabJ1pV9A/MMaSyWcRa8ODURQFtJ8g18=;
        b=SNHZx2ll0tBCfv0ExDJaT+F0IWeRFNDmq3KlhqdsI5/srqBSSb//LJk4J7HK7vu+cW
         VbEAQL1/V/ZO/ie94dX2w74nF9jtkgoyJ++KdpuuSixJShNu6JqZhGSpOepmHm9nldKt
         ucc9PXftRon5irproi1bi2hpixF70QvYepVxGKt9fSKWcbm4LfXOKxSYweHwfo7eWF3y
         UCuHTx2ThYORE5q8gwdF+PXG0JpgPjoOuQZHlP5ZN9+pfA9xt0lHhOA90WY7WL2OAD0u
         KZ+sBd2lEzJU3VHDOE41k5mubxxCEBpTOCBCjY4v2ZrstGfbZfrAcE1LVQH9ANwUmt84
         mvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539538; x=1785144338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yyISHBDW6HtabJ1pV9A/MMaSyWcRa8ODURQFtJ8g18=;
        b=EyRzL/BpLedID4oV89bQZkMOgzsLMcf6AvkAlLM3zhFtBOEGaQMBWOkbWjMdLSyENL
         AL7t7BUzoCqki/xttqislzifw418Gonvai6wkCegxO9rbpi5iyXtulsoK+HchL8l16CB
         2WYVF1QXl/rsSHk90skoCZZz1/SdL2uM7hvqnGfm2qWPkcSJYJ630EcgDsO6Yu64Ia5W
         ORgQhb0YoSv2ngVeptq7Z37lqvzndbGG4xB0nvCwcmMrpzLW6CKJq3C8BqygnpbmkHDG
         qS5gb1WPb0jdAAuygzfbIMeyKLQT5uiA05kiCM+Rg7DsNBZ/JbU0Tg1vBlxLXQBl6OZP
         D2DQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdLbiaCK/RXemz2nraJjYU0m63WuncMFp58rznkjdDMGEsQs3YFszKLjIGn16/1hGkzOg8V4LSCorHeaJ7gwe3@lists.infradead.org
X-Gm-Message-State: AOJu0YwtjbJ0sdLA7qftgBTaDDaz8mn2zzoPhT6vwp7WXcX4YcVmjyW+
	1+w00A5ZVGQKHXgwt2f7ZKgZmojZ9+nyn1uLMiaScivuQxv3ldh6PgLQOb6KQTweGO2SZFXL33/
	W1wBqSR7qZ9XYi1yW3VDfh9L/95YYqJI7L4oWOU2xDMmff1hIJIdnrt9se0k+ZRcCcTfchoHKFu
	ZG0A==
X-Gm-Gg: AfdE7cn4tml8xHIufi1Mf9PEutx5iqrsQ0JgF+l54DHzcMZz01e5ZiNRQZvcWHow2FO
	JRZ8359kaGPzwVvC+p8yXszSVVpQd+vi1zxrqR3NYk20fPqjZT7ZfJr5cWj63Rxql5UG8t0BzJx
	LaxR1HpGbJYZGxh+bz9nt1vjEO6uhprM+zpRuiVAL4+fP9vn5rnFgdWS6WYxxan79AVwU5Ua81g
	BF48d67JGROtrARX/1E7urk/IG4aFor4Pb/IGJ0LydJHc/QuJ+Xn4Zs5NLobxb7MijggcLwma4z
	FxFkcl1c0zd6Yg2QertntiPX1Z/QyuLZzMBiEgLJAz0aH3U92AJ37OhcoTmw/nOhQkvkvEnP6Uv
	bhvDpZ+hh2Mi/nMju1cVFAOpSDLwo3A==
X-Received: by 2002:a05:622a:190c:b0:516:5019:d27f with SMTP id d75a77b69052e-51fbf8bb3b7mr165219701cf.18.1784539537842;
        Mon, 20 Jul 2026 02:25:37 -0700 (PDT)
X-Received: by 2002:a05:622a:190c:b0:516:5019:d27f with SMTP id d75a77b69052e-51fbf8bb3b7mr165219341cf.18.1784539537361;
        Mon, 20 Jul 2026 02:25:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:51 +0200
Subject: [PATCH 4/8] net: bcmgenet: use platform_device_set_fwnode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-4-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=e/KidaL4wAeLOYzpEup79QBE4YB3GUvthnfa0Ew8sdk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXel7DPUjBAYpcf7niyv0je5wGjcw6b2KYr8sT
 XuTSwpcWaWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pewAKCRAFnS7L/zaE
 w0tjD/43qo3abkR30JWubh7GVIOZEwMy6gwIxxGEFh+64tlAWfcLqoTyNpfDWe9lZeBbZ1iltc4
 zfcV7M5oRVFE0KyZ1Yiwjib/cZWQi7vhxVQ0bePCjlyvllspMWyUfr2/SK5xFC+j0/xnhBPSZlR
 9+viBjtr7I4qZYIhZm0nDKPPboq2KqPcCQVdb2n0a1lqMrj56FTzTZy8qRlBH6opmKTsBPUpdah
 YLEWRScnyMfdm23dhcA1j3g0+OXu36onH8sy1uxZ8HS56kcQKURCK6m18b9e2VwiDIk5akIlAKH
 V/USnZ6vRpNl9XMir6bi1QFnNSAVYa3aSWMKPaJxEBtdaRbfDNNHlw5qYfeLonJF9XAEw0JQC/b
 iMMQCIj4eH4u1UrMdLCmzYF72Xw2Scjcnet4fqyBDvs2XgopXv3XXF9gVioCPtg47IwWemXcXjE
 23HIm9UdkNPKhC0YIr+CQwopylJDyKj9XiX62XW3GlesyySsJMBx9wxHwjPr0TesTOZp9LJGAMX
 kWuqevBo1tEoLu92X/0LJpXlKqOFqSsW/M3tCXsvF0fRgu8DvU2Kyyl8AoD1vJsyeN8EGBj3uiN
 KP5T0cPG/maBIKrbh5yP8+K9raSK9x3Zyxd32E+i9tJZK1Bm3Dj8ahaq+83dmJNnSW5e/7yRqQs
 rTNxmSOpcUPV51Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: DhvjqPwPt_Fzr-YjLwLJFQEA5JGPZ6pY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX4yJXqJB1mIw2
 CG9W4KJoQ2EgjiW44FLbJTT5ycyrIcAKTMDYwpVw9SAoYN4c1kJp4XcxSHP84ZWA9BK9qEdV4TD
 Ntk4TLOBBY1YMbvKUpam5TmrsQY7K91EP9a5/D9jv1UMBM0HusIndmsC1d2SLYLkJJWEo6hDe0u
 c60240jcaFiXJqbqIHJitz6fBhzU5b88MNdESNw1yNhH/8n9zuC4b1cjSycWhLt/HvSHH6MvIJs
 31uNVI0/7QfAwuiDiNOW2D5sSLF9ZheWLzV3ZrIWIOd5k6Sipb6LGVkRgAVLH8RRJs9adHLLzbp
 +l1hRTNEFG+Ajd9Z/1CsYWC1vQTMSK+1YRLkp6AiDCHxRo9e74uQ2tcJZB7A7dvtVQLt0aa3bd8
 ec3dksxJ6wSHUds75OpOi/zYALrKEgY/WEu3O9XBewitIEuQzPp8K7gkO+Ug/pkl4lo6m/b17X+
 hpqU7wk5zlCAtVa18YQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXyl+O7DHLvf6D
 I8ucpX0lJyCHyrdvq514a2xl5FW89pPPn1PykKNmymSGD0hAqtdw9H5OHyMd5eh+6vttjm9H4hE
 R4iV6bnUYud3YyvJkI8AevYriClwvpk=
X-Proofpoint-GUID: DhvjqPwPt_Fzr-YjLwLJFQEA5JGPZ6pY
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5de992 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=cykPYtnZiOmdoJCT1yAA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022539_358691_715D3346 
X-CRM114-Status: GOOD (  14.15  )
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

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/broadcom/genet/bcmmii.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index 0f0dbabfaabbce3469de79af91d7731b8476709f..6f471723bd53f454e4b0de1716977b4382013429 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -492,7 +492,8 @@ static int bcmgenet_mii_register(struct bcmgenet_priv *priv)
 	ppdev->dev.parent = &pdev->dev;
 
 	if (dn)
-		platform_device_set_of_node(ppdev, bcmgenet_mii_of_find_mdio(priv));
+		platform_device_set_fwnode(ppdev,
+					   of_fwnode_handle(bcmgenet_mii_of_find_mdio(priv)));
 	else
 		ppd.phy_mask = ~0;
 

-- 
2.47.3


