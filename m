Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DE0FD8763
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88mM0UwfW559Ea9keKdGQ5zcGppNDqvuOWAU7Ac1YoM=; b=SlOklCZCaxmJzZXe67CQ3v6/Ca
	APQgFZSlfB13EArt/OaYf8o96irtMkPdqxyLvyuJHLQJlezKu6ELMBYRVxYSweLv+v2RMEzGY+p+s
	AuRerOeLKU8phu7OIdxBIMo0r/nQQina2v4d4v1oZGBPOQX5J+JetASnHJH9qmaiZ1Gkr7vjoeBHP
	2khRxVua3NAZjnHZ3RCRr783nFb03naVCTSmNs9bnR56qDPdAuUMFytA33aKludwMuegoG3vPAAnf
	sjE7DQWIu3X9Ug/EBIuTP7yGJR9XKKxkU0nDKZqPPhM6GMG7c7ZqiDKwQujUtWPu7kAsofvuQOVBw
	j8xrn3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYK-00000006R48-0rDB;
	Tue, 17 Mar 2026 13:33:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYG-00000006R1A-1mq8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 13:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=88mM0UwfW559Ea9keKdGQ5zcGppNDqvuOWAU7Ac1YoM=; b=Nok5XVRX47qcdwD/vvs+k9krcb
	csT0Hhg6P4pZNo8ub5NTQfplDQERej0T2DwMrEm89McF5aD15UpXRL1c8BdecmGhZ0DzkcgrA8y9Y
	RQ+3WFZ/X63k+7BW9gzlL6rlkyyO6XYwwD+NiQ5Rxp0U9nwdTZR0M9V4zvMDKRLB6+i8GDwIKxxgn
	pJAqhWvWmzhzZ6YhuUNfIQEuTisX8rUDmhouNi2rOec3wezpMhWqccKAsvzBqreINM3JnETHfQNOK
	YUmwuCY17BPRRRRr5S04cgK4ehdKM5hqZKTv399WhBioGldOAqoDwbyZt8GoFvvYhzBEvy3jAgunM
	zbkA/JEg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UYC-000000095v2-2yl7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:33:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8dpvV4022237
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 13:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=88mM0UwfW55
	9Ea9keKdGQ5zcGppNDqvuOWAU7Ac1YoM=; b=lWIHho7DytD+zQIa3BaWdOoOeKU
	ZVC60QGQrjqvpRt82HkwH3Z2k+DnTKuabw9v3vog7BL2AVmZ4CMfUXMlEUKLw7Sm
	0yRshPkXidtbOuJmZVe1Se30cQvIuNrsJk4tIsx8YbRPXoWzyXAKp1bwwbjAsTJg
	1hAtH2qYebTCI67LeOgVUPjOleZHAp6nr9cYZrOv1lclF7tFF8Gz07c/Dag0UUYq
	azLlmX6jdDX5pZU3OO7flD+WkIIHt25OJk1OpKBN+BOZ3M12hW+csxY5nvsxbEcy
	w2K5XtcEd3YXUmT4wsg+f1bKJ+MfsrH0SJbSAO5Va/jC9STJ1jVzU80joEA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fkw2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 13:33:35 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94de7380eeeso70558304241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 06:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773754415; x=1774359215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88mM0UwfW559Ea9keKdGQ5zcGppNDqvuOWAU7Ac1YoM=;
        b=Shgd3Srk3NNKqs+lIPxaItUSosvFE9I08/njgtSsIeqHvco3zTb3hNoIF4dOZtN192
         zwG2MFLT9fi6idZajdDkpSpNXJMqz1a2e9K1XNGFPXE2RY1uyLsL8oNZj7N1/AKoLwQw
         1YkkzJjI6ZpY72p93PlqBrS/zuzVC46DvApfdw44uJbOdq1uLX2smkf7gbfMx3pWPlfH
         fYCKcLIR+FjIejQJ/d3PyCcq4leRM+7eMeuoqz9zZ6wY/1DsSGeCUjSWSs5gXXawzavU
         V0NYqdPC6XHdNxA2P7w6Z9m5mkTzkper+Knpd1ij4JYqMWtvnNz5awx/rdGy4ryvg1FC
         c28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773754415; x=1774359215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=88mM0UwfW559Ea9keKdGQ5zcGppNDqvuOWAU7Ac1YoM=;
        b=PIQbRn9taX3OS3byO1hCiW4//DTrQizIhbQSCTH+nnmEqAzKLjcUwRqEhjQt+S1yS7
         aM0x89DxmIrHXdlsMJ/ucgGsib2uby5cDghnr4hlBvHdvxPFrUdakDv+8efoLQ2Gsh+O
         sEsZididqFNXRC5Q/SKIztSOvXp05ZQszLo1xYYj62wxUM/UWlaiOjMmZ0MCGf47Wmht
         8j+jInz1svxeoJA8qww3e5kjSQ3eWsA0V8BIfMNwKejZbfYEE+Td/sAz+kiHpoAL3kzG
         XyplxZRmeusaZilKg7h+q6XdljA6k+kiSTbnqr4woT1A9vXqMYxi1zugB8UY96Az6F2f
         ymPA==
X-Forwarded-Encrypted: i=1; AJvYcCWi2g8YPcNLxycOdti8o9IRLgChzxHcrO2gdfBHuk2APnTs2IH2b+Gykg3KfV2+6Fs1niiXaJaf+5wnzhx8meTV@lists.infradead.org
X-Gm-Message-State: AOJu0YziPaoF+44bu1bq6vLVtZBB9oioHVFSCLLqTXXW7DvA6QO1hnjq
	q0zABTnJeDaDkNDhiofTM8z2iSU7deU/py+LZp/kKMlkGEw0pC62/MKHYlxSZlyK3MMmLXvTH0+
	rVnbK1/RjM2v1KwapUYIRZzZFZleikCaQvqyCWPzpzAZCfBh9odSAsjDhiBwi+wqm4qsp3HIW7L
	tZGw==
X-Gm-Gg: ATEYQzy8zUcERdTlhwCfZUjtDpjP+NKPuFaxxa215CEClbXuqorWjFir19VGGvVhpHb
	ZjC10PTpyiy6iQJ0DF+d/LnqxaKXxBNRVATFkSvGSOcBiVYzz/cU0e9mdKx2KnhkNGemoh4El55
	/uHMTB2bMjwzL4lMRUZ3gtBtblzPCTa+8Jl3LOXOqjxJk4LV79ruQk/Tg9/aax4a/9R+8xRiHzN
	HG25qYyY01sTkrXdPZzqD/8bLjQ7e7Zg2Icazq8uwWWBUZKweYCzuo6RoTLyjBO7mHWbdpG6buI
	rUCNdqRqn3S75WdULip3b/GkAxJFczNVwVVUe1aglt4lvMgq71YixCMkk+oPrHN3fV0NLQ4LvMT
	33To/O6lhYo8Ji/WLiEE5jAp+KIA/BjQud8cd
X-Received: by 2002:a05:6102:5489:b0:5ff:ca6e:c897 with SMTP id ada2fe7eead31-6020e8b0a82mr7765961137.25.1773754414599;
        Tue, 17 Mar 2026 06:33:34 -0700 (PDT)
X-Received: by 2002:a05:6102:5489:b0:5ff:ca6e:c897 with SMTP id ada2fe7eead31-6020e8b0a82mr7765939137.25.1773754414189;
        Tue, 17 Mar 2026 06:33:34 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm51358613f8f.4.2026.03.17.06.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:33:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 3/4] PCI: pnv_php: Simplify with scoped for each OF child loop
Date: Tue, 17 Mar 2026 14:33:25 +0100
Message-ID: <20260317133322.266102-7-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260317133322.266102-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260317133322.266102-5-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1304; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=eFMulhlJa2czqc6PcJ/mERCRbh2LOh0022dwe4uJYpY=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGm5WCSgUBvQt0JDHdii3jWXC/hFw2j0Bpx4Q0CacjgyAikrz
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpuVgkAAoJEME3ZuaGi4PXiJoP/1M+
 O2IBPigfQbnSPLXMO9PGtKAtkLFrr7UH0xdJmfKyTWqwr4f3bd+NnDFEcCQTTDOhi5q1/DfvHPz
 oSBfYhhtTib8d11CyFDvJhXi2uNWole466n4geS1ah+G7H+6A1/ePH2BhShkYKmK9ozKw4cKtkM
 mMke2eJG46E7FGMuYTlpg3b8yukEIogxlAfO04ei4vC99ESxVP5y9v5QSaCI9+D0PItGjnF+yF/
 kxbvMfDh1o5QoMrzLmqFxFoA6N9C6k84W8YzmXMQnU4YmPGIvyaoCGqbwG35nx704jx/Xgc0E0t
 8lzHD2+FupqcBNTmXnxErH8qjjmQJOsB29727VBE18vBGad132yrTnqBnHYeZe2vx8cjpms7UVe
 7dp3+ZkvMliHKiMYahouDtGP56kJ6qm20WyA45cbNVH7sr4y6aWhWgN0zeuwwGkW28jkQLdMwhf
 PE9wOYSgDBeyNHdIvJNPex0m6JeyE6C92+lPFxTukWnhD5bozbd9tscptfBxfKV6WXUHhCRKJxA
 wva1nWjijOc2Kpj1oS3HZr/MJLirzIeOmBGuze0V2BfOeupdrfAkwDOHQUUvnUqJ6DTPNHt7fcl
 Kyv1Gu+cL6uYme8xPcMPRJ5zjciewwFwqROmx5+3iTnKKjB9MEpbLow/iEtIktUpUDeR6IQ1Iqv MDVb0
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b9582f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=i0EeH86SAAAA:8
 a=EUspDBNiAAAA:8 a=WsY6cfW8n5MRYgmDw1UA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: -ILmksDwVNHVzjXv6Ka_RQ-sT33AvE3x
X-Proofpoint-ORIG-GUID: -ILmksDwVNHVzjXv6Ka_RQ-sT33AvE3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExOSBTYWx0ZWRfX8vZhHAczL14R
 e0bEXBD5KusFxhCLP5h25YRGVQ5v+q3dgGuKFZtdMZPYycFj+fT0ZInxKYDuOws5WISAo8ohoXi
 sJQ8BqLI3vN77CrKUz/xHjgkUKdQPMmqZ9ImJ9AWf8A46sy5QDG8QXHlfTMpCxWvE/d4NL6ONXm
 EPTeFgzQX/HNgg45PkCcabl+u9/TZKYUMOcHfh0wBSQsI73zrPPL4/XoZR5hVK0Pz2X/ahF/p0Z
 DAZ0iWYKoGPe8RKy0JHJk4a7kREcLFKa5tdUFH4XQWWh8GvmqQp8z3E4w+GCb0l3LoVulyFIlbs
 F8/M45eCWQwGAM4O+K6V9O0L9K4ZAtAlgXWak5rwDShUjN3tCcyzg2bezushJPdQdO9CfuI0X26
 gTN2lzoQFA/rsy02FQlBxfvanQSod/XV4XvF3h2hq0lRZgTde81i35ORZjhhNgXq5BH6YYRqKfF
 hjHI0IUShZBaZQvuJcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_133337_049424_DA363B04 
X-CRM114-Status: GOOD (  14.48  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
Tags
---
 drivers/pci/hotplug/pnv_php.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 5c020831e318..ff92a5c301b8 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -215,24 +215,19 @@ static void pnv_php_reverse_nodes(struct device_node *parent)
 static int pnv_php_populate_changeset(struct of_changeset *ocs,
 				      struct device_node *dn)
 {
-	struct device_node *child;
-	int ret = 0;
+	int ret;
 
-	for_each_child_of_node(dn, child) {
+	for_each_child_of_node_scoped(dn, child) {
 		ret = of_changeset_attach_node(ocs, child);
-		if (ret) {
-			of_node_put(child);
-			break;
-		}
+		if (ret)
+			return ret;
 
 		ret = pnv_php_populate_changeset(ocs, child);
-		if (ret) {
-			of_node_put(child);
-			break;
-		}
+		if (ret)
+			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static void *pnv_php_add_one_pdn(struct device_node *dn, void *data)
-- 
2.51.0


