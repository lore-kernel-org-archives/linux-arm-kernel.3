Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBB2FA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rw9cR7UgnznRgTLA61pO/jv9aIEOUeA5X2lpjfRbukE=; b=NKnWya/DnIpeHvUNWyWIoF3DHt
	++mYb4comJBQ2nOF6X9PqyCQgEJ7knK+T49YmwhXyWJLstgoGl5JTayvHqMlcqqIkcztkh4FaVYWu
	W2idAWWs+UMO94Al6FPKGOdnalNW+lYXvr3OIzga+CQ0lLztfmdWn9DcoUwVb2s0CqHVBzpXKAMju
	wAlIPFPJMYiyOPc0p0vyA4gN8sNw5OGsUuuIQhyzEnfrwQFQxC+lq/iu7iK0Wg5pNw8YvE35fev7b
	4kruy/RP8vkq9bTNHebV/IC1Ug4+nWiGwjM+28RcxzwQ0fTAPDPb7y4f4rKkrF4+O0HojaoTbp4BY
	Oy91mTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbec9-00000008FCi-0Ze4;
	Fri, 02 Jan 2026 12:50:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbec2-00000008F87-0Siw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:50:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W7ff504653
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Rw9cR7Ugnzn
	RgTLA61pO/jv9aIEOUeA5X2lpjfRbukE=; b=CCIzaNAk4aKy5RKneBlsANQYbM9
	GSLsbcAgZJSVPTziA/4aDpdAOtUHiva/4q1lkZrYnuxKWF8qduJmmsI7mJXgZbmP
	eKS9VulIZnKtSH1PxtXVpYsZ+pPBuVLw35DPmmgQUQeod/zRDqQNnGrYYVFLjPP7
	9ITQFNVUFBfWZGs9vsyAj813KqPSxf4vst4HR5QR4bhJDRpi/Ir9Bkpe8zE8uHFo
	lSpLtiIQNZKK6uemEEu3bnlLnqosZpXH40HENHmnHtb975Hg6YcxJmR7r0bcwMfz
	2Xv7LqN+ZmgB4K9q9SX7EO/1oD5CTzrWroSa6sHK4mNoUuHo/GCrPX7hEAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:50:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed69f9ce96so430330391cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358237; x=1767963037; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rw9cR7UgnznRgTLA61pO/jv9aIEOUeA5X2lpjfRbukE=;
        b=V/7LKYzV6MEeg3jBx6gK+pQb5bJGnhg9tMdMU4BgnYhMQBQDvxO3P9/QzAYeBpkyT/
         vgmZTAMLg4NJvBbiLwW6BWX4iNEPu3LCbBprQ/1xy7OqGZ7tJhQHlTnAPusioKmnBTkU
         SEt3dlg9u5sKYZgnhG83y8Pb/pJ6d5mnIaBqrjdyc/+5rI9r8u3t7HbpqIM3sa4SMG5F
         Nbbh3S9nx3nLXQjLBtbQ1u4iKF9jymEU+zxXZ0Y3UMhzZD9FxyI0jXPEi2NQHckJYWWF
         mnJryNlwvqcz/77vm2LdezB9Q7Q7zSTr+NDIvyvLGOpeNKmY8vE6O2HElsx6Cd8XNXWs
         10uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358237; x=1767963037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rw9cR7UgnznRgTLA61pO/jv9aIEOUeA5X2lpjfRbukE=;
        b=rGJmtSEj7y0Eol4/643KZXXysnpA0BDiEzCaPybsOsnz2TckbDu0ZtQJKLM3uEIwwu
         K4W5ws66LMgQ5dhTb2HO/MW8WzT94flBP4WYTG8/LD8GE8cEEyTM9fa8QbtbWR8Bg2Br
         fXCPxFz25XfDFqZfQf1n8jp5br3UpiHXF+YSwpjN5lHihcf3uXUL4+xaqJCbMBjvjDbD
         SDdOhl4Vz/Wd+YMjkT60lN/Wh+I48L/oW9mi3CM3co27LTqWJoKXxKtLUolTD41URwqj
         RgYO7mODtefQmqYbTzn8JIyaak0POhbSo190k6vbHFgTXYkyVukef/EK1wR2RCMFPvHH
         W3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXMxsQ24xuUVFlwxnjFwGkfQQQ9NC8bwxNyYXjzXZgSu6t7pIsvyfN/lchL2iZtRqZ0o67C8TmZQDk7GVp9Fseu@lists.infradead.org
X-Gm-Message-State: AOJu0YzzKv6uzNzG2otyXUmJ2gYyCDIwg7wEm+r9rFoveigXdEDCIYRY
	MEwwCz6op1RMi+fHq/mCNsJVRKuRf9NuFS+Gtfs4cao9sn/Y/2YHOrM8YYpVvZCtntW4Hbuut+i
	Jti9MC2qkHbiBRYZTZdrNDwm/StQI2XVERe3/yLMwFXkmLNn/baclQgcsnDyR7r+FDrES/0PMVq
	IATg==
X-Gm-Gg: AY/fxX7p/rXHAhJkzAMOweqYJeEjWelqmJnhG8KA6XkXLDKpPMc1kp/hD5bb0DWhfoS
	sPbMVfltcGDmG6/wyDAj+e8sm4j4A16ZpzDH8dAk7x0HQRp839T+YKn2Sb+7xMzInW+DUkvyOlm
	ROtNE+H6dzb20rxtVPcziOghdzzmpc4Qx+lmwnjU9trvDaJ+/VKT0vH6aLnQ2jjjG8cDljO5S9I
	0OcBy00O0BfonzL/Tp5zyOuyy4DQ/hPj7tywDpBmkeegM8jkBujJOmh+0BZhBWSjemGt7kFBsfH
	bjHBdd/S8S2Q2fFRkLC5WWXA+UxhdP7oAiHOqWiE1f2AsyWsV9CTlE98jXN7qM0y6vX+kCiza2Z
	zCz0wM0RdNguhpJYfxEZIiq11Qg==
X-Received: by 2002:a05:622a:59ca:b0:4ed:bad6:9fac with SMTP id d75a77b69052e-4f4abcb884cmr674846761cf.1.1767358236832;
        Fri, 02 Jan 2026 04:50:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIWw0MdhBU4+og+j+xA5tAQD4PqhfRubUFGra/1emxWwHiSIQQApB/teNuq8Qqq8FHeEdaMg==
X-Received: by 2002:a05:622a:59ca:b0:4ed:bad6:9fac with SMTP id d75a77b69052e-4f4abcb884cmr674846521cf.1.1767358236453;
        Fri, 02 Jan 2026 04:50:36 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346dfcsm889545645e9.1.2026.01.02.04.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] bus: stm32_firewall: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:50:32 +0100
Message-ID: <20260102125030.65186-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1702; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=L5mPpkKO4ljRUS48r8o9ogYKNB6v9jDL+jvK6L4cQxw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78XkJFsI1Cuiz5O917DM2/TgG4Rk+GqB/JPx
 xxyk2caXiuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/FwAKCRDBN2bmhouD
 19m6D/9/zEO8ErTsO0Wudvym4arS7jvOcS6OLAk77qgDltEerEIEgGErwPOa6Q4iMx7Rlz258eI
 fulIXk82K++uNIIaFat9XX+sgOEfQdwXe1pqog5wQw6RsfNN2FxBAY8uZbJoGgZ4ZOSASTVxr6q
 gMtOC99bGKJw02q39eWNf3ESa2KldfxXycQ1m6BAv3nhj6Q0OMD4Ni4kpWX35rx5+S9JVWoNfqH
 P9cZ4lz23L6H0FauHMx0ytSWr0M2yjp8RWUDuXzqzltcpvUVBm6IHn9+EER4oeHOYn7dPVKgl3v
 xPOT6uVsIdLCGqK3d3Du5U25tUe6aJGSIgW6IQ9g1udMR8GKlJohMJUyTGhmxPohHWpQlBcsDpG
 424aK0KfHT0RRxfuxT2ldH/G4VErYRqmHZ6pSoTSCnoTo1QNDfoy6l4uC+4jqUjJzVKX2f5xCo1
 AsyG1kWMmwv4zmCQCnVIh1Va8p6G0KpJDdYSCfRzVLXu77Bj12BVISP+OxXr+NGJTI14G3e8nYC
 FIHYbq7glAX2LoPaoe1HrRZLURitlsYRmYZIr+rH1Ycx1Abfoc9lw6Dpzd8n17nBuEeJslg2sVH
 nKIXmR6ElsRnJ0Uy6MoWkhlP32kNlseHr11Vfoi7aRsxEko6PAtD4UrY/QcrpElBVwomm+BMv3F biCuEpDVgSvzbKA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfX2KvzGZ5faziD
 DB65icnirxoVPgouiq1HjEprlezoIkCSv8sP2m5uzi7xNpJxhFRO/dtDnArKNM9qdQrnNHRxUQX
 1BXXre/oZsxQ7vKhzqTPg2D2cIWdWh0OgwWjVLzt7i2cHrgOTO9A+3GVfFtltDKHBOhrgdqy8x+
 CoXnGAveWOJ+ml9vSQvPfFtU/62wRhEXaIgzvhlVC2g1gBAIPTdKKyFYDoF5ciFeDyqT+pN/jUS
 qu6/L/MOwNg6eKuYGi2msKInLum9n6Wr2wOqxqpXulX5Hpyx5Y9qh3asgAspYb/cfEqadlNnVik
 UmoXZw8Qj1U3W4dTwTKJSvqAN6TcmWpfmOvkIrR36a24/FvuLigwc+MTDuH8wGxLhNXzYS3HNN6
 SG7mCR72hvVN6Su6gJraRSRLk1UmFpxVFeOw5AVV+8/pOQBG1O02fJ52fmTgMwti6xdGr4o1D8g
 JzDH7/WI3atXCy1OIiA==
X-Proofpoint-ORIG-GUID: BhvXMlfexIKeHUrFo3dEDD6DGoq5jHGw
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957bf1d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=r8ysD5ROA9t2CGWeXHcA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: BhvXMlfexIKeHUrFo3dEDD6DGoq5jHGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_045038_179415_D5028173 
X-CRM114-Status: GOOD (  15.98  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/bus/stm32_firewall.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..fae881cea9a0 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -241,7 +241,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
 int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
 {
 	struct stm32_firewall *firewalls;
-	struct device_node *child;
 	struct device *parent;
 	unsigned int i;
 	int len;
@@ -251,25 +250,20 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 
 	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
 
-	for_each_available_child_of_node(dev_of_node(parent), child) {
+	for_each_available_child_of_node_scoped(dev_of_node(parent), child) {
 		/* The access-controllers property is mandatory for firewall bus devices */
 		len = of_count_phandle_with_args(child, "access-controllers",
 						 "#access-controller-cells");
-		if (len <= 0) {
-			of_node_put(child);
+		if (len <= 0)
 			return -EINVAL;
-		}
 
 		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
-		if (!firewalls) {
-			of_node_put(child);
+		if (!firewalls)
 			return -ENOMEM;
-		}
 
 		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
 		if (err) {
 			kfree(firewalls);
-			of_node_put(child);
 			return err;
 		}
 
-- 
2.51.0


