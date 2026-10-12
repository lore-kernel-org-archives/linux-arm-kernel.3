Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F43DCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkMm8aYcQbQqrMaSHF8neixFnN+L4NxB8QjkehNUjNw=; b=W9SqYvS8fATj1GCwrB6HdcxNvV
	aQ3ARLt2/2y6YXX8yO0RLdC2XLfEsBSDFZedjja3TADCmz0+U8ghCxJFcixa7jlbW3igIMtYqiftO
	UsgXLeEH0kIUkGLLjCyaY66YQ2ctNktYZIt+Xh+dlNgksnNWhSk/BysSk5KJdJLT/H80Lp3/2RpNF
	LeYCO/vXq0bPYmK/R+gsFlSJOhOQgxWBjdKnJ4YiieGpp7A4/3xWNrtN3eMusJ61SxNCLobqjchUm
	QzAsqMs7O96HfUH1q2MCnvymngt70uJ+ALzMByYjjPZC7EJ0qD1v6+3sd7WwVes7WVhBla7koTs9I
	vaqXTIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJWy-0000000B3sM-2kup;
	Mon, 12 Oct 2026 17:09:44 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJWw-0000000B3rv-2l4s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:09:43 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1444183e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791824980; cv=none;
        d=google.com; s=arc-20260327;
        b=sSCgGYri/25wOlkGNEOjxZj1wAH8P9MuFQpT4vMp2gRjEaHNT3FavEfnituuwiFfVd
         yZyG+I9X3ztpJsAmTZmdnd7hQzKZVlCWrBlxagvlPepHujC5SBPXlGkUBwyrY9qC3bw/
         fhti3JYX/z1FhWex09kPwPv7MJe7AJ2w7RgeS7U9nBr0CLAqlH382odPU90FYxqc8ULQ
         lhDOz2GaBIpTolRTyoQRBScs0T2a7v+TquYR0g+2CM7yJpKzYTgiJWI4+A7OkNtBVf3V
         EN9u0XELDAuxs1vjxW+IhXS10sNYZ+KI/Gejr1YS5JR6sUT+E8rh7wrDi3Hf4F2aJ8Kx
         WdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bkMm8aYcQbQqrMaSHF8neixFnN+L4NxB8QjkehNUjNw=;
        fh=dXt11I2eXlcy70WhCJwgJTopQQrPucL0fv5NUwbnbBc=;
        b=HcjCBjlpSKkWntlBHVbNyL+BlnE8c53fWLrVHX0+oCV2h4xp9uImwqHr1fDTFQUKSq
         W678/sVP1r75X2PzkM+w/T7LV0NWj2caeu16tlahBDYLgQQw35dL17hsOccFphw1v5MB
         IRNjtxDpTSnioLSPMsVIE/pyVIhM4eQPtg2hJvqNEMSNHomxcJ+bSuHJT5aAhvliX9k2
         f/YbS5BcxjIQ8DV4fjYP0c4Ya6IBm/21QkMZAmyQiglJJL6GA+fYgrvq6GcAVOWkJt31
         /wRsftEku+AmsSasHX78GP5G44i5FfUnBDcYZvJFUSyjrQtzEPL00PFdyqexoaE3fxty
         6TLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791824980; x=1792429780; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bkMm8aYcQbQqrMaSHF8neixFnN+L4NxB8QjkehNUjNw=;
        b=KchgtwJHhiGzUSzDha/gqxHjmkeLGDaV1FwrMqfPdR904wnlTETEJ3vFKKA6a7wST6
         We3S/7mmbhaXre+IoMNjBhe9Gap8jjNveosoDiKPyZp8e8mPfTC2FIHSvs7jvfhhYXnG
         5I2MysWxjmn2W2zImX+BFWrVl2u2jnxGcWXkXvQXxC7+l8mFTIWXoS9Rs1LRjaFqbTF4
         1WST9duSyEjaQWD3bpM+4oQYNQz/m7JDJv7BEgBoyq8d17D0nO86yK4CZdD0CpyAK1T4
         iUGiKLeCOYPt0P7JsaYMne4GsNru/9aFUlLrpeQmCqLtC4npWmdavcjQBRBpCWi+memy
         703Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824980; x=1792429780;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bkMm8aYcQbQqrMaSHF8neixFnN+L4NxB8QjkehNUjNw=;
        b=i9rOu4T9Jl+zFyfosJkpvOB3QBuIwjoBrkyaajYWxMpe6Cc9ye9n5l6bnfyBH8OgyJ
         azknLQCGNTtBGtzVI5ioH8tLsUaEz6iIN67RkPnDBZNMDbLJgmzkh3NRXn/Yt9J8sm85
         yhUd5Ck7Tv51rGpa0nqzlOdwS/Vq6Wn7XXM5jq3nAj+4oIaTjf9PhG6DMYTfENHXsNO7
         a3835SK4BICMe8sqZGJrdE4WkGmHl5nb3LXWVPWbmURUH8FhL6GrSKFnVpv32QNDQM7/
         UOWiLnWndbq1tyDmHe//fRb3eYZgGmqGYmKCI3LzpMZYTi8sAK0jgFCXEUWrbyFSx9GO
         STfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVuS9d+RdfKhLWQ0wv4j3+jxEjrhKWY0Sdg0jPI9yw9v954lDtp380m2e8BJvZnGhTw96ZaEGfef+d1BSyoA7d@lists.infradead.org
X-Gm-Message-State: AFq9FYJKwz1z7b1QjPDcapSzRtSquR12PsR+zh4609Sd3uZ+K66rn/hd
	QBZncXPr2bL62YxaoM+sxKh8hmExC5jZ7VlMS+U3CQlykLMrKN+8/1uh0SL7yGU+WTKcN2S+FnP
	KbGrTpoSpFKw1iR5WosDarDJihKw7kKM=
X-Gm-Gg: AYBFou3jNbNlPLn6MzcIYeWgBU9Bjo7+vR51qdfnJCque+D3P1PdUJoO/QSXKYHl9YT
	wHJpxGMawhcxX5t8WQjrkVaULCG7Lg/MpTgE9CsbSJtcmhekiiATH/QGQZDlyzoGqD2NzFgqkBm
	0OJ5l8EbvvlxClqcfxk3HijJiUdY/ObwlZ6DV1jV+Y2SGp1YQESAicfioCLElHaGL5/dgcyxEuk
	dEbpQK8SDcBoKLYX8Zx3nRQp8hG0Kp7KzpeO85IkrpDEBGxPDPa0+hNqGBz1Iql44MpEpyCq019
	s+XQTyJnIevYq2prSI6awlbbQQXjRgltu/vnhyTH5XZVyfyavGGWtcndHrhg1TlcUvZl1Hh1QZy
	sNOkYrxta3Y9p
X-Received: by 2002:a05:6512:12cf:b0:5bc:d0fd:8c13 with SMTP id
 2adb3069b0e04-5bcde6c99b0mr3418795e87.30.1791824979769; Mon, 12 Oct 2026
 10:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAPZ+gd9d1P+xDSrxxZkGJr32zjubP=KfQegeGkWykKGvEH0=oA@mail.gmail.com>
 <CAPZ+gd8TPNnvEDOv_H=fdvy2ysG63uBD0MvmEMjhkMa8i-y1NA@mail.gmail.com> <as0DO7n5SCr2j3Z2@lore-desk>
In-Reply-To: <as0DO7n5SCr2j3Z2@lore-desk>
From: =?UTF-8?B?6ZmI6ICA5piO?= <cc201008@gmail.com>
Date: Tue, 13 Oct 2026 01:09:26 +0800
X-Gm-Features: AclHuK-WJbTgomKmmJ6zTCF_Y4ETa2czq3ja0lgp2okGkARO_yROQyVwwAMJAx8
Message-ID: <CAPZ+gd_1JsNyhQbEAWiE1stom+T_jgvt4F2=tb68YoSvPCnFag@mail.gmail.com>
Subject: Re: [PATCH net] net: airoha: Keep UPDMEM egress MAC in sync for
 offloaded IPv6 flows
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, horms@kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_100942_719206_E39DDB6F 
X-CRM114-Status: GOOD (  12.70  )
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

Ooo,  the new patch should be a dedicated leaf lock inside
airoha_ppe_init_upd_mem().
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -416,6 +416,19 @@
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

@@ -1529,10 +1542,21 @@

 void airoha_ppe_init_upd_mem(struct airoha_gdm_dev *dev, const u8 *addr)
 {
+ static DEFINE_MUTEX(updmem_lock);
+
  struct airoha_gdm_port *port = dev->port;
  struct airoha_eth *eth = dev->eth;
  u32 val;

+ /*
+ * Routed IPv6 entries resolve the egress source MAC through the
+ * UPDMEM table indexed by smac_id; the ndo_open/ndo_set_mac_address
+ * writers hold flow_offload_mutex (QoS paths re-lock via
+ * airoha_set_macaddr()), so this lock also serializes the leaf
+ * against them.
+ */
+ mutex_lock(&updmem_lock);
+
  val = (addr[2] << 24) | (addr[3] << 16) | (addr[4] << 8) | addr[5];
  airoha_fe_wr(eth, REG_UPDMEM_DATA(0), val);
  airoha_fe_wr(eth, REG_UPDMEM_CTRL(0),
@@ -1545,6 +1569,8 @@
      FIELD_PREP(PPE_UPDMEM_ADDR_MASK, port->id) |
      FIELD_PREP(PPE_UPDMEM_OFFSET_MASK, 1) |
      PPE_UPDMEM_WR_MASK | PPE_UPDMEM_REQ_MASK);
+
+ mutex_unlock(&updmem_lock);
 }

 struct airoha_ppe_dev *airoha_ppe_get_dev(struct device *dev)

