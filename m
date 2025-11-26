Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A57DD1118B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=; b=DEH7UW7ytRsDQoQcf2ZeP7b09J
	SMoA/21Mr+zcLpy/RRzsxDXdvLcTPjywOYKQxdashqtfQGPQZNPgQtoehvaiV4wsoYCO9DnvxrlN0
	IMxY+gPLWyzfhQ6nUzxHf+aH+RRWffsSnqpGERAusAwebpPVi9UVbNa+/mTYf86dtaKUtf463/zyQ
	il5JlPTXwma9S0YwCv1BvUfbTp0XxrmFVhpiG38z2IGj8RzY5yk1VQnqJXcnfKFGeV4qc41JKYe5Q
	8tM4deeNYEA1iw28LEhegqoSB8tviAK0zvC0/UA810OmEoBUXWW8MlJlpyxd+x3hb6FFytmtac4YN
	3SjpQ+TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVI-0000000FQqh-1uuK;
	Wed, 26 Nov 2025 17:40:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJVG-0000000FQqU-3so5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 17:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=; b=J/ZIxXktNIATTQAMhKdn/ZVxAG
	U++m0AZKOQEvXAkukrz8hXQf0M4Yvdfs3P/PTztpdXqW0M9XpVc0UjaMzEA+tOyZhrsYn9CRQHuD2
	jof+V24JXUTQS4Won3HcZBCYA/szxo16ZNqlVXseEmTz9IByFKo1BujvdDhP976vNYB8mUpyriJrK
	sdtBUF2B1tfX+n5KTq+EhqEs+nGB8jGLF4O9MX9TJ0RZ7WYNUz6CpLNt3iUVf2OG8SkSdRZAz8GYm
	wEut62ILy8ZolOxJB6t8F0jBuYPRr2qd6WiMlGEg0tl+n9nYmmHDCH23UkE9gDPFueoEaiYatSf79
	PLErL1TQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOIdd-00000008Wm6-0o8h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:45:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAsm9O1700334
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=; b=ayZHyRX6tMYKRV2L
	MG7IZwBvoGRwaxWvEabJ5AGpU46K+fHm5YslQIWa5RbaxFe6QUZvAj64cOOw3Nbd
	5OMasmfDeWc1rr6ASY9I7C++uiFMuw+iACWPuWKSOW3YmPM5H0fRis5Xt/9ia2BL
	BNOnYxs11roBt5SvwjXfT7VACs8Vv46mYV8XFW45Axq3OW7QwvpSCzflm8+fnWDs
	IgfJoobJb/gQhLbaPXPxWNxXyAfV9GbfuM8tPj/Z4L9z3UDISGT8v8DafOfjIDTe
	8dlj4BqvC5XCYEn6HFjcf6xUVoE0Z/FJffPZvkanSzxH+Q+VT4RHBfgKfYfo1kv+
	RCwkLQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap07a13tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:40:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b244ef3ed4so446385a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764178824; x=1764783624; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=;
        b=fCOzdgfO0j2+nfUXstxlHkFnaZPEVDetlPbx2VnXVPwCC1rVEYaQyH4Q49FdnrjhhM
         e0eEtyID+opLhkMFLV3+urNzLzpxC4MoakUYE0og1tyQxFy7FmQsmfBnCjQ9JoQFPlUg
         fRCwfEBYtZ04zQPPE5J0D/yfJF3owYyedK3mQFtQBR1xFXJkfKHBF4IBrLUOGVjL08Uc
         2LVHBDvP7TgOph4rgZ0O21ffMwBfZnBTLFToJf/mNyeRqSa5i5NyxQUcE8dj7v+V6Wnt
         acz6A8LL5IR7lLipCYRC5kLK7XBOLYaZOaQViaHLXFkEiXomZdqkqWMOA6meEPoY8kqv
         Kv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764178824; x=1764783624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X1sBMN4aYdnkQShY49zVQ/9mVbxGlJEjkTF4Hi7fNtc=;
        b=iQsjIEjcX7FH8dAfFi7IybEo2T2iLPWZKh8jR9sV1fGS6Xp2X32G7pjL6SYCgsyFBe
         ooAvyWXZjRM3u4BGvX13vxgkfOT1HeVniaD2HfgPXcxqkhXu8l5geC/c3aIBFP+CvKQC
         A3oh+pm1roW02XhhCZMD/G4k12ead/m1wqG8HI9w9hJ6rcMJzjkJIKsa0rrRzFgvcrEF
         3aw2rjhqZV4G/UtU0KXmYRw3qob1NMKKS3BlVt0LtWwxRPPt4WDu4suxLeRCFbqbDsq9
         8LG0odj05vSw1CSvR9cf37l4Kdl46Hfpr/vOJj0TCz3OmQuDkSftt8isaSPA1Osf3X/B
         WxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBKwVcsIf7HmCF8BzUs2Ev88Ab1R/VZGO35VFnQYIpgt8p1UtttJYvTM3k9gvWw/M70jr63BNxvseqOCRo9eVf@lists.infradead.org
X-Gm-Message-State: AOJu0YxkpwyvySZgyccfs7RwX6AW8iDbRnjFT2Ex21qrv2TS968HQb38
	8YaIzQyxRQwgkeKe8TIc8ofR2tJ/K3x3Lcog6tcTIxiqjvapDs/0RmTJps/XRaHHgG9scLR8ObH
	HfRNEK3fT1QwhTWmJcr+jEbte4Zn53XBLbQUPPoQNd3sTLKf5+t95dbu2mcgoD2lEUDTZ7C+vuG
	33aQ==
X-Gm-Gg: ASbGncsTON75VfPJJOwtDATKIAilgcrXnBzIykEHb5BKfqdjr9imtEAWWLObaI6i1FR
	cFwXoI2UAut3TmWIVSrZT1h3o8TWCGf1wSpZ1vJ7sfYuhbsOCsWBKWgocfBkHNm5szWHbcXg3b/
	Eg0Nb1tahtWYb5RLtjkRqrebUWKGNmQ3m7usS7UJCojt34c9V7ssXd2H1MQVDDJjJIDjMmLRdGc
	ah1E7QQiMIYZpfGtZBpBfD9PIkVeMH2umdnD2X3IRpukAKZOcTvvLEcaCh9UoSQEbefvXm/bG/T
	aEPkT/5Qpkc9bTUW5wGeyzxdsa2j66qUZ7yVNl8kokkMe8k7J1RCSju04n07i3IrahnMvNGdRTE
	Z9yTv7aXypSJC+nquWbFP7KEszfEjEWokCw==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b33d210524mr2592966385a.38.1764178824484;
        Wed, 26 Nov 2025 09:40:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7nhci4TP1tVjsETA0tlWunV2qp6pDTsMykO36IvhVB1WF8317r9qgovKqAlWtXjv5oMmPIQ==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e7db:253d with SMTP id af79cd13be357-8b33d210524mr2592961085a.38.1764178824000;
        Wed, 26 Nov 2025 09:40:24 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8e54sm43226430f8f.40.2025.11.26.09.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:40:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 18:40:07 +0100
Subject: [PATCH v2 3/8] regulator: bd71828: Constify pointers to
 'regulator_desc' wrap struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-container-of-const-regulator-v2-3-7ad3408d6f29@oss.qualcomm.com>
References: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
In-Reply-To: <20251126-container-of-const-regulator-v2-0-7ad3408d6f29@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Samuel Kayode <samkay014@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DUpWNqruSQhmXQP3XRdoDV1aijYo/dZHk2b5HlvKVaY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpJzt8B2DOoorWpIacFqRiKYdaRVgdvJIOyX1+J
 Z/akURM0yqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSc7fAAKCRDBN2bmhouD
 160KD/4lnr6Qkpo/E3Y0Sgwj2Ollr93XBJuEN1ps3HH9wxcoQQnblBcZSKsFGRx7C1S9/eJ8A2i
 13m0RTmbbs0eFI9KMsaVQsvkvXwSoLCj1Gq9nHlrGqFeJN2FA/h134L+cKM+3iuzBG8G7PKoYwz
 3kfvYhIufwkCNbAR/yVzOW/K1rXiodaoCP9x81wb/5r4ifZWh0AQWTaB+5HCN7aYmEEpMOUqP6n
 PWd6U7hyaXNkiAFalQl+2GZzTVXjM8WZoIBRfMyvPNX4DK/ccf4BMmAL6GtBvxLFHkykmvE9YWV
 WmOPiddYFrVS8bqOZjHJ77yaNKPjgF7EGjqDUBfh5O78iGvB6gTiwddpvIYvFtxxBDdS6E5iB9D
 muz2wyodr8EfwWYArDy/U65P6DqOuaKjiuwKiiv9gfkKzvxHQO7sCmw/v7v97C1TLMzQ/0xSFef
 68rPX3sHmknklQ7lGJW2obGQK3IQSBZ+GCBNcX2iC+3UOlJXrUxQqEuKd9vGAC/qbTeBwXH4ecm
 3Bz+FxIqthvmhCBN71jhDdFKspfOHCYhZqiH5FIKPWn7XrsRaRNA3np8IpAHFaDDtP8n3d6NwLs
 XQJhF5LotKfRzuMhFVTWaFUMh4t2iGJuGo60n8Q8hVc2ilpTp8/OzvLEd1hEDbu+ho2PUy6mYYq
 6QhNbv9iLln2yOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ZZEQ98VA c=1 sm=1 tr=0 ts=69273b89 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9MRJ1adic_HRPEocbcUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EXF25JdjBoZRHaSpI7KDkn1-j1DaCCmP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfXy3wUhfIx77gb
 yu3Mqwnq2CEiHVO1l1UBfdVKPGL1CnG7pokHFsBMKk2QRt7yA5t4bc1ARpDcUYde8umk5LT5LDS
 NffnVQ/7XZmyH8LvKz10AP6PhNnh3GlvBMpVk8q9G8KWcybCnqVEpwfErRBvjcpEpiucJZykOf3
 v+PebWogwEDvPsupLyVDyd/wSoH0h0bPt0Z+R4JxVSqYlpa+ZpJc82JEU15i8twnJqiXyaqiy+f
 rE3t2MrMHCcXpeny7LnV5SPcDzzk2ydaPuT5fhaXSp4fdKAEalacX0e7H2AEQh72aJW4PFBkCXS
 EFHJOFx3sp0pjSjT65wKKldCI2L6/QnmDrDGjpza2aQAOWTM7oXPRWnkZYu223w32/vVS5Yztwg
 I4XM4s/mswOFd3xBbR0T9fqnKRjNag==
X-Proofpoint-GUID: EXF25JdjBoZRHaSpI7KDkn1-j1DaCCmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_164505_675127_A3DC6339 
X-CRM114-Status: GOOD (  17.05  )
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

Pointer to 'struct regulator_desc' is a pointer to const and the
wrapping structure (container) is not being modified, thus entire syntax
can be replaced to preferred and safer container_of_const().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/regulator/bd71828-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index dd871ffe979c..87de87793fa1 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -95,9 +95,9 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
 				  const struct regulator_desc *desc,
 				  struct regulator_config *cfg)
 {
-	struct bd71828_regulator_data *data;
+	const struct bd71828_regulator_data *data;
 
-	data = container_of(desc, struct bd71828_regulator_data, desc);
+	data = container_of_const(desc, struct bd71828_regulator_data, desc);
 
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }

-- 
2.48.1


