Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030D0E74915
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=; b=UnVoN/6O9PhK0vs2rEgpsAgBmK
	MkBwhBGX9it/cBSDxFT0SeYxurqBwicwePjnX1XQ7oqNof0xapwkJrzBAvk0XbzaESUiXeP5K1Ksk
	uOFCtTMoWfWTxVvXeUX2frVMHmrlcO99MSIbh+9YXTq8b9H8K/3v9rU6osUueDyX/86cK+asZevp6
	GmV8m3WxZ8UObShIZP9HlcKRYwSbF1hFY9IedlPmfalXhDKi0Bb6PEC2nvmTcNfFN5mNTXuojuq5V
	lQmOw4svG+MinNRjFajBIzeOJ16TMLO57ABuRAWzWXiM5SeqyPlO46Wt8tgcTd073fHUiixQ1NGqo
	DiZk+SaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNId-0000000GlFj-3aiG;
	Wed, 24 Dec 2025 11:45:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNIb-0000000GlDn-1AYy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:45:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO6HElO678470
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J+XKdSXfu3p
	NvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=; b=Tlbo/2468UIwAtPhrj1yP1WOX/a
	XWGCY3wvXM7ALriBPExWdODaAZfAcm1TqF3ZJh725NrVmj93e5j6GzhTZR5wItI7
	jCC/jCnXuiNZzSv3iH7IA2hmvJx0z71POzlcXOqsJKfHIWKhAOm0PXDAuuiSobg4
	In+e/iMhAWZZYNAGtTdppyXdXTwhSNe9XBiE+N9scNlKjG9MgXv6hqko/dpqlL9w
	Tk49Y4S0eULGqzTPJdx58BjvVf8YYLb2HFnfNgPg1NELWrlDnF11HvrU/jk69iJd
	IMw0r0c38fstQnecmy+pmAvC8FthpCbzeIWI32NgY4b4S6289SQ1U7S7opQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7yvq2gtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:45:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d26abbd8so159265171cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 03:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576700; x=1767181500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=;
        b=de1XHASE5OMAR40Dxd9fs6WLpBmrczky0McOabqHFo3fr0+Mii7DSvPSxpb9pN07oq
         wDzRRdN2oQ+EvDOpUtD2SHDiiRqho/poLew6ELvni5+7f5hVKSgGrKqSSooRK0jMRp2C
         /DbsEjDmvwk9mTFFGPbh1hn2r8vYWjig+EHDmXcg+ZOukZ7mYWyO3xn2Uruca2dmaL1F
         9kP9PimQunbPsS3Zq6mOphzN3CT42oYHVxnKjHPwy8kBivEeUbnja6ftwYYBXQNvYZtd
         hkXaRQaHyCWjN6BAEmD90XTYHL8lDS7Mfm+osvf7aCTwpVGQ+oDz6t0xHZYMp24IJmKE
         keZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576700; x=1767181500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J+XKdSXfu3pNvEQQcRukDiEJuQ5AfVhs0CAOvscxWxY=;
        b=Ac59Og3T/hormH7Y66P4nl1kriG1s8zntq5JYFqSMr7/ATT2tduOHNl8ef+Anq3shD
         I0KLMKH3hvSv6P8Q0Kq4EtN5b1K73GML0Y12pS7nPVFj2hBGPS1CX2p7EvT/nvJyCWUP
         5MhXyHQYtKfilD5SeN/6sAJtIanq7b/o85uxJABtuFzcN5MEaCjPuaQ4oI9qyELwcm/p
         UlB+gpwlRzKEYr4uC9ubL8UTeLcOOp1H5kS9t89ZxhL2goVZL/nW2bI+iicEJo6TpSGK
         9mPP6qwJ0MqGizkW/wF4HIyK8tzpwIuY2A1LYBfjEHHmoKqB1SiNxY42neaS9BtvZpwg
         8kNA==
X-Forwarded-Encrypted: i=1; AJvYcCW4vjmbI+Yw74lwlF340MM1+DQsoFnGyeBs1IigdzD8YEUKyDwbx+pagN1/iDCeJH3gaqwCE9Wdw0jt8qRYQtIc@lists.infradead.org
X-Gm-Message-State: AOJu0YxVmhikhejPArIOvle9eVXqxptbTQIPJqN4760ZHzH1lNoIJf3j
	aJym270oJPrd4Ns1NuRlS3y8gL0zuWQiaIpkoT3KBGTghgxjm/+sysXGDgXhK3VaKplG0Mgb41u
	JIuk9z2riOgNKYd8A0IoJCfaPn+7dnFSrE24fRBz6DPQodQ+SvYyD7a5dJcx2mfAEikbPbTECin
	H76A==
X-Gm-Gg: AY/fxX7iQg5gHFIan5ax0mgJhGTEIVQCXS+MwE7P0q6UeoAzZ3KE9H9oj1EY84F8z1x
	XsM6ZC42TMVI6XyeIyD3h8Hr5wzKWYegUIOgmGijtAzPqiw/MemIb2gdI4sCBL64kpQ1KigZr0d
	8VPKoaqhASLbFgosBh4AIGugqxD8WRQIExvs5SSlCuvWc3U6ItYWDpgqW4PzGIRjyDaUJyYG77k
	Eb26wInsOkQVJWIYAeYDJjHjxXokeflxAK/POU7WvOt2r0fMF07uDwlgq6XEumrfLzFNh43anzs
	CoIodSJPQ6PPfk668c+bDTVJ8+/tXJfUjgyHefG/eYvoAVOvbYl5FM06nPMOrLDf7T2As63wOtS
	Fp4DqJcTqxz6vvsScbf4YRqoXnlDb8fFCdZAlCJDt/lEtJzqSVn6K6/8acU2a8QXoJs4OjQ==
X-Received: by 2002:a05:622a:17ca:b0:4f3:5eb4:61d1 with SMTP id d75a77b69052e-4f4abda5d9cmr278528271cf.54.1766576699821;
        Wed, 24 Dec 2025 03:44:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrLiQNTTfYjU8xtnklvYJHnZpC8la9TkTBBoz2WHC/caF0ubww+Yu4xp4HXHuj2pqeLZEO5Q==
X-Received: by 2002:a05:622a:17ca:b0:4f3:5eb4:61d1 with SMTP id d75a77b69052e-4f4abda5d9cmr278528181cf.54.1766576699462;
        Wed, 24 Dec 2025 03:44:59 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad83dasm1799758266b.25.2025.12.24.03.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:44:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] mailbox: zynqmp-ipi: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:44:54 +0100
Message-ID: <20251224114452.141689-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9hdDvjId8Te0bYmkEOvuaWPWD7t2fGMNgkoufbUfEGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9I1xFdAjYYZBxmeWM+XZB7/hJ3ZyIkYsDtvU
 8vi3I0eMimJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvSNQAKCRDBN2bmhouD
 13N1D/4w+e6HAuLX0/reiJwlrEpozrEsV6UWVqI/dv7R0jujuOg8ajKxWb8bNWUyP2orqVQVXXB
 9AxC+IZEKocTw/ENBp4WOY62YyRcJNKaZIxcZu250fgsyQyDCZYat5/RZPgzwLWef+XsbEjtJbY
 eq/ZkW5KYKQuaw0P+Q7D4N2VDpvFnsY4tn30nGnOkOPWrKEodoUgwV6DB2lOlGecKaJRC80+rzx
 tq3mmUmtgblP6XohKvVBsAlmSNkYk4FHClRPpIRTHB8gcX5xHlD5ZuE5n3H0Vmr0MSb2HGmF4wG
 b8CwPsRrS2XvRdS9z/kYZ0HwV8FUlrkmsAECKkFDAGt+0q93Ei5HyvX7ZbbPAZReQYfNJ8zSwRe
 X/cKtc3aC6nyXgLftrsKGoxHMeKmlDpfQ1P1Br2ucc6Lxo9fzmMZFOAHt7GGpwry6hIB42tzPnR
 pi11s733x/04JDxDOaP00Y31GdnLenuQlFiUC4mPXqft34Vru23Fi17nP4VfHMDYzhi412aNq/g
 vnHMkYL0oJ1waLCfUPUEGrxfgxzsL5yyt//3p+R1psDNpxwYH0Do9Kzo2VGWcFUzJjqHazK+BIp
 zNT7k+9uDGLoLbMb9KfKmV4hVquysIpRnoEWbzUk4s4LPfQvcECKROKOn3AZkykGUJM5lTPezUp BQKQitx8ZNxlUUQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: V2bGj2h5-8YC-a4EErSkWVbbNDngxgnB
X-Authority-Analysis: v=2.4 cv=abZsXBot c=1 sm=1 tr=0 ts=694bd23c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=zQe2su8OYnrQ7J9-Y2IA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: V2bGj2h5-8YC-a4EErSkWVbbNDngxgnB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfX+NOEIoF1DDcI
 BgUz8tos6fF4iFI/8jUwjpsvrgQ3Jv0jVjg8N76lsNgCk0l+wINw6jRkh8R+yDlNZqm+xngJc2i
 KClFUR1RN1QLtzXsCd9RoIv1qPi52ci8amU44o//v86Ii19vkz0v3uSDPIr5A0G9PhSYZC8rDnh
 OMtDfXsjBe+VU1315xLI1AdUiDXl7p0bTWRwoMi/z23QsP7yyEsVAOyFU7BKAwCbqap9IZ6JNfJ
 4b5HtAJ4w2a8aU1EXLXJCq5o1SSmz9pL6VXctyJET0TMnrGGi8cJUT9JhBSrDfoOmdoAQLGYW6r
 zA+NnIbu33p//WUgGwmejs8TGjjtOslU784pJ/+FhdWH/E+Ilv2MvkxKxGrt38z6UOHSYXxxqep
 pfZMEYtTnQSn3OXlHT7NZGKS94ROuzxX51dN/W6nYo9LAj3954j3AHTyl3I+8teAlETcYJ3pxEf
 nUk0n85gF0MD99amvOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_034501_314873_1E05B0E0 
X-CRM114-Status: GOOD (  16.20  )
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
 drivers/mailbox/zynqmp-ipi-mailbox.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 967967b2b8a9..42d2583e44ca 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -904,7 +904,7 @@ static void zynqmp_ipi_free_mboxes(struct zynqmp_ipi_pdata *pdata)
 static int zynqmp_ipi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *nc, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	struct zynqmp_ipi_pdata *pdata;
 	struct of_phandle_args out_irq;
 	struct zynqmp_ipi_mbox *mbox;
@@ -940,13 +940,12 @@ static int zynqmp_ipi_probe(struct platform_device *pdev)
 	pdata->num_mboxes = num_mboxes;
 
 	mbox = pdata->ipi_mboxes;
-	for_each_available_child_of_node(np, nc) {
+	for_each_available_child_of_node_scoped(np, nc) {
 		mbox->pdata = pdata;
 		mbox->setup_ipi_fn = ipi_fn;
 
 		ret = zynqmp_ipi_mbox_probe(mbox, nc);
 		if (ret) {
-			of_node_put(nc);
 			dev_err(dev, "failed to probe subdev.\n");
 			ret = -EINVAL;
 			goto free_mbox_dev;
-- 
2.51.0


