Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6E6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BztZ0cfqRt9dxay4EdRKv7PmLiYD1WDU1Ehk6gLPnTE=; b=tRK1MQ/gYiI2X5ySUId7HUvTwv
	1ZV7BQnJ4ZECZf2ZcCY1gpFfVhkyofbz7mAXY8WRJO2LV75hPmRUhuutaNaVGdiPe+D9vuik9ELFt
	jt2oAl6HgQa6eVbE7mK9B7s699EKTA/l47hrTKV2h7Mm2Ny798bOr2IAi0kbaI+ldj6SNbXhCu4KJ
	PepToNYA8tjjOUUDMz4LEJ4JBEEUex320q63ujVejTGaV6iRQw5SGAJ1jD903V4z1819+4wd4uG/R
	tjkf9wXbgcWytj3SYLJggd+2YNmqNCdcNCULlOzmDlJpB7eRsdWd20ZF50ARAz6FcxJmv75tUsnqp
	ZfTafq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5kA-000000045Xt-0iUV;
	Tue, 07 Jan 2025 09:19:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5XW-000000042cT-0nun;
	Tue, 07 Jan 2025 09:06:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso8454659a12.0;
        Tue, 07 Jan 2025 01:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736240777; x=1736845577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BztZ0cfqRt9dxay4EdRKv7PmLiYD1WDU1Ehk6gLPnTE=;
        b=Smn5jBAYIHm1mKfbi7RO7JeMlXoComv1GjsEYwYOGZNmf84MmHvAJPj3zMtOUptuuA
         X+/verSiNKjlNvHSJHDNUvhFClK6WBKH/7mfpCTuYzMqk70UlPk9V3VljMC6z8NYSBJU
         UwD1bs6T7qAZLwtdvx2/QrEKbsCbevFK4p6DoFw+nmT117zyt43XBy8mQqZpB6Wc1ZQW
         Lcs3aT2Y7cViwjWdecsALp6myXo2Y65abFioXm9sshaOfJTTZZpv9LHPp2r6j9cGAwjf
         dQQYX4Wf9kd1QzVmv1v00gpOmeCHZgYJzsEVnhf/P38bQBo6h6RFX8BmPNgBCPEiAXns
         YUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736240777; x=1736845577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BztZ0cfqRt9dxay4EdRKv7PmLiYD1WDU1Ehk6gLPnTE=;
        b=qD8MfzopGP7+8hdqDgeBvn7X2xPB2lIbHxPUf/DeE5B+KlvX93lycSxKE/7vbdC6MH
         C7uuaWE3/pjELXJc6BPA+W+Wj3HVhXNqmj1zHrsjpCNML1qCR4vdkvxzGVWZ+5dbuDCy
         bKOi1qt9S+Io8LT8FiEYTHprJaeMSIDu3sE9XuV5sZWox5Mnt7i5fLAy2SBartX8xMN1
         +a9gv4yOnHwqcKWghdc3wz/BwGgaja8m5ph8O2c4aaXk6w1cL9qgo32SgXhdSK3h5oa5
         XSwwaUjk3p80zK1JydvJQuNwzknY0Syd5Nmdz9s5nHmcD1qagryTt+9Ji2FqCnHKDzID
         GCHA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2bl+sJ6f66VgdXjR39qpAw2ZFSQed4KdWO/YD8tV4AY5RKFE2SWZ/BEDmGgVx7eLb1YvNZVCEURPejlaIr0=@lists.infradead.org, AJvYcCVeo39KrsMfTAEXteJ7U4ziUx6ZdqRNxgos2dIkJXP0ZOl4CM7SNSk0dpEGnANGcsECruNIZnyhTmeIxxeduLh7@lists.infradead.org
X-Gm-Message-State: AOJu0YzDLH8vgQ553Z8EeWrWldiTlzpB4JB/U1kHiNRCVy3SH+n0Bwzw
	UZvUR4scXf2IUoaviK44/0VNwo8BjjgzwfhwxHY2fOI6Bwi5vnUY
X-Gm-Gg: ASbGncu/g5qahEYmLcCUt4NG4cPve5ux8AJcPihmnF+QYf5+wLm20TszsDK+TbrC67V
	GJFP8uHH+tCqQhC5tkzC6B1+MSfUTW4guvcv/GFFB1e4SOtizmljylbWEAAr05i3uoIE53g7bp3
	/7BEzsLi4YFrBHTp/f59eqoRZWnt8hDCIvxPrq67FjJMhQkk2Ns98m977RCAdiKPU9FbFXedaxn
	a66SSd/9YKXgiiQvPWFvU7vEVVktG5hsd7b7swsB84NLztESHdiRuDDmS6eaINnbFX777Pnvsx5
	VnxXPhaC3cOW7NWzWYWMor0VmyTSKZib3vS/EjihPssJDfxr9pGpBVDR1547UiKg/OSM6el91A=
	=
X-Google-Smtp-Source: AGHT+IEMDL6I9+h+aUrnAuxFNluD15rn5fjLxiMza8iUCfO2DRYtl2bUPleLH8zIiEcHnLjnMReziQ==
X-Received: by 2002:a05:6402:5253:b0:5d0:aa2d:6eee with SMTP id 4fb4d7f45d1cf-5d81ddf7fb6mr57943041a12.26.1736240776693;
        Tue, 07 Jan 2025 01:06:16 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f3f9sm24005333a12.23.2025.01.07.01.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:06:16 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Ahern <dsahern@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v4 net-next 10/13] netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user port
Date: Tue,  7 Jan 2025 10:05:27 +0100
Message-ID: <20250107090530.5035-11-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090530.5035-1-ericwouds@gmail.com>
References: <20250107090530.5035-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_010618_230684_20141019 
X-CRM114-Status: GOOD (  11.25  )
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

The bitfield info->ingress_vlans and correcponding vlan encap are used for
a switchdev user port. However, they should not be set for a dsa user port.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index f7c2692ff3f2..387e5574c31f 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -117,6 +117,11 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				break;
 			if (path->type == DEV_PATH_DSA) {
 				i = stack->num_paths;
+				if (!info->num_encaps ||
+				    !(info->ingress_vlans & BIT(info->num_encaps - 1)))
+					break;
+				info->num_encaps--;
+				info->ingress_vlans &= ~BIT(info->num_encaps - 1);
 				break;
 			}
 			if (path->type == DEV_PATH_MTK_WDMA) {
-- 
2.47.1


