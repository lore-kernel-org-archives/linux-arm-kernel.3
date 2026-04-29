Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2494CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 18:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b81T3BirliBEA4Ca2PjKIh2zUmRWNZ6bMgop4mGPNAc=; b=MTynYleFZnKrlccsvjr0OrksQL
	RqCDwk/0q5cqLuROVfyDvbuj+gaXUeUMhTQrVA0CGFgjF0MAo/fJx+qLXvkhuz4p0UxqSFK7EbEWv
	NCDINInhOVw93/OBPCUieovpyfFu82C/lfQqDvn3h40iNAj9EN7CTDUVxK4L0zxbh6vUxtUh4UkbR
	NTKoKaRfjnqGxSJhQrkb2KL4IFd0K9BM5j5gUWWg/AdnoMmOqxtXe6X7YwQZ2naslqSwuEcdpMyCT
	0LPv2SCRyh1I9x81qA2elknOY7OnnnZ7yPx0TtmXw44uyRplVmEnyvDgiCrI2Uu9ldrCL9xXCVizR
	BhFjunlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9ze-000000045iV-19pE;
	Wed, 29 Apr 2026 18:50:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9za-000000045h2-0ieC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 18:50:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEQa641795831
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b81T3BirliBEA4Ca2PjKIh2zUmRWNZ6bMgop4mGPNAc=; b=dCdYPvhtHeleA1bM
	IB02IA9SLNy31LFBzAWoWW/nANl02OtGwlnJJrUvYUNZCFgYUgkOjky/D5R2lY1j
	YqqKr99iH4CZoYjpnOPdM9GFYCLFgHLzlQ7SnhA0rkHOqH/oODKeqIfQ2kCdjxwE
	MrSFDZE0ppnB8FYepiKqN1n8LE6wEr0eHHwwhgaax1Ske+vMxk1OUZ4DIdKsrZj+
	Txu6kWo66GYPgSMLpAvE4ThCUNGmgY/Fq4zRZjp1fQ8Ip2loT0LWdkS2qO+i3wmB
	AVUSxQV1yeTciOTBxTZGMWMAzU35BkTAQybSOo2o9/PdgRabz7pGrLVPzzHJbjB5
	FenNgQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dukrp1449-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:50:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso4138201cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 11:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777488637; x=1778093437; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b81T3BirliBEA4Ca2PjKIh2zUmRWNZ6bMgop4mGPNAc=;
        b=hNyuWOAwrATaIMHRu4wjZn60eo1l57AS5inqVcuKtYW6TCWEEubyOVH+CgDePiMNpr
         sXccy+cUSn33iQJy/3H0c7W+4BFsKL7CkCI5iceRDm8ylMzzcIpAzwQ13s8aj0wKQdHs
         nIMU3TvFDRH2umlEukus9mkRniFcYYNQgIW9VKP20/ZlEFuwAGHYp8QmDhT91MM8Oh5W
         KpU9D53ObFo6SeLkHamWejWYSIShJDT8jIPeWS+WQUBVCfGSsCJ+9z5MsB6BGXkgEuOc
         YOH6zKo0DP2wMFdfG0W975MF1Bvtc4FB24a0vzHmU13wk1dLmia7c2YHjz5tGibHSqPR
         OKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488637; x=1778093437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b81T3BirliBEA4Ca2PjKIh2zUmRWNZ6bMgop4mGPNAc=;
        b=JJLtoKFyC9U4KyriJsZ7j4FsR7MI2bbF4/AedTvwfzRD8cUnuhk/NumqEaMVS3Zzon
         OW+Tvy+k1dioSgGBzsLxGyK4Y4gEHiiC6/wo84ioZFVmfV/hFCBeRJ23hn2mhVn/qZia
         YWyDRakoHl6SNLZoOrf0RCGvx34lX0kq4p8vFgfWCSuo2FszhgX44YkyIXrKfWF6MC5s
         nxspKRG+sYtPZ3Fa2vmzM0CBvglECDMEMiaKmnm1xPgPtLzOILBeLN02EXA3m+jd0feR
         zJPc3xEb0NJX6wXc0tj009jtN5tAy0rH51AGrIRqlmQh5FW/s0Blvj9FsWhhGFZhEVyU
         +DVg==
X-Forwarded-Encrypted: i=1; AFNElJ/lhtVWWTMDhxJ4HsDvXVnV4XvBJBZBPpNesdjSxPGgBVXuNpRyNsCAwCuCqi3EkN22HIWVCbTjOjONk9qcIueh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl5jsGnFAOKxabJgdKlBF/FbtLcBxtIevp6pXheqmC3KlkWTXP
	E54N6cUztgLSfBK+1HulPY6a6ED8V16FsNUUrLx/MvlbLCewIW+WjrW0MymMNigdg257KvXf+Pa
	tjwAlOoN8i7zG8jXlbyqQasmRtnCUNEqG2JaCjYjl69i9w11krWmJ4sUEaiQH9A3qilQYHbQ0Zt
	CtQg==
X-Gm-Gg: AeBDietKwrVdekkRDyi88f2/DV2N48zHFpBgkK+mjtNgFAwqFKK5ajbxM1RgvpnlhY7
	BZXrAgDC+308ap3RnmgdvcEygGxJzjcjKj/J1HEs1sw4kgLDJ7DgvcvM5byN2Av/GiErlOt+5bf
	Njgu3u7g7xpqDeOeXhROBcA07/nvcGDpo8A4fMd76+sHwoQtf/YYYmQqnnRJvcI+c0EqrglXBSW
	f5YHS93OHon5rBj/e/cdZHtlyI3LxHvHrzB3BJfDiVb1r5q1zDY02zWMvOTlgzcrSPxSz0A6LTf
	nEkyrxzuGUmNhJ5xlIWcCPzlGT7hDb6EooPxtIkqTIvrHIOG8X9tF+W1816GXVLivzumsIANpTB
	Bk9jEOfrCQoM65j/HZ1aiaCSrJ8Pc40b49LDyOz5meI3F7/nIA1Bkml0=
X-Received: by 2002:a05:622a:8c08:b0:50f:ddba:af82 with SMTP id d75a77b69052e-510199faa91mr48517031cf.1.1777488636780;
        Wed, 29 Apr 2026 11:50:36 -0700 (PDT)
X-Received: by 2002:a05:622a:8c08:b0:50f:ddba:af82 with SMTP id d75a77b69052e-510199faa91mr48516651cf.1.1777488636366;
        Wed, 29 Apr 2026 11:50:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301b7bsm10525115e9.11.2026.04.29.11.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:50:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 20:50:23 +0200
Subject: [PATCH v2 2/5] arm64: defconfig: Drop unused legacy netfilter
 options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-defconfig-v2-2-e4ed4186028b@oss.qualcomm.com>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j+LOW88eQiC5n+Qsdr/dKLNgPzXRFoM/jOnnt+1HJXI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8lLzB28YdnwArPhetV84UVHCs4XDHxtvf6mUT
 2DX/V0xin6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafJS8wAKCRDBN2bmhouD
 11UkD/9qjBkdNjsuVieru3VpL66vJGz2kSPicEX3Q76CcVWFlBtDC1MnRuqsQJm1ZqdMYGs5rgT
 9pGMuY3yV0GISmE8elAD5Gq9aViR4CuDDpRaNtzsrtOgnJAUDV6pQW+2YeTDiK2Bm0JJHJHhkCQ
 QsnsvWCBadTF5LSNZcGsUUIQxYnxCFBnOOxLIyKNuJMkUThTj1iIVWR7j+Y7FuH3pMN22O4TceE
 1riwQk3ppTq3I5B5V2sZpnnG1PX/Qi3y1Rkt+4CalaAALUrf0I0SAxfl9P0/X1jrEbydSxSMZkY
 0YsZiBHEIGVB9tH8KCPBkdWujYjC3CkHNQgvyqA41vbEZ5UbxRNt8i1K9Aik37cCXNx5nLyuYc8
 jeYjzKlzYodazU7ShhtI+B5IBj2d6sb0vK4tjUfAUrtlxfbKmINlRuZi57lkjdXQ9maali7QfK/
 pNHgHEL6bEKprx266N3Vsj43YIZNcLgzee0eUny1PwSAMQrej3SJNDvu0aqVx0aHObhOxsLOBzs
 FHTvvLHjidAxBgMB+pVvLHKlIPqMN0/kWSfUPoNlK1BvzgFhu0xIJIOvdZMhUB5VgvQXetPZgbd
 KrHDD+9Szko8OBUhEKfIWho7AwAkkR+rmzFZdqi1Wo8yWRsH9r5xIdPVUE6CURbQOZtw3HBn/+l
 ra2utMWhlFkfXLA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: JlZjDuzrsJlx1TgAdhkTsTreGLa-QDoS
X-Proofpoint-GUID: JlZjDuzrsJlx1TgAdhkTsTreGLa-QDoS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE4OCBTYWx0ZWRfX2Es2G3e3WWfz
 GwqdgIh7/ov7TeuAD4b1B0C2xo0bfeiqQRy3WuZbhNO7afnHbaPP8iHH6iR+vWPlwOohpVbwRF5
 duolSZRT8hGgpXw+PRyovPQdCIpWQRLyrxAE+A5Po2Ffjlcd0K4ZZWIaCsNgca1mzdZiQjmPHdn
 VMrzc0NXKlBYZNuLRo8cEMK08DCiIM26Xs7ZPf6lGfNNNdQpEGumY+vMvkqUbUZ1kZKBO18Ojye
 Q/iSuTeBemeD6W4EglWljXl0daDrWLKBS79O5HS3Cu/sRid2tWFOJW/OCItlXJ4XMU8pTkUuCUQ
 ZAI+1/vbQhWnLnQYHP/tbQhwZJqJ/iKU0nB18neQsBEnIZQUXNPLnC04WBYKc580EtKkWBp9FNK
 7xm89YqynsbZeEsNc8K1GpCRGrzfejhE7Ntx0bWxBYyhbqZBP3h5o62sONs/jmUfczs0cnTOTAK
 sU3K1LjUmHYD0FetDeA==
X-Authority-Analysis: v=2.4 cv=WoQb99fv c=1 sm=1 tr=0 ts=69f252fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=k-PMdL3Rd_3TYoQcjAcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_115038_215964_A456AE0E 
X-CRM114-Status: GOOD (  11.83  )
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

Drop all options which are ineffective now, because they depend on
disabled IP_NF_IPTABLES_LEGACY or IP6_NF_IPTABLES_LEGACY.  No impact on
include/generated/autoconf.h.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c03ae2c767e..9a31b258a56e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -155,17 +155,7 @@ CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
 CONFIG_NETFILTER_XT_MATCH_IPVS=m
 CONFIG_IP_VS=m
 CONFIG_IP_NF_IPTABLES=m
-CONFIG_IP_NF_FILTER=m
-CONFIG_IP_NF_TARGET_REJECT=m
-CONFIG_IP_NF_NAT=m
-CONFIG_IP_NF_TARGET_MASQUERADE=m
-CONFIG_IP_NF_MANGLE=m
 CONFIG_IP6_NF_IPTABLES=m
-CONFIG_IP6_NF_FILTER=m
-CONFIG_IP6_NF_TARGET_REJECT=m
-CONFIG_IP6_NF_MANGLE=m
-CONFIG_IP6_NF_NAT=m
-CONFIG_IP6_NF_TARGET_MASQUERADE=m
 CONFIG_BRIDGE=m
 CONFIG_BRIDGE_VLAN_FILTERING=y
 CONFIG_NET_DSA=m

-- 
2.51.0


