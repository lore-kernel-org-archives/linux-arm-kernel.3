Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDC1C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8I1/Kcq2wTtdkN6wD1LQv8zLgBo2meOfdflh5fSBbdg=; b=R6TlkQlTTh/a7MHCtjloXENjqT
	h1WKCJYH03/Q/v4w09uCIbkfbEDn+GgR1g+Tar66Nj69t/XZydj2N7wJAWH8cVedLxUZr8UL9pktJ
	RuChnbBTxhBviwauGwGFgIJMEJ53UNC4MSrf910BTD2koJMsw71KtdIg2OFi+Qo6gnw9XcsVvhKQj
	BaLJzKYoreMS3NKSJ2BdllaxQ+21JPgKX2UgJ4PgKEloAfPprMAiCTHOvyHQEbx+d+3mKvO3YbEsd
	mnDMc4/Kso0/hwb0nwjh8dXi7jQySPRsclNcj8GICr/i1DZm3j/MjlNEWMAS+8/q/Glqs6bmmLacH
	yKHKAikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL0P-00000008BfT-11nJ;
	Fri, 07 Aug 2026 13:53:01 +0000
Received: from mx0a-00823401.pphosted.com ([148.163.148.104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL0M-00000008BdU-2NJM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:53:00 +0000
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677Cg7jE3328354;
	Fri, 7 Aug 2026 13:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=8I1/Kcq2wTtdkN6wD1LQv8zLgBo2meOfdf
	lh5fSBbdg=; b=0PESK2S0/Yy0IUoS6zcSOn47+TxAt2zlcIWxmgYPzg+6jNqlOa
	2Y9rt8/1LjunOeim0bD5/+XqtrAlvtc5gHY/Q+0MYJFuz9u/077dRRDt0cFb6Coa
	99h/tfqF6oZRtBUfz8kcQ0It2fNglSD/aCTFXy+O7/Etl8OibpKGW8YvWS4HH+XI
	fQoePfbej9T6TsJgl75ZFEBNRoqu51e+nQGZFigiPn1O1ykQeuuCOS/pxw0PzO9C
	Ku7oq3d0Bv/2uChSMNGVjIymkTS9+rf3crc8AAk45VhxeQHqC/neUeKp0hLE5hSs
	V82OoXflh6SdyG33vfczw6IgN8qqNaxPyk5Q==
Received: from hkglppfpool1.lenovo.com ([103.30.235.218])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4fsv8fmuga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 13:52:24 +0000 (GMT)
Received: from shelppfpol2.lenovo.com (unknown [10.122.146.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool1.lenovo.com (Postfix) with ESMTPS id 4hGlvS2ztpz9vWNf;
	Fri,  7 Aug 2026 13:52:20 +0000 (UTC)
Received: from SEANWANG1-P5MFL.lenovo.com (SEANWANG1-P5MFL.lenovo.com [10.111.201.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol2.lenovo.com (Postfix) with ESMTPS id 4hGlvS3Fr5z1Mmr;
	Fri,  7 Aug 2026 13:52:20 +0000 (UTC)
From: seanwang1 <seanwang1@lenovo.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Beata Michalska <beata.michalska@arm.com>,
        Lifeng Zheng <zhenglifeng1@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sumit Gupta <sumitg@nvidia.com>, Yunhui Cui <cuiyunhui@bytedance.com>,
        seanwang1 <seanwang1@lenovo.com>, Xuewen Yan <xuewen.yan@unisoc.com>
Subject: [PATCH] arm64: topology: fix arch_cpu_idle_enter()
Date: Fri,  7 Aug 2026 21:52:16 +0800
Message-Id: <20260807135216.9919-1-seanwang1@lenovo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEwOSBTYWx0ZWRfXx2g74CcpiFrP
 pfZELhffJ89w4W3aUUqMVo6Qemxt4FufVvjJ1zVI2joaRO+ZOM8AAhUNl5FizjG5PliWbEruVLi
 9OgJeykpQr2Fc/1putJc0Yi9blamlR0=
X-Authority-Analysis: v=2.4 cv=S4rpBosP c=1 sm=1 tr=0 ts=6a75e318 cx=c_pps
 a=yIlUyoB/d3ZP/uZUHEUQoQ==:117 a=yIlUyoB/d3ZP/uZUHEUQoQ==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=QJilI6ASod0cdCKXAsqI:22 a=icsG72s9AAAA:8 a=8k6WQxmsAAAA:8
 a=U8D9tqgXR_jVW_AM60IA:9 a=T89tl0cgrjxRNoSN2Dv0:22
X-Proofpoint-GUID: PaXA2szFPI5f0005y_rB74iYVah3VEOh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEwOSBTYWx0ZWRfXzlArA1aEEG3a
 l422sFIM7Fkh1srdX0HWpXEOfgVGwm7WmJE7SgufDeCXHfutmEVGsOClnHnyHjvYR2Ysd2CWd3n
 //5zMf8gIIPZsT4M7mecxZvmYnKzDIkVXFkNBA5TFU67ymyb87R95CtsYCN2+K0bZu97z4oL7NX
 7gQX0NqptZXMhlmtre7xuekFNaaO6qCcxalouJVsVzh1vpLLN0QaWi/lgcIVbJwgIl1bUB64FDU
 rVdVws5+g7fgkt+hN83aOtgtzfJhAm7gbktylrsr6Z1jEsps9g61oId5R7drJuGojoR3gxvE0DE
 ngL1GlzUxbM38zim1bSJKTTHE03RyJLQNqLsaR6DjlDNNap0j6yCiUL49QP3w7719I36PRlbTrb
 /4WgwaoWizDjC0ANPhfMxFzVovFfv28EZBmmxyNpq0DLv8zggnNHHD/oBfGcSr8CAR3HdIrLcl7
 Mmw5Ar5+kZXcP7YJ55w==
X-Proofpoint-ORIG-GUID: PaXA2szFPI5f0005y_rB74iYVah3VEOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_02,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_065258_609840_798FE1CE 
X-CRM114-Status: GOOD (  13.76  )
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

arch_cpu_idle_enter() directly calls amu_scale_freq_tick() to update
arch_freq_scale when CPU enters idle state. This bypasses the sft_data
pointer check that topology_clear_scale_freq_source() relies on.

As a result, even after calling topology_clear_scale_freq_source() with
SCALE_FREQ_SOURCE_ARCH to disable AMU-based frequency scaling, the
arch_freq_scale value can still be modified by AMU counters when the
CPU goes idle through the arch_cpu_idle_enter() path.

Fix by replacing the direct amu_scale_freq_tick() call with
topology_scale_freq_tick(), which is the generic interface for updating
frequency scale and properly respects the sft_data pointer state.

Co-developed-by: Xuewen Yan <xuewen.yan@unisoc.com>
Signed-off-by: Sean Wang <seanwang1@lenovo.com>
Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
---
 arch/arm64/kernel/topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index b32f13358fbb..f617ef5c9903 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -176,7 +176,7 @@ void arch_cpu_idle_enter(void)
 	/* Kick in AMU update but only if one has not happened already */
 	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
 	    time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
-		amu_scale_freq_tick();
+		topology_scale_freq_tick();
 }
 
 #define AMU_SAMPLE_EXP_MS	20
-- 
2.25.1


