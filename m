Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B0FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKlkT6MOaUU=; b=GQ/NQ0kXkff1zDWh3g6jFbdgL4
	Nt7dV3/gmzfTYGnovwNOZ5KhTr3LP1W7IgjN3CkMhGs6Le30/6QzGgDlw39cS5v1IAY5Q7sQQmals
	s0ZdThfSR5QBfKQlF3k4smgrZ2TW01SSPu8aU3Ntoxyor1+XSifiGLJDC9Ld2Ct5NQwLOk4nPpgQi
	5BA+qmWzYnOGjI8WUspbSqssXBUB3H1gYa8QOTiEDejSvLbLat2ytfAZTwh5I5is4mHXGsJV9sqi/
	pUqDx34Q+6mDD4J7dM8mJhPT/T2Re/zCj4t5H8cT7RfBrsiRU1VmHQQZKwYS/ueji6BT6Q21X15Q+
	NikmkCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPk-0000000CBI2-1nBb;
	Mon, 06 Jul 2026 10:19:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPg-0000000CBFU-2yPu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:18:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669p12O249654
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKl
	kT6MOaUU=; b=V9rMRWYcMcbqH+HkNJQnTwp7b4MIoOcJFOk8xJoe/jil3p2ww24
	4Ptl/tjYeblfnrd74NllchoEut1UN8jqK2VNZYrKMejweZ7UcbSW9/SvJ3aZ3f18
	Lz1EUapryrl3z4KX1ILGEud4U5NN7k8eIoL5MW6t3/GDGc5O6KefE34Fcd6V35Z6
	Ypr6F7JgOYvtL+OnZtXx9c21b4e6va0Nwg7oyNyukHLdXBbsYwrzRa8wVN2h+fHL
	M1SOtnvVFPiIJL8CxwyrZKK7CiCL1w1gm3Diy+l1Dzl2mMdEIzBoXOaR0E+C+Jvt
	GdVmHBmn8fTPB2vnRE3MgkW0WhXzLssXf6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gr3gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:18:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e632390d2so540467385a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333135; x=1783937935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKlkT6MOaUU=;
        b=FSwV0KSTzO7Vg8zw+OMHpKY1PSZpsLoCCPiFt2ZRcXiZ4COlO2bod8AHcQaKf4KAOX
         tBrMM3r/5oR/VkNbqYUY0v82FWsMFqv7WlxMEPSPIm9/ZZq1pLH53V6ibHK5skLlMuKH
         rutewhGSH9rFwD+am7USc4qiEIhamy63zc5uZ1S+koOAC1VFDhyIBGJbpawjc11BsTN9
         YyDm0RQjeG8R8TH1LBv5MZwtEE7CxUtMTanH+knuY71UADCtqrsML3ZJBMfDHVfZ3vWp
         RomzgYtSGQNiNkbzoSGs8jwq8SLeAFdgcDtZ+2GBTm9rz9KL0X+6i1snU02mkK/C5aYN
         2dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333135; x=1783937935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQ2GFA5H86orDwNKMXkzV5nogt+smM0zeKlkT6MOaUU=;
        b=YuhUS84vRUg1UBN01xlekgQxTCJ/EXg0P3bGJbbchcrTKXFaXbPswRI180Tqw9Si/j
         5lt4rpA75gG0JktQNj42S2Xq/7QH1q3Cn3NrtnkZHcwxR9Vk7Nx9XliP5FPTklEqILdG
         wdGALi+IHRojSUMu51PAKVemjP0Wf5mwCHxX7dh+qZerxTY5x1blKrJpJXWU2nJXhZXw
         wDe5DhLpzVlCVlyUkTTO9Dk0dIYQVf0czkCJfwElzEOq1fcaoVx+lBEyrAiGcsTe+tcx
         B+xJEvGfwwyaQDN2ugmzl7qj+2PiyIu5N9vdw15m+qE8hj4qpFveKNFtEwxlNqzLCuvi
         C0EA==
X-Forwarded-Encrypted: i=1; AHgh+RrRhU9YNw9vj7zae1BxNTLlGVv84K/+tC20mgmFmq6INN5m0CKbtzbLQMikRPlIxSjkESkKy7c3+Jo7LNXAIVYD@lists.infradead.org
X-Gm-Message-State: AOJu0YwKa8MgP5pbzkAoo4YjEc+5aI/82ALvU5kVM/NraTY/Mhnc65gl
	aM0gvcIOeqEB86QCoKdeaK7Dqi9b7VH+Hsc1mW7+n0T7O6Xq6Wc5/Bzxs4LopuGzdbW9/RpHIQh
	ndSY3DhWQ0ibP2T3wF6AgH7nM+4AjXhaUnrfRYnYLWamNZ6FV6ntV2JBVUG8waoZkTn4aRrN3WQ
	daBA==
X-Gm-Gg: AfdE7cmDOeFSEBhX7CKP3McoEPOGBRZOeQz/ZJO18aSgtLXfmLKbtWTafxMOOWqIX7V
	cwqU5mq9yC+ke3gTJsxbFvZyyZd0MyB+GMJ9PbQr+dmdEk3O198PGWCNT8OGzXBxbFPTrwitx2P
	5DNb/lJkwtTEMV3cDL2qBEnw8g5IinXp18QhyehOM+sD6w/wvMuMdYi+tyYnjO4djpeq+pPI9WD
	ybv9EGN65PPoG1Nq4UYmilWU2qjAGgzS13qvrDnPS4GeI6vW+MvWlgZ5oH2i/zk1XYgAS29MI0N
	SYAfSQ1yoVJHYn52d4nwkX1Aj5+F7mEEixN4fapBnrdEkb/jxz2UCGCpvJIMB5utF2iJbOW50IE
	W3Oi04M7l7QA0hs2rtABeGiupJYg=
X-Received: by 2002:a05:620a:a716:b0:92e:9b26:a6a3 with SMTP id af79cd13be357-92e9b26a79cmr1281414185a.49.1783333135398;
        Mon, 06 Jul 2026 03:18:55 -0700 (PDT)
X-Received: by 2002:a05:620a:a716:b0:92e:9b26:a6a3 with SMTP id af79cd13be357-92e9b26a79cmr1281412985a.49.1783333135008;
        Mon, 06 Jul 2026 03:18:55 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae4fsm24346278f8f.18.2026.07.06.03.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: mediatek: mt8127: Correct indentation
Date: Mon,  6 Jul 2026 12:18:51 +0200
Message-ID: <20260706101850.341418-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=800; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rzcrfrWML2BJ0gMsXtqo1FhFnO4Eq87xgKLk2Ue4Dwg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EKPXfF4cSZKIyPI4Wt9GH830e6lFwLMhVX4
 6zacyVv1zyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBCgAKCRDBN2bmhouD
 18MqD/9JXuzO5R2siOtzFdqAIN7aZe7fxoM9vJFYVLpPbetTusw4uV4kFaRJzus7ny/Ap/PbaIF
 m0obUJn2cutl5muritFapFA/AJrhllMhiqjPqa3uyDLz6lJ/gqwlxcNR6+d4pgNN+N+6Tozhv2M
 hEO3MFdliaca3XuzT845zY/W3FI2OAz2z/fj052/0DAY+AizmTcqMzakTaYbu69oTp3t0iyDG98
 aAXWnHHEq589hUbgqL74ttJsG2QhqGbNwpwvsgT0HaEyNp3S+ue4kq8r9f7V9BtqQkr4MXktJ5L
 1fWFXjEOXNaITrACWrh2oDSeMLWRWyvd6eGA2aT0J+6XgYSKAtgY3cUqOSpfy7wUZpo0Xy/+8AR
 iuWGR9PtGy+OQtBgLBtp6+y1oqBlqQhnN/72jdVIkMHRXdbUK17VJLeiZIJk7c3eS0GAeZBXTA5
 a/4MXtr+SiZHQmL+QJe2YE8Xu39se/3igEQEw+GzRiICV6dWCFpAK/TbzTCN9RHUmdy1c4MftME
 uo3I6jbkqid4vEytvsvuC6AoxfyPWfqekyALgL52LSgucn47FWKIMF5I10p0qpQCRl4Uzt39jYe
 pnX+GhJ6OakCia4A7tZK0mTA3ntMsHef5hiiDelYRrnZPiBhb/wFcwvfrdULOnXTW/wA3X9Kszk VlBMXavxoTrRHHw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Zv_QFpfp-XzUh94rJfGc-jlEe0U63q80
X-Proofpoint-ORIG-GUID: Zv_QFpfp-XzUh94rJfGc-jlEe0U63q80
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4b8110 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tLFoKwMCRvoQtr3NvW8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXyybTBquMD/nF
 am/6GxfyPNYOYa56UKvS1yuMjiZgaJ9Ck4+cGYNVmBqnB9rdVDmmf+ICso8i0fJjcjP3Tur8KeR
 OUqF6Ubb0+fBqUwi3y6Wx6UTGT5VZuuh7yZkIgMAN8Uj0y6+kYhwbyS0b7+4V5hdza24Ph+aJBS
 woEa38o9eqqdCbM8EwHkMu1E8OX1PK92W5akozyCJGRcY3CWdvDFIUuwn4ht87KvNTtrUB8Albr
 ptnR3swrdn2zeUKmJg3cUQHgs/NzN/+sifDQPV/UqG3Eis5Ev6MM7CiKvTVHIhkNtmxsJa9Wi/z
 105nj9+EpuBzCcZF2aRfD9qScDcxIJ0n9tadFs21XSerb7kAtZBxexZVdlc97Le5DXQvs5jFp7I
 GWrUIXAHtmujvJEDPLjZ12CHnwRIYXZr/ebwOxx+XEm2b6ku/3qGwBRLJNG34TPdp0pLGX4mjs5
 /dWpcNSHEBUFIC2hCTA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX+or04PfpybVQ
 ZruhvVXFXx+x02tPThzI00xVm8FBhSnvdwk7GiLADyorNW+GANIXKrgByo64VMMXvmmeCVtSwYj
 JjNJUDtM4vqLQtXKFT5XMaFquQD+oWU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031856_757544_E3DC492D 
X-CRM114-Status: GOOD (  15.15  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/mediatek/mt8127.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt8127.dtsi b/arch/arm/boot/dts/mediatek/mt8127.dtsi
index aced173c2a52..bd61ec7e70c0 100644
--- a/arch/arm/boot/dts/mediatek/mt8127.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt8127.dtsi
@@ -75,7 +75,7 @@ uart_clk: dummy26m {
 			compatible = "fixed-clock";
 			clock-frequency = <26000000>;
 			#clock-cells = <0>;
-                };
+		};
 	};
 
 	timer {
-- 
2.53.0


