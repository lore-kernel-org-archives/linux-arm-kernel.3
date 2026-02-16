Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B94E63F3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ve0dKftnpeWLaov/J6pXpHdnguB/y05HfkaR49I6Mwc=; b=XQFUujwRwJo2jQzSE87ZKXO/1w
	oR5thq6mLYuWKMo3K2WtcvdY660ej9Y3t14ZtmQUeVGum4XC0LEr0am6W8RKf18bIYNMgJBGpKguV
	fTioGoWpwjfYiwbUYOsNtPF2l5/ZGrR+9/QhyffAIgfbKnqSiwipwc8kqkP04YPRdhl2Li6HZpaie
	1KkMcHhsYsp1BG74d02GkiNVB5A4P9AiNgh5+g8CLy9B3PXGnWSfN3rZCaxjr2PP1XWQdTydijbq+
	JzOLDx7o3Thndgwpdo/jd5Loc1pCP/1HP1klUy9uA1jQVMJyNSDYi66CiVt9ZlEaKwYac7TaAiLau
	3kvOntgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruRM-00000006ClB-03PY;
	Mon, 16 Feb 2026 08:58:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruRK-00000006CkP-1H7b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 08:58:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FMtMwj2311401
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ve0dKftnpeWLaov/J6pXpHdnguB/y05Hfka
	R49I6Mwc=; b=fQjgrTM3MLto83YDna+kWxl38L8/qHmwsQahhxg/xmJS21mPJud
	qzodSZqs0ViNhYAOrmwFF4y6uCOLb7TMA7Zz2OuLsdoZ09P6my+6g8s+qosxJou6
	o4NeTNWGrVXn/e6cNjQ7HdDb42YrVhLYLc0wpKqhJmrGkKvdnjfsbK23tdN7kFzq
	MRGu2GcoAbinI4fo55pRPvwDcyC6BACfiVtYVLHQHvLpqFclRbn/veRKcIkLemew
	n7P/dlXX8wxhQ/vae1wKmGpsvNbS1y+/zT3aSipMhfgIE973EmklmN/y+n+fQNBb
	kz4wMslQr6jnA61G52vQORR9FKDir2LEZ2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cagcf418k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:58:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b0d938dso1902749685a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 00:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771232325; x=1771837125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ve0dKftnpeWLaov/J6pXpHdnguB/y05HfkaR49I6Mwc=;
        b=GaACVX2EPyzglNpxHXxqO80b5spldVz9Keq9kh+Aix03oQ9CfW/udmRkUMxzaWNgKd
         7j1SLlaIMbHHR8EwxZPk4scmsXcr/5Sl0twfv9hLyT/IZrd7FsnhdQU8VlfUcYN/7Ouz
         ampD0DtcStyqoRGnvLItNdWbCDHAT3urYs7nj6CZdPCJ7PPJfdSXk0pCX7WgyL56jXY6
         YI2qlaZCuGP+1AMkIQYGmfdMumXzWSDXtY3IWaUNMsNfsLSI9ACckOYaChW3iQWm2Nk9
         P7nGiNk5LPhMABECSUeJCtjfTffhsScge2eKL2Ir/77WWOluWmTbwrDsnwJ/EAMJ/rrs
         u0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232325; x=1771837125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ve0dKftnpeWLaov/J6pXpHdnguB/y05HfkaR49I6Mwc=;
        b=r0W15kIBLfC19vXtCWlQlCiY7SKg5tHVgZBBCdEfgJcneXR/gtFR+kNTifrVYtgqLf
         oJ2WqZ9lk6uOrsuhytQhnQdX6+UqUYE6Mqp7ZcICB+dNk3V4VrONl7BeahGtS03K0i2w
         SLArz51nwufesrwawxOXyxpZFSt1XB8pdW7tcQ+KQAvD13sJvvyHZ82BgBDz0Yrb6vVb
         rOEZg41JgQOeafbb0pVg5B0tZnuuNfxyuU+4KjxnskSQIYevs51H8AO+RC26T6RFFmkT
         vsAeeTTOWLWRefJiI7Pp62uVx+yzkaZ6QQEWeVOcKK/rskrm/Hj4msW28YzWimH8AS8C
         mRTw==
X-Forwarded-Encrypted: i=1; AJvYcCXlQnEmgYb609gGsoSH8G2im4yhDb0i1GQA0dx4YYycUFxvgJUNFt7Fsio+dfrRzcIrbbIJDtU+yqTJTr4SwM4f@lists.infradead.org
X-Gm-Message-State: AOJu0YxQcToxUUExThHCTU6p5irukzeCKBFpqyhaKHEo3k5Mf8rwTcb0
	F2vWAF3k0tXmH7J5fuH/eYtbz5NmkMvIgZl450PUEosDsPDUwnIvaMaGjUOmhBXov7Ix0MA08WI
	s0Of7FGLxETVwcyVr3smeCh8JCh+OHjdc6I5w8FOHezCGHK1g45NTXacGtTJgdRx35aYRHS5lf3
	1jHg==
X-Gm-Gg: AZuq6aLXTtZQjVS8lyxQqpLPvqENffGB186kpjVV1uQQYQwjyqVbixJyuSr2cU6DZsY
	utri10TBWO69E2/P+ej34giQizpfQDAm7m7Y0U51yYsS9soi7gmMW9BJdoZd+Z/eVLcl98uYqjz
	EdDqn7DqDHsl/BVTOVFxFA1NETV0Ag39rYyiTFys46yFir6r19FfkHXP6z3OyVfCauFxCOW+1SW
	oZa3owMCJ4EIy/KtnQsqdRUSaqwbIuWc5VziB/KwBjbFga2swkdE1UHC5IkBJZTcqSxpxroWTKz
	8gUHUtuWSaM6HAginQhQ9N2lViXfsFDimGB2GzouAYhn5l3G+ptgJenMZzTNZ1QdCNYgGO9Rdqq
	yAxYdTuDVwd2IDIGSpSdAXxSOWqoALbjWN6R0dA==
X-Received: by 2002:a05:620a:170c:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8cb424803cbmr1103463185a.59.1771232324654;
        Mon, 16 Feb 2026 00:58:44 -0800 (PST)
X-Received: by 2002:a05:620a:170c:b0:8b2:f29e:3af8 with SMTP id af79cd13be357-8cb424803cbmr1103462085a.59.1771232324228;
        Mon, 16 Feb 2026 00:58:44 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm27012348f8f.16.2026.02.16.00.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:58:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] pinctrl: amdisp: Make amdisp_pinctrl_ops variable static
Date: Mon, 16 Feb 2026 09:58:39 +0100
Message-ID: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=954; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0U8icYBDf630T8DU2qdo3kgX5Lg23xfrrtgy78RLV0Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpktw+E9efH4zDSSHNokFbdGHIdPhjYIkhOA3mm
 4gXQz9q5VWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLcPgAKCRDBN2bmhouD
 108LD/41hLeQINQ7hWE/bBT968ESjmE2Ja7Rx7CzBRtfEGciGXf2+Q/3QhEgy2/tqKFS8xnhTas
 JHga7sY0QRFaF39P4sSAy1S5v0je7Hf1vJj70fI7/vZ6KKQCLKskYJ4W2LtiSnE3bSAOXDxjNNq
 W6GuzV84X00pJ0j+hNEHpOlaahpf8Sn3M9hH8MjbaJhjI/a5q6TkGJS1y6oC8he4l+I3B9iFfTQ
 W+b3pehH4F/WJ8OVvieh71IPDgEG0OPfZBz/8tmynOuQBq2SE1/4bjSJr1fL/pLSRPo1kcwu7Oe
 fIDFcODgKWE3M6W30pQiKCWuYAG9CYRS1dv1SEBpBMnxBL83esgChn/kRX3GHc6P4jM/nFmzta8
 T4xklNrWcDyR8ki2C5Po92hp7A3p8yTXcEvvRBxBvScyzhMMio2Gqjunf1Bxn3hfpSQQJb7jS3r
 ZYNyojIwAqfHJNWUAiOtyzmcx+1S5fETKs/+cZs/XOZBWpYfCuIuZIE7ku6VEuXHuWGnErKm4aW
 9micWmNOJ34q5ArQYNjlOf2489AFtcCmg+1oAWDo1OAOvemYjh+aggO/ubhpJuNRnoTExb5WzvN
 8xKq2Si4ubtqXN16+TR5nQTlDczPZ7OkM+GL92dygQRTdhO7lr5JSDa0eYVDz6c5T2s9YJAVszp I5oFounPoL7ub2Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7fYnWknQZ7vXNUuaD3XALEB-xwJSwcXg
X-Proofpoint-ORIG-GUID: 7fYnWknQZ7vXNUuaD3XALEB-xwJSwcXg
X-Authority-Analysis: v=2.4 cv=Sc76t/Ru c=1 sm=1 tr=0 ts=6992dc45 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=qwspfZhyocm73jcesWsA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NCBTYWx0ZWRfX9BeYeHVTZyEz
 uK216GW7Wns0ra65aUp/UtO29tsC19OSEB+ZG1ffTor40d9ROsMemEbR7Vl807f+1x8/+J17sNR
 2hlFHghFkxbryPmhvmyrnclGtQGCegBfl6bFrDOl/dgGLW4m6MjFxZOU7cT/VMrgOnG6Q3OmuQq
 TkTreP/ITQJCOV4knQ4AD5Ab7aglkpka98LMqvcfYmdtD+VVuvXzD2ZfDelzxcHeArsVhQISBXj
 mIZ0XCM65qrzOwh6tbXN1AE/PxZfrIRbneMhBV46tyIg0FK0N9wf+3iGtdX1SUG/K1TVgQPSWF2
 gU8/S7RqT4egVeUw4ELcgB/wLB74mzDCCRaPOpCB+jrZooqQmm3wmnVu+k5+7qpRs8dVrqqtlh/
 /BO0Inhkb4rqJJQCDVXMPpsg8N2WsuPhSqUCbOj5eOnlb3Bze4MIUOqEm1SQ8r1jSZafL5lirIs
 WUw1JDdI5B9DovVWALA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_005846_462917_D83D68B4 
X-CRM114-Status: GOOD (  15.20  )
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

File-scope 'amdisp_pinctrl_ops' is not used outside of this unit, so
make it static to silence sparse warning:

  pinctrl-amdisp.c:83:26: warning: symbol 'amdisp_pinctrl_ops' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/pinctrl-amdisp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/pinctrl-amdisp.c
index efbf40c776ea..e0874cc086a7 100644
--- a/drivers/pinctrl/pinctrl-amdisp.c
+++ b/drivers/pinctrl/pinctrl-amdisp.c
@@ -80,7 +80,7 @@ static int amdisp_get_group_pins(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-const struct pinctrl_ops amdisp_pinctrl_ops = {
+static const struct pinctrl_ops amdisp_pinctrl_ops = {
 	.get_groups_count	= amdisp_get_groups_count,
 	.get_group_name		= amdisp_get_group_name,
 	.get_group_pins		= amdisp_get_group_pins,
-- 
2.51.0


