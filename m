Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFD8C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uRhdawbhyQ6OC6sNBvfH76ZxrTZqGFlWNJLmdegdXbY=; b=I+chdEzKCdn3s0FocJxXNYNIMj
	xqs5zmYG8UhKrzCEiJLfqY8DjX6lr99SyNbsDjidsWgCoxfKpjcYnyPxIouPfDE9RYSNOhJqNZtq1
	wMsdFtZ4JPbRiR0opDNS2dOz7xO0tDP4zzVRCQ2c61IeI6Nk8/1CiEIrJ0tyEDGttdmnTdos/r9DC
	OdhI3QjPIDMgTu7p5Wv9NUUbYWvZs+EZSF2o+sE+7CzzxciKpVxqvO7KHpyIPw6eTj06ORtmvdN28
	nvAYh86S1FTeyARtRmWbdTHQIz6sGsdb8O7csDTqS06bJev6tkr15JNlUYF2hsB1zZwBnarsgVj+X
	gKibQf+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fI3-00000002RTl-3WvF;
	Mon, 21 Sep 2026 14:46:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fI1-00000002RTL-2ILo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:46:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGJOx704775
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uRhdawbhyQ6OC6sNBvfH76
	ZxrTZqGFlWNJLmdegdXbY=; b=i7yowuV13QLEFISq8zrHIeJvmMgErXwLvQBLle
	58rR6Ykg5dbX9j/eB+S2iRQwPejE9LYEmNehYEK975Z1UeT21B0t9iRcimksXzk2
	6M2PoG3oj0CXOzZRurZpN5qvYLhNUj/appGe7uQub+Vtz9YV6qOuPK972FBzEnhG
	QhPu9993l54Wf4fkCwo+eEF82hN9NnTXLuzFVBB3+LlHWPDKPA6dzBHD3sPuO5HO
	hNj7KcFhL+rtYRaE5LzoUu2sjzpxYVmg2UKkggul/BbC2i0hIwhIN80aktsJBliG
	QliGTdynLQMaqsG5hjTj/wRBUmY+Rl/8MMYK/H+6Sb9QujMw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gsfjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:46:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bbd01d56ecso722964e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790002000; x=1790606800; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uRhdawbhyQ6OC6sNBvfH76ZxrTZqGFlWNJLmdegdXbY=;
        b=EDXYaTNfpyOeXGYx66AYizXmhzzdx0XArXOOchBKAsWjyXopiZKCV8uJKSbax9BJAf
         +iVjGCENCjJSsW5JpSqTGHwJOfZT83xH8nzwORQHdvbAe+Jt+HpPTjytCrZqIdWIU1KN
         BqhC3pu7pAl4BX8j6QQWbOmzMOMfbYU7MdvXQ48SY/aLG6AfwXiVJtCMl9W1/tU79doU
         MmsxnrYfO7wdj9T9Ck+AGZbAOuOHRuKnBIgwqRzP9tphUXWQRxZfMj0pDaY4JixtNFR4
         Bcsz38hVEzoORU6E2qusGNzrdgmp2faPO3kPxZ97RA49654r2Z9V5+yBGqrB0LzqC2zp
         og9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002000; x=1790606800;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uRhdawbhyQ6OC6sNBvfH76ZxrTZqGFlWNJLmdegdXbY=;
        b=m6pcNmBUE9k+IX8BR3K7BSruj2e0kYXQ2VWC3s7U2BijuoWglHEjNB2ZZnmYQM51Fd
         Bxf/ZltmFdUpl5r9OkLPzvjx19Icg2w5EFQdl+6RqUkGACIj7zmIQmjf/UcFRdf5JA25
         pe/+z+c97Dm2h62Sbk5b/p4HkIXWibuPmYdS5794pzcl4cMlGbORu4EM+lwPBGJAEIvy
         07agoo3S3oA0LiZzFkSVOXKl0O9Wo9i/dCw/JVOfq6nC3jBC1disIoVuPc6yhbdOTtEU
         6WO7anaJe8Ov9r69G06CAjidYJ1EVQTNkOKguI1bl1DVHR91Cf5HDhhzfGwL5s7GXFdc
         RHMg==
X-Forwarded-Encrypted: i=1; AKwUvByLv31qoUU18PnXVNfhzTahyHZBA93twrU6GwGEI+diHcGk2REJDrx8ezmLjPIvnUyznl1s8vQhAzyR9LkenWeV@lists.infradead.org
X-Gm-Message-State: AFuF++lEE3j0+CwPREP8fR9XIoMDAx3yx/+IBJ+w6nYHKSMb9nkQNKZY
	6klVonDSxLIaG6LoF685oxQbao2SoHxFaC6owIg6UmF7AikkwFTn+P9fU19uX984KgKZtlyrf/g
	MdQBgRlAjoaM90N9+u6fNDEOfs2FbhFN19Aud/s2/mdj/VnMjFf0J5Gpq2A4+8EufYHdBpM6nZ5
	eZgw==
X-Gm-Gg: AYBFou2OhOg2pnz5c3Px17jjuUgltPxMspVM3gskNcnEDQLL/lkVNmNlkhOrtC1hrBE
	IJc2+9Rx1VKi7ELmaSEv6dqOWhJ+k+1PQFTblAkfEQJuazhcv2j5aSLB43Awol0ukJJ1e9cfq5O
	rhpJbcOpFCrW3zAlzwQ0N8UAIz5G/2aPLPCqdGMvtm3Qa1u94sEM+MoXw3Ue55jQ4am68wpMTlL
	TgHagIMlBOcDt9jOme78/xQNAlMObx1SoCWmNohZDINyijJhZw5pPT2g8Aje2J3vgKB7zLGEMZt
	K0HhB5oVIYuAZzxH9II8m4DE3WqoAkoXW0K1uKRcAV0JnP0OFCx1xzvHIkSJQkAHEAAySvGpu68
	WMjqf5mrOxoM5Sw==
X-Received: by 2002:a05:6123:12f:b0:5c7:ab80:2922 with SMTP id 71dfb90a1353d-5c9b591f65cmr4767626e0c.6.1790001999825;
        Mon, 21 Sep 2026 07:46:39 -0700 (PDT)
X-Received: by 2002:a05:6123:12f:b0:5c7:ab80:2922 with SMTP id 71dfb90a1353d-5c9b591f65cmr4767584e0c.6.1790001999250;
        Mon, 21 Sep 2026 07:46:39 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244608e7sm24733825f8f.6.2026.09.21.07.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:46:38 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:46:18 +0200
Subject: [PATCH net] net: stmmac: clear stale buf->page after recycling on
 skb build failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-stmmac-fix-napi-build-skb-error-v1-1-3d54bf6d9bb6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2N0QqDMAwAf0XyvECtIKu/Ij6kNm5hWiVRGYj/v
 rLHg+PuAmMVNuiqC5RPMVlzgfpRwfim/GKUVBi8860Lvkbbl4VGnOSLmTbBeMic0D4RWXVVJOe
 p4WcTYgpQKptycf+HHjLvMNz3D4IexRF2AAAA
X-Change-ID: 20260921-stmmac-fix-napi-build-skb-error-a02a3e839bd9
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yanteng Si <si.yanteng@linux.dev>,
        Alexander Lobakin <aleksander.lobakin@intel.com>,
        Furong Xu <0x1207@gmail.com>,
        Larysa Zaremba <larysa.zaremba@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Bjvu9-HNF2btVlSxsobH88D7ZqZyQjpk
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab14351 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VSNM358jKuvYd8pqHCUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfXwRykLNVqyk4/
 5knlWyPm7p2W4PJIqlm0nBnyuPLEkMY48gmJTtkZQWYxiBdD0GFPI7IHKH9xjqeJjE2COn9wrUM
 b3LmFDmBU49Fb/gvSocYlZgFvHDPEJ4kqx8SmbNu3YGqFg+ArWHgjR8nXDyeYI1rSvb6c98dlnm
 wMmSIm37vZ4u+S3ylnyJ8hLmSsvdXA7riJJG8rUwPlmJNTw7uYH2apQqSgmUUm+omM4GtslwtGP
 D0D37eJykvoY+Yy2YRfJH+C0YvPeyqNUKeVTnVHDO3G4KDXXAolxv1ugC8cJW8pWleyf4Gdmm/O
 yIlXV3awktIm4J+d77LSy1zTtE+M0ltcdVDG91N9dk37pSrxHyFulPBRkwqpzxC3XED57H7x9gd
 FR/jSprSet/vTm3Ni6a0k2MB3dKUM0ymSt2Z73EUmwoAFsdu8EZKB1WnVU7DrlkVSyw1L1TBgAw
 +qMcWiu/a+3eIRB8uZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfX84QnGRTw39oc
 T1ijLQ+cF+ls3aXup3liTVwcSLzfFBFvbXxMWfWACoAHvYL1a/t+VpSE7E/1RScEvRgLhrlTSDo
 X3Z6mCRJ2SJs7ByvdJ8+it+GsTuVfms=
X-Proofpoint-ORIG-GUID: Bjvu9-HNF2btVlSxsobH88D7ZqZyQjpk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_074641_594296_54CBA43B 
X-CRM114-Status: GOOD (  13.93  )
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

In stmmac_rx(), when napi_build_skb() fails the descriptor page is
recycled back to the page pool with page_pool_recycle_direct(), but
buf->page is left pointing at the recycled page, unlike every other
consumption site in the function which clears the pointer after handing
the page away.

With the stale pointer stmmac_rx_refill() skips the replacement
allocation and programs the already-recycled page back into the RX
descriptor.

Clear buf->page on the napi_build_skb() failure path to keep the buffer
lifecycle consistent with the other consumption sites.

Fixes: df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX path")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1fb5f804ea23..11035b7d944e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5887,6 +5887,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			if (!skb) {
 				page_pool_recycle_direct(rx_q->page_pool,
 							 buf->page);
+				buf->page = NULL;
 				rx_dropped++;
 				count++;
 				goto drain_data;

---
base-commit: 1e24c4f2ee44be0eee94092b5d13cbdb4bdf0d60
change-id: 20260921-stmmac-fix-napi-build-skb-error-a02a3e839bd9

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


