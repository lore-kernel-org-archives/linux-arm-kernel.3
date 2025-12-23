Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB9AE6F079
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifSEl9Ir2RHMg9IgGUu7yq06oWZeXaWDeQV3FGoUTww=; b=iLpdwo8RHVIl0ylsMFapp3pKXv
	l7g7t23qSJKzT1pfSnqtUTNjDKP9Nckn1uNpqCd2NAtckBfwLL0rN73OvldGmBcC+mzeSd+sYfBMP
	poYo9jzI4Z/2p7PP1oX5WysGYv30GCNRfodx4GtZWLc808tV4PSek99w9talw7wIFFawf6EWhflJz
	mgRF0QIcr3v8lpH7C85hIGljCa0I3wC8ASuuKfOMV65/6ixxN6dmV0Zk6eVBi91ksg0OSm47KJ9ZY
	ZZ1NX/tj0zlzxfvdsVHji/5b+kYSV0VZDkHHixt2PcQbEsHWW/+D5fnPS4sLz3ZHksCq7+6Y69GDX
	0SbFFoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGd-0000000Eq9N-0B1X;
	Tue, 23 Dec 2025 10:05:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzGR-0000000Epz1-0alr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:05:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8WmRX2778107
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ifSEl9Ir2RHMg9IgGUu7yq06oWZeXaWDeQV3FGoUTww=; b=l8Tfbjr+W7psjUUU
	7h9yFHu7TmiM0takP87iaaE4CwcQ0s/SSGiTZhIhaaprOvWzM20VYMwRdXYiGF4+
	xBuP/Fn5TtlOpvbhyoLsLgWPnTRINvQ/uJRhXouFgr0EYaOp42WaceQ2q6r3iBtw
	fV15a+xCoFwQzKYwGZKC0hdGBEs8lp8ArmeJozlhIJDpjAHT5jbX3OW9FCgtKck4
	cF15vzcv8Mu9KdQuUzp/hiePRG7yGi1LoJvlsv6/s42UEQTCofB/yejb/1O1XLK5
	gRHW0L7K/+t61bX3KMGaq7CWYxNng00dx9uinSHuISWMjAEwSAHL3rcosBLWt0IG
	HpJN1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy37fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:05:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so169775461cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484310; x=1767089110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifSEl9Ir2RHMg9IgGUu7yq06oWZeXaWDeQV3FGoUTww=;
        b=jXxBYyzB1aqd7OjaCTwV5O0ix3BzQCuLaLUPpBgl8qMlaZ4IleeDxl7g4te1+ko4lI
         cxVr8P1O/g61dSN0DgEM0k1lFo6IW7OEZfS8YhuYBXHazPipE4zRTeZfYJZfNWi7xYoQ
         660dh3xC4QjjKrH90xXV30dcatot29/sd/38LceenTFhRdQbF4YIkqOoJFFYWvdzBMFU
         dPeUm2W2s59gT+DrOaycBYBqOJs8jYzmR/VQFVHNa5Zx15qWUw3GgNsDKMVKPAeQER3n
         ygUib+GgYKjvI35IsldNVHCLlyRoN9fhZ6RyXx54VfWAT6Qs1AbTPHJycpwLFLxsWinr
         FWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484310; x=1767089110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ifSEl9Ir2RHMg9IgGUu7yq06oWZeXaWDeQV3FGoUTww=;
        b=qgmOSndyt1p4d4RwMSxNR6GhL0wfboFwhQkERDOR4IXbV0JU/R1h8akT+aaCKdW0hU
         +uMP8/Ep4WBH7uRnObxZrwzbx/RxzSMBO2P7Dtx29YuDSbbJDRdW+mgXTF98AVd/5cNh
         npg/SwYeGBx4GF4qVokOJJ04g2MHyTh8Zb0T7vEEgDKqo4rE67V81cNx4G7/ExsNwtwZ
         qJ9DL3w9vPqRoQiWpoTOy/q/aVVdtLfFp6WhGVWLMzYfSsJImL0h+dCH5MkA5pMPIgLH
         n/IcQYjT1O5eGxsWvc5uVkGXwtvQTsKGfLUktnXKAwxainnZFFJOg7w0XzSfcngPiUrO
         W/Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXxej/OtMyqvK81otL9mEpzF76wJtjelfuVHtUQaPU+O2dMvBIqHw6T8cUCh4iSuRCNk1p/DoDFGS+U8zZQPXBy@lists.infradead.org
X-Gm-Message-State: AOJu0YyPcuYVQcgcdhvilwEFwQiymv9qRxaiDdBTXx73NA3GvjBd3sBJ
	I/0i+0oHwp282t98EBpqd/7ie5BAd70ki5tH4OJ/dddpaApQQHDJLpK6jPvyMvCn2MWUFdU6CF2
	mLLF2ik86T6ioV9vUl3Bcfg4O0ANdWplvU+OrdaoRLp3SZc+O+Xx/ghmSKnkHn6bd4qXdaNnTpm
	7F6w==
X-Gm-Gg: AY/fxX63k0PrHps4lDXZ7K8I8rf54YDMiXl/UNzdESA5L3sMIZg/wRVDO1d54bt/NcB
	aM0nd4HPBxeIAcJUDJugR0sop26c8yH7x03ZBM9bYGJL7rs6M/a65RzclgItM8QM9b6w2bIafpK
	IrnlEi961L519ZW8i3Bd8CMmMqfunDSuN901vxOsqsfCtGDVyvLe6MovZcKcKrM0aol4C/kKfZy
	PxUAl6i4f9wjprcRJ4QJCBHuRkQhevauhtlLaiEOCDE4Ip2TmurpHA1iutukjO1EdNbWe2K3uO7
	qkXhvbXUNvuv8E/iI6pfYmxVONZ2+bo34hhZSrMvYwfJFxBytG3qtgTnlb+4iqhgBT+mHYm5Iw2
	tXSezqzctOF9PkJvtaw1Mq+5YYoDoUsyWQnWnUNU=
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id d75a77b69052e-4f4abcef65bmr213879491cf.27.1766484309800;
        Tue, 23 Dec 2025 02:05:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUDMHH9B67S701dxFG87AKQUqiqvJUUAv/hUAmqhTfe5BbC71sFiGcdmPZCv/zu5rHbZ2Mhg==
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id d75a77b69052e-4f4abcef65bmr213879131cf.27.1766484309345;
        Tue, 23 Dec 2025 02:05:09 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:44 +0100
Subject: [PATCH 06/12] i2c: rcar: set device parent and of_node through the
 adapter struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/F0evc1zIjFfr2ewDDdTKZJybhly+0fCX6IEry5KDtc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlB3xveTvcVkYCQoJDpJL6WY2ws5IAOmbPUh
 KbMW9O6TNKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQQAKCRAFnS7L/zaE
 wxPKEAC7gN9dvo8EvWFoZuSf9r+OwOYHj8Kqi1P8Azur1g7NL+9EQQMBH2uh3jlmWx2zTGD0e4+
 lOxS4r2oHWPcRpWFry9Dk1v9YaK1P0vjXrqc5n5BjKCcYc9rKygPkteQqw3MygXHbRtNJefh1Qo
 2CLIi44w4onmzo0+7L37c2WjI7b2RwJaQWttAXetrYL/GEGAMrqugaTjEKu6snoZaYTLWG7VzFo
 HCx/rLWe5YrKJw8P7A7ug7P9z4WyIdYQaHcY8Lkxg9ZIDEJxzjoE98PTUIiQ7NqZz3e/ZUvQMVr
 4V/uCWv6hbzONzIUGJqNFePRcCrTseT/EOEQk+SRrnnihURotNCi8LSG1Kk7uvjZgqJFnwX71U5
 PharzUnoKUpBdkFT2z6f0ys8dMt+zEtmaS/DHqszxXKgVdnG+BSI2zvd6Es+/sskGGwOcgRVce3
 J/WVYPTzHgVhn0+rE1bSonNBS4YfmkZBNimrCB6oknQtEsMYP8xrNUM5CFgTeve/xDmhrXRJnSt
 mtek6CoVmzHtbrrfNc4XobOkIFUVBD7JDbFmPMkNBbMed93IN8gYEdPCSkcUJelQ/lepFlUJj3h
 SVv3gkGlra1bRI+/lIOzIN6LC/w6uwgC/PLMSW5fAxODqlytmoS6hYZYXxa+9Iibn2niXh8GhO/
 B4QbR0eAn2bIKPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX/MQezvmuis0N
 dAq3Kjy1dqrlhtWtB7n2K7EGp6kVmfMeTS37FXfeL7Kn7KSfhfQIwzZJoG5j4YUjfKS86frZnuz
 pneBXkxKZmJIxKhKT6h+iAa4QD1FYRujfBDvu1uCyfITbSoeSVSCgiNEen43W9oudz60yVhfSYz
 W1I+34X4OfoBkvFA/tPPQcsQOGxzIkds7XNfGqrg9qOw1dG+gyP9HXW9yo5YtLisim6ob7UvtZb
 Nu1RfWfk9lLqTFypRXOk4G0uhTYswTzDOsev5TUQYDo2GPsSmjRtU/LVdRdkl4EWiiLGwV6h5z+
 C9/Za/39MQMMCXCD9UH08mUp5Q0kj/E1kSva/Id6xfaEr2WAaXl/SbyY3V/4ZtzqiKSAS6JZ7i4
 ADsIOeJdm4iLQE6si0UweIypCH3M1gCiyWuz8yXQSRM95w2wbqbbfkEhTq3uSdv/esAB4jgUpSq
 Juq9HYK3R82N3r67F6g==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a6956 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=E7P0tHU5vGGU1I44B8QA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dTskVkIvR0_MPwQUakvh-rMUhSuIBpWX
X-Proofpoint-GUID: dTskVkIvR0_MPwQUakvh-rMUhSuIBpWX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_020511_196843_4D5F72D7 
X-CRM114-Status: GOOD (  15.73  )
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
 drivers/i2c/busses/i2c-rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5ce8f8e4856fb2bb21c9cd731ddbbd8f3622ca26..86826502533bf866ca81cb86ddd10b2a2be3c798 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	adap->algo = &rcar_i2c_algo;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->retries = 3;
-	adap->dev.parent = dev;
-	adap->dev.of_node = dev->of_node;
+	adap->parent = dev;
+	adap->of_node = dev->of_node;
 	adap->bus_recovery_info = &rcar_i2c_bri;
 	adap->quirks = &rcar_i2c_quirks;
 	i2c_set_adapdata(adap, priv);

-- 
2.47.3


