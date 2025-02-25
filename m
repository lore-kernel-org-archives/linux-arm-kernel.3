Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401B5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVAkTZii1Gy4XRugZsnKaWDIV+1UdUIxS1E1wVQkwnU=; b=Fs2OPpJxYmqzxJl5nM5cJY98oB
	uQoHOzXs20956TzptKTETNRMLTmCjYsQ6MsJFBwbPfmXGPuBPML8A5alywuMh3fIyLCDkXmAx+TQy
	dLwp6wo88bq7Ryu5c7EBRfh8ySeGBy5BVa1Z2GYheAuxGX/WUMSCqPzLug35Ue37K13w83lvvhYSS
	IPT9R3/Pl7Ebo7/iIabzkF+Yhngnf11R2KXPRlnGAMzgytBMkkPOxUOwpXfQetFY9yXkRAyXXWWBP
	kjCWF9h8yW6x3xNhiBDFXQf/1pZiA5RMwxVGDDzYWOAm8egUjevqH6BOYrJ0BlJr8D/98b1Fn8ZxB
	SL71QYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn22Z-00000001SRN-4BB2;
	Tue, 25 Feb 2025 21:00:31 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1M8-00000001KhL-06t4;
	Tue, 25 Feb 2025 20:16:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-abba1b74586so882284966b.2;
        Tue, 25 Feb 2025 12:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514598; x=1741119398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVAkTZii1Gy4XRugZsnKaWDIV+1UdUIxS1E1wVQkwnU=;
        b=PqE4Ce+f3hqVXxsLNle2n5BK2Z/3lK+QA3gPDtBseVQGsbFG1vssYFEKKchALqTXGO
         MrLTerJKBtr5n83IX22Q2PnXhy3U6QGkQe3ULPV4BuR9XnNsOslO1WiDa/oKl1cWMC3p
         Z9eOcPaxclKGkekkgTDXaLPvOTDmfxw1f83DDuetsp12d4RIhli1lL5xwxjAgOhpYtiM
         64God9GKZI6a2YKKhqQjkfHLW/8paq4G5brLE4Nht1vz02uknEjOL2AlS2q5Q9o6g2KW
         PbUy7hZENw6N4eK6rmfQZA5CNWjP7u9eVmMZ2MWKDEDut8iD4KmYrBVIq/XKLVLih53P
         HHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514598; x=1741119398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVAkTZii1Gy4XRugZsnKaWDIV+1UdUIxS1E1wVQkwnU=;
        b=Q7l9B7Xvcom23Z9AqZOJ9WD/dfh6uCwNWWkBY4dV/+Lp/ErD34pbCJP9PpKNhgtjOt
         iiNkHgzX+OglvBgkOzIm3JuMs0y6/I2pJGP5E95tGPlc411Uo5Y41xUejxRvkDOpn4O/
         TC42NMAvFASoRkRcBw+oMeLEoCTcDq8BwvpYYQqCQiWZrvaG9AMTmW2bKZQuYo+VMV2d
         ALi0RzklmpojaUVUcRyb7OGOi8+rlbgIORcAM1wj8MV3RgLI6mO865GZ5uBJh9qNiL+2
         RbUGlawO4cYSe31yiY61xaLUWuYvmg+xUtm2Z8zjuf3YX/4p7+eT1POGXdw0/07mozcN
         apTw==
X-Forwarded-Encrypted: i=1; AJvYcCUuP4TgdCwgo6/4WQwrwa6iliGNHDJZwy7KCpM1IW13osK00bAAOajVgfuNTtfzSeeH29ScmZOkxrMQQu9Xh6DM@lists.infradead.org, AJvYcCWyymLk3s6ZyG3aS61Mc0lP5pGXzp/RqPH5r7/69YXwhR+sD5TQBiObGZi7UNQMySv9r7GjJeC3cNKtM7rXloE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrjOn3isZ/dobDUtHhIC1FnxSdN+Yp39FIimxxSy2Vt7ZRP+X/
	Q7YM3dRm3q/EwN6t0A0In4t4fIBHgG4xuQQMaCLj4kUyl4rK70Rp
X-Gm-Gg: ASbGncvuXoW1vNbpCT1ZUR7DRACKe/mzw8toklO9azMHxRpkDdcaimSiuNeKCPSpLej
	ujtyaMJLgwHhwGKG5vdeyrcSy30LcQrTAggF6WbybGrbONBlesv+hTFV0rEvq0+ExtyIxBKpVLQ
	ZYhgOFjzCrcn29jwNLz17VcBKeQk06p1dZnPXe2rGNrPAbMP6S4zlnT+GOA46sjkrYSSBvFVK+0
	zzyd9z8exvMGKc72ozgXGKOpEELfM4x7pkn6OYg9a8+57WRpGITdwoIj/EgY+Ojb5I9vAP8wa3R
	PDDSAkBnQx56fmA5JH4E0Wqe89yIogq3HLTEmiW92m0QEfkj7KD7OiJVpXkuU6ToIVfWUhQ9TnO
	dNPUrUQA83b7ddCwTbypQc9JUlAlIj0BGhHNwq7Z8J3c=
X-Google-Smtp-Source: AGHT+IFK/xb0AH8q2XIcdgGFCG2/1S/vlx3qUjtu2T+2XCeJrxRROpGepkKKWsPoi8GIWtQoo7ZUrw==
X-Received: by 2002:a17:906:a952:b0:abe:eebf:ae54 with SMTP id a640c23a62f3a-abeeebfc352mr51844866b.20.1740514598236;
        Tue, 25 Feb 2025 12:16:38 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:37 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Subject: [PATCH v7 net-next 11/14] netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user port
Date: Tue, 25 Feb 2025 21:16:13 +0100
Message-ID: <20250225201616.21114-12-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121640_061148_7FCE145D 
X-CRM114-Status: GOOD (  11.47  )
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

The bitfield info->ingress_vlans and corresponding vlan encap are used for
a switchdev user port. However, they should not be set for a dsa user port.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index b9e6d9e6df66..c95fad495460 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -116,6 +116,11 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
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


