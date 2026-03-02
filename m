Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D267EA4E29
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=IPbYR3EJwpenrADlCzyOUwagEp
	g9qK/yM+q9LyloC8WTGVqp/YQbU1YqVm936/0hc3l4GIFqszgLkkX3Vr6ICuy7ckD7U55kJagdn4o
	cMrdVSQ/h4niSGeaXxHqRgMsd13b8M/CxOPTl9Yua6zBQbi0lJVAThYzEDlfoNIFrwcvbiKqcG0Qp
	uj7pz0QFbkuCe6uQluneCVaStFhxvA/mLe6JzJMApjzSE0Ucc37FBxEzYI4R+axWSPLqq1G1n/JC1
	yosjka1Xz2a1+Hi+36OJR6ezwgDJ0PbO1zWoPoH2c1v8B+iC3Jp/+Olr1Tv33CmYLkpktmH4eKlFu
	au1nkXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eb-0000000DQ1t-0ZsH;
	Mon, 02 Mar 2026 15:57:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eZ-0000000DQ09-3ced
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=NWeCvbTJJyUwBp6epmnQP5vAqf
	Iu7sTRSByappRXrZioty77gaBYqNKKDH/34SZyWf330y3jEHzVNfJuwF1a1b6SuwT/ziTnDoA9DcP
	RHAy66wGMlOb4hvsA3r0VAAFgsY+F6+e4Ph6Q+OKqQZsD9n+xlZu4QZDUQA6u4BuKfoMT1w3OaTgI
	2Fv84OnlFSKLfdfDwhrhank6xxsmRwNXqUIBh+yNtzILaJzQd4JmuTNZtYZ66V4618+iPnjn2EV5a
	HxwnAr7S3GL8v8Nkaz+arfAXPW7Z7REHBjy4y7YltwFMbQixDwR8r7/H3jxV4A2KqmjZ3w/X/GIC7
	4k1iuIDA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eW-00000000VAp-40XC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:57:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622EO5o52732643
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=jAarcipwtmxwc09a
	HrPau+DA9YlTx41/Z+j1BH6lVFcepgZR10u6NW3BakceYuc6gQxPYuTPbeD43jmz
	3KkVB9o+aS5Dfw5ulD8f5idazwkcbWFQ+bptal6szPs2SPbdL9M0uuSloY94eZ8z
	tQOkkrXZsZOpmVRhojfQlRgDifleneM+5qvda22LIk3LvLVAzEK8h2b71jo342m8
	dhRIpQmFPSl/Pau0bTYri0OsqPLjpLzjc2Tqt9gPoKjVVPJ1NF/4KbbwGZMzldcG
	gMa4rlEtMGrEMeU7wtUxmM/VPuKXRztMQHPhJbKHv8TumIpWTCMhgptbBc+Gm44F
	UT9aTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbav2gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ef98116so3962122885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467067; x=1773071867; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=jZ5Z5n2R2yLesKWjHi4kRRwCsLugYmGqftxYYhTHMskKpfaP8wloos+L2V3v+YuxFu
         iv20VAe6yiKKeFILkfm08UNslpZQbC+WxOLfIzWIT9lg5c+tah4+WJl5LVoD+kbAHwz3
         PKupJvcrJjFBGfQ+jp8EOEaVQsVfX2ka5CjNfDNT7lgcXoUHdxD87E5Tp8ugw9SM/T52
         Xyom9qbLzl2BC0VdhvjX518j5wK3/RCM534tFuyC78ScNMtmQ5/Iu3tzdeUBXtDwNXd/
         zSuqpCYfq1kbCbhd/RhfnKRBytSkGke5lhgriTnYwQsInkkfV7bbrdtgqKHpLJ/W5ajT
         mY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467067; x=1773071867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=raUL2pwU7o5wNJwk3O4sK5Jjzgj3KigKcAHUAMOBzZmVG4un6ZhwgfkCuUZ89+Q9hc
         OGXgSFslgOvVhQ83dKp+tI+JhzzwB08OYf7OrD+KlIXnCS4tdEyWQBvdXSnhxN61VqV8
         s2l/VOIwPmpIgGA22u7cf5198aT0lI8D0B/a0G+3xnGe6XolFYqSaOdpofCaS5IsOaYx
         QtHXEduZ5zmChfSpMlw9ZENcwzT8WzLQSI/gfQA1bqOP1g2rBfODH96F7dgZDhWWOnT0
         9vfN86RfX4dJPCmoMzGG2M3Zx+bWveZMnZe8xHhy/ojUgIeyHs92TtkviTiSDKEdyu92
         jv4w==
X-Forwarded-Encrypted: i=1; AJvYcCXugj3TK33pCBQnrZgsExxyq2iZ5QOeTP+seAgyqnU4RutYfYHvbEFV5U7G9ZoIIXG0XtF0K2nLKwRK8KbNgoae@lists.infradead.org
X-Gm-Message-State: AOJu0YwkaRoK8tlXUgyMLyblFRrXYm1OV3mr4UqVXb3BQlGdl8OTFuq8
	Yl2aRgu484UilbRzIrX8cdCYNHEuCYJaBbcuYiuCfC+wIW1TlFEQjGGERhtL5Wq9Iog8DnNBw91
	2+p/wiKuDc4LnUrpIpX1F5s0jJnaKo+9eQqzxaHino+HHS+qRmU7qfqD+Xg+Wkmii9LNdp50DMU
	th2w==
X-Gm-Gg: ATEYQzybBVSJCl9N0HcAxoIxldmIJjAyQGkSR6fnmR8MC+y/yI1ZyNPZfmbUUJboZJS
	MvldnjxSwmOGzrs3E9w/24yaMhGnteGiqCbgV/l5USigOZkqxEL3jwXJiZKkP9BmP4qcMG6JrlL
	FEY8qBwlxKYuTb7fV+ukt+/BAeK/plquSX39MnoHWr8IWm5JTpG1MkyufpsH+p48xn3sX/3L72F
	6sDUsnHPe2AQUIkb0QYwVvOspx3dtGDuy9V24/9f8jBI9yg4RSe12jJ+e+FUgEAAAypnSZN7GYO
	fE9FJkwqe35tpHtcz9qrqX1uCVh1AlxoQIBrI7BnsMYwlteuQGparP3UIFQ+5pPZfZhnZOSJaOn
	X8BSAM8kbaNSxyHDIdplTRgMls8Yrb7Y6qipLDEkrlD7ErHr+TNqW
X-Received: by 2002:a05:620a:1a28:b0:8ca:123e:8196 with SMTP id af79cd13be357-8cbc8de8546mr1626711785a.53.1772467066904;
        Mon, 02 Mar 2026 07:57:46 -0800 (PST)
X-Received: by 2002:a05:620a:1a28:b0:8ca:123e:8196 with SMTP id af79cd13be357-8cbc8de8546mr1626708485a.53.1772467066472;
        Mon, 02 Mar 2026 07:57:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:18 +0100
Subject: [PATCH RFC v11 05/12] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-5-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNoDslcDGElaIAuZqmx28V75+Ght512gj9uO
 9BTyLYxQoGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzaAAKCRAFnS7L/zaE
 w7KfD/9BNxHL3nf9PbluMpylf2ev68g/KfEFzZeeTiPet/o+UvV5i0+4a0Qfj/vCdJTSNJREmRP
 REp30vj4p6T6SLQzbZwAUS0SVyjTlWlcHvqv/R1lANqL8DUysFR+1f9+wJskMhwpUoFRuZHCtEi
 iftJpRpd667KdkazXCISt13fJ/32FARqxK1iTWUQcs4OJah6ReHGal34HphX+Oj0AZZIvI/jKRx
 WD5rk0pfsfSxUnNPxzwTZWQL+UmiJg0ipnOFGsh2pO8mSkiR3CEcHqPUbOqACMRrQvT39J0jlYG
 rnXGeAHnCyRY33edRQN6k7nY5C/zdN6IlAavw5egTuYHZ97LOqPT1D2l9tlhiBC+fF26f4A6pOl
 +p8WUhe9ZNKYMQ9GTOUEzP2Lu7pXC/sXi9n/YtKeXDauC1gzAjBHm2W7WhgaKzNfXDprJS6cWGq
 IRrNpy1l6nJ8GB3DrNzQCVSrxjnEE9dgpNWiO4NVzdW3lDDVBG5W7FRoA9brtGvu1xNrU/Pq+Tk
 uXvURGBIyMEmRKMw4awIsY77OWlpiWqY50TUTlxK8E+lOlK6Vp119wKAokr6yaQSJhWhthuC+Uw
 FYXFrDXaoPkLTvhcZFf27Wp+8oA8zsEY48Ejpi2ihflYE4QJZwQ7HVNxGubyakYL6oVmVXMM1tb
 v/CY6qcEoGSwXoQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfXylf5cqPq2VrB
 a5BSW2czaZ8Q3QKUdojt4khH2vCyuuu6uY6AwV90PyvT2GcipkkglCaiLb2zDF7lWyJmbZeeG9A
 Ul7tIysFX8iy65oaCxv0ozWsVVhJWjLdHT+tGnw+mHZ5DFF2YhW8zLYMqKVD68Zey4nvIJhb/Qt
 LPaMURkToIdk4+UP0nPsobnGjzguRP3RJmSZd/+aw5JHA/qrkU2wSy0ZlePcc8CRHUZKTgWMan0
 48n6zoxE5/KO1IFob1dOsPpF2bZqEhMeMXdYsKig68J62hTHKeM9mRZVpj62bD+pmSlQrQ2M32Z
 3ZJXpODlGdf55MDdcF3JHMgFTbtQDqAU/uJGYnMA1zG0xxSM8uas2Fenwiv+Lis7q9KfybC5ObP
 oxben5zx7PXe4UWc5tyHpeiIEbU0xNZsfcQY0+grXrR1XqsrBzLOZl3X5RxqWykCXjV8QTuSEQF
 EMoIDu3gVWsHhRSYtOA==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5b37b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 18Pxjyx5bWN4I3JKRRev4bVgPl5rhnd0
X-Proofpoint-GUID: 18Pxjyx5bWN4I3JKRRev4bVgPl5rhnd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_155749_326445_A4300B53 
X-CRM114-Status: GOOD (  20.50  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 25 +++++++++++++++++++++++--
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8b7bcd0c420c45caf8b29e5455e0f384fd5c5616..2667fcd67fee826a44080da8f88a3e2abbb9b2cf 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,10 +185,19 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -198,7 +207,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -244,7 +253,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3


