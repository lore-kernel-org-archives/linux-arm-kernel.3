Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6BDCA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g3lVCKwz3m+1Qgdbpu0enxVKwE6OpVLIOQB3rCyKQnc=; b=MCq7P3ChluROFd
	Bv3MnGMEsVmAx2UMAGbrsIkc2tCIG1h6JrbFOCrHWLIqX57HlMw+O3Yp4qUajP+utviI9JxC3Gk43
	uRze3x62vAbXHNzzTrjmXqbCVs3kMJtkI+zHsofnSAaMrhcooDVdG+L1sumUZL3IXkPZhV4NzuRRr
	utg/TM1wYpTQl79+CaJfIhT3gN2AG1VzW7KCTru3LhmUamVmLSGGW731dS/fV4Yp1E2z0aeuxq30p
	bKGGboAYadMDQZy7W0np9C9VjqC0A9gmNYQz5DNtV/4c9Ffi1umdQs0kroTN3b2R9PgDQNb8E9Q6L
	8rE7F+UCqOCc8SAzWdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHty-0000000AnGJ-41Yd;
	Mon, 12 Oct 2026 15:25:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHtw-0000000AnFX-2pSp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:25:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0JT31686600
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 15:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g3lVCKwz3m+1Qgdbpu0enx
	VKwE6OpVLIOQB3rCyKQnc=; b=I1bG2YNx5jnaa1O7dGKuJIoyEDR3xy4PkZQFyK
	KwRDYeS7uxzflVZpXFChySjV6bHq/+W3tarnYnresBAvSEqlu97WjnSq9LUCoF6V
	sINHBWy36I8l2GU014nOZPluVKuCi3SYzxBbo0Sn7FHwdtvM21Enp3xsrNC2Vbyy
	ulJbQESBxrqkeIvXPQ43vuON5l658vhuXk8T5ZEzf4pPJT5PaALW7SRf+Hdlt5Ko
	XR3BrYEtvSBYfpRsKi1BrRonCmECYEQ6dMcY7vy2OS4LSf3aEdDwgEJ4izVm4YOM
	9lS37cXrpDck6JHZMMXkzBnuEHCBZzh3sNstK4gTbKKiAWpw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc1fgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 15:25:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc40759b2so464887885a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818719; x=1792423519; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g3lVCKwz3m+1Qgdbpu0enxVKwE6OpVLIOQB3rCyKQnc=;
        b=Uubmy8rpYsSC/GLp4Q4WFiamu3Y0jQXdJRhrSSF97kpBZ5aNRX5smRJs6mYPhg3ggc
         lYyimM2VFcsJK3QHRjlHR0WcZwRc9ECFoauIT/XDgih/YVqGvEM3FO/b7DxCP+0fy1Cs
         fkCyWLQ+gSknFoQ5O7e0kXpOg6awKK2Bc1mPQB/klh+lhbD4/UBC/36xu6llqlPHxz7b
         Jm7dbxmdwDFF+8o+0R01dj7H96eWRMRjuGjeDREfCTjRCVSg/bPdp4WFkSqhESucufPC
         bEYKsub3JHyBrueopC9ULc7Yd1d+fwvRPnLOOzpC6rFnratKLx5pTowifSeUHtUgPiro
         q+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818719; x=1792423519;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g3lVCKwz3m+1Qgdbpu0enxVKwE6OpVLIOQB3rCyKQnc=;
        b=GtCytMpHusqi1bZBjW4M2cxqderh/WwXk4N0VfkiYC+f69Jxl0s/9jYbwjtypc8yx/
         yXNBfsg1OBf9UwYgEo9MZWPhaytqB3mHoDhBnHcj3tixbrXPr0yvE6u5LHnLIoeiP5yC
         m6CWUIHmkG/aLhlhoUbB0qJqmB5Xhgn7SsfaVMzzPxRbCYH5+HQL4DAuUKPQkHTIz4ix
         bMSAZ7GrmS4ku3SJTRuhk4XC+Z94aScSe2sxtUXXHfBrH1ekFHYSasRmMXAPK4fMUp2i
         2DWvdEJukeyKs1FgNBVDpHjrc+K8utigr8qP6hWy+9Nsx3rFHt+pOB2YaI6SEqNFUMqg
         29ow==
X-Forwarded-Encrypted: i=1; AKwUvBzIq6+sfr5Ye3CjYnMmGxPrVCmo3nanUkCW8/xuBH9PrsQNnFTOtZXP4ZfIvIDzu1onw9OUwEYIq7R16iKiRUjZ@lists.infradead.org
X-Gm-Message-State: AFq9FYIAarT522fRtqaC1EZAWSXhbPB1LkMs/Kml1oU9bpZXBqL5a6Ha
	aZxN4QgPqE+Y+Yq6trNtZ+MwU793Ph6agjKtu5MxyMuvBQ7nQddKTvjjyYoPgy4Ds7VDt8Ar8W0
	PPq2DrqHv7u6Exb6Zq1XP9Lbr8Nh8A+1lH8zzGWB22FFlfNfESr3tExrQ7B63M8/qTKm6ZD4TIY
	mhrQ==
X-Gm-Gg: AYBFou0jqvfwWVOrfNlZsCAmqe/9tT7YcY5VKYn675n1rI8nHAgzCLMCJYJ7uVq8mHb
	ElhSGnf0gLIzIeTdh8x5/AGK9sb+Cm9Uz40l/jCRC3nFLxid2D6bfdr8L3SVL2jUAHp4Fg0aWJU
	O1ZIL5VDSH1Vm3FoQ9OqtnoBr92c3vG6B6/d20TRCAf3puT7vxMi+UZHqVAjiUgysFovmtirqxI
	qX7vpkijWlteVR7CHMsSU0vfCq8Rzst0ez3YKd7R7KkXFAiidfHYBLvGuRr3G8boBFUnYg+P4+W
	JHpo516+1nRwnF0sN0jd/QwX8eTrYbRZ9uDei+mEGgmr5KO3/cbaMGO4sN5SmTY4deyYzasBxfS
	Uebm++JVbGrXRPA==
X-Received: by 2002:a05:620a:4552:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93ebd231201mr1728165485a.50.1791818718433;
        Mon, 12 Oct 2026 08:25:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4552:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93ebd231201mr1728157785a.50.1791818717740;
        Mon, 12 Oct 2026 08:25:17 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e49792bsm475483735e9.4.2026.10.12.08.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:25:17 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next 0/2] stmmac: some XDP fixes in XDP_TX path
Date: Mon, 12 Oct 2026 17:24:38 +0200
Message-Id: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqEMAxA0atI1gbajqh4FXFR2ziThVWaIgXx7
 hNcfh7/BqHMJDA1N2S6WPhIGrZtIPx8+hJy1AZnXG+NdShl333AGk8sFc9MuHElwc+wxW40Zh2
 6AHqrvKDzDIkKJqoFluf5A04NlRdzAAAA
X-Change-ID: 20261012-stmmac-xdp-tx-pre-fixes-37fd4800b74c
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX6JeqFj7pK5sw
 va2owJgpaHvfZR1XMcamlKa0h0hjsYokKoILuE4qkuudTxCa+Srlmc+66U+zC+9Q3VvVS0bu4kg
 n9rXmrXpMSz4uUEoQAWS0mWzT5KoJqg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX/8z+wO/PXzAA
 BPcqafyJ4eRcO4Fa3fw16ocK6YobqUz/ifHnrcj2z9zL/HlsIM2Va3KUtt1pYgIdRvuZD+VSZWI
 xETf9a1eg1C4U0VChSpdM88QGRr3zWzPk3DUBd4E1DujWEkvddCwpsf61xeh5k8KCx659bcL7zp
 lAqv5ucldySL3JXcPs1Pqe0bZ830XvACRJbgryOnaFOCXiCAnMtI7OMs0LgnTT1B1FuFxWKv7rR
 TZQmc4in8PcbyZrHvhrTRB8kLgosdYZgbhSD6xjc8JF1m9Z8kkBE3sda7eUqG/gQW4YyA3ltL3O
 KTlarqjr8Rr0zO0XppokogYl1PJMsl2NPHP0Mkob/1waSGyoeSiZR178zkj5IuqrTmIERT8XIAt
 KvkVZyIC50282pdbEmXKMkR3hxSbE3s6M+p8JiWomZcVeiFnchkk/ioLDSC6qUV4PDHm75N8Dh4
 4Dx9G4B76Oiq6ty6RtA==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accfbdf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=e8Hy17V4MP4qKruQfKwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -VvHmxe4NGhgQrjr4mN5W60C_RuaQ-mK
X-Proofpoint-GUID: -VvHmxe4NGhgQrjr4mN5W60C_RuaQ-mK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_082520_728417_90354A6F 
X-CRM114-Status: GOOD (  10.25  )
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

- Fix page address lookup for compound pages in XDP_TX path.
- Disable TX checksum offload for jumbo frames in XDP_TX path.

---
Lorenzo Bianconi (2):
      net: stmmac: fix XDP TX DMA address for compound RX pages
      net: stmmac: disable TX checksum offload for jumbo frames on bugged cores

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)
---
base-commit: 29f144016f03608abfddcd6ebaeabafd7aeaadd2
change-id: 20261012-stmmac-xdp-tx-pre-fixes-37fd4800b74c

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


