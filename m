Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175AAC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYSi2uh0Xa4ChBv5axZgn08de+UEeDLKohCgue7QxG0=; b=N57IIIhNa/Y/by+tGnOrn3yX8/
	0T8aYyCd27/SoTvYlAcoLSZWmqq08ST5kWnEa4TfTRF2DO2x5/eC9fiR0BokXNX8QfBA+6Gs4ty6+
	K62pbuD9+ba6+ChJkx/UyCVuu7pMp5qo5hDHo/Kao1menVeKce5JjPwFaJxX6UGSc0HWTwEZyK/aW
	rlBcXVINHQTTZ9r60ja085pukumpNXK3huxUS4dX+8vPpa7kN/CBPslYiFMd4MKYYCmR7KkzyGbPt
	9/0u1l+/cbkuSo2v9rROrP09krsVyr8ghMLAwWdvIUWxO3IMudHHpYPKXXy6zJSxgT2G0YjE6BJ2b
	kXlJDNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904F-00000005Nqd-1Nw0;
	Tue, 22 Sep 2026 12:57:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904C-00000005Npa-2W0X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:57:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPZrK3487107
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYSi2uh0Xa4ChBv5axZgn08de+UEeDLKohCgue7QxG0=; b=Zt+TEc8PIENLZEa8
	3h3zGokW40mLifhoR3tcxXoiKI8FE5knm9YNuh4KCt7sZlA1xP3m9A1ZyKe7cEwN
	N9YASAKINGVGipmffmX7en6McR1eFTDfUYg7yW295ulgfYXD3/d9o9rS4Yrgoepy
	8DIyMeOkWRYfDX3g3sNYYsQH7fYdMl4d1uEq9VCciTF1nD5hIBRzu/rzJHW74XNM
	kk/hOQw4R9CWAdPpy763wk9/hsIhro+E5VaUmlc7IzudMdS7nFFNxS4aXcZLgRUf
	v44QvgGFV7o7fLaAG+NqdCJ0Zb7DK7Hf7hJFQndYjxamJrqIceQBuZyOhKdeqi/p
	tXN4eA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gudw0jydw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:57:48 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7a3b3c06bso1107632e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081867; x=1790686667; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WYSi2uh0Xa4ChBv5axZgn08de+UEeDLKohCgue7QxG0=;
        b=fWjybW4whPrJC+dfHVfljRE3FAV2Mm1Ni9hc8lvwSq+n7LMvynBEk+N6B4+I3vVWuc
         SJh4ubadFaMQkrWXbOPfwIdZ8kc8T3nqo/ryYYipgMZbN/62HWbM5CG1HEf9CqZLMp7I
         g1SxvRuOiBcEEN9aHy6miEHK7j/Wa7ecfPHa+1Fq/31v8d25xymRRa1c62bjBHpD78JE
         11sW5ZvvW7kRNl7PTqhtbhTUNIKgkJb4+chYflqrbIg+sjAkGOgLPR75dJ9PBIL7fx6X
         hr4ZE+bY8Vcuizo3lJfGrdrtqzjSTJ4W89SlxwojijVK3UWaGY1p74MrDy4YDia+F3iz
         p/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081867; x=1790686667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYSi2uh0Xa4ChBv5axZgn08de+UEeDLKohCgue7QxG0=;
        b=EOVHhbdT87P6Q23kSRLVWoauWj/SPYWLG8zZkHYQEb5Zli1a91Y6t89oDuMX8WeITJ
         x4QiB2lzt5uXzYCUEMLkJvLEckPyJtMn/j1CyBPck6Zu0fyDjUvi9ufSApVOOPQY+83f
         MhMev4+q3kCYHAyGNO3N8PBoNEjv4rhgeCBB/dKrsa5h8S27I8buF3y5ZuCNpQkvTyQj
         QtMP3AeSqP+himi7pq/9HQBtT+sLFG/tvQzr26OwRYhR8bIpT2oTAHv4dynm/0gd4T5l
         s0gf6qXVYxfuDiS61qW3l94jUpK8D2E433DCo+qXa+CylDH3G9RPV4Q1TrRiBn7nP8pc
         L+VQ==
X-Forwarded-Encrypted: i=1; AKwUvBymOcNnnOheav37TPEdCXlGWzlb0WT/7p/Z+hbXyCy2fnGH+RRWFowG2DXWvxXHg+TS/uGVZzApvuH0YJxiGUPX@lists.infradead.org
X-Gm-Message-State: AFuF++mocUt7rcVQP5ZFbjVGwn1+2SlhSccPtD0YWDuQk3deifN4+Amh
	1K0KADeapvIj9cyLbEEEypuLQTtZmaPd1iWqXo06XK4RKr+jlwRKq30CY58N05lMouOOyakVRwy
	kEVMScZErdd03gkboy+9joBMHMfl67FHeUMl7dGLJgx8ll0CJSYM+v2PEKNuSnGT8Y/ZYyPQlYK
	2FXA==
X-Gm-Gg: AYBFou016sW1UgOiT71XJJvnEags/3+yJG2m7SCfHgGVIucnR8s9t/RtNAIn6yjcVda
	n3TbFzYAxIhlZZ0StU+hJySj1zRa+z5gifkLXKUKvOFQFG6dK78eRf2lIhzUqh9zapqBLYu8Axs
	2wxeYfzteI2Cbg7nZGDHY6JjVV9XTbIly1x4YRgNl6ry8HLvpXGnVpDmY1kDxYIBfCadOLkmYvZ
	vJKFuczemaxqlSaM8IRmsTGVB001vaRqU4vKYKfTWBtBFek5nyG5BEgHwRxAoP/IrAs2RcIE0rc
	X4/nciNuMpNXssFDk5aW5/zFfwQGFSWg0zL0hlbbpxK+h9kMqAWMhIxnjisEpvVKKTr9/wF/Zi3
	A6nY78qnN9cz6q3656MM58Rgq87E=
X-Received: by 2002:a05:6122:3d0c:b0:5c9:a617:5812 with SMTP id 71dfb90a1353d-5c9b8b73530mr8218900e0c.15.1790081867048;
        Tue, 22 Sep 2026 05:57:47 -0700 (PDT)
X-Received: by 2002:a05:6122:3d0c:b0:5c9:a617:5812 with SMTP id 71dfb90a1353d-5c9b8b73530mr8218859e0c.15.1790081866586;
        Tue, 22 Sep 2026 05:57:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:57:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:17 +0200
Subject: [PATCH v9 02/14] crypto: qce - Reject empty messages for AES-XTS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-2-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=M8H+MPXamFMq0WJoXACKxu5xswBagOiIf4IGpV1851w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsns2NF05OVLf3x0BlKxlMYYjKLgFGd0Q0jxPu
 SojZU1UJS+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarJ7NgAKCRAFnS7L/zaE
 w1jMD/kBe09jKjOM6rqKowD6dBQaMaFHmu91AvkXmalQ5/R0rESCSg1XSr2F3w/dm709XwkhGdk
 MfQwKzf8qKH1pxBWwRj4Q8cmvUZa9r0NZa8DsB8g8nFfrEFYuF8gI3t8GqchqdxN5NwRWi4or6D
 5qkxc0bTGuCup1aEEHQ/0oHzQs3c/xhrUS09T/rE2NRbLxkZGyDZ7tPW5RrOahc1eOsoRBplSlO
 gNxgZz8R42P/78aH0d7BcIg2wbRwgSZu/cVAEnTXN3nMFYp9jwvHULyLMLzWeLmlYBqf0mpihrb
 eszbGS3zEURhE7J6BBqkV3+hGjgIqzu3Z+wvJDgP7jze5CDn12rMUGdivU3m+Cx/Ow27hTQ8i0r
 FonZekhc+R74RLuLmZUT+fqERQH+fnPdLGKAKfet/oxEBiz4d/ijpzBG9wzdWqSblAop5Rafrl1
 r7nEgLK57yfQ74IxKO3+aUP+UE0hyVwmr42mcbIfvUccuA7IavKbL9sec/4tBMAgbSuLG4gxlpt
 dnCgdxAlmQgpEV8dOrvaGfZAWmJfnjn4nviw9gaqTubFasXSNaVzxHSaI8tm/ZR06uuXFHq3PnO
 0lDJKE3q6MIa6BwU9u/XL3UpB68/2ZWMYjobJHBnZ9u1yp0vKjzJqF4ZOOR9ZkOyE8nZM05UzNt
 W5vmL3weQJJB49w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: nACv9GCvELBTNoghQWbnEgRT1abBi1Qx
X-Proofpoint-GUID: nACv9GCvELBTNoghQWbnEgRT1abBi1Qx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfXwZXBM2tQNshC
 4N9IcL++WU/EdXuAWILxk6TxQ4xjG/NA7O5vVobyFDi1ROxk2F3C2lBb2jQsNYG1vSXahPprJox
 44wNSYIjKP8giRHMcKyoNEvxZ/vICFvAkIh7ouM55bAMlkn6KKGCSzOlaDVXRWOxsKLN9KicHKv
 a7ZRgZ9BodQwWwhzmwKKEUS7lqdLYdsn9CyQOgQEO/gaqsbFcjFUCHPvVB65TH4PnZovwBdbRl6
 poH/yt+4PDnEa+wR0DI2qIr+Y3cWN3JskdySHXTjUKXsvGc027sueI8YzBDWuAZCWsAtpzHy1oz
 W/vt/ua9IVJbLXk9vz41Ei2IpvXT6aYaWRHbmeBkrcd7Utz5/IOD/VMvJa+6R3TU+5z08xPpp+r
 BTgQ91m7xoE182qEcBp3tvc1TYaJU91m2XrG+GkRPooM1HT2wZMhKylwK9MqnIQ+OfGSZedj4u2
 9yzYCAeFsbpl5ttCRkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NyBTYWx0ZWRfX3xQNpeGju21f
 bgXbH8QMVbDavXZmrnLtpAWC5FWfdsCY7O88FkOku3aa5qzv+Z5DdB5KZoP4AN/m7e7yT4KwEwS
 XNiLD50eVXzbFuGRvdmqtriyUU14ulE=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ab27b4c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kiYxeA6Iecqc4QeK3QQA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055748_653899_91DC6F9C 
X-CRM114-Status: GOOD (  17.48  )
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

XTS is not defined for an empty plaintext: it requires at least one full
block of data. The driver treated a zero-length request as a successful
no-op, so the crypto self-tests "unexpectedly succeeded" when -EINVAL
was expected.

Return -EINVAL for empty XTS requests while keeping the no-op behavior
for the other ciphers, which the crypto engine simply cannot process due
to its DMA not supporting zero-length transfers.

Cc: stable@vger.kernel.org
Fixes: f08789462255 ("crypto: qce - Return error for zero length messages")
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/skcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/skcipher.c b/drivers/crypto/qce/skcipher.c
index 03a3cec2bb90e8d8c17e491ca40ec740a003d1b4..f177062eb735148561f798d0d3e65265f3235da8 100644
--- a/drivers/crypto/qce/skcipher.c
+++ b/drivers/crypto/qce/skcipher.c
@@ -222,8 +222,12 @@ static int qce_skcipher_crypt(struct skcipher_request *req, int encrypt)
 	keylen = IS_XTS(rctx->flags) ? ctx->enc_keylen >> 1 : ctx->enc_keylen;
 
 	/* CE does not handle 0 length messages */
-	if (!req->cryptlen)
+	if (!req->cryptlen) {
+		/* XTS requires at least one full block of data */
+		if (IS_XTS(rctx->flags))
+			return -EINVAL;
 		return 0;
+	}
 
 	/*
 	 * ECB and CBC algorithms require message lengths to be

-- 
2.47.3


