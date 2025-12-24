Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B336EE75448
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcSKd+jkEh9Jv+pXNATWYS+/EEjNGBH7EgZtUP4nEy8=; b=Z63YvaBkv9mo0AkT2Y4d4nU3yC
	ErJd6snicdPhU5nSk3Ib4T5P/aX5/WO6d0Zuonxw+TdUSDrgWFQMvx7Xl+14wTx2U7LhwKoyfRVRr
	+k0ckgF8lnQJhDJl6ahQO02OHL8J+OuQlATcoJquXwN2EELkZyzBBGfKhwK5Wx7nTR7s3T9PD79SV
	cmG6q1mjOtCw3MY0PdfamwlY6TiqlUHoobVjLrurdst2I55sJVBe5O6DGWcrRLPlsWaYjNiQTqLYQ
	B4ZcCnWWwO23vKQrLiGW7vg2B83OrqTLPXwKiJ2JPURGDBTmcU487B+xBceRVzlFxY2n70p3PO1uc
	KXQSrI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMxB-0000000Gjsa-3SNk;
	Wed, 24 Dec 2025 11:22:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYMx6-0000000Gjr3-3XPS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:22:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7uCYq1056162
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jcSKd+jkEh9
	Jv+pXNATWYS+/EEjNGBH7EgZtUP4nEy8=; b=f38reHAGRIFfLQCWezwOLryxWc/
	CusDdx/Uqz+VswmXpFtVU8j1OTVFnMBKHqXV4exPTmq8Hf7nD/8hq2C84yi0mF/v
	W8YhGgh/SkZelfBzWehOzFaNdyQwC20rzteSwoY4cFTSHTtr90skAOqOARPKLcah
	MAwd7uehMnY46KIdjJA8UL1hF+HDPCYMxB2iRYGus5AYxTa42f2l8Zp/5U7IV3Ig
	inL+UMZTf2LmIXT/8hczHCL8lmiiMrqRdsZAhCIrnasn8uea4CgFGtbURef0xgZo
	/XRYLScrAFbtwDb55ckC5Aw/LcL+bRU5qh0FEY5AN8qLlclFL/lIoyvAIfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b811v29rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:22:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee21a0d326so35451411cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 03:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766575367; x=1767180167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcSKd+jkEh9Jv+pXNATWYS+/EEjNGBH7EgZtUP4nEy8=;
        b=UmuofazcNg7Ah9rcccYwYz9QpjfA3H0i8fmQrHgjx0MeF8zD/ruoOz7JTFaXKAepT0
         oA6Lw/W+EBjyFH8KpN56vgZzYn52PwAdGLkN54Q+zLRwWheI+Drn3jasSFm0/Ibp4qgB
         n/n2feZAlLVw+Std73ddhvTvNk1ce6t4h6dk6akfd4WpSlhHbrJLtXkZlefHpWq8NL5B
         OLHOsPA8yCMTN/wt0gR6tyDriGQepZi7yK3S0A0MdWYXxiyTrVS05nOidMhuLBe0DnXk
         u1X6hWbAZ/XyFRIL09mZ9K+XOE/kY34m8Sv05LLYOcBMjkNOLTrHMNelR3PT/cbp8s1r
         t4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766575367; x=1767180167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jcSKd+jkEh9Jv+pXNATWYS+/EEjNGBH7EgZtUP4nEy8=;
        b=pPoBwhYBC5dXlUYMTlAd4o6X+z/eAmSjohBktdxteenhdWdoOINtxXh7NoFLGldOoW
         ukYQBIEkUfOlPY6awP7Sx2MLvt7wY9mGidGamUoVKK2w+sDwLMggATt1+ykmiaqxQuQi
         gNsfHbRV1xMLk3nmnMBK1ewj8UoEAo4qDl7V4b6WRcKvb4Btu49dM5qKNswyz+pYI6bh
         C+Jr4hdL6Tn3/dKV97hC40Wzt3/owqwpoUHzLLUdxj5PPVLOQWTGACItUdHKwtQIDRLe
         DlfKfuEMb88f+MSICPX6dfNHIKZpPnZpp164GAPLhxD8yt7jQZHuItItxxDarLLgcvh/
         CbnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7+nU/pMQdBU29r3I0iq5LMT2Xs0USyo7p14ze/h4nDJ2/RGPQFA7/gPdNO6gLS8w9ip1/dUtrURLrbNBgkNio@lists.infradead.org
X-Gm-Message-State: AOJu0YwN73kCmcTNqMdNrpwL3RTcmIsUCkSS3fOJA5o32LHy5EEVrP3j
	W4z3AWYB8CnG8D0ZB5xb1qyq/hVVrE2qbrAc2UqsbHodfi5O6kjF/fuOfqhBxgs4OmUGQQ206Pv
	O2qad1EldzE4XAqlAES3jgAN+QCaWzwCjItfYrVLmQftPi4QAT+aerpOVPOLDqWL/pDJj3Te49B
	Mjcw==
X-Gm-Gg: AY/fxX4zJFm8YYyl0sBlYNzPARh/NZF6SMimKma9yN52yQ+fUvcqwdy3EIgIWwofYEi
	0Z+7zRKJBpPVXaLnDs6FB7ouHOynZEfDKbdSk/MKMh9gNLDyHHpvMf1ZEgTTiy9zgufWD+K/SM1
	FP56ymJM/QolCF/h3zgzsNbqqeEMvszn97feR3KW1K84RD4v3Jb1Fd9+iiqFak3afAgTakplizQ
	T+Skt1nevrzRUnD1JRSYg25xs9Z0axkDoGFQCv93rKlyD4mzYuUjHl2wTwf0zYKatlMzIoeb3QF
	/CxA2EYySkACEO5x/ViO995cLtQrVKhXMOW9ieAM5uRDGWFQeCpykiip0Gam9WtbywpDfvgB4FX
	M8cGbpUZMBLk1nvsRWY07KIYgC9uE3bOTPgpkcqeLzZWYpYcvH6pFyu+vmqbMQFzjQdG1rQ==
X-Received: by 2002:ac8:5981:0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-4f4abd99eecmr254206091cf.40.1766575367371;
        Wed, 24 Dec 2025 03:22:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXk2MlFg1WwJyORFeqArvn3W7h7ibn59i+vAhLb4RFfwFlMM84u21nTU7QY11aHubbdFv1Kw==
X-Received: by 2002:ac8:5981:0:b0:4ed:bb39:9a60 with SMTP id d75a77b69052e-4f4abd99eecmr254205741cf.40.1766575366935;
        Wed, 24 Dec 2025 03:22:46 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64de4798077sm2042514a12.7.2025.12.24.03.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:22:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] clk: scpi: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:22:41 +0100
Message-ID: <20251224112239.83735-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7egcwkyNwPYxR37Jus5Gv9CwukNyHGGJPyUno6vqjsY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS80AY64mdKfCs0Ce2qW9/YvaJnV9fNYZneYmI
 4QoyhCD9KeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvNAAAKCRDBN2bmhouD
 1/WED/9utbqaTmq0XaHHxHeW8MXpfe3OuGiBgZeRSPMQp+PrnpEUURFjOohgTfc6eW14rKD78U6
 XOvImOVzz75zyzGO78uu9nsN+QJkyCAwGberuACdsCq3RpbS+6FW9KS83biY38xBEqUeAEBDBIP
 N9Fd6BAax5Nq/qaGRkZRGl7LQzNPyTyB3e8aZs28pJNiW8ccbZZ6F0VvE+9O3pSfA7joZIUaSjC
 Cw2IHki6l169/9FLSpLLoSwGslJ6cwhRZJUlic/BHBgWruhmmztQT47F+zj4ZzLo9Q8HFE7krYk
 bkh92iAN8OLyq+lnOG/CqxQr+GIeLi40AZP1z1bOjopM3z4eRTgPJBL/0XENNJPFCf9nwlVKWnK
 5Ox+v2kaiUralco05QxoogHafJqn9BVuG5L0m7bd3YZGSvDjdXf/+I2LYOOsM4TL1Np4cZw8Ryq
 tJYNLkkj/tGT+yNwXFU7PO6r/YAU9b2DSJ/sCCspL+QkSMLN6DjA7a5eMjprTV/PvKv6Cu8ZHh6
 gVHGi9nAOZodfa/oPyBIuoxKUsJr9IVpSVnKA/NcrFTOFY6ZAbeC4qFgqwZDsGtrm6OpUgWGHXY
 jxnECp1d6//VnlBN4YUve+hz5d0+2DbnPolQfsOFVu+RUFvEu8rppKrYT/jdRdHYhu+u14ECPfN 8SVh6EqGGL8IYvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5OCBTYWx0ZWRfX1+8TW02JRbxJ
 82oFEAG4hn//JWlB7wActk50amHUS98Kk4ScAszeHmQ7bfPxwBnS14in92hQuyEwLCGItyALRsg
 e/SmWYYWEfIWHXmcwkGGZTeChavLDP4QoXpV9Vk367hYSzX1LVtpDHaqiEs+Hfy49WbMV2koWR1
 xMBdKiUzb4nVj2fbg0UvSNv+5e69cYkTV5kwwEbyLPhci6bsR53GuAnI8GwDisdf6untZ3aTBn2
 JhPdRRACfEpME1f4XOfLUy+GK4KnjvdraWELr3yjDcz8+OOeOqmPcdgFNc7YayVR1XMBc5ZTGUj
 oIRZXdblsmzfLvDxG1ly4GfV7ozCXBErnUFEjON5dTFzbPJPBfL7av3T/HIj6zsCTYWG7xRoK3y
 FsIcoGef5gOiLAVN+Xows18qVev3k462sX8+6M3h1CvHh6qY6b+DCpfjmR33xcfqAexRiWMDzLL
 WXNeUrCqvv2Un1qWPYQ==
X-Proofpoint-ORIG-GUID: _IrFW1LFnHjZsR0g8FD8NkxJfwuw552S
X-Authority-Analysis: v=2.4 cv=WegBqkhX c=1 sm=1 tr=0 ts=694bcd08 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: _IrFW1LFnHjZsR0g8FD8NkxJfwuw552S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_032248_882633_7C202707 
X-CRM114-Status: GOOD (  15.79  )
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
 drivers/clk/clk-scpi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 0b592de7bdb2..7806569cd0d5 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -265,20 +265,19 @@ static int scpi_clocks_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct device *dev = &pdev->dev;
-	struct device_node *child, *np = dev->of_node;
+	struct device_node *np = dev->of_node;
 	const struct of_device_id *match;
 
 	if (!get_scpi_ops())
 		return -ENXIO;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		match = of_match_node(scpi_clk_match, child);
 		if (!match)
 			continue;
 		ret = scpi_clk_add(dev, child, match);
 		if (ret) {
 			scpi_clocks_remove(pdev);
-			of_node_put(child);
 			return ret;
 		}
 
-- 
2.51.0


