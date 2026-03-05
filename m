Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33ACF513E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4xjjhrcSsGg/B56PKtYV9FcQh+keTvXc9MMcImQ6Q8=; b=jb0yv6+V01gaH1a0KJ1CLQVM5q
	ZfvPVniG2K5HEN6pdxwACP61+L+d3Int5CvnBkIrg6nY/nrECyXPf5kmUMQqZdydAaWLMO+U2zcSh
	y27k2+cBHbqOyGj/Gj3YMFGCYuP5P4myp1V1jaabQPCnc1lep918QCTNX0s5SJw4ZYIo2HkgtxKpa
	Ghm5mlTg/2JXC5x+gPf/LpKSowSTgJXyCUYcOA035se7G2zkJsBMHpa5ppsCECgisJhWE7dsNnuH3
	n40QseJqWtL/R3Cc0H1EY3XN/sdhWFNgnZCBEowyYCdIHS71Qv08UwEhWJfp41LFGtFE5mBcxbHKv
	6aSd48MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWn-00000002bTm-414I;
	Thu, 05 Mar 2026 21:46:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWi-00000002bJv-2rIT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmZt73725945
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n4xjjhrcSsGg/B56PKtYV9FcQh+keTvXc9MMcImQ6Q8=; b=nr4T+3ebr1GJrOG6
	oJS1QoImgPAnuAAGCrayURKG6BxlosUfnXUwq/PWK6ywxT/K4BzCHSJlmRScuKc1
	YDLEDC5EdgKDgnHIwOhbJ/ypifKbXb2fXrY1kSU4BqI/Xivne2zrKiU09upW9WEk
	hj8gxxcO8lu5OhvwP+/vBktvBJOdsqEsZ2M6GXGhPExJUogJ4BQCPR12z3cHFnqQ
	g+J7fjOh6uDcM3BbxgUZzqyeD5r8JJhyfVR6c5VcNNIFaFuyIrGZF1RpPoBQNJaC
	fxQ/UGt1g+KdbfOt/8gi4RDZ0HrqA1I61U2/o3j42lldLnNas1910ChS8YzrA/K0
	OcGQZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq85dj4j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4b8e9112so754413285a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747195; x=1773351995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4xjjhrcSsGg/B56PKtYV9FcQh+keTvXc9MMcImQ6Q8=;
        b=LcRt8ehLCOH8ltgEp4joVbtvx6l6qEX9F4Zf5c8BIobLahg9kwx2tzxa4l39m961D5
         7cZfrTomHqBtI1gCMmI8PdyeePX9dIc2/dYoiVj29NATd1vp5WJUOV2vhayX5tPdoM08
         YP+5whP8Xs8SscJgKxx3wsY+f1uquUoa32E1iQpE1cT48bP0eTXB1fOy5PlphE3ivAcz
         /qXKKDa+NfnG6M00W3X47rK8wgWxBvFzA3v+SrFwB50iNTLmNh4ZRSau0r4n2EncPP7K
         dCsKG8z5wI++VD03vVSNcZOzSMBqt7AkrE8dlANmClh3cUAXyACmhwNVZN04TVKOpWGw
         BUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747195; x=1773351995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n4xjjhrcSsGg/B56PKtYV9FcQh+keTvXc9MMcImQ6Q8=;
        b=qPPKN5G0Vii/p8FUhBwA8vditBbakqzJX1ueibhi79f53ML4uWhfMGQEOZDuRyIkNx
         6SWNmz5S9jMHvW750+yGZejU/9UpNQnzxfu/s06cd52Qz/e48kcxPEkGCTQ0CU3OgN57
         JZmiq7BgHlgkE44vUYQokwuDnmGHtU5OGi5oCHTTiNJOg3A92SlMAymRxEd2vXkfPfdf
         L57deCspbSdKyYKmdR0K1sftnl3IJHt09lAkDKZGaaV157SdsoCxxQcKC94xhZ2Xi1IU
         RtCSoyQ0MqBNEhQZL7H8dp0X8YjT6DHK1l8vaYo5efcLK4xZXhUOxWesllhImb5PmQoj
         ab8A==
X-Forwarded-Encrypted: i=1; AJvYcCVHzl1UrX6+AG3IKEJNZJ1X8LZ8QCCJHF+rqKmBmCKehD9G29m5Z0VP+YZJOsqWeM6KywhoXsPihcweq2t2Iqmr@lists.infradead.org
X-Gm-Message-State: AOJu0YyXrAwjBQJbmZcf5bR2GT1CQpJX6YkqY82U3ts3vxOtyRL8UOxp
	5tUtxs7K4mNxP2kH/JUIsl3idXLH/mqTTo7EHXNlm/OPknTNctaTYPJNj+AQZCXi2jqwDHxqVUP
	abxG5aLtfBcISjBEc9cNeW1BAH1NbMXMDNouM5QHH3Ei8FfQCPkopZKoJqAZesW0EXkqPSEyoLa
	bEpg==
X-Gm-Gg: ATEYQzwBxygcXdZhoMbRieLkRoneoVv0JkSgukI2riEEdwwPb5KSPrH9AnXGJDsU9Zg
	e5cezPC8F661xeZi0nm+3GPxfDs37MLLwQHVg+t4cPQLJDmlzh+YUjVRtEEZTorkE1/PTfHuEKL
	bWNGQnbrtE+DEagOjgufhwwFBvAUZNvdGaTnuRGx6Gwogabtl27BIjK5/1kFMWI+O5EvQH+S775
	ifaBbxsOSjSHii9HKNdEMME4zUReGmL/oleQ1RZxbKhkmDOmqlkHr5rq8ic2QDa+5R8toEViHV1
	gxxRHwUgSy7jQh+B5D7Y9OdZ5IjwFX1Q4PnMqzmGQaJLQCqJ40mSCopA3o0y1qBWLUjNyOHy1Cb
	OSFdmZYGnWjChFpjSQLlEsH3vIsjNzJrygVEBqEsec+JZ
X-Received: by 2002:a05:620a:2806:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cd6d31f36emr6486685a.6.1772747194101;
        Thu, 05 Mar 2026 13:46:34 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cd6d31f36emr6484285a.6.1772747193616;
        Thu, 05 Mar 2026 13:46:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:47 +0100
Subject: [PATCH v2 08/10] mfd: ezx-pcap: Return directly instead of empty
 gotos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-8-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aBbZ3fBywOvpHZwjLuwnPh4cf1hQWBZWB8iOkYD1Dl0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmfZyTBQ2+zfg1PVbm//IV3ttzRuDFXfJ09L
 Fi7SOtMm4iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5nwAKCRDBN2bmhouD
 13yRD/9atq9XS2gdzOD4iwNE2NzTH/fSxgzEasdtz+9zZKfFoTpfnxFWtJTbN7SumZgig525A5R
 VdZmzIWGbcYZpE3xAn4xsvjLbNB8/GeTpJ1kt8T1rcPPpX94dr5Ht/K5pRdjnVycWFPiKJXtfcA
 iRY5/XOeIZEhXpU7ClLZTrejxnGjsURe8r+u+LlmWrGlfT4VYT4yepmb5E8OIVDUXnlKFEepRKQ
 WYPZ09Oyl21MABeuojbxhRPxzoA/jzjdLe+iCBVzlFihUMfiFrrWvfX872J1GXClSLlGaYFGLeA
 VYOoHJFuO57Q7+4oULKXpzkUTIexLmRp3dGkkprPpzpR0q6+gCsLVeSHJfIl54kgDeKlSJVa4tP
 3tx68crLjDIkHq147LN+7Nlv1yacTQ1Drn3PPXGsOwNHTmOkKt6eoO1tJSU8dItyVB3VdAVUtW5
 YLK5tSgOKhSGndBJaJennrnsayMckl9rhJer7AXlC+sKZ31Ii2uZY9DFB4tGUXtmtDRpX+Nnw1u
 mTECOe4Qt/1YAn962XvbBJjzoZWliJdxuREn2dZiFlamnSKzxS8Tk9zX12OJI6nHFFiZNZESZ3L
 13YIinDTo1FuLh5Fosug3FzrBQlUb6CCIR4714nwcgAQpBhwwMlKDWA4q46CeQ1kxUm2ocxmk0m
 CC5zMWv80d+IrUw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: BrAXydt6mRuBSBkWsJl-kh1vtCZNDE3d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfXwj5YeceUffsz
 mEJY7JJaupo1C75bGEc3WGnbhV7YbaC7bOxBGxO1SNnR41uoB0rPqddAftyfBHjLqqR+3sGGUdl
 Qm6k5rjT5a03RqvMDKVwcgPRNsSQchKA1Hd4uJlh/YX/hXB31HPVGhr/HHB3bHlH3vx+XYG1MyZ
 ounvNJW1QXqF6I6pfj1BnnPbJr/w9zCST5QkeVR1fnq/FbF8/r4gDfm5ZJNjhZ72gUMIevsc+0Q
 HHjTtgvoTESG6NMZVvNnTOE9ItJ1NZcbEc+ghJv3sA174U1R7ppZg97CFkKLOK5DYmfnYcEH/LL
 kQ35zVlaN6wZd4iE40ox3HyCvfdj+og12py0YCZ4Z2+LAZRcx/huf/nLfQk0wrzbBNpTvmMOs9W
 WDLjysuc9lIsRyA0hdhMqFnkvyZ2XD0yV8T+1qDag5p3Q+hJ1nkQbBXiNwG8/YX0zh5PCLSgXZj
 getKimOilcxPt/bBovQ==
X-Authority-Analysis: v=2.4 cv=aOb9aL9m c=1 sm=1 tr=0 ts=69a9f9bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VGyNsPSQNFFz0_f43M8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BrAXydt6mRuBSBkWsJl-kh1vtCZNDE3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134636_877505_DAC49F60 
X-CRM114-Status: GOOD (  17.59  )
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

Code is easier to read if empty error paths simply return, instead of
jumping to empty label doing only "return ret".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mfd/ezx-pcap.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index cd0520a08224..8e51c113a320 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -384,17 +384,15 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	struct pcap_platform_data *pdata = dev_get_platdata(&spi->dev);
 	struct pcap_chip *pcap;
 	int i, adc_irq;
-	int ret = -ENODEV;
+	int ret;
 
 	/* platform data is required */
 	if (!pdata)
-		goto ret;
+		return -ENODEV;
 
 	pcap = devm_kzalloc(&spi->dev, sizeof(*pcap), GFP_KERNEL);
-	if (!pcap) {
-		ret = -ENOMEM;
-		goto ret;
-	}
+	if (!pcap)
+		return -ENOMEM;
 
 	spin_lock_init(&pcap->io_lock);
 	spin_lock_init(&pcap->adc_lock);
@@ -407,17 +405,15 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	spi->mode = SPI_MODE_0 | (pdata->config & PCAP_CS_AH ? SPI_CS_HIGH : 0);
 	ret = spi_setup(spi);
 	if (ret)
-		goto ret;
+		return ret;
 
 	pcap->spi = spi;
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
 	pcap->workqueue = create_singlethread_workqueue("pcapd");
-	if (!pcap->workqueue) {
-		ret = -ENOMEM;
-		goto ret;
-	}
+	if (!pcap->workqueue)
+		return -ENOMEM;
 
 	/* redirect interrupts to AP, except adcdone2 */
 	if (!(pdata->config & PCAP_SECOND_PORT))

-- 
2.51.0


