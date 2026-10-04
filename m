Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A13CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r+9536ubjZAnFwIuv7vJah3WtJ0YDIcg7Gc+K2rs9aQ=; b=tzxXJbQtw6Jsu9
	GWIii3QXspjECnyMEgpJ8jOe5d7m/Bdsz69ePRmMvpzMOzDp4M99R9EICPqoqnVgn/NDlUjRSr0Ld
	xW50MgnITr829V30YGuOuBjK24e8U84aBif81xdLS9hjBq5U88t5PviInvTYUI3A31CGpCz7f7oox
	UHxkLwbMU61Z5u7oC2BCqE/pI9S4j4jVDPrVRjoxExDaQqGIACWfiVc2dhczXr0FmS9F2YX47yobI
	CpTmrn8tVtbbQA6R8hS3vqiQ0EssVMEjELW+1edmm1YSu5Uof90fWgvNQ+GyUlJzJAN5v8WDvuqXS
	VfMcRNdECJU90SLALcig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT2u-0000000FHGM-0mgA;
	Sun, 04 Oct 2026 20:42:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT2q-0000000FHFi-2blm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:42:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694II3hE3860111
	for <linux-arm-kernel@lists.infradead.org>; Sun, 4 Oct 2026 20:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=r+9536ubjZAnFwIuv7vJah
	3WtJ0YDIcg7Gc+K2rs9aQ=; b=Szrox9BHjCbSDvM7cy1pAWuE2n9H5Hn2+2P/aA
	GnLoLOCdBTy23YTCuTqtmmRE6cFnD+XpmfzSYtbarhzObcDd8HIXTttpFk7uwny2
	D5n5+0pYrhbbEYq8Yjj9XeM1m3eV5qtTujZ+Y6+DLVxfijrhiAZWzX9Hikp0b+it
	D3SBuz6izbxWihXL4sFG5vvCk2YSB6b+ISCeYLM3BeN/Es7a3ZXEVkU5yb3m33gv
	IiRlMcdPNaXvgUgr9W8QhUne5m56jQPAFPcO2KbwSWGiWp0+6KqODXHZvcZuBc7n
	43a49lB5cOOADWbEmQYrI8JBCgTzwfxuN9Thta6s61d8eLng==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssubqja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 20:42:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so241806285a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791146571; x=1791751371; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r+9536ubjZAnFwIuv7vJah3WtJ0YDIcg7Gc+K2rs9aQ=;
        b=Wuxfm3LV1JwCxb7d3ouUUraUoSeUrExehPvzMEzgFSN71B5MwD1wbzvybofq3g6niZ
         ZFpgBtqy85VK0yB0+0nP68ZOXHOBqoapsVH1EyLhvh/Qqb2TJQLGR+QAFL4SwWoA6A0U
         Ql7JCym6UWbyElUGf8tPT8nudnKWfkC7KVVdNChf833dy/4wIpT7dkukcHMIMSC5k5wh
         +9lxkgixEHOkOA50jUWwWoqjP8CZOd+2GjErB+EWzhEpkL6PzDnA88jnMU9QazL3nUJC
         +NHs74UciHEYCvNAkZUv0fpqntjU6e7GicZm6/0r8YqAmdNTYWymdy0qYgFb68fo5gJo
         1LUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791146571; x=1791751371;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r+9536ubjZAnFwIuv7vJah3WtJ0YDIcg7Gc+K2rs9aQ=;
        b=yV/NI2Kzx3As5j9OtN6XPYrOw+qP8tYtKHH0zSzmlDq4+XIpQ4jc0o2yF6A0iUvC8f
         Bs0s1UtVUynjW01kiPuxrLsWuacHtmxZktdNC3z66DmuUry1omNYySDUooRpEDHkYRtJ
         lRwBr2JhwFiVtlmv/mpzE4lsVkhWjqvZK1DkHBrWvgS97h8kTM/pAJrm8ovLHZcevaPv
         y2aM2J2iYOWxtiaZAij8C25/ht0cogWS9cn/KpVMdWYcXRHJqFlnVqNZWvXCykTiSFZv
         MFkUK4aS5GDQlBPMjPuVYjF2x+jMgaEMueu8SMz+BEaOFzmfZ5tkgJDsy4C5W+y1ujei
         CzSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXecGsjcOLWbp6TZ/Er14NN9PHZqLUiER0sxfi0IFYB0HtIIl8Cg44oDixcmsQkfqmVM7bn0ThO5QCpPF0Pmsi@lists.infradead.org
X-Gm-Message-State: AFuF++nDHcpAA4sozBo7eUDMk3wQpRQ4KlLWLf0kyHR0lDcLPs/exLj/
	I4/B8N5wLbAc8hNdtfdpPq6MTkydGJGF6c7fWJ93TR4Q8GnhwzWoJhsdafWa/l+PS4GLwSvAfPY
	6oVggVBNMgLJq2Df0g5+iuDyHOZRiBuoJ6jxnchWMAFpwe57bD5t83Q/pHCgUN/CTOIB9DV5H0/
	pyDg==
X-Gm-Gg: AYBFou1+z3N7B2EOmGQsK/KdH/Y2e1L6o7o3+DcAZbKgeXiuKcor/6TXOHHTlc3UHgC
	sZcpWqgb2mVV0Wy7hsalx9XPSWoaJ9JpZQce5awmCIcfmomzIWcxCRX+nVk0zBA4MXANW5KrJqP
	IVlM2/amhRmSIdAjzkBEhRsKd+i0KsfQDH6fQROVZ0rvJxRaSHO4DW+YiNzdrlSbEX6MdgPqCYI
	mI401nahjzzBpVatmfuuTbcOQIKGVdTnCdw8XDh/dGXjSDyhjaW7NPTSeEuuOGT9MrYTBMtTBTw
	0moUQJML/Srp3Jq3QL2V8m6qonRUybm2tHYi6FbHZjMVPJU4gONXtmdRpq3jnrMGFCf/FSqby5W
	dH5ylIey2u9YlfA==
X-Received: by 2002:a05:620a:4397:b0:93e:516e:a8d2 with SMTP id af79cd13be357-93e516ec2f0mr1017728385a.4.1791146570698;
        Sun, 04 Oct 2026 13:42:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4397:b0:93e:516e:a8d2 with SMTP id af79cd13be357-93e516ec2f0mr1017725085a.4.1791146570116;
        Sun, 04 Oct 2026 13:42:50 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38307190sm19496719f8f.45.2026.10.04.13.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 13:42:49 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net-next v3 0/2] net: stmmac: introduce XDP rx multi-buff
 support
Date: Sun, 04 Oct 2026 22:42:00 +0200
Message-Id: <20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQ7CIBAF0KsY1tIwFGnrynsYF7QdLIkUBSQ1T
 e8uYWVMN5P8/Pw3KwnoDQZyPqzEYzLBuDmH+nggw6TmO1Iz5kw445J10NIQrVUD9Qu1PQUpZKd
 4AwIVyZOnR22Wwl3JjJHOuERyy81kQnT+U/4kKP0+mYACZb04QTMKJpS+uBCq11s9BmdtlU/xE
 v8xOPwZPBsSWy4RtK6Z3DG2bfsCgQxBnf0AAAA=
X-Change-ID: 20260918-stmmac-rx-mb-16469a2714ea
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
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA4MiBTYWx0ZWRfXyN+bdAZS7QBQ
 dbShCByt9vDr3kwLRUcFYwE6sG6eqrxU+99/VBTo5/fwLYV90ynOQNqbvN9TeAHSm3cAgOrOppN
 sDESL8XoEtKZCWM+WSVlSCSPb5pxt50=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA4MiBTYWx0ZWRfXxBzEbKPVqhiI
 XD30jaj+WDzyfKPkEy7uKCQ93M+fJXLrq1OHbzZh7eR2M9dvfpT+GHZq7KngIBGA0WNWSHAy3nt
 ZuAupHyB7xJLeWc9YGnI8Jn3SWObysxNy6ZF09DfxQHBHVitk/YjQbbcTbV0UCNXDDHo4yr8jN4
 oiqTq+3mj5qNNTJsP8TDPFcwcAYskWRMZ6id/ONPrbNzhVodZ1OH3WGial8z9MW9DHW2pBBdjtz
 gtqoQ/icYTZN4k0M9kjjpx/WOXFddOHcARbHfQ12GlA5qtpEx1UJlPjQ+YXaH8uArMBViawQXz4
 ydN/+vv5FJojMtMCaBaRcRC/8rT5yaU7++wadCDo4hzlXIowrBX9rUajlxoznk7g47I91SA2+aa
 fy9qg8H3xsgRUbouBxdPadrqruEQtnnVrq08sMKVAo86FpMuMmFrlST/dK07mfx8JSKaqMefGuo
 XX5WUbSF/v7BLqkXX5w==
X-Proofpoint-GUID: TKS1utTMRT5gaVUbUog4-1Zstg5FKUrd
X-Proofpoint-ORIG-GUID: TKS1utTMRT5gaVUbUog4-1Zstg5FKUrd
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac2ba4b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SNmR0GAD1IuDnH7kD-MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_134252_793800_477B8017 
X-CRM114-Status: GOOD (  10.98  )
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

Rework stmmac_rx routine to properly support XDP rx multi-buff.
Fix possible rx_q state leaks closing/opening the interface.

---
Changes in v3:
- Return secondary page in case of error.
- Introduce stmmac_xdp_shrink_tail() to remove the ethernet FCS.
- Add patch 'net: stmmac: take ownership of saved RX state at poll
  entry' from James.
- Link to v2: https://lore.kernel.org/r/20260921-stmmac-rx-mb-v2-1-6e826e1ff306@oss.qualcomm.com

Changes in v2:
- Rely on xdp_buff_add_frag() to create xdp fragments
- Fix bugs in rx_q state recording
- Fix the corner case where we receive more than MAX_SKB_FRAGS fragments
- Cosmetics
- Link to v1: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517d404af@oss.qualcomm.com

---
James Hilliard (1):
      net: stmmac: take ownership of saved RX state at poll entry

Lorenzo Bianconi (1):
      net: stmmac: rework stmmac_rx to support XDP rx multi-buff

 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 388 ++++++++++++++--------
 2 files changed, 249 insertions(+), 142 deletions(-)
---
base-commit: 14b9ac2f189db8809a3c9f750d7700cfc9d21f77
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


