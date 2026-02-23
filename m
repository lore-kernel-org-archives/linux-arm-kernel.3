Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123D9E98DF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 07:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EievHyEEfc+ZB9sgh0Kt3vK9ZMOHKaJHuHGtcF08CgI=; b=4CSeX/vd4PFZuNMGPxNP+cUGjY
	+0/KEMDtTrnrkexDatCfAUrJt7bqOPvbaSTYk92sRBx062n0PhjkdfqMkQx7cIJEvBM7WtTHGvMm2
	SnbEATcBzzQ/nGNHwh4QQeXrfk6mFUbQtCro97w7bTcGraHXaKRAEoHgG59TDEPGxBD77YNXmiVxV
	kYXm+t1Y/K0u66nuOhr6kDYEkVjKNIzsGUvJm/WKJf1O6WbrJrwDxl9fLAXbwjNAF+BeHabKdv1DW
	FD4ava/l69GPSz8bTyaG7Gdz7wkCab5o3tHZQ3bLSQt7l++eF87pL/mkWM7h1VNMs93uFOYOGGnZZ
	y94uuYuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMS-0000000HMxr-3BBe;
	Mon, 23 Feb 2026 07:28:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQMM-0000000HMnU-0pTS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 07:28:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLDqm32077802
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EievHyEEfc+ZB9sgh0Kt3vK9ZMOHKaJHuHGtcF08CgI=; b=OR0kQOaV8mPN3yp4
	O4ooXQ7AMGaHD/vk0t/uniHvc39ZF0bY6yiA6wRIgVnd2zwJmllKwH3nmURftTsR
	uRwNUWNzXJfjcBuSn89FBRiGhezEOAu8mK/OqUxVcj2jUvYHEK8Pe1WR8DZgAVgU
	v8fkhvAiCSOAsv07CTnGUpakv65K27hZ7OnJOGXCEYopS/QA3HFpnFTX3AK2dheg
	lEMRXRjPu3Q7GNK0ijrV9Nx6jFhWIWseomXEojpOGB/a6tiuk8J6YLbmzSw6wfLU
	gkL6XIel1ooBiXNQVu0rStqwPjcUZuBaEceEUqO1/gGjxd/hJlhc84MkaknPP7+K
	CiTQyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3ur7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 07:28:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso569382585a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 23:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831681; x=1772436481; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EievHyEEfc+ZB9sgh0Kt3vK9ZMOHKaJHuHGtcF08CgI=;
        b=ErgCc0/ZHkg7toPwRrtCa6bNuh86hwzCLzuwXQ2da4bnUYpQSN2Npt6wDV6Ch7y1Ti
         1yxwpBZh4j8A2d5jbo9tqoxpPkal0I2HmoNUe+zGbpXs7e3BTa/ZK2B4smX60NkyBk5x
         DtDb84ISYAGnV93f4PNzBXiTfBVqzl23MyisKeBq9gTLCzr2stb6hXoezKd39sVb8izw
         I2fbrC+NnSNHlU1I/VVaGPDEHz2iwZ7uFfMSGEVR8ovEouPbROerWj9n1sFIEfzlY+Bc
         o/1PwBs5Fkd/klZ0aCT64DFY3a3f8dodFom1bwzNbvur2/ucW5exLUFpjvGKKA5l0caD
         48rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831681; x=1772436481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EievHyEEfc+ZB9sgh0Kt3vK9ZMOHKaJHuHGtcF08CgI=;
        b=KCIRZRwc3G4SC44XNenIRXzvDFDbRd+6BzASWFVMTLPxlgEI+uCaDIubT8EXU5QoQb
         BiGS4DDH5wrkiJr+1rU3ABTR/kqyZxXM+XyKULBAuaB9VDfU/QNXj3EuyWFMQIqQ9Y1p
         vWyjRYIE+U0PtlMzp98tYsdM6U/dc10G6JOIYtX7W16h8wHZlaXJmEN5eqqPU5GvMs73
         pvoJoZbwhRAng8uwqh1F9g6kkv/qFD5fBJWjeOIx6LVBPF2+GHwAXyj+kwRiFbfcFZRa
         ZMotLa4deQg/lA1k/vqu0F4ffqYJfE5EAh6OrDSK75LvRKwILmkEhzynNIdNkmMoFLUp
         8H8A==
X-Forwarded-Encrypted: i=1; AJvYcCVcmjB5FbKuiZMG1DWHfs77XToPGr39+J7yeUzj9gw1PsaMbkCVG4SEERO/SO5Kx8sGhdSB2tbz6LfPod44LCia@lists.infradead.org
X-Gm-Message-State: AOJu0YyWI8BYnDH7IaEZGgnuGwVdkmJBzJbeqfiKjOgVwzDB79/heWSM
	qDJxO5SFvQa/lww8h4DTEfA92dR7uKoJvHPxH+9G5giuDbQXcYfxGMiw8aKbuKTxQh5vics0Ukw
	n3iScdZVIWJf0c/ghw7znyd/6kmUGM2DZo3kX8wKo2QeIEiEw6OEfI9kUHEmL+7ytY95YrVngqo
	5dAA==
X-Gm-Gg: AZuq6aKVckyB4dW1LSBYKdjAptdGScClQjUIWbeN4RDqlnsY4ZQlZ5nXN6ZkkBFfFz1
	KnlO4C60XyvVcb1d4gexsDDHN8a/uD/vO6R4n3evUWX5/FLL7HIuqz8mJKYmsbBdQwEWAvFCGP7
	E11jXB/Q3jApaeMLo7DHHGqUCXzAwkCNmixTPZqxs8JdQrWTj76iajdpzu8MXPnPrrQhXR5qUSk
	fDD8rqJrh8ZlKsUlwtNuR54n8y/oatrJgS3jI1I5hX5YAKeMbVr+a3GGmPsneq1rFt5kNg6zHfQ
	Wzrb82I2ZqC7Rn8StQl08hAubqHUdsqhszw5hvlqZX7eFbXokPHfqTevNHYQDe6pBTcdVyE5WAC
	qIEZdxQvQHvpbEysc6fIUp2Bg7QyHn/+SZxjxanx1OAchtg==
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr953130085a.52.1771831680580;
        Sun, 22 Feb 2026 23:28:00 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr953126785a.52.1771831680071;
        Sun, 22 Feb 2026 23:28:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:36 +0100
Subject: [PATCH 8/9] mfd: ezx-pcap: Avoid rescheduling after destroying
 workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-8-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NdggOG5IZsY7LXa79Nq7AL/G3ae8FCgqBbMs7M+Uv2w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFtqPjY1qKyahTuUblrNnMhZfW/1VNWITp6i
 +IhXm5LfTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBbQAKCRDBN2bmhouD
 15FIEACAA9XT78ap89BEm6isO1fI6/YX3bggCblWINXzvuzlJGfwB3B0VnAFlTD6+y1zI1shA7J
 Eiiyd/S8i/yKNwjPmqMBhZrjNVdSEs8HdfTN0rvmHhgNqSi8Yyoq1gFJ3HtKmnFyA0qHpsvUpq3
 +VQQwHfPysAby0QYLjXKUwyRzOo41GW/vhM/sItWsdQRCPnEzG+O6ogAT4WiWGcX+Wmwk62STPC
 ief7WiwnKfWJXzieUqsRZVGqZd7mXQsNUrfcIBv0DINdyn0j8odj6D6xo4jgf49thmMDr5CAefC
 yG5p8y1WdKdh+hD1ddFb65TmYSFU9HO2AIzdLNTly7bNQ/GcQlQ97HomBZKTClUGuzTJhLmuv/2
 mwB/7U4KZr9+/VWT+spMEVHe2wGqrOzEKaxbaEIvN8DqgrgFvl1x1qp5/O6Z8UODnFLukCFY707
 gdcJRcK1CKnClIWcJ6w72wS1ItFXBTVBgstbzQ33MCr3IzqNDgTDQRi8lyJXourEeL8wOjXajGb
 qd6HYIqo1vKR5qtCH9fYdNXPAwCavd26qPmcpDaOH3omR1dHCo60MJi+A0c51ZTYkHNd02g77Zd
 835Pl1A8pEm9U/0tyUb/tGHKgz/oaVXIm7/AZuCOdlDJdniUZ8/PBzIMWpPeXMeLh7flqzKBr0S
 3fbO7I7VZezSo0A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c0181 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Iaj16dx_8Jk8doGcJVoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: s2Qoyd8UbKqdlQLkhakiA9PkHGtjRVkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX3Ooh+YXMH8zP
 iO4lzhRDY+vpWpxlpV8Rh5EPzuExaZGENiyPaoeeguH6NyUyE4izTyX26xIdfu5AYFpJsbLkNKs
 XMiyjqNU5bj8ridXZQT7cOXr+FJMUXqlBC66bml08ilfqdlmepS9zeITKICAbBNeZlsRmOSSbv3
 Eth/NwUzuTcMUgO2qiPC8LWrEcgXZK4tXGLMXxQtRHftuUttZzcZGCGcniIivQEhX7wMfFgTZsq
 0jJiRdJ0KvBHbhQkGIOA7pVXLcfRGRzb4sJUXupYFveduGfIo3Md/pUvpyfLJL+mEFbKodgvyvh
 BzNyB5zS0FKkbcWFieYwEDpNvKtDV7o1nqerH8Oc47x6KESo9Xq6k94Y9DTLsI672hmw7Qb1ptn
 Z7uCq/ZsORfAxPQQ2qA323/+A8/Oz6up1WTtbp3g1E4pIKFauzxLupkLidIk6K8jcPGxshONmwU
 lLGWmCqYlW8C6qX1EmQ==
X-Proofpoint-GUID: s2Qoyd8UbKqdlQLkhakiA9PkHGtjRVkY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_232802_375940_09EAC75C 
X-CRM114-Status: GOOD (  17.84  )
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

Driver allocates workqueue and then registers additional interrupt
handler with devm interface.  This means that device removal will not
use a reversed order, but first destroy workqueue and then, via devm
release handlers, free the interrupt.

The interrupt handler registered with devm does not directly
use/schedule work items on the workqueue and the remove() function
correctly removes other IRQs handlers, however the code mixing devm and
non-devm interfaces is difficult to analyze and read.

Make the code flow much more obvious by using devm interface for
allocating the workqueue, so it will be freed with the rest of devm
resources.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on devm_create_singlethread_workqueue() from earlier patches.
---
 drivers/mfd/ezx-pcap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index b929559d84ae..a06fc3447104 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -375,8 +375,6 @@ static void ezx_pcap_remove(struct spi_device *spi)
 	/* cleanup irqchip */
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-
-	destroy_workqueue(pcap->workqueue);
 }
 
 static int ezx_pcap_probe(struct spi_device *spi)
@@ -411,7 +409,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
-	pcap->workqueue = create_singlethread_workqueue("pcapd");
+	pcap->workqueue = devm_create_singlethread_workqueue(&spi->dev, "pcapd");
 	if (!pcap->workqueue)
 		return -ENOMEM;
 
@@ -463,9 +461,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 free_irqchip:
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-/* destroy_workqueue: */
-	destroy_workqueue(pcap->workqueue);
-ret:
+
 	return ret;
 }
 

-- 
2.51.0


