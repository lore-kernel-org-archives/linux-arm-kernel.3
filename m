Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5A0E63F3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 08:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+pqD2uaUU67HKZHQxNeV1RVw8IiPSKnl+PxUaM5m3U=; b=XVC1lmR6Sb/gADZm5G30psXHNJ
	R2oxEn94lZagKOe9vVPmBOQ3MC0DqiD7Zwg98StPCpFgnWLe1MpEvMtl24NuZknlVuI07zZPdE7tr
	LFq1sBq0iyUWEQj1xqwJBDvGJ7Ecs18VZ7cBH2fjx5702ZqwQTXM4kdaWGOQ2mhP05JN7qv43swox
	ODoQPhzVkkYCrjpe2sMYn7UhTePRBP4AYf4cFaGl0GJkr7LDsSjJc118ONqzTr1HKohKqfShTKKKb
	Ll6jyJp13a6Av9HoHo1WgsFog4f7opAAMI08O0Otl9Gc3cP3OY0KZRnhoA6xrq64gLsjx2ERsTuAW
	AJwAjfig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruRP-00000006CmP-1RMh;
	Mon, 16 Feb 2026 08:58:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruRL-00000006Ckn-2H7B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 08:58:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FLZ1461624201
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u+pqD2uaUU6
	7HKZHQxNeV1RVw8IiPSKnl+PxUaM5m3U=; b=VK8VBdOfGkX8NgoxWhCY2P+tK+h
	8fVeCht+TA24hKbMGJMuuGW+bjIlVFjgGueKNhcfo/nI/UAMMcqccq05PHRq/1hk
	u/WwJaHk7BfWXW7iBAt0mb/WWY9aDIP7VoOYFArv0S/DZOWMyippKZYpbinlU5EP
	bFuugoNd2uhYlfixAEPj0ePO/DtV9nwSxDCdwMOrA4p5ibwsLi14h8WcSd/fRGV6
	dxbuqi5Rtw0bF/S8ZHROn0WGh8Pcc71chmO1LPVuW8UvZamZEKLfVUicrIqPaZ/K
	8PtnBVeWQoKr8DuQuTmtdXQzHG0QlGtxzXf5UmxvUXVfrhwmICrrwfqIvgA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbnv9h2vc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:58:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ed6c849so1638090385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 00:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771232326; x=1771837126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+pqD2uaUU67HKZHQxNeV1RVw8IiPSKnl+PxUaM5m3U=;
        b=cac1vkIpVsuYJnTlAUUYv+iKvF381qhUapD7FzcxdfidyRMRZD6m/N0IXwkwcLRav8
         nZa8UEzh+fA3eWdwr6kdLQ7ADB2EGrn8x/7JUq12vx+KCuxOCS00VhoI3HGBSKxSStse
         /kgbpI5aRaY8cLb8bCRGkDYill7eahI3Gtlz4oZWtSeJeAg6DdPR+nzddo4d7c+oMTtV
         gq5hzrjErnFTIU96l6OoVYUdY14oS2Hi47IaDqTOHPvFSuiHANAl3t+FHTRdPvDhegzB
         r3UQkt9Fvy3wZGRpMKvXyXv539wop31DnEZWVcN8k3iYkDkeYytnc8nIt2md79HtSSvZ
         Gl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232326; x=1771837126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+pqD2uaUU67HKZHQxNeV1RVw8IiPSKnl+PxUaM5m3U=;
        b=Vp8uZivckiVdAYXVaF9FHOX46RtDMohvI3ewPFa6kGH5q2nSsagjYLhdJQPtbn4V8S
         AioSKnB+occ3MDEKzAvm6gWNGkEnu5/Gx5oCqcpP/qbn0uM+ZkhUa/9oWVa7oRU7ZWYP
         G0qnfMymBrsffVybBtOKhrCT0Cr0inCkuOQAmoIPX3OuXtRPjLJbirll6cDepkF45NLy
         NApptDqiexTPViEejS9nqyqJeVljmIyiqMSs86iKbQSnQwXf5eQScTnjPnS3vwEsADkV
         TeCYvMlonG+H7P/wkbX42zuLD+FojOolMIiNTc7jRHsEqYfJ4YxgvlOwLIpm76jRppjR
         MNKA==
X-Forwarded-Encrypted: i=1; AJvYcCXMWEjzxGwiRhLun/ec55QptI+eYs/7yMmGZAY6ajY6ZrTg4YN6vI/5biHX8Bz6GXR56ASZBQRnaCdc1c8CppUr@lists.infradead.org
X-Gm-Message-State: AOJu0YzwAOZZNg+4rqc7q/N25mZDapoyoguT14+304+Mb0yyYLlbmSfs
	fc/SVY6V8UJwg5PEQegaP1Hvs6K4cPxHYvksJSdxnKWMY3UKq4SxKeQjMz5zI27jVDysuxZJtKJ
	8yWd4CPmP5x5NJG1Mb4Smt+OkA7ktBux7g9Wa1ox6VfzTFcIsaZ2bGS81RINsL3Fc/gfqVR8Icc
	7r1A==
X-Gm-Gg: AZuq6aJhvEdk+xCPdCHMVmGefG2NJW4frZ4Zpy7CQr+ZV7jyDXmbCNLxErBTZRsrMc0
	FYxo6cTbQrHCLWzazdbuPnyghlzrVUXbYvIrD/BWJ6rlDFcnVu6hrt394+geqnlf8Qh+GT2VjAb
	7bkAxbrQcGPRTzCxALWyf4seNGzvey8oasClj4p5cjTV79pGQYmbsN8G4IIuiFrXFZLfaDUnUUv
	uh/covTUzyHlaH85RiAnHordbgU+FJiLX5MbqCD9qA8uRtb1ZPFrCyFXuCztmUGcBpb8I6TwvmJ
	PQLMulsygu5U1OfxyO51weOf418pmK3zkm1y2yZlswQrF4GyyftbjSNZuByH5Wa3lRAWNP4UVc5
	C8sy2sKnylfOA3heM+HEynlotPGmQHNjzpsH+Vw==
X-Received: by 2002:a05:620a:4608:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cb4242a549mr1185377785a.55.1771232326032;
        Mon, 16 Feb 2026 00:58:46 -0800 (PST)
X-Received: by 2002:a05:620a:4608:b0:8ca:4288:b175 with SMTP id af79cd13be357-8cb4242a549mr1185376385a.55.1771232325645;
        Mon, 16 Feb 2026 00:58:45 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm27012348f8f.16.2026.02.16.00.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:58:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] pinctrl: cix: sky1: Unexport sky1_pinctrl_pm_ops
Date: Mon, 16 Feb 2026 09:58:40 +0100
Message-ID: <20260216085838.71518-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=IXpadYwC2wXihg+sOOMq+tSAMI1v6TpBlh8+CsXQv0Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpktw/B4SJK8pkURks3LgzXeYbXuwPMV90n6pyQ
 GqUjkvfcHeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLcPwAKCRDBN2bmhouD
 10yJD/4r/Dojzc48CwULWWB5m3R7FNcDE9N5G869tKK+rKRsp15+Q+8bRwoShWOHa4lz4MmPcES
 F7Y1U7QSPHpmxx3W03YqfJQgSqFb8GjKbFPlpTEZkH4tr15bssUSzm/9TrrGTY6JTcynEvpdTJf
 3EhufZPp5+vEobtLBLlza4oIawnGV7klDNJxnpdYmPAUtkmZVqmKmwuiMm0dyFdCgj/YiCoN23X
 3HUCDcl+AsUq8k7JmzSMDYwbIhJzDGCMnQGiAtoCTVgRY9tAuylndex/oMhugdhjMjbDo7W+zoo
 FyTMFDrPSNWct98shU/SNws43qTLKx0zUAcK7eTlYjOMVezuXfPQsGNtJ3PUmVm+kdy1oFcXj2P
 OyIu2RHwVIAkjH3QBlOB6aKUx0Yj/yOHgjqMZee9GSEtjKhBVD9iWymqdNf6PUgr48D6CKakac1
 AmxclDlYucbuX1jrdi43gV5hOjAdzjvoJ1oo5wpJlVDiQZ+HFRAj3RxLhqpvzyLyfoslf+xo6yr
 xGK9aAyn9p/+qqHqDbsAdLtp9YX1KhO8uY9kEWE5HFC4DYq5crwi27YX9UyFWESCnLIbQEO/K8B
 hfckRAS7fSM6CAo4oA9+Dt20qJ12UA7kmoGxe7rDHIGwX2BTvPe+Ip0o3HU6o5xOvUYjuAopDuc N3YvY3dp46qdWvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KmDRIY_8Bono3eefhx7r7uR-dNIelNCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NCBTYWx0ZWRfX79YngBRm6wNM
 chlbyHGy5bffYMKXEcUqd0QJdg9wJDNvhXnadShh/l6RvLhEUveIUdAQgfeND5mibSDbQEgLTTL
 VIl2R5rhf01qXNP3K0mG8IkU76iMRXkRIL7Y4G1lJCpuN24CDERtrPRKg/tWIGtXM/+uZNr4EF8
 LcgiD5vin6PpI52Ody3GuT6ToagwlSQxnFX5lzN3fRVtLg1+7J/+nzh+PT8q55H+hhq0oypUjmt
 oJSuX8R7rX5zOjNQymkHkacqQe38NvvnoelyebdHQu/BGmTanjZJK6+zHSMfV7ZvL4ZHLn4YRFM
 bT0Dv3pAEDLRQseA/bYi2mBQFPBKOLjoOS5GBmpLC/E58Bea+WicqCDoahAZ56bIZiXtAhMMfRF
 TOpKMy0fFQZDu0nQINki3G2vs28vua5PjNW0mKrJJYs59BVf/K59ZAGpCF5unaNko6Yg7kVMY5r
 w/WRhj0/qj4Hhh816GA==
X-Authority-Analysis: v=2.4 cv=b7K/I9Gx c=1 sm=1 tr=0 ts=6992dc46 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=JabwrOi8oxoqBFYtomwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: KmDRIY_8Bono3eefhx7r7uR-dNIelNCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_005847_701681_F70E96D9 
X-CRM114-Status: GOOD (  15.49  )
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

File-scope 'sky1_pinctrl_pm_ops' is not used outside of this unit (and
it should not be!), so unexport it and make it static to silence sparse
warning:

  pinctrl-sky1.c:525:25: warning: symbol 'sky1_pinctrl_pm_ops' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/cix/pinctrl-sky1.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/cix/pinctrl-sky1.c b/drivers/pinctrl/cix/pinctrl-sky1.c
index 5d0d8be815b2..938894058d86 100644
--- a/drivers/pinctrl/cix/pinctrl-sky1.c
+++ b/drivers/pinctrl/cix/pinctrl-sky1.c
@@ -522,11 +522,10 @@ static int __maybe_unused sky1_pinctrl_resume(struct device *dev)
 	return pinctrl_force_default(spctl->pctl);
 }
 
-const struct dev_pm_ops sky1_pinctrl_pm_ops = {
+static const struct dev_pm_ops sky1_pinctrl_pm_ops = {
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(sky1_pinctrl_suspend,
 					sky1_pinctrl_resume)
 };
-EXPORT_SYMBOL_GPL(sky1_pinctrl_pm_ops);
 
 static int sky1_pinctrl_probe(struct platform_device *pdev)
 {
-- 
2.51.0


