Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8059CCA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 07:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKxPJeHaul4WGcorf+peGk6s2c2jregG736LW2nonAg=; b=Y75FwN+vCIiNd7URd338sc0ShR
	F9fHNLNPZNzjN8kSNh+4rdRdvPJxh/lMoLYt0yjbaYtwIBio9Fxy7M90pvBGtNZe/93G6mdkAf2mB
	BJ6Ajp0nzkzn0CopO9ObvG5csJFDD0Aec0Rz/A07m+5x814lJaDW26jpPjLEl+UxsS4szND92QGrg
	BVcDlv9R0IaUM8yvSwB6xRfaAYwCRCy4UDXdk+vvKjIblutAL2wXYm+yJaqV3OKugxnhTAEUkjQq5
	LbmpG4ra+S0MCYO5vq2wduI4OBwKrBgP2vjMANqXWxYH88IQQAXg0diXH1hadwppknacX/UNWoZRx
	TXZL8tow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGABa-00000009onO-45UC;
	Mon, 12 Oct 2026 07:11:02 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGABZ-00000009omv-0mxW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 07:11:02 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so1020110e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 00:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791789059; cv=none;
        d=google.com; s=arc-20260327;
        b=nCVygY4a6MzAZK6XxZruQAyb3XqZejP9TbFwxHNusUXxMjdiExF+IXdOwnnd/pznwH
         USi/O5xjIyAQ+6qXEWr/Tdoe1YTPB9d1VY4mVv0nMrY3CC43UlFO5ZnHvLrTjYEoM/6u
         ROyVJu6TCWURcUKzRLd1F7oIAe6wCeyifi9jOFMtwcYkxR0Ii7ZkOr0/r55nIhaBC63k
         fncbh+qSqK9FJZRsKVS1xR8ghPqifA+kNQD4dd4n2Ha2W4Cew2zirP019Lb5tXl9zvmh
         kFSnYcRsFzmS+BRv3WBUCdOXN6JjuxeCwfVzxyIdV+iXvERFYjHrDkvHW2hIYDDsg1wW
         8YRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PKxPJeHaul4WGcorf+peGk6s2c2jregG736LW2nonAg=;
        fh=kayMY0/Y+CgK4IoGZe+21tINfiutzBUWTO72SLD0XDo=;
        b=ruSoGupmImgViDpxIdrL4MNV4hZYSyESfSLgEdbE/cvXY1KdkBRh/pXm3kFrWfR+Y/
         fSdUWRTQ5ljzcljfZb5vsFQnw6oVMRnXa7IZWszJjm/Lh1Zcby1pl2OSG16yNwmvHxgb
         i7YA4zEfBHo/1XUYifgitb7cPWFVm5o5BIOXm8p95XFb5vi2GNjmSBkg76qz0QPVND5T
         KbhEcVfWlVTPQ262+jlqbfCr2GAQ48WSxL0U/xG+XngXbrqZKiOLPbv4EKErPJV9iqXq
         o58FxTn+v18hfdAjJiJLis6cwNhkjkZp+q6yUL/ucSWrPQJPAJWLgZVIe8DCg9cPMR8R
         Zz/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789059; x=1792393859; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKxPJeHaul4WGcorf+peGk6s2c2jregG736LW2nonAg=;
        b=b146L7uwbRt2GjaLq0mZWpMjNg8iqACLZWJlcEbcL8XoFvCNSz5gs52s8rT4Xaui9Y
         fNRYSiz/0xzwsn6TMEFlrlF082GQvUnn4uq9fpfWAQ7B2yupfoYxlSaiifIIuw3Sl1w9
         ROIuEJMwavnvyYtvEqZgvAfY5Wxp50t6nRno6jWneAKsQlYptptRgzuCdw78sUCZyrZx
         G/liR3SEVK2lnefr7fnuD3ThQfhm+1DKpvXZCy1y+0Upa782f/Q/lZ6D+hLp+OgwFp/3
         CLPi49EHW73jokkigxYb6Z7bS3YVdBMulCApfn7g6jkdYL3A7vVhwY9O5CSH8YTMLDZS
         iyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789059; x=1792393859;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PKxPJeHaul4WGcorf+peGk6s2c2jregG736LW2nonAg=;
        b=V9JH5x4Jp3puQk9ygT9s8dzkhntGxfb+EHVAMKKfT0qK5iQlvOP69eYd7bwx3+rm/4
         wiSCWS0Yll17s8RhrDC61HYO9fBSwfvoeJFwIx4mmHodYyeiI77ZDHoOcFir/rT7icgd
         /UeZJvW0nYtkglHNv4NK8glqGoxlpLInC2AC85I/OMlnMnjWM0TMsZlSks+u6vNHAT3p
         J/IdMEU2GDVwMmaRIJ/GxrcdVSOTzatY0l5QfM+bYrJ9Ydbm6u8HYXmSxUR936C8wiHK
         nepSeU8QIzAalpLCrV87T3APe4OlJQ5p946L9Ty6Vi/dZg+DMZM0YTf6JdThQ3jgYD7f
         634g==
X-Forwarded-Encrypted: i=1; AKwUvBx1qcmbKE22bTM/k5K1+hzXFxzW/KoywRXhFpgQ90lRlQYKEaEfRT2W9/esO+n/MYjHdPRhiOS0d2gKwBglV7nP@lists.infradead.org
X-Gm-Message-State: AFq9FYLR/jtFwG4OJMSGRBBXNqoX2Sggg7FjF32vSmoaXq++AuGXgFGu
	BIYA6gkok9w4EzWmzptHF5/duIsCUP0/LJCa5mBd/IHiRX4H9VAAQqG5x/Y5RR6sQRDzfEDoO/Z
	lbh5pIAD1PGOkBD8GQ38LNa4WfiFo66sfJgtkclaAkQ==
X-Gm-Gg: AYBFou38i6Gt8ZxKtoU1berRnPclvB8Zwosm85yp/5VUyUcdjkDXBldCFQEC33OFFai
	He7xKajctyYTDuD/EATkhCabIEFU5hMtUJ0uGTNP+j4+1GRLgsdThZuPRtkgpcqTddM9UGPe73A
	iZW4MLqtIHmfhjiYrEn221aU+FCiRiUcOQX8xGCuEYmguvPUzL8aKmxkMKCNFdc5SZAiQg9qX9J
	k6hr7jpSPvVwHBGkbDlMIhbmnlzAc9v/u6xtUFe7SivWYTje/n8wz1t3R6clDT0X4TuPg5zV25i
	qXX1fySWDJRFSzr+RPP9BrcnccK38AGpSwo5K3WhEvOyV4U4piMvHxWAWbcAEOK/vg==
X-Received: by 2002:a05:6512:3f1d:b0:5b8:e4d0:9040 with SMTP id
 2adb3069b0e04-5bcde6bd1e9mr3313023e87.11.1791789058754; Mon, 12 Oct 2026
 00:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPZ+gd9d1P+xDSrxxZkGJr32zjubP=KfQegeGkWykKGvEH0=oA@mail.gmail.com>
In-Reply-To: <CAPZ+gd9d1P+xDSrxxZkGJr32zjubP=KfQegeGkWykKGvEH0=oA@mail.gmail.com>
From: =?UTF-8?B?6ZmI6ICA5piO?= <cc201008@gmail.com>
Date: Mon, 12 Oct 2026 15:10:46 +0800
X-Gm-Features: AclHuK9zqsCSqKaZL-No2oYZGnFlUiG1tvJRKnc3YYARIdJB75fdIO839OkOa6U
Message-ID: <CAPZ+gd8TPNnvEDOv_H=fdvy2ysG63uBD0MvmEMjhkMa8i-y1NA@mail.gmail.com>
Subject: [PATCH net] net: airoha: Keep UPDMEM egress MAC in sync for offloaded
 IPv6 flows
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_001101_262541_47E928D6 
X-CRM114-Status: GOOD (  13.99  )
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

PPE routed IPv6 FOE entries do not carry the egress source MAC inline;
they store an SMAC id and the hardware resolves the address through the
UPDMEM table, which airoha_ppe_init_upd_mem() only programs with the GDM
port own dev_addr at probe time.

The netdev the flow actually egresses can legally carry a different
address: on PON setups the authentication MAC belongs to the pon device
while each service VLAN routes with its own address, so offloaded IPv6
frames left the port with a stale source MAC and were silently dropped
upstream. IPv4 was unaffected since HNAPT entries embed the MAC inline,
which made the failure hard to diagnose: TCP handshake and TLS completed
over the slow path and the transfer stalled exactly when the flow got
offloaded.

Before writing smac_id for routed IPv6 entries, program the UPDMEM slot
with the source address of this flow.

airoha_set_macaddr() writes the same slot from the ndo_open and
ndo_set_mac_address paths: take flow_offload_mutex there too so the two
UPDMEM writers cannot interleave their two-step DATA/CTRL sequence and
leave a stale address behind.

Tested on a Nokia XG-040G-MD (AN7581, GPON WAN, PPPoE over a service
VLAN carrying its own MAC address): IPv6 HTTPS transfers went from
stalling at the 15 s curl cap with partial bytes to completing at line
rate with hardware offloading enabled, matching IPv4 throughput.

Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support")
Signed-off-by: Yaoming Chen <cc201008@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c  |  8 ++++++++
 drivers/net/ethernet/airoha/airoha_ppe.c | 13 +++++++++++++
 2 files changed, 21 insertions(+)

--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -138,7 +138,15 @@ airoha_set_macaddr(struct airoha_gdm_dev *dev,
  airoha_fe_wr(eth, REG_FE_MAC_LMIN(reg), lmin);
  airoha_fe_wr(eth, REG_FE_MAC_LMAX(reg), lmax);

+ /*
+ * Serialize with the flowtable offload path: both writers program the
+ * same UPDMEM slot with a two-step DATA/CTRL sequence and concurrent
+ * updates would interleave, leaving a stale source MAC under already
+ * bound IPv6 entries.
+ */
+ mutex_lock(&flow_offload_mutex);
  airoha_ppe_init_upd_mem(dev, addr);
+ mutex_unlock(&flow_offload_mutex);

  return 0;
 }

--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -414,6 +414,19 @@ airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
   dsa_port);

  smac_id = port->id;
+ /*
+ * Routed IPv6 entries resolve the egress source MAC
+ * through the UPDMEM table indexed by smac_id. The
+ * egress netdev can legally carry a different address
+ * than the GDM port itself: on PON setups the
+ * authentication MAC lives on the pon device while
+ * each service VLAN routes with its own address. Keep
+ * the table entry in sync with the source address this
+ * flow is actually going to use.
+ */
+ if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T)
+ airoha_ppe_init_upd_mem(dev,
+ data->eth.h_source);
  }
  }

